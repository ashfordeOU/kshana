<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# ITU Resolution 35 deployment check: `kshana itu-res35`

Large non-geostationary satellite systems in the FSS, MSS and BSS bands listed in ITU
Resolution 35 must deploy a share of their filed satellites by fixed milestones, or reduce the
filing. `kshana itu-res35` states those milestones for a filing and estimates, from public
element sets and a satellite catalogue, how many satellites of the system are in its notified
orbital planes and how many of those hold their orbit.

**Evidence: MODELLED.** The report is an estimate from public element sets under tolerances you
state. It is not the deployment information a notifying administration submits under Annex 1,
not an examination or finding of the ITU Radiocommunication Bureau (BR), and says nothing about
whether a satellite can transmit or receive on the filed frequency assignments. The report is
not signed; it records the SHA-256 of every input, and it can be placed in a signed
[`kshana evidence`](EVIDENCE-PACKS.md) pack.

```
kshana itu-res35 milestones <filing.toml> [--json]
kshana itu-res35 report <filing.toml> <elements|satcat> ... [--as-of <YYYY-MM-DD>] [--json] [--out <report.json>]
```

Exit codes: 0 no passed milestone is short at the as-of date; 1 one is; 2 a usage or input
error. The command reads files only and makes no network request.

## The rules, from the primary text

Source: **ITU Resolution 35 (Rev.WRC-23)**, *A milestone-based approach for the implementation
of frequency assignments to space stations in a non-geostationary-satellite system in specific
frequency bands and services*,
<https://www.itu.int/en/ITU-R/space/Documents/RES35(REV.%20WRC-23).pdf>, fetched 2026-11-27.
The milestone percentages and periods below are quoted from that text (the revision in force
since WRC-23); earlier revisions were not consulted.

| Milestone | Date | Minimum deployed | Provision |
|---|---|---|---|
| M1 | 2 years after the end of the seven-year regulatory period of No. 11.44 | 10 % of the total number of satellites, rounded down | *resolves* 7a), 11a) |
| M2 | 5 years after | 50 %, rounded down | *resolves* 7b), 11b) |
| M3 | 7 years after | 100 % (or 100 % minus one satellite, *resolves* 4) | *resolves* 7c), 11c) |

- **Reports.** The deployment information is due no later than 30 days after each milestone
  (*resolves* 7); modifications, when short, no later than 90 days after (*resolves* 11).
- **Systems whose regulatory period ended before 1 January 2021** (*resolves* 3 and 8): the
  milestones are 1 January 2023, 2026 and 2028, with reports due 1 February of those years.
- **When short**, the modified total may be at most 10 times (M1), 2 times (M2) and 1 time (M3)
  the number deployed (*resolves* 11a-c). The report gives that number as
  `max_total_if_modified`.
- **Notified orbital plane** and **total number of satellites** (*noting*): a plane is defined by
  its inclination (Appendix 4 item A.4.b.4.a), apogee (A.4.b.4.d), perigee (A.4.b.4.e) and,
  for an eccentric orbit, argument of perigee (A.4.b.4.i); the total is the sum of the
  satellites per notified plane (A.4.b.4.b). Annex 1 asks for the number of space stations
  deployed into each notified plane.
- **Not evaluated:** the post-milestone procedure of *resolves* 19 to 21 (applied provisionally
  from 1 January 2025), suspensions under No. 11.49, and the satellites an administration may
  count during a period under *resolves* 9c).

Because the plane definition does not include the right ascension of the node, planes with the
same inclination, apogee and perigee cannot be told apart by their definition; the filing file
therefore describes **plane groups** (a number of planes with the same characteristics), and
counts are kept per group.

**What the Resolution does not give.** It sets no numeric orbital tolerance for "deployed into a
notified plane" and no rule for judging deployment from element sets. The tolerances and the
station-keeping test are **inputs**: they are written in the filing file and repeated in the
report under `assumptions`.

## The filing file

