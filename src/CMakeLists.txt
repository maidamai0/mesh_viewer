file(GLOB srcs *.cpp)
if(WIN32)
    set(CMAKE_WIN32_EXECUTABLE TRUE)
endif()

add_executable(${CMAKE_PROJECT_NAME} ${srcs})
target_link_libraries(${CMAKE_PROJECT_NAME} deps)