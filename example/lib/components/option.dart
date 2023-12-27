import 'package:flutter/material.dart';
import 'package:wfl_dart_example/components/game_pad_keys.dart';

class OptionContainer extends StatelessWidget {
  const OptionContainer({
    super.key,
    required this.title,
    required this.label,
    required this.action,
  });

  final String title;
  final String label;
  final Widget action;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    return GestureDetector(
      onDoubleTap: () {
        showModalBottomSheet(
          context: context,
          builder: (context) => const GamePadKeysSelect(),
        );
      },
      child: Container(
        height: 70,
        padding: const EdgeInsets.only(left: 20, right: 12),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                Text(label),
              ],
            ),
            // Icon(Icons.gamepad),
            // const Text("Botão selecionado A")
            // action
          ],
        ),
      ),
    );
  }
}
