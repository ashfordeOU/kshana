<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration D8b (0.41): IQ-layer timing and campaign rows, re-campaign

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.** Every bar named here is an existing bar and is not changed, except where marked *proposed*.

## Why this row

Three IQ-layer ledger rows on monitor timing, campaign scoring and the acquisition hysteresis carry a NOT MET bar. Each
stays MODELLED and pinned. Roadmap item D8b re-runs them under their original bars. The six tracking and C/N0 rows are in
[`../d8a-iq-tracking-cn0-rerun/PREREGISTRATION.md`](../d8a-iq-tracking-cn0-rerun/PREREGISTRATION.md), whose six rules
(original bars stand; one named change per row; control first; original and fresh inputs, fresh seeds = original plus
100 000; no regressions; misses published) apply here unchanged.

## The rows

### 7. `VM-e6a6348d`: acquisition hysteresis and front-end quantiser in the jamming kind

- Registration: `docs/design/evidence/jamming-acq-agc/PREREGISTRATION.md` and its supplement 1.
- Missed: the registered hysteresis runs (the `jamming-demo` scenario at 10 to 30 dBW) were **uninformative**: every link
  was lost, so H2 and H4 were met only trivially, and the row records NOT MET for that reason.
- Change: none to the engine. The re-run asks the registered H1 to H4 on a run set that can inform them.
- **Fresh run set (fixed by rule now, before any run):** the `jamming-demo` geometry with the transmitter power on a 1 dB
  ladder over the interval where the closed-form C/N0 of the median link (the engine's documented J/S equation, computed
  by a short script from the scenario file alone, with no engine run) lies between the loss threshold minus 3 dB and the
  acquisition threshold plus 3 dB. The ladder is written into the result before the engine is run. It must not repeat any
  power of supplement 1.
- **Informativeness precondition (*proposed*):** at least **10 %** of link-epochs lie between the two thresholds. If
  not, the set is recorded as uninformative again, and the row stays NOT MET.
- Bars: H1 to H4 as registered. The quantiser and AGC bars (met) are re-run as regressions.

### 8. `VM-59bb0091`: IQ monitors in lab-replay campaigns, M3 timing clause

- Registration: `docs/design/MONITORS-IN-CAMPAIGN.md`.
- Missed: **M3** timing clause, median time to detect at most 2 x ARL1(k, h, 6 dB / sigma0) detector samples x the stride
  time: 1.001 s against 0.433 s. The CUSUM sees one C/N0 estimate per 1 s window, so the bound is below one sample.
- Change (*proposed*): the C/N0 monitor takes estimates on a stride shorter than the estimator window (named in the
  commit, with the stride value). The bar is applied as written, with the new stride time. The detection clause of M3
  and M1, M2, M4 are re-run as regressions.
- Inputs: the registered 6 recordings x 3 satellites and 6 fresh recordings (seeds plus 100 000).
- Disclosure: overlapping windows give correlated estimates, which the ARL1 formula does not assume. If the bar is met
  only because of that, the result says so; the bar is not changed either way.

### 9. `VM-6254a75d`: detection ROC from a scored campaign, R1 (also the bench's task (b) baseline)

- Registration: `docs/design/DETECTION-ROC.md`.
- Missed: **R1** `cn0_drop` AUC at least 0.95 over 18 positive and 36 negative windows (pre- and post-event windows of
  the event recordings): 0.7855. Every post-event negative inherited the CUSUM's decay from the detection.
- Change (*proposed*): the window scorer restarts the detector statistic at each scored window boundary from the state
  it would have with no event in the preceding window (named in the commit). R2 is re-run as a regression.
- Inputs: the registered recipe, seeds **300 to 305** (seen), and fresh recordings with seeds **100 300 to 100 305**
  (the plus 100 000 rule; distinct from the 0.40 null recordings, seeds 500 to 511). Negatives are pre- and post-event
  windows, as R1 defines them.
- Disclosure: the pre-event-only AUC is known to be 1.0, so if the change makes post-event windows behave like pre-event
  ones, the outcome on seeds 300 to 305 is largely known in advance. That is why the fresh seeds must meet the bar too.
- The bench's task (b) result file carries this run's numbers and verdict
  ([`xval/bench/PREREGISTRATION-0.41.md`](../../../../xval/bench/PREREGISTRATION-0.41.md), section 4).

## What a result would and would not mean

All three rows are internal consistency on Kshana's own synthetic scenes; they stay MODELLED whatever happens. A row met
on re-run says the stated change removes the stated cause of the original miss on seen and unseen inputs. It does not
say the monitors detect interference in the field: no interference waveform is synthesised in rows 8 and 9.

## Owner decisions at sign-off

1. Which rows get a change in 0.41.
2. Row 7: the informativeness precondition (10 %).
3. Row 9: accept the window-restart change, which alters the reported ROC of every campaign.

## Sign-off (3 November 2026)

Signed as proposed.
