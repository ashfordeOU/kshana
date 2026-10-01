# eo_payload_coverage_orekit_oracle fixture

Used only by `tests/eo_payload_coverage_orekit_oracle.rs`; not shipped in any published package.

## What is here

- `eo_payload_coverage_orekit_oracle.txt`: oracle values on the pre-registered grid (sphere limb,
  swath by ray intersection and by field-of-view footprint, nadir GSD, maximum access, Keplerian
  period, J2 nodal period and node spacing, WGS-84 limb angle and geodesic maximum ground range).
  SHA-256 6b0d21545f323b8482f3c1be24a8297980119637627e92a9d6ea6a543edcb733.
- `EoCoverageOrekitDriver.java`: the Orekit driver (compile and run commands in its header).
  SHA-256 a8931929d9179550d6a2d7aa4462b7772ccb58232374c5d15d62d0794c3501b2.
- `geodesic_wgs84.py`: appends the GeographicLib geodesic distances.
  SHA-256 81ec7abf96af6922071cbea33a10cb3fb265179f81f5fe8d46e4d2916391cc64.
- `exempt_flag_points.txt`: the contiguous-flag exemption list computed from the engine alone and
  committed (empty) before the oracle was run.

The values are the output of tools run on synthetic inputs; no part of any tool is included.

## Oracles (run as tools, never linked or vendored)

| Oracle | Version | Licence | Source |
|---|---|---|---|
| Orekit (`OneAxisEllipsoid`, `Ellipsoid.pointOnLimb`, `getIntersectionPoint`, `CircularFieldOfView.getFootprint`, `KeplerianOrbit`, `BrouwerLyddanePropagator`, `NumericalPropagator` with `J2OnlyPerturbation`, `NodeDetector`) | 12.2 (orekit-12.2.jar SHA-256 6e1d7d989b9dc82130eb4fdc194c07fc54a9fd4042db2dddb774330628874392) | Apache-2.0 | https://www.orekit.org |
| Hipparchus | 3.1 | Apache-2.0 | https://hipparchus.org |
| GeographicLib (Python, `Geodesic.WGS84.Inverse`) | 2.1 | MIT | https://geographiclib.sourceforge.io |

Generated 2026-10-01 with OpenJDK 21.0.5 and the oracle toolchain (`~/Code/kshana-oracles`),
GeographicLib from PyPI in a scratch virtual environment.

## Result (tolerances pre-registered in the test header, commit 766823f3)

All comparisons agree. Worst relative gaps: angular radius 5.4e-16, circular period 1.6e-16,
swath 4.8e-13 (intersection) and 7.0e-13 (footprint), maximum access 1.9e-14, nadir GSD 2.9e-10,
J2 nodal period 1.2e-5, node spacing 6.7e-5; WGS-84 limb 0.186 deg (bar 0.3 deg), WGS-84 maximum
ground range 3.2e-3 (bar 5e-3); contiguous flag equal at all 168 points (12 contiguous).
