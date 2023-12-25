import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:wfl_dart/models/states.dart';
import 'package:wfl_dart/models/wfl_events.dart';
import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart/tools/make_controller_device.dart';
import 'package:wfl_dart/wfl.dart';
import 'package:wfl_dart/wfl_dart_bindings_generated.dart';

class WFLDart with ChangeNotifier {
  final _wfl = WFL();
  JoyStick lastConnectedJoyStick = JoyStick(id: -1, index: -1, name: "");
  JoyStick lastDisConnectedJoyStick = JoyStick(id: -1, index: -1, name: "");
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

  void _onConnect(wfl_joystick joystick) {
    lastConnectedJoyStick = JoyStick(
      id: joystick.id,
      index: joystick.index,
      name: joystick.name.toDartString(),
    );

    GamePad gamePad = GamePad(
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

  void _onDisconnect(wfl_joystick joystick, int port) {
    lastDisConnectedJoyStick = JoyStick(
      id: joystick.id,
      index: joystick.index,
      name: joystick.name.toDartString(),
    );
    print(lastConnectedJoyStick.name);
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
    notifyListeners();
  }

  void _onGameClose() {
    notifyListeners();
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
    notifyListeners();
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

  void deInit() {
    _wfl.deInit();
  }
}
