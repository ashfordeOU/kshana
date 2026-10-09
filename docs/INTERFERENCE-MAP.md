# Interference map and route exposure

`kshana interference-map` builds a per-day picture of where aircraft and ships reported
degraded navigation data, from openly licensed tracking files you supply. `kshana
route-exposure` then says how much of a planned route lay inside the affected cells on each
day.

What this is: a description of what published position reports looked like on past days.
What it is not: a measurement of any receiver, a forecast, or proof of interference. A
degraded or anomalous cell has several possible causes (listed below), and a cell with no
entry was simply not observed.

Everything runs on local files. The default commands never open a network connection; the
single optional download helper needs an explicit flag.

## Data and licences

Only the sources reviewed in [`data/INTERFERENCE-DATA-SOURCES.md`](data/INTERFERENCE-DATA-SOURCES.md)
are built in, selected with `--dataset`:

| `--dataset` | Kind | Licence | Output licence field |
|---|---|---|---|
| `adsb-lol` | ADS-B | ODbL 1.0 | `ODbL-1.0` |
| `noaa-marinecadastre` | AIS | US public domain (CC0 1.0 per the publisher) | public domain |
| `kystverket` | AIS | NLOD 2.0 | `NLOD-2.0` |
| `custom` | either | whatever you state | `--licence`, `--licence-url`, `--attribution` required |

Every output file embeds the licence, the licence URL, the required attribution and the
source's coverage limits. There is no built-in entry for sources whose terms forbid
commercial use or redistribution of derived maps.

**ODbL and Kshana editions.** A per-cell ADS-B file made from adsb.lol data is a Derived
Database and is released under ODbL 1.0; its `licence` field says so. Kshana's own code
stays AGPL-3.0. Commercial editions of Kshana that write such files carry the same notice,
and anyone who republishes the file must keep it. ADS-B and AIS results are never combined
in one file, so the ODbL does not attach to the AIS layer.

**Coverage bias.** Maps inherit the coverage of their source. adsb.lol follows volunteer
receivers, so open sea and thinly covered regions are sparse. Kystverket's open data omits
fishing vessels under 15 m and recreational craft under 45 m, so its map reflects larger
ships. MarineCadastre covers US waters only.

**Identifiers.** Input rows carry an aircraft or vessel identifier. It is hashed in memory
with a random per-run salt, used only to count distinct aircraft or vessels, and never
written, logged or printed. Outputs are aggregate: no identifier appears anywhere in them.

**Suppression.** A cell with fewer than **5** distinct aircraft or vessels observed that day
is not published at all, and for AIS a flagged count of one or two in a published cell is
reported as `null`. No published value can single out an aircraft or a vessel.

## Input formats

Plain CSV with a header row, comma-separated, no quoting, UTC times. Column order is free;
unknown columns are ignored. A timestamp is Unix seconds or `YYYY-MM-DDTHH:MM:SS[.fff]Z`.
Rows that cannot be parsed are counted in the output metadata, not silently dropped.

ADS-B (`kshana interference-map adsb`):

| Column | Required | Meaning |
|---|---|---|
| `timestamp` | yes | report time |
| `aircraft_id` | yes | opaque identifier (hashed, never stored) |
| `lat`, `lon` | yes | degrees |
| `alt_baro_ft` | yes | altitude in feet; `ground` or empty excludes the row |
| `nic`, `nacp` | at least one | integers 0 to 11; empty means not reported |
| `source_type` | no | if present, only values starting `adsb` are used (MLAT, TIS-B and the like are excluded) |

**adsb.lol readsb history, read directly.** The daily archives are a split tar of readsb
trace files. Extract one as the publisher describes (concatenate the parts, `tar -xf -`),
then give Kshana the extracted directory, a single `trace_full_*.json` file, or a CSV:

```
kshana interference-map adsb extracted-day/ --dataset adsb-lol --out maps/
```

