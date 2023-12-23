import 'dart:io';
import 'package:flutter/material.dart';
import 'package:wfl_dart/wfl_dart.dart';
import 'package:wfl_dart_example/tools/file.dart';
import 'package:provider/provider.dart';

class GameItem extends StatelessWidget {
  const GameItem({
    super.key,
    required this.gameFile,
  });

  final FileSystemEntity gameFile;

  @override
  Widget build(BuildContext context) {
    final wfl = Provider.of<WFL>(context);

    return GestureDetector(
      onDoubleTap: () => wfl.loadGame(gameFile),
      child: Card(
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 80,
                height: 80,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.blueGrey,
                ),
                child: Text(
                  getFileName(gameFile.path).characters.first,
                  style: const TextStyle(fontSize: 40),
                ),
              ),
              Text(
                getFileName(gameFile.path),
                style: const TextStyle(fontWeight: FontWeight.w600),
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
