macro(run_conan)
  list(APPEND CMAKE_MODULE_PATH ${CMAKE_BINARY_DIR})
  list(APPEND CMAKE_PREFIX_PATH ${CMAKE_BINARY_DIR})

  # Download automatically, you can also just copy the conan.cmake file
  if(NOT EXISTS "${CMAKE_BINARY_DIR}/conan.cmake")
    message(STATUS "Downloading conan.cmake from https://github.com/conan-io/cmake-conan")
    file(DOWNLOAD "https://raw.githubusercontent.com/conan-io/cmake-conan/v0.16.1/conan.cmake"
      "${CMAKE_BINARY_DIR}/conan.cmake"
      EXPECTED_HASH SHA256=396e16d0f5eabdc6a14afddbcfff62a54a7ee75c6da23f32f7a31bc85db23484
      TLS_VERIFY ON)
  endif()

  include(${CMAKE_BINARY_DIR}/conan.cmake)

  conan_add_remote(
    NAME
    bincrafters
    URL
    https://api.bintray.com/conan/bincrafters/public-conan)

  conan_cmake_configure(
    REQUIRES
          ${CONAN_EXTRA_REQUIRES}
          catch2/2.13.3
          docopt.cpp/0.6.2
          fmt/6.2.0
          spdlog/1.5.0
    GENERATORS cmake_find_package
    OPTIONS ${CONAN_EXTRA_OPTIONS})

  conan_cmake_autodetect(settings)

  conan_cmake_install(PATH_OR_REFERENCE .
    BUILD missing
    SETTINGS ${settings})

endmacro()
