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

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="assets/readme/trust-timeline-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="assets/readme/trust-timeline-light.svg">
  <img src="assets/readme/trust-timeline-light.svg" alt="Trust score over one synthetic passage, from a real run of engine v0.36.0 on examples/maritime-trust (a made-up NMEA log of a ferry on a Tallinn to Helsinki route, 3001 epochs at 1 Hz). Three lanes share one time axis. Top: the distance between the position the receiver reports and the vessel's real position, which stays within a few metres until about 1576 s, when the log's scripted position drag-off pulls it away, while the receiver keeps reporting a valid fix. Middle: the trust score from 0 to 100, not computed during the first 300 s of calibration, in the nominal band (at least 90) until the drag-off, then falling through the degraded band (at least 55) into the untrusted band. Bottom: the band of each epoch as a coloured ribbon with its name. The score is advisory. Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator remains responsible for the navigation of the vessel. The log is made up to show the format and the monitors; it is not a measurement and says nothing about how any receiver would perform." width="100%">
</picture>

The figure above is the vessel demo of [`MARITIME-TRUST.md`](MARITIME-TRUST.md): a made-up log, an advisory score.

The same scenario runs from Python (`kshana.receiver_trust(toml)`), from the WebAssembly
package (`receiver_trust(toml)`, with the log inline) and from the Model Context Protocol
(MCP) server's `assess_receiver_log` tool.

## Logs it reads

| `format` | Source | What is read |
|---|---|---|
| `ubx` | u-blox binary | NAV-SAT per-satellite C/N0, elevation and azimuth, NAV-PVT position, MON-RF automatic gain control (AGC) and the jamming indicator `jamInd`, NAV-TIMEGPS week |
| `rinex` | RINEX 3 observation file | `S` codes (C/N0) per satellite and signal; with a broadcast navigation file (`nav`), the pseudoranges for the engine's own fix |
| `android` | Android GnssLogger CSV | `Raw` rows: C/N0 and `AgcDb` per satellite; `Fix` rows: position |
| `nmea` | NMEA 0183 text | GSV signal-to-noise per satellite (dB-Hz, with or without the 4.10 signal ID) and its elevation and azimuth, GSA dilution of precision and satellites used, GGA and RMC time and position |

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

**Calibrated profile (opt-in).** `[monitors] profile = "jammertest-2024-calibrated"` replaces the
three interference thresholds with values calibrated on the public JammerTest 2024 dataset (one u-blox
ZED-F9P per scenario; Zenodo 15911589): `cn0_drop_db = 1.5`, `agc_k_sigma = 3.5`,
`jam_ind_threshold = 29`. The calibration was pre-registered (`xval/jammertest-trust/PREREGISTRATION.md`)
and the profile is MODELLED, fitted on one public campaign: its `cn0_drop_db` threshold **missed** the
pre-registered held-out false-alarm bar (0.0231 against 0.02);
the AGC and jamming-indicator bars and the union bar (false alarms 0.033, detection 0.81) passed
(`xval/jammertest-trust/RESULTS.md`). It holds for that receiver type at that event, against scheduled
attack slots, and was calibrated on the dataset's CSV logs (its UBX logs give more false alarms on two
folders). A result run with the profile echoes the thresholds it applied and carries a `profile_note`
saying all of this. Without the profile the defaults above apply and every output is unchanged.

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
| `osnma` | the receiver reports an OSNMA authentication failure (a reported status is read; nothing is verified; to verify OSNMA from the I/NAV pages themselves see [docs/OSNMA.md](OSNMA.md)) | `$PKSOS` status sentence |

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

The rounding is half up (`floor(x * 10 + 0.5) / 10`), the band is that of the rounded score, and
the clamp comes before the rounding. Only monitors whose points are above zero are listed in the
deductions, with their ratio and unrounded points, largest points first; deductions with equal
points are listed in the order of the monitor names `cn0-drop`, `agc`, `jam-ind`, `loss-of-lock`,
`position-jump`, `raim`, `clock`, `solve-failure`, `kinematic`, `heading-course`, `speed-log`,
`sea-level`, `cn0-spread`, `cn0-rise`, `time-consistency`, `osnma`, `geometry`. A monitor whose test is pass or
fail (a failed solve, a failed authentication) is given the ratio 1.5, the full weight. The listed
points are those before the clamp at 0.

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
| 60 | `kinematic`, `raim`, `clock`, `position-jump`, `time-consistency` | a counterfeit position has to contradict physics or the receiver's own checks, and time cannot run backwards; one violation at full strength (1.5 times its threshold: 60 points, score 40) is untrusted, and at its threshold (30 points, score 70) degraded |
| 40 | `heading-course`, `speed-log`, `solve-failure` | one independent sensor disagreeing is degraded; two at full strength are untrusted |
| 30 | `sea-level`, `cn0-spread`, `cn0-rise`, `cn0-drop` | the signal environment, or a weakly informative check |
| 25 | `loss-of-lock`, `agc`, `jam-ind` | the environment is hostile; that alone does not show the fix is wrong |
| up to 15, `[geometry]` | `geometry` (0.36) | not a weight on this ramp: nothing unless the sky is poor, then up to `cap_points` (15); geometry alone reaches degraded, never untrusted, and raises no alarm (see "Geometry" below) |

