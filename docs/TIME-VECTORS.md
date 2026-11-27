# Time-scale conformance vectors

An open, versioned set of test vectors for the time conversions that keep breaking in navigation and
timing software, and `kshana time-vectors`, which runs them against kshana's own implementation and
prints a pass/fail table. The files are plain JSON with nothing kshana-specific in them, so another
project can run the same vectors against its own code.

Why these: the open GNSS stack keeps shipping the same classes of bug. Leap-second unit and boundary
errors (flight-controller firmware, Python GNSS libraries near a leap second), GPS week jumps after a
10-bit rollover, NTP-era and 32-bit time overflows in time daemons, and two-digit years are recurring
reports in public issue trackers. In November 2026 the five-digit NORAD catalogue range ran out: the
TLE stop-gap is Alpha-5 and the advice is to move to OMM. Each of these has a closed-form, published
answer, so it can be pinned with vectors.

## Run

```sh
kshana time-vectors                       # the built-in set (data/conformance/time, embedded)
kshana time-vectors --json                # one JSON object per vector
kshana time-vectors my-vectors.json dir/  # other files, or every *.json in a directory
```

Exit status: 0 when every vector passes, 1 when any fails, 2 on a usage or file error.

```
id                                      op                result
leap-2017-01-01-inserted-valid          utc_valid         PASS
gps-2016-12-31T23:59:60                 gnss_week_tow     PASS
...
526 vectors: 526 passed, 0 failed
```

## The set (version 1.0.0)

| File | Vectors | What it pins |
|---|---|---|
| `leap-seconds.json` | 307 | every leap second since 1972: TAI−UTC at 23:59:59, through 23:59:60 and at 00:00:00; the 86 401 s day; 23:59:60 (and 23:59:60.5) in TAI, GPST and GLONASST (02:59:60 Moscow); TAI back to 23:59:60; times that do not exist (23:59:60 on days without one, 23:58:60, 24:00, before 1972) |
| `gnss-weeks.json` | 50 | GPS week starts 0 to 8192 (incl. the 1999, 2019 and **2038** 10-bit rollovers and the 2137 13-bit one); week and time of week across the rollovers and the 2016 leap second, and back to UTC; resolving 10-, 12- and 13-bit broadcast weeks against a reference week |
| `gnss-systems.json` | 73 | Galileo GST and BeiDou BDT weeks; UTC/TAI/TT/GPST/GST/BDT/GLONASST offsets on four dates; each scale's label of one instant; GLONASS `N4`/`NT` (on the Moscow date, including the New Year and leap-day edges) |
| `computer-eras.json` | 21 | NTP era 0/1 (2036-02-07T06:28:16Z), NTP seconds resolved near a pivot; signed 32-bit Unix time at 2038-01-19T03:14:07Z and what it wraps to; unsigned 32-bit wrap (2106) |
| `two-digit-years.json` | 20 | RINEX 2 (`80-99`→19xx), TLE (`57-99`→19xx) and NMEA `ddmmyy` (sliding window around a reference year) |
| `ut1-utc.json` | 11 | UT1 from UTC with \|UT1−UTC\| from 0.1 s through 0.9 s to the 3600 s maximum of continuous UTC (CGPM 2026 Resolution 5, effective 20 May 2027): the UT1 label to the millisecond, the Earth rotation angle (IERS Conventions 2010, eq. 5.15), and the rotation error a 0.9 s clamp would leave; TAI−UTC = 37 s on and after 20 May 2027 (assuming no leap second before then) |
| `norad-catalogue.json` | 44 | Alpha-5 encode and decode both ways over the range (`A0000` = 100 000 … `Z9999` = 339 999, no `I`/`O`), refusals, the TLE checksum with a letter in the catalogue field, a TLE line 1 in Alpha-5, and OMM `NORAD_CAT_ID` beyond Alpha-5 (512 345, 123 456 789) |

Every UTC conversion of a future date assumes no leap second after the table (current to IERS
Bulletin C; none announced through 2026-12-31). A new leap second means a new table row and a new
minor version of the set.

## Where the expected values come from

