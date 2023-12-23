import 'package:flutter/material.dart';
import 'gameitem.dart';
import 'package:wfl_dart/wfl_dart.dart';

class GameList extends StatelessWidget {
  final dirManger = WFLDirectoryManager();

  GameList({
    super.key,
  }) {
    dirManger.getGames();
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: dirManger.roms.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 6,
      ),
      itemBuilder: (BuildContext context, int index) {
        return GridTile(
          child: GameItem(gameFile: dirManger.roms.elementAt(index)),
        );
      },
    );
  }
}
