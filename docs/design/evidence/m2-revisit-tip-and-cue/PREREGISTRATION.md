# M2: revisit and tip-and-cue latency: pre-registration

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.**
Numbers marked *proposed* are for the owner to fix at sign-off. After that, no assumption and no
bar changes. A miss is recorded in `RESULTS.md` with its numbers, and its test asserts the
recorded miss. Public sources only.

**What this is.** A **cross-check of published simulation figures**, not a validation. The
reference is another party's simulation, not a measurement; agreement says two models agree
under the assumptions fixed here, disagreement says they do not. The result is labelled
MODELLED whatever the outcome, and never VALIDATED.

## Why this row

Roadmap row M2. A two-layer maritime concept (a wide-area RF survey layer that cues an optical
layer to confirm a vessel) is described by three timing figures: how often each point is
revisited, how long the whole area takes to refresh, and how long it takes from an RF detection
to an optical look. An independent planner that computes these from stated orbits and fields of
regard lets anyone see which assumptions drive the figures. M2 builds that planner (the
`tip-and-cue` scenario kind) and checks it against the one public set of figures known for the
Baltic.

## The reference (fixed now)

The source is **a commercial constellation operator's public statement**. It is not named or
linked here, per the repository's neutral-wording rule; the figures are reproduced in full so the
check does not depend on the source. They are stated as results of the operator's own
simulation, 550 km sun-synchronous orbits, over the Baltic Sea:

| Figure | 16 satellites per layer | 32 satellites per layer |
|---|---|---|
| R: revisit (RF layer) | 20 min | 10 min |
| F: full-area refresh (RF layer) | 39 min | 18 min |
| Q: RF-to-optical reaction | 15 min | 7 min |

The statement gives a vessel speed of 16 to 22 kn, which M2 does not use (M3 does). It does
**not** state: the number of planes, the phasing, the RF field of regard, the optical field of
regard or agility, any daylight constraint, the tasking or data latency, the exact boundary of
the area, or how each figure is averaged. M2 must assume all of these, and does so below before
any run.

Every assumption below was chosen **with the published figures already known**; that cannot be
avoided for a cross-check. To limit circularity, each assumption has a rationale that does not
use the figures, the drafter's rough expectation is written down (§ Expectation), and nothing
may change after a run.

## The area of interest (fixed now)

