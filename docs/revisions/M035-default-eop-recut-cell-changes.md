<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# M035 (release 0.30) — rows classified by the IERS flags, the default Earth-orientation input re-cut, and every published cell it moved

**Programme rule R4:** a changed published number is a revision. This file lists each one
old → new.

**Abbreviations.** EOP: Earth orientation parameters. IERS: International Earth Rotation and
Reference Systems Service. MJD: Modified Julian Date. UT1: Universal Time 1. mas:
milliarcseconds. RMS: root mean square. CSV: comma-separated values. P4: the programme paper
on the real-time lunar frame and Earth-orientation budget.

## 1. What changed in the engine

* `eop::row_vintage` classifies a `finals2000A` row by the IERS flags (column 17, polar
  motion; column 58, UT1−UTC): `P` on either is a Bulletin A **prediction**; otherwise a row
  with a Bulletin B block is **final** and one without is **rapid** (measured, not yet
  final). `eop::is_prediction_row`, `eop::parse_predicted` and `eop::parse_all_predicted`
  use it; until now they called every row with a blank Bulletin B block a prediction.
* `frame_eop::parse_daily_ut1` and `frame_eop::parse_daily_pm` read measured rows only
  (`eop::parse_measured`), and the as-issued data cutoff of `bulletin_a_agreement`,
  `predicted_vs_final_ut1` and `archived_vintage_comparison` is the last measured row (final
  or rapid), no longer the last final row.
* The offline default of `realtime-frame-eop` moved from `tools/finals2000A_2026.txt`
  (32 rows) to `tools/finals2000A_20260930.txt` (174 rows, MJD 61224–61397, cut verbatim
  from the finals2000A.all of 2026-09-30). The report gains `eop_input.rapid_rows`.

| | file | rows | final | rapid | prediction |
|---|---|---|---|---|---|
| **was** (as reported) | `tools/finals2000A_2026.txt` | 32 | 20 | — | 12 (MJD 61193–61204) |
| was (by the flags) | same | 32 | 20 | 12 | **0** |
| **is** | `tools/finals2000A_20260930.txt` | 174 | 30 | 54 | **90** (MJD 61308–61397) |

astropy 8.0.1 `utils.iers` reads the same census (test
`tests/embedded_eop_vintage_astropy_preregistered.rs`). The old file is still shipped and
byte-pinned; its 12 "prediction" rows are flag `I`.

## 2. Default-run cells of `p4_frame_eop.csv`

| `field` | was | is |
|---|---|---|
| `eop_source` | `bundled fixture finals2000A_2026` | `bundled fixture finals2000A_20260930` |
| `predicted_rows.n` | `12` | `90` |
| `predicted_rows.first_mjd` | `61193.0` | `61308.0` |
| `predicted_rows.last_mjd` | `61204.0` | `61397.0` |
| `predicted_rows.note` | "Real Bulletin A prediction-only rows (blank Bulletin B) …" | "Real Bulletin A prediction rows (IERS flag P) …" |
| `realtime_frame_error_budget.measured_pm_floor_mas` | `0.06776429738439221` | `0.05550345334601498` |
| `realtime_frame_error_budget.delta_xp_mas` | `0.04791659420284556` | `0.03924686824023836` |
| `realtime_frame_error_budget.delta_yp_mas` | `0.04791659420284556` | `0.03924686824023836` |
| `realtime_frame_error_budget.eop_term_m` | `14.016014260081214` | `14.015827004527962` |
| `realtime_frame_error_budget.total_m` | `20.09758815707301` | `20.097457565905607` |
| `realtime_frame_error_budget.total_time_ns` | `67.03833809279155` | `67.0379024875456` |

The pole floor is the rapid-minus-final pole RMS over the final rows of the file in force
(20 rows before, 30 now). `delta_ut1_ms` (0.5) is an input and does not move.

## 3. `tests/golden/realtime-frame-eop.csv` — the four Table 2 rows

| `label` | `n` | `ut1_ms` | `ut1_p50_ms` | `ut1_p95_ms` | `position_m` | `light_time_ns` |
|---|---|---|---|---|---|---|
| `final` | 20 → 30 | 0.022084 → 0.017094 | 0.011400 → 0.014200 | 0.049300 → 0.033000 | 0.619039 → 0.479166 | 2.064890 → 1.598325 |
| `day-1` | 31 → 83 | 0.658236 → 0.578163 | 0.581400 → 0.470200 | 1.026200 → 1.120000 | 18.450932 → 16.206424 | 61.545683 → 54.058811 |
| `day-2` | 30 → 82 | 1.296274 → 1.135884 | 1.086700 → 0.908200 | 2.010500 → 2.064500 | 36.335716 → 31.839831 | 121.202903 → 106.206243 |
| `day-3` | 29 → 81 | 1.898938 → 1.664377 | 1.761400 → 1.355900 | 2.916400 → 2.886400 | 53.228921 → 46.653970 | 177.552570 → 155.620892 |

Table 1 is unchanged.

## 4. Agreement with the published Bulletin A predictions (operational-predictor row, route 3)

The old figures compared the forecast with the 12 rapid measured rows of the old extract, not
with predictions. Against the 90 real `P` rows of Bulletin A Vol. XXXIX No. 039 (cutoff MJD
61307, default 15-day window), |forecast − Bulletin A| in UT1:

| lead | was (against rapid rows) | is (against Bulletin A predictions) |
|---|---|---|
| 1 day | 0.256 ms | 0.133 ms |
| 2 days | 0.695 ms | 0.421 ms |
| 3 days | 1.252 ms | 0.839 ms |
| 9 days | 3.885 ms | 2.786 ms |
| 30 days | — | 9.899 ms |
| 90 days | — | 28.517 ms |

RMS over all leads: UT1 19.54 ms (547.7 m at the Moon), pole 0.0319 arcsec (59.5 m), over
90 leads (was 12).
