# Lab fit from IQ campaigns (design, not built)

Status: design approved 2026-10-07; bars pre-registered in §5.1 (2026-10-07), before any fitting
code exists. No code yet. Target: 0.36. Build item B7.1.

## 1. What this adds, and why

`iq labfit` (`src/iq/labfit/`, since 0.31.0) fits the open receiver's lock models to a
**receiver log** (UBX, RINEX 3, Android, NMEA) plus stated test conditions, and reports every
prediction with a hold-out error. Its input is what a device under test *reports*.

A receiver-test lab that hands over **IQ recordings** together with their test conditions
wants the same calibration done on what the **open receiver measures from the IQ**: run the
recordings through `kshana iq campaign` (loop designs × front-end chains), then fit compact
models to the campaign's per-cell results, so that a prediction for an untested condition
comes with a stated error. That is the requirement this design answers: *calibrate the
models against lab data, so that predictions carry a stated error.*

Nothing here is a statement about a commercial receiver. Every fitted number describes the
open receiver (a named loop design and front-end chain) on the recordings it was given, and is
**MODELLED**.

## 2. Inputs

A campaign output directory (`docs/design/LAB-CAMPAIGN.md` §3, on branch `feat/034-campaign`):

* `campaign.json`: the resolved campaign, input hashes and engine version;
* `cells/<key>.json`, schema `kshana.campaign-cell/1`, one per (recording × front-end chain ×
  loop design). Each satellite in a cell carries, per event: `cn0_curve` (per J/S bin: `js_db`,
  `n`, `measured_cn0_dbhz`, `measured_degradation_db`), `baseline_cn0_dbhz`, `locked_at_onset`,
  `lost`, `time_to_loss_s`, `js_at_loss_db`, `reacquired`, `reacq_time_s`, the event `type`
  (jammer type as stated) and the stated `q` and `q_source`;
* the recordings' test-condition files (`kshana.test-conditions/1`) by hash, for the stated
  power profile of each event.

The fit reads only these files. It never reruns the receiver, so a fit is reproducible from a
campaign `DIGEST` alone.

**Fit unit.** One fit is made per *unit* = (signal, loop design, front-end chain, jammer type).
Recordings and satellites are the data inside a unit. Units are never pooled across loop
designs or front-end chains: those are what the lab wants compared.

## 3. What is fitted, and the model forms

### 3.1 C/N0 degradation against J/S: effective Q and a level offset

For each unit, the measured C/N0 against stated J/S is fitted with the spectral-separation
form the campaign already draws as its MODELLED reference:

    (C/N0)_eff = [ 1/(C/N0)_0  +  10^((J/S + δ)/10) / (Q_eff · R_c) ]^-1

* `(C/N0)_0`: each satellite's measured baseline (the cell's `baseline_cn0_dbhz`), not fitted;
* `R_c`: the code chip rate of the signal, stated;
* **fitted:** `Q_eff`, the effective spectral-separation factor of this jammer type through
  this front-end chain and loop design (dimensionless, bounded to [0.1, 10]); and `δ`, a J/S
  calibration offset in dB (bounded to ±10 dB), shared by the unit, which absorbs a stated-power
  calibration error.

The objective is weighted least squares on `measured_cn0_dbhz` in dB, each bin weighted by its
`n`. A bin enters only when the satellite was locked for at least 90 % of the bin's epochs: C/N0
is measured only while locked, so bins near loss of lock are biased high and are **censored**,
not fitted. The censored bins are listed in the report.

`Q_eff` and `δ` are partly degenerate when a unit spans a narrow J/S range. The fit reports
their correlation, and with fewer than 8 dB of uncensored J/S span it fixes `Q` at the stated
value (`jamming::q_factor`) and fits `δ` alone. In that mode the report gives `Q` as **"stated,
not fitted"** with its source (the type table or the event's `q`), never as a fitted value and
never with an interval.

Prerequisite: the jammer-type Q table must be reconciled first (`src/jamming.rs` against the
spectral-separation values already VALIDATED in `spectrum`), because the stated `Q` is both the
starting point and the fallback.

### 3.2 Tracking threshold J/S

The J/S at which a satellite loses lock in this unit. Two estimates, reported side by side:

* **direct:** the distribution of `js_at_loss_db` over events that lost lock under a ramped
  J/S (median and spread); and
