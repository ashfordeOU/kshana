# Pre-registration v2: scoring against the Jammertest schedule, data handling only (0.38 B2/B3)

Committed alone, before any v2 run. It changes **only how data are read and which session is used**;
the scorer, the definitions, the bars and the minimum-data rule are those of
[`PREREGISTRATION.md`](PREREGISTRATION.md) (v1), unchanged and incorporated by reference. v1's recorded
result ([`RESULTS.md`](RESULTS.md): the minimum-data rule failed, no bar assessable) stays in the
repository unchanged and is cited, not replaced. There is one v2 run, whatever the outcome.

## What was seen before this was written (disclosed)

- Everything disclosed in v1, and v1's result: 4 scorable jamming windows from 4 of 12 `.ubx` folders;
  5 folders dropped by the baseline rule; 3 UBX logs stating their start only as GPS time of week;
  near-zero latencies; a pooled "clean" alarm rate of 0.53 that came mostly from the three moving-rover
  folders scored with the static-platform session.
- The three changes below were chosen **after** seeing that result, to repair what stopped v1 from
  having enough data, not to change a verdict. Which of the 12 CSV-only folders would be kept is partly
  known from the earlier calibration (`xval/jammertest-trust/RESULTS.md`: 14 of 24 folders evaluable,
  7 with jamming, by the same exclusion rule on the CSV exports); no per-window outcome, latency, recovery
  or false-alarm count of the scorer has been computed for any CSV-only folder.
- `kshana jammertest score` has been run on the 12 `.ubx` folders (v1) and nowhere else.

## The three changes (data handling only)

1. **GPS-time-only UBX logs.** A `.ubx` log whose first epoch is labelled only `GPS TOW <s> s` (no UTC
   date) is placed in UTC as: the folder's `scenario.json` `date` at 00:00:00, plus the time of week
   modulo 86,400 s, minus 18 s (GPS time is ahead of UTC by 18 s in 2024). This is the only rule; no other
   offset is tried. A log that states UTC is read as in v1.
2. **CSV-only folders.** The 12 folders with no `.ubx` file are scored from their CSV exports
   (`mon_rf.csv`, `rinex.csv`), as the calibration read them (1 s bins of the UTC stamps; AGC averaged,
   jamming indicator maximum, C/N0 per satellite and band averaged, kept inside 10 to 64 dB-Hz), with the
   timeline starting at its first UTC epoch. The 12 `.ubx` folders keep the UBX source. The pool is
   therefore the 24 folders of the dataset, one source each; no folder is scored twice.
3. **Moving-platform session for the moving rovers.** Folders whose path contains `dynamic` are run with
   `[platform] kind = "vessel"`, `max_speed_kn = 100`, `max_accel_mps2 = 10`, `max_turn_rate_dps = 90`,
   no `antenna_height_m` and no heading sensor: stated physical bounds well above a car's, never fitted
   to the data, so the static-antenna position-jump monitor is replaced by the moving-platform plausibility
   monitors where the log has a position. Stationary folders keep the v1 static session. The monitors'
   thresholds are the defaults, as in v1.

## Unchanged from v1

The dataset and its SHA-256, the `attack_log` windows and the -2 h shift, the kinds, `guard_s` 60 s,
`recover_hold_s` 10 s, `compare.detect_tol_s` 10 s, the scorable rule (window start at least 120 s after
the log's first epoch; a log with an earlier window is dropped whole), the pooling, the minimum-data rule
(at least 10 scorable jamming windows from at least 2 kept folders; otherwise the bars are "not
assessable"), and the bars B1 to B4 and S (reported only), with the same thresholds. Spoofing and
meaconing windows are reported, with no bar. The CSV exports carry no raw log bytes, so no signed pack
is made for a CSV-only folder; the run reports scorecards only.

## Rules for the result

One v2 run, by `cargo run --release --example jammertest_score_2024 -- <extracted-root> report.json --v2`,
recorded in `RESULTS-v2.md` whatever it shows. A NOT MET is published and pinned by a test that asserts the
miss; "not assessable" is published as such. The ledger row stays MODELLED. The schedule is logged windows,
not on-air times (v1's caveats apply in full). A later change is a new pre-registration.
