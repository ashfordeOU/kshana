# Pre-registration: the sign of the DE421 ME->PA offset in `lunar_frame::icrf_to_moon_pa`

Written 2026-10-13 and committed alone, before the engine is changed and before the SPICE
comparison below is run.

## Finding that prompts it (seen data, disclosed)

While writing the unit test of the opt-in DE440 orientation (pre-registration ea537710), the
analytic `icrf_to_moon_pa` (IAU 2015 mean-Earth orientation composed with the DE421 ME->PA
offset of `me_from_pa`) was compared with the embedded DE440 PA series
(`lunar_orientation`, SPICE-checked to 1.7e-6 rad), at JD 2457000.5, 2459580.5, 2461000.5 and
2462000.5 TDB:

| | 2014-12 | 2022-01 | 2025-12 | 2028-09 |
|---|---|---|---|---|
| DE440 PA vs analytic ME (no offset) | 107.5" | 105.6" | 105.0" | 105.5" |
| DE440 PA vs analytic PA as shipped | 211.2" | 209.3" | 208.8" | 209.2" |
| DE440 PA vs analytic PA with the offset inverted | 8.3" | 7.2" | 6.0" | 7.6" |

The offset is 103.9". As shipped, applying it moves the analytic frame away from PA by about
twice the offset, so it appears to be applied in the wrong direction. Its source is the NAIF
frame kernel `moon_080317.tf` (`TKFRAME_31007`, ANGLES 67.92", 78.56", 0.30", AXES 3, 2, 1,
relative to `MOON_PA_DE421`). This is consistent with the SPICE convention that the TK angles
give the rotation from the TK frame (ME) to the relative frame (PA), the opposite of what
the code assumed.

## Comparison (fixed now) before the change is accepted

Oracle: NAIF SPICE Toolkit (CSPICE N0067 through spiceypy 8.3.0) with `moon_080317.tf`
(https://naif.jpl.nasa.gov/pub/naif/generic_kernels/fk/satellites/moon_080317.tf, SHA-256
recorded at retrieval) and `moon_pa_de421_1900-2050.bpc` (same tree, `pck/`, SHA-256 recorded),
`pxform('MOON_ME', 'MOON_PA', et)`, a constant matrix, at three epochs (2000-01-01,
2022-01-01, 2030-01-01 TDB).

1. **Offset:** the engine's PA<-ME matrix (the factor `icrf_to_moon_pa` applies to the ME
   orientation) after the change equals SPICE's `pxform('MOON_ME', 'MOON_PA')` within
   **1e-12 rad** at all three epochs. The shipped factor is also reported against it (expected:
   about 2 x 103.9" from it, which confirms the finding).
2. **End to end (information plus one bar):** after the change, the analytic `icrf_to_moon_pa`
   lies within **30"** of the embedded DE440 PA series at the four epochs above (the residual
   is the analytic IAU 2015 series against DE440 plus DE421-to-DE440 PA differences;
   expected about 6 to 8").

## Outcome rule

1 holds: the change (the PA<-ME factor becomes `me_from_pa()` instead of its transpose, or the
equivalent change to `me_from_pa`, whichever makes 1 hold, with the doc comment corrected) is
committed with the SPICE fixture and the test that pins 1 and 2. 1 fails: the code is not
changed, and the finding is recorded for a later re-registration. 2 failing with 1 holding is
recorded as a finding about the analytic series; the change still stands.

Every output that moves is regenerated with the repo tools and recorded:
`tests/agency_lro.rs` (the dynamic and reduced-dynamic RMS; their bars of 25 m and 12 m are not
moved; if one fails, that is a finding recorded as such, not a reason to keep the bug), the
lunar_frame unit tests, and any golden output that includes the lunar PA orientation. The LRO
row and `docs/AGENCY-ORBIT-VALIDATION.md` record the before and after numbers.
