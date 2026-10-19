---
name: jammertest
description: Read the published Jammertest test plan as scheduled truth and score a GNSS receiver log against it, using the Kshana engine. Use when the user has a log recorded at a Jammertest event, or wants the plan turned into receiver-trust events, and asks how quickly, how often and how cleanly the trust monitors reacted.
---

# Jammertest scoring

Use the `kshana` MCP server's `jammertest_import` and `jammertest_score`. See `/kshana-jammertest`
for the step list; the method and the pre-registered bars are in `docs/JAMMERTEST.md`.

Rules that apply every time:

- The schedule is **scheduled truth**: planned slots, not recorded on-air times. A "missed" can be
  a test that never ran; a latency is from the planned start.
- Results are **MODELLED**. Say "measured against the schedule", never "validated", "conformant",
  "certified" or "compliant"; claim no endorsement by the organisers or any agency.
- Do not fetch the plan or a dataset yourself, and never paste third-party datasets (the JammerTest
  2024 logs are GPL-3, the 2025 NMEA set is behind a subscription): the user supplies the files.
- Plan times are local; the default offset is +2 h (CEST). A log whose start is not UTC needs
  `log_start_utc`.
- A signed pack needs a key: use the command line, never ask for a seed in the conversation.
