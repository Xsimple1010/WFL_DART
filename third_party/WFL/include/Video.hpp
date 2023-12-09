#ifndef VIDEO_H
#define VIDEO_H

#include "SDL2/SDL.h"
#include "glad/glad.h"
#include "LibretroClass.hpp"
#include "debug.hpp"
#include "videoDefs.hpp"
#include "WFL_GL/wflGl.hpp"

class VideoClass {
	public:
		void init(libretro_external_data* data, retro_game_geometry* geometry);
		bool setPixelFormat(unsigned format, libretro_external_data* data);
		void refreshVertexData();
		void resizeToAspect(double ratio, int sw, int sh, int* dw, int* dh);
		void videoRefresh(const void* data, unsigned width, unsigned height, unsigned pitch);
		void deinit();
	
};

#endif