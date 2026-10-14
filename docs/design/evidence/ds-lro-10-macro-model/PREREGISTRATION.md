# Pre-registration: LRO non-gravitational macro-model (DS-LRO-10)

Written 2026-10-14 and committed alone, before any fit with the macro-model has been run.
The bars, the runs and the outcome rule below are fixed; they are not changed after a run.

## Question

DS-LRO-04, 09 and 11 showed that on the 4 h LRO arc the reduced-dynamic floor (6.668 m) and
the dynamic residual (12.049 m) do not move with DE-grade frames, field degree, the lunar k2
tide or relativity (`docs/design/evidence/ds-lro-09-11-longer-arc/RESULTS.md`). The remaining
candidate is non-gravitational dynamics. Does an opt-in flat-plate macro-model (direct solar
radiation with the Moon's shadow, plus lunar albedo and thermal IR) reduce those residuals?

## Configuration (unchanged from `tests/agency_lro.rs`)

4 h arc 2022-01-01 (241 one-minute JPL Horizons `LRO_merged` states, committed, SHA-256 in
`tests/fixtures/agency/NOTICE.md`), GRGM660PRIM d/o 100, Earth and Sun third bodies, analytic
lunar environment, `rtol 1e-10`, `atol 1e-6`, 5-sigma editing, at most 25 iterations. Dynamic
tier: epoch state. Reduced-dynamic tier: epoch state + RTN constant, 1- and 2-per-rev
empirical accelerations (`empirical_sigma 1e-7`). In both tiers of every macro-model or
cannonball run the radiation factor `C_R` is estimated as well (initial value 1).

## Model (`lunar_od::LunarMacroModel`, opt-in; defaults unchanged)

The published LRO plate table (areas and optical properties per plate) could not be obtained:
the journal article (Journal of Geodesy 86, 2012, doi:10.1007/s00190-011-0509-4) is closed
access and the institutional repository copy returned HTTP 429 to every request on
2026-10-13/14. No plate value is invented. The model is therefore a **labelled generic
approximation** built only from the published facts below:

| Item | Value | Source (SHA-256 of the file as fetched 2026-10-14) |
|---|---|---|
| Solar array | 10.7 m², two-axis gimbal tracking the Sun | NASA PDS LRO instrument-host catalogue `insthost.cat` (pds-geosciences.wustl.edu, LOLA RDR volume), 6bf451bba258889d21c90048aeeb0d3b4105c02d071c388ed574a8a8bdd057e4 |
| Layout | nadir-pointed, array on −Y, 180° yaw turn every six months | "Orbit determination of the Lunar Reconnaissance Orbiter: Status after seven years", Planetary and Space Science 162 (2018), doi:10.1016/j.pss.2017.10.004 (NTRS 20180007208 PDF, 7603f9584d3f4c00c76a8ccb18118961faac5f60d91b3043460031b9b0d68959), section 2.2 |
| Mass | 1060 kg (upper estimate: below 1100 kg in December 2011, about 4 kg/year used since) | same paper, section 2.2 |
| Lunar Bond albedo | 0.11 | NASA NSSDCA Moon fact sheet (last updated 11 January 2024), a468979dfb4179e36a3f6579cd2d1d4a475b5c6da29313fd470fa68ca1aa30c1 |
| Equatorial surface temperature | 95 K (night) to 390 K (subsolar) | same fact sheet |

Assumptions (stated, not sourced): the array is a black plate (α = 1); for a face-on
Sun-tracking plate the direct-radiation direction does not depend on the optical split and its
magnitude is absorbed by the estimated `C_R`. Surface emissivity 1. **No bus plates** (the
dimensions and optics are not available); the bus's own solar, albedo and IR forces are
missing from the model. Albedo and IR use the sub-satellite exitance with view factor (R/r)²
(no surface integration) and act on whichever face of the array sees the Moon. Not modelled:
self-shadowing, Earth eclipses, spacecraft thermal re-radiation, the parked-array mode, slews.

## Runs

1. **Primary (judged):** array direct radiation + Moon shadow + lunar albedo + IR, `C_R`
   estimated, dynamic and reduced-dynamic.
2. Information: array direct radiation + Moon shadow only (no albedo/IR), `C_R` estimated.
3. Information: cannonball SRP with A/m = 10.7/1060 m²/kg and the Moon's conical shadow,
   `C_R` estimated.
4. Control: the default model, which must reproduce 12.049 m / 6.668 m (defaults unchanged).

## Bars (run 1)

- **B1** reduced-dynamic 3-D RMS ≤ 6.00 m (a 10 % reduction from 6.668 m);
- **B2** dynamic 3-D RMS ≤ 10.84 m (a 10 % reduction from 12.049 m);
- **B3** estimated `C_R` within [0.3, 3.0] in both tiers (physically plausible for this
  model and mass), and both fits converge.

## Outcome rule

All three met: the macro-model is recorded as a MODELLED improvement of the LRO fit (no
external oracle computes LRO's non-gravitational forces, so nothing here can be VALIDATED).
Any bar not met: a finding. The recorded miss is pinned by a non-ignored test that asserts the
measured numbers, the bars stay as written, and the macro-model stays opt-in. Either way no
default output changes.

## Expected effect (written before any run)

The array's direct-radiation acceleration is about 4.6e-8 m/s² (P☉ · 10.7 m² / 1060 kg); the
day-side albedo + IR pressure at 30 to 200 km altitude is of the same order. Most of this is a
constant or once-per-revolution signal the reduced-dynamic tier already absorbs, so we expect
B1 is likely NOT MET (change below 0.5 m) and B2 may improve by up to about 1 m. A miss would
point away from the non-gravitational forces this model covers, towards the missing bus
plates, the empirical basis over a short arc, or the accuracy of the Horizons reconstruction
itself.

## 24 h arc (DS-LRO-09 remainder)

Not part of the bars. A local attempt was cut off by a container restart after about 40
minutes, so its number comes from the manual `lro-de440-opt-in` CI job and is reported as
information.
