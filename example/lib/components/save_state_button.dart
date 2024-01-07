import 'package:flutter/material.dart';
import 'package:wfl_dart/wfl_dart.dart';

class SaveButtonIcon extends StatelessWidget {
  const SaveButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final wfl = WFLDart.of(context);
    return WFLOnGameStatusChange(
      builder: (context, status, child) => IconButton(
        onPressed: () {
          if (!status.playing) return;
          wfl.save();
        },
        color: status.playing ? Colors.cyan : Colors.white,
        isSelected: status.playing,
        icon: const Icon(
          Icons.save_as,
        ),
      ),
    );
  }
}
