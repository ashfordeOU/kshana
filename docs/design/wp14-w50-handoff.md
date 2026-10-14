<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# WP-14 handoff (W50, CAP-30 run 2), 2026-10-14

Branch `feat/mars-od-run2-0.36`, from `feat/new-domains-0.36` @ b51d9bb7. The ledger counts
are unchanged: the result extends the TRK-2-18 row, which stays MODELLED.

## What was done

| Commit | What |
|---|---|
| cf83e08e | `mars_od::fit_damped` (diagonal scaling, Levenberg-Marquardt), `sym_eigenvalues`, ignored pass-D driver `tests/mro_od_dev_pass_d.rs` |
| a66028a7 | Run-2 pre-registration (`xval/mro-od/PREREGISTRATION-RUN2.md`), committed alone |
| 18036b5e | Scored-run harness, committed before the run |
| 472b4214 | Amendment R2-A1, committed alone: the run converged, then the harness errored sampling B3/B4 past the fit's span |
| 55f097e1 | Scoring-only fix (B3/B4 on the propagated estimate) |
| this commit | Result recorded and pinned; ledger row; CHANGELOG; docs/revisions entry; regenerate |

## Result

B1, B3, B4 and B5 are met: 12.5 mHz, 0.362 km, 0.527 km and 2.9 %. **B2 is not met**: 48.6 mHz
post-fit against the 30 mHz bar. The re-execution after R2-A1 reproduced the iteration log of
the first execution exactly. GMM-3 came from the complete pinned table, truncated to degree 80.

## For a next run (it needs its own registration)

- The estimated orbit fits the Doppler worse than the reconstruction does: 48.6 against
  12.5 mHz. The drag scale goes to about 0.002, and the SRP coefficient from 0.043 to
  0.035. Candidates: the 5 s RK4 with Hermite dense output, the GMM-3 truncation at degree 80,
  the cannonball SRP (MRO's large solar arrays and high-gain antenna), and momentum-wheel
  desaturations or other small forces over the 13.75 h arc.
- The scaled normal matrix keeps a smallest eigenvalue near 6e-10 on the scored arc. The
  undamped Gauss-Newton fit is not usable without scaling.
- `src/gravity_sh.rs` has two clippy `excessive_precision` lints in its tests under
  `--all-targets`. They predate this branch, which leaves `gravity_sh` untouched.
