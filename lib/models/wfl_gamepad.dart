import 'package:wfl_dart/models/key_maps.dart';

class JoyStick {
  final int id;

  final int index;

  final String name;

  JoyStick({
    required this.id,
    required this.index,
    required this.name,
  });
}

class GamePad {
  final int id;
  final String name;

  final _defaultGamePadKeyMaps = List<GamePadKeyMap>.empty();
  GamePad({
    required this.id,
    required this.name,
  });

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

    _defaultGamePadKeyMaps.addAll(keyMaps);

    return _defaultGamePadKeyMaps;
  }
}
