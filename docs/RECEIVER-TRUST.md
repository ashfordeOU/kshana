# Receiver trust: assessing a real GNSS receiver log

`kshana receiver-trust` reads a log from a real global navigation satellite system (GNSS)
receiver, runs trust monitors over it epoch by epoch, and says when and why the receiver's
fix stopped being trustworthy. It can also score the log against events and predictions you
state **before** the run: whether each event was detected in time, and whether a modelled
carrier-to-noise density (C/N0) drop agrees with what the receiver measured.

The observables are the receiver's own; the monitors and their thresholds are the engine's
and yours. Every result carries that label, the SHA-256 of the log, and every threshold it
ran with, so a run can be repeated and audited.

For a vessel under way, with a live score and an optional gate in front of a chart system, see
[`MARITIME-TRUST.md`](MARITIME-TRUST.md).

## Run it

```sh
kshana receiver-trust examples/receiver-trust/session.toml
```

This writes `session.result.json`, `session.trust.csv` (one row per epoch) and
`session.trust.svg` (mean C/N0 over time with the trust state underneath) next to the
scenario, and prints a one-line verdict. The example log is synthetic, made to show the
format; point `path` at your own receiver's log.

The same scenario runs from Python (`kshana.receiver_trust(toml)`), from the WebAssembly
package (`receiver_trust(toml)`, with the log inline) and from the Model Context Protocol
(MCP) server's `assess_receiver_log` tool.

## Logs it reads

| `format` | Source | What is read |
|---|---|---|
| `ubx` | u-blox binary | NAV-SAT per-satellite C/N0, NAV-PVT position, MON-RF automatic gain control (AGC) and the jamming indicator `jamInd`, NAV-TIMEGPS week |
| `rinex` | RINEX 3 observation file | `S` codes (C/N0) per satellite and signal; with a broadcast navigation file (`nav`), the pseudoranges for the engine's own fix |
| `android` | Android GnssLogger CSV | `Raw` rows: C/N0 and `AgcDb` per satellite; `Fix` rows: position |
| `nmea` | NMEA 0183 text | GSV signal-to-noise per satellite (dB-Hz, with or without the 4.10 signal ID), GGA and RMC time and position |

Each epoch the readers produce also carries `source_span`, `[start, end)` byte offsets into the
input: the smallest contiguous range holding the records that contributed to it, so the exact raw
slice can be hashed for an event window. NMEA: every line read while the epoch is current (a
superset where an unrelated line sits between its sentences). UBX: the frames of the epoch.
RINEX 3: the epoch records from each `>` line to the next. Android: the epoch's `Raw` rows (a
`Fix` row only for an epoch with no `Raw` rows). Absent for a live stream and wherever it is not
well defined (RINEX 2).

