# Tutorial 3 — Quantum vs classical GNSS resilience (capstone)

**Kinds:** `spoof` + `hybrid` · **Scenarios:** `scenarios/spoof-attack.toml`,
`scenarios/hybrid-pnt.toml` (teaching copies:
[`scenarios/security.toml`](scenarios/security.toml),
[`scenarios/hybrid.toml`](scenarios/hybrid.toml)) · **Difficulty:** intermediate ·
**~35 min**

> The capstone. You will run a spoofing-detector scenario and a full fused
> positioning, navigation and timing (PNT) suite,
> and learn to read **security**, **integrity**, and **dead-reckoning** together —
> the whole thesis: quantum inertial + optical timing buy resilience that GNSS (Global
> Navigation Satellite System) denial would otherwise take away.

## Part A — Security: catching a time spoof

An attacker injects a slowly-ramping false GNSS time (0.1 ns/s, starting at t = 60 s).
The receiver cross-checks the asserted time against its own clock’s coasted
prediction and flags the spoof when the discrepancy passes the detection bound. The
detector is a two-sided **χ²₁ / Neyman–Pearson energy test** at a false-alarm
probability P_fa = 0.01; the Security figure of merit is **`1 − P_md`** (one minus
the probability of missed detection) at the spec-sized (20 ns) spoof magnitude.

```bash
cargo run -- scenarios/spoof-attack.toml
```

Summary:

```
scenario 2b6bd22c3b80 | spoof LinearRamp { rate_ns_per_s: 0.1 } vs 20.000 ns spec (P_fa 0.010) | quantum security 1.000 (P_md 0.000, MC 0.000) detected 70s | classical security 0.558 (P_md 0.442, MC 0.444) detected 430s
```

- **Quantum: `security 1.000`, detected at 70 s.** The optical clock’s detection
  floor is a fraction of a nanosecond, so it flags the spoof almost immediately — far
  below the 20 ns spec.
- **Classical: `security 0.558`, detected at 430 s.** The chip-scale atomic clock’s
  (CSAC’s) own coast noise over
  the window is comparable to 20 ns, so it often can’t tell the spoof from its own
  drift — it misses 44 % of the time.

### The non-circular oracle: analytic vs Monte-Carlo P_md

The detector’s missed-detection probability is computed **two independent ways** that
must agree: a **closed-form χ²₁ tail** (the Neyman–Pearson result) and a
**Monte-Carlo** (MC) estimate. For the CSAC the analytic P_md is **0.442** and the MC P_md
is **0.444** — they agree to 0.002, well inside the `~few × 1/√N` sampling error.
For the optical clock both are 0.000. Two separate computations of the *same*
probability agreeing is the non-circular cross-check (Kay, *Fundamentals of
Statistical Signal Processing: Detection Theory*; standard NP / χ² detection).
`tests/tutorials.rs::tutorial3_spoof_analytic_matches_montecarlo` asserts
`|analytic_pmd − mc_pmd| < 0.05` for both clocks and `quantum security_fom > 0.9`.

## Part B — Hybrid PNT: the full fused suite

Now the capstone scenario fuses an optical clock + a cold-atom inertial measurement
unit (IMU) (quantum suite) against a CSAC + a navigation-grade IMU (classical suite),
through the same 6600 s (1.83 h) GNSS outage, against a 20 ns timing spec and a
100 m position spec. Both suites re-anchor their clocks every 60 s over the same
optical inter-satellite time-transfer link, modelled with a 1 ps per-resync jitter
(`[resync]` in the scenario; `src/hybrid.rs` builds one `optical-isl` link for
either suite).

```bash
cargo run -- scenarios/hybrid-pnt.toml
```

Summary:

```
scenario f33d734ecc51 | quantum PNT-holdover 6600s (t 6600s/p 6600s) integrity 0.998 security n/a (no attack) | classical PNT-holdover 350s (t 6600s/p 350s) integrity 1.000 security n/a (no attack)
```

Read the `(t …/p …)` split — timing holdover vs position holdover:

- **Quantum: PNT-holdover 6600 s** — holds both timing (t 6600 s) and position
  (p 6600 s) for the whole outage.
- **Classical: PNT-holdover 350 s** — *timing* holds the full 6600 s (t 6600 s),
  because the optical time-transfer resync keeps even the *classical clock* locked. The suite is **position-limited at p 350 s**: the nav-grade IMU is the weak
  link. This is the fusion thesis — isolate the classical suite’s failure to its
  inertial sensor.

