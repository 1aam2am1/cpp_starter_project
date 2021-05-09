add_executable(test_sdl main.cpp)

find_package(SDL2 REQUIRED)
target_include_directories(test_sdl PRIVATE ${sdl2_INCLUDE_DIRS})
target_link_libraries(test_sdl PRIVATE project_options ${sdl2_LIBRARIES})
