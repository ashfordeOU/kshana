# Streaming M2M4 C/N0 in the tracking channel: results

Pre-registration: `PREREGISTRATION.md` (committed at `3cd9150`, before the implementation).
These numbers were regenerated on 2026-10-12 from the current tree (`release/0.36.0-rc` @
`c9e37402`) by running the tests that carry the bars; they match the figures first recorded in
the `CHANGELOG.md` entry for the change. Reproduce with
`cargo test --release --test iq_track_cn0 -- --nocapture`.

The sources are synthetic signals with known C/N0 (the injected truth), generated inside
`tests/iq_track_cn0.rs` and tracked through the default design. This is internal consistency
against injected truth, not an external oracle.

## M1: GPS L2C CM (20 ms code), nominal 40 dB-Hz

| PLL noise bandwidth (Hz) | M2M4 (dB-Hz) | NWPR (dB-Hz) | coherent time (s) |
|---|---|---|---|
| 1 | 39.93 | 39.55 | 0.02 |
| 2.5 | 39.93 | 39.39 | 0.02 |
| 5 | 39.93 | 39.11 | 0.02 |
| 10 | 39.93 | 38.22 | 0.02 |

Worst |M2M4 − nominal| = 0.07 dB. **M1 PASS** (bar ≤ 0.5 dB at every bandwidth). NWPR falls
by 1.33 dB from 1 Hz to 10 Hz, the bias the change addresses; M2M4 does not move.

## M2: GPS L1 C/A at 2.5 MS/s (incommensurate rate), nominal 45 dB-Hz

M2M4 = 45.34 dB-Hz at the end of the 6 s run (NWPR 45.12 dB-Hz). **M2 PASS**
(|45.34 − 45| = 0.34 dB ≤ 0.5 dB).

## M3: NWPR unchanged bit for bit

The FNV-1a checksum over the `f64` bit patterns of the NWPR estimate of all 5999 epochs of the
M2 run equals the value captured from the base commit `010b30b9` before the change
(`0x05b3caf744da2a2d`). **M3 PASS.**

## M4: epoch formats

The CSV, JSON and binary track-epoch formats carry `cn0_m2m4_dbhz` immediately after
`cn0_beaulieu_dbhz`; the binary round trip is exact and the record stays 184 bytes.
**M4 PASS.**

## Outcome

All four pre-registered bars pass; no bar was changed after a run. The default campaign
scoring estimator became `cn0_estimator = "m2m4"` (see `CHANGELOG.md`).
