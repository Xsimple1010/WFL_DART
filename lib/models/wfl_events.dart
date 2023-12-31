import 'package:wfl_dart/wfl_dart_bindings_generated.dart';

final class WFLDartEvents {
  final void Function(wfl_device device) onConnect;
  final void Function(wfl_device device, int port) onDisconnect;
  final void Function() onGameStart;
  final void Function() onGameClose;
  final void Function(wfl_status status) onStateChange;

  WFLDartEvents({
    required this.onConnect,
    required this.onDisconnect,
    required this.onGameStart,
    required this.onGameClose,
    required this.onStateChange,
  });
}
