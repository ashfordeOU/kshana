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
| `alt_baro_ft` | yes | barometric altitude in feet; `ground` or empty excludes the row |
| `nic`, `nacp` | at least one | integers 0 to 11; empty means not reported |
| `source_type` | no | if present, only values starting `adsb` are used (MLAT, TIS-B and the like are excluded) |

adsb.lol publishes gzip-compressed readsb JSON. Extract the fields above to CSV first; Kshana
does not read that format directly, to avoid a decompression dependency.

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

This runs the system `curl` over HTTPS, once, for one file. Nothing is bundled in the
repository.

## Output

One GeoJSON file per source per UTC day, named `adsb-YYYY-MM-DD.geojson` or
`ais-YYYY-MM-DD.geojson`, in the `--out` directory. A top-level `kshana_interference_map`
member holds the schema name, date, grid, method id and every parameter, the day-level
figures, the data licence and attribution, and a notice. Each feature is a cell polygon
with `cell_i`, `cell_j`, `status`, `degraded` and the aggregate counts.

The grid is fixed: square cells of `--cell-deg` degrees (default 0.5) in latitude and
longitude, indexed from (-90, -180). East-west width shrinks with latitude: about 55 km at
the equator and about 28 km at 60 degrees for the default.

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
