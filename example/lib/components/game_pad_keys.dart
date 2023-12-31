import 'package:flutter/material.dart';
import 'package:wfl_dart/wfl_dart.dart';

class GamePadKeysSelect extends StatefulWidget {
  const GamePadKeysSelect({super.key});

  @override
  State<GamePadKeysSelect> createState() => _GamePadKeysSelectState();
}

class _GamePadKeysSelectState extends State<GamePadKeysSelect> {
  @override
  Widget build(BuildContext context) {
    final wfl = WFLDart.of(context);

    return Padding(
      padding: const EdgeInsets.all(20),
      child: ListView(
        children: [
          const Text(
            "Você esta trocando o valor B",
            style: TextStyle(
              fontSize: 25,
            ),
          ),
          const Text("aperte o botão desejado para atribuir o novo valor!"),
          FutureBuilder(
            future: wfl.getKeyPressFuture(const Duration(seconds: 5)),
            builder: (context, bt) => Container(child: Text("me  ${bt.data}")),
          )
        ],
      ),
    );
  }
}
