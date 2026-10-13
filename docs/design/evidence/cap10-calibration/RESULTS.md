# CAP-10 calibration ensembles: results

Protocol: `PREREGISTRATION.md` in this directory, committed at ea451cb5 before the harness
existed. Generator: `cargo run --release --bin gen_calibration_ensembles` (one run, 9 min 50 s,
release). The generated report is `docs/CALIBRATION-ENSEMBLES.md` and the per-seed values are
in `docs/data/calibration-ensembles.csv`. The fast reproduction test is
`tests/calibration_ensembles.rs`. Every row is **MODELLED**.

| Bar | Passing | Region | Outcome | Prediction |
|---|---|---|---|---|
| B1 E1 c1 coverage of the 95 % interval | 192 / 200 (0.960) | [181, 197] | MET | 0.93 to 0.95 (it covered slightly more than predicted) |
| B2 E1 c2 chi-square in its 99 % interval | 196 / 200 (0.980) | [194, 200] | MET | about 0.99 |
| B3 E1 c3 half-width within 25 % | 200 / 200 | [190, 200] | MET | essentially always |
| B3 E1 c4 p05 and p95 within 0.3σ | 183 / 200 (0.915) | [190, 200] | **NOT MET** | 0.90 to 0.92 (predicted miss) |
| B3 E2 ADEV(1 s) within 20 % | 200 / 200, worst 2.25 % | [190, 200] | MET | 200 / 200 |
| B3 E3 ADEV(1, 10, 100 s) within 25 % | 200 / 200, worst 9.19 % | [190, 200] | MET | 200 / 200 |

## Reading

* **The bootstrap interval is honest at n = 200.** It covers the true mean on 96 % of 200
  independent ensembles. That is inside the binomial region of a correct 95 % interval. The
  chi-square check behaves like the 99 % interval it claims to be.
* **The percentile check is seed-fragile (NOT MET, as predicted).**
  `tests/campaign_composition_reference.rs::the_ensemble_mean_and_spread_match_the_white_fm_closed_form`
  requires the nearest-rank p05 and p95 to lie within 0.3σ of the Gaussian quantiles. That
  passes on its one seed but on only 91.5 % of seeds. The engine is not wrong: the standard
  error of a 5th or 95th percentile of 200 Gaussian samples is about 0.15σ, so a 0.3σ bar
  applied twice fails about 8 % of the time by chance. The single-seed test is left unchanged,
  as the protocol requires. The finding is that its percentile tolerance is about a 2-sigma
  bar, not a robust one. A follow-up, outside this protocol, may widen it with a stated
  derivation, in its own commit.
* **The white-FM calibration tolerances are very loose.** The worst ADEV error over 200 seeds
  is 2.25 % against a 20 % tolerance, and 9.19 % against 25 %. Those single-seed tests cannot
  fail by chance, so they would catch only a gross error. A tighter, derived bar would be more
  informative. That too is a follow-up, not part of this protocol.
