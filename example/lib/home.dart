import 'package:flutter/material.dart';
import 'package:wfl_dart_example/components/coreList.dart';
import 'components/gamelist.dart';

class Home extends StatefulWidget {
  const Home({
    super.key,
  });

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late String coreSelected = "";

  onCoreChange(String path) {
    coreSelected = path;
  }

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      Expanded(
        flex: 3,
        child: GameList(),
      ),
      Expanded(
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: CoreList(),
          ),
        ),
      )
    ]);
  }
}
