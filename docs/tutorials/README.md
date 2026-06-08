# Tutorials

Hands-on, worked examples that take you from “run a shipped scenario” to
“quantify and defend a result.” Every number quoted in these tutorials is a real
engine output, anchored to an external (non-circular) authoritative oracle, and
**pinned by an integration test** (`tests/tutorials.rs`) — so a tutorial can never
silently drift from what the engine actually does. If a tutorial says the optical
clock holds 6600 s, the test fails the build the day that stops being true.

New to the project? Read the [concepts primer](../CONCEPTS.md) and the
[glossary](../GLOSSARY.md) first, then come back here.

## The three worked examples

| # | Tutorial | What you learn | Scenario kind | Difficulty | ~Time |
|---|----------|----------------|---------------|------------|-------|
| 1 | [My first orbit: where are the GPS satellites](01-first-orbit.md) | propagate a real GPS constellation, read availability / PDOP / position accuracy, and export where the satellites actually are (SP3) | `orbit` | beginner | 15 min |
| 2 | [Clock holdover: how long can you coast](02-clock-holdover.md) | run a GNSS-denied clock holdover, read the timing figure of merit, and understand the √(q_wf·T) growth law behind it | `clock` | beginner | 20 min |
| 3 | [Quantum vs classical GNSS resilience](03-quantum-vs-classical.md) | the capstone: a spoofing detector (`spoof`) and a full fused PNT suite (`hybrid`), and how to read security / integrity / dead-reckoning together | `spoof` + `hybrid` | intermediate | 35 min |

## How to run a tutorial

