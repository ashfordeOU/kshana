# attitude_dynamics_basilisk_oracle fixture

Used only by `tests/attitude_dynamics_basilisk_oracle.rs`; not shipped in any published package.

## What is here

- `attitude_dynamics_basilisk_oracle.txt`: two torque-free rigid-body trajectories (general
  non-diagonal inertia) propagated by Basilisk for 1e4 s, sampled every 100 s, as Euler
  parameters of [BN] and body rates, plus each initial [BN].
  SHA-256 24e00ef3f846b6a14aa981f571b49e15e9d734e6676251842a87521289a5a19f.
- `gen_attitude_dynamics_basilisk_oracle.py`: the generator (command in its docstring).

The values are the output of a tool run on synthetic inputs; no part of the tool is included.

## Oracle (run as a tool, never linked or vendored)

| Oracle | Version | Licence | Source |
|---|---|---|---|
| Basilisk `spacecraft.Spacecraft` hub, `svIntegratorRKF78` (rel tol 1e-12, abs tol 1e-14) | 2.9.1 (`bsk` wheel) | ISC | https://github.com/AVSLab/basilisk |

Generated 2026-10-01 with the oracle toolchain's Python 3.12.12 environment. Oracle convergence,
checked before the comparison: rerunning at 0.25 s and 0.1 s task steps moved the states by at
most 3.4e-12 (MRP components) and 4.4e-13 rad/s.

## Tolerances, fixed before the first comparison

Every quaternion component within 1e-9 and every body-rate component within 1e-9 rad/s at every
sample, with Kshana's RK4 at dt = 0.01 s. First run (2026-10-01): met, worst 3.3e-11 (quaternion)
and 3.4e-12 rad/s.
