<!-- Fragment of docs/LUNAR-REFERENCE-STATION.md (workstreams E and F). Included by the main document. -->

## Station geodesy: a retroreflector and a VLBI beacon at the site

> **MODELLED.** Under the stated assumptions the model gives the figures below. They are
> Cramer-Rao bounds for a reduced parameter set, not a solved datum. They are not a statement
> about any real station, and Kshana is not affiliated with or endorsed by any agency.

**Question.** How much does adding one retroreflector and one VLBI beacon at the station site
tighten the lunar frame datum, compared with today's five retroreflector arrays alone?

### Run

```sh
kshana scenarios/lunar-station-geodesy-baseline.toml       # the five arrays alone
kshana scenarios/lunar-station-geodesy-with-station.toml   # plus the station's reflector and beacon
```

Both files are the existing `lunar-llr-datum` kind on the committed slice of archived lunar laser
ranging normal points. They use the same archived schedule and the same `[beacon_campaign]`
block. The with-station file adds two new optional inputs, `extra_reflectors` and
`extra_beacons`. These feed a new `station_geodesy` block and change nothing else in the report.
With the inputs absent or empty, the report and the summary are byte-for-byte the kind's default.
`tests/lunar_station_geodesy.rs::empty_or_absent_extra_lists_are_bit_identical` checks this, and
the baseline file is that default.

No new physics:

- **Added reflector.** It is ranged at the archived normal-point epochs at which the ranging
  station is above the site's local horizon (the existing look-angle test,
  `extra_earth_elevation_mask_deg`, default 0°). Each such epoch adds one range with that normal
  point's own archived weight, through the same light-time partial the five arrays use.
- **Added beacon.** It is observed by the `lunar-frame-campaign` network and schedule with the
  Earth stations held fixed, through the `lunar-vlbi-fim` delay partials and both of that kind's
  visibility tests.
- **Combination.** Each added site is a distinct point, and each observation touches one point.
  Each site therefore adds `A_p^T M_p A_p` to the five-array Helmert information, and the sum is
  solved again.

**Caveat.** A south-polar site sees the Earth low on its horizon or not at all, so neither site is
ranged continuously. At the site used here, the reflector is skipped at 82 of the 337 archived
epochs. For the beacon, 289 of the 673 hourly epochs are epochs at which no station passed both visibility tests (Moon above the station's elevation mask and station above the beacon's horizon).
Reusing epochs that were scheduled for the five existing arrays is an **ILLUSTRATIVE** schedule,
not a plan of any station. The beacon's three-station network and its 10 ps delay sigma are the
ILLUSTRATIVE `lunar-frame-campaign` inputs. The site (latitude −89.0°, longitude 0.0°, height
0 m) is ILLUSTRATIVE.

### Before and after (1-sigma, MODELLED)

The archived slice gives 337 normal points to the five arrays. The VLBI campaign is 28 days from
2024-01-01, one epoch per hour, with three stations.

| Helmert parameter | Unit | Five arrays | With station reflector and beacon | After / before |
|---|---|---|---|---|
| tx | m | 0.00307 | 0.00070 | 0.226 |
| ty | m | 0.01300 | 0.00711 | 0.547 |
| tz | m | 0.01282 | 0.00728 | 0.568 |
| theta_x | µrad | 0.00399 | 0.00242 | 0.607 |
| theta_y | µrad | 0.00094 | 0.00035 | 0.372 |
| theta_z | µrad | 0.00042 | 0.00039 | 0.921 |
| scale | ppm | 0.00178 | 0.00063 | 0.353 |
| translation norm | m | 0.0185 | 0.0102 | 0.551 |
| condition number | 1 | 2.40e4 | 7.37e3 | |

Added observations: 255 reflector ranges (station-site reflector sigma_3d 0.021 m) and 122
beacon delays (beacon sigma_3d 0.25 m). The smallest eigenvalue of `H_after − H_before` is
−1.2e-9 against a largest of 6.4e7, which is zero to rounding.

### What the checks can and cannot tell

- An added site never increases any variance. The test checks that the Fisher difference is
  positive semi-definite to 1e-9 of its largest eigenvalue, and that every after/before ratio is
  at most one. This follows from the construction (internal consistency), and it is the only
  claim the test makes.
- The five-array column is the existing real-data result, unchanged.
- The size of the improvement depends on ILLUSTRATIVE inputs: the reused schedule, the VLBI
  network, the delay sigma and the site. It is not a prediction for any station.
- Ledger: a new report block, so +1 **MODELLED** row, "Lunar reference-station geodesy: added
  retroreflector and VLBI beacon against the five-array datum" (internal consistency).

## Data readiness: lunar station clock files

`realdata::clk::rinex_clock_series` now states the time system of what it read: `time_system`
(from the header's `TIME SYSTEM ID`, or, when that is absent, the default of the satellite system
in `RINEX VERSION / TYPE`: G GPS, R GLO, E GAL, C BDT, J QZS, I IRN, blank GPS),
`time_system_declared` (true only when every file declared it) and `record` (`AS` satellite or `AR` receiver/station
clock). It refuses a time system outside the RINEX clock list (GPS, GLO, GAL, BDT, QZS, IRN,
UTC, TAI) with an error that names it, rather than reading its epochs as GPS time. A lunar time
scale such as `LTC` is therefore refused today. It also refuses an undeclared mixed-system (`M`) file
and files whose time systems differ. No conversion between time systems is applied.

Fixture: `tests/fixtures/lunar_station_clk/station_clock_synthetic.clk` is a **synthetic**
RINEX 3.04 clock file with three station clock records (see its NOTICE.md).
`tests/rinex_clock_time_system.rs` reads it and checks that a rewritten `LTC` header is refused.

**No corrections-file format is defined**, because no public one exists for a lunar reference
station. One will be defined only after a public format is published.