A directory is searched recursively for `trace_full_*` files (other files, such as
`trace_recent_*`, are ignored and symbolic links are not followed). Each file is
gzip-compressed or plain JSON, detected by its first bytes, because readsb writes gzip
under a `.json` name; decompression is capped at 512 MiB per file. From each trace entry
Kshana reads the time offset, latitude, longitude, altitude (the `ground` marker excludes
the entry), the `nic` and `nac_p` fields of the aircraft details object, and the position
source string (entries from anything other than ADS-B are excluded). An entry with no
details object has no accuracy fields and is counted as excluded. A file that cannot be
read is counted in `trace_files_unreadable` in the output metadata and skipped.

AIS (`kshana interference-map ais`):

| Column | Required | Meaning |
|---|---|---|
| `timestamp` | yes | report time |
| `vessel_id` | yes | opaque identifier (hashed, never stored) |
| `lat`, `lon` | yes | degrees; the AIS "not available" values and (0, 0) are discarded |
| `sog_kn` | no | speed over ground in knots; 102.3 (not available) is treated as missing |

The on-land detector needs a land polygon file (`--land`): GeoJSON Polygon or MultiPolygon.
Natural Earth's 1:10 million land layer (public domain) is the intended file. Without
`--land` the detector is off and the output says so. To download it (the only network
access in this feature):

```
kshana interference-map fetch-land --out ne_10m_land.geojson --allow-network
```

This runs the system `curl` (as an argument list, not through a shell) over HTTPS, once,
for one file at a fixed address that names a single commit of the upstream repository. The
download is kept only if its SHA-256 equals the value pinned in the code; a mismatch deletes
it and fails. If `curl` is not installed the command says so and gives the address and the
checksum so the file can be fetched by hand. Nothing is bundled in the repository.

## Output

One GeoJSON file per source per UTC day, in the `--out` directory, named
`<source>-<YYYY-MM-DD>.geojson` where `<source>` is `adsb` or `ais` and the date is the UTC
day of the reports (`adsb-2026-03-01.geojson`). The CLI prints one line per file it writes.
Synthetic sample files, one per source, are in `examples/interference-map/output/`, with the
command that regenerates them, for building and testing a viewer. A top-level `kshana_interference_map`
member holds the schema name, date, grid, method id and every parameter, the day-level
figures, the data licence and attribution, and a notice. Each feature is a cell polygon
with `cell_i`, `cell_j`, `status`, `degraded` and the aggregate counts.

The grid is fixed: square cells of `--cell-deg` degrees (default 0.5) in latitude and
longitude, indexed from (-90, -180). East-west width shrinks with latitude: about 55 km at
the equator and about 28 km at 60 degrees for the default.

### Format version and fields

The format is settled as `schema: "kshana-interference-map/v1"`, `format_version: 1`. A
change that removes or renames a field, or changes what one means, raises the version;
adding a field does not, so a reader must ignore fields it does not know.

```
FeatureCollection
  kshana_interference_map
    schema, format_version, kshana_version, notice
    source_kind            "adsb" | "ais"
    date                   "YYYY-MM-DD" (UTC)
    grid                   { type: "fixed_lat_lon", cell_deg }
    method                 { id, summary, parameters{...}, guards[], input_stats{...}, caveats[] }
    day                    day-level figures (ADS-B: background_evaluated, background_share,
                           day_confounded, cells_published, cells_suppressed_below_min_distinct;
                           AIS: on_land_detector, cells_published, cells_suppressed_...)
    data                   { dataset, name, licence, licence_url, attribution, coverage_notes[] }
  features[]               Polygon (one closed ring, [lon, lat], counter-clockwise)
    properties             cell_i, cell_j, status, degraded,
                           ADS-B: aircraft_observed, aircraft_sampled, aircraft_affected, affected_share
                           AIS:   vessels_observed, vessels_flagged{detector: n|null}, detectors[]
```

`status` values: ADS-B `degraded`, `not_degraded`, `insufficient_sample`,
`withheld_day_confounded`; AIS `anomalous`, `not_anomalous`. `degraded` is true for
`degraded` and `anomalous` only. The route-exposure report has its own
`kshana-route-exposure/v1` schema.

## Studio map page specification

For the Studio's map page, which loads a GeoJSON file the user provides (the page is built
in the Studio source, not in this repository). Nothing is uploaded: the file is read in the
browser, and the page makes no request to any data source.

