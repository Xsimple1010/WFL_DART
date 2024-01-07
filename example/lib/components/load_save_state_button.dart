import 'package:flutter/material.dart';
import 'package:wfl_dart/wfl_dart.dart';

class LoadSaveButtonIcon extends StatelessWidget {
  const LoadSaveButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final wfl = WFLDart.of(context);
    return WFLOnGameStatusChange(
      builder: (context, status, child) => IconButton(
        onPressed: () {
          if (!status.playing) return;
          wfl.loadSaveState();
        },
        color: status.playing ? Colors.cyan : Colors.white,
        isSelected: status.playing,
        icon: const Icon(
          Icons.save,
        ),
      ),
    );
  }
}
