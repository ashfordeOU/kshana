# Receiver trust: assessing a real GNSS receiver log

`kshana receiver-trust` reads a log from a real global navigation satellite system (GNSS)
receiver, runs trust monitors over it epoch by epoch, and says when and why the receiver's
fix stopped being trustworthy. It can also score the log against events and predictions you
state **before** the run: whether each event was detected in time, and whether a modelled
carrier-to-noise density (C/N0) drop agrees with what the receiver measured.

The observables are the receiver's own; the monitors and their thresholds are the engine's
and yours. Every result carries that label, the SHA-256 of the log, and every threshold it
ran with, so a run can be repeated and audited.

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

The file goes in by `path` (resolved against the scenario's own folder), or inline as
`text` or `base64` (the only choices in a browser).

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

An epoch is **untrusted** when RAIM, the clock monitor, a solve failure or a position jump
alarms, or the C/N0 drop reaches twice its threshold; **degraded** on any other alarm; and
**nominal** otherwise.

The engine path (`raim`, `solve-failure`, `clock`) is the same computation as the
JammerTest 2024 spoofing oracle in `tests/jammertest_spoof_oracle_support`:
`tests/receiver_trust_jammertest.rs` checks that, on all eight published onsets, the first
alarm falls on the same epoch and is of the same kind.

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
