import 'package:flutter/material.dart';
import 'package:wfl_dart_example/components/game_pad_card.dart';
import 'package:wfl_dart_example/components/option.dart';

class GamePadModal extends StatelessWidget {
  const GamePadModal({super.key});

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
                  OptionContainer(
                    title: "Porta (Player)",
                    label: "Porta para o envio de comandos",
                    onClick: () {},
                  ),
                  OptionContainer(
                    title: "Identifica o GamePad",
                    label:
                        "So funciona se o GamePad tive funcionalidade de vibrar",
                    onClick: () {},
                  ),
                  OptionContainer(
                    title: "Muda a cor do led ",
                    label: "Seve para DualSense e DualShock",
                    onClick: () {},
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
                    label: "Botão Nativo L2 | Aperte para alterar",
                    onClick: () {},
                  ),
                  OptionContainer(
                    title: "Botão A",
                    label: "Botão Nativo L2 | Aperte para alterar",
                    onClick: () {},
                  ),
                  OptionContainer(
                    title: "Botão B",
                    label: "Botão Nativo L2 | Aperte para alterar",
                    onClick: () {},
                  ),
                  OptionContainer(
                    title: "Botão X",
                    label: "Botão Nativo L2 | Aperte para alterar",
                    onClick: () {},
                  ),
                  OptionContainer(
                    title: "Botão Y",
                    label: "Botão Nativo L2 | Aperte para alterar",
                    onClick: () {},
                  ),
                  OptionContainer(
                    title: "Botão L",
                    label: "Botão Nativo L2 | Aperte para alterar",
                    onClick: () {},
                  ),
                  OptionContainer(
                    title: "Botão R",
                    label: "Botão Nativo L2 | Aperte para alterar",
                    onClick: () {},
                  ),
                  OptionContainer(
                    title: "Botão L2",
                    label: "Botão Nativo L2 | Aperte para alterar",
                    onClick: () {},
                  ),
                  OptionContainer(
                    title: "Botão R2",
                    label: "Botão Nativo L2 | Aperte para alterar",
                    onClick: () {},
                  ),
                  OptionContainer(
                    title: "D-PAD UP",
                    label: "Botão Nativo L2 | Aperte para alterar",
                    onClick: () {},
                  ),
                  OptionContainer(
                    title: "D-PAD DOWN",
                    label: "Botão Nativo L2 | Aperte para alterar",
                    onClick: () {},
                  ),
                  OptionContainer(
                    title: "D-PAD LEFT",
                    label: "Botão Nativo L2 | Aperte para alterar",
                    onClick: () {},
                  ),
                  OptionContainer(
                    title: "D-PAD RIGHT",
                    label: "Botão Nativo L2 | Aperte para alterar",
                    onClick: () {},
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
