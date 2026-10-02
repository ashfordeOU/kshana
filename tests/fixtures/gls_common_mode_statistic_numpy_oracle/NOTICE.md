# gls_common_mode_statistic_numpy_oracle: provenance

Oracle fixture (kind P2, an independent numerical library) for
`tests/gls_common_mode_statistic_numpy_oracle.rs`, the GLS (generalised least squares)
common-mode consistency statistic `(1^T Omega^-1 r)^2 / (1^T Omega^-1 1)` of
`src/integrity/gls_commonmode.rs`.

- `gen_reference.py` generates `reference.json`. Run it with the oracle toolchain's
  Python: `source ~/Code/kshana-oracles/env.sh; $ORACLE_PY gen_reference.py`.
- Library: numpy 2.3.5, BSD-3-Clause (https://numpy.org). `numpy.linalg.solve` calls LAPACK
  (the Linear Algebra PACKage) gesv, an LU factorisation with partial pivoting; no Cholesky is
  used on the oracle side. numpy is run as a tool to produce the reference values; nothing
  from it is copied into the crate.
- Inputs: the 3x3 case of `tests/fixtures/gls/reference.json`, 200 synthetic well-conditioned
  symmetric positive-definite cases (largest condition number 24.5), 20 common-mode shifts of
  the first 20 of them, and 40 ill-conditioned cases (condition numbers 1.17e3 to 6.06e7), all
  from seed 20261001, written into the fixture with their condition numbers and whitened
  cosines. No third-party data is included.
- Tolerance, fixed before the first comparison (stated in the test header): 1e-12 relative,
  and for the ill-conditioned tier `1e-12 + 6 (3N+1) N u cond_2(Omega) / |cos_w|`.
- Generated 2026-10-02. `reference.json` SHA-256
  a89dee12c635b708c0cd6347568cbbb4692b18b865b2d2dc21fecb2462d13d6c (the generator
  reproduces it byte for byte).
