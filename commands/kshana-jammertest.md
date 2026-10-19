---
description: Read the published Jammertest test plan as scheduled truth and score a receiver log against it (detection latency, missed alarms, false alarms, time to recover) via the kshana-mcp server
argument-hint: "[what to do, e.g. 'score this UBX log against the 2025 plan, test area 1' or 'turn Tuesday's plan into events for a log that starts 08:00 UTC']"
---

# Score a receiver log against the Jammertest schedule

The Norwegian Public Roads Administration publishes the Jammertest test catalogue and the
transmission plan as JSON (<https://github.com/NPRA/jammertest-plan>, MIT licence). Use the
`kshana` MCP server.

Request: **$ARGUMENTS**

1. Have the **catalogue JSON** text, the **plan JSON** text for each day the log covers, the
   **test area** the receiver was in, and the **log**. Do not fetch anything yourself: ask the
   user to paste the files or run `xval/jammertest-plan/fetch.sh` and paste from there. The log
   goes in at most 4 MiB; binary formats (`ubx`, `sbf`) as base64.
2. `jammertest_import` turns the plan into events (give `log_start_utc`; plan times are local, the
   default offset is +2 h, CEST). Use it to show the user which tests fall inside the log.
3. `jammertest_score` scores the log. `session_toml` needs only `[log] format = "ubx"` (or
   `rinex`, `android`, `nmea`, `sbf`). Report per test: outcome (`detected` within 10 s, `late`,
   `missed`, `not-evaluable`), latency, time to recover; then the false alarms outside every slot.

**Always say** the schedule is **scheduled truth**: planned slots, not recorded on-air times. A
slot may start late or never run, so a "missed" may be a test that did not transmit, and a latency
is measured from the planned start. The result is **MODELLED**; nothing here is validated against an
external oracle, and no organiser, agency or laboratory endorses it. Never call a receiver or a
result "conformant", "certified" or "compliant". A signed evidence pack needs a signing key: tell
the user to run `kshana jammertest score ... --key signer.key --out pack/` on the command line.
Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator
remains responsible. Details: `docs/JAMMERTEST.md`.

If the `kshana` MCP tools aren't available, tell the user the server isn't connected and point
them at installation: `cargo install kshana-mcp` (or the `ghcr.io/ashfordeou/kshana-mcp` Docker
image), then `/plugin marketplace add ashfordeOU/kshana` and `/plugin install kshana@ashforde`.
