import 'dart:io';

class WFLDirectoryManager {
  late List<FileSystemEntity> cores;
  late List<FileSystemEntity> roms;

  final _rootDir = Directory("C:${Platform.pathSeparator}WFL");
  late Directory coreDir;
  late Directory romsDir;
  late Directory tempDir;

  WFLDirectoryManager() {
    if (_rootDir.existsSync()) {
      _rootDir.create(recursive: true);
    }

    coreDir = Directory("${_rootDir.path}${Platform.pathSeparator}cores");
    romsDir = Directory("${_rootDir.path}${Platform.pathSeparator}roms");
    tempDir = Directory("${_rootDir.path}${Platform.pathSeparator}temp");

    getCores();
    getGames();
  }

  getCores() async {
    if (!coreDir.existsSync()) coreDir.createSync();
    cores = coreDir.listSync();
  }

  getGames() async {
    if (!romsDir.existsSync()) romsDir.createSync();
    roms = romsDir.listSync();
  }

  clearTempFiles() {
    if (!tempDir.existsSync()) tempDir.createSync();
  }
}
