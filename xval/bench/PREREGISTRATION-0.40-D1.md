# Pre-registration (DRAFT, awaiting owner sign-off): task (d), the optimism gap on the second track (scale 0.25)

**Status: DRAFT. Not committed as a registration until the owner signs it off. Nothing has been run for it.**

This is a new bar, **D3**. It does not replace, change or reinterpret **D1** or `RESULTS-v1.md` / `RESULTS-v2.md`:
D1 (some detector has `optimism_gap > 0.05` on `test` at severity scale 0.5) was measured at a largest gap of
0.0301 (`energy`), is NOT MET, and stays NOT MET and pinned by
`d1_is_not_met_no_detector_exceeds_the_optimism_tolerance_on_the_test_split`.

## Why a new bar

`RESULTS-v1.md` states that the second track (scale 0.25) is defined in `SPEC.md` section 3 but was not scored,
"because choosing it after D1 missed would be a post-hoc search for a result; a later spec minor version may register
it with its own bar". This draft is that registration. The honest caveat is in the choice itself: the scale is
chosen knowing D1 missed at 0.5.

## What was seen before this was written (disclosed)

- The D1 result: all five detectors lose at most 0.030 AUC at scale 0.5 on `test`
  (`RESULTS-v1.md` table: gaps 0.030, 0.030, 0.001, 0.010, 0.015).
- **Not seen:** any `auc_out` at scale 0.25 for any detector, on any split. Before sign-off the owner should
  confirm that no scale-0.25 score was computed in any session or by any user, as the draft assumes.
- The scale 0.25 itself was the pre-existing second track of the spec, not a value tuned to a result. It is the
  only scale registered here; no other scale will be tried.

## Fixed before any run

- **Data:** the `impairment-eval` corpus of the spec: in-distribution at severity 1.0, out-of-distribution with every
  impairment severity scaled by **0.25**. Split `test`, seed 2000 for both corpora, 1,000 cases in and 1,000 out per
  detector, exactly as D1 at 0.5. The `holdout` stays sealed and is not used. `dev` is not used.
- **Detectors:** the five transparent baselines (`energy`, `agc`, `sqm`, `parity`, `fused`) unchanged.
- **Metric:** `optimism_gap = auc_in - auc_out`; `auc_in` is the same as in D1.

## Bar

- **D3:** on `test` at scale 0.25, at least one of the five detectors has `optimism_gap > 0.05`.

Same tolerance as D1 (0.05). A miss is recorded as NOT MET and pinned by a test asserting it; the bar is not
loosened and no further scale is scored afterwards under this registration.

## Reported without a bar

The five `auc_out` values and gaps, and the gap at scale 0.5 beside them (already recorded). If D3 is met, that says
the benchmark discriminates at a stronger shift on this corpus; it does not say any detector is optimistic in the
field.

## Not claimed

That the corpus is representative (it is a separability and pipeline check, labels are model-derived); that a pass
changes D1; that gap > 0.05 means a detector is bad rather than that scale 0.25 is a larger shift.
