<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# GEO and IGSO slots in `gnss-sim`

`gnss-sim` sees a Walker shell (`[constellation]`) and, beside it, geostationary (GEO) and inclined
geosynchronous (IGSO, QZO, QGEO) slots, so that regional and mixed systems can be expressed: NavIC
(3 GEO and 4 IGSO), the BeiDou GEO, QZSS (GEO, QGEO and QZO).

```toml
kind = "gnss-sim"
slot_sets = ["navic"]          # compiled-in sets, by name
# [[slots]]                    # and/or the scenario's own slots, after them
# id = "my IGSO"
# kind = "igso"
# inclination_deg = 29.0
# crossing_lon_deg = 55.0      # or center_lon_deg = ...
# phase_deg = 0.0
# source = "where the values come from"
[constellation]                # the Walker shell; planes = 0 leaves only the slots
altitude_km = 20200.0
inclination_deg = 55.0
planes = 0
sats_per_plane = 0
```

The slots take the PRNs after the shell's, and the report lists them (`slots`: PRN, set, id). The bundled
`scenarios/navic-regional.toml` is NavIC alone over India (Bengaluru, a day at 10-minute steps). The
interop scene exports carry the slots as satellites `S01`, `S02`, ... with their source and phase labels, and
the test-bench export lists them in the motion metadata (`space_segment`) ([Interop](INTEROP.md)).

## The orbit of a slot

Every slot is a geosynchronous two-body orbit: its semi-major axis is the geosynchronous radius for the
sidereal rate of the frame the simulation turns to the Earth with (about 42,164 km), so a ground track
does not drift. A slot is placed on the Earth by a longitude:

| field | meaning |
|---|---|
| `kind = "geo"`, `lon_deg` | the sub-satellite longitude, degrees east |
| `kind = "igso"`, `inclination_deg`, `crossing_lon_deg` | the longitude of the northward equator crossing |
| `kind = "igso"`, `inclination_deg`, `center_lon_deg` | the centre of the ground track: its mean longitude over one revolution, as the QZSS performance standard states it |
| `eccentricity`, `argp_deg` | for an eccentric slot (a QZO: e 0.075, argument of perigee 270°, the apogee over the north) |
| `phase_deg` | the mean anomaly (the argument of latitude for a circular slot) at the simulation epoch |
| `source`, `phase_source` | where the values come from; a value no source states says it is an assumption |

Perturbations (J2, luni-solar, solar pressure) and station keeping are not modelled: these are nominal
slots, not broadcast orbits. MODELLED.

## The compiled-in sets (`data/gnss-slots/`)

| set | slots | sources |
|---|---|---|
| `navic` | GEO 32.5°E, 83°E, 129.5°E; IGSO crossing 55°E and 111.75°E, inclination 29°, two per track | ISRO, Satellite Navigation Services page (read 2026-11-21); the SPS ICDs (v1.1, 2017; L1, 2023) state no slots |
| `beidou-geo` | BDS-3 GEO 80°E, 110.5°E, 140°E | BDS-SIS-ICD-B1I-3.0 (2019), section 3.1 |
| `beidou-2-geo` | BDS-2 GEO 58.75°E, 80°E, 110.5°E, 140°E, 160°E | BDS-SIS-ICD-B1I-3.0, section 3.1 |
| `qzss-ps-005` | QZS3 GEO 127°E, QZS6 GEO 90.5°E, QZS7 QGEO, QZO QZS2, QZS4, QZS1R, QZS5 | PS-QZSS-005 (August 2025), section 3.2.3, Tables 3.2-2 to 3.2-4 |
| `qzss-six-satellite` | as `qzss-ps-005` without QZS5 (lost), with QZS2 at 147°E and QZS1R at 127°E | PS-QZSS-005 and QSS-CUS-101439 (July 2026), p. 3 |

Left out, and why (each file lists its own omissions):

- **BeiDou IGSO:** the ICD gives the altitude and the 55° inclination but no equatorial crossing longitude
  or position along the track, so no slot can be placed from it.
- **The position of a satellite along its ground track** (NavIC IGSO, QZSS QZO and QGEO): no source
  states it. The NavIC pairs are placed half a revolution apart and the QZO evenly in mean anomaly; each
  such slot says `phase_source = "assumption (to confirm) ..."`.
- **NavIC eccentricity:** not stated; the NavIC slots are circular.
- The QZSS semi-major axis (42,165 km in the source) is replaced by the geosynchronous radius above, and
  its right ascensions (given at different epochs) by the centre longitudes.

## A published figure, compared

The QZSS operator's overview (qzss.go.jp, Technology, Orbit, read 2026-11-21) states that one QZO satellite
seen from the area near Tokyo stays about 8 h a day at 70° elevation or more, 12 h at 50° or more and 16 h at
20° or more. The nominal slots give, from Tokyo (35.68°N, 139.69°E):

| QZS2 | ≥ 70° | ≥ 50° | ≥ 20° |
|---|---|---|---|
| published (one QZO, near Tokyo) | about 8 h | about 12 h | about 16 h |
| `qzss-ps-005` (centre 140°E) | 9.13 h | 12.70 h | 17.99 h |
| `qzss-six-satellite` (centre 147°E) | 8.85 h | 12.59 h | 17.90 h |

The model is longer at every threshold, by 0.6 to 2.0 h. The gap is reported, not tuned: the published
figures are rounded, the place and the satellite are not stated exactly, and the slots are two-body nominal
orbits without perturbations. `tests/gnss_slots.rs` pins the computed hours and records the published ones.

## Tests

`tests/gnss_slots.rs`: an IGSO track is a figure eight whose latitude extent is the inclination, whose
equator crossings are at the slot's longitude and whose east-west half-width matches the closed form; a
QZO is centred on its longitude and spends the share of the day north of the equator that Kepler's
equation gives; a GEO stays within 0.001° of its longitude for two days; and the satellites `gnss-sim`
counts from New Delhi, Bengaluru, London, Tokyo, Beijing and Sydney, with their elevations, equal a
closed-form computation in the test (its own WGS 84 station, geosynchronous tracks in closed form) at
every hour of a day. The unit tests in `src/gnss_slots.rs` check that every set parses, cites its
sources and builds, and that a slot without its longitude is refused.
