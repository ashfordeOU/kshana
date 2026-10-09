---
name: vessel-receiver-trust
description: Assess whether a vessel's GNSS fix can be trusted from its NMEA 0183 stream or a receiver log, with a 0-100 score and the reasons, using the Kshana engine. Use when the user has a bridge NMEA log or excerpt, asks whether a position fix was spoofed or jammed, or wants the trust gate's behaviour on a stream.
---

# Vessel receiver trust

Use the `kshana` MCP server's `assess_receiver_log` (a whole log) or `assess_vessel_stream`
(an excerpt), or `assess_vessel_log` (a vessel's NMEA log). See `/kshana-assess-receiver` for the step list.

Rules that apply every time:

- State the vessel's limits (`[platform] kind = "vessel"`: speed, acceleration, turn rate,
  antenna height, whether a heading sensor is on the bus) **before** running, and do not
  change a threshold to fit a result.
- Report the score, the epoch counts by state, and the monitors that deducted, as the tool
  returned them. Do not invent figures.
- **Advisory only**: not type-approved navigation equipment (IEC 61108, IEC 61162); the
  operator is responsible. The monitors are **MODELLED**. A high score is not proof of a
  genuine fix: the checks cannot see a spoofer consistent with every other sensor on the bus.
- `receiver-trust live` with a gate or `--listen`, and the telemetry exporters, are long-running
  command-line processes; the MCP tool scores a bounded excerpt, applies no gate and writes to
  no port.
- Inputs go inline (4 MiB cap); a `path` is refused.
- Synthetic or user-owned data only. Do not name vessels or people in outputs.
