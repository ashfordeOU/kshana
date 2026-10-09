#!/bin/sh
# SPDX-License-Identifier: GPL-3.0-or-later
# Build and run the wx-free core tests (needs only CMake and a C++11 compiler). To build the plugin
# as well, run cmake yourself with KSHANA_BUILD_PLUGIN=ON (the default); see CMakeLists.txt.
set -eu
here="$(cd "$(dirname "$0")" && pwd)"
build="$(mktemp -d)"
trap 'rm -rf "$build"' EXIT
cmake -S "$here" -B "$build" -DKSHANA_BUILD_PLUGIN=OFF >/dev/null
cmake --build "$build" >/dev/null
ctest --test-dir "$build" --output-on-failure
