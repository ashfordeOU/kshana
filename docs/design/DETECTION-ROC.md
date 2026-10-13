# Detection ROC from a scored campaign (PRO-32)

Status: design and pre-registered bars, 2026-10-13. Committed on its own before any code for it
exists and before any bar below is evaluated. Builds on `MONITORS-IN-CAMPAIGN.md` (PRO-31).
Open core (`src/iq/campaign`).

## 1. What this adds

A campaign with `[monitors]` (PRO-31) scores each alarm at the configured threshold. An ROC
needs the statistic below the threshold too. Each cell's `monitors` block therefore also keeps,
per alarm kind and channel, the **maximum of the monitor's own test statistic** over windows:

* **Positive windows:** each stated event, `[onset, offset + detect_grace_s]`, for the kinds
  and channels the event can affect.
* **Negative windows:** the time outside every relevant event window, after the monitor's
  baseline, tiled into consecutive windows of `roc_window_s` (a new `[monitors]` setting,
  default 5 s). A trailing piece shorter than half a window is dropped.

The statistics, as each monitor tests them:

| kinds | statistic |
|---|---|
| power | departure of the block power from its baseline (dB): above for `power_rise`, below for `power_drop` |
| `spectral_excess` | the largest per-bin excess over the baseline PSD (dB) |
| `kurtosis` | the kurtosis z-score |
| SQM | `|z|` of the averaged metric |
| C/N0 | the CUSUM statistic (`g⁻` for `cn0_drop`, `g⁺` for `cn0_rise`) |

The campaign report (`report::build`) pools the windows of every cell by alarm kind. Sweeping
the threshold over the pooled maxima gives the empirical ROC, one point per distinct value. It
reports the area under it (AUC, trapezoidal) and the operating point at the configured
threshold. It writes `roc.json`, and adds a "Detection ROC" section to `report.html`: one curve
per kind, with a table of positives, negatives, AUC, `P_d` and `P_fa` at the configured
threshold. A campaign without monitors writes neither, and its report is unchanged.

This is a window-level ROC: `P_fa` is per negative window of `roc_window_s`, not per test. It
is MODELLED. It describes the open receiver's monitors on the recordings given.

## 2. Pre-registered bars (synthetic, 2026-10-13)

The campaigns are built in `tests/iq_campaign_roc.rs`, before any bar is run, from Kshana
scenes of GPS L1 C/A signals only. Positive events attenuate the satellites' own signals, as in
PRO-31. No interference waveform is synthesised. A miss is recorded as NOT MET, never loosened.

| # | quantity | bar |
|---|---|---|
| R1 | `cn0_drop` ROC: 6 recordings × 3 satellites; each satellite attenuated by 6 dB for 6 s in one stated event; default monitors, `roc_window_s = 6`. | AUC ≥ 0.95 |
| R2 | A null campaign: the same recipe, but the stated events attenuate nothing (0 dB). | For `cn0_drop`, `sqm_delta` and `power_drop` (power on, defaults), `|AUC − 0.5| ≤ 0.2`: the windowing does not make an ROC out of nothing. |

## 3. Results (synthetic, 2026-10-13)

Run after §2 was committed (b47e358d), in release on 4 cores: about 6 minutes for the two
campaigns. No bar, recipe or setting was changed after a result was seen.

| bar | measured | verdict |
|---|---|---|
| R1 | `cn0_drop` AUC 0.7855 over 18 positive and 36 negative windows; at the configured threshold `h = 5`, `P_d` 1.0 and `P_fa` 0.5 | **NOT MET** |
| R2 | AUC `cn0_drop` 0.5000, `sqm_delta` 0.5664, `power_drop` 0.6389 (6 positive and 18 negative windows) | MET |

Why R1 is missed, from the stored windows after the run: each satellite has two negative
windows, one before its event and one after. All 18 pre-event windows have a CUSUM maximum of
0. All 18 post-event windows reach 81 or more: the statistic decaying after the attenuation it
had just detected. A negative window next to an event inherits a detector's memory. The alarm
scoring of PRO-31 is not affected: an alarm already open does not fire again, and M4 counted no
false alarm. Against the pre-event negatives alone the AUC would be 1.0. That is a post-hoc
observation, not a bar.

A guard interval after each event, excluded from the negatives, would remove this. It would be
a new pre-registration. `r1_the_cn0_drop_roc_separates_6_db_attenuations` stays strict and is
ignored with these values. R2 runs in the release CI job.