The band edges follow from the weights: the lightest monitor that alarms costs 12.5 points at its
threshold, so any alarm leaves the nominal band; no single monitor under 60 points can reach the
untrusted band alone (several together can). The result records the score model
(`score_model`) and each epoch carries `score.deductions`: which monitors deducted, their
ratios and their points. For a vessel the epoch's state is the band of its score.

## Geometry: natural degradation apart from attack-like inconsistency

A receiver beside a quay crane, in a lock or under a high hull loses satellites and its fix gets
worse for a reason that is not an attack. From 0.36, following the geometry design note
(`docs/design/2026-10-12-geometry-and-skyline-design.md`, section 4), every epoch carries its
**satellite geometry**, a vessel's score has a **geometry monitor**, and every deduction carries a
**class**: `geometry` (the sky), `environment` (the signal environment) or `inconsistency`
(attack-like evidence).

**Where the geometry comes from.** The elevation and azimuth of each tracked satellite (NMEA GSV,
UBX NAV-SAT), from which the dilution of precision (DOP) is derived with the engine's one DOP
kernel (`orbit::dop`, VALIDATED against gnss_lib_py): `source = derived`. Failing that, the DOP and
satellites used the receiver states (NMEA GSA): `source = reported`. Sky positions and GSA count
for the score's `evidence_hold_s` (default 10 s), because many buses send GSV every few seconds; a
GSV set incomplete in an epoch (the end of an excerpt, a lost sentence) is not used. A log with
neither, such as NMEA with only GGA and RMC, or Android and RINEX logs today, gets the status
**`unknown`** with the note "geometry unknown": the engine does not guess a geometry it was not
given, and the geometry monitor does not run.

| `geometry.status` | Meaning |
|---|---|
| `good` | enough satellites and DOP within the thresholds |
| `degraded` | one or more reasons: `few-satellites`, `high-pdop`, `high-hdop`, and (informational, not in the score) `sky-blocked` when every tracked satellite sits in one half of the horizon |
| `unknown` | the log gives no satellite geometry for this epoch |

The status is descriptive and the label (below) is what matters for the score: `degraded`
includes the informational `sky-blocked` case, which can come with good or fair DOP, and only a
`poor` label is scored.

**The label** (always reported, never scored). Every epoch's `geometry.label` is `good` (HDOP
at most `hdop_good` 2, PDOP at most `pdop_good` 3 and at least `used_good` 6 satellites), `poor`
(HDOP above `hdop_max` 4, PDOP above `pdop_max` 6 or fewer than `min_used` 5 satellites), `fair`
between the two, or `unknown`. The epoch's note always opens with the label and the numbers, for
example "geometry fair: HDOP 1.105, PDOP 1.831, VDOP 1.410, 8 satellites; not scored (the score
deducts only above HDOP 4, PDOP 6 or below 5 satellites)", and adds ", signal loss" when it holds.

