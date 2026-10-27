# Pre-registration (EXPLORATORY): task (a), a folder-clustered bound on the `agc_k_sigma` AUC

**Status: SIGNED OFF by the owner on 24 Oct 2026 (below). Nothing has been run for it as of the sign-off commit.**

This is a new bar, **A3**. It does not replace, change or reinterpret **A2** or any figure in `RESULTS-v2.md`:
A2 (`agc_k_sigma` AUC >= 0.80 on the `test` split of spec 2.0.0) was measured at 0.766, is NOT MET, and stays
NOT MET and pinned by `a1_a2_receiver_log_baselines_on_jammertest_2024`.

## Why a new bar

`RESULTS-v2.md` says a split's score is the behaviour of a handful of events (two test jamming folders). A2 therefore
cannot say whether `agc_k_sigma` reaches 0.80 as a property of the detector on this archive, or only on one split.
A3 asks that question directly, with the uncertainty that comes from having only 14 evaluable folders.

## What was seen before this was written (disclosed)

- Everything in `RESULTS-v1.md` and `RESULTS-v2.md`: pooled AUC 0.933, dev 0.981, test 0.766, holdout 0.9996.
- The 14 evaluable folders and their strata (7 jamming, 7 other) and which split each lands in.
- All 14 folders are public. **There is no unseen data for A3**: it is evidence about this archive and this receiver
  type (u-blox ZED-F9P) only, not unseen-data performance.
- NOT seen: any folder-clustered bootstrap, leave-one-folder-out or per-folder AUC of `agc_k_sigma`.

## Fixed before any run

- **Data:** the JammerTest 2024 archive of `RESULTS-v1.md` (SHA-256 73e78934...b313), the 14 evaluable folders by
  the spec 2.0.0 rule. All splits are pooled; the dev/test/holdout assignment is not used.
- **Detector:** `agc_k_sigma` at the 0.35 defaults, the score of `bench baseline` unchanged.
- **Labels:** the task (a) truth rule of the spec, unchanged (scheduled-slot truth; every detection probability a
  lower bound).
- **Metric:** pooled AUC (jamming epochs against clean epochs) over the epochs of the resampled folders.
- **Resampling:** folder-clustered bootstrap, B = 2000 replicates. Each replicate draws 7 jamming folders with
  replacement from the 7 jamming folders and 7 other folders with replacement from the 7 other folders (the strata
  of the 2.0.0 split rule), and pools their epochs. ChaCha8, seed 4001. A replicate whose pooled sample has no
  jamming epoch or no clean epoch cannot occur (every other folder is clean-only and every jamming folder has
  jamming epochs; the strata are kept).
- **Interval:** the 2.5 % and 97.5 % empirical quantiles of the 2000 AUCs (percentile method, rank
  `floor(0.025 * B)` and `ceil(0.975 * B)` of the sorted values).

## Bar

- **A3:** the 2.5 % quantile of the folder-clustered bootstrap AUC of `agc_k_sigma` is >= 0.80.

A miss is recorded as NOT MET and pinned by a test that asserts it. The bar is not loosened after a result.

## Reported without a bar (descriptive)

The point estimate on the original 14 folders (expected to equal the recorded pooled 0.933 within 0.0005, as in A1),
the 97.5 % quantile, and the leave-one-jamming-folder-out AUCs (pool of the other 6 jamming folders and all other
folders). These are not bars and are not used to change A3.

## Not claimed

That `agc_k_sigma` works outside this event and receiver; that the bootstrap over 14 folders is a population
statement; that a pass makes A2 met. Two strata of 7 folders is a small number of clusters and the interval is
wide by construction.

## Owner sign-off

24 Oct 2026, verbatim: "All three, A3/D3 exploratory". Marked EXPLORATORY: cannot close A2/D1; evidence about this archive only.

The bars above are fixed from this commit. No bar, seed, recipe or setting changes after a result is seen.
