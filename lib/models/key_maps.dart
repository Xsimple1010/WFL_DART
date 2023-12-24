import 'package:wfl_dart/wfl_dart_bindings_generated.dart';

class WFLGamePadRetroButton {
  static const int INVALID =
      wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_INVALID;
  static const int A = wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_A;
  static const int B = wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_B;
  static const int X = wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_X;
  static const int Y = wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_Y;
  static const int BACK = wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_BACK;

  /// JOYSTICK_RETRO_BT_GUIDE           = RETRO_DEVICE_ID_JOYPAD_SELECT,
  static const int START =
      wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_START;
  static const int L2 = wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_L2;
  static const int R2 = wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_R2;
  static const int L = wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_L;
  static const int R = wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_R;
  static const int DPAD_UP =
      wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_DPAD_UP;
  static const int DPAD_DOWN =
      wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_DPAD_DOWN;
  static const int DPAD_LEFT =
      wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_DPAD_LEFT;
  static const int DPAD_RIGHT =
      wfl_joystick_retro_buttons.WFL_JOYSTICK_RETRO_BT_DPAD_RIGHT;
}

class WFLGamePadNativeButton {
  static const int INVALID =
      wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_INVALID;
  static const int A = wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_A;
  static const int B = wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_B;
  static const int X = wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_X;
  static const int Y = wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_Y;
  static const int BACK =
      wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_BACK;
  static const int GUIDE =
      wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_GUIDE;
  static const int START =
      wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_START;
  static const int L2 = wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_L2;
  static const int R2 = wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_R2;
  static const int L = wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_L;
  static const int R = wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_R;
  static const int DPAD_UP =
      wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_DPAD_UP;
  static const int DPAD_DOWN =
      wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_DPAD_DOWN;
  static const int DPAD_LEFT =
      wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_DPAD_LEFT;
  static const int DPAD_RIGHT =
      wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_DPAD_RIGHT;

  /// Xbox Series X share button, PS5 microphone button, Nintendo Switch Pro capture button, Amazon Luna microphone button
  static const int MISC1 =
      wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_MISC1;

  /// Xbox Elite paddle P1 (upper left, facing the back)
  static const int PADDLE1 =
      wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_PADDLE1;

  /// Xbox Elite paddle P3 (upper right, facing the back)
  static const int PADDLE2 =
      wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_PADDLE2;

  /// Xbox Elite paddle P2 (lower left, facing the back)
  static const int PADDLE3 =
      wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_PADDLE3;

  /// Xbox Elite paddle P4 (lower right, facing the back)
  static const int PADDLE4 =
      wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_PADDLE4;

  /// PS4/PS5 touchpad button
  static const int TOUCHPAD =
      wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_TOUCHPAD;
  static const int MAX = wfl_joystick_native_buttons.WFL_JOYSTICK_NATIVE_BT_MAX;
}

class GamePadKeyMap {
  int native;
  int retro;

  GamePadKeyMap({
    required this.native,
    required this.retro,
  });
}
