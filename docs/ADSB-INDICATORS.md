<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# ADS-B interference indicators: update-rate collapse, track consistency, exposed denominators

`kshana adsb-indicators` reads the same ADS-B CSV as `kshana interference-map adsb`
([Interference map](INTERFERENCE-MAP.md)) and states, per grid cell and UTC day, indicators that the
accuracy fields (NIC, NACp) cannot give: aircraft that stopped reporting while crossing the cell,
aircraft whose track jumped, and the number of aircraft actually exposed to the cell, including the
silent ones.

**MODELLED.** The thresholds are fixed here (method `kshana-adsb-indicators/v1`) and tested on synthetic
tracks only. A flag says the reports are inconsistent with normal reporting; it names no cause and
locates no emitter. Phantom-target detection is not part of this command.

```
kshana adsb-indicators <adsb.csv> [--cell-deg <d>] [--out <indicators.json>]
```

Input columns: `timestamp`, `aircraft_id`, `lat`, `lon`, `alt_baro_ft` (required), `gs_kt`, `nic`, `nacp`
(optional). Reports below 5 000 ft are ignored, as in the map.

## Per cell

| Field | Meaning |
|---|---|
| `exposed_aircraft` | distinct aircraft that reported in the cell, or crossed it during a reporting gap (the straight line between the last report before and the first after the gap, sampled every kilometre, without the two cells those reports are in) |
| `reporting_aircraft` | distinct aircraft with a report in the cell |
| `gap_aircraft`, `gap_share` | exposed aircraft that crossed the cell in a gap longer than 30 s and at most 30 min (longer is leaving coverage), counted only for aircraft whose median report interval is at most 10 s |
| `jump_aircraft`, `jump_share` | exposed aircraft with a step between reports at most 60 s apart whose implied speed exceeds both twice the reported ground speed and the ground speed plus 200 kt (600 kt assumed without one), over at least 2 km; counted in the cell of the later report |
| `low_accuracy_aircraft`, `low_accuracy_share_of_reporting` | reporting aircraft whose in-cell reports are at least half low-accuracy, by the map's own pre-registered classification |
| `flags` | `update_rate_collapse` when at least 30 % of the exposed aircraft (and at least the publication minimum) crossed in a gap; `track_inconsistency` at 20 % |

Shares come with Wilson 95 % intervals. A cell with fewer than five exposed aircraft (the map's
publication minimum) is not published, and any count below five is written as `null`.

## Agreement and the denominator effect

`agreement_with_low_accuracy` gives, over the cells where the low-accuracy share is known, the Spearman
rank correlation of that share with the gap and jump shares, and a two-by-two table of cells flagged by
the low-accuracy share (at the map's degraded-share threshold) against cells flagged by either indicator.
`denominator_effect` gives, per such cell, the low-accuracy share over the reporting aircraft and over
the exposed aircraft: where aircraft fell silent, the second is lower, and the map's share (which only
sees reporting aircraft) over-states the fraction of affected traffic that still reported and misses the
traffic that stopped.

## Privacy

Identifiers are hashed in memory with a per-run random salt, used only to count distinct aircraft, and
never written.

## Tests

`tests/adsb_indicators.rs`: on 160 synthetic aircraft crossing a 1° × 1° area where three in five fall
silent, one in five jumps and all report low accuracy, the four area cells carry both flags and more
exposed than reporting aircraft, no other cell is flagged, the indicators agree with the low-accuracy
share (positive rank correlation, no disagreeing cell), and no identifier reaches the output; missing
columns and small samples; the command line. Unit test: the rank correlation.
