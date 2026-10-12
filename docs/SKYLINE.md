# Skyline masks and sky geometry

Until 0.36 every Earth visibility test in the engine was one elevation cut-off, `mask_deg`: a
satellite counted when it was at or above one number, whatever its direction. A street, a quay, a
fjord or a crane blocks part of the sky and leaves the rest open. A **skyline** is an elevation
cut that depends on azimuth; the **sky-geometry functions** turn a site, a time, constellations
and a skyline into the visible set, the dilution of precision (DOP), the geometry covariance, the
horizontal error ellipse, a Monte Carlo cloud and a skyplot. The design is
`docs/design/2026-10-12-geometry-and-skyline-design.md` (items 1 and 2).

Evidence: the masked visibility decision (geodetic look angles, the table mask, the visible set
and its DOP) is **VALIDATED** against Orekit 12.2 and gnss_lib_py 1.0.4 in a pre-registered
comparison, and so are the error ellipse and the per-system cofactor (numpy, pre-registered); the
canyon, sector and terrain reductions, the presets and the rest of the sky-geometry functions are
**MODELLED** ([Evidence](#evidence)). A skyline removes line-of-sight satellites and nothing
more. The presets are REPRESENTATIVE geometries, not surveys.

## The skyline

A skyline is the pointwise maximum of four descriptions. Azimuth is degrees clockwise from true
north in the site's local east-north-up frame; elevations are in `[0, 90)`.

| Description | TOML | What it is |
|---|---|---|
| Table | `table = [[az, el], ...]` | Elevations linearly interpolated in azimuth, wrapped at 360°. Azimuths strictly increasing in `[0, 360)`; at most 3600 rows. |
| Street canyon | `street_az_deg`, `width_m`, `height_left_m`, `height_right_m`, `antenna_m`, `length_m` | Two straight parallel walls (below). |
| Sectors | `sectors = [{ az_from, az_to, el_deg }]` | Sharp-edged intervals, clockwise from `az_from` (included) to `az_to` (excluded), which may wrap through north; at most 360. |
| Terrain | `terrain = [{ az, distance_m, height_m }]` | Points reduced to a table: elevation `atan((height_m − d²/(2 R_eff)) / d)`, with the curvature drop for `R_eff = 4/3 × 6371 km` (a chosen, stated constant). `height_m` is above the antenna. |

`preset = "<name>"` starts from a named geometry; the canyon fields then override the preset's
canyon field by field, and `table`, `sectors` and `terrain` add to it.

The receiver's `mask_deg` keeps its meaning: it is a flat skyline. The effective cut at azimuth
`az` is `max(mask_deg, skyline(az))`, and a satellite is visible when its elevation is **at or
above** it: the same `>=` the flat mask always used. A satellite above `mask_deg` but below the
skyline is **masked by the skyline**.

### The street canyon

A street runs along azimuth `s`, `w` metres between the walls, the antenna `a` metres up on the
centreline. Along azimuth `az`, with `θ = az − s`, the ray reaches a wall after
`d(az) = (w/2) / |sin θ|`, so a wall of height `h` cuts at

```text
cut(az) = atan( (h − a) / d(az) )          (the right wall for sin θ > 0, the side at s + 90°)
```

The open strip lies along the street. With `length_m = L` (the antenna at the middle) a ray
leaves through an open end, and the wall cuts nothing, when `d(az) · |cos θ| > L/2`. A wall no
taller than the antenna cuts nothing. `antenna_m` defaults to 1.5 m (a car roof or a hand-held
receiver, a stated choice); a new canyon needs `width_m`.

### Presets

Chosen and stated dimensions (the design note's), not surveys of any real place.
`kshana skyline --preset <name>` prints one with its provenance and its cut every degree.

| Preset | Geometry | Provenance |
|---|---|---|
| `city-street` | Canyon: street 0°, width 20 m, walls 30 m and 30 m, antenna 1.5 m. 70.7° across the street, open along it. | Height-to-width 1.5, inside the 0.5–2 band of street-canyon aspect ratios in Oke (1988), *Street design and urban canopy layer climate*, Energy and Buildings 11, 103–113. |
| `harbour-approach` | Sectors: open to seaward over 090–270 (180°); quay buildings 8° over 315–045 (90°); the breakwater and its light 3° over 045–090 and 270–315. | Stated choices (for example 40 m warehouses about 285 m off). |
| `fjord` | Terrain: walls 600 m above the antenna at 1500 m either side of a north-south channel, one point per degree (at `1500/|sin az|` m), curvature drop applied. 21.8° across, below 1° along the axis. | The order of the width and relief of the deep west-Norwegian fjords (Holtedahl (1967), *Notes on the formation of fjords and fjord-valleys*, Geografiska Annaler 49A, 193–203). |
| `container-terminal` | Sectors: container stacks 12° over the landward half 000–180; crane booms 35° over 245–255 and 25° over 285–295; open to the water elsewhere. | Five ISO 668 high-cube boxes (14.5 m) about 60 m off an antenna 2 m up; a boom about 50 m above the quay at 70 m and 100 m, the order of a post-Panamax crane. A crane sector is opaque. |

## In a scenario

An optional `[skyline]` section, over the kind's own cut-off:

| Kind | What the skyline changes | Per sample |
|---|---|---|
| `orbit` (with `user_site`) | The visibility timeline (GNSS availability) and the DOP summary. | — |
| `integrity` (with `user_site`) | The satellites RAIM and ARAIM (`araim_dual`) use. | `epochs[].masked_by_skyline` |
| `gnss-sim` | The satellites whose pseudoranges are simulated and used by RAIM. | `gnss_measurements[].masked_by_skyline` |
| `jamming` | The satellites the receiver can track, before the jammer. | `epochs[].masked_by_skyline` |
| `leo-pvt` | Every mode's in-view set over each system's own mask, the polar sweep included (the same skyline at every site). The Doppler-mode envelope and the designed single pass are bounds on what a receiver must handle and keep each system's mask. | `joint.epochs[].masked_by_skyline` |
| `leo-pass` | Which epochs count as above the mask, the time above it, the GNSS comparison's satellites. | `satellites[].pass.epochs_masked_by_skyline` |
| `nmea-scenario` (training NMEA) | The satellites in GSV and in the fix. Azimuths are true bearings fixed to the ground, not the vessel's heading. | — |

**The ground site of `orbit` and `integrity`.** Both kinds model an orbiting user with a
geocentric elevation and no Earth-fixed azimuth, so they take a skyline only with the design
note's ground-site mode: `user_site = { lat_deg, lon_deg, height_m }` in place of `user` (exactly
one of the two). Each sample is one absolute instant, `epoch + t`: every satellite is propagated
to it (an element set, broadcast ephemeris or SP3 file is advanced from its own epoch, a Walker
satellite counts `t` from `epoch`) and rotated to Earth-fixed at it, so the site sees one
consistent sky. `epoch` is the orbit scenario's own; without one (and always for `integrity`,
which has none) it is the newest epoch among the satellites that carry one, or J2000 for Walker
patterns only. Elevation and azimuth are geodetic (WGS-84). The
horizontal and vertical split of the integrity kind's ARAIM protection levels and Stanford
vertical error uses the same geodetic up (the WGS-84 ellipsoid normal, about 0.19° from the
geocentric radial at 45° latitude); snapshot RAIM already used it. A `user_site` without a
skyline is a plain ground user; the orbiting `user` path is unchanged.

```toml
kind = "integrity"
mask_deg = 5.0
# ...
[user_site]
lat_deg = 59.45
lon_deg = 24.75
height_m = 15.0

[skyline]
preset = "harbour-approach"
```

**Backward compatibility.** Without a `[skyline]` section a scenario is byte-identical to 0.35.0:
`tests/skyline_scenarios.rs` checks the JSON, chart and summary of every shipped scenario that
runs one of these kinds, and the NMEA text of every training scenario, against SHA-256 digests
computed by the 0.35.0 release commit. An empty `[skyline]` section cuts nothing; the result then
equals the run without it except for the added `skyline` block and the zero `masked_by_skyline`
counts.

**What is refused**, with the reason in the message: a skyline on an orbiting `user`; `user` and
`user_site` together; an unknown preset; a canyon without `width_m`; a table that is not strictly
increasing in `[0, 360)`; an elevation outside `[0, 90)`; an empty sector; a non-positive terrain
distance; input over the caps; any unknown key.

**The result** gains `skyline: { source, open_fraction, provenance }` when the section is present:
`source` is `preset:<name>`, `preset:<name>+overrides` or `custom`; `open_fraction` is the
fraction of the upper hemisphere's solid angle above `max(mask_deg, skyline)` (the mean of
`1 − sin(cut)` over azimuth: 1 for a zero mask, 0.5 for a flat 30° cut); `provenance` is the
preset's line or the scenario's own. Units and provenance classes are in the `units` block.

