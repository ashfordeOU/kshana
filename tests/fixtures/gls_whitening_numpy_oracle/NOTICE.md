# gls_whitening_numpy_oracle: provenance

Oracle fixture (kind P2, an independent numerical library) for
`tests/gls_whitening_numpy_oracle.rs`, the GLS common-mode whitening and the
Mahalanobis identity (`src/integrity/gls_commonmode.rs`).

- `gen_reference.py` generates `reference.json`. Run it with the oracle toolchain's
  Python: `source ~/Code/kshana-oracles/env.sh; $ORACLE_PY gen_reference.py`.
- Library: numpy 2.3.5, BSD-3-Clause (https://numpy.org), whose `linalg` calls LAPACK
  (`cholesky`: potrf; `solve`: gesv; `inv`). It is run as a tool to produce the reference
  values; nothing from it is copied into the crate.
- Inputs: the 3x3 case of `tests/fixtures/gls/reference.json` plus 200 synthetic
  symmetric positive-definite cases from a fixed seed (20260930), written into the
  fixture with their condition numbers (largest 19.3). No third-party data is included.
- Tolerance, fixed before the first comparison: infinity-norm of the difference at most
  1e-12 times the infinity-norm of the numpy value for the factor, the whitened residual
  and the whitening operator; relative 1e-12 for the Mahalanobis square.
- Generated 2026-10-01. `reference.json` SHA-256
  6588e37ed0c0008b7d5288f0e49f60f12f5f6a70abe6ad8c33a48a534cd45bd9 (the generator
  reproduces it byte for byte).
