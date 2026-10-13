# aocs_basilisk_oracle fixture

Used only by `tests/aocs_basilisk_oracle.rs`; not shipped in any published package.

## What is here

- `aocs_basilisk_oracle.txt`: three closed-loop attitude-control runs from Basilisk over 600 s,
  sampled every 1 s. Each sample gives the MRP set σ_BN, the body rates, the wheel speeds, the
  commanded wheel motor torques and the applied motor torques. Each case also records its inertia,
  wheels and initial state. SHA-256
  4c7b11cbb08982865a455e4e9d5dd20078a1d170450b7a3ffb1dc22d310068e1.
- `gen_aocs_basilisk_oracle.py`: the generator (command in its docstring).

The values are the output of a tool run on synthetic inputs; no part of the tool is included.

## Oracle (run as a tool, never linked or vendored)

| Oracle | Version | Licence | Source |
|---|---|---|---|
| Basilisk `spacecraft`, `reactionWheelStateEffector` (BalancedWheels), `simpleNav`, `inertial3D`, `attTrackingError`, `mrpFeedback`, `rwMotorTorque`; default RK4 | 2.9.1 (`bsk` wheel from PyPI) | ISC | https://github.com/AVSLab/basilisk |

Generated 2026-10-13 with Python 3.12.3. The cases, the module set and the bars were registered
in `xval/aocs-basilisk/PREREGISTRATION.md` (commit 27d6831a) before the fixture was generated
and before any comparison.
