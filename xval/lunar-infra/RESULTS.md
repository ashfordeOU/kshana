# Results of the lunar-infrastructure studies

Bars are those of `PREREGISTRATION.md` and its two amendments. Everything is **MODELLED**; the oracles check the
numerics of stated formulas against independent numpy/scipy programs, not the physics, and promote nothing to
VALIDATED. Seed 20261019 throughout. A bar marked NOT MET is pinned by a test that asserts the miss; no bar was
loosened.

| Bar | Verdict | Value |
|---|---|---|
| O1 STM vs scipy DOP853 | MET | relative max-entry error within 1e-6 at 3 days and one period |
| C1 mean q, in-95 fraction | MET | mean q 5.81; fraction 0.96 (400 trials) |
| C2 sample/formal trace | MET | 1.013 (GNSS), 1.055 (ground) |
| C3 injected error is detected | **NOT MET** | 3e-10 m/s2: fraction above the 95 % point 0.0525, bar >= 0.5. The on-board estimate is known to hundreds of metres (351 m against 23 m for ground), so about ten metres of displacement hides inside its covariance |
| Q1 MC success >= bootstrap - 3 SE | MET | all three arcs |
| Q2 no fall with arc length | MET (weak power) | MC success 0.010, 0.005, 0.0275 for 1, 2, 3 days; ambiguities 134, 259, 375 |
| Q3 numpy oracle, 1e-9 | **NOT MET** for the bootstrapped rate; MET for ambiguity and position covariances | relative difference 1.7e-6, from LAMBDA's Abramowitz-Stegun normal CDF (about 1e-7 per factor, 69 factors) |
| Q4 LAMBDA = brute force | MET | 200 draws |
| F1 information adds | MET | example and 20 random sets |
| F2 partials vs numpy FD | MET | 50 geometries, 1e-6 |
| F3 lambda_min x >= 2 | MET | about 111x (assumes the orbit known; orbiter range sigma 1 m) |
| T1 monotone in local tie | MET | |
| T2 floor | MET | within 3e-7 of sqrt(2) x local tie, after a numerical fix (below) |
| T3 information oracle, 1e-9 | MET | |
| G1 partials vs FD, 1e-8 | MET | |
| G2 information oracle, 1e-6 | MET | |
| G3 information adds | **NOT MET** (trace half) | smallest eigenvalue never falls (28 of 28 additions); the pseudo-inverse trace was no larger in 16 of 28 and rose in 12, each time because the added family raised the rank |
| G4 clock tide | MET | 1e-9 |

## Findings

- Study 1: the Earth-GNSS orbit determination in the NRHO is weak: mean tracked satellites 0.92, at least one at 62 %
  of epochs, four or more at none, position sigma about 351 m; ground OD about 23 m. The two covariances are
  mutually consistent (C1, C2) but the GNSS covariance is too wide to expose a 10 m model error (C3).
- Study 2: at the registered 12 dBi the double-difference problem is not formable (two or more common satellites at
  85 of 433 epochs, three or more at none). At the amended 25 dBi integer fixing is still not reached: Monte Carlo
  success 1 to 3 %, though the float orbiter sigma falls from 45.6 m (1 day) to 6.3 m (3 days) and the fixed one
  from 18.5 m to 2.1 m.
- Study 3: orbiter links raise the smallest information eigenvalue about 111-fold and cut the CRLB trace to about
  1 %, conditional on the orbit being known in the lunar axes.
- Study 4: with the registered technique sigmas the laser-versus-GNSS translation is limited by measurement noise
  (about 1 m), not by the 1 mm local tie; the local tie sets the floor only for near-perfect techniques (T2).
- Study 5: the family-by-family information is in the report; the orbiter k2 sensitivity is an upper-end figure.

## Disclosures

- Moon occultation of the Earth-GNSS signals was added to the study-1 link rule after the first run; it changed no
  number.
- Amendment 1 (study-2 default 25 dBi, availability counts only seen) and amendment 2 (study-2 trials 2000 -> 400 and
  the surface-longitude convention fix) are in `PREREGISTRATION-amendment-1.md`.
- The first T2 scoring used a normal-equation inversion and missed (1.3 % at a 0.1 m tie, values below the floor at
  1 m, which is impossible). The cause was conditioning; the covariance moved to the square-root route
  (`fim::crlb_srif`) and T2 was rescored with the same bar.
- The scored carrier-phase configuration (three arcs, 400 draws, about eight minutes) is
  `scenarios/carrier-phase-scored.toml` here; its result is stored as `tests/fixtures/lunar_infra/phase_full_run.json`.
  The shipped example is a quick two-arc, ten-draw run of the same study.
- No post-hoc sweep was run.

## Not verified

h2 and l2 (used only as linearisation points); the DSN accuracy bands (search summaries only); Williams et al. 2014 k2
(abstract via search only).
