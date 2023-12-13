import 'package:flutter/material.dart';
import 'gameitem.dart';
import 'dart:io';

class GameList extends StatelessWidget {
  const GameList({
    super.key,
    required this.games,
    required this.onClick,
  });

  final List<FileSystemEntity> games;
  final Function(String path) onClick;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: GridView.builder(
        itemCount: games.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 6,
        ),
        itemBuilder: (BuildContext context, int index) {
          return GridTile(
            child: GameItem(gameFile: games.elementAt(index), onClick: onClick),
          );
        },
      ),
    );
  }
}
