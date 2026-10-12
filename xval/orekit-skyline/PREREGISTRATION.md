# Pre-registration: azimuth-dependent skyline masks against Orekit 12.2 and gnss_lib_py 1.0.4

Committed before either oracle is run on the comparison inputs. The design note
(`docs/design/2026-10-12-geometry-and-skyline-design.md`, item 1, section 2.5) names the oracle;
this file fixes the inputs, the quantities, the tolerances and the decision rule.

## Convention check (done before this file, on a synthetic probe, not on the comparison data)

Orekit 12.2 `org.orekit.utils.ElevationMask.getElevation(azimuth)` interpolates linearly in
azimuth between the sorted mask points and wraps through north (probe: points (10°, 20°) and
(350°, 40°) give 30° at 0°, 25° at 5°, 25.294117647059° at 100°). This is the convention of
`kshana::skyline` tables, so the comparison uses arbitrary tables (no bin alignment needed).

## Inputs (committed under `tests/fixtures/skyline_orekit_oracle/inputs/`)

- `sites.csv`: six geodetic sites on the WGS-84 ellipsoid (equator, mid-latitude, two Nordic
  coastal sites, the high Arctic, the southern hemisphere), with heights.
- `sats.csv`: Earth-fixed satellite positions (m, written to the millimetre) at four epochs
  (0, 3600, 7200 and 21600 s), from the engine's `gps-baseline`, `galileo`, `beidou-meo` and
  `xona-pulsar` presets. Both sides read these states: the propagation is not compared.
- `masks.csv`: six azimuth/elevation tables, azimuths strictly increasing in [0, 360): the
  360-point profiles of the four presets and two irregular tables with non-integer azimuths and
  a segment across north. The preset profiles are the engine's own reductions of its canyon,
  sector and terrain descriptions; they enter as inputs, so those reductions are NOT what this
  comparison validates.
- The receiver mask is 5° for every satellite; the effective cut is `max(5°, mask(az))`.

## Oracles

- **Orekit 12.2** (Apache-2.0): a `TopocentricFrame` on a `OneAxisEllipsoid` with the WGS-84
  constants (`Constants.WGS84_EARTH_EQUATORIAL_RADIUS`, `Constants.WGS84_EARTH_FLATTENING`) gives
  each satellite's azimuth and elevation at each site; an `ElevationMask` per table gives the
  mask at that azimuth. Driver: `xval/orekit-skyline/OrekitSkyline.java`. The body frame is the
  root frame and the positions are given in it, so no Earth-orientation data is involved.
- **gnss_lib_py 1.0.4** (wheel metadata: MIT): `gnss_lib_py.utils.dop.get_dop` gives GDOP, PDOP,
  HDOP, VDOP, TDOP and the ENU-and-clock DOP matrix (one common clock) for the set of satellites
  Orekit finds visible, from Orekit's azimuth and elevation. Driver: `xval/orekit-skyline/gnss_lib_py_dop.py`.

## Quantities and tolerances (fixed now)

| # | Quantity | Kshana | Oracle | Tolerance |
|---|---|---|---|---|
| a | elevation of every satellite above the horizon at every site and epoch | `frames::look_angles` | Orekit `TopocentricFrame.getElevation` | 1e-9 deg |
| b | azimuth of the same, where the elevation is below 89.9° (the azimuth of a point near the zenith is ill-conditioned) | `frames::look_angles` | Orekit `TopocentricFrame.getAzimuth` | 1e-9 deg (wrap-aware) |
| c | the mask at the satellite's azimuth, for every table | `skyline::Skyline::cut_deg` of the table | Orekit `ElevationMask.getElevation` | 1e-9 deg |
| d | the visible set (`el >= max(5°, mask)`) of every (site, epoch, table) | Kshana's own az, el and mask | Orekit's | identical, excluding satellites within 1e-6 deg of the cut (counted and reported; expected none) |
| e | GDOP, PDOP, HDOP, VDOP, TDOP of every visible set of at least four satellites | `geometry::sky_geometry` (common clock) on Kshana's own az and el | gnss_lib_py `get_dop` on Orekit's | relative 1e-9 where PDOP < 20; 1e-6 where PDOP >= 20 (the existing `tests/dop_reference.rs` bar for ill-conditioned geometry) |
| f | the ten distinct entries of the 4 × 4 ENU-and-clock cofactor matrix of the same sets | `geometry::sky_geometry` `cofactor_enu` (common clock) | gnss_lib_py `get_dop(..., dop_matrix=True)` | absolute, scaled by the matrix: `|Δq| <= tol · max|q|`, with tol 1e-9 where PDOP < 20 and 1e-6 where PDOP >= 20 |

Convention for (f): Kshana's design-matrix rows are `[-e, 1]` (line of sight from the user,
negated, and the clock) and gnss_lib_py's are `[e, 1]`, which leaves the position block and the
clock variance unchanged and flips the sign of the three position-clock covariances; those three
are compared after negating gnss_lib_py's. This is fixed here, before the run.

## Decision rule

All of (a) to (f) pass: the ledger row "Azimuth-dependent skyline mask: visible set, azimuth and
elevation, and DOP under the mask" becomes VALIDATED (ExternalDataset, basis Library, Orekit
12.2 with gnss_lib_py 1.0.4), scoped to table masks, geodetic look angles, the masked visible set
and its common-clock DOP and cofactor. Any one
fails: the row stays MODELLED and the finding (which quantity, by how much, on which inputs) is
written into it. The canyon, sector and terrain reductions and the presets stay MODELLED either
way (rows "Street-canyon, sector and terrain reductions to a table" and "Skyline presets"). The
tolerances are not changed after the oracles have been run.

## How to run

```sh
CP=$(ls /path/to/orekit-12.2-and-hipparchus-3.1/*.jar | tr '\n' ':')
javac -cp "$CP" xval/orekit-skyline/OrekitSkyline.java -d /tmp/orekit-skyline
java -cp "$CP:/tmp/orekit-skyline" OrekitSkyline tests/fixtures/skyline_orekit_oracle
python -I xval/orekit-skyline/gnss_lib_py_dop.py tests/fixtures/skyline_orekit_oracle   # gnss_lib_py==1.0.4
cargo test --test skyline_orekit_oracle
```

The inputs are regenerated (only if the engine's presets change) with
`KSHANA_WRITE_SKYLINE_ORACLE_INPUTS=1 cargo test --test skyline_orekit_oracle -- --ignored`.

## Reproducibility notes (added after the run at review; the protocol above is unchanged)

- The convention probe is `xval/orekit-skyline/ElevationMaskProbe.java`, committed after the
  fact as it was run. Re-run against Orekit 12.2 and Hipparchus 3.1 it prints 30° at 0°, 25° at
  5° and 25.294117647059° at 100°, as stated above.
- gnss_lib_py 1.0.4 requires Python below 3.13; the DOP driver was run with Python 3.12.3 in a
  virtual environment holding `gnss_lib_py==1.0.4` (`python -I xval/orekit-skyline/gnss_lib_py_dop.py ...`).
