# launch_geometry_orekit_oracle fixture

Used only by `tests/launch_geometry_orekit_oracle.rs`; not shipped in any published package.

## What is here

- `launch_geometry_orekit_oracle.txt`: Orekit's inclinations for burnout states along the launch
  azimuths Kshana computed (158 cases), azimuth-sweep minimum inclinations, circular speeds,
  dogleg plane-change dv, Earth-fixed site speeds and daily plane-crossing counts.
  SHA-256 a5898b27cb4259a9fc6153207dcc96149babbf896a28252871d11a8da563d323.
- `LaunchOrekitDriver.java`: the driver.
- `gen_launch_geometry_orekit_oracle.sh`: dumps Kshana's azimuths (the ignored test
  `dump_kshana_launch_azimuths`) and feeds them to the driver.

The values are the output of a tool run on synthetic inputs; no part of the tool is included.

## Oracle (run as a tool, never linked or vendored)

| Oracle | Version | Licence | Source |
|---|---|---|---|
| Orekit `KeplerianOrbit`, `FunctionalDetector`, ITRF/TIRF/CIRF/GCRF frames (IERS 2010) | 12.2 (orekit-12.2.jar SHA-256 6e1d7d989b9dc82130eb4fdc194c07fc54a9fd4042db2dddb774330628874392) | Apache-2.0 | https://www.orekit.org |
| orekit-data (EOP for the frame transforms) | `main` archive fetched 2026-09-30 by the oracle toolchain | public data (IERS) | https://gitlab.orekit.org/orekit/orekit-data |

Generated 2026-10-01 with OpenJDK 21.0.5.

## Tolerances, fixed before the first comparison, and the result

Inclination 1e-9 rad; minimum inclination 1e-9 rad (floor 1e-12 rad); circular speed 1e-12
relative; dogleg dv 1e-10 relative; site speed 1e-6 relative; opportunity counts exact (tangent
rule in the test). First run (2026-10-01): all met (worst inclination 2.6e-15 rad) except the
site speed, which misses at 62.9 deg latitude by 1.12e-6 relative (Orekit includes polar motion).
