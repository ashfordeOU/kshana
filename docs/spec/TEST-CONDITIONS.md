<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# `kshana.test-conditions/1`: what a laboratory states about a test

Status: published specification, version 1. The JSON Schema is
[test-conditions.schema.json](test-conditions.schema.json). A licence for this text and the
schema is proposed in [../drafts/LICENSES-SPLIT.md](../drafts/LICENSES-SPLIT.md) and is not
yet decided; until it is, the repository licence applies.

A test-conditions document records the **known truth** of one laboratory test: which events
(interference, spoofing, an outage) the laboratory states it applied, when, and what it says
about their power, plus a hash-pinned pointer to the recording or receiver log that came
out of it. It is **metadata only**. It describes no signal, synthesises none and cannot
drive a transmitter; an event is a labelled time interval, not a recipe for producing
interference.

Two things use it today:

- `kshana iq campaign` / `kshana iq labfit` read it for sample recordings (`recording.kind`
  absent or `"iq"`), as they have since 0.34.
- `kshana bench-export` writes one (`<base>.conditions.json`) for a `receiver-log`
  recording, and `kshana evidence round-trip` links it to the scenario, the log and the
  score ([../TEST-BENCH.md](../TEST-BENCH.md), section 6).

## Document

TOML or JSON (JSON when the first non-blank character is `{`). Unknown keys are errors.
Times are seconds from the first sample of the recording or the first epoch of the log.

| Key | Required | Meaning |
|---|---|---|
| `schema` | yes | the string `kshana.test-conditions/1` |
| `recording.id` | yes | identifier, the label in every output |
| `recording.kind` | no | `iq` (default) or `receiver-log` |
| `recording.path` | yes | the recording or log, relative to the document |
| `recording.sha256` | no | SHA-256 (hex) of the recording; a mismatching file is refused |
| `recording.format`, `sample_rate_hz`, `center_hz`, `if_hz`, `header_bytes` | no | raw IQ description; `format` and `sample_rate_hz` come together |
| `recording.start_utc` | no | time of the first sample, ISO 8601, carried into outputs only |
| `recording.settle_s` | no | pull-in time excluded from whole-run scores (default 5 s) |
| `receiver.dut`, `front_end`, `notes` | no | free text; never scored, not in the hash |
| `expected[]` | for `iq` | satellite groups the laboratory expects (`signal`, `ids`, optional nominal C/N0, hand-off Doppler and code phase) |
| `event[]` | no | stated events: `id`, `kind` (`interference`, `spoofing`, `outage`, `other`), `type` (a label: `cw`, `narrowband`, `broadband`, `swept`, `pulsed`, `chirp`, `matched`, `meaconing`, `spoofer`, `unknown`), `onset_s`, `offset_s`, `affects` (`"all"` or ids), optional `center_offset_hz`, `bandwidth_hz`, `q`, and a `power` profile (`js_db` or `jammer_dbm` points) |
| `bars` | no | pass or fail bars for this recording; not in the hash |

Cross-field rules a schema cannot state (checked by `TestConditions::validate`): offsets
after onsets, unique event ids, `affects` ids drawn from `expected`, power points in time
order, `jammer_dbm` needing `reference_signal_dbm`, no two events overlapping on a shared
satellite, at least one `expected` group for an IQ recording.

## The condition hash

`TestConditions::hash` is the SHA-256 of the canonical JSON (compact, keys sorted) of the
resolved document with `receiver` and `bars` removed. Reordering keys or editing the
free-text notes does not change it; changing a path, an event time or a power point does.
It is the `conditions_hash` in a round-trip pack.

## Round trip

```text
scenario ──kshana bench-export──▶ motion + events + <base>.conditions.json
   │                                   │ (laboratory fills in path, sha256, receiver,
   │                                   │  event type and power, then runs the test)
   ▼                                   ▼
scenario hash          receiver log ──▶ kshana evidence round-trip
                                         ▶ signed pack: scenario hash, conditions hash,
                                           log hash, score against the stated events
```

`kshana evidence round-trip` refuses to build a pack when the conditions and the scoring
scenario disagree about the events (count, onset, end, kind) or when `recording.sha256` is
not the log's hash, so a pack cannot link a laboratory record to a score of different truth.

## What it does not do

- It does not produce, replay or schedule a signal. How a scenario's motion reached a
  receiver (a file played through a laboratory simulator, conducted or shielded, per the
  simulator's own safety instructions) is the operator's responsibility and is recorded,
  never automated.
- It says nothing about a receiver beyond the one log, under the one configuration stated.
- No vendor file format is read or written from reverse engineering. This document is not
  a certification, and a pack built from it supports evidence for a framework row; it does
  not show a product conformant.

Kshana is a research and engineering tool, not a certified navigation or safety-of-life
system.
