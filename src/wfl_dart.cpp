#include "wfl_dart.h"

static VideoClass video;
static bool running = true;
static SDL_Event event;


FFI_PLUGIN_EXPORT intptr_t sum(intptr_t a, intptr_t b) { return a + b; }


FFI_PLUGIN_EXPORT intptr_t sum_long_running(intptr_t a, intptr_t b) {
  // Simulate work.

  SDL_Window* window = NULL;
  SDL_Surface* screenSurface = NULL;

  if (SDL_Init(SDL_INIT_VIDEO) < 0) {
      printf("SDL could not initialize! SDL_Error: %s\n", SDL_GetError());
  } else {
      window = SDL_CreateWindow("Janela SDL", SDL_WINDOWPOS_UNDEFINED, SDL_WINDOWPOS_UNDEFINED, 640, 480, SDL_WINDOW_SHOWN);
      if (window == NULL) {
          printf("Window could not be created! SDL_Error: %s\n", SDL_GetError());
      } else {
          screenSurface = SDL_GetWindowSurface(window);
          SDL_FillRect(screenSurface, NULL, SDL_MapRGB(screenSurface->format, 0xFF, 0xFF, 0xFF));
          SDL_UpdateWindowSurface(window);
          SDL_Delay(2000);
      }
  }

  SDL_DestroyWindow(window);
  SDL_Quit();

  #if _WIN32
    Sleep(5000);
  #else
    usleep(5000 * 1000);
  #endif

  

  return a + b;
}
