# Results: scoring receiver logs against the Jammertest schedule on the JammerTest 2024 dataset (0.38 B2/B3)

The pre-registration is `PREREGISTRATION.md` in this directory, committed alone in c2e6d3b before
`kshana jammertest score` was run on any log. This is its first and only run (2026-10-18), with the
harness of `src/jammertest/dataset.rs` as committed in the commit that precedes this file, not changed
after the run:

```text
cargo run --release --example jammertest_score_2024 -- <extracted-root> report.json
```

Data: `GNSS_DATASET_JAMMING_SPOOFING.tar.gz` fetched from Zenodo record 15911589, SHA-256
`73e78934aa00d01dfeebabc45f81b38c9c0aecf972f5fc94d9ff60527065b313` as registered; extracted outside the
repository and not vendored. The recorded figures are pinned by `tests/jammertest_score_2024.rs`
(data-gated by `KSHANA_JAMMERTEST_DIR`). **Every row is MODELLED**: the schedule is the dataset's logged
windows, not recorded on-air times.

## Verdict: the minimum-data rule failed, so no bar is assessable

The registered minimum was at least 10 scorable jamming windows from at least 2 kept folders. The run
has **4** scorable jamming windows from 4 kept folders. Bars B1 to B4 are therefore **not assessable**; the
numbers below are descriptive and are not a pass or a miss. Nothing was loosened and nothing re-run.

## Folders (12 with a `.ubx`)

| folder | rover | outcome of the registered rule |
|---|---|---|
| 1.10.4 | dynamic | scored |
| 1.10.6 | dynamic | scored |
| 1.11.7 | dynamic | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| custom 1 | dynamic | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| custom 2 | dynamic | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| 1.11.8 | dynamic | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| 1.6.4 | stationary | scored |
| 2.6.2 | dynamic | scored |
| 3.1.3,3.1.4 | dynamic | the log states its start as `GPS TOW 199792.200 s`, which is not UTC ISO-8601: give the start explicitly |
| 3.1.1,3.1.2 | stationary | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| 2.1.3,2.1.2,2.1.4 | stationary | the log states its start as `GPS TOW 287922.600 s`, which is not UTC ISO-8601: give the start explicitly |
| 2.1.1 | stationary | the log states its start as `GPS TOW 284241.600 s`, which is not UTC ISO-8601: give the start explicitly |

Why folders dropped: 5 had a window starting less than 120 s after the log began (baseline possibly
formed under interference, the calibration's own exclusion rule). 3 had a UBX log that states its start
only as GPS time of week (no UTC stamp in the log), so the schedule cannot be placed on it without a
rule the pre-registration did not contain (the CSV exports of those folders carry UTC); they are
listed, not rescued. The 3 are all spoofing or meaconing folders, and the other spoofing and meaconing
folder with a UBX log was dropped for the baseline rule, so **no spoofing or meaconing window is in the
pool**.

## Descriptive numbers (not bars)

| | windows | detected in 10 s | late | missed | median latency | alarmed | recovered |
|---|---|---|---|---|---|---|---|
| jamming | 4 | 4 | 0 | 0 | 0.2 s | 4 | 1 |
| spoofing/meaconing | 0 | 0 | 0 | 0 | - | 0 | 0 |

Clean epochs (kept folders): 805; with an alarm: 430 (0.534); false-alarm runs: 4 over 0.22 h.

Per bar: B1 not assessable (1.0000 (4+0 of 4)); B2 not assessable (0.2000 s); B3 not assessable (0.5342 (430 of 805)); B4 not assessable (0.2500 recovered (1 of 4), median 0.2000 s).

## How to read these numbers

- The latencies are near zero because the logged windows of the four scored folders are long (840 to
  3,600 s) and a monitor was already alarming at, or within a second of, the logged start. The first
  monitor of each window is in the JSON report: AGC, loss of lock and, in one folder, the position-jump
  monitor.
- The pooled "clean" alarm rate (0.53) comes mostly from the three moving-rover folders, where the
  registered session (static-platform defaults) was used. This run does not establish why those epochs
  alarmed, so it is not read as the false-alarm rate of the RF monitors; the stationary folder alone had
  22 alarmed of 304 clean epochs. A moving-platform session is a different configuration and would be a
  new pre-registration.
- Only a few clean epochs exist per folder (25 to 304) because the windows start early and last long.
- No conclusion about detection performance should be drawn from 4 windows.

## What a second registration would change (not done, for the coordinator)

A v2 pre-registration could (a) place GPS-TOW-only UBX logs using the dataset's `scenario.json` date and the
GPS-UTC offset, (b) score the CSV exports of all 24 folders as the calibration did, and (c) use the
moving-platform session for dynamic folders. Each is a rule that was not registered here, so none was
applied after seeing this result.
