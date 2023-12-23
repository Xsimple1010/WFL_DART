import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wfl_dart/wfl_dart.dart';
import 'package:wfl_dart_example/tools/file.dart';

class CoreItem extends StatefulWidget {
  const CoreItem({
    super.key,
    required this.coreFile,
  });

  final FileSystemEntity coreFile;

  @override
  State<CoreItem> createState() => _CoreItemState();
}

class _CoreItemState extends State<CoreItem> {
  bool isChecked = false;

  @override
  Widget build(BuildContext context) {
    final wfl = Provider.of<WFLDart>(context);

    return Container(
      margin: const EdgeInsets.all(12.0),
      height: 56,
      decoration: ShapeDecoration(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12.0),
        ),
      ),
      child: Row(
        children: [
          WFLOnCoreSelected(
            builder: (context, selected, child) => Checkbox(
              value: selected == widget.coreFile.path,
              onChanged: (value) => wfl.selectCore(widget.coreFile),
            ),
          ),
          const Padding(padding: EdgeInsets.only(right: 12)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: 170,
                child: Text(
                  getFileName(widget.coreFile.path),
                  style: const TextStyle(fontWeight: FontWeight.w600),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const Text("4,32kb"),
            ],
          )
        ],
      ),
    );
  }
}
