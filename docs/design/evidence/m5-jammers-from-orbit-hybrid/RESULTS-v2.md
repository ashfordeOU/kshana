<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# M5 v2: a started space solver and a ground layer with session evidence: results

Pre-registration: `PREREGISTRATION-v2.md` (signed off 9 November 2026). Readings: `xval/m5-jammers-from-orbit/README.md`,
readings 13 to 17. MODELLED: a synthetic scenario. v1 (`RESULTS.md`) stays published as NOT MET.

| Step | Commit |
|---|---|
| Sign-off | `4a4a853c5` |
| Readings 13 to 17, before any v2 code or seed | `3b0c69bc2` |
| Code (on `ws/m5-v2`, then merged) | `a198fa013`, `82cef0cfb` |
| Unscored implementation checks on seed 4699 (`check-v2-seed4699.json.gz`); no code change after them | `393afcd72` |
| v1's pinned output bytes kept (the v2-only `version` and `seeds` keys); a clippy allowance. No v2 computation changed | `7b314d9ef` |
| The run, once, on seeds 4600 and 4601 (`result-v2.json`), and the B5 bounds (`bounds-v2.json`) | this commit |

The bars are v1's and were not changed.

## Summary (E30, the scored class: 200 placements × 20 draws = 4 000 draws)

| Bar | Result |
|---|---|
| B1 hybrid wins on success | **NOT MET**. Success: space 0.990, ground 0.00025, hybrid 0.990. The bar needs the hybrid ≥ 1.040, which no estimator can reach. |
| B2 hybrid wins on accuracy, common set | **NOT MET**. Medians: hybrid 7.352 m, space 7.351 m, ground 81.9 km. The bar needs ≤ 5.881 m (0.8 × the smaller). Common set: 262 draws. |
| B3 no worse in the tail, common set | **NOT MET**, by 3.5 mm. p95: hybrid 71.300 m, space 71.297 m, ground 255 km. The bar needs ≤ the smaller (71.297 m). |
| B4 link budget and detection | **MET**, unchanged from v1. The link and detection code did not change, and `tests/m5_b4.rs` passes. |
| B5 information adds | **MET**. In 600 placement-and-class cases the hybrid bound is never larger than a finite layer bound (0 violations; space finite in 400, ground in 75, hybrid in 401). |
| B6 determinism | **MET** on Linux. A two-placement v2 run gives pinned bytes (`tests/m5_verdicts.rs`, in the reproducibility matrix). v1's pinned bytes are unchanged. |

**M5 v2 is NOT MET** (B1 to B3), as the pre-registration stated up front was likely.

## What changed against v1

| E30 | v1 | v2 |
|---|---|---|
| Space estimates | 3 120 of 4 000 | 4 000 of 4 000 |
| Space success (within 5 km) | 0.630 | 0.990 |
| Space median, common set | 56.07 m | 7.35 m |
| Ground success | 0.000 | 0.00025 |
| Hybrid success | 0.630 | 0.990 |

E40: space and hybrid success 0.990, median 0.95 m. E10: no detection, as in v1.

## What the result shows (descriptive, after the run)

- **The started solver fixes the space layer.** Every E30 draw now gives an estimate, and 99 % are within 5 km. The
  v1 misses were solver starts, as the v1 bounds suggested.
- **The ground layer adds nothing.** Even with 30 reports per site, B3a v1 as shipped (τ = 1/60) puts its centroid
  tens of kilometres off. That repeats B3a's own synthetic-gate miss (and B3a v2 is NOT MET too, `53ca11af5`).
- **The hybrid equals the space layer.** With the space fix at metres and a ground layer at tens of kilometres, the
  hybrid matches the space layer to millimetres. It cannot beat it by 5 points of success (B1) or by 20 % in median
  (B2), and on the tail it is 3.5 mm worse (B3).
- **The network-design answer the row asks for** (stated before the run in the pre-registration): in this scenario a
  three-satellite formation alone locates 30 dBm and 40 dBm sources to metres. A coastal power-difference ground
  layer of this kind does not improve on it.
