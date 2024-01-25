import 'dart:io';

import 'package:flutter/material.dart';
import 'core_item.dart';

class CoreList extends StatelessWidget {
  const CoreList({
    super.key,
    required this.cores,
  });

  final List<FileSystemEntity> cores;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: cores.length,
        itemBuilder: (BuildContext context, int index) {
          return CoreItem(
            coreFile: cores.elementAt(index),
          );
        },
      ),
    );
  }
}
