import 'package:wfl_dart/wfl_dart_bindings_generated.dart';

class WFLGetKeyNames {
  static gamepadNativeKeyName(int key) {
    String name = "Invalid";

    switch (key) {
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_A:
        name = "A";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_B:
        name = "B";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_Y:
        name = "Y";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_X:
        name = "X";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_BACK:
        name = "BACK";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_DPAD_DOWN:
        name = "DPAD-DOWN";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_DPAD_LEFT:
        name = "DPAD-LEFT";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_DPAD_RIGHT:
        name = "DPAD-RIGHT";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_DPAD_UP:
        name = "DPAD-UP";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_GUIDE:
        name = "GUIDE";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_L:
        name = "L";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_L2:
        name = "L2";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_R:
        name = "R";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_R2:
        name = "R2";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_MISC1:
        name = "MISC";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_PADDLE1:
        name = "PADDLE1";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_PADDLE2:
        name = "PADDLE2";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_PADDLE3:
        name = "PADDLE3";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_PADDLE4:
        name = "PADDLE4";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_START:
        name = "START";
        break;
      case wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_TOUCHPAD:
        name = "TOUCHPAD";
        break;
    }

    return name;
  }

  static String gamepadRetroKeyName(int key) {
    String name = "Invalid";

    switch (key) {
      case wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_A:
        name = "A";
        break;
      case wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_B:
        name = "B";
        break;
      case wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_Y:
        name = "Y";
        break;
      case wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_X:
        name = "X";
        break;
      case wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_BACK:
        name = "BACK";
        break;
      case wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_DPAD_DOWN:
        name = "DPAD-DOWN";
        break;
      case wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_DPAD_LEFT:
        name = "DPAD-LEFT";
        break;
      case wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_DPAD_RIGHT:
        name = "DPAD-RIGHT";
        break;
      case wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_DPAD_UP:
        name = "DPAD-UP";
        break;
      case wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_L:
        name = "L";
        break;
      case wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_L2:
        name = "L2";
        break;
      case wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_R:
        name = "R";
        break;
      case wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_R2:
        name = "R2";
        break;
      case wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_START:
        name = "START";
        break;
    }

    return name;
  }
}
