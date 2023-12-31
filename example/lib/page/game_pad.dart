import 'package:flutter/material.dart';
import 'package:wfl_dart/models/key_maps.dart';
import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart_example/components/game_pad_card.dart';
import 'package:wfl_dart_example/components/option.dart';

class GamePadModal extends StatefulWidget {
  const GamePadModal({super.key});

  @override
  State<GamePadModal> createState() => _GamePadModalState();
}

class _GamePadModalState extends State<GamePadModal> {
  GamePad gamePad = GamePad(
    id: -1,
    index: -1,
    port: -1,
    type: -1,
    name: "",
    nativeInfo: GamePadNativeInfo(type: 0),
  );
  Device deviceSelected = Device(
    id: -1,
    index: -1,
    connected: false,
    name: "",
  );

  updateKeyMap(GamePadKeyMap keyMap, int position) {
    gamePad.keyMaps[position] = keyMap;
  }

  updatePort(int port) {
    gamePad.port = port;
  }

  selectGamePad(Device device) {
    deviceSelected = device;
    gamePad = GamePad(
      id: -1,
      index: -1,
      port: -1,
      type: -1,
      name: "",
      nativeInfo: GamePadNativeInfo(type: 0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Configurações de GamePad")),
      body: LayoutBuilder(
        builder: (context, constraints) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: constraints.maxWidth * .763,
              child: ListView(
                children: const [
                  OptionContainer(
                    title: "Porta (Player)",
                    label: "Porta para o envio de comandos",
                  ),
                  OptionContainer(
                    title: "Identifica o GamePad",
                    label:
                        "So funciona se o GamePad tive funcionalidade de vibrar",
                  ),
                  OptionContainer(
                    title: "Muda a cor do led ",
                    label: "Seve para o DualSense e DualShock",
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 20, left: 20),
                    child: Text(
                      "Personalizar comandos",
                      style: TextStyle(
                        fontSize: 25,
                      ),
                    ),
                  ),
                  OptionContainer(
                    title: "Botão A",
                    label: "Aperte para alterar",
                  ),
                  OptionContainer(
                    title: "Botão B",
                    label: "Aperte para alterar",
                  ),
                  OptionContainer(
                    title: "Botão Y",
                    label: "Aperte para alterar",
                  ),
                  OptionContainer(
                    title: "Botão X",
                    label: "Aperte para alterar",
                  ),
                  OptionContainer(
                    title: "Botão L",
                    label: "Aperte para alterar",
                  ),
                  OptionContainer(
                    title: "Botão R",
                    label: "Aperte para alterar",
                  ),
                  OptionContainer(
                    title: "Botão R2",
                    label: "Aperte para alterar",
                  ),
                  OptionContainer(
                    title: "Botão L2",
                    label: "Aperte para alterar",
                  ),
                  OptionContainer(
                    title: "D-PAD UP",
                    label: "Aperte para alterar",
                  ),
                  OptionContainer(
                    title: "D-PAD DOWN",
                    label: "Aperte para alterar",
                  ),
                  OptionContainer(
                    title: "D-PAD LEFT",
                    label: "Aperte para alterar",
                  ),
                  OptionContainer(
                    title: "D-PAD RIGHT",
                    label: "Aperte para alterar",
                  ),
                ],
              ),
            ),
            GamePadCard(
              onClick: (gamepad) {},
              width: constraints.maxWidth * .23,
            )
          ],
        ),
      ),
    );
  }
}
