import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:wfl_dart/models/wfl_events.dart';
import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart/wfl.dart';
import 'package:wfl_dart/wfl_dart_bindings_generated.dart';

class WFLDart with ChangeNotifier {
  final _wfl = WFL();
  JoyStick lastConnectedJoyStick = JoyStick(id: -1, index: -1, name: "");
  JoyStick lastDisConnectedJoyStick = JoyStick(id: -1, index: -1, name: "");
  String coreSelected = "";
  String romSelected = "";
  bool isPlaying = false;
  bool isPaused = true;

  init() {
    final events = WFLDartEvents(
      onConnect: _onConnect,
      onDisconnect: _onDisconnect,
      onGameStart: _onGameStart,
      onGameClose: _onGameClose,
    );

    _wfl.init(events);
  }

  void _onConnect(wfl_joystick joystick) {
    lastConnectedJoyStick = JoyStick(
      id: joystick.id,
      index: joystick.index,
      name: joystick.name.toDartString(),
    );

    print(lastConnectedJoyStick.name);

    notifyListeners();
  }

  void _onDisconnect(wfl_joystick joystick, int port) {
    lastDisConnectedJoyStick = JoyStick(
      id: joystick.id,
      index: joystick.index,
      name: joystick.name.toDartString(),
    );
    notifyListeners();
  }

  void _onGameStart() {
    isPlaying = true;
    isPaused = false;
    notifyListeners();
  }

  void _onGameClose() {
    isPlaying = false;
    isPaused = true;
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
    isPaused = false;
    notifyListeners();
  }

  pause() {
    _wfl.pause();
    isPaused = true;
    notifyListeners();
  }

  resume() {
    _wfl.resume();
    isPaused = false;
    notifyListeners();
  }

  void deInit() {
    _wfl.deInit();
  }
}
