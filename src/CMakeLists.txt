# The Flutter tooling requires that developers have CMake 3.10 or later
# installed. You should not increase this version, as doing so will cause
# the plugin to fail to compile for some customers of the plugin.
cmake_minimum_required(VERSION 3.10)

project(wfl_dart_library VERSION 0.0.1)

set(WFL_ROOT "../third_party/WFL/")
message(${WFL_ROOT})

include(
  "C:/Projetos/wfl_dart/third_party/WFL/sources.cmake"
)

# message(${WFL_SOURCES})

add_library(wfl_dart SHARED
  "wfl_dart.cpp"
  ${WFL_SOURCES}
)

set_target_properties(wfl_dart PROPERTIES
  PUBLIC_HEADER wfl_dart.h
  OUTPUT_NAME "wfl_dart"
)

find_package(SDL2 REQUIRED)

target_include_directories(wfl_dart 
  PUBLIC ${SDL2_INCLUDE_DIRS}

  PRIVATE ${WFL_ROOT}include/
)

link_libraries(${WFL_ROOT}include/glad/glad.h ${WFL_ROOT}src/glad.c)

target_link_libraries(wfl_dart PUBLIC ${SDL2_LIBRARIES} SDL2::SDL2 SDL2::SDL2main)
target_compile_definitions(wfl_dart PUBLIC DART_SHARED_LIB)