Bundled examples (`kshana example <name>`):

| Example | What it shows (remove the `[skyline]` section to compare) |
|---|---|
| `orbit-urban-canyon-skyline` | GPS + Galileo at the bottom of `city-street`: 17 of 289 samples keep a fix, median PDOP 70.5 (1.14 under open sky). |
| `integrity-harbour-approach` | Dual-constellation ARAIM entering a port: 70 satellite-epochs hidden, availability unchanged (145 of 145). |
| `gnss-sim-container-terminal-skyline` | Pseudoranges and RAIM on a quay: 44 satellite-epochs hidden; RAIM availability 0.59 (0.85 under open sky). |
| `jamming-harbour-approach-skyline` | A 2 W jammer in a harbour: 83 satellite-epochs hidden, tracking unchanged (the jammer had taken them). |
| `leo-pvt-fjord-skyline` | GPS + Galileo + a LEO layer in a fjord: median fused PDOP 1.14 (0.93 under open sky). |
| `leo-vertical-autonomous-vehicle-skyline` | The `leo-vertical-autonomous-vehicle` canyon as a flat 35° cut and as `city-street` turned along the car's heading: 8 against 4 to 5 GPS and Galileo satellites; fused mean error 2.1 m in both; the 1.5 m alarm at 51 % and 59 % of epochs. |

