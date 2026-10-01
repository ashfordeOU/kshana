# tpl_scalar_numpy_oracle: provenance

Oracle fixture (kind P2, an independent numerical library) for
`tests/tpl_scalar_numpy_oracle.rs`, the scalar MHSS timing protection level
(`src/integrity/tpl_scalar.rs`).

- `gen_reference.py` generates `reference.json`. Run it with the oracle toolchain's
  Python: `source ~/Code/kshana-oracles/env.sh; $ORACLE_PY gen_reference.py`.
- Libraries: numpy 2.3.5 and scipy 1.18.1, both BSD-3-Clause (https://numpy.org,
  https://scipy.org). They are run as tools to produce the reference values; nothing
  from them is copied into the crate.
- Inputs: 300 synthetic cases from a fixed seed (20260930), written into the fixture
  next to the reference values. No third-party data is included, so no licence applies to
  the inputs beyond this repository's own.
- What numpy and scipy compute by their own algorithms: every estimator by
  `numpy.linalg.lstsq` on the whitened system, every separation standard deviation by
  the general `sqrt(Delta Sigma Delta^T)`, the multiplier by `scipy.stats.norm.isf`, the
  risk by `scipy.stats.norm.sf` and the protection level by `scipy.optimize.brentq`.
- Tolerance, fixed before the first comparison: protection-level relative error at most
  1e-9; driving exclusion subset identical.
- Generated 2026-10-01. `reference.json` SHA-256
  a5e7d9d2dd736f25ae94282bb653d231686c39c2b4705b4b142d62af806eb0b4 (the generator
  reproduces it byte for byte).
