---
description: Assess a GNSS receiver log or a vessel's NMEA stream for trust with the Kshana engine (0-100 score and reasons, advisory), via the kshana-mcp server
argument-hint: "[what to assess, e.g. 'this NMEA excerpt from a ferry, limits 22 kn, gyro heading present']"
---

# Assess a receiver log or a vessel stream for trust

The user has a receiver log or an NMEA 0183 stream and wants to know whether, and when, the
receiver stopped being trustworthy. Use the **Kshana engine** through the `kshana` Model Context
Protocol (MCP) server; do not estimate it by reading the log yourself.

Request: **$ARGUMENTS**

Do this:

1. Decide which tool fits.
   - A whole log in a static or vessel setting (u-blox UBX, RINEX 3, Android GnssLogger or
     NMEA): **`assess_receiver_log`**. Build a `receiver-trust` scenario in TOML with the log
     inline (`text` or `base64`; a `path` is refused, and the input is capped at 4 MiB). Add
     `[platform] kind = "vessel"` with the vessel's own limits (`max_speed_kn`,
     `max_accel_mps2`, `max_turn_rate_dps`, `antenna_height_m`, `heading_sensor`) for the
     moving-vessel monitors and the 0-100 trust score with the monitors that took points off.
   - A stream excerpt, with or without the gate: **`assess_vessel_stream`** (a live session
     TOML with `[platform] kind = "vessel"`, plus the NMEA text). It replays the excerpt through
     the engine behind `kshana receiver-trust live`; with `gate: true` it also returns the stream
     the gate would have forwarded (fix marked invalid while untrusted).
2. State the vessel's limits before the run and do not tune a threshold after seeing the result.
   If the user has not given the limits, ask, or use the documented defaults and say so.
3. Report: the epoch counts by state (calibrating, nominal, degraded, untrusted), the lowest
   score, when the score first fell and **which monitors took points off** (`kinematic`,
   `heading-course`, `speed-log`, `sea-level`, `cn0-spread`, `cn0-rise`, `time-consistency`,
   and so on), with the log's SHA-256 and the scenario so the run is reproducible. Do not
   invent numbers the tool did not return.
4. Keep the caveats. This is **advisory**: Kshana is not type-approved navigation equipment
   (IEC 61108, IEC 61162) and the operator remains responsible for the vessel. The trust
   monitors are **MODELLED**. The checks cannot see a spoofer whose fix is consistent with
   everything else on the bus (the vessel's other sensors); say so when the score stays high.
5. `receiver-trust live` as a running process (stdin, a followed file, TCP or UDP, the gate on
   a live stream, `--listen`) is command-line only: `kshana receiver-trust live session.toml
   --file log.nmea --gate`. Point the user at `docs/MARITIME-TRUST.md` for it.

If the `kshana` MCP tools aren't available, tell the user the server isn't connected and point
them at installation: `cargo install kshana-mcp` (or the `ghcr.io/ashfordeou/kshana-mcp` Docker
image), then `/plugin marketplace add ashfordeOU/kshana` and `/plugin install kshana@ashforde`.
