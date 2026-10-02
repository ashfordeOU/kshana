- Lunar frame datum with the stations estimated: a 50-digit mpmath extended-precision oracle
  (pre-registered 804662d5, condition-scaled bars from an a-priori backward-error formula) agrees
  on a new campaign date (2026-03-18) and on the original 2024-01-01 scenario; new VALIDATED row
  under P2. It settles the earlier double-precision dispute: the engine's datum sigmas are off by
  up to 9.7e-6, NumPy's inverse and eigen routes by up to 6.2e-6, and its Cholesky and QR routes
  by about 1e-8. The engine is within its error bound but about a thousand times less accurate
  than a factorisation route.
- Oracle environment: mpmath 1.3.0 added.
- Revisions: none. No golden file or published figure changes; the "Lunar frame datum from an
  observing campaign" row is unchanged pending a decision on its promotion.
