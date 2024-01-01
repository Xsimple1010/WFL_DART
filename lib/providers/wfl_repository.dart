import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:wfl_dart/models/states.dart';
import 'package:wfl_dart/models/wfl_events.dart';
import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart/tools/make_game_pad.dart';
import 'package:wfl_dart/tools/make_device_list.dart';
import 'package:wfl_dart/wfl.dart';
import 'package:wfl_dart/wfl_dart_bindings_generated.dart';
import "package:provider/provider.dart";

class WFLDart with ChangeNotifier {
  final _wfl = WFL();
  Device lastDisConnectedDevice = Device.getEmpty();
  List<Device> devicesAvailable = [];
  List<GamePad> gamePadsConnected = [];
  GamePad gamepadSelectedToEdit = GamePad.getEmpty();
  String coreSelected = "";
  String romSelected = "";
  WflStates states = WflStates(
    running: false,
    playing: false,
    pause: false,
  );

  init() {
    final events = WFLDartEvents(
      onConnect: _onConnect,
      onDisconnect: _onDisconnect,
      onGameStart: _onGameStart,
      onGameClose: _onGameClose,
      onStateChange: _onStateChange,
    );

    _wfl.init(events);
  }

  void _onConnect(wfl_device device) {
    getAllDevices();
    notifyListeners();
  }

  void _onDisconnect(wfl_device device, int port) {
    lastDisConnectedDevice = MakeDevice.toDart(device);
    notifyListeners();
  }

  void _onStateChange(wfl_status status) {
    states = WflStates(
      running: status.running,
      playing: status.playing,
      pause: status.pause,
    );

    notifyListeners();
  }

  void _onGameStart() {
    // notifyListeners();
  }

  void _onGameClose() {
    // notifyListeners();
  }

  selectCore(FileSystemEntity core) {
    coreSelected = core.path;
    notifyListeners();
  }

  loadGame(FileSystemEntity rom) {
    if (coreSelected.isEmpty) return;

    romSelected = rom.path;

    _wfl.loadCore(coreSelected);
    _wfl.loadGame(rom.path);
  }

  setGamePad(GamePad gamePad) {
    final mkDevice = MakeGamePad();

    _wfl.setController(mkDevice.toNative(gamePad).ref);

    getAllDevices();

    mkDevice.close();
  }

  setSelectGamepadToEdit(GamePad gamepad) {
    gamepadSelectedToEdit = gamepad;
    notifyListeners();
  }

  pause() {
    _wfl.pause();
    notifyListeners();
  }

  resume() {
    _wfl.resume();
    notifyListeners();
  }

  stop() {
    _wfl.stop();
  }

  Future<int> getKeyPressFuture(Duration timeout) async {
    ReceivePort keyPress = ReceivePort();
    Isolate.spawn(getKeyPressIsolate, keyPress.sendPort).timeout(timeout);

    final result = await Future.wait([keyPress.first]).timeout(timeout);

    keyPress.close();

    return result.first;
  }

  static getKeyPressIsolate(SendPort port) {
    final wfl = WFL();

    final bt = wfl.getKeyDown();

    port.send(bt);

    Isolate.current.kill();
  }

  List<Device> getAllDevices() {
    wfl_dart_get_all_gamePads res = _wfl.getAllGamePads();

    devicesAvailable = MakeDevice.toDartList(res);

    notifyListeners();

    return devicesAvailable;
  }

  List<GamePad> getGamePads() {
    final nativeGamePads = _wfl.getConnectedGamePad();

    gamePadsConnected = MakeGamePad().toDartList(nativeGamePads);

    notifyListeners();

    return gamePadsConnected;
  }

  GamePad getGamePadByDeviceId(int id) {
    getGamePads();
    getAllDevices();

    late GamePad gamepad;

    try {
      gamepad = gamePadsConnected.firstWhere((gamepad) => gamepad.id == id);
    } catch (_) {
      final deviceIterable =
          devicesAvailable.where((device) => device.id == id);

      gamepad = MakeGamePad().fromDevice(
        deviceIterable.first,
        RETRO_DEVICE_JOYPAD,
        0,
        GamePadNativeInfo(
          type: WFL_DEVICE_TYPES.WFL_DEVICE_JOYSTICK,
        ),
      );
    }

    return gamepad;
  }

  void deInit() {
    _wfl.deInit();
  }

  static WFLDart of(BuildContext context) {
    return Provider.of<WFLDart>(context);
  }
}