## Sky geometry

Five engine functions (`src/geometry.rs`), the same on every surface:

| Function | Input → output |
|---|---|
| `sky_geometry(request)` | per satellite `id`, `system`, `az_deg`, `el_deg`, `cut_deg`, `visible`, `masked`; `n_visible`, `n_masked`, `open_fraction`; `dop` (GDOP, PDOP, HDOP, VDOP, TDOP, `tdop_by_clock`); `states`, `cofactor_enu` (unit variance), `covariance_enu_m2`; `ellipse_1sigma` and `ellipse` at the requested confidence; `label`, `statement`, `advisory` |
| `sky_monte_carlo(request, seed, n)` | `n` (at most 5000, an input cap) least-squares errors under independent Gaussian range errors of `σ_UERE` from a ChaCha8 stream seeded by `seed`: `samples_enu_m`, the empirical covariance, horizontal and 3-D RMS beside `σ_UERE × HDOP` and `σ_UERE × PDOP`, the fraction inside the 95 % ellipse |
| `skyline_presets()` | the presets with label, description, provenance, the cut every degree and `open_fraction` |
| `skyline_profile(skyline)` | a skyline section reduced to the 360-entry table the engine uses, with `source`, `provenance`, `open_fraction` |
| `skyplot_svg(request)` | the skyplot as static SVG (no script, no external reference, every input string escaped) |

A request:

```json
{
  "site": {"lat_deg": 59.91, "lon_deg": 10.75, "height_m": 5},
  "time_s": 3600,
  "systems": ["gps-baseline", "galileo", "beidou-meo", "xona-pulsar"],
  "mask_deg": 5,
  "skyline": {"preset": "fjord"},
  "clock": "per-system",
  "sigma_uere_m": 1.5,
  "confidence": 0.95
}
```

`systems` are the engine's constellation presets (`constellation-design`'s `gps-baseline`,
`galileo`, `beidou-meo`, `glonass`, ...; the LEO presets `xona-pulsar`, `iridium-stl`, ...) or a
full `leo-pvt` `[[system]]` table, propagated to `time_s` (Keplerian with secular J2, the
`leo-pvt` joint-mode orbits). Their relative phases come from different reference epochs, so the
sky is **a representative geometry, not the sky of that date at that place**. Satellites may
instead (or as well) be given directly: `"satellites": [{"id": "G05", "system": "GPS",
"az_deg": 120, "el_deg": 35}, ...]`, or with `"ecef_m": [x, y, z]` and a `site` or
`user_ecef_m`. Defaults: each system's own mask (5° GNSS, 10° LEO; 5° for satellites given
directly), one receiver clock per system (`"common"` for one shared clock), `σ_UERE` 1 m (a
representative dual-frequency budget line), confidence 0.95. Input caps: at most 2000
satellites above the horizon (a system table asking for more is refused before it is built) and
16 receiver clocks.

**A dated sky from element sets.** `"tle"` takes two-line element set text (a name line before
each set is optional; at most 4 MiB, an input cap), propagated by the engine's SGP4 (WGS-72, the
propagator `orbit-real-tle` uses) to `"epoch"` plus `time_s`, rotated to Earth-fixed with UT1
taken as UTC and no polar motion, and seen from `site`. `"epoch"` is UTC ISO 8601
(`2026-06-07T12:00:00Z`) and dates only the element sets (the presets carry no date, so an
`epoch` without `tle` is refused); `"tle_system"` labels them for the per-system clock (default
`TLE`). Every result says what sky it is in `sky_source` and `sky_statement`:

| `sky_source` | The sky |
|---|---|
| `presets` | the engine's constellation presets: a representative geometry |
| `tle-at-epoch` | the element sets propagated to the stated epoch: the sky those element sets give at that epoch, not a measurement of it (their own accuracy is SGP4's and the sets' age) |
| `tle-at-element-epoch` | no `epoch`: the element sets propagated to the newest set's own epoch plus `time_s`, a representative sky |
| `satellites` | satellites given directly, as stated |

