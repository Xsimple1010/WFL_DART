import 'package:wfl_dart/models/key_maps.dart';

class Device {
  final int id;

  final int index;

  final String name;

  bool connected;

  Device({
    required this.id,
    required this.index,
    required this.name,
    required this.connected,
  });
}

class GamePadNativeInfo {
  int type;
  GamePadNativeInfo({required this.type});
}

class GamePad {
  int id;
  int index;
  int port;
  int type;
  String name;
  GamePadNativeInfo nativeInfo;
  late List<GamePadKeyMap> keyMaps;

  GamePad({
    required this.id,
    required this.index,
    required this.port,
    required this.type,
    required this.name,
    required this.nativeInfo,
  }) {
    keyMaps = getDefaultKeyMaps();
  }

  setKeyMaps(List<GamePadKeyMap> newKeyMaps) {
    keyMaps = newKeyMaps;
  }

  List<GamePadKeyMap> getDefaultKeyMaps() {
    final keyMaps = <GamePadKeyMap>[
      GamePadKeyMap(
        native: WFLGamePadNativeButton.A,
        retro: WFLGamePadRetroButton.A,
      ),
      GamePadKeyMap(
        native: WFLGamePadNativeButton.B,
        retro: WFLGamePadRetroButton.B,
      ),
      GamePadKeyMap(
        native: WFLGamePadNativeButton.Y,
        retro: WFLGamePadRetroButton.Y,
      ),
      GamePadKeyMap(
        native: WFLGamePadNativeButton.X,
        retro: WFLGamePadRetroButton.X,
      ),
      GamePadKeyMap(
        native: WFLGamePadNativeButton.DPAD_DOWN,
        retro: WFLGamePadRetroButton.DPAD_DOWN,
      ),
      GamePadKeyMap(
        native: WFLGamePadNativeButton.DPAD_LEFT,
        retro: WFLGamePadRetroButton.DPAD_LEFT,
      ),
      GamePadKeyMap(
        native: WFLGamePadNativeButton.DPAD_RIGHT,
        retro: WFLGamePadRetroButton.DPAD_RIGHT,
      ),
      GamePadKeyMap(
        native: WFLGamePadNativeButton.DPAD_UP,
        retro: WFLGamePadRetroButton.DPAD_UP,
      ),
      GamePadKeyMap(
        native: WFLGamePadNativeButton.L,
        retro: WFLGamePadRetroButton.L,
      ),
      GamePadKeyMap(
        native: WFLGamePadNativeButton.R,
        retro: WFLGamePadRetroButton.R,
      ),
      GamePadKeyMap(
        native: WFLGamePadNativeButton.START,
        retro: WFLGamePadRetroButton.START,
      ),
      GamePadKeyMap(
        native: WFLGamePadNativeButton.BACK,
        retro: WFLGamePadRetroButton.BACK,
      ),
    ];

    return List.from(keyMaps);
  }
}
