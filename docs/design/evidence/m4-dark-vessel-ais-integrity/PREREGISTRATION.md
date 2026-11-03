# M4: dark vessels and AIS integrity: pre-registration

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.**
Numbers marked *proposed* are for the owner to fix at sign-off. After that, bars may be tightened
after a run, never loosened. A miss is recorded in `RESULTS.md` with its numbers, and its test
asserts the recorded miss. Public sources only; the scored data are synthetic.

## Why this row

Roadmap row M4. AIS is a cooperative safety system: a vessel broadcasts its own identity and
GNSS position. Its integrity matters for collision avoidance and traffic monitoring, and it can
fail in several ways: the transponder is off or not fitted (no AIS from a vessel that is
radiating other signals), the broadcast position is wrong (a faulty or interfered GNSS
receiver, or a deliberately altered report), or the identity is inconsistent (two vessels using
one identity, one identity appearing in two places). An independent RF fix of the same vessel,
as a space RF survey would provide, lets these cases be checked. M4 builds the association
logic and scores it where the truth is known exactly: a synthetic set with labelled cases.

**Exists:** the AIS reader and its five per-cell anomaly detectors (positions on land, circular
tracks, implausible jumps, implausible speeds, many vessels at one position;
`src/interference_map/ais.rs`, pre-registered parameters `AisParams::PREREGISTERED_V1`); the
maritime trust score and its monitors (`src/receiver_trust/`). **Missing**, built after this
file is committed: association of RF fixes with AIS tracks, and per-vessel integrity decisions.

## The synthetic truth set (generator fixed now)

**Area and time.** The M2 Baltic area (its grid rule and masks), a scene of 6 h.

**Vessels.** 2 000 vessels per scene (*proposed*), start positions uniform over the area's sea
points, speeds uniform in 5–22 kn, motion as constant-velocity legs of 20–90 min (uniform)
joined by coordinated turns of ±10–90° (uniform) at 1–3°/s. A vessel that would cross land is
redrawn.

**AIS.** Each AIS-carrying vessel reports its position every 10 s while under way (class A
nominal), each report received with probability 0.8 (independent; models reception loss).
Position noise 10 m per axis.

**RF fixes.** RF fixes of every vessel (dark or not) arrive at the epochs of the M2 primary
16-satellite RF layer's accesses to the vessel's position, one fix per access, with normally distributed
noise `σ_fix = 1 km` per axis (*proposed*; the same value as M3), detection probability 0.9 per
access.

**Labelled cases.** Each vessel gets exactly one label, drawn with these shares (*proposed*):

| Label | Share | Definition |
|---|---|---|
| NORMAL | 80 % | AIS on throughout; reported position = true position |
| DARK | 7 % | No AIS report at all during the scene; RF fixes as for any vessel |
| GAP | 3 % | AIS off for one interval of 30–120 min (uniform), on before and after |
| POSITION-OFFSET | 7 % | From an onset time (uniform in the scene's first 4 h), reports are the true position plus a constant offset of length `d ∈ {2, 5, 10, 20, 50}` km (equal shares) in a uniform direction |
| IDENTITY-DUPLICATE | 3 % | A second vessel, elsewhere in the area, broadcasts this vessel's identity for the whole scene |

**Seeds.** Development scenes use seeds 0–9; scored scenes use seeds 1000–1009 (10 scenes,
20 000 vessels). The scored seeds are not run by anyone until the logic is committed.

## The decision (what is scored)

For each vessel the logic outputs one class: NORMAL, DARK, GAP, POSITION-OFFSET or
IDENTITY-DUPLICATE, from the AIS stream and the RF fixes alone (the generator's truth is never
an input). The association gate and thresholds are chosen on the development seeds only and
committed before the scored seeds are run. The intended method (not binding on its details): a
chi-square gate on each RF fix against each AIS track's predicted position (2 degrees of
freedom, false-gate probability 0.001), DARK when an RF track has no gated AIS track over the
scene, GAP when an AIS track's report interval exceeds 10 min while gated RF fixes continue,
POSITION-OFFSET when the RF fixes are persistently outside the gate of the track that best
matches by course and speed, IDENTITY-DUPLICATE when one identity's reports imply a speed above
the existing `max_speed_kn` (70 kn).

