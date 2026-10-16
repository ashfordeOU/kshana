<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Entry heating, EO radiometry and ascent losses

Three trade-study kinds sit one step above the closed-form `reentry`, `eo-coverage` and
`launch-window` kinds. None of them changes those kinds' outputs.

```sh
kshana scenarios/entry-heating-stardust.toml
kshana scenarios/eo-radiometry.toml
kshana scenarios/ascent-losses.toml
```

The `units` block of each result gives the unit and provenance of every field.

## `entry-heating`

A 3-DoF point-mass entry over a rotating spherical Earth or Mars, integrated with RK4.

- **Vehicle:** ballistic, or lifting at a constant bank.
- **Atmosphere:** US Standard Atmosphere 1976, exponential, or the Mars model.
- **Heating:** stagnation-point convective heat flux by Sutton and Graves (NASA TR R-376, 1971),
  `q = k √(ρ/R_n) V³`, and its time integral, the heat load.
- **Reported:** peak deceleration, heat flux and dynamic pressure, with times and altitudes, and
  the downrange distance.
- **Internal checks:** the rotating-frame energy falls by exactly the drag work, and the
  Allen–Eggers closed form is reported beside the integrated peak.
- **Entry state:** given inertial or planet-relative.

**Evidence.** The peak deceleration is VALIDATED on one published case, the Stardust capsule's
nominal entry (`xval/entry-stardust/PREREGISTRATION.md`, `tests/entry_stardust_published.rs`):
35.44 g against the published 33.4 g of a 6-DoF trajectory, within the pre-registered ±10 %.
The heating is MODELLED. The published Stardust heating estimate includes radiative heating,
which this convective relation leaves out.

**Not modelled:** attitude (6-DoF), J2, winds, radiative heating, wall temperature and
catalycity, thermal-protection response, and guidance.

## `eo-radiometry`

A nadir imager's budgets.

- **Radiometry:** the at-aperture radiance of a Lambertian scene, the camera equation
  `E = π τ L / (1 + 4F²)`, signal electrons, and shot, dark, read and quantisation noise, giving
  the SNR.
- **MTF at Nyquist:** unobscured diffraction × detector aperture × linear smear × Gaussian
  jitter.
- **Image quality:** the relative edge response integrated from that MTF, `Q = λF/p`, and the
  NIIRS from the General Image Quality Equation version 4 (Leachtenauer et al., 1997) with no MTF
  compensation.

**Evidence.** MODELLED, checked against closed forms: the diffraction MTF, a pure pixel's ramp
edge (RER 1), a Gaussian blur's normal-CDF edge, and shot-noise scaling. The NIIRS is the
published regression evaluated on modelled inputs, not a rated image.

## `ascent-losses`

A planar gravity-turn ascent of a multi-stage vehicle over a non-rotating Earth through
US Standard Atmosphere 1976.

- **Trajectory:** a vertical rise, a pitch kick, then thrust along the velocity. The thrust is
  reduced by the ambient pressure on the nozzle exit (`reentry::us76_pressure`).
- **Losses:** gravity, drag, steering and back-pressure, each integrated with the state.
- **Check:** the burnout speed equals `Σ Isp g0 ln(m0/mf)` minus the four losses, an exact
  identity. The run reports its residual.
- **Also reported:** max-Q, peak acceleration and the burnout state.

**Evidence.** MODELLED: the identity, Tsiolkovsky's equation on a vertical vacuum burn, and the
US76 pressures. No real vehicle's losses have been compared.

**Not modelled:** Earth rotation, coast phases, throttling, guidance and optimisation.
