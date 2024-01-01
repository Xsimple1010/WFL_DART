import 'package:flutter/material.dart';
import 'package:wfl_dart/models/key_maps.dart';
import 'package:wfl_dart/wfl_dart.dart';
import 'package:wfl_dart_example/modal/game_pad_keys_modal.dart';

class GamePadKeySelect extends StatelessWidget {
  const GamePadKeySelect({
    super.key,
    required this.keyMap,
    required this.onTap,
  });

  final GamePadKeyMap keyMap;
  final Function(GamePadKeyMap) onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
      child: ElevatedButton(
        onPressed: () {
          showModalBottomSheet(
            context: context,
            builder: (context) => GamePadKeysSelectModal(
              onGetKey: (key) {
                keyMap.native = key;
                onTap(keyMap);
              },
            ),
          );
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
                  "Butão ${WFLGetKeyNames.gamepadRetroKeyName(
                    keyMap.retro,
                  )}",
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
                const Text("Aperte para altera"),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  WFLGetKeyNames.gamepadNativeKeyName(keyMap.native),
                  style: const TextStyle(
                    fontSize: 18,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
