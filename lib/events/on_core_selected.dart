import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wfl_dart/providers/wfl_repository.dart';

class WFLOnCoreSelected extends StatelessWidget {
  const WFLOnCoreSelected({
    super.key,
    required this.builder,
  });

  final ValueWidgetBuilder<String> builder;

  @override
  Widget build(BuildContext context) {
    return Selector<WFLDart, String>(
      selector: (_, wfl) => wfl.coreSelected,
      builder: builder,
    );
  }
}
