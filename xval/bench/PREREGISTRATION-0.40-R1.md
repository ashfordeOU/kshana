# Pre-registration (DRAFT, awaiting owner sign-off): task (b), detection on IQ with negatives from null recordings

**Status: DRAFT. Not committed as a registration until the owner signs it off. Nothing has been run for it.**

These are new bars, **R3** and **R4**. They do not replace, change or reinterpret **R1** of
`docs/design/DETECTION-ROC.md` (`cn0_drop` AUC >= 0.95 over 18 positive and 36 negative windows; measured 0.7855,
NOT MET, pinned by the ignored `r1_the_cn0_drop_roc_separates_6_db_attenuations`), nor the carried baseline of
`RESULTS-v1.md`.

## Why a new design, and a disclosure that shapes it

The R1 miss was traced after the run: the 18 post-event negative windows inherit the detector's memory (CUSUM maximum
81 or more against a threshold of 5) while all 18 pre-event negatives score 0, so against the pre-event negatives
alone the AUC would have been 1.0. That is already known, so a bar that merely drops the post-event windows would be
decided before it is run and would carry no information. This draft instead takes the negatives from **separate null
recordings** in which no event occurs, so no event can leave memory in them, and asks two questions that were not
asked: does the score separate event windows from windows of recordings that had no event, and what is the
false-alarm rate per window at the configured threshold.

## What was seen before this was written (disclosed)

- R1 and R2 as recorded (`DETECTION-ROC.md` section 3): R1 AUC 0.7855, `P_d` 1.0 and `P_fa` 0.5 at `h = 5`; R2 AUCs
  0.5000, 0.5664, 0.6389.
- The post-event-memory finding above, including the pre-event-only AUC of 1.0.
- **Not seen:** any score of the new null recordings (seeds 500 to 511 below), or any cross-recording false-alarm rate.

## Fixed before any run

- **Positives:** the 6 event recordings of the R1 recipe (`tests/iq_campaign_roc.rs`, `recipe(300, 6.0)`: seeds
  300 to 305, 22 s, 3 satellites each from the stated pool, every satellite attenuated 6 dB for 6 s from 10 s to
  16 s), `roc_window_s = 6.0`, default monitors. Only the 18 event windows are used. Their pre-event and post-event
  windows are **excluded** (not used as negatives).
- **Negatives:** 12 new null recordings: the same recipe with attenuation 0 dB (the R2 construction) and seeds
  500 to 511 (`recipe(500, 0.0)` extended to 12 recordings, satellites by `pool[(i + 2 j) % 6]` as in the recipe),
  22 s, `roc_window_s = 6.0`. Every scored window of every null recording is a negative: with 3 windows per satellite
  that is 12 x 3 x 3 = 108 negative windows (the number the tool reports is recorded and, if it differs, the
  difference is stated; the bar does not depend on it).
- **Detector:** `cn0_drop`, default monitors, configured threshold `h = 5`.
- **Metric:** AUC (trapezoidal, as `iq campaign` reports) over the 18 positive and the null-recording negative
  windows; `P_d` and `P_fa` at the configured threshold.

## Bars

- **R3:** `cn0_drop` AUC >= 0.95 (the R1 level, unchanged) on the positives and null-recording negatives above.
- **R4:** at `h = 5`, `P_fa` <= 0.05 over the null-recording negative windows and `P_d` >= 0.90 over the positives.

A miss is recorded as NOT MET and pinned by a test asserting it (not `#[ignore]`d without the value). The bars are not
loosened after a result, and no seed, recipe or window setting is changed after a result is seen.

## Not claimed

That the monitors detect interference in the field (no interference waveform is synthesised; events attenuate the
satellites' own signals, as in PRO-31); that a pass repairs R1 (it stays NOT MET); that a null recording is a clean
real recording; that the windowing handles detector memory in a continuous stream, which this design avoids rather
than solves.
