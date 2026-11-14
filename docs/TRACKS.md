# Tracks: maritime, aviation and drone data

`kshana connect decode` reads the position reports of vessels, aircraft and drones in their own
formats, keeps the accuracy and integrity fields each report carries (its *trust attributes*), and
writes them as JSON Lines, as the interference map's CSV files, or as GeoJSON, KML and CZML tracks
coloured by what each report said about itself (roadmap 0.42, items I1 and I6). The drone and vessel
logs that carry a receiver's own fixes and signal levels are also observation readers
(`kshana obs convert --format mavlink-tlog|ulog|canboat`), so `kshana receiver-trust` and the rest
of the observation tools take them.

```sh
kshana connect decode recording.nmea --format ais --to geojson --out vessels.geojson
kshana connect decode capture.beast --format beast --start 1700000000 --to adsb-csv --out adsb.csv
kshana connect decode radar.ast --format asterix --day 2026-01-02 --radar 53.0,-6.0,50 --to kml --out radar.kml
kshana connect decode flight.tlog --format mavlink-tlog --to czml --out flight.czml
kshana connect decode flight.ulg --format ulog
kshana connect mavlink-udp 0.0.0.0:14550 --seconds 30 --out live.jsonl
kshana obs convert flight.ulg --format ulog --station station.toml --out flight.obs.jsonl
```

Every reader is read only. Nothing is sent to a receiver, an autopilot or a network: `mavlink-udp`
binds a UDP port and listens, and sends no heartbeat or stream request, so an autopilot that streams
only to a ground station that answers it sends nothing here (point a ground station's forwarding
output at the port, or use `--out` of a router). The command prints a one-line summary on standard
error: messages read, fixes, other records, checksum failures, malformed and undecoded messages.

## Formats

| `--format` | Reads | Trust attributes | Class (`reported_quality`) |
|---|---|---|---|
| `ais` | NMEA 0183 `!AIVDM` / `!AIVDO`: AIS types 1, 2, 3, 4, 18, 19 (positions) and 5, 19, 24 (static data); fragments reassembled by sequential id and channel; sentence and NMEA 4 TAG block checksums; the TAG `c:` time; an IEC 61162-450 `UdPbC` header before a line | `position_accuracy` (1: better than 10 m), `raim`, `epfd` | always `unknown`: AIS carries no integrity bound |
| `canboat` | NMEA 2000 as `canboat` `analyzer -json` lines: PGN 129029, 129025 (own ship), 129038, 129039 (AIS targets); 129539 and 129540 for the observation file | `method`, `integrity`, `satellites`, `hdop`, `pdop` | `good` for integrity "Safe", `degraded` for "Caution" or "Unsafe", else `unknown` |
| `asterix` | ASTERIX CAT010 (edition 1.1), CAT048 (1.21), CAT062 (1.18) and CAT021 (2.6) data blocks; other categories stepped over | CAT010 and CAT048: `detection`, `simulated`, `tentative`, standard deviations of position; CAT062: `tentative`, `simulated`, `coasting`, `sd_x_m`, `sd_y_m`, `sd_lat_deg`, `sd_lon_deg`; CAT021: `nic`, `nacp`, `mops` | radar and surface plots `unknown`; CAT021 by the ADS-B rule |
| `beast`, `avr` | Mode S extended squitter from the Beast binary stream or AVR hex lines (`*...;`, `@<counter>...;`); CRC-24 checked; identification, airborne position (CPR, global then local), target state (type code 29), operational status (31) | `nic`, `nacp`, `version`, `type_code` | the ADS-B rule |
| `opensky-json`, `opensky-csv` | OpenSky-style state vectors: the REST `/states/all` shape (one document or several), or the historical CSV columns found by name | `position_source`; `nic` and `nacp` only when the export adds them | the ADS-B rule, else `unknown` |
| `mavlink`, `mavlink-tlog` | MAVLink v1 and v2 frames (raw, or a `.tlog` with its 64-bit time before each frame): `GPS_RAW_INT`, `GPS2_RAW`, `GPS_STATUS`; X.25 checksum with each message's `CRC_EXTRA` | `fix_type`, `satellites`, `hdop`, `vdop`, `h_acc_m`, `v_acc_m` | `good` for a 3D fix or better, `degraded` for a 2D fix |
| `ulog` | PX4 ULog `vehicle_gps_position` and `sensor_gps`, either field set | `fix_type`, `satellites`, `eph_m`, `epv_m`, `hdop`, `vdop`, `jamming_indicator`, `jamming_state`, `spoofing_state`, `noise_per_ms` | `degraded` for a 2D fix or a jamming or spoofing state of 2 or more, else `good` |

