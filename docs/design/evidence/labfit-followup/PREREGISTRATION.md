# Lab fit from IQ campaigns, follow-up: a stepped-J/S campaign and a dwell-corrected (d)

Written and committed **before** any of the code below exists and before any run. It follows
`docs/design/LABFIT-FROM-IQ.md` §13.6 (the synthetic results of 2026-10-13):
- Bar (a′) failed: `δ̂_eff` was 1.10 dB low.
- Bar (b′) failed for the same offset.
- Bar (d) failed: 2.20 dB.

§13.6 leaves two hypotheses untested, and this registration tests them. **Nothing in §13 is
changed:** the bars of §13.3 and §13.4 and their verdicts stand.

## The two hypotheses

- **HA (estimator lag).** The 1.1 dB `δ_eff` error comes from the C/N0 estimator's averaging
  lagging the stated-J/S time bins under a 3 dB/s ramp. If so, a campaign whose J/S is held
  constant long enough for the estimator to settle should recover `δ_eff` well.
- **HD (dwell).** The 2.2 dB (d) gap is the declared loss coming one drop dwell after the
  threshold crossing, on a ramp. If so:
  - a stepped campaign, where the J/S is constant across the dwell, should pass (d) as written;
  - on a ramp campaign, adding the fitted drop dwell × each lost event's own ramp rate to the
    closed form should close the gap.

  The correction was conceived after seeing §13.6's diagnostic (0.644 s × 3.24 dB/s = 2.09 dB
  against 2.20 dB). So it is tested here only on a **new** ramp campaign whose seed is fixed now.

## The campaigns (fixed now)

Both use the machinery of `tests/iq_labfit_campaign.rs`, unchanged:
- GPS L1 C/A scenes at 2.5 MS/s, three satellites per recording, baselines 42 to 48 dB-Hz;
- broadband events (`Q = 2`), with the truth `δ` drawn as in `truth_of(seed)`;
- scored with the campaign default estimator (M2M4);
- fitted with 1000 replicates, both lock models and the hold-outs, exactly as the bar-(a′) fit.

- **S (stepped), seed 2026_1014, 6 recordings.** As `recipe(seed, 6)`, except that the J/S runs
  from `js0` to 45 dB in **3 dB steps, each held 4 s**. The conditions file states it as a
  `step` profile with one point per step. Then it holds 1 s and ends, with 6 s after, as
  before. The scene imposes the same step profile.
- **R (ramp, a fresh draw), seed 2026_1015, 6 recordings.** Exactly `recipe(seed, 6)`: the
  bar-(a′) recipe, with linear ramps.

## Bars

- **S1 (HA: `δ_eff` on the stepped campaign).** `|δ̂_eff − δ_eff| ≤ 0.5 dB`, the §13.3 (a′) bar.
  It applies only if the uncensored J/S span is at least 12 dB, as there. Otherwise S1 is NOT
  MET (uninformative).
- **S2 (HD: (d) on the stepped campaign, as written).** For each lock model, the median of the
  §3.2 closed form at each lost event's own baseline lies within **1 dB** of the median scored
  `js_at_loss_db`. That is §13.4 (d), unchanged. At least 5 losses are required; otherwise S2 is
  NOT MET (uninformative).
- **R1 (HD: dwell-corrected (d) on the fresh ramp campaign).** For each lock model, take the
  closed form at each lost event's own baseline **plus that model's fitted drop dwell × the
  event's own stated ramp rate** (dB/s, from its conditions file). The median of that must lie
  within **1 dB** of the median scored `js_at_loss_db`. At least 5 losses are required.

Reported beside the bars, as replications, not bars:
- (a′) and (d) as written, on campaign R. §13.6 predicts a miss of about 1.1 dB and about
  2.2 dB.
- The per-step settled bias of the measured C/N0 on campaign S: its median minus the imposed
  value, over bins at least 1.5 s after each step, in 3 dB-Hz bands of the imposed C/N0.

## What the outcomes mean

- If S1 is met: HA is supported. The ramp campaigns' `δ_eff` error is a test-design artefact,
  and a lab campaign should hold each J/S level.
- If S1 misses: something other than the lag biases `δ_eff`, and the per-step bias shows where.
- If S2 and R1 are both met: HD is supported, and (d) as written mixes up the threshold
  crossing with the declared loss on ramps.

None of these would change a verdict of §13.

## Out of scope

Q identifiability (§13.1), NWPR, real recordings, and any change to the fit or the scorer.
