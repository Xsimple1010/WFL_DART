import 'dart:developer' as developer;
import 'package:flutter/material.dart';
import 'package:wfl_dart/wfl_dart.dart';
import 'package:wfl_dart_example/components/game_pad_card.dart';
import 'package:wfl_dart_example/components/game_pad_key_maps.dart';
import 'package:wfl_dart_example/components/option.dart';

class GamePadModal extends StatefulWidget {
  const GamePadModal({super.key});

  @override
  State<GamePadModal> createState() => _GamePadModalState();
}

class _GamePadModalState extends State<GamePadModal> {
  @override
  Widget build(BuildContext context) {
    final wfl = WFLDart.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Configurações de GamePad")),
      body: LayoutBuilder(
        builder: (context, constraints) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            WFLOnGamePadSelectedToEdit(
              builder: (context, gamepad, child) => SizedBox(
                width: constraints.maxWidth * .763,
                child: Visibility(
                  replacement: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.announcement_outlined,
                        size: 120,
                      ),
                      Text(
                        "Primeiro selecione um GamePad",
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                  visible: gamepad.id >= 0,
                  child: ListView(
                    children: [
                      const OptionContainer(
                        title: "Porta (Player)",
                        label: "Porta para o envio de comandos",
                      ),
                      const OptionContainer(
                        title: "Identifica o GamePad",
                        label:
                            "So funciona se o GamePad tive funcionalidade de vibrar",
                      ),
                      const OptionContainer(
                        title: "Muda a cor do led ",
                        label: "Seve para o DualSense e DualShock",
                      ),
                      const Padding(
                        padding: EdgeInsets.only(top: 20, left: 20),
                        child: Text(
                          "Personalizar comandos",
                          style: TextStyle(
                            fontSize: 25,
                          ),
                        ),
                      ),
                      ListView.builder(
                        shrinkWrap: true,
                        itemCount: gamepad.keyMaps.length,
                        itemBuilder: (context, index) => GamePadKeySelect(
                          onTap: (keyMap) {
                            developer.log(
                              "retro -> ${keyMap.retro} = native -> ${keyMap.native}",
                              level: 1,
                            );
                            gamepad.setKeyMap(keyMap);
                            wfl.setGamePad(gamepad);
                          },
                          keyMap: gamepad.keyMaps.elementAt(index),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            GamePadCard(
              width: constraints.maxWidth * .23,
            )
          ],
        ),
      ),
    );
  }
}
