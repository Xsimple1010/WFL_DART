import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart/wfl_dart_bindings_generated.dart';

class MakeDeviceController {
  final _controllerDevice =
      calloc.allocate<controller_device>(sizeOf<controller_device>());
  final _nativeInfo =
      calloc.allocate<controller_native_info>(sizeOf<controller_native_info>());

  Pointer<controller_device> get(GamePad gamePad) {
    _controllerDevice.ref.id = gamePad.id;
    _controllerDevice.ref.index = gamePad.index;
    _controllerDevice.ref.port = gamePad.port;
    _controllerDevice.ref.type = gamePad.type;
    _controllerDevice.ref.name = gamePad.name.toNativeUtf8();

    _nativeInfo.ref.type = gamePad.nativeInfo.type;

    _controllerDevice.ref.nativeInfo = _nativeInfo.ref;

    int i = 0;
    for (var keyMap in gamePad.keyMaps) {
      _controllerDevice.ref.joystickKeyBinds[i].native = keyMap.native;
      _controllerDevice.ref.joystickKeyBinds[i].retro = keyMap.retro;
      i++;
    }

    return _controllerDevice;
  }

  close() {
    calloc.free(_controllerDevice);
    calloc.free(_nativeInfo);
  }
}
