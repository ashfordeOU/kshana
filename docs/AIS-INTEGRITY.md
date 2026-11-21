<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# AIS position integrity per track

`kshana ais-integrity` reads AIS position reports and writes, for each track, the flags of twelve
pre-registered detectors and the events that join flags close in time and space. It is the per-track
companion of the [interference map](INTERFERENCE-MAP.md), which counts anomalous vessels per grid cell and
never publishes an identifier.

**MODELLED.** The thresholds are fixed here (`kshana-ais-integrity/v1`) and checked on synthetic tracks
only. A flag states that reports of a track are inconsistent with ship motion, with a supplied map or list
of places, or with other reports. It does not identify a cause, a source or an intent, and the tool never
estimates the position of any emitter. Identifiers (MMSI, IMO number, name) are written exactly as the
input states them; a stated identity is not a verified one.

```
kshana ais-integrity <tracks.csv|tracks.nmea> [--format csv|nmea] [--land <land.geojson>]
                     [--places <places.csv>] [--out <flags.jsonl>]
```

## Inputs

- **CSV** (a header row, comma-separated, no quoting): required `timestamp` (ISO 8601 UTC or Unix
  seconds), `vessel_id`, `lat`, `lon`; optional `sog_kn`, `stw_kn` (speed through the water from a log, when
  available), `nav_status` (AIS navigational status 0 to 15), `imo`, `name`. Other columns are ignored.
