import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wfl_dart/wfl_dart.dart';

class WFLOnCoreSelected extends StatelessWidget {
  const WFLOnCoreSelected({
    super.key,
    required this.builder,
  });

  final ValueWidgetBuilder<String> builder;

  @override
  Widget build(BuildContext context) {
    return Selector<WFL, String>(
      selector: (_, wfl) => wfl.coreSelected,
      builder: builder,
    );
  }
}
