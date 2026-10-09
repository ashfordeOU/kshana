---
description: Create and verify a signed evidence pack for a window of a vessel's GNSS trust record (hashes, hash chain, Ed25519 signature) via the kshana-mcp server
argument-hint: "[what to record or check, e.g. 'pack the drag-off between 100 s and 300 s of this log' or 'verify this pack against the signer's key']"
---

# Create or verify an evidence pack

An evidence pack is a signed, tamper-evident record of what the **Kshana engine** computed
from a vessel's NMEA log between two times: the raw log bytes for the window, the
configuration with every threshold, the per-epoch results and reasons, a summary page and a
manifest with every file's SHA-256, a hash chain and an Ed25519 signature. Use the `kshana` MCP
server.

Request: **$ARGUMENTS**

**Create** (`create_evidence_pack`)

1. Have the session TOML (`[platform] kind = "vessel"` with the vessel's limits, as for
   `/kshana-assess-receiver`), the NMEA log (at most 4 MiB) and the window in seconds since the
   log's first epoch (`from_s`, `to_s`). Assess the log first so the window is the interesting
   one.
2. Call the tool. The reply holds `files` (a JSON object you can hand to the user as a
   directory: `manifest.json`, `manifest.sig`, `epochs.json`, `config.json`, `summary.html`,
   `log-slice.bin`), the signer's public key and fingerprint, and the epochs in the window.
3. **Signing key.** The tool never returns or logs a signing seed. With no
   `signing_key_seed_hex` it signs with a one-time key that is discarded, so the pack proves
   the record is intact but not who made it. Do **not** ask the user to paste a private key into
   the conversation: for a key that matters, make the pack on the command line
   (`kshana evidence keygen`, then `kshana receiver-trust evidence session.toml --from ... --to ...
   --key signer.key --out pack/`) and use this tool only to verify.

**Verify** (`verify_evidence_pack`)

1. Pass the pack's `files` (a string, `{"utf8": ...}` or `{"base64": ...}` per file), the
   signer's **public key** (64 hex digits, obtained from the signer by another route) and, if
   held, the full log text.
2. Report `ok`, each failure by code and file, and `signer_pinned`. Without a public key a
   pass proves only that the pack is intact against the key it names itself, which anyone can
   generate; say so.

**Always say** a pack is a **technical record** of what the engine computed from a log under
stated settings. It is not a legal opinion, not a finding of fact about any event, and not a
certification; it does not say what caused an event, who was responsible, or that the log shows
what the receiver really received. The trust monitors are **MODELLED** and advisory. Details:
`docs/EVIDENCE-PACKS.md`. Telemetry export (Prometheus, syslog, OpenTelemetry) is a
command-line process: `docs/TRUST-TELEMETRY.md`.

If the `kshana` MCP tools aren't available, tell the user the server isn't connected and point
them at installation: `cargo install kshana-mcp` (or the `ghcr.io/ashfordeou/kshana-mcp` Docker
image), then `/plugin marketplace add ashfordeOU/kshana` and `/plugin install kshana@ashforde`.
