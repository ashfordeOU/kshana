<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# FUT05B (release 0.36): the DE421 ME->PA offset fixed in `lunar_frame::icrf_to_moon_pa`, and every published number it moved

**Programme rule R4:** a changed published number is a revision. This file lists each one
old -> new.

**Abbreviations.** ME: lunar mean-Earth/polar-axis frame. PA: lunar principal-axis frame.
LRO: Lunar Reconnaissance Orbiter. RMS: root mean square. RTN: radial, transverse, normal.

## 1. What changed in the engine

`lunar_frame::icrf_to_moon_pa` composes the analytic IAU 2015 ME orientation with the fixed DE421
ME->PA offset of the NAIF frame kernel `moon_080317.tf` (`TKFRAME_31007`). Until 0.36 the code
built `Rx(0.30") Ry(78.56") Rz(67.92")`, read it as PA->ME and applied its transpose. That is
both the wrong direction and the wrong composition order, and it put the analytic PA frame
about 208" from PA instead of on it. The offset is now `Rz(67.92") Ry(78.56") Rx(0.30")`,
mapping ME->PA as SPICE's Frames Required Reading defines TK Euler angles. It agrees with SPICE
`pxform('MOON_ME','MOON_PA')` within 2.6e-16 rad, and the analytic PA frame is 5.9" to 8.3" from
DE440 PA over 2014 to 2028.

* Pre-registration e1ead19b. Run 1 (NOT MET, recorded) 1b092c0d. Re-registration be33382e.
  Fix 8a7667e8.
* Evidence: `docs/design/evidence/fut05b-me-pa-offset-sign/`,
  `tests/lunar_me_pa_offset_spice_oracle.rs`.

## 2. Published numbers that moved

All from `tests/agency_lro.rs` (GRGM660PRIM d/o 100, 241 epochs, 4 h, 2022-001). Bars unchanged
(25 m dynamic, 12 m reduced-dynamic).

| Quantity | was | now |
|---|---|---|
| raw overlap | 53.8 m | 39.9 m |
| dynamic 3-D RMS | 12.6 m | 12.05 m |
| dynamic RTN | 3.07, 10.19, 6.81 m | 2.91, 10.11, 5.88 m |
| reduced-dynamic 3-D RMS | 6.65 m (published as 6.6 m) | 6.67 m |
| reduced-dynamic RTN | 3.49, 4.56, 3.35 m | 3.41, 4.58, 3.44 m |

Sites updated: `docs/AGENCY-ORBIT-VALIDATION.md`, `docs/VALIDATION.md`, the README LRO line,
`tests/agency_lro.rs` (header and messages), `CHANGELOG.md`, and a dated erratum in
`paper/kshana-technical-report.md`. No ledger row and no figure carries these numbers.

## 3. Claim corrected

The 0.30 DE-grade cross-validation (`xval/anise-lunar-od`: DE440 PA orientation and DE440
ephemeris through ANISE) gave 41.5 m raw, 12.0 m dynamic and 6.67 m reduced-dynamic. It was
read as "DE-grade inputs improve the dynamic fit (12.6 -> 12.0 m) but not the reduced-dynamic
one". With the offset corrected, the analytic stack gives 12.05 m and 6.67 m, so **the
dynamic-tier "improvement" was an artefact of this error, not of the DE-grade inputs.** The
analytic and DE-grade fits agree on both tiers. The reduced-dynamic reading (an
empirical-tier-irreducible floor of about 6.7 m) stands.
