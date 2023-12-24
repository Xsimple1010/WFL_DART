import 'package:flutter/material.dart';
import 'package:wfl_dart_example/components/coreList.dart';
import 'components/gamelist.dart';

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
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: CoreList(),
                ),
              ),
            )
          ],
        ),
      ],
    );
  }
}
