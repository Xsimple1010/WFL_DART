import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart/providers/wfl_repository.dart';

class WFLOnGamePadSelectedToEdit extends StatelessWidget {
  const WFLOnGamePadSelectedToEdit({
    super.key,
    required this.builder,
  });

  final ValueWidgetBuilder<GamePad> builder;

  @override
  Widget build(BuildContext context) {
    return Selector<WFLDart, GamePad>(
      selector: (_, wfl) => wfl.gamepadSelectedToEdit,
      builder: builder,
    );
  }
}
