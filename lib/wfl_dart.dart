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
  final wflEvents = calloc.allocate<wfl_events>(sizeOf<controller_events>());
  final wflPaths = calloc.allocate<wfl_paths>(sizeOf<wfl_paths>());
  late WFLDirectoryManager _dirManage;

  //events
  late final NativeCallable<on_device_connect_t> onConnectCallback;
  late final NativeCallable<on_device_disconnect_t> onDisconnectCallback;
  late final NativeCallable<on_game_start> onGameStartCallback;
  late final NativeCallable<on_game_close> onGameCloseCallback;

  init() {
    _dirManage = WFLDirectoryManager();

    final systemPath = _dirManage.gedSystemDir();
    final savePath = _dirManage.gedSaveDir();

    wflPaths.ref.system = systemPath.toNativeUtf8();
    wflPaths.ref.save = savePath.toNativeUtf8();

    onConnectCallback = NativeCallable.listener(onConnect);
    onDisconnectCallback = NativeCallable.listener(onDisconnect);
    onGameStartCallback = NativeCallable.listener(onGameStart);
    onGameCloseCallback = NativeCallable.listener(onGameClose);

    wflEvents.ref.onConnect = onConnectCallback.nativeFunction;
    wflEvents.ref.onDisconnect = onDisconnectCallback.nativeFunction;
    wflEvents.ref.onGameStart = onGameStartCallback.nativeFunction;
    wflEvents.ref.onGameClose = onGameCloseCallback.nativeFunction;

    _bindings.wflDartInit(wflEvents.ref, wflPaths.ref);
  }

  void onConnect(Pointer<SDL_GameController> gmController) {
    print("connected");
  }

  void onDisconnect(int id, int port) {
    print("diConnected");
  }

  void onGameStart() {
    print("onGameStart");
  }

  void onGameClose() {
    print("onGameClose");
  }

  loadCore(String path) {
    _bindings.wflDartLoadCore(path.toNativeUtf8());
  }

  loadGame(String path) {
    _bindings.wflDarLoadGame(path.toNativeUtf8());
  }

  stop() {
    _bindings.wflDartStop();
  }

  resume() {
    _bindings.wflDartResume();
  }

  pause() {
    _bindings.wflDartPause();
  }

  deInit() {
    _bindings.wflDartStop();
    onConnectCallback.close();
    onDisconnectCallback.close();
    onGameCloseCallback.close();
    onGameStartCallback.close();
    calloc.free(wflEvents);
    calloc.free(wflPaths);
  }
}
