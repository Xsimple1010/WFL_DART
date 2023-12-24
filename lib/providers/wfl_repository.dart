import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:flutter/material.dart';
import 'package:wfl_dart/models/states.dart';
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
