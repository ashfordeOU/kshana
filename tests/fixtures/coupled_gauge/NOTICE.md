# Coupled-Gauge Anchor — Provenance Notice

This directory holds the **single Validated row** for the P4 coupled
frame⊕timescale gauge module (`src/lunar_gauge.rs`), reproduced by
`tests/lunar_coupled_gauge_reference.rs`.

## What is Validated (read carefully)

The **only** Validated claim here is that kshana's coupled-gauge **linear algebra**
pipeline — `assemble_coupled_info` (preconditioned Fisher assembly), `fim::sym_eig`
(Jacobi eigendecomposition), `classify_null_space` (invariant null-space classifier),
and `coupled_marginal_eigs` ({scale, offset} Schur complement) — reproduces an
**independent numpy / LAPACK computation** of the same pipeline, to **relative error
< 1e-3 AND absolute error < 1e-3**, evaluated on the same set of observation rows.

Nothing in this fixture is certified, flight-validated, or derived from actual
mission data.

## Geometry: Modelled, not an external oracle

The beacon positions and orbital elements used to generate the observation rows are
a **Modelled** (deterministic, documented) construction:

- **Beacons:** five near-side PA-body positions (metres) at
  `[1.5e6, 0.3e6, 0.2e6]`, `[1.4e6, -0.4e6, 0.3e6]`,
  `[1.55e6, 0.2e6, -0.35e6]`, `[1.35e6, -0.25e6, -0.3e6]`,
  `[1.6e6, 0.05e6, 0.1e6]`.
- **Orbiters:** six circular orbits at 2000 km altitude, with inclination
  `20 + 10j°`, RAAN `60j°`, argument-of-latitude `40j°` for `j = 0..5`.
- **Epochs:** `T_TASK4 = (JD 2460310.5 − J2000) / 36525` JC (2024-01-01 TT),
  plus up to three 2-day steps.

These are cosmetic choices: the Validated claim (linear-algebra agreement)
holds for any full-rank network.

## Real DE440 data (the external ingredient in the rows)

Although the geometry is Modelled, each observation row is built via
`lunar_datum::orbiter_range_row_datum7`, which internally calls
`lunar_llr_geometry::reflector_inertial` → `lunar_orientation::de440_moon_pa_body_to_inertial`.
This path uses the **real DE440 lunar PA-frame orientation angles** (vendored in
`tests/fixtures/`) — so the spatial partial-derivative columns 0..7 of every row
carry the **real physical libration** at those epochs, not an approximation.

This is the genuine external data ingredient.

## Networks

| network | rows | defect | dim_temporal | note |
|---------|-----:|-------:|-------------:|------|
| `well_posed` | 120 | 0 | 0 | 5 beacons × 6 orbiters × 4 epochs; all eigenvalues positive |
| `single_epoch` | 30 | 1 | 1 | same geometry × 1 epoch, elapsed_s=0; rate column exactly zero |

The `single_epoch` defect is an **exact analytic property** (elapsed_s = 0 makes the
rate column identically zero in every row, collapsing the Fisher column), not an
empirical measurement.

## Byte-consistency

Every row float was rounded to 6 decimal places in the Rust generator
(`examples/gen_coupled_gauge_rows.rs`) **before** being written to `network.json`.
The numpy oracle (`scripts/gen_coupled_gauge_ref.py`) reads the same JSON values
(same IEEE-754 doubles), then applies an identical preconditioning step (divide
columns 3–6 by `R_MOON = 1737400.0`) and computes the Fisher, eigenvalues, null-space
classification, and Schur-complement marginal — all with LAPACK.

The Rust integration test (`tests/lunar_coupled_gauge_reference.rs`) reads the same
`network.json` rows and applies `assemble_coupled_info` → `fim::sym_eig` (Jacobi) →
`classify_null_space` → `coupled_marginal_eigs`.  The only Rust-vs-numpy difference
is the eigensolver backend (Jacobi vs LAPACK) and the pseudo-inverse kernel
(`fim::crlb` pseudo-covariance vs `np.linalg.pinv`), which agree far inside 1e-3.

## Regenerate

```
cargo run --example gen_coupled_gauge_rows
.venv/bin/python scripts/gen_coupled_gauge_ref.py
cargo test --test lunar_coupled_gauge_reference
```
