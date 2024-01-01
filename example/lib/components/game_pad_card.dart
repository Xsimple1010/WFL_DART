import 'package:flutter/material.dart';

import 'package:wfl_dart/wfl_dart.dart';
import 'package:wfl_dart_example/components/game_pad_item.dart';

class GamePadCard extends StatelessWidget {
  const GamePadCard({
    super.key,
    required this.width,
  });

  final double width;

  @override
  Widget build(BuildContext context) {
    final wfl = WFLDart.of(context);

    return Card(
      child: SizedBox(
        width: width,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                top: 20,
                left: 20,
                right: 20,
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "GamePads disponíveis",
                    style: TextStyle(fontSize: 20),
                  ),
                  IconButton(
                    onPressed: () {
                      wfl.getAllDevices();
                    },
                    icon: const Icon(Icons.refresh_outlined),
                  ),
                ],
              ),
            ),
            WFLOnGamePadFind(
              builder: (context, devices, child) => ListView.builder(
                shrinkWrap: true,
                itemCount: devices.length,
                itemBuilder: (context, index) => GamePadItem(
                  selected: devices[index].id == wfl.gamepadSelectedToEdit.id,
                  device: devices[index],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
