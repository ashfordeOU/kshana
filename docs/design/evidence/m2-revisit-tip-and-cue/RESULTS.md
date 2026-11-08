<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# M2: revisit and tip-and-cue latency: results

**A cross-check of published simulation figures, never a validation. MODELLED whatever the outcome.**

Pre-registration: `PREREGISTRATION.md` (signed 3 November 2026). Readings fixed before any planner code:
`xval/m2-revisit-tip-and-cue/README.md` (readings 1 to 11 in `7999be573`, reading 12, the variants, with the
planner in `f592cc3d4`, before any run). Run once:

    cargo run --release --example m2_tip_and_cue > xval/m2-revisit-tip-and-cue/m2_result.json

(996 sea points, 7 days at 10 s from 2025-01-01 00:00 UTC; F and Q over the first 6 days; output SHA-256
`0626661428fe73b6e461908ac5732e248a985420cc95d35b3d1158257cd834bc`). The verdicts are pinned by
`tests/tip_and_cue_m2.rs`.

## Verdict

**Not consistent with the published figures.** B0 is met, so the planner is not void; of the six figures one
is consistent (the 16-satellite revisit), and none of the three 16 → 32 ratios is.

## M2-B0: independent access check: MET

The 16-satellite RF layer's access intervals at P1–P10 over the first 24 h, per satellite and merged (1 283
intervals), equal those of the numpy oracle: same counts, worst difference **0 s** (bar: one 10 s step).

## M2-B1: the six figures (±25 %)

| Figure | Layer | Kshana (min) | Published (min) | Window (min) | Verdict |
|---|---|---|---|---|---|
| R revisit | 16 | 23.97 | 20 | 15 – 25 | **consistent** |
| R revisit | 32 | 22.92 | 10 | 7.5 – 12.5 | not consistent (+129 %) |
| F full-area refresh | 16 | 14.84 | 39 | 29.25 – 48.75 | not consistent (−62 %) |
| F full-area refresh | 32 | 12.95 | 18 | 13.5 – 22.5 | not consistent (−28 %) |
| Q RF-to-optical | 16 | 23.09 | 15 | 11.25 – 18.75 | not consistent (+54 %) |
| Q RF-to-optical | 32 | 12.99 | 7 | 5.25 – 8.75 | not consistent (+86 %) |

## M2-B2: scaling 16 → 32 (±15 %)

| Figure | Kshana ratio | Published ratio | Window | Verdict |
|---|---|---|---|---|
| R | 1.046 | 2.00 | 1.70 – 2.30 | not consistent |
| F | 1.146 | 2.17 | 1.84 – 2.49 | not consistent |
| Q | 1.778 | 2.14 | 1.82 – 2.46 | not consistent |

## Unscored companions and variants

All values in minutes; "mean" is the primary definition, the others are reported for how much the definition
matters.

| Case | R mean | R start-to-start | R median | F mean | F median | F p95 | Q mean | Q median | Q p95 |
|---|---|---|---|---|---|---|---|---|---|
| primary-16 | 23.97 | 34.63 | 30.83 | 14.84 | 12.83 | 34.50 | 23.09 | 8.33 | 97.33 |
| primary-32 | 22.92 | 35.41 | 29.17 | 12.95 | 10.33 | 31.50 | 12.99 | 6.83 | 58.83 |
| V1 32 as 8 × 4 | 13.60 | 22.67 | 14.17 | 6.30 | 5.67 | 14.50 | 14.35 | 5.00 | 87.67 |
| V2-16 (optical 60°) | 23.97 | 34.63 | 30.83 | 14.84 | 12.83 | 34.50 | 8.40 | 5.83 | 29.00 |
| V2-32 (optical 60°) | 22.92 | 35.41 | 29.17 | 12.95 | 10.33 | 31.50 | 5.62 | 3.83 | 25.00 |
| V3-16 (daylight only) | 23.97 | 34.63 | 30.83 | 14.84 | 12.83 | 34.50 | 1009.88 | 727.50 | 3956.00 |
| V3-32 (daylight only) | 22.92 | 35.41 | 29.17 | 12.95 | 10.33 | 31.50 | 1011.00 | 701.83 | 4359.00 |
| V4-16 (RF mask 0°) | 16.63 | 38.03 | 19.00 | 7.58 | 2.83 | 24.67 | 25.60 | 14.50 | 78.50 |
| V4-32 (RF mask 0°) | 15.36 | 39.13 | 17.67 | 6.39 | 1.50 | 23.33 | 14.37 | 11.50 | 32.17 |

No point is without a revisit gap in any case. In V3 (January, Sun ≥ 10° above the point), 182 487 (16) and
160 607 (32) cues find no optical look before the span ends; they are left out of Q, as reading 8 states, and
the Q figures shown use only the cues that are answered.

## What the numbers show

- **The 32-satellite layout drives the misses.** Under the pre-registered 32 = 16 planes × 2 with phasing 1,
  the satellites of adjacent planes are 11.25° apart in node and in argument of latitude, so they pass a point
  minutes apart and their accesses overlap: doubling the planes barely shortens the gaps (R 23.97 → 22.92).
  The same 32 satellites as 8 planes × 4 (V1) give R 13.60, F 6.30 and Q 14.35. The published 16 → 32
  scaling (about ×2 on every figure) is what spreading the added satellites evenly in time would give; the
  layout fixed here does not.
- **F is shorter than published for both sizes.** With a 10° mask each satellite's footprint is wide compared
  with the Baltic, so the whole area is seen within about a quarter of an hour on average; a figure near
  39 min would follow from a narrower RF field of regard or a stricter definition of "full area". V4 (0° mask)
  shortens F further.
- **Q is longer than published.** With a 45° optical field of regard the median wait is short (8.3 and 6.8
  min) but the mean is pulled up by long tails (95th percentiles 97 and 59 min); V2 (60°) gives Q 8.40 and
  5.62 min, close to the published 15 and 7. A wider field of regard, optical satellites trailing the RF ones,
  or a different average would each move Q toward the published values.
- **In January the Baltic has little daylight at 10° Sun elevation** (V3): with that constraint most cues wait
  a day or more, which the published figures do not reflect, consistent with their carrying no day/night
  qualifier.

## What this does and does not mean

Not consistent means the operator's simulation and this planner disagree **under the assumptions this file
fixed before the run**: planes and phasing, fields of regard, no daylight constraint, the area and the
averaging. The published statement does not give those assumptions, so the disagreement says the published
figures depend on choices not stated (for the scaling, most likely how the 32 satellites are arranged). It
does not say that either simulation is wrong, and it is no statement about any constellation in orbit. The
expectation written before the run (R likely consistent, Q plausibly not) held for the 16-satellite case;
the 32-satellite layout was not anticipated to cluster.