Grid points on a 0.25° × 0.25° latitude-longitude grid (cell centres at x.125, x.375, …) with
53.5° ≤ lat ≤ 66.0° N and 9.5° ≤ lon ≤ 30.5° E, keeping a point only if:
- it lies outside every polygon of Natural Earth 1:10m `ne_10m_land` and of `ne_10m_lakes`
  (public domain, https://www.naturalearthdata.com/downloads/10m-physical-vectors/), the
  version current at fetch, with its version number, file and SHA-256 recorded; and
- it is not in the Kattegat or the Skagerrak: points with lat > 55.65° N and lon < 13.0° E are
  dropped.

Each point is weighted by `cos(lat)` (area weighting) in every area average. The point count is
recorded in the result; it is not a bar.

## Constellation assumptions (fixed now)

Common to both layers: circular orbits at 550 km altitude (semi-major axis 6 928.137 km), the
sun-synchronous inclination 97.59° from the first-order J2 nodal rate, propagated with the
engine's J2 secular model (`src/constellation.rs`). Epoch 2025-01-01 00:00:00 UTC. Simulation
span 7 days, time step 10 s; an access opens and closes at the first and last step inside the
field of regard.

**RF layer (primary).**
- 16 satellites: 8 planes × 2 satellites, planes' ascending nodes spread evenly over 180°
  (22.5° apart: a star pattern, so the local times of the nodes cover the day evenly), the two
  satellites of a plane 180° apart, phasing between adjacent planes 360°·1/16 = 22.5° (factor 1).
- 32 satellites: 16 planes × 2 satellites, nodes 11.25° apart, otherwise the same.
- Rationale: an even spread of planes is the generic choice for uniform revisit when nothing
  else is known; two satellites per plane matches the pair vocabulary of row M9; doubling the
  planes rather than the satellites per plane keeps each plane identical between the two cases.
- Each satellite is an independent observer. Field of regard: the point sees the satellite at
  elevation ≥ **10°** (*proposed*), the engine's existing constellation-design default mask. At
  550 km this is an Earth-central angle of about 15.0° (about 1 670 km ground radius).

**Optical layer (primary).**
- Same counts and pattern as the RF layer (16 = 8 × 2, 32 = 16 × 2), each optical plane's node
  offset by half the plane spacing from the RF planes (11.25° for 16, 5.6° for 32), so the two
  layers interleave.
- Field of regard: off-nadir angle ≤ **45°** (*proposed*), with the point's elevation then
  above about 39°. Rationale: a commonly stated slew limit for agile small imaging satellites,
  beyond which the ground sample distance degrades by more than about a factor two.
- No daylight constraint, no cloud, zero tasking and downlink latency, a satellite can take any
  number of cues (*proposed*). Rationale: the published figures carry no day/night or latency
  qualifier, so the primary case makes none.

**Pre-declared variants.** Reported next to the primary, never used for the verdict:
- V1: 32 RF satellites as 8 planes × 4 (instead of 16 × 2).
- V2: optical field of regard 60° off-nadir.
- V3: optical looks only when the sun is ≥ 10° above the point's horizon.
- V4: RF elevation mask 0°.

## Metrics (formulas)

For an area point `p`, let `A_p = {[s_1, e_1], [s_2, e_2], …}` be the merged access intervals
of any satellite of a layer over the span (union over satellites, sorted).

- **R, revisit:** the coverage gaps `g_j = s_{j+1} − e_j` for `g_j > 0`. Per point, the mean gap
  `ḡ_p`. The figure is the area-weighted mean of `ḡ_p` over all points. Also reported, not
  scored: start-to-start gap, median and 95th percentile gap, the maximum gap.
- **F, full-area refresh:** for each start time `t` on a 1 min grid over the first 6 days,
  `F(t) = min{Δ : every point p has an access overlapping [t, t + Δ]}`. The figure is the mean
  of `F(t)`. Also reported: median and 95th percentile.
- **Q, RF-to-optical reaction:** a cue is issued at the start `s` of every RF access interval of
  every point over the first 6 days. `Q = s_opt − s`, where `s_opt` is the first time at or
  after `s` at which the point is inside the optical field of regard (zero if already inside).
  The figure is the area-weighted mean over points of the per-point mean of `Q`. Also
  reported: median and 95th percentile.

The averaging conventions above are the primary definitions. Because the source does not state
its own, the result also prints, without scoring, R as start-to-start and F and Q as medians,
so a reader can see how much the definition matters.

## Bars

- **M2-B0 (independent access check).** A numpy script that shares no code with the engine
  propagates the 16-satellite RF layer for the first 24 h with its own J2 secular model and
  computes the access intervals at 10 points (the M1 points P1–P10). Bar: every access start
  and end time equals the engine's to within one time step (10 s), and the counts are equal.
- **M2-B1 (cross-check, the six figures).** Each primary figure is within **±25 %**
  (*proposed*) of the published value: R in [15, 25] and [7.5, 12.5] min; F in [29.25, 48.75]
  and [13.5, 22.5] min; Q in [11.25, 18.75] and [5.25, 8.75] min.
- **M2-B2 (scaling, 16 → 32).** For each of R, F and Q, the ratio (16-satellite figure /
  32-satellite figure) is within **±15 %** (*proposed*) of the published ratio (2.00, 2.17,
  2.14).

Verdict: each of the six figures and each of the three ratios is reported **consistent** or
**not consistent** on its own. The row is "consistent with the published figures" only if B0
and all of B1 and B2 hold. B0 failing makes the row void (a planner defect), not "not
consistent".

## Expectation (written before any run)

A rough count by the drafter, not a computation: with a 10° mask a 550 km satellite's ground
radius is about 1 670 km, so at the Baltic's latitudes each satellite passes over a given point
roughly four to five times a day, and 16 independent satellites give a mean gap of the order of
20 min. The revisit figure is therefore expected to agree, and that agreement would be weak
evidence: it follows from geometry with few free choices. For the optical layer the same count
with a 45° field of regard (about 570 km ground radius) gives waits of the order of tens of
minutes, well above 15 min. **Q not consistent is a plausible outcome of the primary case.** If
it happens, it would say that the published reaction figure depends on assumptions not stated
(for example more agility, optical satellites trailing the RF ones in the same plane, or a
different averaging), and V2 would show how much a wider field of regard closes the gap. It
would not say the published figure is wrong.

## What MET would and would not mean

Consistent would mean: under these stated assumptions, Kshana's planner and the operator's
simulation give the same timing figures within the tolerance. It would not mean that the
operator's constellation looks like the assumed one, that the figures will be achieved in
orbit, or that the planner is VALIDATED (no measured revisit data is used). Not consistent
would mean the two simulations disagree under these assumptions; the result would show which
figure, by how much, and what the variants change. It would not mean either simulation is wrong.

## Scope limits

- Geometry and timing only: no link budget, no detection probability, no geolocation (M1), no
  track maintenance (M3), no cloud, no ground-station contact or downlink scheduling.
- Spherical-Earth access geometry with the J2 secular model; no drag, so the 7-day span is
  short enough for the omission to be small and is stated.
- The area boundary is this file's, not the source's.
- Neutral wording: "RF survey layer", "optical layer", "cue"; no names of companies or
  programmes in the code, the scenario or the result.

## Owner decisions at sign-off

1. RF mask (10°) and optical field of regard (45°) for the primary case.
2. Whether 32 satellites means 16 × 2 (primary) or 8 × 4 (V1) for the verdict.
3. Tolerances: ±25 % per figure and ±15 % per ratio.
4. The area rule (box, land and lake masks, Kattegat cut).
5. Whether to ask the operator for its assumptions is an owner matter outside this file; any
   assumption learned after sign-off can only be run as a new, separately filed variant.

## Process

1. Owner signs off; this file is committed alone.
2. The B0 oracle script is committed before the planner code.
3. The planner and the `tip-and-cue` scenario kind are written and tested on synthetic cases.
4. The primary run and the variants run once; `RESULTS.md` and a test asserting each verdict
   are committed.

## Sign-off (3 November 2026)

Signed as proposed: 10° mask, 45° optical field of regard, the constellation layouts as written, ±25 % per figure and ±15 % per ratio. The outcome is a cross-check of published figures, never VALIDATED; a disagreement is published as found.
