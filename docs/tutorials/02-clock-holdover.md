# Tutorial 2 — Clock holdover: how long can you coast

**Kind:** `clock` · **Scenario:** `scenarios/clock-holdover.toml` (teaching copy:
[`scenarios/clock.toml`](scenarios/clock.toml)) · **Difficulty:** beginner · **~20 min**

> By the end you will have run a clock holdover with GNSS (Global Navigation
> Satellite System) signals denied, read the timing figure
> of merit, and understood the √(q_wf·T) drift law that explains *why* the optical
> clock outlasts the chip-scale one, with the law sourced from NIST (the US National
> Institute of Standards and Technology), not invented.

## What this scenario is

When GNSS signals go away, a system keeps time on its own onboard clock. That clock’s phase
slowly drifts, and once the drift exceeds the operational timing spec you are out of
service. **Holdover** is how long you stay in spec after GNSS loss — the headline
autonomy figure of merit.

The scenario runs a 2 h timeline: 10 min of GNSS sync, then 6600 s (1.83 h) denied,
against a 20 ns timing spec, sampled every 10 s. It compares two clocks on identical code with their *own* published
noise:

- **Quantum**: a strontium optical lattice clock, space goal σ_y(1 s) = 1×10⁻¹⁵
  (arXiv:1503.08457), a ground-demonstrator target, not flown. σ_y(τ) is the Allan
  deviation, the standard measure of clock frequency stability at averaging time τ.
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

With seed = 42, the 20 ns spec, and the 6600 s outage:

```
scenario 5ba83a232b94 | quantum holdover 6600s p95 1.20e-4ns integrity 1.000 security n/a (no attack) | classical holdover 2610s p95 19.7ns integrity 1.000 security n/a (no attack)
```

- **`quantum holdover 6600s`** — the optical clock holds the entire 6600 s outage
  without breaching 20 ns. Its 95th-percentile phase error is 1.20e-4 ns, about a
  ten-thousandth of a nanosecond: it barely moves.
- **`classical holdover 2610s`** — the CSAC breaches the 20 ns spec at ~2610 s, less
  than half the outage. Its p95 phase error (19.7 ns) sits right at the spec line.
- **`security n/a (no attack)`** — this scenario configures no attack, so there is
  nothing to detect and the summary does not print a number. The JSON still carries
  each clock’s analytic spoof-detectability bound in `fom.security` (0.997 for the
  optical clock; 0.000 for the CSAC, whose own coast noise over the window already
  exceeds 20 ns), marked `applicable: false` in the `figure_tiers` block. Scoring
  detection against a real attack is the [Tutorial 3](03-quantum-vs-classical.md)
  story.
- **`integrity 1.000`** — here this is *filter self-consistency* (the fraction of
  outage samples inside the Kalman filter’s own k-sigma bound), **not** an aviation
  horizontal or vertical protection level (HPL/VPL). See [`docs/INTEGRITY.md`](../INTEGRITY.md).

## The non-circular oracle: why 2610 s for the CSAC?

For a white-frequency-modulation (white-FM) clock the 1-σ phase error grows as
**σ_x(T) ≈ √(q_wf · T)**, where
`q_wf = σ_y(1 s)²` has units of s². This relation is from **NIST Special Publication
1065** (Riley, *Handbook of Frequency Stability Analysis*) — the σ_y(τ)↔phase
relations — the *same* SP-1065 relation that `tests/calibration.rs` validates the
engine’s Allan deviation against to ~2 %.

For the CSAC, `q_wf = (3×10⁻¹⁰)² = 9×10⁻²⁰ s²`. Solve for the time the 1-σ phase
reaches 20 ns = 2×10⁻⁸ s:

```
T ≈ (2e-8)^2 / 9e-20 = 4e-16 / 9e-20 ≈ 4444 s   (1-sigma crossing)
```

The engine’s 2610 s is not that 1-σ time, and should not be. `holdover_s` is the
first 10 s grid point (`step_s = 10`) at which *this seeded realisation’s* absolute
phase error exceeds 20 ns (`src/fom.rs`). A random walk’s first crossing of a level
often comes well before the time its 1-σ envelope reaches that level, and the
realisation also carries the residual frequency error the filter is left with after
the 600 s sync. So the law fixes the scale, a few thousand seconds for a 3×10⁻¹⁰
clock against 20 ns, not the exact value. The test asserts a **2000–3200 s band**
around it, not the number.

The datasheet anchors themselves are external, cited in the scenario’s `provenance`
strings: optical Sr lattice goal 1×10⁻¹⁵ (arXiv:1503.08457); Microchip SA.45s CSAC
3×10⁻¹⁰ (datasheet). And the exported `adev_curve` matches the datasheet σ_y(τ) to
~2 % (`tests/calibration.rs`, NIST SP 1065). Plot it as a log-log “Clock stability
(ADEV, Allan deviation)” chart in the playground.

## What the test pins

`tests/tutorials.rs::tutorial2_clock_holdover_holds`:

- `quantum holdover >= classical holdover` (the optical clock must hold at least as
  long),
- `quantum holdover ≈ 6600 s` (holds the full outage),
- `classical holdover ∈ [2000, 3200] s` — a tolerance band around the SP-1065
  white-FM scale, *not* a magic number. The oracle is the law, not the value.

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
  (2610 s → 1300 s, measured with `exercises/tier2_sweep.py`), or use `kind = "sweep"`
  to tabulate holdover against the CSAC noise level `classical_q_wf`
  (`scenarios/sweep-clock-stability.toml`: 25 points from 10⁻²⁴ to 10⁻¹⁸ s², classical
  holdover 2610 s → 250 s).
- **Tier 3:** add `runs = 200` to turn this into a Monte-Carlo ensemble and read the
  [p05–p95] holdover band (`scenarios/clock-ensemble.toml` prints
  `classical holdover 844s [220-2130]`).
- Then the capstone: [Tutorial 3 — Quantum vs classical resilience](03-quantum-vs-classical.md).