**The ADS-B rule** is the interference map's pre-registered one (`docs/INTERFERENCE-MAP.md`):
`degraded` when NACp is 6 or less or NIC is 5 or less, `good` when every present field is at or
above NACp 8 and NIC 7, `intermediate` between, `unknown` with neither field. A NIC is never guessed:
it needs the aircraft's ADS-B version (from its operational status, version 1 or 2) and NIC
supplement A; a version 0 aircraft sends a NUCp, which is not converted.

**A class is the report's own statement**, not a Kshana finding. A receiver can report a 3D fix and a
small HDOP while it is spoofed; that is what `kshana receiver-trust` and the interference map are
for. A radar plot is a measurement by the sensor, independent of the target's own navigation; its
class is `unknown` because the format carries no integrity bound for it.

Options:

* `--day YYYY-MM-DD`: the UTC day of ASTERIX times of day. Without it, fixes carry `time_of_day_s`
  only.
* `--start <Unix seconds>`: the time of the first Beast or AVR `@` message; later times follow the
  12 MHz counter. Without it, fixes carry no time (the counter still pairs CPR frames).
* `--radar <lat>,<lon>,<height m>`: the sensor of CAT048 polar and Cartesian plots and of CAT010
  polar and Cartesian positions. The slant range is reduced to a ground range with the flight level
  where there is one, then placed on the WGS-84 ellipsoid around the sensor: good for display, not
  for surveillance accuracy. Plots without a position they can be placed with are counted as not
  decoded.

## Outputs

* `--to jsonl` (default): `kshana.tracks/1` JSON Lines. A header line (`schema`, `source_format` and
  the counts), then one line per fix (`kind: "fix"`, `source`, `id`, `t_unix_s`, `lat_deg`,
  `lon_deg`, `alt_m`, `quality`, `reported_quality`, `extra`) and one per other record (`kind:
  "static"` for AIS static data, `"identification"` for an aircraft's call sign).
* `--to adsb-csv`, `--to ais-csv`: the interference map's input files
  (`timestamp,aircraft_id,lat,lon,alt_baro_ft,nic,nacp,source_type` and
  `timestamp,vessel_id,lat,lon,sog_kn`), fixes with a time only, so `kshana interference-map adsb`,
  `ais` and `locate` read ADS-B from Beast, AVR, ASTERIX and OpenSky-style files and AIS from NMEA
  logs and NMEA 2000.
* `--to geojson` (RFC 7946): per track a `LineString` with the count of points in each class, and one
  `Point` per fix with flat properties (`reported_quality`, `quality_<name>`, `extra_<name>`, `time`),
  so QGIS shows them as attribute columns and can style by `reported_quality`.
* `--to kml` (KML 2.2): a folder per track with its line and one placemark per fix, styled by class
  (green, amber, red, grey), with a time stamp and every attribute as extended data.
* `--to czml`: for Cesium, a packet per track whose position is sampled at the fixes' times, with a
  path, a point coloured by class over time and every trust attribute as a time-interval property.

Identifiers (MMSI, ICAO address) are written as received: the files stay on your own disk. The
interference map hashes them when it reads them, as it does for any input.

## Checks

Each reader has a Connect conformance vector in `conformance/connect/` (`decode-*`, `export-*`,
`reader-mavlink-tlog`, `reader-ulog`, `reader-canboat`), run by `kshana connect check
conformance/connect` and `tests/connect_conformance.rs`, and round-trip tests in
`tests/interconnect.rs` and `src/interconnect/`. The sample inputs in
[`examples/tracks/`](../examples/tracks/) are written by encoders that share no code with the readers
and checked by independent open-source decoders (pyais, pyModeS, pymavlink, pyulog and the
CroatiaControl ASTERIX decoder); `examples/tracks/NOTICE.md` names the source of each.

Status: MODELLED. The readers are checked on synthetic inputs built from public format descriptions
and on the published worked examples of *The 1090 Megahertz Riddle*. No recording from operational
equipment with a clear licence has been checked yet, and nothing here is validated against a
decoder approved for operational use. An encoder and a reader written from the same public description can share a
misreading; the independent decoders reduce that risk for AIS, ADS-B, MAVLink, ULog and ASTERIX, but
not for canboat JSON and OpenSky-style files, whose samples are written by hand.

## What is not read

* AIS message types other than those listed (for example 21, aids to navigation, and 27, long-range).
* ADS-B surface positions (type codes 5 to 8), velocities (type code 19) and Comm-B replies.
* ASTERIX categories other than 010, 021, 048 and 062; CAT062 flight-plan data are stepped over.
* MAVLink messages other than the three GNSS ones (their checksums cannot be checked without their
  definitions and they are stepped over by length); PX4 `satellite_info`.
* NMEA 2000 from the CAN bus directly: see `kshana sensor-live --kind n2k` (`docs/MACHINE-INPUTS.md`).
* OpenSky Network data itself: these readers read files in the layout only. Whether a copy of OpenSky
  data may be used is a matter of its licence; Kshana's public observatory does not take it
  (`docs/data/INTERFERENCE-DATA-SOURCES.md`).
