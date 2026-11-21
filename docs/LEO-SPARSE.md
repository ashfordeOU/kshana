# Sparse-geometry LEO-PNT study

`kshana leo-sparse` studies positioning and timing with only one or two low Earth orbit (LEO)
satellites in view. For a stated LEO constellation and a static user it computes, over time, how
much the Doppler (range-rate) and range measurements of those satellites tell about the user's
position and clock, and when a stated accuracy is reached. It is a planning study: it processes no
measurements, and there is no navigation filter and no real-time solution. Every result is
MODELLED.

Abbreviations used on this page, in full:

| Abbreviation | Meaning |
|---|---|
| ENU | east, north, up (the user's local axes) |
| JSON | JavaScript Object Notation |
| LEO | low Earth orbit |
| PNT | positioning, navigation and timing |
| TOML | Tom's Obvious Minimal Language |
| WGS 84 | World Geodetic System 1984 |

## Command

```bash
kshana leo-sparse examples/leo-sparse/study.toml
```

## The study file

| Key | Meaning |
|---|---|
| `[user]` | `lat_deg`, `lon_deg`, `height_m` (WGS 84); the user is static |
| `[leo]` | Walker delta: `total`, `planes`, `phasing`, `altitude_km` (below 3 000), `inclination_deg` |
| `mask_deg` | elevation mask |
| `max_in_view` | the cases: `[1]`, `[2]` or `[1, 2]`, the most satellites used at once |
| `measurements` | `doppler`, `range` or `both` |
| `doppler_sigma_mps`, `range_sigma_m` | measurement noise, 1 sigma (defaults 0.1 m/s and 5 m) |
| `duration_hours`, `step_s`, `report_every_s` | window, measurement interval, report interval |
| `prior_position_m`, `prior_bias_m`, `prior_drift_mps` | prior standard deviations (defaults 10⁶ m, 10⁶ m, 10³ m/s: unknown) |
| `target_horizontal_m`, `target_3d_m` | the accuracy whose time is reported |

At each step the satellites above the mask are found; those already used stay in use while they
remain in view, and free places go to the highest. Each used satellite contributes, per step:

| Measurement | Model | Partials with respect to [position, bias, drift] |
|---|---|---|
| range | ρ = \|s − r\| + b + d·t | [−u, 1, t] |
| range rate | ρ̇ = u·vₛ + d | [−(vₛ − (u·vₛ)u)/\|s − r\|, 0, 1] |

where u is the unit vector from the user to the satellite and s and vₛ are the satellite's
Earth-fixed position and velocity (two-body orbits). The information J = Σ HᵀH/σ² plus the priors
gives the covariance P = (J + P₀⁻¹)⁻¹. Each report gives the east, north and up standard
deviations, the horizontal and 3D ones, the clock bias and drift ones, the rank of J (of 5,
without the priors), the satellites in use and the measurements so far; each case gives the first
report time at which the horizontal (and 3D) target is met.

Range rate carries no information on the clock bias: with Doppler only, the bias stays at its
prior and the rank of J is at most 4. Range measurements make the bias observable.

## Limits

- A static user; the clock has a constant drift over the window (no random walk).
- Two-body satellite orbits; ephemerides taken as exact; white, uncorrelated measurement noise.
- A formal covariance shows the information geometry, not achieved accuracy; it ignores
  linearisation and the left–right ambiguity a single pass can leave.
