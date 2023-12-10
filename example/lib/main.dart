import 'package:flutter/material.dart';
import 'dart:async';

import 'package:wfl_dart/wfl_dart.dart';

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
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WFL_DART'),
        ),
        body: ElevatedButton(
          onPressed: () {
            wfl.loadCore("C:/RetroArch-Win64/cores/bsnes_libretro.dll");
            wfl.loadGame("C:/RetroArch-Win64/roms/Mega Man X (USA).sfc");
          },
          child: Text("iniciar"),
        ),
      ),
    );
  }
}
