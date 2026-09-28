# Campaigns

A single scenario answers one question about one situation. A mission is a sequence of
situations, and a design study is a family of them. The `campaign` scenario kind composes
the existing kinds into one run without re-implementing any of them: every member is an
ordinary scenario table carrying its own `kind`, dispatched through `api::run_toml`
exactly as `kshana <file>.toml` would run it, and the campaign only reads numbers back out
of the result documents.

A campaign is **MODELLED**. Its composition identities are tested (below), but chaining
phases is a modelling choice, and each phase is only as good as the kind that ran it.

Run one like any other scenario:

```bash
kshana scenarios/campaign-jam-spoof-holdover-integrity.toml
# writes .result.json, .chart.svg and .report.html next to the file
```

A campaign may contain any combination of four sections; one with none runs and its
summary says it composed nothing.

## `[[phases]]`: a chained mission on one timeline

Each phase runs one or more scenarios over a window of a shared mission timeline, for
example a clock in holdover and an inertial navigation system (INS) coasting at the same
time. The outputs of each run are read into named **channels**, placed at the phase's
start time, and resampled onto a common grid (`[timeline] step_s`) by zero-order hold: a
grid time takes the latest sample of the owning phase's run at or before it, and is null
where no run of that phase provides the channel.

| Channel | Unit | What it is | Preset source |
|---|---|---|---|
| `time_error_ns` | ns | clock time error | `clock`: `<side>.series[].error_ns`; `spoof`: `<side>.series[].offset_ns` |
| `guard_ns` | ns | time-error guard | the run's own `threshold_ns` |
| `cn0_dbhz` | dB-Hz | mean effective carrier-to-noise density ratio (C/N0) over the visible satellites | `jamming`: mean of `epochs[].sats[].cn0_effective_dbhz` |
| `cn0_floor_dbhz` | dB-Hz | tracking-loss floor | `jamming`: the scenario's `tracking_threshold_dbhz`, when it states one |
| `tracking` | count | satellites still tracking | `jamming`: `epochs[].tracking` |
| `protection_level_m` | m | vertical protection level | `integrity`: `epochs[].vpl_m` |
| `alert_limit_m` | m | vertical alert limit | `integrity`: `al_v_m` |
| `position_error_m` | m | position error | `gnss-ins`: `<side>.series[].error_m` |
| `position_threshold_m` | m | position-error threshold | `gnss-ins`: `threshold_m` |
| `alarm` | 1 | 1 while any monitor of the phase alarms | see below |

`<side>` is `classical` unless the run sets `side = "quantum"`. Any other quantity is read
with an explicit `[[phases.runs.series]]` entry: a time path with one `[]` naming the rows
(`epochs[].t`), a value path sharing those rows or a scalar broadcast to every row (prefix
`input:` reads the run's scenario instead of its result), an optional reduction (`mean`,
`min`, `max`, `count`) for several values under one row, a scale, and a unit for a channel
the campaign does not know.

**Alarms** come from three places, combined by logical OR within a phase:

- preset flags read from the run: `jamming` alarms while fewer than four satellites track
  (its own availability definition); `integrity` alarms at epochs it marks unavailable;
- preset rules on the phase's channels, evaluated **after** `carry`: `clock` alarms while
  the absolute time error exceeds `guard_ns`; `gnss-ins` while the position error exceeds
  `position_threshold_m`; explicit rules go in `[[phases.runs.alarms]]`;
- alarming events: `spoof` raises one at its clock-aided monitor's `detect_time_s`;
  `spoof-detect` raises one at phase start when its fused decision alerts.

**State is handed on** between phases in three explicit ways:

- `carry = ["time_error_ns"]` adds the channel's value at the end of the previous phase to
  this phase's values of it. The clock phase a spoofer pulled is where the holdover starts
  from. Adding the offset is exact for clock phase, which integrates frequency; for a
  position error it assumes the two errors are collinear, the pessimistic case.
