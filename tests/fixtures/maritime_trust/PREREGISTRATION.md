# Maritime trust: pre-registration of the external-oracle comparison

Written and committed BEFORE the first comparison run. These tolerances are not changed after the
results are seen; a failure is reported with its numbers, not tuned away.

## What is compared, against what

| # | Quantity (ours) | Independent oracle | Pre-registered tolerance |
|---|---|---|---|
| T1 | NMEA decoding by `receiver_trust::ingest::read_nmea`: GGA (time, latitude, longitude, quality, satellites used, HDOP, altitude, geoid separation), RMC (status, speed, course, date and time), VTG (speed, course, where RMC is absent), HDT (heading), VHW and VBW (speed through the water), ZDA (date and time), GSV (satellite number, talker, signal-to-noise) | `pynmea2` 1.19.0 | latitude and longitude 1e-9 deg; altitude, separation, HDOP, speed, course, heading 1e-9 in their units; signal-to-noise 1e-9 dB-Hz; time of day 1e-6 s; integers (quality, satellites used, satellite number) and the date exactly |
| T2 | `receiver_trust::maritime::en_offset_m`: the east-north offset between two fixes, as distance and bearing | `geographiclib` 2.1 `Geodesic.WGS84.Inverse` (distance s12, forward azimuth azi1) | for baselines up to 2 km, from -45 to 70 deg latitude and across the antimeridian: distance 0.01 m, bearing 0.001 deg |
| T3 | The kinematic monitor's input statistics at every scored epoch (`MarineStats`): implied speed over the 30 s window, dead-reckoning residual against the reported speed and course, implied acceleration, implied turn rate | geodesic distance and azimuth from `geographiclib`; decoded speed and course from `pynmea2`; the combining arithmetic written in Python from the documented rules | speed 0.005 m/s; residual 0.02 m; acceleration 0.0005 m/s^2; turn rate 0.001 deg/s |
| T4 | Heading-versus-course residual, speed-log-versus-ground-speed residual, antenna-altitude-versus-height residual (each the median over the 10 s window), C/N0 spread and C/N0 rise against the baseline | `pynmea2` decoding, `numpy` median and standard deviation, the angle difference written in Python | 1e-6 in their units (deg, kn, m, dB) |
| T5 | The trust-score aggregation (`receiver_trust::score::score_from_ratios`): points per monitor, score, band, order of deductions | a clean-room Python re-implementation written from `docs/RECEIVER-TRUST.md` and `docs/MARITIME-TRUST.md` ONLY, by a reader that was not given the Rust source | points 1e-9; score equal to 0.1 (inputs are chosen away from rounding ties); band and order exactly |

## What these comparisons do NOT establish

* T1 to T4 check the arithmetic the monitors rest on (decoding, geodesy, medians, wrap-around
  angle differences) against standard libraries. They do not check that a monitor's window lengths,
  allowances or thresholds are the right ones: those are this project's own rules, reproduced in
  Python from the same specification.
* T5 checks the implementation of the score against its published rule. The rule (the weights, the
  ramp, the band edges) is this project's own and has no external source; the clean-room reader
  shows that the documentation is sufficient and that the code does what it says, not that the
  rule is right.
* Nothing here is evidence of how any monitor or the score performs on real interference, and no
  such figure is given. The data are synthetic text written by `receiver_trust::synth`.
* The THS sentence (heading) is read by this crate but `pynmea2` has no class for it, so it has no
  external oracle and is not covered (the scope was reduced to this before any comparison was run).
* The NMEA ROT sentence is not read by any monitor and is not covered. The mapping from an NMEA
  talker and satellite number to a RINEX-style satellite id is this project's own table; only the
  number and the talker are compared with the oracle.
* The quantities not listed (time-step and host-clock deviations, the OSNMA status, the other
  monitors' ratios) have no external oracle and stay as they are.

## Oracle provenance

`pynmea2` 1.19.0 (MIT) and `geographiclib` 2.1 (MIT), with `numpy` for medians and standard
deviations, run offline by `scripts/gen_maritime_trust_ref.py`; nothing is shipped. The inputs are
synthetic NMEA text from `kshana::receiver_trust::synth`, written to this directory by
`examples/gen_maritime_trust_ref_inputs.rs`; no measured data, no partner data.

## First comparison run, and what was changed after it (recorded openly)

The tolerances above were not changed. Four things were found by the first runs and were changed;
each is listed with its numbers so the changes can be judged.

1. **Inputs that exercised too little (inputs changed, tolerances not).** On the first run the
   acceleration and turn-rate statistics were 0 at every scored epoch (the kinematic monitor
   clamps them at zero below its position-uncertainty allowance), so those two comparisons agreed
   vacuously; and the antimeridian voyage never crossed 180 degrees. The inputs were changed: the
   main voyage now has a turn of about 60 degrees after about 2 km and a made-up 170 m position
   step at 320 s (acceleration non-zero at 163 and turn rate at 100 of 341 scored epochs); the
   antimeridian voyage starts at 179.998 E. The test now asserts that these statistics are non-zero
   at enough epochs.
2. **A bug in the synthetic generator.** Crossing 180 degrees, `synth` wrote a longitude above 180
   (an invalid NMEA field, which the reader rightly rejected). Fixed (longitude wraps); the demo
   log is unaffected.
3. **T2 bearing, registered as the geodesic's forward azimuth at the first fix, was amended.** With
   the corrected inputs, distance agreed (largest difference 1.3e-5 m against 0.01 m), but the
   bearing violated 0.001 degrees at 77 of 223 pairs, worst 8.3e-3 degrees. This is by definition,
   not an arithmetic error: the forward azimuth at the first fix differs from the direction of the
   chord between the fixes (which `en_offset_m` gives) by about half the convergence of the meridians
   between them, which grows with latitude and baseline. The oracle quantity was changed to the
   geodesic's MEAN azimuth, `azi1 + wrap(azi2 - azi1) / 2`, with the SAME tolerance (0.001 degrees).
   This amendment was made after seeing the result and is not blind; the original quantity's numbers
   are above.
4. **T5, a gap in the specification, found by the clean-room reader.** The first reader reproduced
   every score, band and points value (largest difference 0), but ordered 87 cases with equal points
   differently from the code (the documentation said "largest first" and nothing about ties; the code
   breaks ties by the order of the monitor names). It also noted two documentation examples that did
   not match the formula and a sentence that overstated a band. The documentation was completed (tie
   order, rounding, ratio of a pass-or-fail monitor, the examples, the sentence) and a second reader,
   again given only the documentation, wrote the version that is compared.
5. **T1 angles compared modulo 360 (amendment after the run).** One course in the voyage is written
   `360.0` by the generator; the reader normalises it to 0 degrees, which `pynmea2` reports as 360.
   They are the same course, so the course and heading comparisons are now circular (difference
   wrapped to [-180, 180)); the tolerance (1e-9 degrees) is unchanged. First-run numbers for this
   family: one violation (epoch 312, 0 against 360), all other 1,085 comparisons exact to 1e-13.

Rulings on these amendments (coordinator, 2026-10-10): the changed inputs, the generator fix and the
circular angle comparison were accepted; the bearing amendment was accepted only with full
disclosure, so the original forward-azimuth comparison stays in `t2` as an executable, explicitly
NON-pre-registered descriptive bound (below 0.01 degrees; the recorded largest difference is
8.27e-3 degrees), and the documentation (`docs/MARITIME-TRUST.md`, the `en_offset_m` doc comment)
states that the bearing is the geodesic's mean azimuth.
