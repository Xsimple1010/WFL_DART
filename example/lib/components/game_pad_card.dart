import 'package:flutter/material.dart';

import 'package:wfl_dart/wfl_dart.dart';

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
                      wfl.findController();
                    },
                    icon: const Icon(Icons.refresh_outlined),
                  ),
                ],
              ),
            ),
            WFLOnGamePadFind(
              builder: (context, joysticks, child) => ListView.builder(
                shrinkWrap: true,
                itemCount: joysticks.length,
                itemBuilder: (context, index) => Row(
                  children: [
                    Checkbox(
                      value: true,
                      onChanged: (value) {},
                    ),
                    const Padding(padding: EdgeInsets.only(right: 12)),
                    Text(
                      joysticks[index].name,
                      style: const TextStyle(fontWeight: FontWeight.w600),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const Spacer(),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
