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

//wfl includes
#include "gamePadDefs.hpp"
#include "WFLdefs.hpp"
#include "WFL.h"
#include "SDL.h"

struct wfl_dart_get_all_gamePads {
    size_t size;
    wfl_device devices[30];
};


struct wfl_dart_get_connected_gamePads {
    size_t size;
    wfl_game_pad devices[30];
};

EXTERN_C void FFI_PLUGIN_EXPORT wflDartInit(wfl_events events, wfl_paths paths);

EXTERN_C void FFI_PLUGIN_EXPORT wflDartLoadCore(const char* path);

EXTERN_C void FFI_PLUGIN_EXPORT wflDarLoadGame(const char* path);

EXTERN_C void FFI_PLUGIN_EXPORT wflDartSetController(wfl_game_pad device);

EXTERN_C void FFI_PLUGIN_EXPORT wflDartStop();

EXTERN_C void FFI_PLUGIN_EXPORT wflDartPause();

EXTERN_C void FFI_PLUGIN_EXPORT wflDartResume();

EXTERN_C int FFI_PLUGIN_EXPORT wflDartGetKeyDown();

EXTERN_C wfl_dart_get_all_gamePads FFI_PLUGIN_EXPORT wflDartGetAllGamePads();

EXTERN_C wfl_dart_get_connected_gamePads FFI_PLUGIN_EXPORT wflDartGetGamePadsConnected();


