final class WFLDartEvents {
  final void Function() onConnect;
  final void Function(int id, int port) onDisconnect;
  final void Function() onGameStart;
  final void Function() onGameClose;

  WFLDartEvents({
    required this.onConnect,
    required this.onDisconnect,
    required this.onGameStart,
    required this.onGameClose,
  });
}
