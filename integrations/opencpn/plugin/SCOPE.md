# Native OpenCPN plugin (score panel): scope and status

**Status: follow-on. Not shipped in 0.35.** What exists is the tested core. The plugin shell does
not exist yet because it cannot be built or tested in this repository's CI (it needs the OpenCPN
plugin API headers and wxWidgets, which the repository does not carry).

> Advisory software, not type-approved navigation equipment. The operator stays responsible.

## What is done and tested

`pksht.h`: header-only C++11 parser for the `$PKSHT` sentence (checksum, format version 1,
band, gate, score, reasons), no wxWidgets and no OpenCPN headers. `test/pksht_test.cpp` runs it
over sentences recorded from the synthetic demo and over corrupted, wrong-version and
wrong-sentence input. `./run-tests.sh` builds it with any C++11 compiler (checked with g++ and
clang++).

## What the shell has to do

1. Declare `WANTS_NMEA_EVENTS` (or the sentence callback of the API version targeted) and in
   `SetNMEASentence` pass lines starting `$PKSHT` to `kshana::parse_pksht`.
2. A dockable window: score as a large number, band colour (nominal / degraded / untrusted /
   calibrating), gate state, the top reasons, age of the last sentence, and a stale indicator
   when none has arrived for a configurable time.
3. Optional audible alert on entering the untrusted band, configurable and off by default.
4. Build with the OpenCPN plugin template (CMake, wxWidgets), package per the OpenCPN plugin
   manager, and test on the three desktop platforms.

## Why it is not in 0.35

The shell is unbuilt and untested here, and there is no way to review a wx UI without building
it. Meanwhile OpenCPN already shows what matters to a navigator without a plugin: with the gate
(see [`docs/MARINE-INTEGRATIONS.md`](../../../docs/MARINE-INTEGRATIONS.md)) it sees an invalid fix
and raises its own alarm, and `$PKSHT` is visible in its NMEA debug window.
