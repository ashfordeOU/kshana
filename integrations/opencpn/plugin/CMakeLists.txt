# SPDX-License-Identifier: GPL-3.0-or-later
# Kshana trust score panel for OpenCPN (plugin API 1.18, header vendored from the OpenCPN source
# tree at the commit recorded in third_party/opencpn/README.txt).
#
#   cmake -S . -B build && cmake --build build && ctest --test-dir build
#
# KSHANA_BUILD_PLUGIN=OFF builds and tests only the wx-free core (no wxWidgets needed).
# Advisory software, not type-approved equipment: the operator stays responsible.
cmake_minimum_required(VERSION 3.16)
project(kshana_pi VERSION 0.35.0 LANGUAGES CXX)

option(KSHANA_BUILD_PLUGIN "Build the OpenCPN plugin (needs wxWidgets 3.0 or newer)" ON)
set(OCPN_PLUGIN_HEADER_DIR "${CMAKE_CURRENT_SOURCE_DIR}/third_party/opencpn"
    CACHE PATH "Directory containing ocpn_plugin.h")

enable_testing()

# wx-free core and its tests: C++11, no dependencies.
foreach(t pksht trust_state)
  add_executable(${t}_test test/${t}_test.cpp)
  target_compile_features(${t}_test PRIVATE cxx_std_11)
  target_compile_options(${t}_test PRIVATE -Wall -Wextra)
  add_test(NAME ${t}
           COMMAND ${t}_test ${CMAKE_CURRENT_SOURCE_DIR}/../../signalk/test/fixtures/pksht-excerpt.nmea)
endforeach()

if(KSHANA_BUILD_PLUGIN)
  find_package(wxWidgets 3.0 REQUIRED COMPONENTS core base xml adv)
  include(${wxWidgets_USE_FILE})
  add_library(kshana_pi SHARED kshana_pi.cpp)
  target_compile_features(kshana_pi PRIVATE cxx_std_14)
  target_include_directories(kshana_pi PRIVATE ${OCPN_PLUGIN_HEADER_DIR} ${CMAKE_CURRENT_SOURCE_DIR})
  target_compile_definitions(kshana_pi PRIVATE DECL_EXP=)
  target_link_libraries(kshana_pi PRIVATE ${wxWidgets_LIBRARIES})
  set_target_properties(kshana_pi PROPERTIES PREFIX "lib" OUTPUT_NAME "kshana_pi")
  # Build check: the shared library must export the two entry points OpenCPN looks up.
  add_test(NAME plugin_exports
           COMMAND ${CMAKE_COMMAND} -DLIB=$<TARGET_FILE:kshana_pi>
                   -P ${CMAKE_CURRENT_SOURCE_DIR}/test/check_exports.cmake)
endif()
