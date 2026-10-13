# dop853_scipy_oracle: provenance

Oracle fixture (kind Library) for `tests/dop853_scipy_oracle.rs`, the DOP853 integrator of
`src/integrator.rs`. Bars: `xval/dop853-scipy/PREREGISTRATION.md`; results:
`xval/dop853-scipy/RESULTS.md`.

- `gen_reference.py` generates `reference.json`:
  `/root/kshana-oracles/.venv/bin/python -I gen_reference.py > reference.json`.
- Library: SciPy 1.18.1, BSD-3-Clause (https://scipy.org), with numpy 2.3.5:
  `scipy.integrate.solve_ivp(method="DOP853")`, and for single steps its internal
  `scipy.integrate._ivp.rk.rk_step`, `DOP853._estimate_error_norm`,
  `DOP853._dense_output_impl` and `scipy.integrate._ivp.common.select_initial_step`. It is run
  as a tool to produce reference values.
- The DOP853 coefficients in `src/integrator.rs` are Hairer's published `dop853.f` values
  (Hairer, Nørsett, Wanner, *Solving Ordinary Differential Equations I*, 2nd ed., 1993), laid
  out as in SciPy's `dop853_coefficients.py` (BSD-3-Clause, copyright the SciPy developers);
  numerical constants only, no code.
- Exact two-body states: mpmath 1.3.0 (BSD-3-Clause), 40 digits, f-and-g functions.
- Inputs: three problems (circular LEO in SI units, an e = 0.7 orbit in canonical units, the
  Arenstorf orbit with the published initial conditions and period of Hairer, Nørsett and
  Wanner, §II.0), rtol = atol = 1e-12, and eight single-step records. No third-party data.
- Generated 2026-10-12. `reference.json` SHA-256
  6c6aff03b40b670db63357d8e7b292e7f77b22ca0daf7fc2e98502b69f7ccd6a (the generator reproduces it
  byte for byte).
