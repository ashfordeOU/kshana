<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# G12 — the default Earth-orientation input, and every released cell it moved

**Programme rule R4:** a changed published number is a revision, never a silent
correction. This file is that revision. Every cell below is stated old → new with the
file, the row and the column it appears in, so a reader holding the published P4 paper
and the released result tables can check each one without running anything.

**Rule R1** is additive-only. This change is the single, founder-authorised exception to
it, and its whole extent is enumerated here.

---

## 1. What changed in the engine

`src/realtime_frame_eop.rs` embeds one IERS `finals2000A` product as the offline runtime
default. It was:

| | file | rows | Bulletin B finals | Bulletin A prediction-only |
|---|---|---|---|---|
| **was** | `tools/finals2000A_2022001.txt` | 5 | 5 | **0** |
| **is** | `tools/finals2000A_2026.txt` | 32 | 20 | **12** (MJD 61193–61204) |

Both files are verbatim IERS rows. The old one is a final-only excerpt: it publishes no
Bulletin A prediction row at all, so `predicted_rows.n = 0` on it. That zero was correct
for its input and was never a parser defect — but it meant the documented acceptance test
for G12, *"a default run emits a populated per-horizon table with `predicted_rows.n > 0`"*,
could not be met by the default. It is now met by the default.

`tools/finals2000A_2022001.txt` is **not** deleted. It is still shipped, still pinned
byte-for-byte to `tests/fixtures/agency/eop/finals2000A_2022001.txt` by
`realtime_frame_eop::tests::bundled_eop_matches_the_test_fixture`, still consumed by the
Galileo and Swarm agency validations, and the `predicted_rows.n = 0` path on it is still
asserted by `realtime_frame_eop::tests::a_default_run_publishes_the_real_prediction_rows_and_the_horizon_table`.

### Why the 2026 extract and not the long-span one

`finals2000A_2022001_longspan.txt` was the other candidate. Measured, not assumed
(`kshana <scenario>.toml` with `eop_finals2000a` pointed at each file):

| candidate | bytes | rows | finals | prediction rows | `predicted_rows.n` | Table 5 |
|---|---|---|---|---|---|---|
| `finals2000A_2022001.txt` (old default) | 1 790 | 5 | 5 | 0 | **0** | `insufficient-data` |
| `finals2000A_2022001_longspan.txt` | 9 760 | 45 | 45 | 0 | **0** | `measured` |
| `finals2000A_2026.txt` | 6 903 | 32 | 20 | **12** | **12** | `measured` |

The long-span extract is a **final-only** superset of the old default — every one of its
45 rows carries a Bulletin B block. Making it the default would leave
`predicted_rows.n = 0` and would **not** close G12. Only the 2026 extract carries
prediction rows, and it is also the smaller embedded asset of the two. It additionally
populates `operational_predictor_model.published_bulletin_a_agreement`, which needs
genuine Bulletin A prediction rows and reports `no-published-prediction-rows` on either
final-only file.

Neither file supports the true predicted-vs-final vintage residual on its own: that needs
a second, archived vintage through `eop_finals2000a_later`, and `table4_…` still reports
`no-second-vintage` on a bare run. Nothing about that changed.

---

## 2. `arxiv-papers-v3/results/p4_frame_eop.csv` — 10 of 22 cells move

This table is the default run of `scenarios/realtime-frame-eop.toml` flattened to
`field,value`. It is the source P4's data-availability section names for the budget.
Row indices are 0-based over the data rows, i.e. row 0 is the first line after the header.

| row | `field` | as released | revised |
|---|---|---|---|
| 1 | `eop_source` | `bundled fixture finals2000A_2022001` | `bundled fixture finals2000A_2026` |
| 8 | `predicted_rows.first_mjd` | *(blank)* | `61193.0` |
| 9 | `predicted_rows.last_mjd` | *(blank)* | `61204.0` |
| 10 | `predicted_rows.n` | `0` | `12` |
| 13 | `realtime_frame_error_budget.delta_xp_mas` | `0.05439852939188552` | `0.04791659420284556` |
| 14 | `realtime_frame_error_budget.delta_yp_mas` | `0.05439852939188552` | `0.04791659420284556` |
| 15 | `realtime_frame_error_budget.eop_term_m` | `14.016178596543083` | `14.016014260081214` |
| 19 | `realtime_frame_error_budget.measured_pm_floor_mas` | `0.07693113803915594` | `0.06776429738439221` |
| 20 | `realtime_frame_error_budget.total_m` | `20.097702765309116` | `20.09758815707301` |
| 21 | `realtime_frame_error_budget.total_time_ns` | `67.03872038471734` | `67.03833809279155` |

