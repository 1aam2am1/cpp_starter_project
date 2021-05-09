include(FetchContent)
set(DNANA_CMAKE_SHARED_LIB TRUE CACHE BOOL "" FORCE)
FetchContent_Declare(
        Nana
        GIT_REPOSITORY https://github.com/cnjinhao/nana.git
        GIT_TAG v1.6.2)

# ExternalProject_Get_Property(Nana NANA_INCLUDE_DIR)
FetchContent_MakeAvailable(Nana)

add_executable(test_nana main.cpp)
target_link_libraries(
        test_nana
        PRIVATE
        project_options
        nana)
