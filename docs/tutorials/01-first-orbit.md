# Tutorial 1 — My first orbit: where are the GPS satellites

**Kind:** `orbit` · **Scenario:** `scenarios/orbit-sgp4-gps.toml` (teaching copy:
[`scenarios/orbit.toml`](scenarios/orbit.toml)) · **Difficulty:** beginner · **~15 min**

> By the end you will have propagated the *real* operational GPS constellation,
> read its availability and geometry, and exported a table of where every satellite
> actually is in space — and you will know that table is validated against an
> external reference, not against itself.

## What this scenario is

GPS-style satellites tell a user *where it is* and *what time it is*. Before any of
that, you need to know **where the satellites are** and **how many of them a user can
see**. That is geometry, and geometry sets the floor on how accurately you can be
positioned (the dilution-of-precision, or DOP). This tutorial:

1. takes a genuine Celestrak `gps-ops` snapshot of the GPS constellation
   (2021-07-28, 30 satellites, real two-line elements),
2. propagates every satellite with the validated SGP4/SDP4 model,
3. at each time step works out which satellites a low-Earth-orbit user can see
   (line of sight, Earth occultation, and a 5° elevation mask),
4. turns that geometry into a **PDOP** and a **position accuracy**, and
5. exports the satellites’ actual Earth-fixed (ECEF) positions to an SP3 file.

The spine is: **TLE → SGP4 propagation → ECEF per epoch → visibility → visible-sat
count → PDOP → position-sigma = PDOP · σ_UERE.**

## Run it

```bash
cargo run -- scenarios/orbit-sgp4-gps.toml
```

Python:

```python
import json, kshana
result = json.loads(kshana.run(open("scenarios/orbit-sgp4-gps.toml").read()))
print(result["geometry"]["best_pdop"], result["geometry"]["best_position_sigma_m"])
```

