---
description: Build a synthetic bridge-NMEA training scenario (jamming, position drag-off, time spoof, replay) with an instructor log, via the kshana-mcp server
argument-hint: "[the exercise, e.g. 'coastal approach, position drag-off at 20 min, recovery at 35 min, 12 kn']"
---

# Build a crew-training NMEA scenario

The user wants synthetic NMEA 0183 for a bridge-team exercise: a vessel track and a timeline
of scripted GNSS events, plus an instructor log saying what was injected and when. Use the
**Kshana engine** through the `kshana` MCP server.

Request: **$ARGUMENTS**

Do this:

1. Start from an example in `scenarios/training/` (`open-sea-jamming`, `coastal-drag-off`,
   `port-approach-time-spoof`, `combined-event`) and edit it to the request: waypoints, speed,
   rate-of-turn limits, a current, the start time and duration, and the `[[events]]` timeline
   (jamming, position drag-off, time spoof, replay delay, each with its recovery). Use only
   made-up positions, names and times.
2. Call **`generate_training_nmea`** with the TOML (and a `seed` for a different but repeatable
   run; the same seed gives the same bytes). Set `include_nmea: false` for the instructor log
   alone. The reply carries the first 2000 NMEA lines; for a longer run, or to stream to a TCP
   or UDP address, use the command line: `kshana nmea-scenario scenario.toml`.
3. Hand back the NMEA (or say where the file should go), the **instructor log** (what was
   injected when, with the true track) and the seed.
4. Say plainly: **text only**. Nothing here synthesises RF, IQ or any waveform, nothing is
   transmitted, and the stream is for training and testing, **never for a vessel's live
   navigation systems** (a marker sentence in the stream says so).
5. Offer to score the generated stream with `/kshana-assess-receiver`, which shows what the
   trust monitors make of the scripted events (the monitors are MODELLED, and a training
   stream says nothing about how they do on real interference).

If the `kshana` MCP tools aren't available, tell the user the server isn't connected and point
them at installation: `cargo install kshana-mcp` (or the `ghcr.io/ashfordeou/kshana-mcp` Docker
image), then `/plugin marketplace add ashfordeOU/kshana` and `/plugin install kshana@ashforde`.
