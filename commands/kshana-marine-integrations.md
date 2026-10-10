---
description: How to put the Kshana vessel trust score into Signal K and OpenCPN (how-to only; no tool calls), with the caveats that go with it
argument-hint: "[what the user runs, e.g. 'Signal K server on a Raspberry Pi' or 'OpenCPN on a laptop']"
---

# Kshana trust score in Signal K and OpenCPN

The user wants the vessel's 0-100 GNSS trust score (and the reasons for it) on software boaters
already run. This is a **how-to**: nothing here calls an MCP tool, and nothing here installs or
runs anything on the user's behalf. Read `docs/MARINE-INTEGRATIONS.md` and answer from it; the
code is under `integrations/` (`signalk/`, `opencpn/`) and `deploy/reference-build/`.

Request: **$ARGUMENTS**

Do this:

1. Say what each piece is and how far it has been tested, as `docs/MARINE-INTEGRATIONS.md`
   states it: the **Signal K plugin** (`integrations/signalk/`, no npm dependencies, Node 18 or
   newer, not published to npm), **OpenCPN through gate-mode NMEA over TCP**
   (`kshana receiver-trust live session.toml --gate --listen tcp:10110`), the OpenCPN
   score-panel plugin, and the reference build (parts, OS steps, systemd units, a container
   option; not tested on a vessel).
2. For Signal K: copy or link the plugin into the server's `node_modules`, enable **Kshana GNSS
   trust**, and choose where epochs come from (`spawn-signalk-nmea`, `spawn-args`, `tcp-json`
   or `tcp-pksht`). It publishes `navigation.gnss.kshana.*` (band, score, reasons, alarms,
   gate, reported position) and raises `notifications.navigation.gnss.kshanaTrust`. It never
   writes `navigation.position` and never gates a fix.
3. For OpenCPN: the recommended path is the direct gate connection above; the relay in
   `integrations/opencpn/` is the alternative. Say plainly that the gate marks a fix invalid
   while the score is untrusted, and that it is off unless asked for.
4. Start the monitor **before** the voyage: a stream already being spoofed when the monitor
   first connects has no clean baseline (the first `calibration_s` seconds are never scored).
   The vessel's limits go in the session file and are stated before the run.
5. Keep the caveats with every answer: **advisory**; Kshana is not type-approved navigation
   equipment (IEC 61108, IEC 61162) and has not been assessed against any performance standard;
   the operator remains responsible for the vessel; the monitors are **MODELLED**; the checks
   cannot see a spoofer whose fix is consistent with everything else on the bus. Nothing here
   transmits and nothing makes a fix more accurate.
6. `receiver-trust live`, the gate and `--listen` are command-line processes, so they are not
   MCP tools; to score a log or an excerpt in this conversation use `/kshana-assess-receiver`.
   Prometheus, syslog and OpenTelemetry export is `kshana trust-telemetry`
   (`docs/TRUST-TELEMETRY.md`).

Use made-up hosts and addresses in examples (the documentation range `192.0.2.0/24`).