- `[[phases.handoff]]` writes a number from the previous phase (`channel:<name>` for a
  channel's end value, or any result path of a previous run) into a dotted key of this
  phase's scenario before it runs, with an optional scale and offset.
- `end_at = "<result path>"` ends the phase at a time a run computed, capped at
  `duration_s`. The bundled mission ends its spoofing phase at
  `classical.detect_time_s`.

`skip_s` drops the first seconds of a run's own timeline (a warm-up) before phase time zero.

### The bundled mission

`scenarios/campaign-jam-spoof-holdover-integrity.toml` runs 18 member scenarios over six
phases on a 10 s grid:

| Phase | Runs | What the timeline shows |
|---|---|---|
| nominal, 600 s | `clock`, `jamming` (no jammer), `integrity` | time error 0 ns; C/N0 43.0 dB-Hz against a 25 dB-Hz floor; vertical protection level 9.1 to 21.6 m against a 50 m alert limit |
| jamming, 600 s | the same, jammer at -30 dBW, 1 km | C/N0 falls to 27.7 dB-Hz, all 8 satellites still tracking |
| spoofing, ended at 370 s by `end_at` | `spoof` (0.1 ns/s time ramp), `spoof-detect`, `jamming` | time error ramps to 36 ns; the radio-frequency detector alarms at phase start, the clock-aided monitor at 370 s |
| holdover, 1800 s | `clock` (denied, carries 37.0 ns), `gnss-ins` (tactical unit coasting), `jamming` at 10 dBW | every satellite lost (C/N0 about -12 dB-Hz); time error 36.4 to 62.7 ns against the 50 ns guard; position error to 24 km |
| integrity-alarm, 600 s | `clock` (carries 59.6 ns), `jamming` and `integrity` with a 25 deg mask | 5 satellites tracking; protection level 19 to 135 m, missing at 18 of 60 grid times; the carried time error, 52.1 to 61.7 ns, stays above the 50 ns guard, so the alarm is up for the whole phase |
| recovery, 600 s | `clock`, `jamming` (no jammer), `integrity` | time error back to 0 ns; alarm quiet |

The integrity runs use the `integrity` example's own user track (a 0.4 km-altitude
circular track), not the jamming receiver's fixed site, and the 25 deg mask stands in for
the partial sky of a reacquiring receiver. Those are scenario choices, stated in the file.

### A mission driven by the L-band spectrum

`scenarios/campaign-spectrum-holdover-integrity.toml` runs 8 member scenarios over three
phases on a 1 s grid, with the C/N0 of GPS L1 C/A and Galileo E1 read from the `spectrum`
kind (see [SPECTRUM.md](SPECTRUM.md)) rather than from the `jamming` kind's per-satellite
table. The jammers are the ones in `scenarios/l-band-waterfall-jamming.toml`.

| Phase | Runs | What the timeline shows |
|---|---|---|
| onset, ended at 10 s by `end_at` | `clock`, `spectrum` (chirp from 10 s), `integrity` | L1 C/A 43.48 and E1 44.98 dB-Hz; the phase ends at the spectrum run's own first loss of L1 C/A (`timeline.bands[0].first_loss_t_s`); protection level 21.6 m against 50 m |
| holdover, 600 s | `clock` (denied, carries the onset error, 0 ns here), `spectrum` (chirp on) | L1 C/A 3.38 and E1 4.69 dB-Hz, both below the 25 dB-Hz floor; time error -0.07 to 5.06 ns against the 50 ns guard; alarm up |
| galileo-fallback, 300 s | `clock` (re-synchronised), `spectrum` (CW tone on the L1 carrier), `integrity` on a Galileo-like Walker 24/3/1 | L1 C/A held at 17.98 dB-Hz, E1 back to 44.98 dB-Hz; protection level 6.1 to 17.7 m; alarm quiet |

E1 recovering under the CW tone rests on the spectrum kind's continuous-spectrum
treatment: the tone sits in the null of the MBOC spectrum and couples nothing. A real tone
would couple through the code's spectral lines; that is stated in the file and in
SPECTRUM.md.

## `[sweep]`: a parameter grid over any kind

