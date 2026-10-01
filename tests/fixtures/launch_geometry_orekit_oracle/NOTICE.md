# launch_geometry_orekit_oracle fixture

Used only by `tests/launch_geometry_orekit_oracle.rs`; not shipped in any published package.

## What is here

- `launch_geometry_orekit_oracle.txt`: Orekit's inclinations for burnout states along the launch
  azimuths Kshana computed (158 cases), azimuth-sweep minimum inclinations, circular speeds,
  dogleg plane-change dv, Earth-fixed site speeds and daily plane-crossing counts.
  SHA-256 38cfa80e68435dd4f13914c3d25b37c66fb4c6a170fe0c7999ace20f27f42df7 (regenerated
  2026-10-01 on the Linux host of round 2 with the same driver, Orekit 12.2 and script; the
  earlier file, SHA-256 a5898b27cb4259a9fc6153207dcc96149babbf896a28252871d11a8da563d323, was
  dumped on another platform whose libm differs by an ulp in `asin`. 24 lines changed: 22
  `INC` lines, where the fed azimuths move by an ulp, or by about 3e-9 rad at lat -60 deg,
  i 60.5 and 120 deg where cos(i)/cos(lat) is near -1, and Orekit's inclinations by at most
  8.9e-16 rad; and 2 `OPP` lines (lat 62.9, i 62.9 and 67.9), where only the closest-approach
  min|g| moves at the 1e-17 and 4e-17 level, the crossing counts unchanged. Every `MIN`,
  `VC`, `DOG` and `ROT` line is byte-identical.)
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

## Round 2 addition (2026-10-01): `finals2000A_2026-02-28_to_03-02.txt`

Three data rows (MJD 61099 to 61101, lines 19416 to 19418) copied verbatim from the IERS Rapid
Service/Prediction Center `finals2000A.all` frozen on 2026-09-30
(https://datacenter.iers.org/data/9/finals2000A.all, SHA-256 of the whole file
cc80680ec05c91b65e7d02c6068fe0d44dd0998dc880551975092d2d14aa8e18; IERS products, free use with
citation; SHA-256 of the three-row extract 1d40ee99c6d71b3841ded7d4d34effebf7f84ce5d0afb46222b679919320446a). They supply x_p, y_p and LOD at the driver's epoch 2026-03-01T00:00:00 UTC to
`launch::site_rotation_speed_at`. Orekit read its own copy (orekit-data `main`), whose row for
2026-03-01 carries the same x_p and y_p and an LOD of 0.1505 ms against 0.1502 ms here.
