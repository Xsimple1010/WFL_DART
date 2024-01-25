import 'package:flutter/material.dart';
import 'package:wfl_dart/wfl_dart.dart';
import 'package:wfl_dart_example/components/core_list.dart';
import '../components/game_list.dart';

class Home extends StatelessWidget {
  Home({
    super.key,
  });

  final cores = WFLDirectoryManager().cores;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          children: [
            Expanded(
              flex: 3,
              child: Visibility(
                  visible: cores.isNotEmpty,
                  replacement: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.announcement_outlined,
                        size: 120,
                      ),
                      Text(
                        "Nao ha roms no diretório WFL",
                        style: TextStyle(fontSize: 30),
                      )
                    ],
                  ),
                  child: GameList()),
            ),
            Expanded(
              child: CoreList(
                cores: cores,
              ),
            )
          ],
        ),
      ],
    );
  }
}
