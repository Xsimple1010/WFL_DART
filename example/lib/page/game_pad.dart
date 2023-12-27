import 'package:flutter/material.dart';
import 'package:wfl_dart/models/key_maps.dart';
import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart_example/components/game_pad_card.dart';
import 'package:wfl_dart_example/components/game_pad_keys.dart';
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
  JoyStick joyStickSelected = JoyStick(
    id: -1,
    index: -1,
    name: "",
  );

  updateKeyMap(GamePadKeyMap keyMap, int position) {
    gamePad.keyMaps[position] = keyMap;
  }

  updatePort(int port) {
    gamePad.port = port;
  }

  selectJoyStick(JoyStick joy) {
    joyStickSelected = joy;
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
    final theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(title: const Text("Configurações de GamePad")),
      body: LayoutBuilder(
        builder: (context, constraints) => Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SizedBox(
              width: constraints.maxWidth * .763,
              child: ListView(
                children: [
                  const OptionContainer(
                    title: "Porta (Player)",
                    label: "Porta para o envio de comandos",
                    action: Text("Text"),
                    // onClick: () => updatePort(0),
                  ),
                  OptionContainer(
                    title: "Identifica o GamePad",
                    label:
                        "So funciona se o GamePad tive funcionalidade de vibrar",
                    action: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.vibration,
                      ),
                    ),
                    // onClick: () {},
                  ),
                  OptionContainer(
                    title: "Muda a cor do led ",
                    label: "Seve para o DualSense e DualShock",
                    action: IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.vibration,
                      ),
                    ),
                    // onClick: () {},
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
                  OptionContainer(
                    title: "Botão A",
                    label: "Aperte para alterar",
                    action: IconButton(
                      onPressed: () => {
                        updateKeyMap(
                          GamePadKeyMap(
                            native: WFLGamePadNativeButton.A,
                            retro: WFLGamePadRetroButton.A,
                          ),
                          0,
                        )
                      },
                      icon: const Icon(Icons.abc),
                    ),
                  ),
                  OptionContainer(
                    title: "Botão B",
                    label: "Aperte para alterar",
                    action: IconButton(
                      onPressed: () => {
                        updateKeyMap(
                          GamePadKeyMap(
                            native: WFLGamePadNativeButton.A,
                            retro: WFLGamePadRetroButton.A,
                          ),
                          0,
                        )
                      },
                      icon: const Icon(Icons.abc),
                    ),
                  ),
                  OptionContainer(
                    title: "Botão Y",
                    label: "Aperte para alterar",
                    action: IconButton(
                      onPressed: () => {
                        updateKeyMap(
                          GamePadKeyMap(
                            native: WFLGamePadNativeButton.Y,
                            retro: WFLGamePadRetroButton.Y,
                          ),
                          2,
                        )
                      },
                      icon: const Icon(Icons.abc),
                    ),
                  ),
                  OptionContainer(
                    title: "Botão X",
                    label: "Aperte para alterar",
                    action: IconButton(
                      onPressed: () => {
                        updateKeyMap(
                          GamePadKeyMap(
                            native: WFLGamePadNativeButton.X,
                            retro: WFLGamePadRetroButton.X,
                          ),
                          3,
                        )
                      },
                      icon: const Icon(Icons.abc),
                    ),
                  ),
                  OptionContainer(
                    title: "Botão L",
                    label: "Aperte para alterar",
                    action: IconButton(
                      onPressed: () => {
                        updateKeyMap(
                          GamePadKeyMap(
                            native: WFLGamePadNativeButton.L,
                            retro: WFLGamePadRetroButton.L,
                          ),
                          4,
                        )
                      },
                      icon: const Icon(Icons.abc),
                    ),
                  ),
                  OptionContainer(
                    title: "Botão R",
                    label: "Aperte para alterar",
                    action: IconButton(
                      onPressed: () => {
                        updateKeyMap(
                          GamePadKeyMap(
                            native: WFLGamePadNativeButton.R,
                            retro: WFLGamePadRetroButton.R,
                          ),
                          5,
                        )
                      },
                      icon: const Icon(Icons.abc),
                    ),
                  ),
                  OptionContainer(
                    title: "Botão R2",
                    label: "Aperte para alterar",
                    action: IconButton(
                      onPressed: () => {
                        updateKeyMap(
                          GamePadKeyMap(
                            native: WFLGamePadNativeButton.R2,
                            retro: WFLGamePadRetroButton.R2,
                          ),
                          6,
                        )
                      },
                      icon: const Icon(Icons.abc),
                    ),
                  ),
                  OptionContainer(
                    title: "Botão L2",
                    label: "Aperte para alterar",
                    action: IconButton(
                      onPressed: () => {
                        updateKeyMap(
                          GamePadKeyMap(
                            native: WFLGamePadNativeButton.L2,
                            retro: WFLGamePadRetroButton.L2,
                          ),
                          7,
                        )
                      },
                      icon: const Icon(Icons.abc),
                    ),
                  ),
                  OptionContainer(
                    title: "D-PAD UP",
                    label: "Aperte para alterar",
                    action: IconButton(
                      onPressed: () => {
                        updateKeyMap(
                          GamePadKeyMap(
                            native: WFLGamePadNativeButton.DPAD_UP,
                            retro: WFLGamePadRetroButton.DPAD_UP,
                          ),
                          8,
                        )
                      },
                      icon: Icon(Icons.abc),
                    ),
                  ),
                  OptionContainer(
                    title: "D-PAD DOWN",
                    label: "Aperte para alterar",
                    action: IconButton(
                      onPressed: () => {
                        updateKeyMap(
                          GamePadKeyMap(
                            native: WFLGamePadNativeButton.DPAD_DOWN,
                            retro: WFLGamePadRetroButton.DPAD_DOWN,
                          ),
                          9,
                        )
                      },
                      icon: const Icon(Icons.abc),
                    ),
                  ),
                  OptionContainer(
                    title: "D-PAD LEFT",
                    label: "Aperte para alterar",
                    action: IconButton(
                      onPressed: () => {
                        updateKeyMap(
                          GamePadKeyMap(
                            native: WFLGamePadNativeButton.DPAD_LEFT,
                            retro: WFLGamePadRetroButton.DPAD_LEFT,
                          ),
                          10,
                        )
                      },
                      icon: const Icon(Icons.abc),
                    ),
                  ),
                  OptionContainer(
                    title: "D-PAD RIGHT",
                    label: "Aperte para alterar",
                    action: IconButton(
                      onPressed: () => {
                        updateKeyMap(
                          GamePadKeyMap(
                            native: WFLGamePadNativeButton.DPAD_RIGHT,
                            retro: WFLGamePadRetroButton.DPAD_RIGHT,
                          ),
                          11,
                        )
                      },
                      icon: const Icon(Icons.abc),
                    ),
                  ),
                ],
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
