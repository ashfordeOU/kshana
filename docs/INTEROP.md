# Interoperability exports and imports

A run writes a result document, a chart and a report. `--export` also writes the
scenario's geometry, or its synthesised signal, in the formats other tools already read:
a globe viewer, a desktop map, a geographic information system (GIS), a mission-analysis
package or a software-defined-radio (SDR) tool. Nothing here reads a clock or the
network, and no export carries a generation timestamp, so the same scenario gives
byte-identical files on every run.

```bash
kshana scenarios/jamming-demo.toml --export czml            # one format
kshana scenarios/jamming-demo.toml --export kml --export geojson
kshana scenarios/jamming-demo.toml --export all             # every format that applies
kshana scenarios/jamming-demo.toml --export list            # which apply, and why not, without running
kshana scenarios/terrain-nav.toml --import-route route.geojson --export geojson
```

Files are written next to the scenario, named like the result document:
`jamming-demo.czml`, `jamming-demo.kml`, `jamming-demo.geojson`, one
`jamming-demo.<object>.e` per moving object (or `jamming-demo.e` when there is one), and
the pair `l-band-waterfall-jamming.sigmf-meta` / `.sigmf-data`. With `--study-name` they
take the study's name instead, as the other outputs do.

A format named explicitly that does not apply to the scenario is an error that prints the
reason; under `all` the reason is printed and the format skipped. The library entry
points are `kshana::interop::export(src, format)`, `kshana::interop::plan(src)` and
`kshana::interop::geojson::apply_route(src, geojson)`; they take the scenario text and
return bytes, touching no file, so they run in the WebAssembly build too.

Code: `src/interop/` (`scene.rs` builds one geometric description of the scenario,
`czml.rs`, `kml.rs`, `geojson.rs` and `stk.rs` write it), `src/sigmf.rs` and
`src/spectrum.rs` for the signal. Tests: `tests/interop_formats.rs`.

## Formats

| Format | What it is | Specification followed |
|---|---|---|
| CZML | Cesium Language: a JSON (JavaScript Object Notation) array of time-tagged packets, read by CesiumJS | <https://github.com/AnalyticalGraphicsInc/czml-writer/wiki/CZML-Structure> |
| KML | Keyhole Markup Language 2.2, an Open Geospatial Consortium (OGC) standard, read by Google Earth and most GIS tools; time-tagged tracks use the Google extension `gx:Track` | <https://www.ogc.org/standard/kml/> (schema namespace `http://www.opengis.net/kml/2.2`; extension namespace `http://www.google.com/kml/ext/2.2`) |
| GeoJSON | geographic JSON, Internet Engineering Task Force (IETF) Request for Comments (RFC) 7946 | <https://www.rfc-editor.org/rfc/rfc7946> |
| STK `.e` | the ephemeris file of Ansys Systems Tool Kit (STK), time-position-velocity form `EphemerisTimePosVel` | <https://help.agi.com/stk/#stk/importfiles-02.htm> |
| SigMF | Signal Metadata Format: a JSON metadata file and a raw file of complex in-phase and quadrature (IQ) samples | <https://github.com/sigmf/SigMF/blob/main/sigmf-spec.md> |

## What each file holds

Every geospatial format is written from the same scene, so they cannot disagree about
where anything is. A scene has up to four kinds of object:

- **Moving objects** — satellites, and a user platform when it moves — sampled on the
  scenario's own time grid with the propagators the kind's run uses.
- **Fixed sites** — a receiver, a ground station, a jammer, or the origin of a local
  navigation frame.
- **Untimed tracks** — the waypoints a terrain, gravity or combined alternative
  positioning, navigation and timing (PNT) kind flies. These kinds have no time axis, so
  the tracks carry none.
- **Jammer footprints** — for the `jamming` kind, two circles about the jammer: the
  ground range inside which a satellite at the zenith (the strongest) falls below the
  tracking threshold, so every satellite is lost, and the range inside which a satellite
  at the elevation mask (the weakest) does, so tracking starts to fail. Both come from
  the kind's own link equations (Kaplan and Hegarty, *Understanding GPS/GNSS*, 3rd ed.,
  §9.4) with the jammer at the receiver's horizon and free-space loss, and the test
  suite checks that the effective carrier-to-noise density ratio at each radius equals
  the threshold to 1e-6 dB. The circle is drawn on a sphere of the Earth's mean radius.

