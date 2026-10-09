---
name: evidence-pack
description: Create or verify a signed, tamper-evident evidence pack for a window of a vessel's GNSS trust record, using the Kshana engine. Use when the user wants a record of what the engine said about a log for an incident report, an insurer or an auditor, or wants to check that such a pack is intact and who signed it.
---

# Evidence pack

Use the `kshana` MCP server's `create_evidence_pack` and `verify_evidence_pack`. See
`/kshana-evidence-pack` for the step list; the format is in `docs/EVIDENCE-PACKS.md`.

Rules that apply every time:

- A pack is a **technical record**, not a legal opinion, a finding of fact about any event or a
  certification. It does not say what caused an event, who was responsible, or that the log
  shows what the receiver really received. The monitors are **MODELLED**; the output is advisory.
- Never ask for, return or log a signing seed. Without one the tool signs with a throwaway key
  (integrity, not identity). For a key that matters, make the pack with the command line.
- Verify against the signer's public key obtained by another route, and the full log if held.
  Without the key a pass proves only integrity against the key the pack names itself.
- Inputs are capped at 4 MiB; narrow the window if the reply is too large.
- Telemetry export (Prometheus, syslog, OpenTelemetry) is a command-line process
  (`kshana trust-telemetry`, `docs/TRUST-TELEMETRY.md`), not an MCP tool.
