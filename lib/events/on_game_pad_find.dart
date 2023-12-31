import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart/providers/wfl_repository.dart';

class WFLOnGamePadFind extends StatelessWidget {
  const WFLOnGamePadFind({
    super.key,
    required this.builder,
  });

  final ValueWidgetBuilder<List<Device>> builder;

  @override
  Widget build(BuildContext context) {
    return Selector<WFLDart, List<Device>>(
      selector: (_, wfl) => wfl.devicesAvailable,
      builder: builder,
    );
  }
}
