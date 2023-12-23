import 'package:flutter/material.dart';
import 'package:wfl_dart/wfl_dart.dart';
import 'coreItem.dart';

class CoreList extends StatelessWidget {
  final dirManger = WFLDirectoryManager();

  CoreList({
    super.key,
  }) {
    dirManger.getCores();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: dirManger.cores.length,
      itemBuilder: (BuildContext context, int index) {
        return CoreItem(
          coreFile: dirManger.cores.elementAt(index),
        );
      },
    );
  }
}
