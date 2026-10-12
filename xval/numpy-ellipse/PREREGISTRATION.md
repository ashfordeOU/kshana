# Pre-registration: the horizontal error ellipse and the per-system cofactor against numpy

Committed before the oracle is run. The design note (`docs/design/2026-10-12-geometry-and-skyline-design.md`,
item 2, section 3.8) names the candidate row "Horizontal error ellipse from the geometry covariance",
checked against numpy `linalg.eigh` (validation standard P2: an independent numerical library performing
the inverse and the eigen-decomposition itself, on committed inputs).

## Inputs

The 142 visible sets of the committed skyline comparison (`tests/fixtures/skyline_orekit_oracle/`):
every (site, epoch, mask table) set of at least four satellites with `el >= max(5 deg, mask(az))`,
read from Orekit's azimuths and elevations (`outputs/orekit.csv`). The system of a satellite is its
id without the trailing `-<n>`. sigma_UERE = 1.5 m and confidence 0.95, fixed here.

## Oracle

numpy (BSD-3-Clause, the version in the oracle environment; recorded in the output): for each set and
each clock model (`common`: one clock column; `per-system`: one column per system present, in order
of first appearance), G with rows `[-cos el sin az, -cos el cos az, -sin el, one-hot clock]`,
`Q = numpy.linalg.inv(G.T @ G)`, the horizontal block's eigen-decomposition by `numpy.linalg.eigh`,
semi-axes `k sigma sqrt(lambda)` with `k = sqrt(-2 ln(1 - p))`, and the azimuth of the major
eigenvector `atan2(v_east, v_north)` folded into [0, 180). Driver: `xval/numpy-ellipse/ellipse.py`.
The cofactor is NOT re-derived with Kshana's closed form: numpy inverts and decomposes on its own.

## Quantities and tolerances (fixed now)

| # | Quantity | Kshana | Tolerance |
|---|---|---|---|
| a | semi-major and semi-minor axes at 95 % | `geometry::sky_geometry` `ellipse` | relative 1e-9 where PDOP < 20, 1e-6 otherwise |
| b | orientation of the major axis | same | 1e-6 deg (wrap-aware on [0, 180)), only where (λ1 − λ2)/λ1 > 1e-6; the rest counted and reported (the axis of a near-circle is undefined) |
| c | every entry of the cofactor matrix, both clock models | `cofactor_enu` | `|Δq| <= tol · max|q|`, tol 1e-9 where PDOP < 20, 1e-6 otherwise |
| d | the clock labels and the number of states | `clock_labels`, `states` | identical |

Kshana is given its own azimuths and elevations of the same satellites (`frames::look_angles` on the
committed states, which agree with Orekit's to 2.3e-13 deg).

## Decision rule

All pass: a new row "Horizontal error ellipse and per-system cofactor from the geometry covariance"
is VALIDATED (ExternalDataset, basis P2, numpy). Any fails: the row is MODELLED with the finding.
The Monte Carlo cloud stays MODELLED either way. Tolerances are not changed after the run.

```sh
python -I xval/numpy-ellipse/ellipse.py tests/fixtures/skyline_orekit_oracle
cargo test --test ellipse_numpy_oracle
```