- **NMEA 0183** `!AIVDM`/`!AIVDO` lines, read by the interconnect AIS reader (types 1, 2, 3, 4, 18, 19
  for positions; 5, 19, 24 for the stated IMO number and name). A position report takes its time from the
  NMEA 4 TAG block before it (`\c:<unix seconds>*hh\`); a report without one is counted
  (`rejected_no_time`) and dropped. The format is detected from the first line unless `--format` is given.
- `--land`: coastline polygons as GeoJSON (the same file `kshana interference-map fetch-land` writes).
  Without it the `on_land` detector does not run, and the header says so.
- `--places`: a CSV `name,lat,lon,radius_m` of places no vessel can be, for example airports or inland
  sites. Positions within a radius are flagged with the place's name.

The AIS "not available" values (latitude 91, longitude 181, speed 102.3) and the (0, 0) default position
are discarded before any detector runs.

## Detectors

Each detector runs on each track (the reports of one identifier, in time order). Hits of one detector on
one track less than 30 minutes apart (`episode_gap_s`) form one flag with a start, an end, the number of
hits and the largest measured values.

| Detector | A hit is | A flag needs | Common causes other than interference |
|---|---|---|---|
| `position_jump` | consecutive reports at least 1 km apart, at most 1 h apart, implying more than 70 kn | 1 hit | a single bad fix, merged feeds with clock offsets, two transmitters on one identifier (see `identity_conflict`) |
| `reported_speed` | reported speed over ground above 70 kn | 3 reports | transponder or sensor faults; high-speed craft near the limit |
| `speed_inconsistency` | over a span of 2 to 15 min, the mean reported speed and the track speed differ by more than 5 kn and half the larger (`sog_vs_track`); a step of 25 kn or more within 60 s (`sog_step`); speed over ground and through the water differ by more than 8 kn (`stw_vs_sog`) | 3 hits | speed sensor faults, wrong speed source configured, strong tidal streams for `stw_vs_sog` |
| `circle` | 20 consecutive reports on a circle of 0.5 to 20 km radius, radius variation under 15 %, winding at least 270° in one direction, mean speed above 2 kn | 1 window | search patterns, trials, fishing and survey work |
| `drift_while_stationary` | over 30 min, every report states 0.5 kn or less while the positions move at least 500 m in a near-straight line (net over largest displacement at least 0.8) at more than three times the mean reported speed plus 0.5 kn | 1 window | a receiver that reports zero speed at low speeds while the vessel drifts, a stale navigational status |
| `on_land` | a position more than 2 km inland of the supplied coastline | 3 reports | rivers, canals, locks and ports inside the coastline polygons; a coarse coastline |
| `at_listed_place` | a position within a listed place's radius | 2 reports | a place list that overlaps water; vessels on lifts or in dry dock near a listed site |
| `common_position` | five or more tracks at one position (rounded to 1e-4°, about 11 m) in one 10 min window | 1 hit | berths and anchor points shared in turn, test transmitters |
| `identity_conflict` | the track splits into two sub-tracks, each consistent with ship motion, that alternate: at least 5 reports each, at least 3 switches, at most 10 % of reports explained by neither | — | two vessels configured with one MMSI, merged sources, test transmitters |
| `identity_change` | one identifier states more than one IMO number | — | data entry corrections, merged static data |
| `shared_imo` | one IMO number stated by more than one identifier whose report times overlap | — | an MMSI changed without the old one leaving the data, data entry errors |
| `identity_format` | a numeric identifier that is not a 9-digit MMSI with an allocated leading pattern (ITU-R M.585: ship 2xx-7xx, coast station 00, group 0, SAR aircraft 111, craft associated with a parent ship 98, aid to navigation 99, AIS-SART/MOB/EPIRB 970/972/974); a stated IMO number that fails its check digit | — | test identifiers, the default MMSI of a transponder that was never configured |

When `identity_conflict` fires, the motion detectors run on each of the two sub-tracks separately, so the
alternation is reported once and not as dozens of jumps.

## Events

Flags with a time and a place (all detectors except the three identity-number checks) are joined by single
linkage: two flags link when their time intervals are at most 15 min apart and their *anchors* are at most
150 km apart (or they belong to the same track). A flag's anchor is the last report of its track before the
inconsistency. A group with at least three distinct tracks is an event. Because linkage needs both time and
distance, simultaneous episodes in areas more than 150 km apart stay separate events
(`tests/fixtures/ais_integrity/two_areas.csv`).

An event's `reported_area` is the bounding box of its anchors: where the affected tracks reported from
before the inconsistency. It is not the location of any source, and nothing in this tool estimates one.

## Output (`kshana.ais-integrity/1`, JSON Lines)

1. `header`: schema, method id, `evidence: "MODELLED"`, the parameters, whether `on_land` ran, the number
   of listed places, input counters and the caveats.
2. For each track in identifier order: a `track` line (reports, first and last time, number of flags), then
   its `flag` lines (`detector`, `t_start`, `t_end`, `hits`, `anchor`, `detail` with the measured values,
   `event` when it joined one, `evidence: "MODELLED"`).
3. `event` lines (`event`, `t_start`, `t_end`, `vessels`, `vessel_ids`, flags per detector, `reported_area`).
4. A `summary` line: tracks, tracks flagged, flags, events and per-detector counts.

The output is deterministic: the same input gives the same bytes. With `--out`, a one-line summary is
printed to standard error.

## Checks

`tests/ais_integrity.rs`:

- **Labelled fixtures** (`tests/fixtures/ais_integrity/`, written by `gen_fixtures.py`, which the test
  re-runs and compares byte for byte). Every track's set of flags and every event must equal
  `labels.json` exactly, including the tracks that must not be flagged (ordinary traffic, vessels swinging
  at anchor, cruising tracks next to the flagged ones):
  - `simultaneous_jump.csv`: eight vessels in one area whose reports all move by about 42 km at the same
    minute and stay offset, and four vessels 600 km away. Shaped after the published description of many
    vessels in one area jumping at the same moment (the case list cites the Gulf of Mexico, 31 December
    2024). Expected: one `position_jump` flag per affected vessel, one event of eight.
  - `berth_drift.csv`: three vessels reporting speed 0 and status "moored" whose positions drift away at
    1.5 kn for two hours, and two vessels swinging at anchor. Shaped after published descriptions of berthed
    vessels whose reported positions drifted (the case list cites Novorossiysk). Expected:
    `drift_while_stationary` on the three, nothing on the two, one event.
  - `two_areas.csv`: two groups of five vessels 650 km apart jumping at the same time. Expected: two events.
  - `patterns.csv`: one track per remaining detector, six vessels at one position (one event) and
    ordinary traffic.

  These fixtures are synthetic. They are not the recorded data of the cited cases, which were not
  available for this work; whether the detectors flag the recorded data is **unverified**.
- **NMEA**: sentences with TAG-block times read as the CSV does; a failed checksum and a report without a
  time are counted and dropped; IMO numbers come from type 5.
- **Command line**: the documented lines, determinism, refusal of bad options, formats and place rows.
- **False alarms and detection on the M4 synthetic scene** (`crate::m4_dark_vessel`, the dark-vessel truth
  set: 2,000 vessels over six hours, a report every 10 s with 80 % probability, 10 m position noise, no
  reported speed). Identities are moved to an allocated MMSI range first. On every run the test checks a
  400-vessel subset of seed 1: no flag on any NORMAL or GAP track, `identity_conflict` on every
  IDENTITY-DUPLICATE identity, `position_jump` on at least 95 % of POSITION-OFFSET tracks. The three
  full scenes (ignored test `m4_full_scene_table`: `cargo test --test ais_integrity m4_full -- --ignored
  --nocapture`, about a minute) give:

  | M4 label (seeds 1, 2, 3) | Tracks | Tracks with any flag | Flags |
  |---|---|---|---|
  | NORMAL | 4,800 | 0 | none: false-alarm rate 0, below 0.07 % at 95 % confidence (three over the number of tracks) |
  | GAP (AIS off for 30 min to 2 h) | 180 | 0 | none |
  | POSITION-OFFSET (2 to 50 km from an onset) | 420 | 420 | `position_jump` on every one |
  | IDENTITY-DUPLICATE (a second vessel with the identity, at least 50 km away) | 180 | 180 | `identity_conflict` on every one, and no other flag |
  | DARK (no AIS) | 420 | 0 | (no reports) |

  The M4 reports carry no speed, so this table does not exercise `reported_speed`,
  `speed_inconsistency` or `drift_while_stationary`; the labelled fixtures do.

  The false-alarm rate on synthetic NORMAL tracks says that the thresholds do not fire on ordinary
  motion with GNSS-grade noise. It is not the false-alarm rate on real AIS, where transponder faults,
  merged feeds and shared identifiers are common causes of flags (see the table above); no real-data rate
  is claimed.

## Limits

- The detectors see only what the reports say. A receiver that is spoofed smoothly, with consistent
  speed and course and no position on land or at a listed place, gives no flag.
- AIS covers only vessels that carry and use a transponder; each data source excludes some vessel classes
  and has its own gaps and delays.
- `on_land` and `at_listed_place` are only as good as the supplied coastline and place list.
- No detector estimates the position of a transmitter, and no output names a cause or an actor.
