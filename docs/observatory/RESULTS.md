# Observatory results: 30-day Baltic back-catalogue and sensitivity study

Version `kshana-observatory/adsb/v1` over `kshana-interference-map/adsb/v2` (parameters pre-registered in the base
method, unchanged). MODELLED: there is no external oracle, no ground truth and no cause attribution. A degraded
cell means a high share of the aircraft sampled there reported low navigation accuracy that day; it does not say
why. A cell that is not observed, or absent, was not assessed, which is not the same as clear.

## What was run

- **Source:** adsb.lol readsb history (ODbL 1.0), GitHub release `v<YYYY>.<MM>.<DD>-planes-readsb-prod-0` of
  `adsblol/globe_history_2026`, fetched by `scripts/fetch_adsblol_day.sh` one part at a time (about 3.4 GB a day, 2
  parts). The publisher states no checksums, so the SHA-256 of every part is recorded in
  `back-catalogue/fetch/<tag>.parts.json`.
- **Region and days:** the box 53.5, 9.0, 66.0, 31.0 (south, west, north, east: the Baltic Sea and its coasts),
  30 UTC days from 2026-09-15 to 2026-10-14, 0.5 degree cells, by `scripts/observatory_backcatalogue.sh` (one day
  at a time, raw files deleted after each day).
- **Release rules:** the newest day (2026-10-14) was more than 24 h past its end when produced; the command
  refuses otherwise. Regional runs compute the equipment baseline and the day's background from the box's reports
  only (`method.scope`).
- **Files:** the 120 product files (GeoJSON, PNG, incident JSON, manifest per day) are **not in git**. The hash of
  every file is in `back-catalogue/MANIFEST.json`, and a day can be rebuilt from its archive and compared.

Example of what a day reads: on 2026-09-15 the archive held 110,619,797 position rows in 79,826 trace files; 103.0
million were outside the box, 5.6 million were not ADS-B, 1.2 million were on the ground or below 5,000 ft, 0.6 million
carried no accuracy field, and 212,426 were aggregated (`manifest.json` input counters).

## Reproducibility

Three days (2026-09-18, 2026-09-26, 2026-10-03) were fetched again from the archive and run a second time: the
GeoJSON, the PNG and the incident file are **byte-identical** to the first run (SHA-256 equal), so the product is
deterministic even though the identifier hash salt is random per run.

## Back-catalogue summary

| UTC day | published cells | degraded | not degraded | not observed (published) | incidents |
|---|---|---|---|---|---|
| 2026-09-15 | 643 | 7 | 461 | 175 | 3 |
| 2026-09-16 | 686 | 6 | 472 | 208 | 5 |
| 2026-09-17 | 691 | 5 | 460 | 226 | 2 |
| 2026-09-18 | 694 | 8 | 473 | 213 | 5 |
| 2026-09-19 | 663 | 2 | 416 | 245 | 2 |
| 2026-09-20 | 673 | 1 | 464 | 208 | 1 |
| 2026-09-21 | 674 | 3 | 465 | 206 | 3 |
| 2026-09-22 | 674 | 4 | 455 | 215 | 3 |
| 2026-09-23 | 668 | 2 | 456 | 210 | 2 |
| 2026-09-24 | 683 | 3 | 468 | 212 | 2 |
| 2026-09-25 | 701 | 3 | 469 | 229 | 3 |
| 2026-09-26 | 656 | 1 | 423 | 232 | 1 |
| 2026-09-27 | 682 | 2 | 459 | 221 | 1 |
| 2026-09-28 | 683 | 2 | 472 | 209 | 2 |
| 2026-09-29 | 666 | 3 | 454 | 209 | 2 |
| 2026-09-30 | 687 | 6 | 465 | 216 | 4 |
| 2026-10-01 | 691 | 1 | 476 | 214 | 1 |
| 2026-10-02 | 684 | 4 | 462 | 218 | 3 |
| 2026-10-03 | 650 | 0 | 397 | 253 | 0 |
| 2026-10-04 | 675 | 5 | 458 | 212 | 4 |
| 2026-10-05 | 689 | 2 | 466 | 221 | 1 |
| 2026-10-06 | 662 | 4 | 448 | 210 | 3 |
| 2026-10-07 | 671 | 3 | 458 | 210 | 2 |
| 2026-10-08 | 664 | 4 | 447 | 213 | 4 |
| 2026-10-09 | 687 | 4 | 465 | 218 | 2 |
| 2026-10-10 | 640 | 3 | 402 | 235 | 2 |
| 2026-10-11 | 678 | 3 | 459 | 216 | 2 |
| 2026-10-12 | 688 | 4 | 467 | 217 | 4 |
| 2026-10-13 | 672 | 0 | 457 | 215 | 0 |
| 2026-10-14 | 669 | 1 | 474 | 194 | 1 |

