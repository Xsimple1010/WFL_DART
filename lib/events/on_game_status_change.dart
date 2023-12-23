import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wfl_dart/providers/wfl_repository.dart';

class WFLOnGameStatusChange extends StatelessWidget {
  const WFLOnGameStatusChange({
    super.key,
    required this.builder,
  });

  final ValueWidgetBuilder<bool> builder;

  @override
  Widget build(BuildContext context) {
    return Selector<WFLDart, bool>(
      selector: (_, wfl) => wfl.isPlaying,
      builder: builder,
    );
  }
}
