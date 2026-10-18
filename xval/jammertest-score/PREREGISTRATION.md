# Pre-registration: scoring receiver logs against the Jammertest schedule (0.38 B2/B3)

Committed alone, before `kshana jammertest score` has been run on any log of the dataset. The
population, the definitions, the metrics and the bars below are fixed now. Bars may be tightened
later, never loosened; a miss is recorded with its numbers and pinned by a test that asserts it.

## What was seen before this was written (disclosed)

- The whole JammerTest 2024 dataset has been used in this repository before, for the receiver-trust
  threshold calibration (`xval/jammertest-trust/`). Its recorded results were read before these bars
  were chosen: at the shipped default thresholds the pooled epoch-level detection probability of the
  union of the three monitors was 0.782 and its clean false-alarm rate 0.00029; the C/N0 monitor
  alone detected 0.063 of jamming epochs and the jamming indicator none; the AGC monitor 0.781.
  The bars below were not derived from those numbers, but they were not written blind to them.
- `kshana jammertest score` has not been run on any log. No per-window outcome, first-alarm latency,
  time to recover or false-alarm run count has been computed for this scorer, on this dataset or any
  other. Only the scheduled window onsets of one folder (1.6.4) were printed by
  `kshana jammertest import`, to check that the start time of a UBX log parses.

## What is scored, and what it is not

Each logged attack window of a folder is one "test" (the folder's `scenario_id` is its catalogue
id). The schedule is **scheduled truth**: the windows are the logged slots at one-minute resolution,
not radio-frequency on/off times. A jammer may have started late, been off for part of a slot or been
cancelled, so a latency is measured from the logged start, a miss may be a transmitter that was off,
and a "clean" epoch is "outside the logged windows", not "proven interference-free". No external
oracle states the true on-air times. **Every row stays MODELLED**; nothing here is VALIDATED.

## Data

JammerTest 2024 (Zenodo record 15911589, GPL-3.0-or-later, `GNSS_DATASET_JAMMING_SPOOFING.tar.gz`,
SHA-256 73e78934aa00d01dfeebabc45f81b38c9c0aecf972f5fc94d9ff60527065b313, 375,338,522 bytes),
fetched at run time by `xval/oracles/setup.sh`, extracted outside the repository, never vendored.
Scored on the 12 folders that carry a `.ubx` file (one u-blox ZED-F9P receiver each), because the
signed evidence pack needs the raw log bytes and the UBX reader is what a user of the command line
has. The other 12 folders have only CSV exports and are not scored here.

## Pipeline (fixed)

1. Session: `format = "ubx"`, `MonitorConfig::default()` (static platform, `calibration_s` 60,
   `cn0_min_sats` 4, the 0.35 default thresholds), no engine fix, `compare.detect_tol_s` 10 s. The
   opt-in `jammertest-2024` threshold profile is **not** used (it was fitted on these folders).
2. Schedule: `jammertest import --attack-log scenario.json --time-shift-h -2`: an `attack_log` event
   whose text contains "start" opens a window, the next one containing "end" or "stop" closes it;
   stamps shifted by -2 h (they say `Z` but are local time, as in the calibration pre-registration;
   no other shift is tried). Windows are kind `jamming` in folders whose `attack_type` contains
   "Jamming", and `spoofing` in the others (spoofing and meaconing).
3. Scorer (`jammertest::score`), with `guard_s` = 60 s and `recover_hold_s` = 10 s:
   - A window is **scorable** if it lies inside the log and starts at least `calibration_s + guard_s`
     (120 s) after the log's first epoch. A log with any window starting earlier has a baseline that
     may have been formed under interference (`baseline_contaminated`): it is dropped whole, as in
     the calibration, and listed with the reason. A log on which the monitors return an error is
     dropped and listed.
   - **Detection:** the first epoch in `[onset, end]` where any monitor alarms. Outcome `detected`
     if that is within 10 s of the onset, `late` if later, `missed` if none. **Latency** = first
     alarm minus onset.
   - **Time to recover:** for a window that alarmed, from its end to the first epoch of a stretch of
     at least 10 s with no alarm of any monitor, before the next window starts. If there is none the
     window is "not recovered".
   - **False alarms:** post-calibration epochs outside every window extended by `guard_s` before its
     onset and by `guard_s` after its end (or after its recovery point, if later). A false-alarm
     epoch is one with any monitor alarming; a false-alarm run is a maximal run of consecutive
     alarming epochs.
4. Pooling: all scorable windows and clean epochs of the kept logs. Medians are over the pooled
   windows. J = jamming windows, S = spoofing and meaconing windows.

## Minimum data

At least 10 scorable jamming windows from at least 2 kept folders. If this fails, bars B1 to B4 are
recorded as "not assessable", not as passed.

## Bars

| bar | statement |
|---|---|
| B1 detection | (detected + late) / scorable over J windows >= 0.80 |
| B2 timeliness | median latency over J windows that alarmed <= 30 s |
| B3 false alarms | false-alarm epochs / clean epochs <= 0.02 over the pooled clean epochs |
| B4 recovery | of the J windows that alarmed, the share recovered >= 0.80, and their median time to recover <= 60 s |
| S | spoofing and meaconing windows: reported only, no bar. These attacks were radiated at high power and are seen as interference by the measurement-domain monitors; that says nothing about detecting a low-power spoofer. |

Also reported, without a bar: the within-10-s detection rate, false-alarm runs per hour of clean
time, per-folder and per-test rows, and the same numbers by rover state (`stationary`, `dynamic`).

## Rules for the result

The recorded run is the first and only run on the dataset as fetched, by the command in
`xval/jammertest-score/RESULTS.md`. A NOT MET is published and pinned by a test that asserts the
miss. The ledger row is MODELLED whatever the verdicts. A later change to the scorer or the bars is
a new pre-registration, not an edit of this one.
