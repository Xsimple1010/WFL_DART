import 'dart:io';

class WFLDirectoryManager {
  late List<FileSystemEntity> cores;
  late List<FileSystemEntity> roms;

  final _rootDir = Directory("C:${Platform.pathSeparator}WFL");
  late Directory coreDir;
  late Directory romsDir;
  late Directory tempDir;
  late Directory saveDir;
  late Directory systemDir;

  WFLDirectoryManager() {
    coreDir = Directory("${_rootDir.path}${Platform.pathSeparator}cores");
    romsDir = Directory("${_rootDir.path}${Platform.pathSeparator}roms");
    tempDir = Directory("${_rootDir.path}${Platform.pathSeparator}temp");
    saveDir = Directory("${_rootDir.path}${Platform.pathSeparator}save");
    systemDir = Directory("${_rootDir.path}${Platform.pathSeparator}system");

    if (!_rootDir.existsSync()) {
      coreDir.create(recursive: true);
      romsDir.create(recursive: true);
      tempDir.create(recursive: true);
      saveDir.create(recursive: true);
      systemDir.create(recursive: true);
    }

    getCores();
    getGames();
  }

  getCores() {
    if (!coreDir.existsSync()) coreDir.createSync();
    cores = coreDir.listSync();
  }

  getGames() {
    if (!romsDir.existsSync()) romsDir.createSync();
    roms = romsDir.listSync();
  }

  String gedSystemDir() {
    if (!systemDir.existsSync()) systemDir.createSync();
    return systemDir.path;
  }

  String gedSaveDir() {
    if (!saveDir.existsSync()) saveDir.createSync();
    return saveDir.path;
  }

  clearTempFiles() {
    // if (!tempDir.existsSync()) tempDir.createSync();
  }
}
