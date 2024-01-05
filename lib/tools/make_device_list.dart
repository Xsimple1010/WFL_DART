import 'dart:ffi';
import 'dart:developer' as developer;
import 'package:ffi/ffi.dart';
import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart/wfl_dart_bindings_generated.dart';

class MakeDevice {
  static List<Device> toDartList(wfl_dart_get_all_gamePads finControllerRes) {
    Array<wfl_device> arrDevices = finControllerRes.devices;

    List<Device> devices = [];

    try {
      for (var i = 0; i < finControllerRes.size; i++) {
        final device = arrDevices[i];

        devices.add(
          Device(
            id: device.id,
            index: device.index,
            name: device.name.toDartString(),
            connected: device.connected,
          ),
        );
      }
    } catch (e) {
      developer.log(
        "erro ao criar o device pelo tipo nativo",
        error: e,
        level: 2,
      );
    }

    return devices;
  }

  static Device toDart(wfl_device device) {
    return Device(
      id: device.id,
      index: device.index,
      name: device.name.toDartString(),
      connected: device.connected,
    );
  }
}