### The 12 cells that do **not** move

`earth_moon_distance_m` (row 0), `epoch` (2), `kind` (3), `label` (4), `latency_s` (5),
`lever_arm_m_per_s` (6), `omega_earth_rad_s` (7), `predicted_rows.note` (11),
`realtime_frame_error_budget.delta_ut1_ms` (12), `…ephemeris_term_m` (16),
`…frame_realization_floor_derived` (17), `…frame_realization_floor_m` (18).

No released key stopped being emitted: all 22 `field` values still resolve.

### The one cause behind the six numeric cells

Rows 13, 14, 15, 19, 20 and 21 all descend from one measurement: the rapid-minus-final
polar-motion floor (row 19), which the budget splits over two axes (rows 13, 14) and
root-sum-squares into the Earth-orientation term (15) and then the total (20, 21). The
floor is a property of the EOP file, so changing the file changes it: 0.076931 mas over
the 5 rows of the old excerpt, 0.067764 mas over the 20 finals of the 2026 extract. The
UT1 allocation (row 12, 0.5 ms) is an input and did not move, which is why the total
moves only in the fifth significant figure.

---

## 3. `tests/golden/realtime-frame-eop.csv` — 24 of 42 populated cells move

The byte-stable reproducibility artifact the scenario emits at runtime. Table 1 is
independent of the EOP input and is **unchanged**; all four Table 2 rows move in all six
populated columns.

| row (`label`) | `n` | `ut1_ms` | `ut1_p50_ms` | `ut1_p95_ms` | `position_m` | `light_time_ns` |
|---|---|---|---|---|---|---|
| `final` | 5 → **20** | 0.021171 → **0.022084** | 0.017600 → **0.011400** | 0.035100 → **0.049300** | 0.593442 → **0.619039** | 1.979511 → **2.064890** |
| `day-1` | 4 → **31** | 0.221878 → **0.658236** | 0.130600 → **0.581400** | 0.332600 → **1.026200** | 6.219436 → **18.450932** | 20.745805 → **61.545683** |
| `day-2` | 3 → **30** | 0.326700 → **1.296274** | 0.379900 → **1.086700** | 0.416800 → **2.010500** | 9.157700 → **36.335716** | 30.546798 → **121.202903** |
| `day-3` | 2 → **29** | 0.290989 → **1.898938** | 0.286200 → **1.761400** | 0.295700 → **2.916400** | 8.156674 → **53.228921** | 27.207737 → **177.552570** |

Unchanged: `table1,post-processed` and `table1,real-time` — both rows in all five of their
populated cells (`section`, `label`, `ut1_ms`, `position_m`, `light_time_ns`; their `n`,
`ut1_p50_ms` and `ut1_p95_ms` cells are empty by design) — and the `section` and `label`
cells of all four Table 2 rows. Table 1 is a closed-form function of the lever arm and the
Modelled orbit-determination covariance, with no EOP input in it at all.

The persistence curve is steeper on the 2026 extract than on the 5-row 2021/22 excerpt
because the two span different weeks of real Earth rotation, and because the old day-2
and day-3 rows rested on 3 and 2 pairs respectively — sample sizes at which an RMS is not
yet a curve. The new rows rest on 30 and 29.

---

## 4. The whole-document R1 census (default run, old → new)

Measured by flattening both reports to leaves and classifying every one. The old document
is reconstructed by running the current engine on the old input and restoring the four
source-identity strings, and that reconstruction is verified against the frozen pre-G13
capture `tests/golden/realtime-frame-eop.pre-g13.json` **field for field with zero
violations** before being used.

