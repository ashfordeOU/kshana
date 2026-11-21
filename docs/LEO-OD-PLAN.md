# BeiDou–LEO planning

`kshana leo-od-plan` is a planning tool for using a low Earth orbit (LEO) constellation whose
satellites receive BeiDou signals. It predicts, for each BeiDou satellite over an arc, how often
ground stations and LEO receivers can track it, and the formal orbit-determination covariance with
and without the LEO receivers. It processes no measurements and controls nothing. Every result is
MODELLED.

Abbreviations used on this page, in full:

| Abbreviation | Meaning |
|---|---|
| BDS | BeiDou Navigation Satellite System |
| GEO | geostationary orbit |
| IGSO | inclined geosynchronous orbit |
| JSON | JavaScript Object Notation |
| LEO | low Earth orbit |
| MEO | medium Earth orbit |
| OD | orbit determination |
| RK4 | fourth-order Runge–Kutta integration |
| TOML | Tom's Obvious Minimal Language |

## Command

```bash
kshana leo-od-plan examples/leo-od-plan/plan.toml
```

## The plan

| Key | Meaning |
|---|---|
| `arc_hours`, `step_s` | the arc and the step (at most 100 000 steps) |
| `ground_mask_deg` | ground elevation mask |
| `leo_mask_deg` | LEO receiver elevation mask, may be negative (below the receiver's local horizontal) |
| `grazing_height_km` | the line of sight to a LEO receiver must clear the Earth by this height |
| `bds_half_beamwidth_deg` | the BeiDou antenna half-beamwidth used for reception off the Earth's limb, degrees from nadir: a planning input (no published value is assumed; state its source in the plan) |
| `ground_sigma_m`, `leo_sigma_m` | range noise per observation, 1 sigma |
| `include_geo_igso` | add the three GEO and three IGSO satellites (default: the 24 MEO only) |
| `[leo]` | Walker delta: `total`, `planes`, `phasing`, `altitude_km`, `inclination_deg` |
| `[[station]]` | `name`, `lat_deg`, `lon_deg` |

The BeiDou constellation is the nominal one of BDS-OS-PS-3.0 as built by
`kshana::constellation::beidou_slots` (Walker 24/3/1 at 21 528 km and 55°; the phases the standard
does not state are chosen there and documented). The example plan's numbers are inputs chosen for
illustration, not published values of any system.

## What it computes

For each BeiDou satellite and each step:

- a ground station tracks it when it is above the station's elevation mask (spherical Earth,
  rotating at the WGS 84 rate);
- a LEO receiver tracks it when the line of sight clears the Earth by the grazing height, the
  receiver lies within the half-beamwidth from the BeiDou nadir, and the satellite is above the
  receiver's mask.

The report gives the fraction of steps tracked by ground, by LEO and by either, and the mean number
of each. For the covariance, each tracking observer contributes one range per step:
J = Σ HᵀH/σ², with H = uᵀ·∂r(t)/∂x₀, u the line-of-sight unit vector and ∂r(t)/∂x₀ the two-body
sensitivity of the position at t to the epoch state (central differences through an RK4
propagator, checked against the Kepler solution to under 1 m over a day). The epoch position
standard deviation is √(trace of the position block of J⁻¹), ground only and ground plus LEO;
`median_improvement` is the median ratio of the two.

## Limits

- Two-body motion only (no J2, drag or radiation pressure); observer positions known exactly.
- Ranges are geometric: satellite and receiver clocks are not estimated (as if from a two-way link
  or with known clocks). With one-way ranges and estimated clocks the covariance is larger.
- Observations are uncorrelated, one per observer per step; no outages, no antenna gain pattern
  beyond the half-beamwidth cut, no signal power budget.
- A formal covariance shows the information geometry, not achieved accuracy.
