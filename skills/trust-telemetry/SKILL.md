---
name: trust-telemetry
description: Render a Kshana GNSS trust stream or receiver-trust result as security telemetry text (Prometheus, CEF or LEEF syslog, OTLP). Use when someone wants the trust score in a monitoring or SIEM format, or a sample of what the exporters emit.
---

# Trust telemetry

Use the `kshana` MCP server's `trust_telemetry`. See `/kshana-trust-telemetry` for the step list
and `docs/TRUST-TELEMETRY.md` for the metric names, labels and the CEF/LEEF field mapping.

Rules that apply every time:

- The tool returns text and sends nothing. It does not serve `/metrics`, open a syslog or OTLP
  connection, or read a clock (syslog lines carry no timestamp). For a running exporter give the
  user the `kshana trust-telemetry` command instead; do not claim the tool delivered anything.
- The receiver-reported position stays out unless the user asks for `expose_position`.
- An input with satellite geometry (live schema 1.3, a 0.36 result) adds geometry series and a
  `class` label on `kshana_trust_reason_active` (CEF `cs6` geometry status and classes, `cfp3` HDOP,
  `cfp4` PDOP; LEEF `geoStatus`, `geoHdop`, `geoClass`, `geoSignalLoss`; from 0.36 inputs also the geometry
  label (`good`, `fair`, `poor`: never scored) in Prometheus `kshana_trust_geometry_label`, OTLP
  `kshana.geometry.label`, a third CEF `cs6` field and LEEF `geoLabel`, with VDOP and satellites
  used; a
  `signal_loss` gauge, since the status stays `degraded` when the signal, not the sky, was lost); suggest alerting on `class="inconsistency"` so a poor sky does not page as an
  attack. Lead with the geometry label: `poor` is the only label the score deducts for, and the
  status `degraded` also covers the informational `sky-blocked` case.
- Carry the caveat: advisory only, not type-approved navigation equipment (IEC 61108,
  IEC 61162), the operator remains responsible; a high score is not proof of a genuine fix.
  Evidence tier: MODELLED.
