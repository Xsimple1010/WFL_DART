import 'package:flutter/material.dart';
import 'package:wfl_dart/wfl_dart.dart';
import 'core_item.dart';

class CoreList extends StatelessWidget {
  final dirManger = WFLDirectoryManager();

  CoreList({
    super.key,
  }) {
    dirManger.getCores();
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListView.builder(
        itemCount: dirManger.cores.length,
        itemBuilder: (BuildContext context, int index) {
          return CoreItem(
            coreFile: dirManger.cores.elementAt(index),
          );
        },
      ),
    );
  }
}