The file goes in by `path` (resolved against the scenario's own folder), or inline as
`text` or `base64` (the only choices in a browser).

## Platform: static or vessel

The monitors above assume a fixed antenna. A scenario states the platform before the run in
a top-level `[platform]` table; without one the platform is `static` and nothing changes.

```toml
[platform]
kind = "vessel"            # "static" (default) or "vessel"
max_speed_kn = 30.0        # default 30
max_accel_mps2 = 0.5       # default 0.5
max_turn_rate_dps = 6.0    # default 6
antenna_height_m = 18.0    # no default: without it the sea-level monitor does not run
heading_sensor = false     # true: the stream carries a gyro heading (HDT or THS)
```

| Key | Default | Why that value |
|---|---|---|
| `max_speed_kn` | 30 | Above the service speed of merchant hulls and most passenger craft, so a real vessel never reaches it; far below the speed a position drag-off implies. A slower vessel should state a lower limit: the lower the limit, the earlier a drag is caught. |
| `max_accel_mps2` | 0.5 | A large ship changes speed by well under 0.1 m/s²; a small fast craft reaches a few tenths on a hard throttle change. |
| `max_turn_rate_dps` | 6 | A large ship turns at well under 1 deg/s and a small craft in a hard turn at a few. |
| `antenna_height_m` | none | A property of the installation; a guess would be a hidden threshold. |
| `heading_sensor` | false | Declared `true` and absent from the log is an error, so a missing sensor cannot pass as a clean check. |

The vessel keys are rejected under `kind = "static"`. For a vessel the `position-jump`
monitor does not run, because it measures distance from the calibration mean, which is wrong
on a moving antenna; the result's `monitor_config` records the platform and the limits used.

The synthetic NMEA streams from [`kshana nmea-scenario`](NMEA-TRAINING.md), made for crew
training, are accepted by the NMEA reader and can be run through this kind like any NMEA log.

## Monitors

Each monitor needs its data; a monitor whose data is not in the log is not run and not
listed in `monitors_run`. The first `calibration_s` seconds (default 60) set the baseline
and never alarm.

| Monitor | Alarms when | Needs |
|---|---|---|
| `cn0-drop` | mean C/N0 over the satellites common with the baseline falls by `cn0_drop_db` or more (default 6 dB) | C/N0 |
| `loss-of-lock` | tracked satellites fall `sats_lost` or more below the baseline median (default 4) | C/N0 |
| `agc` | the AGC reading departs from its baseline by more than `agc_k_sigma` standard deviations (default 5) | UBX MON-RF or Android `AgcDb` |
| `jam-ind` | u-blox `jamInd` exceeds `jam_ind_threshold` (default 80 of 255) | UBX MON-RF |
| `position-jump` | the receiver's own fix is more than `position_jump_m` from its calibration mean (default 50 m) | a reported position |
| `raim` | parity receiver autonomous integrity monitoring (RAIM) on the engine's own single-point fix rejects the measurement set | RINEX log with `nav` |
| `solve-failure` | the engine's single-point fix fails with five or more satellites | RINEX log with `nav` |
| `clock` | the receiver clock departs from its predicted line by more than the minimum detectable offset of its calibration noise | RINEX log with `nav` |

For a `vessel` platform the moving-platform monitors also run (thresholds in a top-level
`[maritime]` table, every default documented in `src/receiver_trust/maritime.rs`); each
needs its data and is listed in `monitors_run` only when it decided:

| Monitor | Alarms when | Needs |
|---|---|---|
| `kinematic` | position change disagrees with the reported speed and course, or implies a speed, acceleration or turn rate above the vessel limits | fixes; speed and course (RMC or VTG) for the dead-reckoning part |
| `heading-course` | gyro heading and course over ground differ by more than `hdg_cog_tol_deg` (speed above `min_speed_kn`) | HDT, THS or VHW heading, `heading_sensor = true` |
| `speed-log` | speed through the water and speed over ground differ by more than `stw_sog_tol_kn` | VHW or VBW, and speed over ground |
| `sea-level` | GGA altitude differs from `antenna_height_m` by more than `sea_level_tol_m` | GGA altitude, `antenna_height_m` |
| `cn0-spread` | the spread of C/N0 across satellites falls to `cn0_spread_frac` of its calibration median | GSV |
| `cn0-rise` | C/N0 of the common satellites rose by `cn0_rise_db` on average and `cn0_rise_frac` of them rose | GSV |
| `time-consistency` | consecutive epoch times step irregularly, run backwards, or leave the host clock | NMEA time; host clock for the last part |
| `osnma` | the receiver reports an OSNMA authentication failure (a reported status is read; nothing is verified) | `$PKSOS` status sentence |

An epoch is **untrusted** when RAIM, the clock monitor, a solve failure or a position jump
alarms, or the C/N0 drop reaches twice its threshold; **degraded** on any other alarm; and
**nominal** otherwise.

The engine path (`raim`, `solve-failure`, `clock`) is the same computation as the
JammerTest 2024 spoofing oracle in `tests/jammertest_spoof_oracle_support`:
`tests/receiver_trust_jammertest.rs` checks that, on all eight published onsets, the first
alarm falls on the same epoch and is of the same kind.

## Trust score (vessel platform)

For a vessel every epoch after calibration also gets a score from 0 to 100 and the reasons
it is not 100. The mapping is deterministic and fixed before any log is scored: no learning,
nothing fitted to events. Each monitor reduces its evidence to a ratio `statistic /
threshold` (an alarm at 1 or more); a ratio costs the score

```text
points = weight * clamp((ratio - onset_ratio) / (full_ratio - onset_ratio), 0, 1)
score  = round_to_0.1( clamp(100 - sum of points, 0, 100) )
```

so a monitor costs nothing while below `onset_ratio` of its threshold (default 0.5), half its
weight at its threshold, and all of it at `full_ratio` times the threshold (default 1.5); the
score is non-increasing in every statistic. A source that does not report at an epoch keeps its
last statistic for `evidence_hold_s` (default 10 s: two cycles of a C/N0 sentence sent every
5 s), as an alarm and as a deduction alike.

```toml
[score]
nominal_min = 90.0         # score >= 90: nominal
degraded_min = 55.0        # 55 <= score < 90: degraded; below 55: untrusted
onset_ratio = 0.5
full_ratio = 1.5
evidence_hold_s = 10.0
[score.weights]            # overrides; a monitor not listed keeps its default
sea-level = 30.0
```

| Weight (points) | Monitors | Why |
|---|---|---|
| 70 | `osnma` | an authentication failure is a statement, not a statistic |
| 60 | `kinematic`, `raim`, `clock`, `position-jump`, `time-consistency` | a counterfeit position has to contradict physics or the receiver's own checks, and time cannot run backwards; one clear violation leaves the degraded band |
| 40 | `heading-course`, `speed-log`, `solve-failure` | one independent sensor disagreeing is degraded; two at full strength are untrusted |
| 30 | `sea-level`, `cn0-spread`, `cn0-rise`, `cn0-drop` | the signal environment, or a weakly informative check |
| 25 | `loss-of-lock`, `agc`, `jam-ind` | the environment is hostile; that alone does not show the fix is wrong |

The band edges follow from the weights: the lightest monitor at its threshold costs 12.5
points, so any alarm leaves the nominal band; no single monitor under 60 points can reach the
untrusted band alone (several together can). The result records the score model
(`score_model`) and each epoch carries `score.deductions`: which monitors deducted, their
ratios and their points. For a vessel the epoch's state is the band of its score.

## Stating events and predictions

```toml
[[events]]
label = "jammer on"
kind = "jamming"            # jamming, spoofing or other
onset_s = 120.0             # seconds since the first epoch of the log
end_s = 240.0               # optional; otherwise onset_s + compare.horizon_s
predicted_cn0_drop_db = 12.0  # optional, e.g. from a `jamming` scenario's link budget

[compare]
detect_tol_s = 10.0         # an alarm this soon after onset counts as a detection
cn0_tol_db = 3.0            # predicted and observed drops agree within this
```

For each event the result gives the false alarms between calibration and onset, the first
alarm and its monitors, the latency, the outcome (`detected`, `late`, `missed` or
`not-evaluable`), and the observed median C/N0 drop against the prediction (`agree`,
`disagree`, `no-prediction` or `not-evaluable`). Disagreement is reported, never tuned away:
the tolerances are in the scenario, and the scenario is in the result's hash.

## What this does not claim

The trust monitors are MODELLED: their thresholds are inputs, and their detection
performance on real interference is what the event scoring measures, not something this
kind asserts. On the JammerTest 2024 spoofing sessions the engine-path monitors catch some
onsets within 10 s and are late on others; see the "Clock-aided χ², RAIM, AGC, SQM fused
per-epoch security FoM" row in [`VERIFICATION-MATRIX.md`](VERIFICATION-MATRIX.md) for the
numbers. A prediction that agrees with one log is one data point, not a validation.