* **via the lock model:** the existing labfit lock models (`model.rs`: `tracking-loop` and
  `empirical`) with the run's stated level converted to C/N0 through §3.1, instead of through the
  fixed-Q path `level_kind = "js"` uses today. The threshold then follows in closed form from the
  fitted drop C/N0 `C_thr`:

      (J/S)_thr = 10·log10( Q_eff · R_c · (1/C_thr − 1/(C/N0)_0) ) − δ

  so it is stated per baseline C/N0, not as one number.

### 3.3 Loss and re-acquisition times

`time_to_loss_s` and `reacq_time_s` are fitted by the lock models' two confirmation dwells
(drop and re-lock), exactly as labfit fits event times from logs today (bounded least squares,
grid then Nelder-Mead, `optim.rs`).

**Blocked in part.** The campaign scorer on `feat/034-campaign` (`lockstate.rs`) declares loss
only when phase and code lock are both down, has no re-acquisition, and hard-codes the false-lock
flag. Until the campaign scores lock with the track engine's own lock state machine, only loss
time and J/S at loss are fitted; re-acquisition is reported as `not fitted: the campaign reports
no re-acquisition`.

## 4. Uncertainty: a cluster bootstrap and stated prediction intervals

The independent unit is the **recording**: satellites in one recording share the jammer, its
geometry and the front end, so their errors are correlated. The bootstrap therefore resamples
recordings with replacement (a cluster bootstrap), refits, and repeats. It is seeded (default
1000 replicates), so every interval is reproducible.

* **Parameters:** percentile 95 % intervals for `Q_eff`, `δ`, the lock-model parameters and
  the dwells, with the replicate count and the number of replicates that failed to fit.
* **Predictions:** every prediction for a condition is a **90 % prediction interval**, not a
  confidence interval for the mean: each bootstrap replicate predicts the condition, then adds a
  residual drawn from that replicate's own training residuals (for that quantity and unit). The
  interval is the 5th to 95th percentile of those draws. For a loss/no-loss question the report
  gives the fraction of replicates that predict a loss.
* **Minimum data:** a unit with fewer than 5 recordings is reported `insufficient data: not
  fitted`, with its counts. No interval is drawn from fewer.

Every prediction keeps labfit's existing label rules: `PREDICTION`, the nearest tested
recording, and the distance outside the tested condition box, with `extrapolation` stated when
the condition lies outside it.

## 5. Validation with pre-registered bars

### 5.1 Bars for the synthetic campaigns (pre-registered 2026-10-07)

These bars are fixed here, in this commit, before any fitting code is written. The synthetic
truth is known, so the synthetic CI runs **must** meet every one of them. They may be tightened
later; they are never loosened after a run.

| # | quantity | bar |
|---|---|---|
| a | parameter recovery on a campaign whose uncensored J/S span is at least 12 dB | `|δ̂ − δ| ≤ 0.5 dB` and `Q̂_eff` within ±20 % of the true `Q` |
| b | coverage of the true parameters by their 95 % bootstrap intervals | in at least 90 % of 50 seeded synthetic campaigns |
| c | leave-one-recording-out coverage of the 90 % prediction interval, interpolation bins and events | between 80 % and 98 % |
| d | threshold J/S from the closed form (§3.2) against the direct `js_at_loss_db` estimate | within 1 dB |

### 5.2 Hold-out procedure and the bars of a real study

**Split.** Leave-one-recording-out within each unit: fit on all other recordings, predict the
held-out recording's bins and events, record the errors and whether the held-out condition was
interpolation or extrapolation.

**Pre-registration.** The labfit scenario gains a `[validation]` table, written before the
campaign results are read:

```toml
[validation]
registered = "2026-10-20"            # stated date; the commit that adds this table is the record
cn0_rms_db_max = 1.0                 # hold-out RMS of C/N0 prediction, interpolation bins
pi90_coverage = [0.80, 0.98]         # fraction of held-out bins inside their 90 % PI
loss_time_rms_s_max = 2.0            # hold-out RMS of time to loss, interpolation events
```

The report records the SHA-256 of this table and of the campaign `DIGEST`, evaluates each bar
on interpolation hold-outs only (extrapolation errors are reported, never gated), and prints
PASS or FAIL per bar. A fit run with `mode = "validation"` refuses to start without the table.
Changing a bar after the results exist is visible as a new table hash; the report states which
hash was evaluated. The numbers in the example table are illustrative: a real study registers
its own bars in its own table before its data is opened, and they are at least as strict as §5.1
where the quantities coincide.

## 6. Output: `kshana.labfit-iq/1`

The report is JSON, with CSV and Markdown views, as labfit's is today:

