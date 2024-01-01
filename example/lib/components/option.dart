import 'package:flutter/material.dart';

class OptionContainer extends StatelessWidget {
  const OptionContainer({
    super.key,
    required this.title,
    required this.label,
  });

  final String title;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          // showModalBottomSheet(
          //   context: context,
          //   builder: (context) => const GamePadKeysSelectModal(),
          // );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12), // borda arredondada
          ),
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
        ),
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
          ],
        ),
      ),
    );
  }
}