### CZML

The first packet is the document packet (`"id": "document"`, `"version": "1.0"`) with a
clock spanning the time grid. Each moving object is a packet whose `position` has an
ISO 8601 (International Organization for Standardization date and time format) UTC
(Coordinated Universal Time) `epoch`, `referenceFrame` `"INERTIAL"`, and `cartesian`
samples `[t, x, y, z, ...]`: seconds after the epoch, metres in the Geocentric Celestial
Reference System (GCRS). CesiumJS takes `INERTIAL` as the International Celestial
Reference Frame (ICRF), whose axes the GCRS shares. Fixed sites and footprint centres are
constant Earth-fixed `cartesian` positions with `referenceFrame` `"FIXED"`. A footprint is
an `ellipse` with both semi-axes equal to its radius; an untimed track a ground-clamped
`polyline`. Each packet's `description` states the frame again in words.

### KML

One `<Document>` with a `<Folder>` per object class. A moving object is a `<Placemark>`
holding a `<gx:Track>`: one `<when>` per sample (ISO 8601 UTC), then one `<gx:coord>` per
sample (longitude, latitude, height). Sites are `<Point>`s, footprints `<Polygon>`s whose
ring is closed and counter-clockwise, untimed tracks `<LineString>`s. Coordinates are
World Geodetic System 1984 (WGS 84) longitude and latitude in decimal degrees and height
in metres above the WGS 84 ellipsoid, written with `altitudeMode` `absolute`. KML reads
`absolute` as height above mean sea level; the difference, the geoid undulation, is
within about ±110 m and is not applied. The document's description says so.

### GeoJSON

One `FeatureCollection`. Positions are `[longitude, latitude]` or
`[longitude, latitude, height]` — longitude first, as RFC 7946 requires — in WGS 84
degrees, with height in metres above the ellipsoid. A moving object is a `LineString`
with a `times_utc` property holding one ISO 8601 time per position; a track that crosses
the 180° meridian is written as a `MultiLineString` cut there, as RFC 7946 §3.1.9 asks
(the crossing point is interpolated, and `times_utc` then lists the original samples
only). Sites are `Point`s, footprints `Polygon`s with a closed counter-clockwise
exterior ring (§3.1.6), untimed tracks `LineString`s. Every feature has a `units`
property naming the unit of each numeric member.

### STK `.e`

One file per moving object, since an STK ephemeris describes one vehicle. The header
gives `NumberOfEphemerisPoints` (equal to the number of data rows), `ScenarioEpoch` (UTC,
`d Mon yyyy hh:mm:ss.ssssss`), `InterpolationMethod Lagrange` with
`InterpolationSamplesM1 5`, `CentralBody Earth`, `CoordinateSystem ICRF` and
`DistanceUnit Meters`; the rows under `EphemerisTimePosVel` are seconds after the epoch,
position in metres and velocity in metres per second, in the GCRS. A scene with only fixed
sites or untimed tracks writes no `.e` file: a fixed point is an STK Facility, not an
ephemeris.

### SigMF

The `spectrum` kind's `[iq]` snapshot — the modelled L band drawn as complex samples at
one instant — as a `.sigmf-meta` / `.sigmf-data` pair, in the data type `[iq]` names
(`cf32_le` or `ci16_le`). It is the same recording the run writes and reads back for its
own consistency check: the exported metadata equals the `iq.sigmf.meta` block of the
result document, and the data file has the `iq.sigmf.data_bytes` length. The writer is
`src/sigmf.rs`, the module the `spectrum` kind already used; nothing is duplicated.

## Frames and time

