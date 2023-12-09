#ifndef LIBRETRO_CLASS_H
#define LIBRETRO_CLASS_H

#include "libretro.h"
#include "SDL2/SDL.h"
#include "videoDefs.hpp"
#include "debug.hpp"
#include "CpuFeatures.hpp"

#define load_sym(V, S) do {\
    if (!((*(void**)&V) = SDL_LoadFunction(retroFunctions.handle, #S))) \
        die("Failed to load symbol '" #S "'': %s", SDL_GetError()); \
	} while (0)
#define load_retro_sym(S) load_sym(retroFunctions.S, S)

static struct {
	void* handle;
	bool initialized;

	bool supports_no_game;
	struct retro_perf_counter* perf_counter_last;

	void (*retro_run)(void);
	void (*retro_init)(void);
	void (*retro_reset)(void);
	bool (*retro_load_game)(const struct retro_game_info* game);
	void (*retro_deinit)(void);
	void (*retro_unload_game)(void);

	unsigned (*retro_api_version)(void);
	void (*retro_get_system_info)(struct retro_system_info* info);
	void (*retro_get_system_av_info)(struct retro_system_av_info* info);
	void (*retro_set_controller_port_device)(unsigned port, unsigned device);
} retroFunctions = { 0 };


typedef void resize_to_aspect_t(double ratio, int sw, int sh, int* dw, int* dh);

struct core_event_functions {
	retro_audio_sample_t audioSample;
	retro_audio_sample_batch_t audioSampleBatch;
	retro_video_refresh_t videoRefresh;
	retro_input_state_t inputState;
	retro_input_poll_t inputPoll;
	resize_to_aspect_t* resizeToAspect;
	refresh_vertex_data_t* refreshVertexData;
	video_set_pixel_format_t* setPixelFormat;

};

struct libretro_external_data {
	struct retro_audio_callback audioCallback;
	struct retro_frame_time_callback runLoopFrameTime;
	g_video_t gVideo;
	retro_usec_t runLoopFrameTimeLast;
	g_scale_t gScale;
	SDL_Window* window = NULL;
};


static bool environment(unsigned cmd, void* data);
static retro_variable* g_vars = NULL;


class Libretro
{
	public:
		Libretro(core_event_functions* eventFunctions, libretro_external_data* externalData);
		~Libretro();

		void coreLoad(const char* coreFile);
		retro_system_av_info loadGame(const char* gameFile);
		retro_system_info getSystemInfo();
		void setControllerPortDevice(unsigned port, unsigned device);
		void run();
};


#endif // !LIBRETRO_CLASS.H

