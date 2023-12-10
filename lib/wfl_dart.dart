import 'dart:async';
import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';

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

  WFL() {
    controllerEvents.ref.onConnect = Pointer.fromFunction(onConnect);
    controllerEvents.ref.onDisconnect = Pointer.fromFunction(onDisconnect);

    _bindings.wflDartInit(controllerEvents.ref);
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
  }
}
