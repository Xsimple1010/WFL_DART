import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart/wfl_dart_bindings_generated.dart';

class MakeGamePad {
  final _controllerDevice =
      calloc.allocate<wfl_game_pad>(sizeOf<wfl_game_pad>());
  final _nativeInfo =
      calloc.allocate<controller_native_info>(sizeOf<controller_native_info>());

  Pointer<wfl_game_pad> toNative(GamePad gamePad) {
    _controllerDevice.ref.id = gamePad.id;
    _controllerDevice.ref.index = gamePad.index;
    _controllerDevice.ref.port = gamePad.port;
    _controllerDevice.ref.type = gamePad.type;
    _controllerDevice.ref.name = gamePad.name.toNativeUtf8();

    _nativeInfo.ref.type = gamePad.nativeInfo.type;

    _controllerDevice.ref.nativeInfo = _nativeInfo.ref;

    int i = 0;
    for (var keyMap in gamePad.keyMaps) {
      _controllerDevice.ref.gamePadKeyBinds[i].native = keyMap.native;
      _controllerDevice.ref.gamePadKeyBinds[i].retro = keyMap.retro;
      i++;
    }

    return _controllerDevice;
  }

  GamePad fromDevice(
    Device device,
    int type,
    int port,
    GamePadNativeInfo nativeInfo,
  ) {
    return GamePad(
      id: device.id,
      index: device.index,
      port: port,
      type: type,
      name: device.name,
      nativeInfo: nativeInfo,
    );
  }

  toDart(wfl_game_pad gamePadNative) {
    return GamePad(
      id: gamePadNative.id,
      index: gamePadNative.index,
      name: gamePadNative.name.toDartString(),
      port: gamePadNative.port,
      type: RETRO_DEVICE_JOYPAD,
      nativeInfo: GamePadNativeInfo(
        type: WFL_DEVICE_TYPES.WFL_DEVICE_JOYSTICK,
      ),
    );
  }

  List<GamePad> toDartList(wfl_dart_get_connected_gamePads res) {
    Array<wfl_game_pad> arrDevices = res.devices;

    List<GamePad> gamePads = [];

    try {
      for (var i = 0; i < res.size; i++) {
        final gamePad = arrDevices[i];

        gamePads.add(
          toDart(gamePad),
        );
      }
    } catch (e) {
      print(e);
    }

    return gamePads;
  }

  close() {
    calloc.free(_controllerDevice);
    calloc.free(_nativeInfo);
  }
}
