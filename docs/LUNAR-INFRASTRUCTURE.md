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

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="figures/0.38/lunar-od-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="figures/0.38/lunar-od-light.svg">
  <img src="figures/0.38/lunar-od-light.svg" alt="Consistency of an onboard Earth-GNSS orbit determination in a near-rectilinear halo orbit with an independent ground orbit determination, from real runs of engine v0.38.0 on scenarios/lunar-infrastructure-od-consistency.toml and the model-error variant (400 trials each). Mean normalised difference q is 5.81 with no model error and 5.95 with an injected acceleration error of 3e-10 m/s2, against 6 expected: the two orbit solutions are consistent (bar C1 MET). The share of trials above the 95 % point is 0.040 and 0.052; the bar for detecting the injected error was at least 0.5, so it is NOT MET (C3): the onboard solution is known to about 352 m against 23 m for the ground one, so a ten-metre displacement hides inside its covariance. MODELLED: a restricted three-body model with stated simplifications and illustrative inputs, not a measurement of any lunar quantity. Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="figures/0.38/lunar-carrier-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="figures/0.38/lunar-carrier-light.svg">
  <img src="figures/0.38/lunar-carrier-light.svg" alt="Carrier-phase integer ambiguity fixing between lunar surface stations and an orbiter, from the committed result of the scored run of engine v0.38.0 (tests/fixtures/lunar_infra/phase_full_run.json: 3 arc lengths, a Monte Carlo of 400 draws each, written by scenarios/carrier-phase-scored.toml). 1 day: success 1.0 % (standard error 0.5 %), 134 ambiguities, orbiter position sigma 45.6 m float and 18.5 m fixed; 2 day: success 0.5 % (standard error 0.4 %), 259 ambiguities, orbiter position sigma 21.5 m float and 8.7 m fixed; 3 day: success 2.8 % (standard error 0.8 %), 375 ambiguities, orbiter position sigma 6.3 m float and 2.1 m fixed. Integer fixing is not achieved: success stays between 1 % and 3 % at 25 dBi, and at the registered 12 dBi the problem cannot be formed. MODELLED: a restricted three-body model with stated simplifications and illustrative inputs, not a measurement of any lunar quantity. Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="figures/0.38/lunar-frame-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="figures/0.38/lunar-frame-light.svg">
  <img src="figures/0.38/lunar-frame-light.svg" alt="Precision of the seven-parameter lunar datum (three translations, a scale and three rotations) from Earth-station ranging, with and without orbiter-to-surface-station ranges, from a real run of engine v0.38.0 on scenarios/lunar-infrastructure-frame-coestimation.toml. The Cramer-Rao sigma of the translations and rotations falls with the orbiter links (for example t_z from 0.98 m to 0.046 m); the smallest information eigenvalue rises 111-fold and the CRLB trace falls to 1.0 % (bar F3 MET). This assumes the orbit is known in the lunar axes, with its error carried by the orbiter range sigma of 1 m. MODELLED: a restricted three-body model with stated simplifications and illustrative inputs, not a measurement of any lunar quantity. Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="figures/0.38/lunar-tie-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="figures/0.38/lunar-tie-light.svg">
  <img src="figures/0.38/lunar-tie-light.svg" alt="Precision of the offsets between laser ranging, VLBI and GNSS positions of one spacecraft, against the error of the ground local tie, from a real run of engine v0.38.0 on scenarios/lunar-infrastructure-space-tie.toml (one 6.56-day arc, technique sigmas GNSS 10 m, VLBI 1 m, laser 0.1 m). With a local tie from 1 mm to 1 m, the laser-minus-GNSS translation sigma stays near 1.04 m until the tie reaches 1 m: it is limited by the measurement noise of the techniques, not by the local tie. The floor set by the tie alone is the square root of two times its sigma. MODELLED: a restricted three-body model with stated simplifications and illustrative inputs, not a measurement of any lunar quantity. Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service.">
</picture>

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="figures/0.38/lunar-geodesy-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="figures/0.38/lunar-geodesy-light.svg">
  <img src="figures/0.38/lunar-geodesy-light.svg" alt="Which observable family is sensitive to the lunar Love numbers h2, k2 and l2, from a real run of engine v0.38.0 on scenarios/lunar-infrastructure-geodesy-sensitivity.toml. Each cell is the RMS partial derivative of a family's observations with respect to a parameter, in that family's own units (so cells are compared across a row, not down a column); a dash means the family has no sensitivity. laser ranging: h2 7.6, k2 none, l2 9.8. orbiter tracking: h2 none, k2 0.00086, l2 none. surface gravimeter: h2 2.9e+03, k2 4.3e+03, l2 none. surface clock: h2 2.8e-17, k2 2.8e-17, l2 none. With all four families, the Cramer-Rao sigma is 0.36 % of nominal h2, 0.52 % of k2 and 1.16 % of l2. Adding a family never lowered the smallest eigenvalue (28 of 28 additions), but the trace of the pseudo-inverse was no larger in only 16 of 28: that half of bar G3 is NOT MET. The orbiter family sees the line-of-sight integral of the k2 acceleration, an upper-end figure. MODELLED: a restricted three-body model with stated simplifications and illustrative inputs, not a measurement of any lunar quantity. Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service.">
</picture>

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
