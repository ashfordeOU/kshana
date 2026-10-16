# srp_boxwing_orekit_oracle fixture

Used only by `tests/srp_boxwing_orekit_oracle.rs`; not shipped in any published package.

- `srp_boxwing_orekit_oracle.txt` (SHA-256 c6bd5d08eb5d760aae09db685396eb51158e1730ab33fb78bd251e0b28a5da6a):
  252 synthetic Galileo-orbit geometries and 100 seeded random attitudes (parameters only), and
  Orekit's box-wing SRP accelerations, radiation-factor derivatives, per-panel central
  differences, `GenericGNSS` nominal-yaw attitudes and ECOM2 accelerations. Written to stdout by
  `java/BoxWingDriver.java`; tool output on synthetic geometry, no part of the tool is included.
- The `PANEL` and `MASS` rows repeat the Galileo box-wing tables of `src/srp_boxwing.rs`
  (GSC Galileo satellite metadata, © EU 2011-2026, reproduced with acknowledgement under the GSC
  copyright notice; see the repository NOTICE), so the test can check both sides used the same
  inputs.

Reproduce (Orekit and Hipparchus jars from Maven Central, SHA-1 checked; no orekit-data needed,
the frame is GCRF, the epoch J2000 and the Sun a fixed point):

```
CP=$(ls orekit-12.2.jar hipparchus-{core,geometry,ode,fitting,optim,filtering,stat}-3.1.jar | tr '\n' ':')
javac -d build -cp "$CP" java/BoxWingDriver.java
java -cp "$CP:build" BoxWingDriver > srp_boxwing_orekit_oracle.txt
```

| Oracle | Version | Licence | Source |
|---|---|---|---|
| Orekit BoxAndSolarArraySpacecraft, FixedPanel, PointingPanel, SolarRadiationPressure, ECOM2, GenericGNSS | 12.2 (Maven Central, SHA-1 verified; orekit-12.2.jar SHA-256 6e1d7d989b9dc82130eb4fdc194c07fc54a9fd4042db2dddb774330628874392) | Apache-2.0 | https://www.orekit.org |
| Hipparchus (Gradient, geometry) | 3.1 | Apache-2.0 | https://hipparchus.org |

Generated 2026-10-13 with OpenJDK 21.0.12. Tolerances: `xval/srp-boxwing-orekit/PREREGISTRATION.md`.
