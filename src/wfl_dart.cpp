#include "wfl_dart.h"
#include "vector"
#include <iostream>

using std::vector;

//FFI_PLUGIN_EXPORT
void FFI_PLUGIN_EXPORT wflDartInit(wfl_events events, wfl_paths paths) {
	wflInit(false, false, events, paths);
}

void FFI_PLUGIN_EXPORT wflDartLoadCore(const char* path) {
	wflLoadCore(path);
}

void FFI_PLUGIN_EXPORT wflDarLoadGame(const char* path) {
	wflLoadGame(path);
}

void FFI_PLUGIN_EXPORT wflDartSetController(wfl_game_pad gamePad) {
	wflSetGamePad(gamePad);
}

void FFI_PLUGIN_EXPORT wflDartStop() {
	wflDeinit();
}

void FFI_PLUGIN_EXPORT wflDartPause() {
	wflPause();
}

void FFI_PLUGIN_EXPORT wflDartReset() {
	wflReset();
}

void FFI_PLUGIN_EXPORT wflDartResume() {
	wflResume();
}

bool wflDartSaveState() {
	return wflSave();
}

bool wflDartLoadSaveState() {
	return wflLoadSave();
}

int FFI_PLUGIN_EXPORT wflDartGetKeyDown() {
	return WFlGetKeyDown();
}

wfl_dart_get_all_gamePads wflDartGetAllGamePads() {
	vector<wfl_device> devices = wflGetAllGamePads();

	const int size = devices.size();
	wfl_dart_get_all_gamePads response = {0};
	response.size = size;

	for (int i = 0; i < size; i++) {
		response.devices[i] = devices.at(i);
	}

	return response;
}

wfl_dart_get_connected_gamePads wflDartGetGamePadsConnected() {
	vector<wfl_game_pad> devices = wflGetGamePad();

	const int size = devices.size();
	wfl_dart_get_connected_gamePads response = {0};
	response.size = size;

	for (int i = 0; i < size; i++) {
		response.devices[i] = devices.at(i);
	}

	return response;
}

//==============
int main(int argc, char* argv[]) {
    return 0;
}
