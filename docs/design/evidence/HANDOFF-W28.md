# Handoff: W28 on `feat/iq-ext-0.36` (2026-10-14)

## State

- **WP-11b is complete on this branch.** Each item's pre-registration, result commits and
  verdict are in [`WP-11b-SCOPE.md`](WP-11b-SCOPE.md). PRO-38 is recorded there as a duplicate
  of CAP-07.
- **Heads:**
  - `feat/iq-ext-0.36`: this commit's branch. Its previous head was fecc6019 (DS-LOOP-05).
  - `feat/iq-campaign-ext-0.36`: 60f026ac (the IQ campaigns plus the wasm fix, in integration
    batch 1).
- **Ledger** on this branch: 309 rows, 148 VALIDATED, 157 MODELLED, 4 PARTNER.
- **Gates** before every push:
  - fmt, and clippy `-D warnings` for default, python, wasm and otlp;
  - the doc syncs and the item's tests;
  - `cargo build --lib --release --target wasm32-unknown-unknown --features wasm`;
  - the MCP round trips in a separate `CARGO_TARGET_DIR`;
  - `scripts/check-no-attribution.sh`.

  The only known red is `scenario_count_doc_sync` (web copies, site worker).
- **Security fix:** `[terrain] dem_hgt` (CAP-06b) is in `inline_only::FILE_SOURCE_KEYS`, and
  the file-source guard now flags fields ending in `_hgt`. See this branch's commit "refuse
  `[terrain] dem_hgt` on inline surfaces".

## Held, on the coordinator's or owner's word

- **E5b/AltBOC victim powers:** HOLD, with the owner (see
  `docs/revisions/CAP12-galileo-icd21-power-changes.md` §1, "Not changed").
- **Site copies** (`web/`): leave them; the final run re-ports them.
- **The 37644ad0 rc merge:** keep it. Merge no further rc SHAs into this branch.

## Next: the labfit follow-up (registered, not started)

The pre-registration is [`labfit-followup/PREREGISTRATION.md`](labfit-followup/PREREGISTRATION.md),
committed alone. No code or run exists for it yet.

- **Hypotheses.**
  - HA: the 1.1 dB `δ_eff` error of §13.6 is the C/N0 estimator lagging a 3 dB/s ramp.
  - HD: the 2.2 dB (d) gap is the declared loss coming one drop dwell after the threshold
    crossing.
- **Campaigns** (seeds fixed in the registration):
  - S, stepped, seed 2026_1014: 3 dB steps held 4 s, stated as a `step` profile in the
    conditions file, with the scene imposing the same steps.
  - R, a fresh ramp, seed 2026_1015: exactly `recipe(seed, 6)`.
- **Bars.**
  - S1: δ_eff within 0.5 dB on S, if the span is at least 12 dB.
  - S2: (d) as written on S, with at least 5 losses.
  - R1: (d) on R with the fitted drop dwell × each event's ramp rate added to the closed form.
  - Replications: a′ and (d) as written on R.
- **How to build it.**
  - Add a new test file next to `tests/iq_labfit_campaign.rs`.
  - Reuse its `build_campaign`, `recipe`, `truth_of`, `scene` and `conditions`, which may need
    to become `pub` or be copied. Give `RecSpec` a step option: `js(t)` piecewise-constant, and
    the conditions writer emitting `interpolation = "step"` with one point per step.
  - Fit as the bar-(a′) fit: 1000 replicates, both lock models.
  - For R1, take the per-event ramp rate and the fitted drop dwell as
    `diagnose_bar_a_campaign` does.
  - The campaigns are heavy: each build and track takes minutes, and a fit with 1000 replicates
    took about 26 min for A_SEED on 4 cores. Run them in release, with `--ignored`.
- **Recording.** Record the verdicts in a `RESULTS.md` beside the registration. Misses get tests
  that assert the recorded verdict, not `#[ignore]`.
