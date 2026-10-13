# Results: high-degree spherical-harmonic gravity (EGM2008 to degree 2190)

Run 2026-10-12, after the pre-registration commit (`PREREGISTRATION.md`, the only file in its
commit). Kshana `SphericalHarmonicField::acceleration_hf` / `potential_hf` on the field read by
`from_gfc_file` (N = 70 from `tools/egm2008_to70.gfc`; N = 200, 360, 2190 from ICGEM
`EGM2008.gfc`, SHA-256 `ab5b524d…70fd`), `C̄00 = 0`. Oracle tables:
`tests/fixtures/high_degree_gravity/`. Test: `tests/gravity_sh_high_degree.rs`.

## Worst case per degree and oracle

Δa = |a_kshana − a_oracle| (m/s²), relative to |a_oracle|; ΔU (m²/s², Orekit only).

| N | oracle | points compared | max Δa (point) | max relative | max ΔU | bar Δa / rel / ΔU | result |
|---|---|---|---|---|---|---|---|
| 70 | Orekit 12.2 | 8 (P3, P4 NaN) | 2.2e-17 (P10) | 8.2e-16 | 2.2e-11 | 1e-12 / 1e-10 / 1e-8 | pass |
| 200 | Orekit 12.2 | 8 | 3.5e-17 (P8) | 1.2e-15 | 2.2e-11 | 1e-12 / 1e-10 / 1e-8 | pass |
| 360 | Orekit 12.2 | 8 | 3.9e-17 (P8) | 1.8e-15 | 4.4e-11 | 1e-12 / 1e-10 / 1e-8 | pass |
| 2190 | Orekit 12.2 | 8 | 7.3e-17 (P10) | 2.7e-15 | 1.0e-10 | 1e-10 / — / 1e-7 | pass |
| 70 | pyshtools 4.14.1 | 8 | **4.1e-10 (P9)** | 1.3e-8 | — | 1e-12 / 1e-10 | **miss** (P2 3.8e-12, P9 4.1e-10) |
| 200 | pyshtools 4.14.1 | 8 | **7.3e-10 (P9)** | 2.3e-8 | — | 1e-12 / 1e-10 | **miss** (P2 3.8e-12, P9 7.3e-10) |
| 360 | pyshtools 4.14.1 | 8 | **6.7e-10 (P9)** | 2.1e-8 | — | 1e-12 / 1e-10 | **miss** (P2 3.8e-12, P9 6.7e-10) |
| 2190 | pyshtools 4.14.1 | 8 | **6.8e-10 (P9)** | 2.1e-8 | — | 1e-10 | **miss** (P9 6.8e-10; P2 3.8e-12 passes) |

At the six pyshtools points away from the poles the worst difference is 7.2e-16 m/s² (N = 2190, P8).

## Exclusions (as pre-registered)

* P3, P4 (exactly on the polar axis): Orekit 12.2 returns NaN at every degree; pyshtools was not
  evaluated. **No oracle value** at the exact pole. Kshana is finite there and the MODELLED unit
  tests in `src/gravity_sh.rs` show it equals the limit along every meridian (relative 1e-10 at
  12 µm from the axis) and the finite difference of `potential_hf` (relative 1e-5, d/o 2190
  synthetic field on the reference sphere).

## The pyshtools miss

At P2 (89.999°) and P9 (−89.9999°) pyshtools differs from both Kshana and Orekit, which agree
with each other to 1e-17 m/s². `mpmath_near_pole_diagnostic.py` (50-digit direct sum, central
difference) at N = 70 gives:

| point | Orekit − truth | pyshtools − truth |
|---|---|---|
| P1 | 6.5e-18 | 5.6e-17 |
| P2 | 1.2e-17 | 3.8e-12 |
| P9 | 6.0e-18 | 4.1e-10 |

The difference lies in pyshtools (it grows towards the axis: sin θ = 1.7e-5 at P2, 1.7e-6 at P9;
the cause inside SHTOOLS was not traced).
It is still a miss under the pre-registered rule ("every point evaluated by O2 meets its bar"),
so by that rule the claim stays **MODELLED** at every degree. The full-check test is kept,
`#[ignore]`d with the finding (`pyshtools_at_every_point_disagrees_near_the_poles`); the live
tests compare Orekit at all eight off-axis points and pyshtools at the six away from the poles.

## Why the new method (diagnostic, no bar)

Historical `acceleration` versus Orekit at N = 2190: P8 (80°) 7.8e-17 m/s² (fine); P10 (68.2°,
inside the band where `cos^m φ` underflows while `P̄_2190,m` is of order one) **8.1e-9 m/s²**,
against 7.3e-17 for `acceleration_hf`.

## Timing (diagnostic; the budget is in the test)

`acceleration_hf` per call, synthetic field, table prepared, opt-level 2 test build on a shared
4-core machine with load average 4.4 to 6 (other builds running):

| N | measured | budget (optimised build) |
|---|---|---|
| 70 | 15 to 25 µs | ≤ 50 µs |
| 200 | 0.11 to 0.17 ms | ≤ 0.5 ms |
| 2190 | 65 to 76 ms | ≤ 150 ms |

Loading the full EGM2008 to degree 2190 with `from_gfc_file`: 1.4 to 1.6 s. Memory at degree 2190:
the coefficient triangles 77 MB plus the recursion table 77 MB.
