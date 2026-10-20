# Lunar orbit and surface as navigation and geodetic infrastructure

Scenario kind `lunar-infrastructure`, five studies selected by `study`. **MODELLED**: a restricted three-body
model with stated simplifications and ILLUSTRATIVE inputs. The numerics are checked against independent
numpy/scipy programs; nothing is compared with a measurement of a lunar quantity and nothing here is a statement
about any mission or system. Not affiliated with or endorsed by any agency. Advisory software, not type-approved
equipment. Kshana transmits nothing and drives no hardware.

The designs, inputs and bars were fixed in `xval/lunar-infra/PREREGISTRATION.md` (committed before any study was
scored) and two disclosed amendments (`PREREGISTRATION-amendment-1.md`). The verdict of every bar is in
`xval/lunar-infra/RESULTS.md`.

| Study | Scenario | What it computes |
|---|---|---|
| `od-consistency` | `lunar-infrastructure-od-consistency.toml`, `...-model-error.toml` | Onboard Earth-GNSS orbit determination in an NRHO (or `family = "elfo"`) against independent ground range and range-rate OD from three DSN stations; each estimate's formal covariance; a seeded Monte Carlo of whether the two covariances explain their difference (q, chi-square with 6 degrees of freedom); an injected unmodelled acceleration |
| `carrier-phase` | `lunar-infrastructure-carrier-phase.toml` (quick), `xval/lunar-infra/scenarios/carrier-phase-scored.toml` (scored, about eight minutes) | Joint surface-station and orbiter double-differenced carrier phase; float ambiguity covariance; LAMBDA; bootstrapped and Monte Carlo success; float and fixed position sigma |
| `frame-coestimation` | `lunar-infrastructure-frame-coestimation.toml` | Fisher information of the 7-parameter lunar datum from Earth-station ranging, with and without orbiter-to-surface-station ranges; seeded random station sets |
| `space-tie` | `lunar-infrastructure-space-tie.toml` | GNSS, VLBI and laser ranging on one spacecraft: Cramer-Rao precision of the inter-technique offsets against the local-tie error |
| `geodesy-sensitivity` | `lunar-infrastructure-geodesy-sensitivity.toml` | Information on h2, k2, l2 and the physical libration from laser ranging, orbiter tracking, a gravimeter and a surface clock (constants shared with the lunar-time modules) |

## Stated simplifications

Earth and Moon point masses on a circular orbit, no Sun, no lunar gravity harmonics; the Earth's rotation axis is
the orbit normal; the inertial frame equals the rotating frame at t = 0; a spherical Moon; a synchronous lunar
frame (no libration) except in `geodesy-sensitivity`; the orbit is held known in the lunar axes in
`frame-coestimation` (its error is carried by the orbiter range sigma); the orbiter family of
`geodesy-sensitivity` sees the line-of-sight integral of the k2 acceleration after a constant and a linear trend are
removed, an upper-end figure.

## Report shape

Every report carries `kind`, `study`, `label`, `scenario_hash`, the study's fields and a `units` block (a unit and a
provenance class for every numeric field). No per-time series are emitted. Field lists: the `units` block of each
report, and `docs/field-units-schema.json`.

## Sources

k2 = 0.024116 +/- 0.000108 (Lemoine et al., Geophys. Res. Lett. 41(10), 3382-3389, 2014, doi 10.1002/2014GL060027),
used as a nominal. h2 and l2 are linearisation points, not verified values. DSN station coordinates are the ITRF93
values in the NAIF `earthstns_fx` kernel comments; DSN accuracy bands were read from search summaries only. The
space-tie concept follows the public GRASP and ESA Genesis descriptions. The full table, with how each was read, is
in the pre-registration.

## Results at a glance (see RESULTS.md)

Not met, and pinned by tests that assert the miss: C3 (the injected-error metric does not fire at 3e-10 m/s2), the
bootstrapped-rate half of Q3 at 1e-9, and the CRLB-trace half of G3. Integer ambiguity fixing is not achieved at the
registered inputs. Nothing is VALIDATED.
