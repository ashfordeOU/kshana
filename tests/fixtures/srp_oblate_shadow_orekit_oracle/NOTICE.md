# srp_oblate_shadow_orekit_oracle fixture

Used only by `tests/srp_oblate_shadow_orekit_oracle.rs`; not shipped in any published package.

- `srp_oblate_shadow_orekit_oracle.txt` (SHA-256 00187b3e5ec8aa5fb8bfd212d7d24563dfb1e43f8932292b6b5281b32ab50dab):
  2400 synthetic Sun-Earth-satellite geometries (parameters only) and Orekit's lighting ratio for
  a WGS-84 and a spherical occulting Earth. Generator `generate_srp_oblate_shadow_orekit_oracle.py`,
  driver `java/ShadowDriver.java`; reproduce commands in the generator docstring. Tool output on
  synthetic geometry; no part of the tool is included.

| Oracle | Version | Licence | Source |
|---|---|---|---|
| Orekit SolarRadiationPressure.getLightingRatio, OneAxisEllipsoid | 12.2 (Maven Central, SHA-1 verified; orekit-12.2.jar SHA-256 6e1d7d989b9dc82130eb4fdc194c07fc54a9fd4042db2dddb774330628874392) | Apache-2.0 | https://www.orekit.org |
| Hipparchus | 3.1 | Apache-2.0 | https://hipparchus.org |

Generated 2026-10-13 with OpenJDK 21.0.12. Tolerances: `xval/srp-oblate-shadow-orekit/PREREGISTRATION.md`.
