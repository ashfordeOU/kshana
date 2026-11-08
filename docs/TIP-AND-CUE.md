# Revisit and tip-and-cue latency: `tip-and-cue`

How often a wide-area RF survey from low Earth orbit revisits each point of a sea area, how long it
takes to see the whole area, and how long it takes from an RF access to an optical look by a second
layer of satellites (roadmap row M2).

```sh
kshana scenarios/tip-and-cue-baltic-m2.toml
```

## Model

- Each layer is a Walker star pattern (`T` satellites, `P` planes over 180°, phasing `F`) of circular
  550 km orbits at the sun-synchronous inclination 97.59°, propagated by the `constellation-design`
  model: two-body motion with the secular J2 drift of node and perigee, on a spherical rotating Earth.
  The first plane's node is at 0° E at the epoch (2025-01-01 00:00 UTC); an optical layer's planes sit
  half a plane spacing further east.
- The RF layer sees a point when a satellite is at or above an elevation mask; the optical layer when
  the point is within an off-nadir angle of a satellite (optionally only with the Sun at or above an
  elevation at the point).
- The area is the 996 Baltic sea points of `data/tip-and-cue/baltic_sea_points.csv`: a 0.25° grid over
  53.5–66.0° N, 9.5–30.5° E outside Natural Earth land and lakes, the Kattegat and Skagerrak removed.

## Figures

- **R, revisit**: per point, the mean gap between RF access intervals; area-weighted (`cos φ`).
- **F, full-area refresh**: from each start time on a 1 min grid, the wait until every point has been in
  RF view; averaged.
- **Q, RF-to-optical reaction**: from the start of each RF access interval, the wait until the point is
  in the optical field of regard; per-point means, area-weighted.

Each comes with its median, 95th percentile and largest value. The exact edge rules are in
`xval/m2-revisit-tip-and-cue/README.md`.

## Scenario fields

| Field | Default | Meaning |
|---|---|---|
| `area` | `baltic` | the area (only `baltic`) |
| `step_s` | 10 | time step, s |
| `span_days` | 2 | span; F and Q use start times before the last day |
| `m2` | false | run the nine pre-registered M2 cases instead of `cases` |
| `cases` | the M2 primary 16-satellite case | `[[cases]]` with `name`, `rf` and `optical` (`total`, `planes`, `phasing`, `node_offset`), `rf_mask_deg`, `optical_off_nadir_deg`, `optical_min_sun_deg` |

## Status

MODELLED: geometry and timing only (no link budget, detection, cloud, tasking or downlink latency).
The access intervals agree with an independent recomputation (bar M2-B0). The comparison with a
published set of figures is a cross-check of two simulations, never a validation; its result is in
`docs/design/evidence/m2-revisit-tip-and-cue/RESULTS.md`.
