import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wfl_dart/models/wfl_events.dart';
import 'package:wfl_dart/wfl.dart';

class WFLDart with ChangeNotifier {
  final _wfl = WFL();
  String coreSelected = "";
  String romSelected = "";
  bool isPlaying = false;

  init() {
    final events = WFLDartEvents(
      onConnect: _onConnect,
      onDisconnect: _onDisconnect,
      onGameStart: _onGameStart,
      onGameClose: _onGameClose,
    );

    _wfl.init(events);
  }

  void _onConnect() {
    print("connected");
    notifyListeners();
  }

  void _onDisconnect(int id, int port) {
    print("disconnected");
    notifyListeners();
  }

  void _onGameStart() {
    print("gameStart");
    isPlaying = true;
    notifyListeners();
  }

  void _onGameClose() {
    print("gameClose");
    isPlaying = false;
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

  void deInit() {
    _wfl.deInit();
  }
}