A mix joins them with `+`. `epoch_utc` is the instant the element sets were propagated to, and
`tle_skipped` names any set SGP4 refused there (decayed, or past its limits) with the reason.
The skyplot states the basis in its footer.

**One kernel.** The cofactor matrix is `orbit::cofactor_from_los`, the design-matrix assembly and
Gauss-Jordan inverse behind `orbit::dop`. `orbit::dop_cov` exposes the covariance and `orbit::dop`
is its reduction, so the VALIDATED scalars are unchanged and still pinned by
`tests/dop_reference.rs`. There is no second DOP implementation.

**The ellipse.** Semi-axes `k σ √λ` for the eigenvalues `λ` of the east-north block, with
`k = √(−2 ln(1 − p))` (`√5.991 = 2.448` at 95 %, 1 at 39.35 %), and the major axis's azimuth
`½ atan2(2 Q_EN, Q_NN − Q_EE)` in `[0, 180)` from north.

| Surface | Entry points |
|---|---|
| CLI | `kshana sky <request.json\|toml>` or `kshana sky --site <lat,lon[,h]> (--systems <a,b> \| --tle <file>) [--epoch] [--tle-system] [--time] [--mask] [--skyline-preset] [--uere] [--clock]`, with `--monte-carlo <n> --seed <s>` or `--svg`; `kshana skyline --preset <name> \| --presets \| --profile <file>` |
| Rust | `kshana::geometry::{sky_geometry, sky_monte_carlo, skyline_presets, skyline_profile, skyplot_svg}`, `kshana::surface::*` of the same names |
| Python | `kshana.sky_geometry`, `sky_monte_carlo`, `skyline_presets`, `skyline_profile`, `skyplot_svg` |
| WASM | `sky_geometry(request_json)`, `sky_monte_carlo(request_json, seed, n)`, `skyline_presets()`, `skyline_profile(skyline_json)`, `skyplot_svg(request_json)` |
| MCP | `sky_geometry` (`request`, or `skyline_preset`); no Monte Carlo over MCP (bulk samples an agent should summarise, not carry) |

Every result carries `label` (MODELLED), the `statement` (geometry under a stated error model:
independent, equal, zero-mean Gaussian range errors; not a prediction of a receiver's real error,
which also has biases, multipath and non-line-of-sight errors; not an integrity bound) and the
advisory: *Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the
operator remains responsible for the navigation of the vessel.*

## Evidence

Five ledger rows (`docs/VERIFICATION-MATRIX.md`), as the design note scopes them:

| Row | Status | Oracle |
|---|---|---|
| Azimuth-dependent skyline mask: visible set, azimuth and elevation, and DOP under the mask | **VALIDATED** | Orekit 12.2 (`TopocentricFrame` look angles, `ElevationMask`) with gnss_lib_py 1.0.4 (`get_dop` and the DOP matrix), pre-registered in `xval/orekit-skyline/PREREGISTRATION.md` (commit e4b9d912) before either was run: 1173 look angles at six sites and four epochs, six tables, 142 visible sets; worst elevation 1.3e-13°, azimuth 2.3e-13°, mask 1.1e-12° against 1e-9°; identical visible sets, none in the boundary band; DOP 3.3e-13 relative and cofactor 6.6e-13 of the matrix scale against 1e-9. Scope: table masks, geodetic look angles, the masked set and its common-clock DOP and cofactor. |
| Street-canyon, sector and terrain reductions to a table | MODELLED | hand-computed values; the comparison above reads their tables as inputs and does not check them |
| Skyline presets | MODELLED | none: chosen, stated dimensions (checked only against themselves) |
| Horizontal error ellipse and per-system cofactor from the geometry covariance | **VALIDATED** | numpy 2.5.4 `linalg.inv` and `linalg.eigh` (standard P2) on the 142 committed visible sets, common clock and one clock per system, pre-registered in `xval/numpy-ellipse/PREREGISTRATION.md` (commit 0bbeeaee): 270 cases, axes 5.1e-13 relative, orientation 5.3e-12°, cofactor 1.0e-12 of the matrix scale, against 1e-9 and 1e-6° |
| Sky geometry functions | MODELLED | the composition: preset propagation to a representative sky, the Monte Carlo cloud (checked against the geometry it samples), the surfaces |

The absence of a `[skyline]` section is checked byte for byte against the 0.35.0 outputs, which
shows backward compatibility and validates nothing. gnss_lib_py applies a single elevation mask
only, so it is the DOP oracle here, not the mask oracle.

What a skyline does not model: diffraction over a wall edge, reflections and non-line-of-sight
signals a real receiver may still track (they are dropped, not degraded), partial transparency (a
lattice crane is opaque across its sector), terrain beyond the points given, and Earth curvature
inside the canyon and sector forms.
