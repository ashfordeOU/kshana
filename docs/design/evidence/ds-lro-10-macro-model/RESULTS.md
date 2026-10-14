# LRO non-gravitational macro-model (DS-LRO-10): results — NOT MET (finding)

Pre-registration: `PREREGISTRATION.md` (e82047e2, committed and pushed alone before any
macro-model fit). Runs made 2026-10-14 with `tests/agency_lro.rs`
(`lro_macro_model_pre_registered_run`, `lro_macro_model_information_runs`,
`lro_lunar_orbit_fit_against_horizons_truth`), release build, x86-64 Linux.

| Run | Dynamic 3-D RMS | Reduced-dynamic 3-D RMS | Estimated `C_R` (dyn / red) |
|---|---|---|---|
| 4. Control: default model | 12.049 m | 6.668 m | — (not estimated) |
| **1. Primary: array + Moon shadow + lunar albedo + IR** | **11.937 m** | **6.668 m** | **20.93 / −21.81** |
| 2. Array + Moon shadow (no albedo/IR) | 11.933 m | 6.668 m | 21.24 / −21.80 |
| 3. Cannonball, A/m = 10.7/1060 m²/kg, Moon shadow | 11.933 m | 6.668 m | 21.24 / −21.79 |

RTN of run 1: dynamic [2.910, 9.598, 6.474] m, reduced-dynamic [3.416, 4.578, 3.441] m. Both
tiers converged in every run. The control reproduces the published 12.049 m / 6.668 m, so
the default output is unchanged.

## Bars (run 1)

| Bar | Required | Measured | Outcome |
|---|---|---|---|
| B1 reduced-dynamic 3-D RMS | ≤ 6.00 m | 6.668 m | **NOT MET** |
| B2 dynamic 3-D RMS | ≤ 10.84 m | 11.937 m | **NOT MET** |
| B3 `C_R` in [0.3, 3.0], both converge | both tiers | 20.93 / −21.81 | **NOT MET** |

Per the outcome rule this is a finding. `lro_macro_model_pre_registered_run` (not ignored)
asserts the recorded numbers and that each bar is missed. The bars are unchanged, and the
macro-model stays opt-in with nothing claimed for it.

## Reading

- The reduced-dynamic floor does not move at all (6.668 m in every run, to the millimetre).
  With the empirical 1- and 2-per-rev tier present, the estimator even drives `C_R` negative:
  the radiation term is then just one more regressor the empirical terms already span, not a
  physical force.
- In the dynamic tier the fit only gains 0.11 m (12.049 → 11.94 m), and only by scaling the
  modelled radiation force by about 21, i.e. an effective A/m of about 0.21 m²/kg, roughly
  twenty times LRO's. The array-only, albedo/IR and cannonball variants give the same answer
  to within 4 mm. So the signal the dynamic fit absorbs is not shaped like solar or lunar
  radiation pressure on this spacecraft, and its size is not plausible as one.
- As the pre-registration expected, this does not support the hypothesis that the ~6.7 m floor
  is solar/lunar radiation pressure of LRO's actual size. Still untested: the missing bus
  plates (the published plate table could not be obtained), spacecraft thermal re-radiation,
  momentum-wheel desaturations and other small manoeuvres in the arc, and the accuracy of the
  Horizons `LRO_merged` reconstruction used as truth (the 2018 LRO orbit-determination paper
  cited in the pre-registration puts radio-only LRO orbit reconstruction with GRAIL fields at
  "<10 meters").

## Also changed (opt-in paths only, no published number moves)

- The lunar model's opt-in cannonball SRP (`LunarForceModel::solar_radiation`) used the
  Earth-radius conical shadow. It now uses the Moon's radius (`forces::conical_shadow_body`).
  No test or published number used that path.

## 24 h arc (DS-LRO-09 remainder, information only)

The local attempt was cut off by a container restart after about 40 minutes. The manual
`lro-de440-opt-in` job was dispatched once on this branch
(https://github.com/ashfordeOU/kshana/actions/runs/38491862009, head e82047e2); its number is
recorded in `docs/design/evidence/ds-lro-09-11-longer-arc/RESULTS.md` once the job reports.
