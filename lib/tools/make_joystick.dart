import 'dart:ffi';

import 'package:ffi/ffi.dart';
import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart/wfl_dart_bindings_generated.dart';

class MakeJoystick {
  List<JoyStick> get(wfl_dart_find_controller finControllerRes) {
    Array<wfl_joystick> arrJoysticks = finControllerRes.joysticks;

    List<JoyStick> joysticks = [];

    try {
      for (var i = 0; i < finControllerRes.size; i++) {
        final joy = arrJoysticks[i];

        joysticks.add(
          JoyStick(
            id: joy.id,
            index: joy.index,
            name: joy.name.toDartString(),
          ),
        );
      }
    } catch (e) {
      print(e);
    }

    return joysticks;
  }
}
