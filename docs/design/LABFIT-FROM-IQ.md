# Lab fit from IQ campaigns (design, not built)

Status: design approved 2026-10-07; bars pre-registered in §5.1 (2026-10-07), before any fitting
code exists. Landed in the repository 2026-10-12 with its references brought up to date (§10); the
design and the §5.1 bars are unchanged. No code yet. **Target: 0.37** (estimate in §12). Build item
B7.1.

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

A campaign output directory (`docs/design/LAB-CAMPAIGN.md` §3, implemented in 0.34.0 as
`kshana::iq::campaign`):

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

*(Amended 2026-10-12, §13: `Q_eff` and `δ` are not separately identifiable; the fit estimates
`δ_eff = δ − 10·log10 Q_eff` with `Q` stated, never fitted.)*

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
starting point and the fallback. Done for 0.36 (branch `feat/d5-jammer-q-0.36`): CW and narrowband `Q = 1`, broadband and swept
`Q = 2`, pinned in the tests to the closed forms (`xval/jammer-q/PREREGISTRATION.md`).

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

**No longer blocked.** When this was written, the campaign scorer on `feat/034-campaign`
(`lockstate.rs`) had three gaps:
- it declared loss only when phase and code lock were both down;
- it had no re-acquisition;
- it hard-coded the false-lock flag.

As merged in 0.34.0, `iq/campaign/score.rs` scores lock with the tracker's own lock state. It
reports re-acquisition (`reacquired` and `reacq_time_s`, within `scoring.reacq_grace_s`) and
sets the false-lock flag from truth (`false_lock_min_epochs`, `false_lock_doppler_hz`). So
loss, J/S at loss and re-acquisition can all be fitted.

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

> **Amended 2026-10-12 (§13).** The table above is kept verbatim. The `Q_eff` clause of (a) and
> the coverage of `Q` in (b) are unattainable by construction: `Q_eff` is not identifiable from
> C/N0 data (§13.1). They are recorded as **NOT MET**, not removed. The identifiable parameter
> `δ_eff` carries its own bars, pre-registered in §13.3; (c) and (d) are unchanged.

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

1. Campaign runner merged: done in 0.34.0 (`kshana::iq::campaign`).
2. Campaign lock scoring on the track engine's lock state machine, with re-acquisition and
   false-lock: done in 0.34.0 (`iq/campaign/score.rs`, see §3.3).
3. Jammer-type Q table reconciled (B7.4): done for 0.36 (`jamming::q_factor`, §3.1).
4. This work: the C/N0 model and loader first, then the lock-model coupling, then validation.
   Not started; target 0.37 (§12).

## 11. Decisions from review (2026-10-07)

1. Fit unit: per signal × loop design × front-end chain × jammer type, never pooled.
2. Bootstrap: 1000 seeded replicates; at least 5 recordings per unit.
3. Bars: §5.1, pre-registered; the synthetic CI must meet them. They may be tightened, never
   loosened after a run.
4. Fixed-stated mode: `Q` is reported as "stated, not fitted" with its source (§3.1).
5. Ledger row as proposed in §9: MODELLED, InternalConsistency.

## 12. Implementation estimate (2026-10-12)

With items 1 to 3 of §10 done, what remains is item 4. It is larger than one day with its
validation, so it is **0.37** work, not 0.36. The parts, in build order:

| part | what it takes |
|---|---|
| loader | read `campaign.json`, the `kshana.campaign-cell/1` cells and the test-condition files by hash into fit units (§2); small, the schemas exist |
| C/N0 model (`iq::labfit::cn0`) | weighted least squares in dB over two bounded parameters with censoring, the degeneracy check and the fixed-stated mode (§3.1); new code, reuses `optim.rs` |
| threshold and times | the closed-form threshold and its direct estimate (§3.2); the lock-model coupling through §3.1 instead of the fixed-Q path (§3.3); mostly existing labfit code |
| uncertainty | the seeded cluster bootstrap (1000 replicates), percentile intervals, the residual-draw 90 % prediction intervals and leave-one-recording-out hold-outs (§4, §5.2); new |
| report | `kshana.labfit-iq/1` JSON with its CSV and Markdown views, input hashes and the `[validation]` table hash (§6) |
| surfaces | `[input] campaign` on the CLI, Python and MCP paths that already take a labfit scenario (§7) |
| validation | synthetic campaigns built from Kshana's own scenes under a stated C/N0 profile (§8). Each needs a scene and a tracked campaign, and bar (b) needs 50 of them. Their run time decides whether the CI runs all 50 or a pinned subset with the full set run before release. This and the §5.1 bars are most of the work. |