**The geometry monitor** (vessel score). It deducts **nothing unless the geometry is poor**: its
ratio is `max(hdop / hdop_max, pdop / pdop_max, min_used / n_used)`, and while that is at most 1
(good or fair geometry, a GPS-only open sky of 8 satellites included) it costs nothing, so such a
log scores exactly as in 0.35. Above 1 the deduction ramps linearly to `cap_points` (15) at
`full_ratio` (1.5 times the thresholds: HDOP 6, PDOP 9, 3 satellites): 7.5 points at ratio 1.25
(HDOP 5, or 4 satellites), 15 from 1.5 on (score 85, degraded). On its own it can never take the
score below `floor` (default: the score's `degraded_min`, 55), so geometry alone reaches the
degraded band at most and never the untrusted one: the cap in force is
`min(cap_points, 100 - floor)`, so a `[score]` table that raises `degraded_min` (a 0.35 one with
`degraded_min` 90, say) lowers the cap to `100 - degraded_min` rather than being refused, and a
`floor` set below `degraded_min` is refused. The monitor raises no alarm; it is listed last in
`monitors_run` when it decided at any epoch (a vessel whose log gives the geometry), and is not
counted in the 0.35 identity; it is not a `[score.weights]` entry (setting one is refused), and the cap and floor
in force are recorded in `geometry_model.cap_in_force` and `geometry_model.floor_in_force`. A
poor epoch's note says why, for example "geometry poor: HDOP 5.200, PDOP 7.900, VDOP 4.100, 7
satellites; degraded by geometry: HDOP 5.200 above 4 (derived from 7 logged satellites); not an
inconsistency".

**Classes.** Every deduction (`score.deductions[].class`):

| Class | Monitors |
|---|---|
| `geometry` | `geometry` (poor geometry); `loss-of-lock` when every satellite lost against the calibration baseline was below `low_elev_deg` at its last report |
| `environment` | `cn0-drop`, `cn0-spread`, `cn0-rise`, `agc`, `jam-ind`, `loss-of-lock` otherwise; `geometry` during signal loss (below) |
| `inconsistency` | `kinematic`, `heading-course`, `speed-log`, `sea-level`, `time-consistency`, `clock`, `raim`, `position-jump`, `osnma`, `solve-failure`; and `geometry` when the geometry is poor and the stated HDOP disagrees with the stated sky (below) |

**The guard against a forged poor sky.** A spoofer could send a thin GSV, or report a high HDOP,
to buy tolerance. The engine labels and does not forgive: no other check is widened by a poor
geometry, and the HDOP the receiver states (GSA within the hold, else GGA) is compared with the HDOP
derived from the sky it states. When they differ by more than
`max(reported_vs_derived_tol, reported_vs_derived_rel × derived HDOP)` (1.0, or 25 % of the derived
HDOP, whichever is larger), the epoch carries `reported_derived_mismatch: true` and, when the
geometry is poor, its deduction is classed `inconsistency`. With good or fair geometry the
disagreement is reported and not scored: nothing is deducted unless the geometry is poor. This is
a deliberate choice (0.36): "zero unless poor" holds for every epoch, so good and fair geometry
score exactly as in 0.35, and a forged HDOP is never silent. The flag
(`reported_derived_mismatch`) is on every epoch of the result and every live line, the note says
"…beyond the tolerance: reported, not scored (the geometry is not poor)" or "…: the geometry
deduction is classed an inconsistency", `geometry_summary.hdop_mismatch` counts the epochs, and
the evidence summary page shows the count, zero included. The 25 % is a **REPRESENTATIVE** engineering choice, not a
measured or standard figure: a receiver that solves for one clock per constellation, or with a
subset of the satellites it tracks (an elevation mask, a C/N0 cut, a RAIM exclusion), states an
HDOP that differs from the single-clock HDOP of every tracked satellite by an amount that grows
with the HDOP, so a fixed tolerance alone would read natural poor geometry as an inconsistency. A
larger difference still reads as one. A deduction classed `geometry` is
a statement about the sky, not a finding that no attack occurred.

**Signal loss is not the sky.** When satellites the receiver lists in view (above `low_elev_deg`)
are not tracked, the engine also derives the DOP of every satellite in view. If that in-view DOP is
within the thresholds and either nothing is tracked or the untracked satellites are spread around
the horizon (not confined to one half of it), the sky was there and the signal was not: the epoch
carries `signal_loss: true`, the note "satellites in view but not tracked: signal environment, not
geometry", and the geometry deduction is classed `environment`. Untracked satellites confined to one
half of the horizon still read as a blocked sky (a wall, a cliff, a quay). A two-sided obstruction
(a canyon or a narrow fjord) reads as signal loss until a skyline is configured. The receiver's
no-fix sentinels are not DOP: a stated HDOP or PDOP of 99 or more, GGA quality 0 and GSA mode 1
give no stated DOP.

| `[geometry]` key | Default | Provenance |
|---|---|---|
| `hdop_max` | 4 | chosen (design note 4.2): at `sigma_uere_m` 1.5 m, HDOP 4 is a 2drms of 12 m, the kinematic check's `kin_pos_tol_m`. IEC 61108-1 is commonly cited as stating its accuracy requirements for HDOP ≤ 4 (or PDOP ≤ 6): recalled from secondary GNSS receiver literature, no specific secondary source consulted and the standard not read; to be checked against the standard's text |
| `pdop_max` | 6 | the PDOP availability threshold of `scenarios/polar-arctic-leo-coverage.toml`; GPS SPS Performance Standard, 5th ed. (2020), PDOP ≤ 6, as cited in `tests/constellation_availability_published_spec_oracle.rs`; to be checked against the standard's text |
| `min_used` | 5 | one more than a fix needs, so a single loss does not end the fix; the fewest with one redundant measurement for RAIM |
| `sigma_uere_m` | 1.5 | a stated input for the 2drms link of `hdop_max`; set the receiver's own figure |
| `reported_vs_derived_tol` | 1.0 HDOP | chosen (design note 4.2): the absolute part of the tolerance; a disagreement beyond the tolerance is not geometry |
| `reported_vs_derived_rel` | 0.25 | REPRESENTATIVE engineering choice: the relative part, for receivers with per-constellation clocks or subset solutions |
| `low_elev_deg` | 15 | design note 4.3: satellites lost below it are lost to the sky; a skyline (0.36 item 1) will extend this |
| `azimuth_gap_deg` | 180 | geometric, informational: every satellite in one half of the horizon |
| `cap_points` | 15 | design note 4.2: geometry alone moves the score from nominal into degraded and never to untrusted; deducted only when the geometry is poor (founder decision B1, 0.36) |
| `full_ratio` | 1.5 | the score's own `full_ratio`: the ramp reaches `cap_points` at 1.5 times the poor thresholds |
| `floor` | the score's `degraded_min` (55) | geometry alone never reaches the untrusted band; the cap in force is `min(cap_points, 100 - floor)`; a floor below `degraded_min` is refused |
| `hdop_good` | 2 | REPRESENTATIVE, the label only: half of `hdop_max` (the 0.35 score's onset ratio) |
| `pdop_good` | 3 | REPRESENTATIVE, the label only: half of `pdop_max` |
| `used_good` | 6 | REPRESENTATIVE, the label only: one more than `min_used`, so a single loss still leaves a redundant measurement |

**What changed in the outputs, and what did not.** No score changes unless the geometry is poor;
the label is always reported. Appended keys: `epochs[].geometry` (`status`, `reasons`, `source`,
`n_used`, `hdop`, `pdop`, `vdop` rounded to 0.001, `open_fraction` (null until a skyline is
configured), `max_azimuth_gap_deg`, `age_s`, `reported_hdop`, `reported_derived_mismatch`, `note`,
`in_view` (satellites listed above `low_elev_deg`), `signal_loss`, `label`), `class` on every
deduction, and at the end `geometry_model` (thresholds, hold, the cap and floor in force,
provenance, class rules) and `geometry_summary` (epochs by status, by label and by deduction
class, and the epochs with a stated-HDOP mismatch); `score_model.weights` is as in 0.35. Two tests hold this to the bytes of the "0.36 portable" baseline
once those keys are removed (the 0.35.0 hashes, re-based when the engine moved to portable maths and kept in the tests as the record of what 0.35.0 released: `docs/revisions/STUDIO15-portable-math-rebaseline.md`). `tests/geometry_trust_no_change.rs` holds every output of both example
sessions (result JSON, CSV, SVG, verdict, replayed live lines, `$PKSHT`, Prometheus, CEF, LEEF).
`tests/geometry_corpus_identity.rs` holds the batch result, summary, live lines and `$PKSHT` of
every committed vessel NMEA corpus (the demo and the maritime reference fixtures, each also as
GPS-only open sky with 8 satellites, and the crew-training scenarios generated from their seeds);
in the two training scenarios whose jamming makes the geometry poor, every epoch that is not poor
is identical and every poor one differs by the geometry deduction alone. A log whose geometry is
poor loses up to 15 points it did not lose in 0.35; that is the intended change. On the demo the
drag-off reads `inconsistency`; `tests/geometry_trust.rs` edits the log to mask the western sky
(fair: labelled, not scored), to mask it and two eastern satellites (poor: geometry deductions,
loss of lock `environment` because high satellites went too), to lose only satellites below 15°
(loss of lock `geometry`), and to state an HDOP the sky does not explain (the poor-geometry
deduction becomes `inconsistency`). The thresholds are MODELLED: chosen, not fitted to any log;
nothing here asserts how often natural degradation and attacks are told apart on real data.

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
