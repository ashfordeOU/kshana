---
name: training-nmea-scenario
description: Generate synthetic bridge NMEA 0183 with scripted GNSS jamming, position drag-off, time spoof or replay events, plus an instructor log, for crew training using the Kshana engine. Use when the user wants a training or exercise stream, test NMEA for an integrity monitor, or an instructor timeline.
---

# Training NMEA scenario

Use the `kshana` MCP server's `generate_training_nmea`. See `/kshana-training-scenario` for the
step list; four examples ship in `scenarios/training/`.

Rules that apply every time:

- **Text only.** No RF, IQ or waveform is synthesised and nothing is transmitted. The stream is
  for training and testing and must **never** be fed to a vessel's live navigation systems; a
  marker sentence in it says so. Kshana is advisory, not type-approved navigation equipment.
  Keep that warning and this statement with any file you hand over.
- Output is deterministic per seed; give the seed back with the stream.
- Return the instructor log (what was injected when, with the true track) with the NMEA.
- Use made-up positions and times. The reply is capped at 2000 NMEA lines; for longer runs or
  streaming to an address use `kshana nmea-scenario` on the command line.
- Scoring the stream with the trust monitors says how the MODELLED monitors react to the
  scripted events, not how they perform against real interference.
