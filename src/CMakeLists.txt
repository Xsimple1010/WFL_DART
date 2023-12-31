# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)
set(CMAKE_POSITION_INDEPENDENT_CODE ON)
project(wfl_dart_library VERSION 0.0.1 LANGUAGES CXX)

set(WFL_ROOT "../third_party/WFL/")

message(${WFL_ROOT}src/Audio.cpp)

add_library(wfl_dart SHARED
  "wfl_dart.cpp"
  ${WFL_ROOT}src/WFL.cpp
  ${WFL_ROOT}src/WFL_GL/wflGl.cpp
  ${WFL_ROOT}src/Audio.cpp
  ${WFL_ROOT}src/gamePad.cpp
  ${WFL_ROOT}src/cpuFeatures.cpp
  ${WFL_ROOT}src/debug.cpp
  ${WFL_ROOT}src/glad.c
  ${WFL_ROOT}src/wfl_file.cpp
  ${WFL_ROOT}src/stateNotifier.cpp
  ${WFL_ROOT}src/libretroClass.cpp
  ${WFL_ROOT}src/Video.cpp
  ${WFL_ROOT}src/threads/threadIoEvents.cpp
  ${WFL_ROOT}src/threads/threadGameLoop.cpp
  ${WFL_ROOT}src/gameLoop.cpp

  ${WFL_ROOT}include/gamecontrollerdb.txt
  ${WFL_ROOT}include/WFL.h
  ${WFL_ROOT}include/WFLdefs.hpp
  ${WFL_ROOT}include/videoDefs.hpp
  ${WFL_ROOT}include/libretro.h
)

set_target_properties(wfl_dart PROPERTIES
  PUBLIC_HEADER wfl_dart.h
  OUTPUT_NAME "wfl_dart"
)

find_package(SDL2 REQUIRED)
set_property(TARGET wfl_dart PROPERTY CXX_STANDARD 17)

target_include_directories(wfl_dart 
  PUBLIC ${SDL2_INCLUDE_DIRS}
  PUBLIC ${WFL_ROOT}include/
)

link_libraries(${WFL_ROOT}include/glad/glad.h ${WFL_ROOT}src/glad.c)

target_link_libraries(wfl_dart PUBLIC ${SDL2_LIBRARIES} SDL2::SDL2 SDL2::SDL2main)

target_compile_definitions(wfl_dart PUBLIC DART_SHARED_LIB)