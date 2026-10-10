# Maritime trust: pre-registration of the external-oracle comparison

Written and committed BEFORE the first comparison run. These tolerances are not changed after the
results are seen; a failure is reported with its numbers, not tuned away.

## What is compared, against what

| # | Quantity (ours) | Independent oracle | Pre-registered tolerance |
|---|---|---|---|
| T1 | NMEA decoding by `receiver_trust::ingest::read_nmea`: GGA (time, latitude, longitude, quality, satellites used, HDOP, altitude, geoid separation), RMC (status, speed, course, date and time), VTG (speed, course, where RMC is absent), HDT and THS (heading), VHW and VBW (speed through the water), ZDA (date and time), GSV (satellite number, talker, signal-to-noise) | `pynmea2` 1.19.0 | latitude and longitude 1e-9 deg; altitude, separation, HDOP, speed, course, heading 1e-9 in their units; signal-to-noise 1e-9 dB-Hz; time of day 1e-6 s; integers (quality, satellites used, satellite number) and the date exactly |
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
