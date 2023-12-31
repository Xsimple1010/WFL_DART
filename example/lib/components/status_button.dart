import 'package:flutter/material.dart';
import 'package:wfl_dart/wfl_dart.dart';

class GameStatusButtonIcon extends StatelessWidget {
  const GameStatusButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final wfl = WFLDart.of(context);
    return WFLOnGameStatusChange(
      builder: (context, status, child) => IconButton(
        onPressed: () {
          if (!status.running) return;

          if (status.pause) {
            wfl.resume();
          } else {
            wfl.pause();
          }
        },
        color: status.playing ? Colors.cyan : Colors.white,
        isSelected: status.playing,
        icon: Icon(
          status.pause ? Icons.play_arrow : Icons.pause,
        ),
      ),
    );
  }
}