Every tutorial runs the same scenario three ways — pick whichever fits you. They
all call the *one* engine, so the numbers are identical (mirrors the README
[Usage](../../README.md#usage) section).

**Command line** — dispatches on the scenario’s `kind` field and writes
`<scenario>.result.json` and `<scenario>.chart.svg` next to the input:

```bash
cargo run -- scenarios/orbit-sgp4-gps.toml
```

**Python** — build the extension once with maturin, then call `kshana.run`:

```bash
pip install maturin
maturin develop --features python
```

```python
import json, kshana
result = json.loads(kshana.run(open("scenarios/orbit-sgp4-gps.toml").read()))
print(result["geometry"]["best_pdop"])
```

**Browser playground** — zero install: open the
[playground](https://ashfordeou.github.io/kshana/), pick a scenario, edit the
parameters, and read the result. Nothing is uploaded; the engine runs client-side
as WebAssembly.

The tutorials quote the **CLI**, but every command has the Python and playground
equivalent above. Each result is reproducible from `scenario + seed + engine
version` — run it twice and you get bit-identical output.

## Annotated teaching scenarios

For each capability domain there is one heavily-commented `.toml` under
[`scenarios/`](scenarios/) — a *teaching copy* of a canonical scenario with every
field explained inline, the cited oracle named, and the expected one-line summary
recorded as an `# expected:` comment. The field values are byte-for-byte identical
to the parent in the repo’s top-level `scenarios/` directory, so the documented
output stays true (and the golden hashes are untouched — a comment never changes a
scenario hash).

| Domain | Teaching file | Kind | Derived from |
|--------|---------------|------|--------------|
| Clock holdover | [scenarios/clock.toml](scenarios/clock.toml) | `clock` | `scenarios/clock-holdover.toml` |
| Orbit & geometry | [scenarios/orbit.toml](scenarios/orbit.toml) | `orbit` | `scenarios/orbit-sgp4-gps.toml` |
| Integrity (RAIM) | [scenarios/integrity.toml](scenarios/integrity.toml) | `integrity` | `scenarios/integrity-raim.toml` |
| Security (spoofing) | [scenarios/security.toml](scenarios/security.toml) | `spoof` | `scenarios/spoof-attack.toml` |
| Hybrid PNT | [scenarios/hybrid.toml](scenarios/hybrid.toml) | `hybrid` | `scenarios/hybrid-pnt.toml` |
| Inertial dead-reckoning | [scenarios/inertial.toml](scenarios/inertial.toml) | `inertial` | `scenarios/imu-deadreckoning.toml` |
| Time transfer | [scenarios/timetransfer.toml](scenarios/timetransfer.toml) | `timetransfer` | `scenarios/timetransfer.toml` |
| GNSS measurement domain | [scenarios/gnss-sim.toml](scenarios/gnss-sim.toml) | `gnss-sim` | `scenarios/gnss-sim-raim.toml` |

> The teaching file for **security** uses `kind = "spoof"` inside — the Security
> figure of merit (`1 − P_md`) is produced by the spoof pack. The file name follows
> the *capability* (security), the `kind` follows the *pack* (spoof). The header of
> that file calls this out.

## The full scenario-kind catalogue

The engine dispatches on the scenario’s `kind`. These are every built-in kind, taken
verbatim from the `ScenarioKind` enum and `list_scenario_kinds()` in `src/api.rs`
(the tutorial set covers the eight domains above; the rest are listed so you know
they exist). `tests/tutorials.rs::tutorial_scenarios_use_real_kinds` enforces that
every kind a tutorial documents is a real dispatch kind, so this table can’t drift.

| Kind | What it does |
|------|--------------|
| `clock` | Clock holdover vs spec; optional Monte-Carlo ensemble (`runs > 1`). |
| `inertial` | 1-DOF inertial dead-reckoning during a GNSS outage. |
| `orbit` | GNSS availability + DOP from a constellation (Walker / TLE / RINEX). |
| `integrity` | Snapshot / solution-separation / ARAIM RAIM with HPL/VPL + Stanford diagram. |
| `lunar-integrity` | Lunar south-pole ARAIM protection-level pass vs a LunaNet relay set. |
| `timetransfer` | Optical vs RF two-way time/frequency transfer. |
| `hybrid` | Hybrid PNT capstone: clock + IMU + time-transfer aiding. |
| `fusion` | Joint Kalman sensor-fusion PNT over the same hybrid inputs. |
| `gnss-ins` | Loosely- and tightly-coupled GNSS/INS error-state EKF. |
| `gnss-sim` | Measurement-domain pseudorange sim (Klobuchar iono, Saastamoinen/Niell tropo) + RAIM. |
| `jamming` | Link-budget jamming: J/S → effective C/N₀ → loss of lock. |
| `spoof` | Stochastic time-spoof detector (Neyman–Pearson / χ²₁) with MC P_fa/P_md. |
| `sweep` | 1-D trade-study sweep over a clock-pack parameter. |
| `sweep-nd` | Generic N-D sweep over any pack via dotted TOML keys / JSON metric paths. |

## Graded exercises

Work through the ladder. Each tier is harder and more defensible than the last;
reference solutions live in [`exercises/`](exercises/).

| Tier | Goal | What you do | Reference solution |
|------|------|-------------|--------------------|
| **Tier 1 — run & read** | run a shipped scenario unchanged and read one figure of merit | Run `scenarios/clock-holdover.toml`; print the quantum vs classical `holdover_s`. CLI, playground, or a one-line Python call. | [exercises/tier1_run.py](exercises/tier1_run.py) |
| **Tier 2 — edit & sweep** | change one parameter and observe a monotone effect | Tighten the clock spec (`threshold_ns`) or lengthen the outage and watch holdover drop; or use `kind = "sweep"`/`"sweep-nd"` to tabulate it. | [exercises/tier2_sweep.py](exercises/tier2_sweep.py) |
| **Tier 3 — quantify & defend** | Monte-Carlo, confidence bands, reproducibility, and a protection level | Run a clock ensemble (`runs = N`), read the [p05–p95] band, confirm two runs give an identical `scenario_hash`, and read an integrity / Stanford result. | [exercises/tier3_montecarlo.py](exercises/tier3_montecarlo.py) |

### Want fresh data?

The headline numbers in these tutorials run entirely from scenarios already in the
repo — nothing is fetched, which is what keeps them reproducible and CI-safe. For
the “extend it” exercises you can pull live data:

- **GPS two-line elements** (refresh the orbit constellation):
  <https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle> — plain-text
  3-line element sets (name + L1 + L2). Helper: `scripts/fetch_tles.sh`. Open data
  (US Space Force / 18th SDS catalogue, redistributed by Celestrak, Dr T. S. Kelso).
- **SGP4 verification oracle** (already vendored, don’t refetch): AIAA 2006-6753
  “Revisiting Spacetrack Report #3” test vectors,
  <https://celestrak.org/publications/AIAA/2006-6753/> — used by
  `tests/sgp4_verification.rs`; see [`docs/SGP4-VALIDATION.md`](../SGP4-VALIDATION.md).
- **Clock-stability relations oracle**: NIST Special Publication 1065 (Riley,
  *Handbook of Frequency Stability Analysis*),
  <https://tf.nist.gov/general/pdf/2220.pdf> — the σ_y(τ)↔phase relations behind
  Tutorial 2.
