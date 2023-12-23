import 'dart:ffi';
import 'dart:io';
import 'package:ffi/ffi.dart';
import 'package:wfl_dart/models/wfl_events.dart';
import 'package:wfl_dart/tools/directory_manager.dart';
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
  final _wflEvents = calloc.allocate<wfl_events>(sizeOf<controller_events>());
  final _wflPaths = calloc.allocate<wfl_paths>(sizeOf<wfl_paths>());
  late WFLDirectoryManager _dirManage;
  late WFLDartEvents _events;

  //events
  late final NativeCallable<on_device_connect_t> _onConnectCallback;
  late final NativeCallable<on_device_disconnect_t> _onDisconnectCallback;
  late final NativeCallable<on_game_start> _onGameStartCallback;
  late final NativeCallable<on_game_close> _onGameCloseCallback;

  init(WFLDartEvents events) {
    _events = events;

    _dirManage = WFLDirectoryManager();

    final systemPath = _dirManage.gedSystemDir();
    final savePath = _dirManage.gedSaveDir();

    _wflPaths.ref.system = systemPath.toNativeUtf8();
    _wflPaths.ref.save = savePath.toNativeUtf8();

    _onConnectCallback = NativeCallable.listener(_onConnect);
    _onDisconnectCallback = NativeCallable.listener(_onDisconnect);
    _onGameStartCallback = NativeCallable.listener(_onGameStart);
    _onGameCloseCallback = NativeCallable.listener(_onGameClose);

    _wflEvents.ref.onConnect = _onConnectCallback.nativeFunction;
    _wflEvents.ref.onDisconnect = _onDisconnectCallback.nativeFunction;
    _wflEvents.ref.onGameStart = _onGameStartCallback.nativeFunction;
    _wflEvents.ref.onGameClose = _onGameCloseCallback.nativeFunction;

    _bindings.wflDartInit(_wflEvents.ref, _wflPaths.ref);
  }

  void _onConnect(Pointer<SDL_GameController> gmController) {
    _events.onConnect();
  }

  void _onDisconnect(int id, int port) {
    _events.onDisconnect(id, port);
  }

  void _onGameStart() {
    _events.onGameStart();
  }

  void _onGameClose() {
    _events.onGameClose();
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
    _onConnectCallback.close();
    _onDisconnectCallback.close();
    _onGameCloseCallback.close();
    _onGameStartCallback.close();
    calloc.free(_wflEvents);
    calloc.free(_wflPaths);
  }
}