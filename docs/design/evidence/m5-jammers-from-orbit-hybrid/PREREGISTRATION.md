# M5: GNSS interference sources seen from orbit, and a space + ground hybrid: pre-registration

**Status: Signed off by the owner on 3 November 2026 (0.41 phase 2) and committed before any implementing code or data. Numbers marked *proposed* below are now fixed; bars may be tightened after a run, never loosened.**
Numbers marked *proposed* are for the owner to fix at sign-off. After that, bars may be tightened
after a run, never loosened. A miss is recorded in `RESULTS.md` with its numbers, and its test
asserts the recorded miss. Public sources only; the scored data are synthetic.

## Why this row

Roadmap row M5. GNSS interference in the Baltic region affects aviation and shipping, and
locating its sources quickly is a safety and spectrum-management task. Ground monitoring
stations locate a source well when it is near them and inside their radio horizon; far offshore
or at altitude, they may not see it, or see it from one side only. A receiver in low Earth orbit
sees a wide area at once but from far away. M5 asks two questions: **from 550 km, which source
powers are detectable and how well can they be located**, and **does fusing the orbital and the
ground measurements locate sources better than either layer alone**.

**Exists:** the time- and frequency-difference geolocation and its bound (`src/geolocation.rs`,
MODELLED); the radio-horizon reach (`los_reach_km` in `src/interference_map/emitter.rs`); the
interference emitter-region estimate. The ground power-difference locator (row B3a) and the
station service (row L3) are built in 0.41. **Missing**, built after this file is committed: the
space-side link budget and detection model for an L1 interference source, and the hybrid
estimator. No field-trial data is used on this row; in particular, no Jammertest data, so this
row cannot touch the B3 pre-registration.

## The synthetic scenario (fixed now)

**Area.** The M2 Baltic area (its grid rule and masks).

**Sources.** 200 placements (*proposed*), drawn uniformly over the area's sea points with seed
4500; the first 100 at 10 m above the sea (a surface source), the next 100 at 3 000 m (an
elevated source). Each placement is run at three EIRP classes, isotropic, continuous
noise-like or swept over 2 MHz centred on 1575.42 MHz:
- E10: 10 dBm (low-power device), reported only;
- **E30: 30 dBm (1 W), the scored class**;
- E40: 40 dBm (10 W), reported only.

