#include "wfl_dart.h"

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

//==============
int main(int argc, char* argv[]) {
    return 0;
}