> **`integrity 0.998` for the quantum suite is real and is not a bug.** It is the
> filter’s self-consistency over noisy resync — **not** an aviation integrity figure
> (horizontal or vertical protection level, HPL/VPL). Don’t over-read the word “integrity” here; see [`docs/INTEGRITY.md`](../INTEGRITY.md).

### The non-circular oracle: the 350 s position-holdover

The 350 s figure is dead-reckoning physics, not a fitted number. A constant
accelerometer bias `b` drives position error as **½·b·T²**. Crossing the 100 m spec:

```
Navigation-grade (classical), b = 1.57e-3 m/s^2:
  T = sqrt(2 * 100 / 1.57e-3) = 357 s

Cold-atom (quantum), b = 5.88e-7 m/s^2 (Templier et al. 2022, arXiv:2209.13209):
  T = sqrt(2 * 100 / 5.88e-7) = 18,443 s >> 6600 s outage -> holds the full outage
```

The engine reports 350 s, the last 10 s grid point before its crossing and 2 % short
of the bias-only 357 s: the scenario’s accelerometers also carry velocity random-walk
noise (`q_va`), which adds to the bias drift, so the modelled error reaches 100 m a
little sooner.

Authoritative law: Groves, *Principles of GNSS, Inertial, and Multisensor Integrated
Navigation* (2nd ed.), dead-reckoning error growth. These two ½bT² values account for
the engine’s 350 s / 6600 s split: a closed-form physics check, external to the
filter.

You can see the inertial weak link directly in the dead-reckoning scenario
([`scenarios/inertial.toml`](scenarios/inertial.toml), kind `inertial`):
`quantum holdover 6600s p95 41.39m | classical holdover 350s p95 30629.9m`: the
navigation-grade sensor diverges to tens of kilometres.

## How to read the three figures together

| Figure | What it means here | What it does **not** mean |
|--------|--------------------|---------------------------|
| **Security** | analytic spoof-*detectability* bound (`1 − P_md`) for a configured attack; the `hybrid` summary prints `n/a (no attack)` because that scenario configures none | not a multi-satellite RAIM (receiver autonomous integrity monitoring) detector |
| **Integrity** | filter self-consistency (samples inside the k-σ bound) | not aviation HPL/VPL/RAIM integrity |
| **PNT-holdover** | time in spec after GNSS loss, split into timing and position | not a 2-D CEP (circular error probable) or 2DRMS (twice the distance root mean square) accuracy |

The genuine receiver-autonomous integrity — real HPL/VPL with alert limits and a
Stanford diagram — lives in the `integrity` pack
([`scenarios/integrity.toml`](scenarios/integrity.toml)); that’s the Tier-3 reading
exercise.

## What the tests pin

- `tutorial3_spoof_analytic_matches_montecarlo` — analytic vs MC P_md agree to < 0.05
  for both clocks; `quantum security_fom > 0.9`.
- The hybrid summary (6600 s / 350 s) and the inertial split are pinned through their
  teaching scenarios ([`scenarios/hybrid.toml`](scenarios/hybrid.toml),
  [`scenarios/inertial.toml`](scenarios/inertial.toml)) by
  `teaching_scenarios_match_their_recorded_expected_summary`, which compares each
  engine summary with the `# expected:` line the file records. The ½bT² oracle above
  is the physics check on those numbers.

## Pitfalls and units

- **The timing figure of merit (FoM) is in nanoseconds; the position FoM is in metres
  and 1-DOF** (one degree of freedom: single-axis, not CEP/2DRMS).
- **`integrity 0.998` is self-consistency, not aviation integrity.**
- The classical suite’s *timing* survives only because of the optical time-transfer resync;
  read the `(t …/p …)` split, not just the headline PNT-holdover.

## Where next

- Run the honest-failure case: `scenarios/lunanet-araim.toml` (kind
  `lunar-integrity`) reports a south-pole ARAIM (advanced RAIM) pass where protection
  levels *exceed* the alert limit (HPL 263–452 m > 50 m, 0 of 24 epochs available),
  so the system is reported **unavailable**: a feature, not a bug.
- Carry the story into low Earth orbit (LEO): `scenarios/leo-resilience-gnss-jammed-leo-carries.toml`
  (kind `campaign`) chains a GNSS jamming phase, a LEO positioning layer that carries
  the user through it, and an integrity check on one timeline. See
  [the newer capabilities](README.md#beyond-the-tutorials-newer-capabilities) for the
  other resilience and vertical scenarios.
- Defend a result: do the [Tier-3 exercise](README.md#graded-exercises) — Monte-Carlo
  bands, reproducibility, and reading a protection level.
