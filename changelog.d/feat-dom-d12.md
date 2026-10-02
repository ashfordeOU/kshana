- Lunar frame datum with the stations estimated: a 50-digit mpmath extended-precision oracle
  (pre-registered 804662d5, condition-scaled bars from an a-priori backward-error formula) agrees
  on a new campaign date (2026-03-18) and on the original 2024-01-01 scenario. New VALIDATED row
  under P2, with a narrowed claim: within the worst-case error bound of a backward-stable
  pipeline. It settles the earlier double-precision dispute: the default solver's datum sigmas
  are off by up to 9.7e-6, NumPy's inverse and eigen routes by up to 6.2e-6, and its Cholesky and
  QR routes by about 1e-8.
- New opt-in square-root information solver (`linalg_sr`; `solver = "srif"` in the
  lunar-frame-campaign scenario): Householder QR, marginalisation through the triangular factor,
  a Jacobi SVD for the spectrum, and compensated products from correctly rounded operations
  only. Against the 50-digit oracle (pre-registered b41908c9) its datum sigmas agree to 3e-13 on
  a new date (2026-06-09), where the default solver is off by about 1e-5. New VALIDATED row under
  P2. The default solver and its output are unchanged.
- Lunar frame campaign rank decisions: a pre-registered extended-precision check over 40 days
  confirms every decidable station-block and full-rank Helmert decision. The day-to-day changes
  in the Helmert defect are geometric in exact arithmetic (the 1e-9 threshold lies inside the
  campaign's natural range of eigenvalue ratios), though the a-priori bound cannot certify those
  20 days.
- The "Lunar frame datum from an observing campaign" row stays MODELLED and points to the new
  extended-precision row.
- Oracle environment: mpmath 1.3.0 added.
- Revisions: none. No golden file or published figure changes.
