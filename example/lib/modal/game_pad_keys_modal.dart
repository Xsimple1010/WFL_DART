import 'package:flutter/material.dart';
import 'package:wfl_dart/models/key_maps.dart';
import 'package:wfl_dart/wfl_dart.dart';

class GamePadKeysSelectModal extends StatefulWidget {
  const GamePadKeysSelectModal({super.key, required this.onGetKey});

  final Function(int key) onGetKey;

  @override
  State<GamePadKeysSelectModal> createState() => _GamePadKeysSelectState();
}

class _GamePadKeysSelectState extends State<GamePadKeysSelectModal> {
  @override
  Widget build(BuildContext context) {
    final wfl = WFLDart.of(context);
    final theme = Theme.of(context);

    return LayoutBuilder(
      builder: (context, constraints) => Container(
        padding: const EdgeInsets.all(20),
        width: constraints.maxWidth,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                Text(
                  "Você esta trocando o valor B",
                  style: TextStyle(
                    fontSize: constraints.maxWidth * .05,
                  ),
                ),
                Text(
                  "aperte o botão desejado para atribuir o novo valor!",
                  style: TextStyle(
                    fontSize: constraints.maxWidth * .02,
                  ),
                ),
              ],
            ),
            FutureBuilder(
              future: wfl.getKeyPressFuture(const Duration(seconds: 5)),
              builder: (context, bt) => Column(
                children: [
                  Container(
                    alignment: Alignment.center,
                    height: constraints.maxWidth * .26,
                    width: constraints.maxWidth * .26,
                    decoration: BoxDecoration(
                      color: theme.focusColor,
                      shape: BoxShape.circle,
                    ),
                    child: Text(
                      bt.data != null
                          ? WFLGetKeyNames.gamepadNativeKeyName(bt.data ?? 0)
                          : "?",
                      style: TextStyle(fontSize: constraints.maxWidth * .04),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        child: const Text(
                          "Cancelar",
                        ),
                      ),
                      FilledButton(
                        onPressed: () {
                          widget.onGetKey(
                            bt.data ?? WFLGamePadNativeButton.INVALID,
                          );
                        },
                        child: const Text("Salva"),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
