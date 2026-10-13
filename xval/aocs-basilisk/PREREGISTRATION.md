# Pre-registration: Kshana's closed-loop MRP feedback with reaction wheels against Basilisk (CAP-21)

Committed on its own on 2026-10-13, before Kshana's AOCS code exists and before any comparison
with Basilisk has been run. The bars are not loosened after a run. A miss is recorded with its
numbers as a FINDING, and the row stays MODELLED.

## Oracle

Basilisk 2.9.1 (AVSLab, ISC licence; the `bsk` wheel from PyPI, run as a separate tool and never
linked or vendored), in one task at a fixed step:

- `spacecraft.Spacecraft` hub, with no gravity body;
- `reactionWheelStateEffector` with `BalancedWheels` wheels from `simIncludeRW.rwFactory`
  (custom type), with `useMaxTorque` on;
- `simpleNav` with no noise;
- `inertial3D` guidance (σ_RN = 0);
- `attTrackingError`;
- `mrpFeedback` (K, P; Ki < 0, so no integral term; controlLawType 0) and `rwMotorTorque`
  (all three body axes controlled).

Module priorities: the RW effector runs before the hub, and the hub before the FSW modules. The
motor torque computed from the state at t is therefore applied over [t, t + dt]: a zero-order hold
with no delay. The oracle integrates with Basilisk's default RK4.

## Kshana side (to be written to this specification)

Its own implementation, from the published MRP feedback law (Schaub and Junkins, *Analytical
Mechanics of Space Systems*) in the form `mrpFeedback` documents. With inertial pointing:

    L_r = −K σ_BR − P ω_BR + ω_RN × (I ω + Σ J_s,i (ĝ_i·ω + Ω_i) ĝ_i)
    (the last term is zero for inertial pointing)

- **Torque mapping.** The minimum-norm wheel torques give `[G_s] u = −L_r`, i.e.
  `u = G_sᵀ (G_s G_sᵀ)⁻¹ (−L_r)`, each clipped to ±u_max.
- **Hub inertia.** `I` includes each wheel's `J_s ĝ ĝᵀ`. Balanced wheels add no other mass
  property.
- **Dynamics:**

      (I − Σ J_s ĝ ĝᵀ) ω̇ = −ω × (I ω) − Σ (ĝ u + J_s Ω ω × ĝ)
      Ω̇_i = u_i / J_s − ĝ_iᵀ ω̇

- **Integration.** Quaternion kinematics, fixed-step RK4 at the oracle's dt, and the same
  zero-order hold.

## Cases (all fixed now)

The hub inertia is diag(900, 800, 600) kg m² plus the wheels' J_s ĝĝᵀ. The gains are K = 3.5 N m
and P = 30 N m s. dt = 0.1 s, duration 600 s, sampled every 1 s (601 samples).

| Case | Wheels | J_s (kg m²) | u_max (N m) | Ω₀ (rpm) | σ_BN(0) | ω_BN(0) (rad/s) |
|---|---|---|---|---|---|---|
| A | 3, along body x, y, z | 0.08 | 0.2 | 100, 200, 300 | 0.1, 0.2, −0.3 | 0.001, −0.01, 0.03 |
| B | 4, pyramid at 54.7356° from body z, azimuths 45°, 135°, 225°, 315° | 0.08 | 0.2 | 100, −200, 300, −400 | 0.1, 0.2, −0.3 | 0.001, −0.01, 0.03 |
| C (saturating) | as B | 0.08 | 0.05 | 0, 0, 0, 0 | 0.5, −0.4, 0.3 | 0, 0, 0 |

## Bars (every sample of every case)

| Id | Quantity | Bar |
|---|---|---|
| A0 | convention check, before the comparison: the wheel motor torques at t = 0 against Kshana's from the initial state | ≤ 1e-12 N m |
| A1 | each MRP component of σ_BN (Kshana's quaternion mapped to the set with \|σ\| ≤ 1) | ≤ 1e-9 |
| A2 | each body-rate component | ≤ 1e-9 rad/s |
| A3 | each wheel speed | ≤ 1e-6 rad/s |
| A4 | each wheel motor torque | ≤ 1e-9 N m |
| A5 | case C really saturates: at least one wheel at ±u_max in the first 10 s, in both tools | holds |

## Outcome rule

If all the bars hold on all three cases, the ledger row "Closed-loop MRP feedback attitude
control with reaction wheels" is VALIDATED (OracleBasis Library, Basilisk 2.9.1). Any miss is a
FINDING with its numbers, pinned by the test, and the row stays MODELLED.

The MEKF estimator (gyro and star tracker) is not part of this comparison. Basilisk 2.9.1 has no
MEKF module to compare against, so it is MODELLED, checked by filter consistency (NEES) on
simulated truth.

## What this does not check

- Sensors with noise in the loop.
- Wheel friction, jitter, wheel-speed limits and power.
- Any real spacecraft's gains.
- Any guidance law other than inertial pointing.