**Reading a file.** Accept a file only if `kshana_interference_map.schema` starts with
`kshana-interference-map/` and `format_version` is a number the page supports; otherwise say
the file is not a supported Kshana interference map. Read the fields listed above; ignore
unknown ones. A file holds one source and one day. Several files may be loaded.

**Cells.** Draw each feature's polygon. Colour by `status`, and always say what each colour
means in a legend. Four states, none of which may be hidden or merged:

| State | Meaning | Where it comes from |
|---|---|---|
| Degraded (or anomalous for AIS) | a high share of aircraft reported low accuracy, or vessels showed anomalies, that day | `degraded` is true |
| Clear | observed with enough aircraft or vessels and not flagged | `status` is `not_degraded` or `not_anomalous` |
| Unassessed | observed but not enough sampled aircraft, or the day was confounded | `status` is `insufficient_sample` or `withheld_day_confounded` |
| Not observed | too few aircraft or vessels, so the cell was not published | no feature for that cell |

"Not observed" is the absence of a feature: draw it neutrally (no fill, or a hatch), never
in the colour of "clear". Use a colour scheme that does not rely on red against green alone.
Cell details on hover or selection show the counts in `properties` as given, and the
`withheld`/null flagged counts as "withheld (fewer than 3)", not as zero.

**Layers.** ADS-B and AIS are separate layers with their own toggles, legends and licence
lines. Never merge them into one colour field or one count, never draw them as one
combined cell, and never sum their cells. Different days are different files: show one day
at a time, with a day picker, rather than overlaying days.

**Licence and attribution.** For every visible layer show, on the map and in any export or
screenshot, the `data.attribution` text verbatim, the `data.licence` with a link to
`data.licence_url`, and the `data.coverage_notes`. If an ADS-B layer is shown, its ODbL
licence applies to that layer only. Do not offer to export a combined file.

