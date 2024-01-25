import 'package:flutter/material.dart';
import 'package:wfl_dart/wfl_dart.dart';
import 'package:wfl_dart_example/components/about_button.dart';
import 'package:wfl_dart_example/components/game_pad_button.dart';
import 'package:wfl_dart_example/components/load_save_state_button.dart';
import 'package:wfl_dart_example/components/reset_button.dart';
import 'package:wfl_dart_example/components/save_state_button.dart';
import 'package:wfl_dart_example/components/status_button.dart';
import 'package:wfl_dart_example/components/stop_button.dart';
import 'package:wfl_dart_example/page/home.dart';

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
            actions: [
              WFLOnGameStatusChange(
                builder: (context, value, child) => Visibility(
                  visible: value.playing,
                  child: const Row(
                    children: [
                      GameStatusButtonIcon(),
                      ResetButtonIcon(),
                      SaveButtonIcon(),
                      LoadSaveButtonIcon(),
                      StopButtonIcon()
                    ],
                  ),
                ),
              ),
              const GamePadButtonIcon(),
              const AboutButton(),
            ],
          ),
          body: Home(),
        ),
      ),
    );
  }
}
