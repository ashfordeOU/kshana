<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# M2 revisit and tip-and-cue latency: readings and oracle

The pre-registration is `docs/design/evidence/m2-revisit-tip-and-cue/PREREGISTRATION.md`, signed off on
3 November 2026. This directory holds the readings of it fixed here **before any planner code**, the
independent oracle for bar M2-B0 (`oracle.py`, numpy only, sharing no code with the engine), and the
script that builds the area's sea points from Natural Earth (`area.py`, Python standard library only).

## Readings fixed before the planner code

1. **Orbit elements.** Every satellite: circular (`e = 0`), semi-major axis `a = 6 928 137 m`
   (550 km over the WGS 84 equatorial radius 6 378 137 m), inclination 97.59° exactly as stated, argument
   of perigee 0. A layer of `T` satellites in `P` planes with phasing factor `F = 1` (Walker star):
   plane `k = 0 … P−1` has its ascending node at the Earth-fixed longitude `Ω_k = k·180°/P` at the epoch
   (plane 0 at 0° E), and satellite `j = 0 … T/P − 1` of plane `k` is at argument of latitude
   `u_jk = j·360°·P/T + k·360°·F/T` at the epoch. The optical layer is the same with
   `Ω_k = (k + ½)·180°/P`. Variant V1 (32 = 8 × 4) uses `P = 8`, `F = 1`.
2. **Propagation** (the engine's `constellation` model, from its stated equations): mean motion
   `n = sqrt(μ/a³)`; secular J2 rates `Ω̇ = −1.5 n J2 (R/p)² cos i`, `ω̇ = 0.75 n J2 (R/p)² (5 cos² i − 1)`
   with `p = a(1 − e²)`; at time `t` the argument of latitude is `u_jk + (n + ω̇) t`; the position in the
   orbit plane `(r cos u, r sin u cos i, r sin u sin i)` is rotated about the pole by the Earth-fixed node
   longitude `Ω_k + Ω̇ t − ω_E t`. Constants: `μ = 3.986004418e14 m³/s²`, `R = 6 378 137 m`,
   `J2 = 1.08262668e-3`, `ω_E = 7.2921151467e-5 rad/s`. No other perturbation; the epoch date enters only
   the V3 sun.
3. **Earth and points.** A sphere of radius `R`; a point at latitude `φ`, longitude `λ` is
   `R (cos φ cos λ, cos φ sin λ, sin φ)`, its local vertical the radius.
4. **Fields of regard.** RF: the satellite's elevation at the point, `sin ε = (s − p)·p̂ / |s − p|`, is
   `≥ sin 10°` (0° for V4). Optical: the off-nadir angle at the satellite, `cos η = (−s)·(p − s) / (|s| |p − s|)`,
   is `≥ cos 45°` (60° for V2), and the elevation is positive. Equality counts as inside.
5. **Time grid and access intervals.** Steps `t = 0, 10, 20, … , 604 800 s` (7 days, both ends included).
   A satellite's access interval at a point is a maximal run of consecutive steps at which it is inside;
   the interval is `[first step, last step]` of the run. A layer's merged intervals at a point are the
   maximal runs of steps at which **any** satellite of the layer is inside.
6. **R (revisit).** Per point, the gaps `s_{j+1} − e_j` between consecutive merged intervals (always
   positive, at least one step); the stretch before the first and after the last interval of the span is
   not a gap. A point's `ḡ_p` is the mean of its gaps; a point with no gap is listed and left out of the
   average. The figure is `Σ cos φ_p ḡ_p / Σ cos φ_p`. Reported unscored: start-to-start gaps
   `s_{j+1} − s_j`, the median and 95th percentile of all gaps, and the largest gap.
7. **F (full-area refresh).** Start times `t = 0, 60, … ` s with `t < 6 × 86 400`. For each point,
   `Δ_p(t) = 0` if it is inside an interval at `t`, else `s − t` for the first interval start `s > t`.
   `F(t) = max_p Δ_p(t)`. The figure is the mean of `F(t)`; reported unscored: median and 95th
   percentile. Every `t` has an answer because the span runs a day past the last start.
8. **Q (RF-to-optical reaction).** For every merged RF interval of every point whose start `s` is
   `< 6 × 86 400 s`: `Q = 0` if the point is inside the optical field of regard at step `s`, else the first
   later step at which it is, minus `s`. A cue with no optical access before the span ends is counted and
   left out (it is reported). Per point, the mean of its `Q`; the figure is the `cos φ`-weighted mean over
   points with at least one cue. Reported unscored: the median and 95th percentile of all cues.
9. **Area points.** `area.py` takes the cell centres `x.125, x.375, …` of the 0.25° grid with
   `53.5 ≤ φ ≤ 66.0` and `9.5 ≤ λ ≤ 30.5`, drops each point inside a polygon of Natural Earth 1:10m
   `ne_10m_land` or `ne_10m_lakes` (even-odd rule over all rings, holes included), and drops points with
   `φ > 55.65` and `λ < 13.0`. The sea points are committed as `data/tip-and-cue/baltic_sea_points.csv` (996 points) with the
   Natural Earth versions (land 5.1.1, lakes 5.0.0), file names and zip SHA-256 recorded in its header;
   the planner reads that list. Natural Earth is public domain.
10. **V3 (daylight).** The Sun's direction from the low-precision formula of the Astronomical Almanac
    (mean longitude, mean anomaly, ecliptic longitude, obliquity 23.439° − 4e-7°·d), rotated to Earth-fixed
    with the Greenwich mean sidereal time of IAU 1982 at UTC `2025-01-01T00:00:00 + t` (UT1 = UTC); an
    optical look counts only when the Sun is at or above 10° elevation at the point.
11. **Bar M2-B0.** The oracle propagates the 16-satellite RF layer over the first 24 h (steps
    `0 … 86 400 s`) and lists, for P1–P10 of M1, every satellite's access intervals and the merged
    intervals. The engine's must have the same counts, and every start and end must agree to within one step
    (10 s).

## Files

- `oracle.py`: B0, numpy only. `python3 -I oracle.py > oracle_b0.json`.
- `area.py`: builds `data/tip-and-cue/baltic_sea_points.csv` from the Natural Earth zips (fetched from
  `https://naciscdn.org/naturalearth/10m/physical/`), given as arguments.
- `oracle_b0.json`: the oracle's output, committed with it.