## Metrics (formulas)

The 5 × 5 confusion matrix `N[true][decided]` over the scored vessels is published in full,
with:
- per class recall `R_c = N[c][c] / Σ_k N[c][k]` and precision `P_c = N[c][c] / Σ_k N[k][c]`;
- the false-alarm rate `FA = 1 − R_NORMAL` (NORMAL vessels given any other class);
- recall of POSITION-OFFSET per offset `d`;
- a 95 % interval for each rate (exact binomial).

Also reported, not scored: the same matrix split by the distance from each vessel to its
nearest neighbour (< 2, 2–5, > 5 km), since dense traffic makes association harder.

## Bars (on the scored seeds, all *proposed*)

- **M4-B1 (false alarms):** `FA ≤ 0.01`.
- **M4-B2 (dark):** `R_DARK ≥ 0.95` and `P_DARK ≥ 0.80`.
- **M4-B3 (gaps):** `R_GAP ≥ 0.85`.
- **M4-B4 (position offset):** recall ≥ **0.85** at `d = 5` km, ≥ **0.98** at `d ≥ 10` km.
  Recall at `d = 2` km is reported with no bar: it is 2σ of the fix noise and is below what one
  fix can separate.
- **M4-B5 (identity):** `R_IDENTITY-DUPLICATE ≥ 0.95`.
- **M4-B6 (determinism):** the same seed gives a byte-identical truth file and decision file.
- **M4-B7 (additivity):** the AIS anomaly-map outputs and the trust-score outputs of every
  existing scenario are byte-identical before and after the change.

*Reasoning for B4, worked now.* With `σ_fix = 1 km` per axis and a gate at the 0.999 point of
the chi-square distribution with 2 degrees of freedom (13.8, a radius of 3.7σ), a single fix
with a 5 km offset falls outside the gate with probability about 0.9, and several fixes per
scene raise that. At 10 km the probability per fix is essentially 1.

M4 is **MET** only if B1 to B7 all hold; each is reported on its own.

## What MET would and would not mean

MET would mean: given RF fixes of the stated quality and rate, the shipped association logic
separates the five labelled cases at the stated rates on scenes whose truth is exact. It would
show the logic is correct and the thresholds sensible **for this generator**.

It would not mean: that real vessels behave like the generator; that real RF fixes have the
assumed noise and detection rate; that any real vessel flagged by the logic is doing anything
wrong (a gap or an offset has ordinary causes: equipment faults, reception loss, GNSS
interference, transponders switched off in port or for legitimate reasons); or that the logic
is VALIDATED. Results stay MODELLED. Every output describes data consistency ("no matching AIS",
"AIS position inconsistent with the RF fix"), never intent.

NOT MET would be published with the full matrix and would show which class the logic confuses.

## Scope limits

- Synthetic data only; no real AIS or RF data is scored.
- One RF fix per access; no RF identification of the emitter (the fix carries no identity).
- No class B AIS, no satellite AIS, no AIS slot collisions.
- The generator's motion and reception parameters are representative, not fitted to data.

## Owner decisions at sign-off

1. Class shares and the offset set `d`.
2. `σ_fix` (1 km) and the RF detection probability (0.9); whether to tie them to M1 instead.
3. The bars B1 to B5.
4. Whether a later real-data check (for example offsets injected into M3's held-out AIS days,
   if the licence allows) is filed as a separate pre-registration.

## Process

1. Owner signs off; this file is committed alone.
2. The generator is written and committed, with B6 tested, before the logic.
3. The logic is developed on seeds 0–9 and its thresholds committed.
4. Seeds 1000–1009 are run once; `RESULTS.md` with the confusion matrix and a test asserting
   each verdict are committed.

## Sign-off (3 November 2026)

Signed as proposed (class shares, σ_fix = 1 km, RF detection probability 0.9). A later check on real AIS with injected offsets is its own pre-registration.
