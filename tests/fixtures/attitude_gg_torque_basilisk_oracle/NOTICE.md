# attitude_gg_torque_basilisk_oracle fixture

Used only by `tests/attitude_gg_torque_basilisk_oracle.rs`; not shipped in any published package.

## What is here

- `attitude_gg_torque_basilisk_oracle.txt`: gravity-gradient torque magnitudes computed by
  Basilisk for 5 altitudes and 8 inertia tensors (3 diagonal, 5 general from seed 20261001):
  the torque at the 45 deg attitude and the largest torque over 2000 random attitudes.
  SHA-256 d907b815706301b113ee1030bb08c5c4af64ff0603c6cc479806728bd4da87f6.
- `gen_attitude_gg_torque_basilisk_oracle.py`: the generator (command in its docstring).

The values are the output of a tool run on synthetic inputs; no part of the tool is included.

## Oracle (run as a tool, never linked or vendored)

| Oracle | Version | Licence | Source |
|---|---|---|---|
| Basilisk `GravityGradientEffector`, `spacecraft.Spacecraft` | 2.9.1 (`bsk` wheel) | ISC | https://github.com/AVSLab/basilisk |
| NumPy (eigen-decomposition of the inputs, random attitudes) | 2.3.5 | BSD-3-Clause | https://numpy.org |

Generated 2026-10-01 with the oracle toolchain's Python 3.12.12 environment
(`~/Code/kshana-oracles`).

## Tolerances, fixed before the first comparison

Peak torque within 1e-12 relative of Basilisk at the 45 deg attitude; no random-attitude torque
above the peak times (1 + 1e-12). First run (2026-10-01): all 40 cases met, worst peak difference
2.1e-15 relative.
