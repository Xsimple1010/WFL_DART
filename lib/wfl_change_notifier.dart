import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wfl_dart/providers/wfl_repository.dart';

class WFLChangeNotifier extends StatelessWidget {
  const WFLChangeNotifier({
    super.key,
    required this.wfl,
    this.child,
  });

  final WFLDart wfl;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: wfl,
      child: child,
    );
  }
}