30 days: 96 degraded cells in total, 28 of the 30 days with at least one, 70 incidents (clusters of touching degraded
cells), no day with a day-wide effect. The median cell share of affected aircraft (the day's background) is 0 on
29 days and 0.006 on one, so the background guard (a cell must exceed the background by 0.15) never changed a call in
this region. The count of degraded cells per day runs from 0 to 8 (mean 3.2). About a third of the published cells each
day are `not_observed` (too few aircraft sampled): coverage is the limit of this product, not the sky.

What this does not say: the days with more degraded cells are not "worse" in any physical sense, a persistent
affected area would be understated (aircraft that fly only inside it all day have no baseline outside it and are
not counted), and nothing here says who or what caused low accuracy.

## Sensitivity study (three days)

`kshana interference-map sensitivity` replays one day's recorded reports under one-at-a-time changes of the
registered parameters (two values each, plus a 1.0 degree grid). Days: 2026-09-18 (the most degraded cells, 8),
2026-09-26 (1 degraded cell) and 2026-10-03 (0). Full reports: `sensitivity/<day>.json` (23 variants each; 2.2, 1.7
and 1.7 million rows replayed). Degraded cells under each variant (registered value in brackets; the registered
result is 8, 1 and 0 degraded cells):

| parameter (registered) | value | 09-18 (8) | 09-26 (1) | 10-03 (0) |
|---|---|---|---|---|
| `low_nacp_max` (6) | 5 / 7 | 6 / 8 | 1 / 3 | 0 / 2 |
| `low_nic_max` (5) | 4 / 6 | 3 / 16 | 0 / 12 | 0 / 8 |
| `good_nacp_min` (8) | 7 / 9 | 8 / 6 | 1 / 0 | 0 / 1 |
| `min_alt_ft` (5000) | 3000 / 8000 | 6 / 6 | 1 / 1 | 0 / 1 |
| `affected_report_share` (0.5) | 0.4 / 0.6 | 8 / 4 | 2 / 1 | 2 / 0 |
| `degraded_share` (0.30) | 0.2 / 0.4 | 14 / 1 | 5 / 1 | 4 / 0 |
| `min_aircraft_sampled` (10) | 8 / 15 | 8 / 8 | 2 / 0 | 2 / 0 |
| `min_reports_per_aircraft_in_cell` (3) | 2 / 5 | 11 / 2 | 12 / 0 | 6 / 1 |
| `background_margin` (0.15) | 0.10 / 0.20 | 8 / 8 | 1 / 1 | 0 / 0 |
| `min_baseline_good_reports` (5) | 3 / 10 | 8 / 8 | 1 / 1 | 0 / 0 |
| `day_confound_background` (0.15) | 0.10 / 0.25 | 8 / 8 | 1 / 1 | 0 / 0 |
| grid 0.5 degrees | 1.0 | 2 (coarser cells) | 3 | 1 |

Reading it, without choosing a winner:

- **The calls are sensitive to the accuracy-code thresholds and the sampling rules, and the small counts move a lot.**
  `low_nic_max`, `degraded_share` and `min_reports_per_aircraft_in_cell` each change the number of degraded cells by a
  factor of two or more on every day; relaxing `low_nic_max` to 6 turns 1 degraded cell into 12 on 09-26 (Jaccard
  with the registered set 0.08). On 09-18 raising `degraded_share` to 0.4 keeps 1 of the 8 (Jaccard 0.125). A cell
  call near the thresholds is a statement about the thresholds as much as about the data.
- **`min_aircraft_sampled` mostly moves cells between not degraded and not observed**: on 09-18 it leaves the degraded
  count at 8 while 21 to 56 cells change state.
- **Three guards are inactive here**: `background_margin`, `min_baseline_good_reports` and `day_confound_background`
  change nothing on any of the three days (the background share is 0), so this region and period say nothing about how
  well they work. They would matter where a regional effect raises the background.
- **A coarser grid (1.0 degree) changes the picture** (2, 3 and 1 degraded cells; the published cells fall to about a third, 226
  against 694 on 09-18, because each cell is four times larger): cell size is a method choice, and the observatory fixes it at 0.5 degrees.
- A day with no registered degraded cell (10-03) has degraded cells under 9 of the 22 non-grid variants (up to 8 with
  `low_nic_max` 6): "no degraded cell" is also a threshold-dependent statement.

No variant is a validated alternative, and the registered rule is unchanged by this study. The study does not say
which parameter values are right.