A defensible first cut (loader, C/N0 model, bootstrap, report, synthetic recovery for bar (a))
is about two days. Bars (b) to (d) and the surfaces add about two more. Nothing here changes an
existing output.

## 13. Amendment 2026-10-12: identifiability

Dated 2026-10-12, committed on its own before any fit was run on synthetic data. Found
analytically while B7.1 was being built for 0.36. Before this commit, one diagnostic tracking run
of a single synthetic recording compared its scored C/N0 bins with the imposed profile. No fit
was run, and no bar was evaluated.

### 13.1 Only `δ − 10·log10 Q_eff` is identifiable

§3.1 calls `Q_eff` and `δ` "partly degenerate when a unit spans a narrow J/S range". They are
fully degenerate at any span:

    10^((J/S + δ)/10) / (Q_eff · R_c)  =  10^(J/S/10) · κ / R_c,     κ = 10^(δ/10) / Q_eff

`(C/N0)_0` is held at each satellite's measured baseline, so the model depends on `κ` alone. Every
pair `(Q, δ)` with the same `δ − 10·log10 Q` gives the same residuals. The §3.2 closed form
depends on the same combination:
`10·log10(Q·R_c·(1/C_thr − 1/C0)) − δ = 10·log10(R_c·(1/C_thr − 1/C0)) − (δ − 10·log10 Q)`.
Under §8 a synthetic scene sees the J/S only as a C/N0 profile. A real campaign scored on C/N0
is no different. So **`Q_eff` is not identifiable from C/N0 data without an independent
measurement of the jammer and signal powers**. It is stated, never fitted.

### 13.2 What §3.1 now fits

* The fitted parameter is the identifiable offset **`δ_eff = δ − 10·log10 Q_eff`**: the J/S
  offset referred to `Q = 1`. It is computed as `δ` fitted with `Q` held at its stated value,
  minus `10·log10 Q_stated`. The report gives `δ_eff` with its interval. It also gives `δ` at
  the stated `Q`.
* `Q` is always reported **"stated, not fitted"**, with its source: the event's `q`, the type
  table (`jamming::q_factor`), or, for a type the table does not cover (including `unknown`),
  the most damaging stated value, the smallest `Q` in the table (CW, `Q = 1`). A wrong stated
  `Q` moves `δ` by exactly `10·log10(Q_true/Q_stated)` and leaves `δ_eff` and every prediction
  unchanged.
* The correlation check stays as the guard. The fit reports the correlation of the
  `10·log10 Q_eff` and `δ` estimates from the weighted Jacobian at the stated `Q`. It fits
  both only if the span is at least 8 dB **and** that correlation is below 0.999 in magnitude,
  which this model never satisfies.

### 13.3 Pre-registered bars for `δ_eff` (2026-10-12)

At least as strict as the bars they stand in for. (c) and (d) are unchanged.

| # | quantity | bar |
|---|---|---|
| a′ | recovery of `δ_eff` on a synthetic campaign whose uncensored J/S span is at least 12 dB | `|δ̂_eff − δ_eff| ≤ 0.5 dB` |
| b′ | coverage of the true `δ_eff` by its 95 % bootstrap interval | in at least 90 % (45) of 50 seeded synthetic campaigns |

The original table in §5.1 is reported beside these, with the `Q_eff` clause of (a) and the `Q`
coverage of (b) recorded as **NOT MET**, with this section as the reason.

### 13.4 How (c) and (d) are read

* **(c)** Leave-one-recording-out on the bar-(a′) campaign, interpolation items only. The 90 %
  prediction intervals are evaluated in three groups: the C/N0 bins, and the time-to-loss events
  under each of the two lock models. Each group's coverage must lie in [0.80, 0.98].
