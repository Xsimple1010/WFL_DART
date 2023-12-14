import 'package:flutter/material.dart';
import 'dart:io';
import 'package:wfl_dart_example/tools/file.dart';

class GameItem extends StatelessWidget {
  const GameItem({
    super.key,
    required this.gameFile,
    required this.onClick,
  });

  final FileSystemEntity gameFile;
  final Function(String path) onClick;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onDoubleTap: () => onClick(gameFile.path),
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
