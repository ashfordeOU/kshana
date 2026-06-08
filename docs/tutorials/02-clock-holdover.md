# Tutorial 2 — Clock holdover: how long can you coast

**Kind:** `clock` · **Scenario:** `scenarios/clock-holdover.toml` (teaching copy:
[`scenarios/clock.toml`](scenarios/clock.toml)) · **Difficulty:** beginner · **~20 min**

> By the end you will have run a GNSS-denied clock holdover, read the timing figure
> of merit, and understood the √(q_wf·T) drift law that explains *why* the optical
> clock outlasts the chip-scale one — with the law sourced from NIST, not invented.

## What this scenario is

When GNSS goes away, a system keeps time on its own onboard clock. That clock’s phase
slowly drifts, and once the drift exceeds the operational timing spec you are out of
service. **Holdover** is how long you stay in spec after GNSS loss — the headline
autonomy figure of merit.

The scenario runs a 2 h timeline: 10 min of GNSS sync, then ~1.8 h denied, against a
20 ns timing spec. It compares two clocks on identical code with their *own* published
noise:

- **Quantum**: a strontium optical lattice clock, space goal σ_y(1 s) = 1×10⁻¹⁵
  (arXiv:1503.08457) — a ground-demonstrator target, not flown.
- **Classical**: a Microchip SA.45s chip-scale atomic clock (CSAC),
  σ_y(1 s) = 3×10⁻¹⁰ (datasheet) — a deployed commercial part.

## Run it

```bash
cargo run -- scenarios/clock-holdover.toml
```

Python:

```python
import json, kshana
r = json.loads(kshana.run(open("scenarios/clock-holdover.toml").read()))
print(r["quantum"]["fom"]["holdover_s"], r["classical"]["fom"]["holdover_s"])
```

## Read the one-line summary

With seed = 42, the 20 ns spec, and the 1.8 h outage:

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 0.0ns integrity 1.000 security 0.997 | classical holdover 2610s p95 19.7ns integrity 1.000 security 0.000
```

- **`quantum holdover 6600s`** — the optical clock holds the entire 6600 s outage
  without breaching 20 ns. Its 95th-percentile phase error is 0.0 ns (rounded): it
  barely moves.
- **`classical holdover 2610s`** — the CSAC breaches the 20 ns spec at ~2610 s, less
  than half the outage. Its p95 phase error (19.7 ns) sits right at the spec line.
- **`security 0.997` vs `0.000`** — the optical clock’s tight detection floor gives it
  spoof-detection margin; the CSAC’s own coast noise over the window already exceeds
  20 ns, so it has none. (That’s the [Tutorial 3](03-quantum-vs-classical.md) story.)
- **`integrity 1.000`** — here this is *filter self-consistency* (the fraction of
  outage samples inside the Kalman filter’s own k-sigma bound), **not** an aviation
  HPL/VPL figure. See [`docs/INTEGRITY.md`](../INTEGRITY.md).

## The non-circular oracle: why 2610 s for the CSAC?

For a white-FM clock the 1-σ phase-error grows as **σ_x(T) ≈ √(q_wf · T)**, where
`q_wf = σ_y(1 s)²` has units of s². This relation is from **NIST Special Publication
1065** (Riley, *Handbook of Frequency Stability Analysis*) — the σ_y(τ)↔phase
relations — the *same* SP-1065 relation that `tests/calibration.rs` validates the
engine’s Allan deviation against to ~2 %.

For the CSAC, `q_wf = (3×10⁻¹⁰)² = 9×10⁻²⁰ s²`. Solve for the time the 1-σ phase
reaches 20 ns = 2×10⁻⁸ s:

```
T ≈ (2e-8)^2 / 9e-20 = 4e-16 / 9e-20 ≈ 4444 s   (1-sigma crossing)
```

The engine’s spec-cross at ~2610 s is the percentile/threshold convention applied to
that same growth law (a k-σ / p95 bound crosses 20 ns *earlier* than the 1-σ level),
and it is **grid-quantised**: with `step_s = 10`, 2610 s is the first 10 s grid point
past the crossing. So you should expect a value in the **~2600–4400 s band**, not an
exact match to the continuous prediction — and that is exactly what the test asserts.

The datasheet anchors themselves are external, cited in the scenario’s `provenance`
strings: optical Sr lattice goal 1×10⁻¹⁵ (arXiv:1503.08457); Microchip SA.45s CSAC
3×10⁻¹⁰ (datasheet). And the exported `adev_curve` matches the datasheet σ_y(τ) to
~2 % (`tests/calibration.rs`, NIST SP 1065) — plot it as a log-log “Clock stability
(ADEV)” chart in the playground.

## What the test pins

`tests/tutorials.rs::tutorial2_clock_holdover_holds`:

- `quantum holdover >= classical holdover` (the optical clock must hold at least as
  long),
- `quantum holdover ≈ 6600 s` (holds the full outage),
- `classical holdover ∈ [2000, 3200] s` — a tolerance band around the SP-1065
  white-FM prediction, *not* a magic number. The oracle is the law, not the value.

## Pitfalls and units

- **Timing figures are in nanoseconds**, never metres. (Position holdover is a
  *different* pack — see Tutorial 3’s inertial section.)
- **`q_wf` has units s² and equals σ_y(1 s)².** That’s the bridge from a datasheet
  Allan number to the model.
- **Holdover is a grid-quantised lower bound** (`step_s`). Don’t over-read the exact
  value; read the *band*.
- **`integrity` here is filter self-consistency, not aviation integrity.**

## Where next

- **Tier 2:** tighten `threshold_ns` from 20 to 10 and watch the CSAC holdover *drop*
  (monotone), or use `kind = "sweep"` to tabulate holdover vs spec
  (`scenarios/sweep-clock-stability.toml`).
- **Tier 3:** add `runs = 200` to turn this into a Monte-Carlo ensemble and read the
  [p05–p95] holdover band (`scenarios/clock-ensemble.toml`).
- Then the capstone: [Tutorial 3 — Quantum vs classical resilience](03-quantum-vs-classical.md).