| | leaves | logical fields (array indices collapsed) |
|---|---|---|
| old document | 634 | 456 |
| new document | 1 263 | 563 |
| unchanged | 436 | 390 |
| **changed** | **194** | **62** |
| **removed** | **4** | **4** |
| added | 633 | 111 |

The 633 added leaves are not new capability: they are rows and array entries that exist
because the new input supports them (Table 5 now has 3 measured rows instead of 0, the
representative fit now closes a window, `published_bulletin_a_agreement` now has 12
leads, and each per-horizon epoch vector is 20–31 long instead of 2–5).

### The four removed fields, and why

```
operational_predictor_model.representative_fit.ut1.status             = "no-complete-window"
operational_predictor_model.representative_fit.ut1.statement          = "No fit is reported …"
operational_predictor_model.representative_fit.polar_motion_xp.status = "no-complete-window"
operational_predictor_model.representative_fit.polar_motion_xp.statement = "No fit is reported …"
```

These are the *placeholder* an unfittable input emits in place of a fit. The 2026 extract
spans 19 days of finals, so the 15-day window closes and a real fit object replaces the
placeholder. No measurement was removed; a "there is no measurement" marker was. On the
final-only input the placeholder is still emitted, and
`realtime_frame_eop::tests::table5_states_its_own_emptiness_on_an_input_that_cannot_feed_it`
still asserts it there.

### The 62 changed logical fields, grouped

* **6 naming the input** — `eop_source`, `eop_input.{source,rows,final_rows,prediction_rows}`,
  `eop_input.note` (prose, rewritten: see §6).
* **3 prediction-row census** — `predicted_rows.{n,first_mjd,last_mjd}`.
* **6 budget** — the six of §2.
* **6 × 4 Table 2** — the 24 of §3.
* **~30 Table 3 (joint EOP)** — every per-horizon UT1 / pole / combined statistic and its
  epoch vector, for the same reason Table 2 moves.
* **4 source-naming strings in Tables 4 and 6** — `as_issued_source` and the `statement`
  that embeds it; both tables still report `no-second-vintage` with no rows.
* **7 Table 5 / Bulletin A** — `status` and `statement` flip from
  `insufficient-data` / `no-published-prediction-rows` to `measured`, `n_rows` 0 → 3, and
  the four `equivalent_horizon_days` crossings go from `null` to a measured day count.

**No accidental exceptions were found.** Every changed, added and removed field above
descends from the one deliberate change of input.

---

## 5. Downstream, outside this repository (reported, not touched)

### `PNT_Research/repro/regen.py`

`p4_frame_eop.csv` is the **only** recipe that runs `realtime-frame-eop` on the default —
`run_file("realtime-frame-eop.toml")` with no `eop_finals2000a` override (line 800). The
other four P4 recipes (`p4_table1_consistency_*`, `p4_table2_error_vs_horizon_*`,
`p4_horizon_real_2022001_longspan`, `p4_horizon_measured`) all pass an explicit file and
are unaffected.

Until the released table is reissued, the harness needs an R4 pin so the gate is usable:

```python
REVISIONS["p4_frame_eop.csv"] = {
    (1,  "value"): ("bundled fixture finals2000A_2022001", "bundled fixture finals2000A_2026"),
    (8,  "value"): ("", 61193.0),
    (9,  "value"): ("", 61204.0),
    (10, "value"): ("0", 12),
    (13, "value"): (0.05439852939188552, 0.04791659420284556),
    (14, "value"): (0.05439852939188552, 0.04791659420284556),
    (15, "value"): (14.016178596543083, 14.016014260081214),
    (19, "value"): (0.07693113803915594, 0.06776429738439221),
    (20, "value"): (20.097702765309116, 20.09758815707301),
    (21, "value"): (67.03872038471734, 67.03833809279155),
}
```

