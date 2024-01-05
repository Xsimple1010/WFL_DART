import 'package:flutter/material.dart';
import 'package:wfl_dart_example/components/core_list.dart';
import '../components/gamel_list.dart';

class Home extends StatelessWidget {
  const Home({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: GameList(),
            ),
            Expanded(
              child: CoreList(),
            )
          ],
        ),
      ],
    );
  }
}
