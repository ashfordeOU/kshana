- New opt-in square-root information solver (`linalg_sr`; `solver = "srif"` in the
  lunar-frame-campaign scenario): Householder QR, marginalisation through the triangular factor,
  a Jacobi SVD for the spectrum, and compensated products from correctly rounded operations
  only. Against the 50-digit oracle (pre-registered b41908c9) its datum sigmas agree to 3e-13 on
  a new date (2026-06-09); on the same inputs the default solver is off by about 1e-5. New
  VALIDATED row under P2. The default solver and its output are unchanged.
- Opt-in square-root paths beside the unchanged defaults: `fim::crlb_srif`,
  `batch_ls::gauss_newton_srif`, `orbit_determination::determine_orbit_batch_srif`,
  `lunar_combination::formal_covariance_srif`, `precise_od::fit_srif` and
  `cislunar_srif::srif_cross_validation_sqrt`, on new `linalg_sr::weighted_lstsq` and
  `covariance_from_sqrt_information`. Each agrees with its default where both are accurate; no
  validation is claimed for them.
- Lunar frame campaign rank decisions: a pre-registered extended-precision check over 40 days
  confirms every decidable station-block and full-rank Helmert decision. The a-priori bound cannot
  certify the 20 rank-deficient Helmert days; in exact arithmetic their defect is geometric, with
  the 1e-9 threshold inside the campaign's natural range of eigenvalue ratios.
- The extended-precision campaign row's claim is narrowed to "within the worst-case bound", and
  its stations-fixed weakest-direction check now measures a real angle (6.6e-16 rad); the
  "Lunar frame datum from an observing campaign" row records the decision to keep it MODELLED.
- Revisions: none. No golden file or published figure changes.