* **(d)** On the bar-(a′) campaign: for each lock model, the median of the §3.2 closed form at
  each lost event's own baseline lies within 1 dB of the median scored `js_at_loss_db`.

### 13.5 Report field names

The §6 list `units[]` is emitted as `fit_units[]`. Every Kshana result document carries a
top-level `units` block: the unit, provenance class and definition of each numeric field, which
the field-units contract (`field_schema`) audits. The report carries that block too, and the
same table is listed in `docs/field-units-schema.json` under `documents`. Each unit's C/N0
model also gives `delta_eff_db` (§13.2) beside `delta_db`.

### 13.6 Results (synthetic, 2026-10-13)

The bars were evaluated after §13.1 to §13.4 were committed (b7117bf). No bar, truth or recipe
was changed after a result was seen. The campaigns are built in `tests/iq_labfit_campaign.rs`
from Kshana's own GPS L1 C/A scenes, with the stated J/S imposed as a C/N0 profile (§8).

**The bar-(a′) campaign** (`A_SEED`):
* 6 recordings × 3 satellites (18 satellite events), baselines 42 to 48 dB-Hz;
* linear J/S ramps from 0–5 dB to 45 dB at 2.8 to 3.7 dB/s, every satellite to loss of lock;
* broadband events, so the true `Q` is the table's 2; the true `δ` is −2.828 dB, so the true
  `δ_eff` is −2.838 dB;
* scored with the campaign's default C/N0 estimator (M2M4); the uncensored span is 37 dB;
* the fit used 1000 replicates with both lock models and the hold-outs: 1579 s in a release
  build on 4 cores. The tracking took 137 to 192 s.

| bar | measured | verdict |
|---|---|---|
| §5.1 (a), `Q_eff` clause | `Q` not identifiable (§13.1) | **NOT MET** |
| §5.1 (a), `δ` clause (at the true `Q`) | error −1.097 dB | **FAIL** |
| §5.1 (b), `Q` coverage | `Q` not identifiable | **NOT MET** |
| a′ | `δ̂_eff` −3.935 dB (95 % interval −4.055 to −3.796) against −2.838: error −1.097 dB | **FAIL** |
| b′ | full set of 50 campaigns: running; result to follow | pending |
| (c) bins | PI90 coverage 0.891 over 558 interpolation bins | PASS |
| (c) time to loss, tracking-loop | 0.900 over 10 interpolation events | PASS |
| (c) time to loss, empirical | 0.900 over 10 interpolation events | PASS |
| (d) tracking-loop and empirical | closed form 35.514 dB against the direct 37.714 dB over 18 losses: 2.200 dB | **FAIL** |

The report's own `[validation]` table (the §5.2 example values) passes every bar: C/N0 hold-out
RMS 0.459 dB, PI90 coverage 0.891, and loss-time hold-out RMS 0.356 s under each lock model. A
fit reproduces byte for byte from the same campaign and seed.

**Diagnostics, run after the bars** (`diagnose_bar_a_campaign`). They change no bar.

* **(d).** The fitted drop dwell is 0.644 s, and the lost events ramp at a mean of 3.24 dB/s.
  Their product is 2.09 dB, against the measured 2.20 dB gap. As pre-registered, (d) compares the
  J/S where the modelled C/N0 crosses the drop threshold with the J/S at the declared loss, which
  is a dwell later. Under a ramp the two differ by the dwell times the ramp rate.
* **(a′).** Fitted only on bins whose measured C/N0 is at least 38 (40) dB-Hz, `δ_eff` is still
  0.89 (0.92) dB low. So the error is not only the estimator's high reading at low C/N0, which the
  diagnostic tracking run showed (+1 to +2.6 dB at 28 to 34 dB-Hz). The measured degradation is
  0.5 to 1 dB smaller than the imposed one even at 39 to 43 dB-Hz. The leading hypothesis is
  that the C/N0 estimator's averaging lags the stated-J/S time bins under a 3 dB/s ramp. It is
  not tested here: testing it needs a stepped or slower campaign, which would be a new
  pre-registration.

The failing bar tests stay strict, and are ignored with these values (the repository's
"strict, ignored with the gap" form). The ledger row states them.
