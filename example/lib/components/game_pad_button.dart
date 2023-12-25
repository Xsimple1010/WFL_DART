import 'package:flutter/material.dart';
import 'package:wfl_dart/events/on_game_pad_connect.dart';
import 'package:wfl_dart_example/page/game_pad.dart';

class GamePadButtonIcon extends StatelessWidget {
  const GamePadButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return WFLOnGamePadConnect(
      builder: (context, gamePad, child) => IconButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              fullscreenDialog: true,
              builder: (context) => const GamePadModal(),
            ),
          );
        },
        color: gamePad.id >= 0 ? Colors.indigo : Colors.white,
        icon: const Icon(
          Icons.sports_esports_rounded,
        ),
      ),
    );
  }
}