```text
schema               "kshana.labfit-iq/1"
engine_version       version that ran the fit
inputs               campaign DIGEST, campaign.json sha256, every cell key + sha256,
                     every test-conditions sha256, labfit scenario sha256
units[]              signal, design {name, hash}, frontend {name, hash}, jammer_type
  data               recordings, satellites, events, bins used, bins censored (listed)
  cn0_model          Q_eff, delta_db: {estimate, ci95, boot_n, boot_failed},
                     corr(Q_eff, delta), q_mode ("fitted" | "fixed-stated"), residual_rms_db
  threshold          direct {median_js_db, iqr}, via_model {per baseline C/N0}
  lock_model[]       tracking-loop | empirical: params {estimate, ci95}, residual_rms_s
  reacq              fitted | "not fitted: <reason>"
  holdout            per recording: interpolation | extrapolation, distance, errors
  validation         table sha256, bars, values, PASS/FAIL per bar (interpolation only)
predictions[]        unit, condition, quantity, value, pi90 [lo, hi], p_loss,
                     label "PREDICTION", nearest_recording, extrapolation_distance
label                "MODELLED"
```

Residuals and predictions are also written as CSV, one row per bin or event with its cell key,
and a Markdown summary is generated from the JSON (it is never hand-edited).

## 7. Surfaces

* CLI: `kshana iq labfit <scenario.toml>`, where the scenario's `[input]` names either `runs`
  (the existing receiver-log path, unchanged) or `campaign = "<out-dir>"` (this design).
* Python: `kshana.iq_labfit(toml)` accepts the same scenario; no new function.
* MCP: the existing labfit tool takes the same scenario. Only paths inside its work directory are
  accepted, as for the campaign tool.
* Rust: `iq::labfit::campaign` reads cells and conditions into the existing `LabRun`-like
  structure for the lock models; the C/N0 model is new (`iq::labfit::cn0`).

The engine is data-agnostic: it fits whatever campaign it is pointed at. What it is pointed at
in this repository is governed by §8.

## 8. Synthetic only, until third-party data is cleared

Until the use of a third party's recordings is cleared, this work is **synthetic only**:

* every test, fixture, example and documentation figure uses campaigns built from Kshana's own
  scenes; no third-party recording, or anything derived from one, enters this repository, its
  CI or its published site;
* the synthetic campaigns carry **legitimate GNSS signals only**. A test that needs a C/N0
  reduction under a stated J/S imposes it as a stated **C/N0 profile** on the scene, computed from
  the §3.1 formula with known `Q` and `δ`. No jammer waveform is synthesised for this work, and
  the IQ layer stays as `docs/design/GNSS-IQ-PLAN.md` scopes it;
* the synthetic validation is the parameter-recovery check labfit already uses: known `Q`, `δ`,
  thresholds and dwells in, the fit must recover them within its own bootstrap intervals, and
  the §5 hold-out bars must pass on the synthetic campaign;
* the real-data calibration study (build item B7.2) is a separate, pre-registered study run
  outside this repository once cleared. Its result would enter the ledger as its own row.

## 9. Validation basis and ledger

Proposed ledger row, for the release owner's ledger PR when this is built:

| field | value |
|---|---|
| requirement | Calibration of the open receiver's C/N0 and lock models to IQ campaign results, with stated prediction error |
| status | MODELLED |
| oracle kind | InternalConsistency (synthetic parameter recovery; hold-out bars on synthetic campaigns) |
| tests | `tests/iq_labfit_campaign.rs` (to be written): recovery of known `Q_eff`, `δ`, thresholds and dwells; PI coverage on synthetic hold-outs; censoring; cluster bootstrap reproducibility |

It cannot be VALIDATED from synthetic data: the fit method is checked, not any receiver.

## 10. Dependencies and order

1. Campaign runner merged (`feat/034-campaign`, planned for 0.34).
2. Campaign lock scoring on the track engine's lock state machine, with re-acquisition and
   false-lock (needed for §3.3 re-acquisition; §3.1 and the loss part of §3.3 do not wait).
3. Jammer-type Q table reconciled (B7.4).
4. This work: the C/N0 model and loader first, then the lock-model coupling, then validation.

## 11. Decisions from review (2026-10-07)

1. Fit unit: per signal × loop design × front-end chain × jammer type, never pooled.
2. Bootstrap: 1000 seeded replicates; at least 5 recordings per unit.
3. Bars: §5.1, pre-registered; the synthetic CI must meet them. They may be tightened, never
   loosened after a run.
4. Fixed-stated mode: `Q` is reported as "stated, not fitted" with its source (§3.1).
5. Ledger row as proposed in §9: MODELLED, InternalConsistency.
