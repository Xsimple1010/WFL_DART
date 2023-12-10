#if _WIN32
#include <windows.h>
#else
#include <pthread.h>
#include <unistd.h>
#endif

#if _WIN32
#define FFI_PLUGIN_EXPORT __declspec(dllexport)
#else
#define FFI_PLUGIN_EXPORT
#endif

#include "SDL.h"

//wfl includes
#include "controllerDefs.hpp"
#include "Controller.hpp"
#include "LibretroClass.hpp"
#include "debug.hpp"
#include "CpuFeatures.hpp"
#include "Audio.hpp"
#include "Video.hpp"

extern "C" void FFI_PLUGIN_EXPORT wflSetCallbacks(controller_events events);

extern "C" void FFI_PLUGIN_EXPORT wflInit();

extern "C" void FFI_PLUGIN_EXPORT wflLoadCore(const char* path);

extern "C" void FFI_PLUGIN_EXPORT wflLoadGame(const char* path);

extern "C" void FFI_PLUGIN_EXPORT wflUnloadGame();

extern "C" void FFI_PLUGIN_EXPORT wflSetController(controller_device device);

void FFI_PLUGIN_EXPORT wflDeinit();