Or open the [browser playground](https://ashfordeou.github.io/kshana/) and pick the
orbit scenario.

## Read the one-line summary

The deterministic run (seed = 17) prints:

```
scenario 4c51512369a6 | 345/361 samples GNSS-nominal | best PDOP 1.07 pos 1.07m | quantum holdover 0s p95 0.0ns integrity 1.000 security 0.978 | classical holdover 0s p95 6.7ns integrity 1.000 security 0.000
```

Field by field:

- **`scenario 4c51512369a6`** — the 12-char scenario hash. It fingerprints the exact
  inputs (seed, thresholds, model parameters, the TLE block). Change any input and
  this changes; keep them the same and you reproduce the run bit-for-bit. The same
  hash is stamped in the chart’s footer and in the result JSON.
- **`345/361 samples GNSS-nominal`** — of the 361 time steps, the user has a usable
  fix at 345 of them (95.6 %). The run is a ~12 h pass (43,200 s) at a 120 s step.
- **`best PDOP 1.07`** — the best (lowest) position dilution of precision over the
  pass. PDOP near 1 is excellent geometry; the lower the better.
- **`pos 1.07m`** — the best position accuracy: **position-sigma = PDOP · σ_UERE**. In
  this scenario `sigma_uere_m = 1.0`, so the two numbers are *numerically equal* here
  — but the rule is PDOP × UERE, **not** “position = PDOP.” With a 3 m UERE the
  position-sigma would be ~3.2 m. (See the pitfall at the end.)
- The clock figures (`holdover`, `p95`, `integrity`, `security`) come along because
  the orbit pack also carries a clock through the pass; they’re the focus of
  [Tutorial 2](02-clock-holdover.md), not this one.

The geometry block in the JSON has the underlying numbers:

```json
"geometry": {
  "samples_total": 361,
  "best_pdop": 1.0714,
  "median_pdop": 2.3184,
  "best_position_sigma_m": 1.0714,
  "sigma_uere_m": 1.0
}
```

## Where are the satellites? (the payoff)

The geometry is good *because* the satellites are really in the GPS shell. Prove it —
export their Earth-fixed positions:

```bash
cargo run -- scenarios/orbit-sgp4-gps.toml --export-sp3 gps.sp3
```

The first three satellites at the first sample step, ECEF in km:

```
PG01   9771.576  24612.129      0.004
PG02  20449.644 -11875.958 -12379.457
PG03  26467.367     45.510   4010.412
```

Take PG01’s geocentric radius:

```
|r(PG01)| = sqrt(9771.576^2 + 24612.129^2 + 0.004^2) = 26480.9 km
```

## The non-circular oracle: is this really a GPS orbit?

A tutorial that checks the engine against itself proves nothing. Here is the
external, *non-circular* anchor for every claim above.

**1. The satellites sit on the real GPS MEO shell.** The GPS nominal semi-major axis
is **a = 26,560 km**, altitude ≈ 20,180 km above the mean Earth radius of 6,378 km
(IS-GPS-200; the GPS SPS Performance Standard, US DoD; Misra & Enge, *Global
Positioning System*, 2nd ed.). PG01’s instantaneous radius of **26,480.9 km** lies
within a few hundred km of `a` — exactly what real GPS eccentricity (~0.005–0.02)
produces. The test
`tests/tutorials.rs::tutorial1_satellites_are_in_the_gps_meo_shell` asserts
`26000 km < |r(PG01)| < 27200 km` against this published `a`, which is **external to
Kshana**.

**2. The pass length is one GPS revolution.** Kepler’s third law gives the period
`T = 2π√(a³/μ)` with `a = 26,560 km` and `μ = 398,600.4418 km³/s²` (WGS-84/EGM,
NIMA TR8350.2): `T = 43,078 s = 11.967 h` — half a sidereal day. The scenario
duration of 43,200 s (“~one GPS revolution”) matches that to under 0.3 %, and the GPS
ground track repeats every sidereal day (two revs), per IS-GPS-200.

**3. The propagated positions are validated, not self-consistent.** The SGP4/SDP4
propagator that produced this ECEF table agrees with **all 666 AIAA 2006-6753
verification vectors to a worst case of 4.12 mm** (`tests/sgp4_verification.rs`,
[`docs/SGP4-VALIDATION.md`](../SGP4-VALIDATION.md)) and matches the independent
`sgp4` crate to sub-micron. So the table you exported is checked against an external
reference implementation, not against Kshana’s own arithmetic.

> **A note on the SP3 dates.** The SP3 epoch header shows a placeholder calendar date
> (2000-01-01); the propagation actually runs from each TLE’s own epoch (2021). Read
> the table as “ECEF positions at the first sample step,” not “on 1 Jan 2000.”

## What the test pins

`tests/tutorials.rs` turns every number above into a CI contract:

- `tutorial1_orbit_headline_holds` — `best_pdop ≈ 1.071`, `best_position_sigma_m ==
  best_pdop` (because `sigma_uere_m = 1.0`), `samples_total == 361`, and the summary
  contains `345/361`.
- `tutorial1_satellites_are_in_the_gps_meo_shell` — PG01’s radius is in the GPS shell
  band, checked against the published `a = 26,560 km`.

If the engine ever stops producing a real GPS shell, the build goes red.

## Pitfalls and units

- **Position-sigma is PDOP × UERE, not PDOP.** The two are equal *only because*
  `sigma_uere_m = 1.0` here. Change UERE and they separate.
- **The timing figures are in nanoseconds**, the position figure in metres. Don’t mix
  them.
- **`holdover_s` is grid-quantised** (a lower bound at the time-grid step). In this
  pass the user is essentially always in fix, so holdover is 0 s (no outage to coast
  through) — that is the *good* case.

## Where next

- Tighten or widen the elevation mask (`mask_deg`) and watch availability change —
  that’s a Tier-2 exercise.
- Swap in a fresh TLE snapshot with `scripts/fetch_tles.sh` (Tier-2 “use fresh
  data”).
- Move on to [Tutorial 2 — Clock holdover](02-clock-holdover.md), where the GNSS
  signal is *taken away* and the onboard clock has to coast.