One to three dotted scenario keys, each over a linear or logarithmic range, on the same
axis values the `sweep-nd` kind uses. Every axis has a name and a unit; every metric has a
name and a result path, and its unit is read from the swept kind's own units block unless
the campaign declares one. With `runs > 1` every node is a seeded Monte Carlo ensemble
(realisation `k` at the node's seed plus `k`), reported with the statistics below.
`scenarios/campaign-sweep-jammer-power.toml` sweeps a jammer 1 km from the receiver from
-50 to +10 dBW: the mean jammer-to-signal ratio moves exactly 1 dB per dB (12.2 to
72.2 dB), and availability falls from 1 to 0 between -30 and -25 dBW.

## `[monte_carlo]`: a seeded ensemble

Realisation `k` runs the scenario with its seed key set to `base_seed + k`, the convention
the clock ensemble already uses, so the ensemble reproduces exactly. Each metric reports
the mean, the population standard deviation, the nearest-rank 5th, 50th and 95th
percentiles, a fixed-seed percentile-bootstrap 95% confidence interval on the mean (2000
resamples), and, by default, every sample in seed order. Result paths may index arrays:
`classical.series[-1].error_ns` is the last sample.

## `[compose]`: several scenarios under shared conditions

Named shared values (a number or an array of numbers, with a unit) are written into each
member at the keys it binds them to, so the members cannot disagree about the shared
condition. Every member runs, and for each metric the combined summary gives the smallest,
largest and mean value across the members, naming the best and worst.
`scenarios/campaign-shared-jammer-sea-road.toml` puts one 8 dBW jammer between a ship in
the Gulf of Finland (about 30 km away) and a car on a Helsinki coast road (about 50 km):
the ship loses every satellite (mean jammer-to-signal ratio 39.0 dB) while the car keeps
at least four (34.6 dB).

## Reproducibility

Every campaign result carries `scenario_hash`, the SHA-256 of the canonical JSON form of
the campaign document (key order and formatting do not change it), and a
`reproducibility` block with the number of member runs and `run_digest`, a SHA-256 over
every member result's digest in dispatch order. Two runs with the same digest produced
byte-identical member results. Each phase run also records its kind, its own
`scenario_hash` where the kind has one, and the SHA-256 of its result document. Every
number in the document has a units entry.

The core is sequential and reads no files, so a campaign runs unchanged in the
WebAssembly build. Campaigns may not contain campaigns.

## What is checked

`tests/campaign_composition_reference.rs` pins the composition identities:

- **A one-phase campaign reproduces the stand-alone run bit for bit.** For `clock`,
  `integrity` and `jamming`, the member's result document is byte-identical to `run_toml`
  on the scenario file, its digest is the one the campaign reports, and with the grid at
  the run's own step every aligned value equals the stand-alone series value (the jamming
  C/N0 equals the mean computed independently from the stand-alone document).
- **A one-node sweep and a one-member composition** read exactly the stand-alone number.
- **A fixed-seed ensemble is byte-stable**, and realisation `k` is exactly the stand-alone
  run at `seed + k`; the campaign hash ignores key order.
- **An analytic case.** `scenarios/campaign-monte-carlo-clock-holdover.toml` runs 200 seeds
  of a chip-scale atomic clock with only white frequency noise (q_wf = 9e-20 s^2/s,
  Microchip SA.45s sigma_y(1 s) = 3e-10), synchronised to 590 s and coasting to 3600 s. The
  final time error is Gaussian with mean 0 and standard deviation sqrt(q_wf * 3010 s) =
  16.459 ns (the random walk of phase under white frequency noise, NIST Technical Note
  1337). The reported interval, [-2.52, 1.59] ns, contains the true mean 0; the sample
  standard deviation, 14.93 ns, gives a chi-square statistic of 164.5 on 199 degrees of
  freedom, inside the two-sided 99% interval [151.37, 254.14]. At 3000 seeds the same
  scenario gives 16.31 ns.
- **The spectrum-driven chain** reads the stand-alone numbers: the onset phase lasts
  exactly the spectrum run's first-loss time, and every L1 C/A and E1 value on the
  timeline equals, to 1e-9 dB, the stand-alone waterfall example's row for the same
  jammer state (nominal, chirp alone, CW tone alone).
- **The chain** hands state on as documented: the spoofing phase lasts exactly the spoof
  run's detection time, the holdover carries exactly the spoof run's offset at detection,
  recovery carries nothing, and the alarm is up wherever the protection level is missing or
  exceeds the alert limit.

These check that composing changes nothing it should not. They do not validate a chained
mission against a measured one, which is why the three campaign rows in
[VERIFICATION-MATRIX.md](VERIFICATION-MATRIX.md) are MODELLED.
