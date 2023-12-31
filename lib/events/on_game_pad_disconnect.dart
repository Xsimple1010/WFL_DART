import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart/providers/wfl_repository.dart';

class WFLOnGamePadDisconnect extends StatelessWidget {
  const WFLOnGamePadDisconnect({
    super.key,
    required this.builder,
  });

  final ValueWidgetBuilder<Device> builder;

  @override
  Widget build(BuildContext context) {
    return Selector<WFLDart, Device>(
      selector: (_, wfl) => wfl.lastDisConnectedJoyStick,
      builder: builder,
    );
  }
}
