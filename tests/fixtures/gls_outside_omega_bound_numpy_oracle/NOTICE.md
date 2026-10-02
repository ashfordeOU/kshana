# gls_outside_omega_bound_numpy_oracle: provenance

Oracle fixture (kind P2, an independent numerical library) for
`tests/gls_outside_omega_bound_numpy_oracle.rs`, the undetectable common-mode ceiling
`min(alpha_ss, alpha_cm)` of `residual_outside_omega_bound` in
`src/integrity/gls_commonmode.rs`.

- `gen_reference.py` generates `reference.json`. Run it with the oracle toolchain's
  Python: `source ~/Code/kshana-oracles/env.sh; $ORACLE_PY gen_reference.py`.
- Library: numpy 2.3.5, BSD-3-Clause (https://numpy.org). `numpy.linalg.solve` calls LAPACK
  (the Linear Algebra PACKage) gesv, an LU factorisation with partial pivoting; no Cholesky is
  used for any value. Positive-definiteness is decided by `numpy.linalg.cholesky` raising
  `LinAlgError` and confirmed by `numpy.linalg.eigvalsh`. SciPy 1.18.1 (BSD-3-Clause)
  `scipy.stats.chi2.isf` only draws the common-mode threshold inputs. Both are run as tools;
  nothing from them is copied into the crate.
- Inputs: 200 well-conditioned and 40 ill-conditioned (condition numbers 2.23e3 to 1.26e8)
  symmetric positive-definite cases with random directions, 5 pure common-mode directions,
  5 directions outside the modelled common axis, and 6 cases with no finite ceiling (zero
  direction, indefinite `Omega`), all from seed 20261002. Infinite reference values are
  written as the string `"inf"`. No third-party data is included.
- Tolerance, fixed before the first comparison (stated in the test header): 1e-12 relative;
  for the ill-conditioned tier `1e-12 + 6 (3N+1) N u cond_2(Omega) (1/|cos_w| + 1/(1 - cos_w^2))`;
  exactly `+inf` for the no-finite-ceiling tier.
- Generated 2026-10-02. `reference.json` SHA-256
  0a572c8a9751a753447c3035fcfe304877606062143a7960736182ac45de7976 (the generator
  reproduces it byte for byte).
