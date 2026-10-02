# cw_dynamics_orekit_oracle fixture

Used only by `tests/cw_dynamics_orekit_oracle.rs`; not shipped in any published package.

## What is here

- `cw_dynamics_orekit_oracle.txt`: nonlinear two-body relative motion of four 100 m deputies
  about a circular 500 km chief over a third of an orbit, in the chief's Hill frame, every 60 s.
  SHA-256 888693f6f42b1fd2ed01cddd41b42e7fc080e77724eb6af6dd6a627940ce061f.
- `CwOrekitDriver.java`: the driver (compile and run commands in its header).

The values are the output of a tool run on synthetic inputs; no part of the tool is included.

## Oracle (run as a tool, never linked or vendored)

| Oracle | Version | Licence | Source |
|---|---|---|---|
| Orekit `NumericalPropagator`, `DormandPrince853Integrator`, `LOFType.QSW` | 12.2 (Maven Central, orekit-12.2.jar SHA-256 6e1d7d989b9dc82130eb4fdc194c07fc54a9fd4042db2dddb774330628874392) | Apache-2.0 | https://www.orekit.org |
| Hipparchus | 3.1 | Apache-2.0 | https://hipparchus.org |

Generated 2026-10-01 with OpenJDK 21.0.5 and the oracle toolchain (`~/Code/kshana-oracles`).

## Tolerance, fixed before the first comparison, and the result

CW position within 1e-3 m of Orekit at every sample. First run (2026-10-01): DISAGREES, worst
gaps 1.24e-3 to 6.28e-3 m (0.85 to 4.3 times rho^2/r). A diagnostic rerun at 10 m separation
shrank every gap by a factor 100, so the gap is the second-order term of the linear model.

Round 2 (2026-10-01): the same fixture, unchanged, is compared at the same 1e-3 m bar with the
closed-form second-order propagator `cw_dynamics::propagate_second_order`: worst gaps 2.2e-8 to
1.2e-7 m. AGREES.
