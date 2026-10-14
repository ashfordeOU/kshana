# Terrain shadowing of the jammer in the jamming kind: pre-registration

Item CAP-06 (b). Written and committed **before** any of the code below exists and before any
run. The bars may be tightened after a run, never loosened. A miss is recorded in `RESULTS.md`
with its numbers, and its test asserts the recorded miss.

## The change (additive)

An optional `[terrain]` section in a `jamming` scenario that has a jammer:
- `dem_hgt`: an SRTM `.hgt` tile, as a path relative to the scenario file, read with the
  existing `altpnt::terrain::DemGrid::from_srtm_hgt` and sampled with its bilinear
  `elevation_at`;
- `samples_per_side`, `ll_lat_deg`, `ll_lon_deg`: the tile's size and its lower-left corner;
- `geoid_undulation_m` (m, default 0): the geoid height above the ellipsoid, `N`. A scenario
  height `h` (ellipsoidal) becomes a height on the DEM's datum as `h − N`;
- `k_factor` (default 4/3): the effective Earth-radius factor;
- `profile_step_m` (m, default 30): the spacing of the profile samples.

Without the section every output is byte-identical (bar B1).

### The profile

The receiver is at its geodetic position. The jammer's geodetic position comes from its ECEF
position. Both heights go to the DEM datum (`h − N`). The path is the great circle between the
two latitude-longitude points on a sphere of radius `R_e = 6 371 000 m`:
- its length `D` is the central angle (from the unit vectors' dot and cross products, as
  `atan2(|u_j × u_r|, u_j · u_r)`) times `R_e`;
- the profile points are at `d1 = i·profile_step_m` from the jammer, for `i = 1, 2, …` while
  `d1 < D`;
- each point's latitude and longitude are the spherical interpolation of the two unit vectors
  at the fraction `d1 / D`.

At each point, with `d2 = D − d1`:

```
terrain = DEM elevation (bilinear) at the point
bulge   = d1·d2 / (2·k·R_e)
ray     = h_j + (h_r − h_j)·d1/D            (h_j, h_r: jammer and receiver heights on the DEM datum)
h       = terrain + bulge − ray
ν       = h · sqrt(2·D / (λ·d1·d2))          λ = c / freq_hz
```

The dominant obstacle is the point of largest `ν` (the first such point on a tie). The jammer's
received power is lowered by the single knife-edge loss of Recommendation ITU-R P.526-15 §4.1:

```
J(ν) = 6.9 + 20·log10( sqrt((ν − 0.1)² + 1) + ν − 0.1 )   for ν > −0.78, else 0 dB
```

The jammer and the receiver are static, so the loss is one number per run. It lowers every
link's J/S by `J(ν)` before the existing anti-jam equation. A profile point on a DEM void, or
outside the tile, is an error, not a skipped point.

The result gains a `jammer_terrain` block, present only with the section:
- `nu_max` (1);
- `diffraction_loss_db` (dB);
- `obstacle_distance_m` (m, from the jammer);
- `obstacle_terrain_m` (m, on the DEM datum);
- `path_length_m` (m);
- `profile_points` (count).

Its units appear in the units table only with the section.

## The placements (fixed now)

The tile is the committed real SRTM tile `tests/fixtures/terrain/N36W117_sub6.hgt` (601 samples
per side, lower-left 36°N 117°W). The receiver is at Badwater Basin, 36.250°N 116.825°W. Each
antenna is **2 m above the DEM** at its point: its datum height is the bilinear DEM elevation
there plus 2 m. `N` is −31 m in every run. It is an input here, and its value is not assessed.
`k_factor` and `profile_step_m` are at their defaults. The frequency and the rest of the scenario
are those of `scenarios/jamming-demo.toml`.

| # | jammer latitude (°N) | jammer longitude (°W) |
|---|---|---|
| 1 | 36.450 | 116.870 |
| 2 | 36.220 | 116.727 |
| 3 | 36.170 | 116.990 |
| 4 | 36.100 | 116.800 |
| 5 | 36.300 | 116.900 |
| 6 | 36.200 | 116.550 |
| 7 | 36.400 | 116.400 |
| 8 | 36.050 | 116.500 |
| 9 | 36.600 | 116.600 |
| 10 | 36.300 | 116.300 |

The bars do not depend on which placements turn out to be obstructed. The results record that
for each placement.

## Bars

- **B1 (additivity).**
  - Every scenario under `scenarios/` gives a byte-identical `result.json` with this build as
    before it.
  - The `jammer_terrain` units appear only with the section.
  - The jamming tests, the registry golden and the cross-platform golden pass unchanged.
- **B2 (independent recomputation).** For every placement, a numpy script that shares no code
  with the engine computes the following from the `.hgt` bytes and the placement table alone:
  - it reads the tile itself and does its own bilinear interpolation;
  - it computes the geodetic-to-ECEF and ECEF-to-geodetic conversion (WGS 84) itself;
  - it does its own profile, bulge and `ν`, and its own `J(ν)`.

  Bar on every placement:
  - `profile_points` equal;
  - the dominant obstacle at the same profile index;
  - `nu_max` within **1e-9** (absolute);
  - `diffraction_loss_db` within **1e-9 dB**.
- **B3 (monotone in jammer height).** For each placement, raising the jammer from 2 m to 5000 m
  above the DEM in 100 m steps (2, 102, 202, … m) never increases `diffraction_loss_db`.
- **B4 (the loss reaches J/S, and nothing else).** For every placement, every link's `js_db` with
  the section equals the run without it minus `diffraction_loss_db`, within 1e-12 dB.
  `cn0_nominal_dbhz` is unchanged.
- **B5 (the reference function).** The engine's `J(ν)` at ν = −0.78, −0.5, 0, 1, 2.4 and 5 equals
  the P.526-15 expression evaluated by the oracle script, within 1e-12 dB. The value at −0.78
  is 0 by the threshold.

## Out of scope

The following are not modelled:
- multiple knife edges (Deygout, Bullington), ground reflection, clutter, foliage, and
  atmospheric ducting;
- terrain shadowing of the satellites (the skyline section covers that);
- moving jammers or receivers, and paths that leave the one tile.

The DEM's own error and the geoid value are not assessed. The single knife-edge loss is a
model; no measured propagation data is used.
