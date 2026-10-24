# Results: the 0.40 re-campaign (A3, D3, R3 and R4)

Pre-registrations: `PREREGISTRATION-0.40-A2.md` (A3), `PREREGISTRATION-0.40-D1.md` (D3) and
`PREREGISTRATION-0.40-R1.md` (R3 and R4), each with the owner's sign-off recorded in its own commit before any run
(A3 dfdbd8ba, D3 a0f2f354, R3/R4 2c44424a; owner, 24 Oct 2026: "All three, A3/D3 exploratory"). One run of each, as
registered; no bar, seed, recipe or setting changed after a result was seen. All figures are MODELLED.

**A2, D1 and R1 are untouched: they stay NOT MET** in `RESULTS-v2.md` and `docs/design/DETECTION-ROC.md` and stay
pinned by their tests. Nothing below closes them.

| bar | measured | verdict |
|---|---|---|
| **A3 (EXPLORATORY)** the 2.5 % quantile of the folder-clustered bootstrap AUC of `agc_k_sigma` >= 0.80 | 2.5 % = 0.8502, 97.5 % = 0.9995, median 0.9377; point estimate 0.9332 (equals the recorded pooled 0.933) | MET |
| **D3 (EXPLORATORY)** at scale 0.25 on `test`, at least one detector has `optimism_gap` > 0.05 | gaps 0.0961 (`agc-excess`), 0.0860 (`energy`), 0.0704 (`fused`), 0.0494 (`parity`), 0.0187 (`sqm`): three of five exceed 0.05 | MET |
| R3 `cn0_drop` AUC >= 0.95 on the 18 event windows against null-recording windows | AUC 1.0 | MET |
| R4 at h = 5, P_fa <= 0.05 and P_d >= 0.90 | P_fa 0.0, P_d 1.0 | MET |

## What each result does and does not say

- **A3 (EXPLORATORY; cannot close A2/D1; evidence about this archive only).** Pooled over the 14 evaluable folders
  and resampled by folder within the two strata, the AUC of `agc_k_sigma` stays above 0.80 in 97.5 % of resamples.
  This does not say A2 is met: A2 (0.766 on the two-folder test split) is NOT MET and is a different question. All
  14 folders are public; this is not unseen-data performance, and 7 + 7 clusters is a small number. The
  leave-one-jamming-folder-out AUCs (0.917 to 0.988) are descriptive. The archive was downloaded and checked against
  its SHA-256 (73e78934...b313) before the run. Two harness slips were fixed before the run produced output (a wrong
  enum variant and folders without scored epochs missing from the per-folder map); the protocol was not touched.
- **D3 (EXPLORATORY; the scale was chosen after D1 missed).** At scale 0.25 the benchmark separates detectors that were
  indistinguishable at 0.5, but that is a larger shift on a model-derived corpus, not a finding about detectors in the
  field. `auc_in` agrees with the D1 run (0.848, 0.595, 0.882, 0.682, 0.998). The `parity` gap of 0.0494 sits just
  under the tolerance.
- **R3 and R4.** Window counts at run time: 18 positive and 108 negative (as registered). Every one of the 108
  null-recording windows has a CUSUM maximum of 0 and every event window reaches 86 or more against the threshold of
  5, so the separation is complete and the bars were not close. That is the weakness of this design, stated in
  advance: with no event in the recording nothing can leave detector memory, so these bars show the monitor does not
  alarm on noise-only scenes and does alarm on a 6 dB attenuation, not that the R1 windowing problem is solved. R1
  (`cn0_drop` AUC 0.7855 against pre- and post-event negatives of the event recordings) remains NOT MET.

## Pins

`tests/bench_0_40.rs` (A3 from the stored output of `examples/bench_a3.rs`, because the archive is never vendored;
D3 live) and `tests/iq_campaign_roc_0_40.rs` (R3 and R4, release only). A2, D1 and R1 keep their existing pins.
