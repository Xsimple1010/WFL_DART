import 'package:flutter/material.dart';

import 'package:wfl_dart/wfl_dart.dart';
import 'package:wfl_dart_example/components/coreList.dart';
import 'components/gamelist.dart';

WFL wfl = WFL();
WFLDirectoryManager wflDirManger = WFLDirectoryManager();

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  late String coreSelected = "";

  @override
  void initState() {
    super.initState();
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
          title: const Text('WFL_DART DEMO'),
        ),
        body: Row(
          children: [
            Expanded(
              flex: 3,
              child: GameList(games: wflDirManger.roms, onClick: onRomSelected),
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
                          Text("(${wflDirManger.cores.length})"),
                        ],
                      ),
                      Expanded(
                        child: CoreList(
                            cores: wflDirManger.cores, onClick: onCoreChange),
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