The long comment at `regen.py:800–823` ("changing that default is a renumbering of seven
released cells") also needs correcting twice over: the founder authorised the change, and
the count for the file actually chosen is **ten**, not seven. Seven is the count for the
*long-span* candidate, which would not have closed G12 at all.

### `arxiv-papers-v3/P4-realtime-frame-eop/`

Two printed figures move. Both are the same quantity, in two places:

| file | text as released | revised |
|---|---|---|
| `sections/04-results.tex` (§"Polar motion is a small correction") | "The measured rapid-minus-definitive pole floor, \SI{0.0769}{\milli\arcsecond} in magnitude, is what enters the budget below as two equal per-axis terms of \SI{0.0544}{\milli\arcsecond}." | **0.0678** mas, two axes of **0.0479** mas |
| `sections/07-availability.tex` (source-of-every-headline-number list) | "the measured pole floor (\SI{0.0769}{\milli\arcsecond} magnitude, \SI{0.0544}{\milli\arcsecond} per axis)" | **0.0678** / **0.0479** mas |

**Every other P4 figure sourced from this table survives at the precision printed.**
Recomputed, not assumed:

| P4 figure | where | old | new | printed |
|---|---|---|---|---|
| Earth-orientation term | Table `tab:budget`, §7 | 14.016178596543083 | 14.016014260081214 | 14.016 → 14.016 |
| Ephemeris term | Table `tab:budget`, Table `tab:consistency`, §7 | 14.402531027565953 | *(unchanged)* | 14.403 |
| Realisation floor | Table `tab:budget`, §7 | 0.17746546853220646 | *(unchanged)* | 0.177 |
| Total | abstract, `tab:consistency`, `tab:budget`, §5, §6, §7 | 20.097702765309116 | 20.09758815707301 | 20.098 → 20.098 |
| Total light time | `tab:consistency`, `tab:budget`, §6, §7 | 67.03872038471734 | 67.03833809279155 | 67.04 → 67.04 |
| Total as UT1 | `tab:consistency` | 0.71698409568704 ms | 0.716980007046488 ms | 0.7170 → 0.7170 |
| Variance shares | `tab:budget` | 48.6370 / 51.3552 / 0.007797 % | 48.6364 / 51.3558 / 0.007797 % | 48.6 / 51.4 / 0.008 → same |
| "within 3 % of each other" | §4 | 2.7565 % | 2.7577 % | still < 3 % |
| Halving sensitivities | §4 | 20.2991 / 21.5885 / 49.9942 % | 20.2989 / 21.5888 / 49.9942 % | 20.3 / 21.6 / 50.0 → same |

**This revision makes P4 more self-consistent, not less.** The paper's own polar-motion
table (`tab:pm`, and the released `p4_horizon_measured.csv`) already reports the
rapid-minus-definitive pole floor as **0.0678 mas at n = 20** — computed from
`finals2000A_2026.txt`. The budget prose beside it said 0.0769 mas, because the budget was
taken from the 5-row default. The two were 13.5 % apart, in the same section, describing
the same quantity. After this change both read 0.0678 mas from the same 20 rows.

Nothing in P4 quotes `predicted_rows.n`, and the paper's Tables 1, 3 (`tab:horizon`) and 4
(`tab:pm`) are computed from explicitly-named files, not the default, so none of them
moves.

---

## 6. Prose corrected alongside the numbers

A stale explanation standing beside a changed default is its own defect, so these were
rewritten in the same change rather than left:

* `src/realtime_frame_eop.rs` module docs, §"The EOP input (G12)".
* `src/realtime_frame_eop.rs` — the `FIXTURE` constant's doc comment and the
  `eop_finals2000a` field's doc comment.
* the emitted `eop_input.note` census block (a released cell; see §2 — it is prose and is
  not one of the ten numeric/identity cells, but it is enumerated here for completeness:
  721 characters → 968, rewritten).
* `scenarios/realtime-frame-eop.toml` — the "THE EOP INPUT" block and the Table 5
  paragraph's closing sentence.
* `tests/fixtures/agency/NOTICE.md` — provenance and SHA-256 for the 2026 extract, now a
  shipped runtime asset, and a note on both `tools/` mirrors.

## 7. What a reader can run

```
kshana s.toml        # with s.toml containing only:  kind = "realtime-frame-eop"
```

gives, in `s.result.json`:

```
eop_source                      bundled fixture finals2000A_2026
eop_input.rows / final / pred   32 / 20 / 12
predicted_rows.n                12        (MJD 61193.0 .. 61204.0)
table2_error_vs_horizon         4 rows, n = 20 / 31 / 30 / 29
```
