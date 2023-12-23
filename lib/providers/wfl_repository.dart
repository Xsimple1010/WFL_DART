import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wfl_dart/wfl_dart.dart';

class WFL with ChangeNotifier {
  final _wflDart = WFLDart();
  String coreSelected = "";
  String romSelected = "";

  init() {
    final events = WFLEvents(
      onConnect: _onConnect,
      onDisconnect: _onDisconnect,
      onGameStart: _onGameStart,
      onGameClose: _onGameClose,
    );

    _wflDart.init(events);
  }

  void _onConnect() {
    print("connected");
    notifyListeners();
  }

  void _onDisconnect() {
    print("disconnected");
    notifyListeners();
  }

  void _onGameStart() {
    print("gameStart");
    notifyListeners();
  }

  void _onGameClose() {
    print("gameClose");
    notifyListeners();
  }

  String getCoreLoaded() {
    return coreSelected;
  }

  String getRomLoaded() {
    return romSelected;
  }

  selectCore(FileSystemEntity core) {
    coreSelected = core.path;
    notifyListeners();
  }

  loadGame(FileSystemEntity rom) {
    if (coreSelected.isEmpty) return;

    romSelected = rom.path;

    _wflDart.loadCore(coreSelected);
    _wflDart.loadGame(rom.path);
    notifyListeners();
  }

  void deInit() {
    _wflDart.deInit();
  }
}
