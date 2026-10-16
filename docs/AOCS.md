<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Attitude control with reaction wheels (`aocs`)

The `aocs` kind slews a rigid spacecraft with reaction wheels to an inertial attitude under
MRP feedback. It can close the loop on the true state or on an MEKF estimate from a gyro and
a star tracker.

```sh
kshana scenarios/aocs-slew.toml        # true-state loop
kshana scenarios/aocs-slew-mekf.toml   # loop closed on the MEKF
```

## Model

- **Attitude.** `q` is the body→inertial quaternion. `σ_BN = q_v / (1 + q_w)`, with
  `q_w ≥ 0`, is the MRP set on the short branch. The target is `σ = 0`.
- **Control law** (Schaub and Junkins; the form Basilisk's `mrpFeedback` documents):
  `L_r = −K σ − P ω`.
- **Wheel torques.** The minimum-norm solution of `G_s u = −L_r`, each clipped to the wheel's
  `u_max_nm`.
- **Dynamics.** `hub_inertia_kg_m2` is the hub without the wheels; the run adds each wheel's
  `J_s ĝ ĝᵀ`. Then:

  ```text
  (I − Σ J_s ĝ ĝᵀ) ω̇ = −ω × (I ω) − Σ (ĝ u + J_s Ω ω × ĝ)
  Ω̇ = u / J_s − ĝᵀ ω̇
  ```

  The control is held over each step `dt_s` and the state is integrated with RK4.
- **Estimator** (optional `[estimator]` table): the multiplicative EKF of Lefferts, Markley and
  Shuster.
  - Gyro: angle and rate random walk (`gyro_arw_rad_sqrt_s`, `gyro_rrw_rad_s_1p5`) and a true
    turn-on bias (`gyro_bias0_rad_s`).
  - Star tracker: `star_tracker_sigma_arcsec` per axis every `star_tracker_every_s`.
  - The controller uses the filter's attitude, and the gyro rate less the filter's bias.

## Outputs

- Settling time to `pointing_threshold_deg`.
- Final and peak pointing error.
- Each wheel's peak speed, peak torque and the fraction of steps at its torque limit.
- Drift of the total angular momentum. No outside torque acts, so this checks the integration.
- With the estimator: its attitude error, mean NEES (6 for a consistent filter) and the number
  of star-tracker updates.
- Sampled series of all of the above.

The `units` block gives the unit and provenance of every field.

## Evidence

- **"Closed-loop MRP feedback attitude control with reaction wheels" is VALIDATED.** Basilisk
  2.9.1 was run as a separate tool, with the modules spacecraft, reactionWheelStateEffector,
  mrpFeedback and rwMotorTorque. On three pre-registered cases (three orthogonal wheels, a
  four-wheel pyramid, and a saturating case) every MRP component, body rate, wheel speed and
  motor torque agreed to round-off at every sample. See `xval/aocs-basilisk/PREREGISTRATION.md`
  and `tests/aocs_basilisk_oracle.rs`.
- **"Multiplicative EKF attitude estimation from a gyro and a star tracker" is MODELLED.** It
  is checked by its NEES over Monte Carlo seeds on truth simulated from the same sensor models.
  Basilisk 2.9.1 has no MEKF to compare it with.

## Not modelled

- Tracking guidance, integral feedback and momentum management.
- Magnetorquers and thrusters.
- Wheel friction, jitter, speed limits and power.
- External disturbance torques.
- Sensor misalignment and scale factor.

The gains and inertias in the bundled scenarios are illustrative, not any spacecraft's. This
is not a flight controller.
