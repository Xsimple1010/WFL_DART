import 'package:flutter/material.dart';
import 'package:wfl_dart/wfl_dart.dart';
import 'package:provider/provider.dart';

class GameStatusButtonIcon extends StatelessWidget {
  const GameStatusButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final wfl = Provider.of<WFLDart>(context);
    return WFLOnGameStatusChange(
      builder: (context, status, child) => IconButton(
        onPressed: () {
          if (!status.item1) return;

          if (status.item2) {
            wfl.resume();
          } else {
            wfl.pause();
          }
        },
        color: status.item1 ? Colors.cyan : Colors.white,
        isSelected: status.item1,
        icon: Icon(
          status.item2 ? Icons.play_arrow : Icons.pause,
        ),
      ),
    );
  }
}
