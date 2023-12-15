import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:wfl_dart/tools/directory_manager.dart';
export 'tools/directory_manager.dart';

import 'wfl_dart_bindings_generated.dart';

const String _libName = 'wfl_dart';

/// The dynamic library in which the symbols for [WflDartBindings] can be found.
final DynamicLibrary _dylib = () {
  if (Platform.isMacOS || Platform.isIOS) {
    return DynamicLibrary.open('$_libName.framework/$_libName');
  }
  if (Platform.isAndroid || Platform.isLinux) {
    return DynamicLibrary.open('lib$_libName.so');
  }
  if (Platform.isWindows) {
    return DynamicLibrary.open('$_libName.dll');
  }
  throw UnsupportedError('Unknown platform: ${Platform.operatingSystem}');
}();

/// The bindings to the native functions in [_dylib].
final WflDartBindings _bindings = WflDartBindings(_dylib);

class WFL {
  final controllerEvents =
      calloc.allocate<controller_events>(sizeOf<controller_events>());
  final wflPaths = calloc.allocate<wfl_paths>(sizeOf<wfl_paths>());
  late WFLDirectoryManager _dirManage;

  WFL() {
    _dirManage = WFLDirectoryManager();

    final systemPath = _dirManage.gedSystemDir();
    final savePath = _dirManage.gedSaveDir();

    wflPaths.ref.system = systemPath.toNativeUtf8();
    wflPaths.ref.save = savePath.toNativeUtf8();

    controllerEvents.ref.onConnect = Pointer.fromFunction(onConnect);
    controllerEvents.ref.onDisconnect = Pointer.fromFunction(onDisconnect);

    _bindings.wflDartInit(controllerEvents.ref, wflPaths.ref);
  }

  static void onConnect(Pointer<SDL_GameController> gmController) {
    print("connected");
  }

  static void onDisconnect(int id, int port) {
    print("diConnected");
  }

  loadCore(String path) {
    _bindings.wflDartLoadCore(path.toNativeUtf8());
  }

  loadGame(String path) {
    _bindings.wflDarLoadGame(path.toNativeUtf8());
  }

  deInit() {
    _bindings.wflDartStop();
    calloc.free(controllerEvents);
    calloc.free(wflPaths);
  }
}
