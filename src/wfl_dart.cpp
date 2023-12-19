#include "wfl_dart.h"

//FFI_PLUGIN_EXPORT
void FFI_PLUGIN_EXPORT wflDartInit(controller_events events, wfl_paths paths) {
	wflInit(false, events, paths);
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
	wflStop();
}

//==============
int main(int argc, char* argv[]) {
    return 0;
}
