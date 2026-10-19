# Results v2: scoring against the Jammertest schedule, data handling only (0.38 B2/B3)

The pre-registration is [`PREREGISTRATION-v2.md`](PREREGISTRATION-v2.md), committed alone in b512da21 before
any v2 run; it changes only data handling and keeps v1's scorer, bars and minimum-data rule
([`PREREGISTRATION.md`](PREREGISTRATION.md); v1's result is in [`RESULTS.md`](RESULTS.md), unchanged).
This is the first and only v2 run (2026-10-18), with the harness of `src/jammertest/dataset.rs`
(`run_dataset_v2`) as committed in aac3960b, not changed after the run:

```text
cargo run --release --example jammertest_score_2024 -- <extracted-root> report.json --v2
```

(The first invocation after the harness commit before aac3960b did not take the `--v2` flag and re-ran v1,
which gave v1's numbers again; no v2 number was computed by it. The flag was then added, nothing else, and the
v2 run was made once.)

Data: `GNSS_DATASET_JAMMING_SPOOFING.tar.gz`, Zenodo 15911589, SHA-256
`73e78934aa00d01dfeebabc45f81b38c9c0aecf972f5fc94d9ff60527065b313` as registered; not vendored. Pinned by
`tests/jammertest_score_2024.rs` (data-gated by `KSHANA_JAMMERTEST_DIR`). **Every row is MODELLED**: the
schedule is the dataset's logged windows, not recorded on-air times.

## Verdict: the minimum-data rule failed again, so no bar is assessable

The registered minimum is at least 10 scorable jamming windows from at least 2 kept folders. v2 has **7**
scorable jamming windows from 7 kept folders (14 of 24 folders kept). Bars B1 to B4 are **not assessable**; the
numbers below are descriptive, not a pass or a miss. Nothing was loosened and nothing re-run.

The three data-handling changes did what they were meant to: the three GPS-time-only UBX logs were placed and
scored, the 12 CSV-only folders were scored, and the moving rovers ran under the moving-platform session. The
shortfall is now the dataset's: 10 of 24 folders have a logged window that starts less than 120 s after the log
begins (the registered baseline rule), leaving 7 jamming folders with one window each.

## Folders

| folder | rover | outcome |
|---|---|---|
| 1.10.4 | dynamic | scored |
| 1.10.6 | dynamic | scored |
| 1.11.7 | dynamic | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| custom 1 | dynamic | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| custom 2 | dynamic | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| 1.11.8 | dynamic | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| 1.6.4 | stationary | scored |
| 2.6.2 | dynamic | scored |
| 2.6.4 | dynamic | scored |
| 2.6.1 | stationary | scored |
| 2.6.3 | stationary | scored |
| 3.1.3,3.1.4 | dynamic | scored |
| 3.2.8 | dynamic | scored |
| 3.1.1,3.1.2 | stationary | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| 3.2.7 | stationary | scored |
| 3.2.8 | stationary | scored |
| 2.2.3,2.3.3 | dynamic | scored |
| 2.3.13,2.3.15 | dynamic | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| 2.3.2 | dynamic | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| 2.3.10,2.3.11 | stationary | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| 2.3.15,2.3.12 | stationary | scored |
| 2.3.5,2.3.8 | stationary | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| 2.1.3,2.1.2,2.1.4 | stationary | baseline may have been formed under interference (a window starts less than calibration + guard after the log starts) |
| 2.1.1 | stationary | scored |

## Descriptive numbers (not bars)

| | windows | detected in 10 s | late | missed | median latency | alarmed | recovered |
|---|---|---|---|---|---|---|---|
| jamming | 7 | 3 | 4 | 0 | 18.0 s | 7 | 4 (median 12.1 s) |
| spoofing/meaconing (reported only, no bar) | 10 | 3 | 7 | 0 | 16.5 s | 10 | 8 (median 0.4 s) |

Clean epochs (kept folders): 3425; with an alarm: 306 (0.089); false-alarm runs: 10 over 0.95 h.

Per bar: B1 not assessable (1.0000 (3+4 of 7)); B2 not assessable (18.0000 s); B3 not assessable (0.0893 (306 of 3425)); B4 not assessable (0.5714 recovered (4 of 7), median 12.1000 s).

## How to read these numbers

- With the moving-platform session the pooled clean alarm rate fell from v1's 0.53 to 0.089; this run does
  not establish why, and the two runs differ in folders as well as in session, so it is not read as the effect
  of the session alone. It is still above the registered B3 level of 0.02, but B3 is not assessable.
- Latencies are no longer all near zero: 3 of 7 jamming windows were alarmed within 10 s, 4 later (one 694 s
  after the logged start, a folder whose first alarm is the AGC monitor long into a 3,600 s window); the
  median over the 7 is 18 s. Seven windows support no conclusion about detection performance.
- Of the 14 kept folders, 7 carry jamming windows and 7 spoofing or meaconing windows (10 windows, reported
  only, no bar); these attacks were radiated at high power and are
  seen as interference by the measurement-domain monitors; that says nothing about a low-power spoofer.
- The 7 kept jamming folders are 4 on the moving rover and 3 stationary; one receiver type (u-blox ZED-F9P).

## What a further registration would need

The binding limit is now the data, not the handling: the baseline rule removes 10 folders. Reaching 10
scorable jamming windows would need a different registered rule for a window that starts early in the log
(for example a baseline taken from the quiet minutes at the end of the log). That would be a new
pre-registration with its own run; none is proposed here, and the bars have not been touched.
