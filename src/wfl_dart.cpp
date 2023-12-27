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

void FFI_PLUGIN_EXPORT wflDartSetController(controller_device device) {
	wflSetController(device);
}

void FFI_PLUGIN_EXPORT wflDartStop() {
	wflDeinit();
}

void FFI_PLUGIN_EXPORT wflDartPause() {
	wflPause();
}

void FFI_PLUGIN_EXPORT wflDartResume() {
	wflResume();
}

wfl_dart_find_controller wflDartFindControllers() {
	vector<wfl_joystick> joysticks = wflGetConnectedJoysticks();

	const int size = joysticks.size();
	wfl_dart_find_controller response = {0};
	response.size = size;

	for (int i = 0; i < size; i++) {
		response.joysticks[i] = joysticks.at(i);
	}

	return response;
}

//==============
int main(int argc, char* argv[]) {
    return 0;
}