`data/conformance/time/gen_time_vectors.py` writes the files. It uses only the Python standard library
(`datetime` for the calendar) and its own transcription of the published definitions (IERS Bulletin C,
IS-GPS-200, the Galileo OS SIS ICD, the BDS SIS ICD, the GLONASS ICD, RFC 5905, RINEX 2.11, the TLE
format, CCSDS 502.0-B-3, Space-Track's Alpha-5 scheme); it shares no code with the Rust side
(`src/gnss_time.rs`, `src/norad.rs`). `python3 data/conformance/time/gen_time_vectors.py --check`
fails if the committed files differ from what it writes (`tests/time_vectors_cli.rs` runs it).

## Format: `kshana.time-vectors/1`

```json
{
 "format": "kshana.time-vectors/1",
 "set": "gnss-weeks",
 "version": "1.0.0",
 "description": "...",
 "generator": "data/conformance/time/gen_time_vectors.py",
 "vectors": [
  {"id": "resolve-10bit-0-near-2047", "op": "week_resolve",
   "input": {"truncated": 0, "bits": 10, "reference_week": 2047},
   "expect": {"week": 2048}, "note": "a receiver one week before the 2019 rollover"}
 ]
}
```

* `id` is unique in its file; `note` is optional prose.
* `expect` lists the output fields to compare (an implementation may return more). Numbers compare
  within `tolerance` (a vector field, default `1e-9`), strings and booleans exactly.
  `{"error": true}` means the operation must refuse the input.
* Times are `YYYY-MM-DDThh:mm:ss[.fffffffff]` with no zone suffix; the fraction is written only when
  not zero, without trailing zeros. A leap second is written `23:59:60`.

### Operations

| `op` | input | output |
|---|---|---|
| `utc_valid` | `utc` | `valid` (true), `utc` (normalised); error if the time does not exist in UTC |
| `tai_minus_utc` | `utc` | `seconds` (TAI−UTC in force through that UTC day) |
| `utc_day_length` | `date` | `seconds` (86 400 or 86 401) |
| `utc_to_scale` | `utc`, `scale` | `time`: the label in `UTC`, `TAI`, `TT`, `GPST`, `GST`, `BDT` or `GLONASST` |
| `scale_offset` | `from`, `to`, `utc` | `seconds`: `to − from` at that instant |
| `tai_to_utc` | `tai` | `utc` (with `23:59:60` inside an inserted second) |
| `gnss_week_tow` | `utc`, `system` (`GPST`, `GST`, `BDT`) | `week`, `tow` (s), `week10`, `week12`, `week13` (the broadcast forms) |
| `gps_to_utc` | `week`, `tow` | `utc` |
| `gps_week_start` | `week` | `gpst` (label at which the week starts) |
| `week_resolve` | `truncated`, `bits`, `reference_week` | `week`: the full week with those low bits nearest the reference (a tie goes to the later week) |
| `glonass_day` | `utc` | `n4`, `nt`, `moscow` |
| `unix_to_ntp` | `unix` | `era`, `seconds` |
| `ntp_to_unix` | `seconds`, `pivot_unix` | `unix`, `era`, `utc` (the era nearest the pivot) |
| `unix_i32` | `unix` | `fits`, `wrapped`, `utc`, `wrapped_utc` |
| `unix_u32_resolve` | `raw`, `pivot_unix` | `unix`, `utc` |
| `two_digit_year` | `yy`, `convention` (`rinex2`, `tle`, `nmea`), `reference_year` (nmea) | `year` |
| `norad_encode` | `number` | `field` (5 characters); error above 339 999 |
| `norad_decode` | `field` | `number`; error on `I`, `O`, lower case, wrong length |
| `tle_checksum` | `line` | `checksum` (columns 1-68: digits, `-` = 1, everything else 0, modulo 10) |
| `tle_identity` | `line1` | `number`, `designator`, `epoch` (`YYYY-DDDThh:mm:ss.ssssss`) |
| `omm_catalogue` | `omm` (KVN text) | `number`, `epoch_days_1950` (SGP4 epoch, days from 1950 Jan 0.0), `alpha5` (`""` when it does not fit) |

## The kshana side

* `src/gnss_time.rs`: exact-integer (nanosecond `i128`) UTC/TAI/GPST/GST/BDT/TT/GLONASST arithmetic
  with leap seconds, week resolution, GLONASS day numbers, NTP and 32-bit Unix eras, two-digit years.
  The TLE reader and the NMEA RMC date take their two-digit years from it.
* `src/norad.rs`: Alpha-5 `decode`/`encode`, `catalogue_number_from_omm` and `tle_from_omm` (SGP4
  elements from an OMM with no five-digit limit). `tle::parse_tle_identity` (and so the TLE→OMM export)
  reads Alpha-5 catalogue fields.
* `src/time_vectors.rs`: the runner and the table; `kshana time-vectors` is its CLI.
