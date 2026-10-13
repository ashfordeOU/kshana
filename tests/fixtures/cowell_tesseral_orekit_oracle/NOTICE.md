# cowell_tesseral_orekit_oracle fixture

Used only by `tests/cowell_tesseral_orekit_oracle.rs`; not shipped in any published package.

## What is here

- `cowell_tesseral_orekit_oracle.txt`: Orekit reference states, 6 cases × 25 hourly states over 24 h,
  for the opt-in tesseral Cowell tier (EGM2008 8×8 and 70×70, one case with Sun/Moon and SRP).
  SHA-256 3cd7907c3ea607db0c4a2ff26c763179956efd7cdcd9eb9e712ebbcf58e54c5b.
- `java/TesseralDriver.java`: the driver; `generate_cowell_tesseral_orekit_oracle.py`: the generator
  (reproduce commands in its docstring).

The values are the output of a tool run on synthetic initial states; no part of the tool is included.
The gravity coefficients are read from the committed `tools/egm2008_to70.gfc` (NGA EGM2008, public
domain, via ICGEM; SHA-256 fe2f68a0025d75ba2e15c5df80e8597832293da24f3f64ac4ad72fc2882d7ba2).

## Oracle (run as a tool, never linked or vendored)

| Oracle | Version | Licence | Source |
|---|---|---|---|
| Orekit `NumericalPropagator`, `DormandPrince853Integrator`, `HolmesFeatherstoneAttractionModel` | 12.2 (Maven Central, SHA-1 verified; orekit-12.2.jar SHA-256 6e1d7d989b9dc82130eb4fdc194c07fc54a9fd4042db2dddb774330628874392) | Apache-2.0 | https://www.orekit.org |
| Hipparchus | 3.1 (SHA-1 verified) | Apache-2.0 | https://hipparchus.org |

Generated 2026-10-12 with OpenJDK 21.0.12.

## Tolerance

Pre-registered in `xval/cowell-tesseral-orekit/PREREGISTRATION.md` (f0e0e65, amended 2da899a) before
the first comparison. Result: `xval/cowell-tesseral-orekit/RESULTS.md`.
