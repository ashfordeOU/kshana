---
description: Render a GNSS trust stream or a receiver-trust result as Prometheus text, CEF or LEEF syslog lines or an OTLP payload via the kshana-mcp server
argument-hint: "[format: prometheus, cef, leef or otlp, and the trust stream or result to render]"
---

# Trust telemetry for a security operations centre

A vessel's GNSS trust (score 0-100, band, reasons) can feed a monitoring or SIEM pipeline.
Use the `kshana` MCP server; its `trust_telemetry` tool runs the same encoders as
`kshana trust-telemetry` (`docs/TRUST-TELEMETRY.md`) and returns text.

Request: **$ARGUMENTS**

1. Have the input as text: the per-epoch stream (JSON lines: `t_s`, `state`, `score`,
   `deductions`, `alarms`, `gate`) or a `receiver-trust` result document. For the stream, call the
   `assess_vessel_stream` or `assess_vessel_log` tool first if the user has only a log.
2. Call `trust_telemetry` with `input`, `format` (`prometheus`, `cef`, `leef` or `otlp`) and
   `input_kind` (`jsonl`, the default, or `result`). Optional: `host` (the sender's name in
   syslog events), `syslog_all` (one event per epoch instead of one per band change),
   `expose_position` (adds the receiver-reported position; off by default, say why before
   turning it on) and `unix_nano` (the export time of an `otlp` payload).
3. The reply is the text. Syslog lines carry no timestamp because no clock is read. A stream
   line that does not parse is skipped and counted in `kshana_trust_input_errors_total`.
4. Nothing is sent, served or written. Running exporters (a `/metrics` endpoint, a syslog
   connection, OTLP delivery) are a process: for those give the user the command, for example
   `kshana receiver-trust live session.toml --stdin | kshana trust-telemetry --print-syslog`.
5. State the caveat with the output: advisory only; Kshana is not type-approved navigation
   equipment (IEC 61108, IEC 61162) and the operator remains responsible. Evidence tier:
   MODELLED.
