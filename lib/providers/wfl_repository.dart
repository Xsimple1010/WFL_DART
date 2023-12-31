import 'dart:ffi';
import 'dart:io';
import 'dart:isolate';
import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:wfl_dart/models/states.dart';
import 'package:wfl_dart/models/wfl_events.dart';
import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart/tools/make_controller_device.dart';
import 'package:wfl_dart/tools/make_joystick.dart';
import 'package:wfl_dart/wfl.dart';
import 'package:wfl_dart/wfl_dart_bindings_generated.dart';
import "package:provider/provider.dart";

class WFLDart with ChangeNotifier {
  final _wfl = WFL();
  Device lastConnectedJoyStick = Device(
    id: -1,
    index: -1,
    connected: false,
    name: "",
  );
  Device lastDisConnectedJoyStick = Device(
    id: -1,
    index: -1,
    connected: false,
    name: "",
  );
  late List<Device> devicesAvailable = [];
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
    lastConnectedJoyStick = Device(
      id: device.id,
      index: device.index,
      name: device.name.toDartString(),
      connected: device.connected,
    );

    final gamePad = GamePad(
      id: lastConnectedJoyStick.id,
      index: lastConnectedJoyStick.index,
      port: 0,
      type: RETRO_DEVICE_JOYPAD,
      name: lastConnectedJoyStick.name,
      nativeInfo: GamePadNativeInfo(
        type: WFL_DEVICE_TYPES.WFL_DEVICE_JOYSTICK,
      ),
    );

    setGamePad(gamePad);

    notifyListeners();
  }

  void _onDisconnect(wfl_device device, int port) {
    lastDisConnectedJoyStick = Device(
      id: device.id,
      index: device.index,
      name: device.name.toDartString(),
      connected: device.connected,
    );
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
    final mkDevice = MakeDeviceController();

    _wfl.setController(mkDevice.get(gamePad).ref);

    mkDevice.close();
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

  findController() {
    wfl_dart_get_all_gamePads res = _wfl.getAllGamePads();

    final makeDeviceList = MakeDeviceList();

    devicesAvailable = makeDeviceList.get(res);

    notifyListeners();
  }

  void deInit() {
    _wfl.deInit();
  }

  static of(BuildContext context) {
    return Provider.of<WFLDart>(context);
  }
}