**Method.** Offer the method id and parameters (`method.id`, `method.parameters`) and the
`day` figures in a details panel, including `day_confounded` (say plainly that no cell was
called degraded because of the day's background) and `input_stats`.

**Caveats to keep** (show the file's own `method.caveats` and `notice`, and keep this
wording or its equivalent visible with the map):

- A degraded or anomalous cell is not a finding of interference. Other causes exist.
- A cell with no colour was not observed. It is not evidence that the area was clear.
- This is a description of past position reports, not a forecast and not a measurement of
  any receiver.
- Coverage follows the data source; read the coverage notes.

The page must not name or show any individual aircraft or vessel, and the files contain
none.

**Route exposure.** If the page also loads a `kshana-route-exposure/v1` report, show its
rows per day and source with the four shares (degraded, clear, unassessed, not observed)
together, never the degraded share alone, plus the report's `caveats`, and each row's
`map_licence` and `map_attribution`.

## ADS-B method (`kshana-interference-map/adsb/v1`)

Each airborne ADS-B report carries two self-assessed navigation quality fields: NIC (the
containment radius of the position) and NACp (the 95% accuracy bound, EPU). When the
receiver on board loses or distrusts its satellite fix, both drop, which is why they carry
a signature of interference. They also drop for other reasons.

**Pre-registered parameters** (constants in the code, written into every file; a change
means a new method version):

| Parameter | Value |
|---|---|
| Altitude floor | barometric altitude of at least 5000 ft |
| Low-accuracy report | NACp at most 6 (EPU of 185 m or worse) or NIC at most 5 (containment of 1 NM or worse) |
| Good report | NACp at least 8 and NIC at least 7 |
| Equipment baseline | an aircraft counts in a cell only with at least 5 good reports outside that cell the same day |
| Aircraft sampled in a cell | at least 3 reports in the cell |
| Aircraft affected in a cell | at least 50% of its in-cell reports are low-accuracy |
| Minimum sample | at least 10 sampled aircraft |
| Degraded | affected share of sampled aircraft at least 0.30, and at least 0.15 above the day's median cell share |
| Confounded day | median cell share (over at least 5 cells with a full sample) at least 0.15: no cell is declared degraded |
| Publication minimum | at least 5 distinct aircraft observed |

These values were set from the definitions of the NIC and NACp codes and from the privacy
rule before any data was looked at. They were not tuned on real data, and the tests use
synthetic data only. Cell statuses: `degraded`, `not_degraded`, `insufficient_sample`
(published but fewer than 10 sampled aircraft), and `withheld_day_confounded`.

**Why accuracy fields drop for reasons other than interference, and the guard for each:**

| Cause | Guard |
|---|---|
| Older transponders that never report NIC or NACp, or report them at a fixed low value | the equipment baseline: an aircraft with no good reports elsewhere that day is not counted |
| Low altitude and surface operations (terrain masking, different position formats) | altitude floor; rows marked `ground` excluded |
| MLAT or other non-GNSS positions | `source_type` filter when the column is present |
| One aircraft sending many reports | distinct aircraft are counted, not reports |
| A constellation or augmentation outage, or a space-weather event, lowering accuracy over a wide area | the cell must exceed the day's median cell share by a margin, and a day whose median is itself high is marked confounded and declares no cell |
| A fault in one aircraft's equipment | needs a share of many distinct aircraft, with a minimum sample |
| Few aircraft in the cell | minimum sample; below 5 observed the cell is not published |

What remains: the method cannot tell interference from a regional cause that is local
rather than wide (a local satellite-geometry effect or ground-based augmentation outage
would look the same), and it is conservative in one direction: an aircraft that flies only
inside an affected region all day has no baseline and is not counted, so persistent large
areas are under-reported.

## AIS method (`kshana-interference-map/ais/v1`)

Per vessel per day, five detectors. A detector **qualifies** in a cell when it flags at
least 3 distinct vessels making up at least 20% of the vessels observed there; the cell is
`anomalous` if any detector qualifies.

| Detector | Rule (pre-registered) |
|---|---|
| `on_land` | at least 3 reports in the cell more than 2000 m inland of the supplied coastline |
| `circle` | a window of 20 consecutive reports (stride 10, gaps at most 30 min) whose mean radius from the centroid is 500 m to 20 km, radius coefficient of variation at most 0.15, one direction of travel with total winding of at least 270 degrees (steps at most 90 degrees, net at least 80% of total), and mean speed at least 2 kn |
| `implausible_jump` | at least 2 jumps arriving in the cell: consecutive reports at least 1000 m apart, at most 1 h apart, implying more than 70 kn |
| `implausible_speed` | at least 3 reported speeds above 70 kn in the cell |
| `same_position` | at least 5 distinct vessels reporting the same position (rounded to 1e-4 degrees, about 11 m) in the same 10-minute window |

Cells with fewer than 5 distinct vessels are not published; a flagged count of one or two
is reported as `null`.

**Known causes of false positives**, which the share rule and the thresholds reduce but do
not remove: vessels in rivers, canals and ports close to a coarse coastline (the 2 km
inland buffer exists for this); two vessels sharing one identifier, which looks like jumps;
transponders with a bad fix or test equipment; and loitering by pilot boats and search
vessels, which can resemble circles. A coastline file at 1:10 million is accurate to about
a kilometre.

The jump and speed detectors compare reports within one input file; a track split across
files or days is not stitched.

## Route exposure

```
kshana route-exposure --route route.geojson --map out/ [--map other/] \
    [--from 2026-03-01] [--to 2026-03-07] [--out report.json] [--json]
```

`--route` is a GeoJSON LineString (bare, in a Feature, or in a FeatureCollection) or a CSV
of `lat,lon` lines. `--map` takes map files or directories of them, and may be repeated.
Waypoints are joined by straight lines in latitude and longitude, so densify long legs. The
route is split into pieces of about 250 m, each assigned to the cell holding its midpoint.

Per day and per source the report gives the route length and four shares that sum to 1:
`share_degraded`, `share_not_degraded`, `share_unassessed` (cell present but without a
call) and `share_not_observed` (cell absent from the map). Read the last two with the
first: a route with a low degraded share and a high not-observed share has not been shown
to be clear. ADS-B and AIS rows are reported separately and never combined. Each row
carries the map's licence and attribution.

## Tests

All tests use synthetic generated data and no network: unit tests in
`src/interference_map/`, and `tests/interference_map_cli.rs` for the commands end to end,
including that no identifier reaches an output and that refusals leave no files behind.