- The engine propagates in TEME (true equator, mean equinox of date), its native frame.
  Moving objects are rotated to the GCRS by the `nutation::teme_to_gcrs` reduction
  (IAU 2006 precession and IAU 2000B nutation, where IAU is the International
  Astronomical Union), which reproduces Vallado's published TEME-to-GCRF example to
  0.11 m, for CZML and STK, and to the Earth-fixed
  frame by `frames::teme_to_ecef` for KML and GeoJSON. The Earth-fixed rotation is the
  Greenwich mean sidereal angle with UT1 (Universal Time, Earth-rotation angle) taken
  equal to UTC and polar motion not applied — the same reduction the SP3 (Standard
  Product 3) export uses. At a GPS (Global Positioning System) orbit radius the neglected
  UT1−UTC of up to 0.9 s moves a satellite's longitude by up to about 1.7 km; ground
  sites are unaffected, since they are given in latitude and longitude.
- The `ephemeris` kind is the exception: its engine output already carries GCRS and
  Earth-fixed positions (with the scenario's UT1−UTC and polar motion, or a real
  International Earth Rotation and Reference Systems Service (IERS) series), and those
  are written unchanged.
- Every time is UTC. Leap seconds are not modelled: an offset across a leap second is
  counted as if every day had 86 400 s, as the engine's time grids count.
- The epoch of `t = 0` is the one the kind's run uses, and each file names it:
  the `orbit` kind's `epoch`; when it is absent, the earliest epoch the satellites' own
  data carry (a TLE epoch, a broadcast ephemeris's reference time, an SP3 file's start),
  and 2000-01-01T00:00:00Z only when no satellite carries one (Keplerian elements). The
  SP3 and OEM (Orbit Ephemeris Message) exports keep 2000-01-01T00:00:00Z for a scenario
  without an `epoch`, so for such a scenario their dates differ from these files'. With
  no scenario `epoch`, each satellite that carries its own epoch is rotated into the GCRS
  and Earth-fixed frames at its own instant (its epoch plus `t`), since that is the date
  its TEME position belongs to; where the satellites' epochs differ, the shared time tags
  follow the engine's premise that every satellite starts at `t = 0`, and the file says
  by how many hours they differ. The SGP4 (Simplified General Perturbations 4)
  element epoch of the `jamming` and `gnss-sim` kinds' Walker constellations
  (2018-06-12T00:00:00Z), which their runs also use for the Earth rotation; the
  `passes` kind's `epoch`; the `ephemeris` kind's `epoch` or two-line element (TLE)
  epoch. The `integrity` kind has no calendar epoch; its export dates `t = 0` as for an
  orbit scenario without one.
- Satellites keep the positional identifiers `G01`, `G02`, ... the SP3 and OEM exports
  give them, because the propagators do not carry the TLE name lines.

## Imports

