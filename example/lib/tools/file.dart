import 'dart:io';

String getFileName(String path) {
  return path.split(Platform.pathSeparator).last;
}
