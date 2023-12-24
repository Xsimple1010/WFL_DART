import 'package:flutter/material.dart';
import 'package:wfl_dart/wfl_dart.dart';
import 'package:wfl_dart_example/components/about_button.dart';
import 'package:wfl_dart_example/components/game_pad_button.dart';
import 'package:wfl_dart_example/components/reset_button.dart';
import 'package:wfl_dart_example/components/status_button.dart';
import 'package:wfl_dart_example/home.dart';

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
    return WFLChangeNotifier(
      wfl: wfl,
      child: MaterialApp(
        darkTheme: ThemeData.dark(),
        home: Scaffold(
          appBar: AppBar(
            title: const Text('WFL_DART DEMO'),
            actions: const [
              GameStatusButtonIcon(),
              ResetButtonIcon(),
              GamePadButtonIcon(),
              AboutButton()
            ],
          ),
          body: const Home(),
        ),
      ),
    );
  }
}
