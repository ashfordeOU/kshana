---
name: test-bench-export
description: Export a Kshana scenario's vehicle motion and events (motion CSV, NMEA, waypoints, events) for replay through a laboratory GNSS simulator, then score the receiver under test. Use when a receiver maker or tester wants a scenario's motion and event times for a simulator.
---

# Test-bench export

Use the `kshana` MCP server's `export_test_bench`. See `/kshana-bench-export` for the step list
and `docs/TEST-BENCH.md` for the method.

Rules that apply every time:

- **No signal.** The export is vehicle motion and labelled event intervals only. Nothing in it is,
  models or drives a radio-frequency or baseband signal, and an event is not a recipe for
  producing interference. Give the reply's `notice` with the files.
- The simulator and its operator supply the signals and are responsible for running them only
  where authorised. Do not advise otherwise.
- Applies to `gnss-ins`, `jamming` and `gnss-sim`; another kind is refused with a reason.
- The tool returns text; it writes nothing. Do not write the files to disk yourself unless the
  user asks.
- `epoch` is a UTC instant `YYYY-MM-DDTHH:MM:SS`; the same scenario and epoch give byte-identical
  files.
- Kshana publishes no results from bench runs; do not present any.
