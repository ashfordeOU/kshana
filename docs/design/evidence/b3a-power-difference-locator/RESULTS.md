<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B3a (0.41): power-difference locator: synthetic gate results

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026). Readings: `xval/locator-power-difference/README.md`.

| Step | Commit |
|---|---|
| Readings 1 to 15 | `f24d46278` |
| Correction to reading 6 (horizon), before any code | `b4c93ed43` |
| Locator, generator and numpy check | `84254ee80` |
| Correction to readings 5 and 8 (marginalise `n` and `h` over the session), after the first development run | `0ecee3268` |
| Matching code change | `2ca323cb9` |
| τ = 1/60 chosen on the development seeds | `f8ec2eaa6` |
| The gate, run once on seeds 1001 to 2000 | this commit |

The bars were not changed. No Jammertest 2026 file was opened.

## Summary

| Bar | Result |
|---|---|
| S1 coverage | **MET**: the 95% region contains the truth in 0.976 of 1,000 sessions (bar ≥ 0.90). |
| S2 non-vacuity | **NOT MET**: the median 95% region is 52.5% of the search domain (bar ≤ 25%). |
| S3 centroid | **NOT MET**: the median centroid error is 2.55 × the median nearest-neighbour station spacing (bar ≤ 0.5 ×). |
| S4 determinism | **Not run**: the row stopped at S2 and S3. On Linux the debug and release builds give identical rows (`tests/locator_power_difference_synthetic.rs`). |

**The synthetic gate is NOT MET. By section 2, the row stops here:** the real run on Jammertest 2027 will not be made
with this method. D3 stays open. Other checks:
- **Implementation check** (reading 15): the numpy recomputation agrees on seeds 1 to 5. Grids and region cells are
  equal, and centroids agree to within 1e-10 m.
- **Redraws:** 676 draws had no epoch with 3 reporting stations and were redrawn.

## What happened, in order

1. **The first development run** (seeds 1 to 200, kept in `dev-first.json.gz`) marginalised the path-loss exponent and
   the source height per epoch. A noiseless check, with data drawn from the locator's own model, put the mode 5 km
   from a source outside the network.
   - **Cause.** A per-epoch mixture over `(n, h)` rewards cells where several hypotheses fit equally well. Where
     every station is beyond the horizon for both heights, the mixture gains `log 2` per epoch, about 21 nats over a
     session.
   - **Correction.** A static source has one `n` and one `h`, so both are now marginalised once per session.
   - This changed a reading after development data had been seen. It was done before any gate seed was drawn, and
     it is disclosed in the reading itself.
2. **The second development run** (`dev.json.gz`):

   | τ | 1 | 1/2 | 1/3 | 1/5 | 1/10 | 1/20 | 1/30 | 1/60 |
   |---|---|---|---|---|---|---|---|---|
   | coverage | 0.155 | 0.25 | 0.33 | 0.425 | 0.62 | 0.795 | 0.90 | 0.985 |
   | median area share | 0.003 | 0.006 | 0.010 | 0.024 | 0.062 | 0.175 | 0.275 | 0.536 |

   - The rule picks the largest τ with coverage ≥ 0.95, which is 1/60.
   - The centroid ratio was 2.3 to 2.8 at every τ.
   - The development run already showed S2 and S3 would miss. The rule was applied as written.
3. **The gate** (`gate.json.gz`) confirmed it.

## Why the method misses (descriptive, after the run)

- **Coverage needs heavy tempering.** Coverage reaches 0.95 only at τ = 1/60. The 30 epochs of a session share one
  shadowing draw, so treating them as independent overstates the evidence about 60-fold. Tempering restores coverage,
  and the regions then cover half the domain.
- **The centroid is far off at every τ.** With σ_sh = 6 dB, cells far from the source often fit the stations' power
  differences to within about 1 dB, once the reference power is profiled out and the exponent is free. The posterior
  mean is pulled toward the large outer part of the domain.
- **Inside against outside the network.** Of the 1,000 gate sources, 897 lie outside the stations' convex hull (the
  domain extends 20 km beyond it). The split, descriptive only:
  - **Inside (103 sources):** coverage 0.99, median area share 0.41, centroid ratio 1.74.
  - **Outside (897 sources):** 0.974, 0.54 and 2.72.

  Even inside the network the method misses S2 and S3.

## What a successor needs (not done here)

Any successor needs a new pre-registration. The obvious directions are:
- **Session-level shadowing.** Model the shadowing once per session rather than per epoch, which removes the need for
  heavy tempering.
- **A narrower domain.**
- **More observables per station,** such as AGC only from calibrated front ends.

None of these was tried on the gate seeds.

## What this does not show

- It does not show anything about real interference. These are synthetic networks, drawn from a model that differs
  from the locator's on purpose.
- It does not rate the C/N0 or AGC monitors.
