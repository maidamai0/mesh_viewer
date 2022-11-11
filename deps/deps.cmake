add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/glad)
add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/glfw)
add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/glm)
add_subdirectory(${CMAKE_CURRENT_LIST_DIR}/imgui)

add_library(deps INTERFACE)
target_link_libraries(deps INTERFACE glad glfw glm::glm imgui)