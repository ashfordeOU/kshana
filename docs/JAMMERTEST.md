# Jammertest scoring: the published plan as scheduled truth

`kshana jammertest import` reads the Jammertest test catalogue and transmission plan and turns one
test area's slots into receiver-trust `[[events]]`. `kshana jammertest score` runs a receiver log
through the trust monitors and scores it against that schedule, test by test. Every result is
**MODELLED**: the schedule says when a test was *planned*, not when a transmitter was on.

Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator
remains responsible for the navigation of the vessel. Nothing here is endorsed by the Norwegian
Public Roads Administration, Nkom or the event organisers; no agreement with them is claimed.

## The plan and the catalogue

Source: the Norwegian Public Roads Administration's `NPRA/jammertest-plan` repository
(<https://github.com/NPRA/jammertest-plan>), **MIT licence** (copyright 2024 Norwegian Public Roads
Administration; the licence text is checked in `xval/jammertest-plan/MANIFEST.tsv`). The files are
fetched, never vendored:

```text
xval/jammertest-plan/fetch.sh <dest-dir-outside-the-repo>
```

It downloads the catalogues and the 2025 plan files at the pinned commit
`75c0b2ceea10e470c3799d14a8ef18842d8375a7` and refuses any file whose SHA-256 differs from
`xval/jammertest-plan/MANIFEST.tsv`.

A catalogue test has a dotted id, `type.group.test` (for example `1.2.5`: type 1 jamming, group 2,
test 5). The plan lists, per test area and time slot, which id is scheduled. Types 1 (jamming), 2
(spoofing) and 3 (meaconing) transmit; type 0 (briefings, grace period, booking and ad hoc slots)
does not and is skipped. Plan times are local wall-clock; `--local-offset-h` (default 2, CEST) says
how far they are from UTC. The plan files carry a test-contact field with a person's name: it is
never read, and nothing derived from it is written.

## Import

```text
kshana jammertest import --catalog testcatalog2025.json \
    --plan plan-tuesday-2025-09-16.json --plan plan-wednesday-2025-09-17.json \
    --location 1 --log receiver.ubx --format ubx --out events.toml
```

`--log-start <UTC time>` replaces `--log`/`--format` when the log does not state its start. The output
is TOML `[[events]]` to append to a receiver-trust scenario; each label starts `scheduled truth:` and
carries the edition year, the catalogue id and the area, and the header records the SHA-256 of every
source file. `--attack-log <scenario.json>` reads the event truth of one folder of the JammerTest
2024 dataset instead (its `attack_log`, stamps shifted by `--time-shift-h`, default -2: they say `Z`
but are local time).

## Score

```text
kshana jammertest score session.toml --catalog testcatalog2025.json --plan plan-....json \
    --location 1 [--json] [--key signer.key --out pack/]
```

`session.toml` is a receiver-trust scenario (`[log] format/path`, optional `[monitors]`, `[compare]`).
Its own `[[events]]` are replaced by the imported schedule. Per scheduled test:

| field | meaning |
|---|---|
| `outcome` | `detected` (an alarm within `compare.detect_tol_s`, default 10 s, of the planned start), `late` (later, inside the slot), `missed` (none), `not-evaluable` |
| `latency_s` | first alarm minus planned start |
| `time_to_recover_s` | slot end to the start of the first stretch of at least `--recover-hold-s` (10 s) with no alarm, before the next test |

A test is scorable only if it starts at least `calibration_s + guard_s` after the log began; a log
with an earlier test is flagged `baseline_contaminated` (the baseline may have been formed under
interference). **False alarms** are alarming post-calibration epochs outside every slot extended by
`--guard-s` (60 s) before and after (or after the recovery point), counted as epochs and as runs, with
runs per hour of clean time. With `--key` and `--out` the run is written as a signed evidence pack
(`docs/EVIDENCE-PACKS.md`): the scorecard and the imported schedule sit inside `config.json`, so inside
the hash chain and the signature. A pack is a technical record, not a legal opinion.

## What a result does not say

- A planned slot is not an on-air record. A transmitter may have started late, stopped early or never
  run; a "missed" test can be a test that did not transmit, and a latency is from the planned start.
- A "clean" epoch is "outside the planned slots", not "proven interference-free".
- Detection by measurement-domain monitors says nothing about detecting a low-power, coherent spoofer.
- No external oracle states the true on-air times, so nothing here is VALIDATED.

## The 2024 dataset run (pre-registered)

`xval/jammertest-score/PREREGISTRATION.md` fixed the population, the definitions and the bars before the
first scored run; `xval/jammertest-score/RESULTS.md` records that run. Result: **the registered
minimum-data rule failed** (4 scorable jamming windows from 4 of the 12 `.ubx` folders: 5 folders were
dropped by the baseline rule and 3 UBX logs state their start only as GPS time of week), so **no bar is
assessable**. Nothing was loosened or re-run. A second registration (placing GPS-TOW logs from the
dataset's date, scoring the CSV folders, a moving-platform session) is possible and was not done.
The dataset (JammerTest 2024, Zenodo 15911589, GPL-3.0-or-later) is fetched by `xval/oracles/setup.sh`
and never vendored; the test `tests/jammertest_score_2024.rs` pins the recorded run when
`KSHANA_JAMMERTEST_DIR` points at the extracted dataset.

## The 2025 SimulaMet NMEA dataset

The SimulaMet Jammertest 2025 NMEA-derived dataset (IEEE DataPort, DOI 10.21227/a7v4-xw11) is **not**
adapted in 0.38. Its page states no licence and says "This dataset requires an IEEE DataPort
Subscription to access": the terms do not clearly allow redistribution or an automated fetch, so no
adapter or fetch script was written. Using it needs the owner's decision and, ideally, the authors'
written agreement.

## Surfaces

CLI, Rust (`kshana::jammertest`), Python (`jammertest_import`, `jammertest_score`), WebAssembly (the
same names), MCP tools of the same names, and the `/kshana-jammertest` command and `jammertest` skill.
The signed pack is command line only (it needs a signing key). See `docs/SURFACES.md`.
