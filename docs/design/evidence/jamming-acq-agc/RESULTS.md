# Acquisition hysteresis and the front-end quantiser in the jamming kind: results

Item CAP-06 (c), run 2026-10-14 against the bars of [`PREREGISTRATION.md`](PREREGISTRATION.md)
(70c72fcc, before the code) and, for H2 to H4 on a second run set,
[`PREREGISTRATION-SUPPLEMENT-1.md`](PREREGISTRATION-SUPPLEMENT-1.md) (37793290, before those
runs). No bar was changed.

| bar | verdict | numbers |
|---|---|---|
| H1/G1 additivity | **MET** | see below |
| H2 no hysteresis is no hysteresis | MET, **trivially** | registered runs: every link lost, so `acquired` and "not lost" are both false everywhere |
| H3 independent recomputation | **NOT MET (uninformative)** | every one of 1824 flags agrees, but no link shows the hysteresis (see F1) |
| H4 monotone in the threshold | MET, **trivially** | zero acquired at every threshold and power |
| H2-S (supplement) | **MET** | 1824 links at −40 to −25 dBW: `acquired` = "not lost" everywhere |
| H3-S (supplement) | **MET** | every one of 1824 flags agrees; 732 differ from "not lost" (informative) |
| H4-S (supplement) | **MET** | acquired link-epochs never rise with the threshold (table below) |
| G2 quantiser loss vs Monte Carlo | **MET** | 12 estimates, worst difference 0.0007 dB (bar 0.02 dB) |
| G3 AGC reading vs the IQ-layer AGC loop | **MET** | 5 J/N values, worst difference 0.012 dB (bar 0.05 dB) |

## H2 to H4

**F1 (the registered runs were uninformative).** On `jamming-demo` at 10, 20, 25 and 30 dBW,
every link's effective C/N0 was between −30.5 and −7.2 dB-Hz: far below both thresholds, so
every link was lost and never acquired. The engine and `xval/jamming-acq-agc/hysteresis.py`
agree on every flag, but a run where nothing is ever acquired cannot tell hysteresis from its
absence. Under its registered condition, H3 is NOT MET. H2 and H4 have no such condition and
are met, trivially. The powers had been chosen upward from the demo's own 10 dBW without
looking at its operating point.

Supplement 1 registered the same bars at −40, −35, −30 and −25 dBW. It chose those powers
after seeing F1, to put the links across the thresholds. With acquisition at 32 dB-Hz and a
60 s delay:

| jammer | links | acquired | acquired ≠ not lost | acquired link-epochs at 25 / 28 / 32 / 36 / 40 dB-Hz |
|---|---|---|---|---|
| −40 dBW | 456 | 440 | 16 | 440 / 440 / 440 / 440 / 118 |
| −35 dBW | 456 | 440 | 16 | 440 / 440 / 440 / 118 / 0 |
| −30 dBW | 456 | 118 | 338 | 440 / 440 / 118 / 0 / 0 |
| −25 dBW | 456 | 0 | 362 | 350 / 0 / 0 / 0 / 0 |

**F2.** At −25 dBW, 362 links stay above the 25 dB-Hz tracking threshold, which the existing
`status` counts as tracking. None ever reaches 32 dB-Hz, so none is ever acquired. A receiver
that has to acquire first has no fix at that power, where the tracking-only count says it has
one. At −40 and −35 dBW, the 16 differing links are the first 60 s of the run: the delay
counts from t = 0.

## G2 and G3

`xval/jamming-acq-agc/quantiser_mc.py` (numpy 2.5.3, 2²² samples, seed 20261014) finds its own
optimum step by numerical integration and estimates the loss by Monte Carlo:

| ADC bits | engine (dB) | Monte Carlo: noise only / J/N 20 dB / J/N 40 dB (dB) |
|---|---|---|
| 1 | 1.9612 | 1.9615 / 1.9613 / 1.9619 |
| 2 | 0.5495 | 0.5495 / 0.5493 / 0.5501 |
| 3 | 0.1657 | 0.1659 / 0.1659 / 0.1661 |
| 4 | 0.0504 | 0.0504 / 0.0503 / 0.0504 |

G3 compares with the IQ layer's `Agc` loop (2²⁰ complex samples at 4 MHz, τ = 1 ms):

| J/N | engine `agc_gain_reduction_db` | AGC loop |
|---|---|---|
| 0 dB | 3.0103 | 2.9984 |
| 10 dB | 10.4139 | 10.4186 |
| 20 dB | 20.0432 | 20.0368 |
| 30 dB | 30.0043 | 30.0021 |
| 40 dB | 40.0004 | 40.0077 |

The test reads the loop's gain at the end of each 1024-sample block over the last half of the
samples (512 readings), rather than at every sample. This is disclosed here.

## G4 (disclosed finding, not a bar): a CW jammer

The engine applies the Gaussian-input loss whatever the jammer, and flags it
(`loss_model = "gaussian-input-not-valid-for-this-jammer"`) for CW, narrowband and swept
jammers. The Monte Carlo measures the real weak-signal loss with a CW jammer, at the AGC level
set for the total power. The loss is measured against an unquantised receiver seeing the same
total power. The gain estimator subtracts `q(x)·s`, which has zero mean, as a control variate:
the estimand is the registered `E[q(x + ε·s)·s]/ε`.

| ADC bits | Gaussian (engine) | CW at J/N 0 / 10 / 20 / 30 / 40 dB |
|---|---|---|
| 1 | 1.96 | 2.80 / 6.32 / 6.95 / 6.81 / 6.93 |
| 2 | 0.55 | 0.72 / 0.63 / 1.91 / 2.41 / 2.24 |
| 3 | 0.17 | 0.21 / 0.12 / 0.85 / 1.35 / 1.44 |
| 4 | 0.05 | 0.06 / 0.08 / −0.39 / −0.92 / −0.40 |

A strong CW jammer costs a 1-bit ADC about 5 dB more than the Gaussian figure, and a 2- or 3-bit
ADC 1 to 2 dB more. At 4 bits the measured value goes negative at high J/N. Against this
reference, a quantised 4-bit front end does slightly better than an unquantised one that counts
all of the CW's power as noise. The anti-jam equation treats CW through `Q`, not as white
noise, so this column is not a correction the engine could add as it stands. Under the
`gaussian-input-not-valid` flag the engine's figure is optimistic for 1 to 3 bits.

## H1/G1

Every one of the 150 scenarios under `scenarios/` was run with the release binary of this change.
Each `result.json` was compared byte for byte with the runs of 08d83b4d and of e69e1fd6 (CAP-06b):
**all 150 were byte-identical** to both. `quantum-pnt-demonstrator.suite` is a study suite, not
a scenario, and fails under every binary.

- Each section's units appear only with it (`h1_g1_units_only_with_their_section`).
- The jamming tests, `registry_golden` and `cross_platform_golden` pass unchanged.

## How to reproduce

```
cargo test --test jamming_acq_agc -- --ignored export_hysteresis_inputs
python3 -I xval/jamming-acq-agc/hysteresis.py xval/jamming-acq-agc/inputs.json xval/jamming-acq-agc/expected_hysteresis.json
python3 -I xval/jamming-acq-agc/hysteresis.py xval/jamming-acq-agc/inputs_s1.json xval/jamming-acq-agc/expected_hysteresis_s1.json
python3 -I xval/jamming-acq-agc/quantiser_mc.py xval/jamming-acq-agc/expected_quantiser.json
cargo test --test jamming_acq_agc -- --nocapture
```
