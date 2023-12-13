import 'package:flutter/material.dart';
import 'coreItem.dart';
import 'dart:io';

class CoreList extends StatelessWidget {
  const CoreList({
    super.key,
    required this.cores,
    required this.onClick,
  });

  final List<FileSystemEntity> cores;
  final Function(String path) onClick;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: cores.length,
      itemBuilder: (BuildContext context, int index) {
        return CoreItem(
          coreFile: cores.elementAt(index),
          onClick: onClick,
        );
      },
    );
  }
}
