# hybrid_fault_power_scipy_oracle: provenance

Oracle fixture (kind Library) for `tests/hybrid_fault_power_scipy_oracle.rs`, the detection
power the `hybrid-optical-rf` report states for its cross-modality chi-square monitor
(`src/hybrid_integrity.rs`, `fault_injection` block).

- `gen_reference.py` generates `reference.json`. Run it with the oracle toolchain's
  Python: `source ~/Code/kshana-oracles/env.sh; $ORACLE_PY gen_reference.py`.
- Library: SciPy 1.18.1, BSD-3-Clause (https://scipy.org): `scipy.stats.chi2` (`isf`, `sf`),
  `scipy.stats.ncx2` (`cdf`, `sf`) and `scipy.optimize.brentq`. It is run as a tool to produce
  the reference values; nothing from it is copied into the crate.
- Inputs: four scenario configurations (false-alarm and missed-detection probabilities, and in
  one of them the RF sigmas and ramp rates), the monitor's 4 degrees of freedom from its
  definition, and the report's twelve-point multiple ladder. Amendment 1 adds, under
  `added_configurations`, a fifth configuration whose RF sigmas are comparable to the optical
  ones (2e-4 m, 3e-4 m, 1e-12 s), pre-registered before it was generated. No third-party data
  is included.
- Tolerance, fixed before the first comparison (stated in the test header): threshold 1e-9
  relative, every other value 1e-6 relative.
- Generated 2026-10-02 (regenerated with amendment 1 the same day; the four original
  configurations are byte-identical). `reference.json` SHA-256
  923b54d7ef43e5491b942373b74cf60f0c6d244db51332e856dd30485ef67eed (the generator
  reproduces it byte for byte).
