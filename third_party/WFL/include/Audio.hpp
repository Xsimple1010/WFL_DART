#ifndef AUDIO_H
#define AUDIO_H

#include"libretro.h"
#include<SDL2/SDL_audio.h>
#include"debug.hpp"

bool audioInit(int frequency);
void audioDeinit();
size_t audioWrite(const int16_t* buffer, size_t frames);

#endif // !AUDIO_H
