---
description: Export a scenario's vehicle motion and events for a laboratory GNSS simulator (motion CSV, NMEA, waypoints, events) via the kshana-mcp server
argument-hint: "[scenario to export, e.g. 'the automotive-urban-canyon example, epoch 2025-03-01T10:00:00Z']"
---

# Export a scenario for a laboratory GNSS simulator

A receiver maker with a laboratory GNSS simulator can replay a Kshana scenario's vehicle motion
through it, record the receiver under test, and score that log with `receiver-trust` against
events stated before the run (`docs/TEST-BENCH.md`). Use the `kshana` MCP server.

Request: **$ARGUMENTS**

1. Have a scenario of kind `gnss-ins` (its navigation-state outages are the events), `jamming` or
   `gnss-sim`. `get_example_scenario` has examples (`automotive-urban-canyon`, `gnss-ins`).
   Another kind is refused with the reason: say it.
2. Call `export_test_bench` with the scenario `toml` and, if wanted, `epoch`, the UTC instant of
   motion time zero (`YYYY-MM-DDTHH:MM:SS`; the default is 2024-01-01T00:00:00Z, because the
   scenarios carry no calendar date of their own).
3. The first reply item is a JSON index (`files` with suffix, bytes and SHA-256; `notes` on any
   file left out; `notice`); the files follow in index order: `.motion.csv`, `.motion.json`,
   `.nmea`, `.events.csv`, `.events.toml` and, on a millisecond-regular grid, `.waypoints.txt`.
   Nothing is written to disk. Hand the files to the user as text to save; do not write them
   yourself.
4. Give the `notice` with the files: **no signal is written.** Nothing exported is, models or
   drives a radio-frequency or baseband signal; an event is a labelled interval, not a recipe for
   producing interference. The simulator and its operator supply the signals and must run them
   only where authorised (conducted or shielded, per the simulator's own safety instructions).
5. Heading in the motion file is the body's yaw, not the direction of travel; the NMEA course is
   the course over ground. Say so if the user's simulator reads one and not the other.
6. To score the receiver's recorded log against the events, see `/kshana-assess-receiver`;
   `docs/TEST-BENCH.md` has the method. Kshana publishes no results from such runs.
