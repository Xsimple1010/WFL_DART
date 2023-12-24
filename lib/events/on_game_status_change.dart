import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wfl_dart/providers/wfl_repository.dart';
import 'package:tuple/tuple.dart';

class WFLOnGameStatusChange extends StatelessWidget {
  const WFLOnGameStatusChange({
    super.key,
    required this.builder,
  });

  final ValueWidgetBuilder<Tuple2<bool, bool>> builder;

  @override
  Widget build(BuildContext context) {
    return Selector<WFLDart, Tuple2<bool, bool>>(
      selector: (_, wfl) => Tuple2(wfl.isPlaying, wfl.isPaused),
      builder: builder,
    );
  }
}
