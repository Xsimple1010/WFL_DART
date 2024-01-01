import 'package:flutter/material.dart';
import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart/wfl_dart.dart';

class GamePadItem extends StatelessWidget {
  const GamePadItem({
    super.key,
    required this.device,
    required this.selected,
  });

  final Device device;
  final bool selected;

  @override
  Widget build(BuildContext context) {
    final wfl = WFLDart.of(context);
    final theme = Theme.of(context);

    return GestureDetector(
      onDoubleTap: () {
        final gamepad = wfl.getGamePadByDeviceId(device.id);
        wfl.setGamePad(gamepad);
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: OutlinedButton(
          onPressed: () {
            final gamepad = wfl.getGamePadByDeviceId(device.id);
            wfl.setSelectGamepadToEdit(gamepad);
          },
          style: OutlinedButton.styleFrom(
            side: const BorderSide(style: BorderStyle.none),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            backgroundColor: device.connected
                ? theme.colorScheme.primaryContainer
                : selected
                    ? theme.focusColor
                    : null,
          ),
          child: LayoutBuilder(
            builder: (context, constraints) => SizedBox(
              height: 90,
              child: Row(
                children: [
                  const Icon(Icons.gamepad),
                  const Padding(padding: EdgeInsets.only(right: 12)),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: (constraints.maxWidth * .80),
                        child: Text(
                          device.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 17,
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Text(
                        device.connected ? "Desconectar" : "Conectar",
                        style: const TextStyle(fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
