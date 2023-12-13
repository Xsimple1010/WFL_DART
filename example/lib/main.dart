import 'package:flutter/material.dart';
import 'dart:io';

import 'package:wfl_dart/wfl_dart.dart';
import 'package:wfl_dart_example/components/coreList.dart';
import 'package:wfl_dart_example/tools/file.dart';
import 'components/gamelist.dart';

WFL wfl = WFL();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final rootDir = Directory("C:\\WFL");
  late List<FileSystemEntity> cores;
  late List<FileSystemEntity> roms;
  late String coreSelected = "";

  @override
  void initState() {
    super.initState();

    if (rootDir.existsSync()) {
      rootDir.create(recursive: true);
    }

    getCores();
    getGames();
  }

  getCores() async {
    final coreDir = Directory("${rootDir.path}\\cores");

    if (!coreDir.existsSync()) coreDir.createSync();

    cores = coreDir.listSync();
  }

  getGames() async {
    final romsDir = Directory("${rootDir.path}\\roms");

    if (!romsDir.existsSync()) romsDir.createSync();

    roms = romsDir.listSync();
  }

  onCoreChange(String path) {
    coreSelected = path;
  }

  onRomSelected(String path) {
    if (coreSelected.isEmpty) return;

    wfl.loadCore(coreSelected);
    wfl.loadGame(path);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WFL_DART'),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 3,
              child: GameList(games: roms, onClick: onRomSelected),
            ),
            Expanded(
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("Nucleos Disponiveis"),
                          Text("(${cores.length})"),
                        ],
                      ),
                      Expanded(
                        child: CoreList(cores: cores, onClick: onCoreChange),
                      ),
                    ],
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
