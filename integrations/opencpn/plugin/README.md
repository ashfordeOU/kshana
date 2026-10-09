# Kshana trust score panel (native OpenCPN plugin)

A floating panel inside OpenCPN: trust score (0-100), band, gate state, the top two reasons, the age of
the last sentence, and an alert (sound, and the panel opens) when trust becomes untrusted. It reads the
`$PKSHT` sentence from OpenCPN's own NMEA stream, so it needs no connection of its own: point an OpenCPN
connection at the gate output (see [`docs/MARINE-INTEGRATIONS.md`](../../../docs/MARINE-INTEGRATIONS.md)).

> **Advisory software**, not type-approved navigation equipment. The operator stays responsible for the
> safe navigation of the vessel. The panel is shown the same disclaimer.

## Status

* Builds and links against the OpenCPN plugin API header, version **1.22** declared, plugin declares API **1.18**
  (header vendored unmodified in `third_party/opencpn/`, source commit recorded there) and wxWidgets 3.2.
  The build check confirms the library exports `create_pi` and `destroy_pi` and that its undefined symbols are the
  OpenCPN host's.
* The panel's logic (`trust_state.h`) and the `$PKSHT` parser (`pksht.h`) are wx-free and unit-tested on sentences
  recorded from the synthetic demo.
* **Not yet run inside OpenCPN.** Nothing here loads it into a running OpenCPN, so the toolbar tool, the panel's
  appearance, preferences, and in particular that OpenCPN hands a proprietary `$PKSHT` sentence to
  `SetNMEASentence`, are unverified. Packaging for OpenCPN's plugin manager (catalog XML, per-platform builds) is
  not done. It ships only after it has been run in OpenCPN and has passed review.

## Build and test

```sh
cmake -S integrations/opencpn/plugin -B build-pi && cmake --build build-pi && ctest --test-dir build-pi
```

Needs CMake 3.16 or newer, a C++14 compiler and wxWidgets 3.0 or newer (Debian-family: `libwxgtk3.2-dev`).
`-DKSHANA_BUILD_PLUGIN=OFF` builds and tests only the wx-free core (`./run-tests.sh`), which needs no wxWidgets.
`-DOCPN_PLUGIN_HEADER_DIR=<dir>` builds against a different copy of `ocpn_plugin.h`. The result is
`libkshana_pi.so`; copy it to OpenCPN's plugin directory to try it.

## Behaviour

* Alarm level on the untrusted band, warn on degraded, with a hold in each direction (preferences: sentences at a
  worse level before it is shown, default 1; at a better level before it is lowered, default 10).
* "No current score" when no `$PKSHT` has arrived for the stale time (default 10 s, 0 = off).
* Calibration shows as calibrating and never alarms. The alert sounds once per entry into the alarm level.
* The plugin never changes a fix and never transmits. Marking a fix invalid is the gate, not this panel.

Licence: AGPL-3.0-only (the repository's), combined with the GPL-2.0-or-later OpenCPN plugin API header.