- **GeoJSON route.** `--import-route <file>` (library: `interop::geojson::apply_route`)
  reads the first `LineString` of a GeoJSON document — a bare geometry, a `Feature`, or a
  `FeatureCollection` — and writes it into the track inputs of `terrain-nav`,
  `terrain-slam`, `gravity-map` and `combined-altpnt` (`start_lat_deg`, `start_lon_deg`,
  `step_lat_deg`, `step_lon_deg`, `waypoints`) before the run. Those kinds fly
  `start + i·step`, so a route is accepted when it is exactly that: its two ends (the
  scenario's `waypoints` count is kept), or three or more positions evenly spaced on a
  straight line in latitude and longitude, to within 1e-7 degree (about 1 cm). Any other
  route is refused and the error names the position furthest off the line. A route for a
  kind with no trajectory input is refused with that reason. Longitude and latitude are
  range-checked, which catches a latitude-first file.
- **SigMF recording.** The `spectrum` kind's `[recording]` block reads a `.sigmf-meta` /
  `.sigmf-data` pair through `src/sigmf.rs` and plots its Welch estimate beside the model
  (see [SPECTRUM.md](SPECTRUM.md)). Reading files is a native-build feature; the
  WebAssembly build takes the bytes through `kshana::sigmf::read`.

## How the exports are checked

`tests/interop_formats.rs` parses every export with a validator written from the
format's specification, not with the writer's own code:

- CZML: a JSON array whose first packet is the document packet with a `version`; unique
  packet identifiers; every position states `referenceFrame` `FIXED` or `INERTIAL`;
  sampled positions are `[t, x, y, z, ...]` with an ISO 8601 epoch and increasing times.
- KML: a well-formed XML (Extensible Markup Language) document in the OGC KML 2.2
  namespace with one root feature; the schema's element order inside a Placemark; at most
  one geometry per Placemark; closed linear rings of four or more positions;
  `lon,lat[,alt]` tuples in range; valid `altitudeMode` values; `styleUrl`s that resolve;
  a `gx:Track` with as many `<when>` as `<gx:coord>`, and the extension namespace declared.
- GeoJSON: longitude first and in range, latitude in range, two or three numbers per
  position, line strings of two or more positions, closed counter-clockwise exterior
  rings, no segment across the 180° meridian, no `crs` member, a `units` property on
  every feature.
- STK: the `stk.v.` version line, a `BEGIN Ephemeris` / `END Ephemeris` block with the
  required keywords, `DistanceUnit Meters`, `NumberOfEphemerisPoints` equal to the number
  of data rows, seven numbers per row, increasing times.
- SigMF: `core:datatype` and `core:version` in `global`, `captures` and `annotations`
  arrays, `core:sample_start` on every capture, and a data file of whole samples.

Beyond structure, a satellite exported to CZML and to STK is compared with the engine's
own state after the same frame reduction, and agrees to 1 mm in position (the files carry
0.1 mm): against the `ephemeris` kind's own GCRS output, and against an independent
TEME-to-GCRS propagation of the `orbit-sgp4-gps` constellation, each satellite dated by
its own TLE epoch read from the scenario text. Two checks go outside the engine: the first
`orbit-sgp4-gps` satellite's CZML positions agree to 0.1 m (measured 2.3 cm) with the same
TLE propagated by the `sgp4` Python package and reduced to the GCRS by ERFA (Essential
Routines for Fundamental Astronomy, the open implementation of the IAU's SOFA library),
and the `orbit-rinex` satellites' Earth-fixed positions equal the broadcast-ephemeris
positions of the Global Positioning System interface specification to 1 mm. The `jamming` export's
Earth-fixed positions are compared with the positions the jamming run scores, to 5 mm.
The GeoJSON route round-trips through a track scenario, the SigMF pair reads back to the
same bytes, and every export is byte-deterministic.

These are checks against the published specifications and against the engine itself.
The files have not been loaded into CesiumJS, Google Earth, Ansys STK or an SDR tool as
part of the test suite, so acceptance by a particular version of those tools is not
tested here.

## Limitations

- Only the kinds in the table below export geometry. Kinds whose geometry is centred on
  the Moon, Mars or another body are not exported: CZML, KML and GeoJSON describe
  positions about the Earth, and this release writes STK files with `CentralBody Earth`
  only, although the STK format itself allows other central bodies.
- `constellation-design`, `earth-gnss-lunar` and `oem-interop` have Earth-referenced
  geometry that this release does not export; the table gives the reason for each.
- The `gnss-ins` kind flies its trajectory in a flat local tangent plane, so only the
  plane's origin is exported, not the trajectory.
- Earth-fixed satellite positions neglect UT1−UTC and polar motion (see Frames and time);
  KML heights are ellipsoidal, not above mean sea level.
- Footprints assume free-space propagation, a jammer at the receiver's horizon and a
  spherical Earth for the circle.

## Every bundled scenario

What `kshana <scenario> --export <format>` does for each file in `scenarios/` (the suite
manifest is not a scenario and is left out). "yes" means the format is written and
passes its validator; otherwise the number points to the reason. Generated by
`cargo run --bin gen_validation_artifacts`; `tests/interop_formats.rs` fails when it is
stale.

<!-- interop-table:start -->
| Scenario | Kind | CZML | KML | GeoJSON | STK `.e` | SigMF |
|---|---|---|---|---|---|---|
| `aperture-duty-cycle.toml` | `aperture-duty-cycle` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `araim-gps-galileo.toml` | `integrity` | yes | yes | yes | yes | no [2] |
| `araim-reference-check.toml` | `araim-reference-check` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `attitude-budget.toml` | `attitude-budget` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `automotive-urban-canyon.toml` | `gnss-ins` | yes | yes | yes | no [3] | no [2] |
| `campaign-jam-spoof-holdover-integrity.toml` | `campaign` | no [4] | no [4] | no [4] | no [4] | no [2] |
| `campaign-monte-carlo-clock-holdover.toml` | `campaign` | no [4] | no [4] | no [4] | no [4] | no [2] |
| `campaign-shared-jammer-sea-road.toml` | `campaign` | no [4] | no [4] | no [4] | no [4] | no [2] |
| `campaign-spectrum-holdover-integrity.toml` | `campaign` | no [4] | no [4] | no [4] | no [4] | no [2] |
| `campaign-sweep-jammer-power.toml` | `campaign` | no [4] | no [4] | no [4] | no [4] | no [2] |
| `celeste-iod-classical-pilot-signals.toml` | `leo-signal` | no [5] | no [5] | no [5] | no [5] | no [2] |
| `celeste-iod-end-to-end.toml` | `leo-pnt-chain` | yes | yes | yes | yes | no [2] |
| `celeste-iod-fused-pvt.toml` | `leo-pvt` | no [6] | no [6] | no [6] | no [6] | no [2] |
| `cislunar-arc-recovery.toml` | `cislunar-arc-recovery` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `cislunar-observability.toml` | `cislunar-observability` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `clock-ensemble.toml` | `clock` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `clock-holdover-labsr.toml` | `clock` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `clock-holdover.toml` | `clock` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `combined-altpnt.toml` | `combined-altpnt` | yes | yes | yes | no [3] | no [2] |
| `conflict-resilience.toml` | `conflict-resilience` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `constellation-multi-gnss-coverage.toml` | `constellation-design` | no [8] | no [8] | no [8] | no [8] | no [2] |
| `earth-gnss-lunar.toml` | `earth-gnss-lunar` | no [9] | no [9] | no [9] | no [9] | no [2] |
| `eo-coverage.toml` | `eo-coverage` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `ephemeris.toml` | `ephemeris` | yes | yes | yes | yes | no [2] |
| `europa-surface-pnt.toml` | `body-pnt` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `fusion-pnt.toml` | `fusion` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `gnss-ins.toml` | `gnss-ins` | yes | yes | yes | no [3] | no [2] |
| `gnss-sim-raim.toml` | `gnss-sim` | yes | yes | yes | yes | no [2] |
| `gps-denied-gravity-nav.toml` | `gravity-map` | yes | yes | yes | no [3] | no [2] |
| `gravity-map-nav.toml` | `gravity-map` | yes | yes | yes | no [3] | no [2] |
| `hybrid-optical-rf.toml` | `hybrid-optical-rf` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `hybrid-pnt.toml` | `hybrid` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `hybrid-ukf.toml` | `hybrid-ukf` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `impairment-eval.toml` | `impairment-eval` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `imu-deadreckoning.toml` | `inertial` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `ins-trn-coast.toml` | `ins-trn-coast` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `integrity-raim.toml` | `integrity` | yes | yes | yes | yes | no [2] |
| `jamming-demo.toml` | `jamming` | yes | yes | yes | yes | no [2] |
| `l-band-waterfall-jamming.toml` | `spectrum` | no [1] | no [1] | no [1] | no [1] | yes |
| `launch-window.toml` | `launch-window` | no [10] | no [10] | no [10] | no [10] | no [2] |
| `leo-band-trade.toml` | `leo-signal` | no [5] | no [5] | no [5] | no [5] | no [2] |
| `leo-doppler-positioning.toml` | `leo-pvt` | no [6] | no [6] | no [6] | no [6] | no [2] |
| `leo-indoor-uhf.toml` | `leo-pass` | yes | yes | yes | yes | no [2] |
| `leo-iot-energy.toml` | `leo-pass` | yes | yes | yes | yes | no [2] |
| `leo-navmsg-celeste-iod.toml` | `leo-navmsg` | no [11] | no [11] | no [11] | no [11] | no [2] |
| `leo-navmsg-encode-decode.toml` | `leo-navmsg` | no [11] | no [11] | no [11] | no [11] | no [2] |
| `leo-navmsg-fit-interval-trade.toml` | `leo-navmsg` | no [11] | no [11] | no [11] | no [11] | no [2] |
| `leo-navmsg-midpass-update.toml` | `leo-navmsg` | no [11] | no [11] | no [11] | no [11] | no [2] |
| `leo-navmsg-model-comparison.toml` | `leo-navmsg` | no [11] | no [11] | no [11] | no [11] | no [2] |
| `leo-pass-celeste-iod-multiband.toml` | `leo-pass` | yes | yes | yes | yes | no [2] |
| `leo-pass-iridium.toml` | `leo-pass` | yes | yes | yes | yes | no [2] |
| `leo-pass-vs-gnss-cn0.toml` | `leo-pass` | yes | yes | yes | yes | no [2] |
| `leo-pass-xona-pulsar.toml` | `leo-pass` | yes | yes | yes | yes | no [2] |
| `leo-pnt-end-to-end.toml` | `leo-pnt-chain` | yes | yes | yes | yes | no [2] |
| `leo-pnt-mega-shell.toml` | `constellation-design` | no [8] | no [8] | no [8] | no [8] | no [2] |
| `leo-ppp-convergence.toml` | `leo-ppp` | no [6] | no [6] | no [6] | no [6] | no [2] |
| `leo-timing-utc.toml` | `leo-pvt` | no [6] | no [6] | no [6] | no [6] | no [2] |
| `link-budget.toml` | `link-budget` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `lunanet-araim.toml` | `lunar-integrity` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `lunar-attack-surface.toml` | `lunar-attack-surface` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `lunar-beacon.toml` | `lunar-beacon` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `lunar-differential-pnt.toml` | `lunar-differential-pnt` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `lunar-frame-campaign.toml` | `lunar-frame-campaign` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `lunar-frame-realisation.toml` | `lunar-frame-realisation` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `lunar-interop-export.toml` | `lunar-interop-export` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `lunar-jamming.toml` | `lunar-jamming` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `lunar-joint-od-clock.toml` | `lunar-joint-od-clock` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `lunar-llr-datum.toml` | `lunar-llr-datum` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `lunar-relay-constellation.toml` | `constellation-design` | no [8] | no [8] | no [8] | no [8] | no [2] |
| `lunar-time-budget.toml` | `lunar-time-budget` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `lunar-time-offset.toml` | `lunar-time-offset` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `lunar-vlbi-fim.toml` | `lunar-vlbi-fim` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `lunar-vlbi.toml` | `lunar-vlbi` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `maritime-port-approach-coast.toml` | `ins-trn-coast` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `maritime-spoof-position-push.toml` | `spoof-detect` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `maritime-strait-jamming.toml` | `jamming` | yes | yes | yes | yes | no [2] |
| `mars-orbit-pnt.toml` | `body-pnt` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `mars-pnt-lmo.toml` | `mars-pnt` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `mars-pnt-surface.toml` | `mars-pnt` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `mars-pnt-transfer.toml` | `mars-pnt` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `meo-leo-fused-pvt.toml` | `leo-pvt` | no [6] | no [6] | no [6] | no [6] | no [2] |
| `moonlight-service-volume.toml` | `moonlight-service-volume` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `multi-band-jamming-waterfall.toml` | `spectrum` | no [1] | no [1] | no [1] | no [1] | no [12] |
| `ntn-5g-positioning.toml` | `ntn-positioning` | no [6] | no [6] | no [6] | no [6] | no [2] |
| `oem-interop.toml` | `oem-interop` | no [13] | no [13] | no [13] | no [13] | no [2] |
| `orbit-gnss-challenged.toml` | `orbit` | yes | yes | yes | yes | no [2] |
| `orbit-molniya.toml` | `orbit` | yes | yes | yes | yes | no [2] |
| `orbit-multignss.toml` | `orbit` | yes | yes | yes | yes | no [2] |
| `orbit-real-tle.toml` | `orbit` | yes | yes | yes | yes | no [2] |
| `orbit-rinex.toml` | `orbit` | yes | yes | yes | yes | no [2] |
| `orbit-sgp4-gps.toml` | `orbit` | yes | yes | yes | yes | no [2] |
| `passes.toml` | `passes` | yes | yes | yes | yes | no [2] |
| `polar-arctic-leo-coverage.toml` | `leo-pvt` | no [6] | no [6] | no [6] | no [6] | no [2] |
| `pvt-abmf.toml` | `pvt` | yes | yes | yes | no [3] | no [2] |
| `quantum-anomaly-detect.toml` | `quantum-anomaly-detect` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `quantum-gnss-free-nav.toml` | `quantum-gnss-free-nav` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `quantum-time-transfer.toml` | `quantum-time-transfer` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `quantum-trade.toml` | `quantum-trade` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `rail-tunnel-coast.toml` | `ins-trn-coast` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `realtime-frame-eop.toml` | `realtime-frame-eop` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `reentry.toml` | `reentry` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `slot-timing-ocxo-leo.toml` | `slot-timing` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `small-uas-jammed-nav.toml` | `gnss-ins` | yes | yes | yes | no [3] | no [2] |
| `solar-system-tour.toml` | `solar-system` | no [7] | no [7] | no [7] | no [7] | no [2] |
| `space-packet.toml` | `space-packet` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `space-weather.toml` | `space-weather` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `spoof-attack.toml` | `spoof` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `spoof-detect.toml` | `spoof-detect` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `spoof-meaconing.toml` | `spoof` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `starlink-sop-doppler-positioning.toml` | `leo-pvt` | no [6] | no [6] | no [6] | no [6] | no [2] |
| `sweep-clock-stability.toml` | `sweep` | no [4] | no [4] | no [4] | no [4] | no [2] |
| `sweep-nd-inertial.toml` | `sweep-nd` | no [4] | no [4] | no [4] | no [4] | no [2] |
| `telecom-prtc-holdover-24h.toml` | `telecom-timing` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `telecom-tie-ingest.toml` | `telecom-timing` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `terrain-nav.toml` | `terrain-nav` | yes | yes | yes | no [3] | no [2] |
| `terrain-slam.toml` | `terrain-slam` | yes | yes | yes | no [3] | no [2] |
| `timetransfer.toml` | `timetransfer` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `tracking-loop.toml` | `tracking-loop` | no [1] | no [1] | no [1] | no [1] | no [2] |
| `xona-pulsar-end-to-end.toml` | `leo-pnt-chain` | yes | yes | yes | yes | no [2] |
| `xona-pulsar-signals.toml` | `leo-signal` | no [5] | no [5] | no [5] | no [5] | no [2] |

Why a format does not apply:

1. the scenario input carries no horizontal position (no latitude and longitude, no Earth-centred coordinates, no orbital elements beyond at most an altitude), so there is nothing to place on the Earth
2. SigMF holds complex baseband samples, which only the `spectrum` kind synthesises
3. an STK ephemeris describes a vehicle's position and velocity against time; this scene has only fixed points or untimed tracks (a fixed point is an STK Facility, not an ephemeris)
4. the scenario composes or sweeps other scenarios; export one member scenario on its own
5. the `leo-signal` kind analyses signal designs (spectra, tracking, acquisition, compatibility) with no satellite or user position; export the `leo-pass` or `leo-pnt-chain` scenario that flies the design
6. not exported in this release: the fused positioning kinds place their satellites in an Earth-fixed frame relative to an epoch they never name, so a time-tagged export would have to invent the calendar date (export the `leo-pass` or `leo-pnt-chain` scenario instead)
7. the kind's geometry is centred on the Moon, Mars or another solar-system body; CZML, KML and GeoJSON describe positions on or about the Earth, and this release writes STK ephemerides with CentralBody Earth only
8. not exported in this release: `constellation-design` places its satellites in a body-fixed frame relative to an epoch it never names, so a time-tagged export would have to invent the calendar date
9. not exported in this release: the Earth Global Navigation Satellite System (GNSS) constellation of `earth-gnss-lunar` is seen from a receiver at lunar distance, whose trajectory the kind does not expose as a time series
10. the `launch-window` scenario gives the launch site's latitude but no
             longitude, so the site cannot be placed
11. not exported in this release: the `leo-navmsg` truth orbit is a fitting reference whose Earth rotation angle at the epoch is an input (`theta0_deg`, default 0), not derived from the calendar date, so its Earth-fixed positions are not tied to a date
12. this spectrum scenario has no [iq] block, so no samples are synthesised to record
13. not exported in this release: `oem-interop` reads and writes a CCSDS (Consultative Committee for Space Data Systems) Orbit Ephemeris Message, which is itself the ephemeris interchange file
<!-- interop-table:end -->
