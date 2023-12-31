import 'package:flutter/material.dart';
import 'package:wfl_dart/wfl_dart.dart';

class ResetButtonIcon extends StatelessWidget {
  const ResetButtonIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final wfl = WFLDart.of(context);
    return WFLOnGameStatusChange(
      builder: (context, status, child) => IconButton(
        onPressed: () {
          wfl.stop();
        },
        color: status.playing ? Colors.cyan : Colors.white,
        isSelected: status.running,
        icon: const Icon(
          Icons.refresh_outlined,
        ),
      ),
    );
  }
}
