import 'package:wfl_dart/models/wfl_gamepad.dart';
import 'package:wfl_dart/wfl_dart_bindings_generated.dart';

final class WFLDartEvents {
  final void Function(wfl_joystick joystick) onConnect;
  final void Function(wfl_joystick joyStick, int port) onDisconnect;
  final void Function() onGameStart;
  final void Function() onGameClose;

  WFLDartEvents({
    required this.onConnect,
    required this.onDisconnect,
    required this.onGameStart,
    required this.onGameClose,
  });
}
