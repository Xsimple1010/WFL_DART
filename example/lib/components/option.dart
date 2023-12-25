import 'package:flutter/material.dart';

class OptionContainer extends StatelessWidget {
  const OptionContainer({
    super.key,
    required this.title,
    required this.label,
    required this.onClick,
  });

  final String title;
  final String label;
  final Function onClick;

  @override
  Widget build(BuildContext context) {
    // final theme = Theme.of(context);

    return Container(
      height: 70,
      padding: const EdgeInsets.only(left: 20),
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
        ],
      ),
    );
  }
}