**Space layer.** Three receivers in formation in plane 1 of the M2 primary RF layer, at 0, 50 and
100 km in-track (*proposed*, as in M1's F3). For each placement, the pass is the first one in the
24 h after 2025-01-01 00:00 UTC whose maximum elevation at the placement is ≥ 20°. Measurement
epochs every 10 s while all three see the placement at ≥ 10° elevation. Link budget per receiver:
`P_r = EIRP − FSPL(range, 1575.42 MHz) + G_r`, `G_r = 0 dBi`, noise `k·T_sys·B` with
`T_sys = 500 K`, `B = 2 MHz`, integration `T = 1 s`. An epoch yields measurements only if an
energy detector with false-alarm probability 1e-6 per epoch detects the source at all three
receivers (the closed-form detection probability is computed, and detection is drawn from it).
Time- and frequency-difference noise from the ambiguity-function accuracy relations used in M1.
Orbit and clock errors are zero here (row M6 sets them).

**Ground layer.** 14 fixed coastal sites (synthetic, positions only), antenna 30 m above the
ground:

| Site | lat (°N) | lon (°E) | Site | lat (°N) | lon (°E) |
|---|---|---|---|---|---|
| G1 | 54.32 | 10.14 | G8 | 60.17 | 24.94 |
| G2 | 54.18 | 12.09 | G9 | 57.64 | 18.29 |
| G3 | 55.10 | 14.70 | G10 | 56.16 | 15.59 |
| G4 | 54.52 | 18.55 | G11 | 60.10 | 19.94 |
| G5 | 55.70 | 21.13 | G12 | 63.10 | 21.60 |
| G6 | 56.95 | 24.10 | G13 | 65.00 | 25.40 |
| G7 | 59.44 | 24.75 | G14 | 62.39 | 17.31 |

A site receives the source only inside the radio horizon of the two antenna heights
(`los_reach_km`, 4/3 Earth radius). Received power `P_r = EIRP − FSPL + X`, with log-normal
shadowing `X ~ N(0, 6 dB)` (*proposed*), independent per site and draw; the site reports it only
if `P_r ≥ −110 dBm` (*proposed*; about the 2 MHz thermal floor). The ground estimate is the B3a
power-difference locator (EIRP unknown), as shipped.

**Hybrid.** One estimator over the union of the space time and frequency differences and the
ground power reports, with the emitter height known to the estimator only as "surface" or
"elevated 3 000 m" (both layers get the same height information).

**Draws.** 20 noise draws per placement and class, seed 4501. Every estimator starts from the
same initial guess (the area's centroid) and may decline to give an estimate (fewer
measurements than unknowns, or no convergence).

## Metrics (formulas)

Per draw and layer `ℓ ∈ {space, ground, hybrid}`, the horizontal error `e_ℓ` (great-circle
distance) when the layer gives an estimate.
- **Success rate** `S_ℓ`: fraction of draws in which the layer gives an estimate with
  `e_ℓ ≤ 5 km` (*proposed*; the scale of an optical footprint in M3).
- **Common set:** the draws in which space and ground both give an estimate. On it, the median
  and 95th percentile of each `e_ℓ`.
- **Detectability from orbit (reported):** per EIRP class and source height, the fraction of
  placements with at least 6 detected epochs on the pass, and the lowest EIRP at which the
  per-epoch detection probability at the pass peak reaches 0.9.
- **Bounds (reported):** each layer's and the hybrid's position bound per placement.

## Bars (E30 class, all *proposed*)

- **M5-B1 (hybrid wins on success):** `S_hybrid ≥ max(S_space, S_ground) + 0.05`.
- **M5-B2 (hybrid wins on accuracy where both see it):** on the common set,
  `median(e_hybrid) ≤ 0.8 · min(median(e_space), median(e_ground))`.
- **M5-B3 (no worse in the tail):** on the common set,
  `p95(e_hybrid) ≤ min(p95(e_space), p95(e_ground))`.
- **M5-B4 (link budget and detection, independent recomputation):** a numpy script sharing no
  code with the engine computes the received power, SNR and detection probability at 10 fixed
  geometries (the M1 points P1–P10, at the pass peak); agreement within 1e-9 dB and 1e-6 in
  probability.
- **M5-B5 (information adds):** at every placement the hybrid bound is no larger than either
  layer's bound in the positive-semidefinite sense (the difference has no eigenvalue below
  −1e-9 of the larger eigenvalue).
- **M5-B6 (determinism):** the same seeds give byte-identical results.

M5 is **MET** only if B1 to B6 all hold; each is reported on its own. The roadmap's done
condition is B1 to B3.

## What MET would and would not mean

MET would mean: in this synthetic Baltic scenario, with the stated powers, noise and station
layout, adding orbital measurements to a coastal ground network (or the reverse) locates 1 W
sources more often and more precisely than either alone. It would support designing monitoring
networks as two layers.

It would not mean: that real sources radiate isotropically or continuously; that the link
budget, shadowing and thresholds are right; that orbit and clock errors are small (M6 is
absent here, so the space layer is optimistic); that the ground layout resembles any real
network; or that real GNSS interference in the region would be located this well. Results stay
MODELLED.

NOT MET would be published with the numbers. If one layer dominates (for example the ground
layer near the coast, the space layer offshore), the per-placement results would show where,
which is itself useful for network design.

## Scope limits

- Synthetic only; no field data, no Jammertest data.
- Static sources; no multipath, terrain or sea-surface reflection; free space plus shadowing.
- No ionospheric or tropospheric delay on the space path (small at L1 against these bars, and
  stated).
- One pass for the space layer; multi-pass fusion is M1's.
- Neutral wording throughout: interference source, location, uncertainty; no actors or intent.

## Owner decisions at sign-off

1. The scored class (E30) and the success radius (5 km).
2. The ground layout (14 synthetic coastal sites), shadowing (6 dB) and threshold (−110 dBm).
3. The bars B1 to B3 (+0.05, 0.8×, tail no worse).
4. Whether the elevated (3 000 m) placements stay in the scored set or are reported separately.

## Process

1. Owner signs off; this file is committed alone.
2. The B4 oracle script is committed before the engine code.
3. The link budget, detector and hybrid estimator are written and tested; B3a's locator is used
   as shipped.
4. The scenario runs once; `RESULTS.md` and a test asserting each verdict are committed.

## Sign-off (3 November 2026)

Signed as proposed: the 1 W class and the 5 km success radius are scored; the ground layout and thresholds are fixed; the 3 000 m placements stay in the scored set.
