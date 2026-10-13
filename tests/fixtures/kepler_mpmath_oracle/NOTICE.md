# kepler_mpmath_oracle: provenance

Oracle fixture (kind Library) for `tests/kepler_mpmath_oracle.rs`, the shared Kepler solver of
`src/kepler.rs`. Bars: `xval/kepler-mpmath/PREREGISTRATION.md`; results:
`xval/kepler-mpmath/RESULTS.md`.

- `gen_reference.py` generates `reference.json`:
  `/root/kshana-oracles/.venv/bin/python -I gen_reference.py > reference.json`.
- Library: mpmath 1.3.0, BSD-3-Clause (https://mpmath.org), at 50 significant digits. Each root
  of `E − e·sin E = M` is found by bisection on `[M − e, M + e]` and two Newton steps from the
  exact binary values of the float64 inputs, and stored as a double-double (`e_hi`, `e_lo`)
  with the condition factor `1 − e·cos E` (`cond`).
- Inputs: 405 grid points (9 eccentricities from 0 to 0.999999 × 45 mean anomalies in
  [−π, π]) and 9 wound mean anomalies. No third-party data.
- Generated 2026-10-12. `reference.json` SHA-256
  ef78cab67e68de225e1e0b4aa61df23a5af7bf16144cd351450c27391ec44e51 (the generator reproduces it
  byte for byte).
