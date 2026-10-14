<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# WP-14 handoff (W49, CAP-30 stage 2), 2026-10-14

Branch `feat/new-domains-0.36`. The ledger counts are unchanged at 284 rows (136 V / 144 M /
4 P): the CAP-30 result extends the existing TRK-2-18 row, which stays MODELLED.

## What was done

| Commit | What |
|---|---|
| abf7a311 | Stage 2 pre-registration (`xval/mro-od/PREREGISTRATION.md`), fetch script with pinned SHA-256s, IERS EOP rows |
| cf0b1cf8 | SPK type 1 reader, PDS SHADR parser, `src/mars_od.rs`, data-gated test, monthly CI job `realdata-mro-od.yml` |
| b6eaa3b8 | Amendment A1 (before the scored run): observable convention, station-velocity unit bug, station time, 1.5 m radial antenna offset, convergence |
| 5a5d0c6e | Amendment A2: ramp-coverage selection rule, after a scored attempt that errored before any residual |
| this commit | Result recorded and pinned; ledger row text; CHANGELOG |

## Result

- **B1 MET.** The Doppler predicted from `mro_psp5` matches the observed ramped 2-way Doppler on
  the scored DSS 63 and DSS 14 passes to 12.5 mHz RMS. The bar is 30 mHz, and 32 of 447 points
  were edited.
- **B2-B5 NOT MET.** The registered fit stopped on the scored arc with "normal matrix is not
  positive definite" and produced no orbit. On the 6 h development pass it converged: 20 mHz
  post-fit, 213 m position RMS.

## For the next worker: diagnosing the fit (needs a new registration before a scored run)

- Instrument `mars_od::fit` per iteration: the position update, the number kept by the outlier
  mask, and the diagonal of the normal matrix. Likely causes:
  - the MAD mask collapsing after a bad step;
  - an undamped first step from the 1.7 km / 1.7 m/s guess over 13.75 h that diverges;
  - an unobservable SRP/drag pair.

  A Levenberg-Marquardt damping step, or estimating state + SRP only, are the obvious
  remedies. Any such change must be pre-registered before it touches the scored passes. Pass D
  stays the development pass.
- Each fit iteration costs about 9 trajectory integrations (GMM-3 to degree 80, 5 s RK4). A
  13.75 h arc runs about 2.5 min per iteration in release mode.
- The inputs are in `realdata-cache/mro/` via `scripts/fetch_mro_od.sh`.

## Notes

- `mro_psp5` was produced with DE414. DE414 and DE440 differ by 44 m and 0.002 mm/s for Mars
  here, so DE440s is used.
- The ODF ramped observable is `M2·f_ref(record) − received`, settled on the development pass.
- The station kernel's `DSS-nn_DXYZ` values are in m/yr.
- The only check done outside the registered bars was CSPICE (SpiceyPy 6.0.0, oracle-only):
  the SPK type 1 states, and a light-time cross-check during development.
