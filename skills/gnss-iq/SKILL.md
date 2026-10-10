---
name: gnss-iq
description: Work with GNSS IQ recordings using the Kshana engine: generate a synthetic scene, inspect a recording, acquire and track satellites, apply front-end filtering, and run lab-replay campaigns, inside the server's IQ work directory. Use when the user wants signal-level GNSS processing or a software-receiver test recording.
---

# GNSS IQ

Use the `kshana` MCP server's `iq_signals`, `iq_info`, `iq_scene`, `iq_acquire`, `iq_track`,
`iq_frontend`, `iq_sweep`, `iq_monitor`, `iq_labfit`, `iq_test_conditions`, `iq_campaign` and
`iq_campaign_status`. See `/kshana-iq` for the step list.

Rules that apply every time:

- Call `iq_signals` first. If the IQ tools are off, say why; do not look for another way to read
  files.
- No sample crosses the protocol. Paths are relative to the work directory; do not ask for
  absolute paths or try to reach outside it.
- Respect the sample budget. If a call is refused, narrow the span or lower the rate; do not
  split a call to dodge the budget.
- The layer processes recordings and writes synthetic scenes for software receivers. It
  transmits nothing and drives no radio hardware. Do not present a scene as a recording of a real
  signal.
- A monitor event says a measured quantity left its learned baseline. Do not name a cause, a
  jammer or a spoofer from it.
- `iq_labfit` and `iq_test_conditions` take text and touch no file; do not pass paths to them.
- Report what the tool measured, with the file it wrote, and say what it does not show.
