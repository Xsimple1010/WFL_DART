import 'package:flutter/material.dart';
import 'package:wfl_dart/events/on_game_pad_connect.dart';

class GamePadButtonIcon extends StatelessWidget {
  const GamePadButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return WFLOnGamePadConnect(
      builder: (context, gamePad, child) => IconButton(
        onPressed: () {
          print(gamePad.id);
        },
        color: gamePad.id >= 0 ? Colors.indigo : Colors.white,
        icon: const Icon(
          Icons.sports_esports_rounded,
        ),
      ),
    );
  }
}
