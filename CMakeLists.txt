cmake_minimum_required(VERSION 3.16)

get_filename_component(ROOT ${CMAKE_CURRENT_SOURCE_DIR} NAME)
project(${ROOT} C CXX)

set(CMAKE_GENERATOR Ninja)

# cpp compiler settings
set(CMAKE_CXX_STANDARD 20)
set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
set(CMAKE_CXX_EXTENSIONS OFF)

# defines
if(WIN32)
  # add_compile_options(/fsanitize=address)
  set(CMAKE_MSVC_RUNTIME_LIBRARY "MultiThreaded$<$<CONFIG:Debug>:Debug>")
  add_compile_options(/Zc:__cplusplus) # see https://docs.microsoft.com/en-us/cpp/build/reference/zc-cplusplus?view=msvc-160 for detail

  # win10 or later, see https://docs.microsoft.com/en-us/cpp/porting/modifying-winver-and-win32-winnt?view=msvc-160
  add_compile_definitions(_WIN32_WINNT=0x0A00)
  add_compile_definitions(_UNICODE UNICODE _WINDOWS WIN32 WIN32_LEAN_AND_MEAN _SILENCE_CLANG_COROUTINE_MESSAGE)
endif()
add_compile_definitions(APP_NAME="${CMAKE_PROJECT_NAME}")

set(CMAKE_RUNTIME_OUTPUT_DIRECTORY ${CMAKE_BINARY_DIR}/bin)
list(APPEND CMAKE_MODULE_PATH ${CMAKE_CURRENT_LIST_DIR}/deps)

# setup dependencies
include(deps)

# our source code
add_subdirectory(src)