<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# M5: interference sources from orbit, and a space + ground hybrid: results

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026). Readings and amendments:
`xval/m5-jammers-from-orbit/README.md`. MODELLED: a synthetic Baltic scenario. Neutral wording throughout:
interference source, location, uncertainty.

| Step | Commit |
|---|---|
| Readings 1 to 12, with the link-budget note that the space layer alone should locate detected 1 W sources to metres | `f2ccb5635` |
| B4 oracle and its output | `13a6bd4d2` |
| Engine | `eb6468999` |
| Amendment of reading 7 after a disclosed 4-placement timing trial | `3adca4a6c` |
| The full run, once | `result.json`, SHA-256 `05c1689f…f6ac1` |
| Bounds (B5) and the lowest detectable EIRP, from geometry alone after the run, disclosed in the amendment to reading 8 | `bounds.json`, `detect.json` |

The bars were not changed.

## Summary (E30, the scored class: 200 placements × 20 draws = 4 000 draws)

| Bar | Result |
|---|---|
| B1 hybrid wins on success | **NOT MET**. Success: space 0.630, ground 0.000, hybrid 0.630. The bar needs the hybrid ≥ 0.680. |
| B2 hybrid wins on accuracy, common set | **NOT MET**. Medians: hybrid 56.08 m, space 56.07 m, ground 213 km. The bar needs ≤ 44.86 m (0.8 × the smaller). Common set: 114 draws. |
| B3 no worse in the tail, common set | **NOT MET**. p95: hybrid 359 km, space 359 km, ground 263 km. The bar needs ≤ the smaller (263 km). |
| B4 link budget and detection, independent recomputation | **MET**. Within 3e-14 dB and 7e-21 in probability of the numpy oracle at P1 to P10, with identical pass-peak times (`tests/m5_b4.rs`). |
| B5 information adds | **MET**. In 600 placement-and-class cases, the hybrid bound is never larger than a finite layer bound (0 violations; space finite in 400, ground in 82). From geometry alone, after the run (`bounds.json`). |
| B6 determinism | **MET** on Linux. Debug and release give the same bytes for a two-placement run, and that test is in the reproducibility matrix (`tests/m5_verdicts.rs`). |

**M5 is NOT MET.** The roadmap's done condition, B1 to B3, is not met.

## What the run shows

- **The space layer dominates whenever it locates.**
  - At 30 dBm, every placement has at least 6 detected epochs on its pass, surface and elevated alike.
  - The time-difference noise is a few metres in range, so a converged space fix is good to tens of metres: median
    56 m at E30, 2.2 m at E40.
  - The ground's 6 dB power residuals barely move such a fix. So the hybrid's errors equal the space layer's to the
    centimetre, as stated in the readings before the run.
- **Space failures are solver failures, not information failures.**
  - Of the 4 000 E30 draws, 880 gave no space estimate: Gauss–Newton did not converge from the area centroid, or
    ended outside the area.
  - About 600 more converged to a far wrong point. That is the p95 of 359 km.
  - The bounds (B5) are tight in every case. A better start (a coarse search before Gauss–Newton, or a second
    pass) would remove most of these. That is a change to the estimator and needs a new pre-registration.
- **The ground layer, as shipped, does not locate.**
  - A surface source is within the radio horizon (about 36 km) of fewer than 3 coastal sites in most placements.
    An elevated one is seen by more sites, but each gives a single report.
  - B3a's tempering (τ = 1/60, set for 30-epoch sessions) leaves the posterior wide, and its centroid sits about
    200 km off.
  - This is B3a's synthetic-gate miss carried over, not a new fault.
- **Detectability from orbit (`detect.json`).**
  - The lowest EIRP at which every receiver reaches `P_d ≥ 0.9` at the pass peak has a median of 20 dBm (range 19
    to 27 dBm), at both heights.
  - No E10 (10 dBm) source is detected. All E30 and E40 sources are.

## Disclosures

- **The timing trial.** The scenario was run on the first 4 of the 200 placements before the full run. It exposed
  the hybrid's singular EIRP step with no ground report, which was corrected (amendment to reading 7). The trial
  output is kept in `trial-4.json`.
- **Not computed by the run.** The B5 bounds and the lowest detectable EIRP (reading 10) were left out by the engine
  code. They were computed afterwards from geometry alone (amendment to reading 8), and no draw enters them.

## What this does not show

- Real sources may not radiate isotropically or continuously.
- Orbit and clock errors are zero here (M6 sets them), so the space layer is optimistic.
- The ground layout is synthetic.
- Results stay MODELLED.