```toml
system = "EXAMPLE-NGSO"
administration = "XX (fictional)"
regulatory_period_end = "2022-06-15"   # end of the seven-year period of No. 11.44

[select]                               # which catalogue objects belong to the system
norad_ids = []
name_prefixes = ["EXNGSO-"]
object_id_prefixes = ["2025-001", "2025-002"]

[tolerance]                            # assumptions, not from Resolution 35
inclination_deg = 0.5
altitude_km = 25.0
# argument_of_perigee_deg = 5.0        # needed when a plane group gives one

[station_keeping]
window_days = 14.0                     # element sets this far back from the as-of date
min_span_days = 7.0                    # shorter spans give "unknown"
max_sma_range_km = 5.0                 # station-keeping when the semi-major axis stays within this
max_element_age_days = 30.0            # an older latest set is "stale" and not counted

[[plane_group]]
id = "G1-53deg-550km"
planes = 2
satellites_per_plane = 10
inclination_deg = 53.0
apogee_km = 550.0
perigee_km = 550.0
```

The full example is `tests/fixtures/itu-res35/filing.toml` (a fictional system).

## Inputs

Any number of files, each recognised by its content:

| Input | Recognised by |
|---|---|
| OMM JSON, as CelesTrak and Space-Track GP queries return it (an array of records, or one) | starts with `[` or `{`; keys `NORAD_CAT_ID`, `EPOCH`, `MEAN_MOTION`, `ECCENTRICITY`, `INCLINATION`, `ARG_OF_PERICENTER`, optional `OBJECT_NAME`, `OBJECT_ID` |
| GP CSV | a header with `NORAD_CAT_ID` and `MEAN_MOTION` |
| Satellite catalogue CSV (CelesTrak SATCAT columns) | a header with `NORAD_CAT_ID` and no `MEAN_MOTION`; uses `OBJECT_NAME`, `OBJECT_ID`, `OBJECT_TYPE`, `DECAY_DATE` |
| Two- or three-line element sets | anything else; checksums and columns are checked by the engine's TLE reader |

Give several element files from different dates to judge station-keeping: the sets of one object
are pooled across files.

## How an object is judged

1. **Selected** when its NORAD number is listed, or its name or international designator starts
   with a listed prefix (from any input).
2. `decayed` when the catalogue gives a decay date on or before the as-of date;
   `not-a-payload` when the catalogue's `OBJECT_TYPE` is not `PAY`.
3. Its **latest set** on or before the as-of date gives the mean orbit: the Brouwer mean motion
   is recovered from the Kozai mean motion as SGP4 initialisation does, and the semi-major axis,
   apogee and perigee follow with the WGS-72 radius (6378.135 km) and gravitational parameter.
   A latest set older than `max_element_age_days` is `stale-elements`.
4. `deployed` when inclination, apogee and perigee (and argument of perigee, where the group gives
   one) are within the tolerances of a plane group; the closest group in normalised distance
   wins. Otherwise `not-in-notified-plane` (for example still raising its orbit).
5. **Station-keeping** over the window: `station-keeping` when the semi-major axis varies by at
   most `max_sma_range_km`, `not-station-keeping` when more, `unknown` when the sets span less
   than `min_span_days`.

At most the notified number of a group counts toward the total; more is reported as `excess`.
Each milestone reports the required number, the count at the as-of date (deployed, and
station-keeping alone), the shortfall and whether it has passed. A count at the as-of date is
not the count at the milestone date unless the two are the same: run with `--as-of` on the
milestone date and element sets from then to evaluate a past milestone.

The as-of date defaults to the date of the latest selected element set.

## Example

```sh
cd tests/fixtures/itu-res35
kshana itu-res35 report filing.toml gp-2026-11-10.json gp-2026-11-20.json polar.tle satcat.csv
```

```
plane group        notified  deployed  station-keeping  unknown  excess
G1-53deg-550km           20        13               12        1       0
G2-97.6deg-600km         10         3                2        0       0
counted toward the total: 16 deployed, 14 station-keeping

milestone  provision     date        report due  %    required  state     shortfall
M1         resolves 7a)  2024-06-15  2024-07-15  10          3  passed            0
M2         resolves 7b)  2027-06-15  2027-07-15  50         15  upcoming          0
M3         resolves 7c)  2029-06-15  2029-07-15  100        29  upcoming         13
```

## Limits

- Element sets are mean elements fitted by their publisher; their accuracy and the catalogue's
  completeness bound the result. An object missing from the public catalogue is not counted.
- Selecting by name or designator assumes the catalogue names the system's satellites
  consistently; check the selected list in `objects`.
- The report says nothing about which frequency assignments a satellite carries, which Annex 1
  asks for.

Code: `src/itu_res35.rs`. Tests: `tests/itu_res35.rs` (expectations derived by hand in its
header).
