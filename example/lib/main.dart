import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wfl_dart/wfl_dart.dart';
import 'package:wfl_dart_example/home.dart';

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
  final wfl = WFLDart();

  @override
  void initState() {
    super.initState();

    wfl.init();
  }

  @override
  void dispose() {
    super.dispose();
    wfl.deInit();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      darkTheme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('WFL_DART DEMO'),
        ),
        body: WFLChangeNotifier(
          wfl: wfl,
          child: const Home(),
        ),
      ),
    );
  }
}
