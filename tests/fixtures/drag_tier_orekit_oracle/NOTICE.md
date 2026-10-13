# drag_tier_orekit_oracle fixture

Used only by `tests/drag_tier_orekit_oracle.rs`; not shipped in any published package.

- `drag_tier_orekit_oracle.txt` (SHA-256 d934243f0f71e491afde558c119fbac5635ab3c6d1480f74a90221b4b11f22a1): Orekit
  reference states (4 cases × 25 hourly states). Generator `generate_drag_tier_orekit_oracle.py`,
  driver `java/DragDriver.java`; reproduce commands in the generator docstring. Tool output on
  synthetic initial states; no part of the tool is included.

| Oracle | Version | Licence | Source |
|---|---|---|---|
| Orekit NumericalPropagator, DormandPrince853, DragForce, NRLMSISE00, IsotropicDrag | 12.2 (Maven Central, SHA-1 verified; orekit-12.2.jar SHA-256 6e1d7d989b9dc82130eb4fdc194c07fc54a9fd4042db2dddb774330628874392) | Apache-2.0 | https://www.orekit.org |
| Hipparchus | 3.1 | Apache-2.0 | https://hipparchus.org |

Generated 2026-10-13 with OpenJDK 21.0.12. Tolerances: `xval/drag-tier-orekit/PREREGISTRATION.md`.
