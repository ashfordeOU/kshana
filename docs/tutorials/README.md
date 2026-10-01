# Tutorials

Hands-on, worked examples that take you from “run a shipped scenario” to
“quantify and defend a result.” Every number quoted in the three tutorials is a real
engine output, anchored to an external (non-circular) authoritative oracle, and
**pinned by an integration test** (`tests/tutorials.rs`), so a tutorial can never
silently drift from what the engine actually does. If a tutorial says the optical
clock holds 6600 s, the test fails the build the day that stops being true.

Kshana is a positioning, navigation and timing (PNT) simulator. The tutorials use a
few more abbreviations, each spelled out where it first appears: GNSS (Global
Navigation Satellite System), GPS (Global Positioning System), CLI (command-line
interface) and TOML (Tom's Obvious Minimal Language, the scenario file format).

New to the project? Read the [concepts primer](../CONCEPTS.md) and the
[glossary](../GLOSSARY.md) first, then come back here.

## The three worked examples

| # | Tutorial | What you learn | Scenario kind | Difficulty | ~Time |
|---|----------|----------------|---------------|------------|-------|
| 1 | [My first orbit: where are the GPS satellites](01-first-orbit.md) | propagate a real GPS constellation, read availability, position dilution of precision (PDOP) and position accuracy, and export where the satellites actually are (SP3 precise-orbit format) | `orbit` | beginner | 15 min |
| 2 | [Clock holdover: how long can you coast](02-clock-holdover.md) | run a GNSS-denied clock holdover, read the timing figure of merit, and understand the √(q_wf·T) growth law behind it | `clock` | beginner | 20 min |
| 3 | [Quantum vs classical GNSS resilience](03-quantum-vs-classical.md) | the capstone: a spoofing detector (`spoof`) and a full fused PNT suite (`hybrid`), and how to read security / integrity / dead-reckoning together | `spoof` + `hybrid` | intermediate | 35 min |

## How to run a tutorial

Every tutorial runs the same scenario three ways; pick whichever fits you. They
all call the *one* engine, so the numbers are identical (mirrors the README
[Usage](../../README.md#usage) section).

**Command line.** The CLI dispatches on the scenario’s `kind` field and writes
`<scenario>.result.json`, `<scenario>.chart.svg`, `<scenario>.report.html` and
`<scenario>.report.json` next to the input (JSON is JavaScript Object Notation, SVG
Scalable Vector Graphics, HTML HyperText Markup Language). A few kinds also publish a
reproducibility table as `<scenario>.table.csv` (comma-separated values):
`realtime-frame-eop`, `lunar-time-budget`, `lunar-jamming`, `leo-navmsg`,
`telecom-timing`, and `moonlight-service-volume` when an export site is set. None of
the three tutorials is one of them, so you will not see that file here.

```bash
cargo run -- scenarios/orbit-sgp4-gps.toml
```

`cargo run --` builds the CLI from this checkout. With an installed binary
(`cargo install kshana`) the same command is `kshana scenarios/orbit-sgp4-gps.toml`.
Without a checkout, most shipped scenarios are bundled in the binary:
`kshana example` lists them (and names the few that are not bundled, with the reason),
and `kshana example orbit-sgp4-gps > orbit-sgp4-gps.toml` writes one out: the copy of
`scenarios/orbit-sgp4-gps.toml` the binary was built with.

**Python.** Build the extension from this checkout once with maturin, inside an
active virtual environment, then call `kshana.run`:

```bash
pip install maturin
maturin develop --features python
```

```python
import json, kshana
result = json.loads(kshana.run(open("scenarios/orbit-sgp4-gps.toml").read()))
print(result["geometry"]["best_pdop"])
```

`pip install kshana` installs the published wheel instead. It can lag this
checkout: `json.loads(kshana.list_kinds())` tells you which scenario kinds your
build has.

**Browser playground.** Zero install: open the
[Studio](https://kshana.dev/studio/), pick a scenario, edit the
parameters, and read the result. Nothing is uploaded; the engine runs client-side
as WebAssembly.

The tutorials quote the **CLI**, but every command has the Python and playground
equivalent above. Each result is reproducible from `scenario + seed + engine
version`: run it twice and you get bit-identical output.

## Annotated teaching scenarios

For each capability domain there is one heavily-commented `.toml` under
[`scenarios/`](scenarios/): a *teaching copy* of a canonical scenario with every
field explained inline, the cited oracle named, and the expected one-line summary
recorded as an `# expected:` comment. The field values are identical to the
parent’s in the repo’s top-level `scenarios/` directory (`tests/tutorials.rs`
compares the parsed TOML), so the documented output stays true. The golden hashes
are untouched too: a comment never changes a scenario hash.

| Domain | Teaching file | Kind | Derived from |
|--------|---------------|------|--------------|
| Clock holdover | [scenarios/clock.toml](scenarios/clock.toml) | `clock` | `scenarios/clock-holdover.toml` |
| Orbit & geometry | [scenarios/orbit.toml](scenarios/orbit.toml) | `orbit` | `scenarios/orbit-sgp4-gps.toml` |
| Integrity (RAIM, receiver autonomous integrity monitoring) | [scenarios/integrity.toml](scenarios/integrity.toml) | `integrity` | `scenarios/integrity-raim.toml` |
| Security (spoofing) | [scenarios/security.toml](scenarios/security.toml) | `spoof` | `scenarios/spoof-attack.toml` |
| Hybrid PNT | [scenarios/hybrid.toml](scenarios/hybrid.toml) | `hybrid` | `scenarios/hybrid-pnt.toml` |
| Inertial dead-reckoning | [scenarios/inertial.toml](scenarios/inertial.toml) | `inertial` | `scenarios/imu-deadreckoning.toml` |
| Time transfer | [scenarios/timetransfer.toml](scenarios/timetransfer.toml) | `timetransfer` | `scenarios/timetransfer.toml` |
| GNSS measurement domain | [scenarios/gnss-sim.toml](scenarios/gnss-sim.toml) | `gnss-sim` | `scenarios/gnss-sim-raim.toml` |

> The teaching file for **security** uses `kind = "spoof"` inside: the Security
> figure of merit (`1 − P_md`, one minus the probability of missed detection) is
> produced by the spoof pack. The file name follows the *capability* (security), the
> `kind` follows the *pack* (spoof). The header of that file calls this out.

## The full scenario-kind catalogue

The engine dispatches on the scenario’s `kind`. The table below lists the most
commonly-used kinds (the eight tutorial domains above plus their nearest neighbours).
It is **not** the complete set: `src/api.rs::list_scenario_kinds()` returns all **75**
built-in kinds. That function (exposed as `list_kinds()` in the Python and WebAssembly (WASM) bindings,
and as `kshana kinds --json` on the command line) is the authoritative,
always-current catalogue, and [`SCENARIOS.md`](../SCENARIOS.md) is its generated
enumeration, one section per kind with the required and optional TOML fields.
`tests/tutorials.rs::tutorial_scenarios_use_real_kinds` enforces that every kind a
tutorial documents is a real dispatch kind, so nothing in this table can name a kind
that does not exist.

| Kind | What it does |
|------|--------------|
| `clock` | Clock holdover vs spec; optional Monte-Carlo ensemble (`runs > 1`). |
| `inertial` | 1-DOF (one degree of freedom) inertial dead-reckoning during a GNSS outage. |
| `orbit` | GNSS availability + dilution of precision (DOP) from a constellation (Walker / two-line elements / RINEX, the Receiver Independent Exchange format). |
| `integrity` | Snapshot / solution-separation / ARAIM (advanced RAIM) with horizontal and vertical protection levels (HPL/VPL) + Stanford diagram. |
| `lunar-integrity` | Lunar south-pole ARAIM protection-level pass vs a LunaNet relay set. |
| `timetransfer` | Optical vs radio-frequency (RF) two-way time/frequency transfer. |
| `hybrid` | Hybrid PNT capstone: clock + inertial measurement unit (IMU) + time-transfer aiding. |
| `fusion` | Joint Kalman sensor-fusion PNT over the same hybrid inputs. |
| `gnss-ins` | Loosely- and tightly-coupled GNSS/INS (inertial navigation system) error-state extended Kalman filter. |
| `gnss-sim` | Measurement-domain pseudorange simulation (Klobuchar ionosphere, Saastamoinen/Niell troposphere) + RAIM. |
| `jamming` | Link-budget jamming: jammer-to-signal ratio (J/S) → effective carrier-to-noise density (C/N₀) → loss of lock. |
| `spoof` | Stochastic time-spoof detector (Neyman–Pearson / χ²₁) with Monte-Carlo false-alarm and missed-detection probabilities (P_fa/P_md). |
| `sweep` | 1-D trade-study sweep over a clock-pack parameter. |
| `sweep-nd` | Generic N-D sweep over any pack via dotted TOML keys / JSON metric paths. |

## Beyond the tutorials: newer capabilities

The three tutorials stay on the classic clock, orbit and security packs. The engine
has grown well past them. Each row below is a shipped scenario you can run as it
stands (`cargo run -- <file>` or `kshana <file>`); the summary is the first line
kshana 0.29.3 printed for it on 2026-09-29. Unlike the tutorial figures, these lines
are a record of one run, not pinned by `tests/tutorials.rs`: rerun the scenario for
the current value. Results state their own scope (most carry a `label`), and the
[verification matrix](../VERIFICATION-MATRIX.md) states which capabilities are
VALIDATED against an external oracle and which are MODELLED.

| Capability | Scenario | Kind | First line of the summary | Read more |
|------------|----------|------|---------------------------|-----------|
| L-band spectrum and jamming waterfall | `scenarios/l-band-waterfall-jamming.toml` | `spectrum` | `scenario spectrum \| 5 bands \| 3 jammers \| noise floor -202.0 dBW/Hz \| worst band gps-l1ca min C/N0 3.2 dB-Hz (J/S 60.2 dB)` | [SPECTRUM.md](../SPECTRUM.md) |
| The solar system at one epoch | `scenarios/solar-system-tour.toml` | `solar-system` | `Solar system at 2026-09-28T00:00:00 (JD 2461311.50080 TDB), 18 bodies, observer Earth` | [SCENARIOS.md](../SCENARIOS.md#solar-system) |
| Positioning around another body | `scenarios/europa-surface-pnt.toml` | `body-pnt` | `Positioning around Europa — surface user, 12 relays at 4500 km, 171 epochs` | [SCENARIOS.md](../SCENARIOS.md#body-pnt) |
| Constellation design at scale | `scenarios/constellation-multi-gnss-coverage.toml` | `constellation-design` | `constellation-design: 102 satellites (GPS, Galileo, BeiDou, GLONASS) around the Earth; availability 100.00% (PDOP <= 6 at 10 deg mask), …` | [CONSTELLATION-DESIGN.md](../CONSTELLATION-DESIGN.md) |
| Campaigns: kinds chained on one timeline | `scenarios/campaign-jam-spoof-holdover-integrity.toml` | `campaign` | `campaign f87a4a0e0bab \| Jamming, spoofing, holdover and integrity: a chained mission \| chain: 6 phases over 4570 s, …` | [CAMPAIGNS.md](../CAMPAIGNS.md) |
| One LEO-PNT system end to end | `scenarios/leo-pnt-end-to-end.toml` | `leo-pnt-chain` | `LEO-PNT end to end, generic 1080 km constellation` | [LEO-PNT.md](../LEO-PNT.md) |
| Fused MEO + LEO positioning | `scenarios/meo-leo-fused-pvt.toml` | `leo-pvt` | `LEO PVT (joint) at 40.42, -3.70 over 1800 s` | [LEO-PNT-FUSION.md](../LEO-PNT-FUSION.md) |
| LEO signals, passes and navigation messages | `scenarios/leo-band-trade.toml`, `scenarios/leo-pass-iridium.toml`, `scenarios/leo-navmsg-encode-decode.toml` | `leo-signal`, `leo-pass`, `leo-navmsg` | `LEO pass link budget, air user at 50.00, -30.00; 1 LEO satellite(s), 900 s window` (the pass) | [LEO-SIGNAL.md](../LEO-SIGNAL.md), [LEO-PASS.md](../LEO-PASS.md), [LEO-NAVMSG.md](../LEO-NAVMSG.md) |
| PPP convergence with a LEO layer; 5G positioning | `scenarios/leo-ppp-convergence.toml`, `scenarios/ntn-5g-positioning.toml` | `leo-ppp`, `ntn-positioning` | `PPP convergence to 0.10 m horizontal / 0.10 m vertical, 12 runs per case, 96 GNSS satellites` | [SCENARIOS.md](../SCENARIOS.md#leo-ppp) |
| Resilience: GNSS jammed, LEO carries the user | `scenarios/leo-resilience-gnss-jammed-leo-carries.toml` | `campaign` | `campaign 248395b851cc \| GNSS jammed, LEO-PNT carries the user, integrity maintained \| chain: 3 phases over 2100 s, …` | [RESILIENCE-CROSSWALK.md](../RESILIENCE-CROSSWALK.md) |
| Verticals: rail, maritime, telecom, vehicles, Arctic | `scenarios/leo-vertical-rail-maritime.toml` (and the other `leo-vertical-*` files) | `campaign` | `campaign 49575d27b696 \| Railway and maritime with a LEO layer \| chain: 3 phases over 2520 s, …` | [CAMPAIGNS.md](../CAMPAIGNS.md) |
| Telecom holdover against the ITU-T (International Telecommunication Union, Telecommunication Standardization Sector) G.8272 clock limits | `scenarios/telecom-prtc-holdover-24h.toml` | `telecom-timing` | `telecom-timing: max\|TE\| 603.2 ns over 90000 s; eprtc-a-holdover FAIL, prtc-a FAIL; 100 ns budget exceeded after 8206 s (MODELLED)` | [TELECOM-TIMING.md](../TELECOM-TIMING.md) |

LEO is low Earth orbit and MEO medium Earth orbit; PVT is position, velocity and
time; PPP is precise point positioning; 5G is the fifth-generation mobile standard;
TDB is Barycentric Dynamical Time; JD is Julian Date; TE is time error.

The CLI adds three outputs on top of any run:

- **Reports.** Every run writes `<scenario>.report.html` and `<scenario>.report.json`
  (see [REPORTS.md](../REPORTS.md)). `kshana --study <suite.toml>` runs a suite of
  scenarios into one `.study.json` and `.study.html`, for example
  `kshana --study scenarios/quantum-pnt-demonstrator.suite.toml`.
- **Animation.** `kshana <scenario.toml> --animate <svg|html|frames|all>` renders the
  run’s time series, for example `--animate html` on `scenarios/orbit-sgp4-gps.toml`
  writes `orbit-sgp4-gps.animation.html`. A kind with no sampled time axis (such as
  `solar-system`) is refused with an error; see [ANIMATION.md](../ANIMATION.md).
- **Interop exports.** `--export <czml|kml|geojson|stk|sigmf|all|list>` writes the
  result for other tools: CZML (Cesium Language), KML (Keyhole Markup Language, for
  Google Earth), GeoJSON (geographic JSON), an STK (Systems Tool Kit) ephemeris, or a
  SigMF (Signal Metadata Format) recording. `--export list` says
  which formats apply to a scenario; SigMF applies only to `spectrum`. The orbit pack
  also exports `--export-sp3`, `--export-omm` and `--export-oem` (CCSDS, the
  Consultative Committee for Space Data Systems, orbit messages). See
  [INTEROP.md](../INTEROP.md).

## Graded exercises

Work through the ladder. Each tier is harder and more defensible than the last;
reference solutions live in [`exercises/`](exercises/).

| Tier | Goal | What you do | Reference solution |
|------|------|-------------|--------------------|
| **Tier 1 — run & read** | run a shipped scenario unchanged and read one figure of merit | Run `scenarios/clock-holdover.toml`; print the quantum vs classical `holdover_s`. CLI, playground, or a one-line Python call. | [exercises/tier1_run.py](exercises/tier1_run.py) |
| **Tier 2 — edit & sweep** | change one parameter and observe a monotone effect | Tighten the clock spec (`threshold_ns`) or lengthen the outage and watch holdover drop; or use `kind = "sweep"`/`"sweep-nd"` to tabulate it. | [exercises/tier2_sweep.py](exercises/tier2_sweep.py) |
| **Tier 3 — quantify & defend** | Monte-Carlo, confidence bands, reproducibility, and a protection level | Run a clock ensemble (`runs = N`), read the [p05–p95] band, confirm two runs give an identical `scenario_hash`, and read an integrity / Stanford result. | [exercises/tier3_montecarlo.py](exercises/tier3_montecarlo.py) |

The reference solutions use the Python extension (`maturin develop --features
python` first). Run from the repository root, `tier2_sweep.py` prints the chip-scale
atomic clock’s holdover falling from 2610 s at a 20 ns spec to 1140 s at 5 ns.

### Want fresh data?

The headline numbers in these tutorials run entirely from scenarios already in the
repo. Nothing is fetched, which is what keeps them reproducible and safe to run in
continuous integration (CI). For the “extend it” exercises you can pull live data:

- **GPS two-line elements (TLEs)** (refresh the orbit constellation):
  <https://celestrak.org/NORAD/elements/gp.php?GROUP=gps-ops&FORMAT=tle>, plain-text
  3-line element sets (name + line 1 + line 2). Helper: `scripts/fetch_tles.sh`. Open
  data (US Space Force 18th Space Defense Squadron catalogue, redistributed by
  Celestrak, Dr T. S. Kelso).
- **SGP4 (Simplified General Perturbations 4) verification oracle** (already vendored,
  don’t refetch): AIAA (American Institute of Aeronautics and Astronautics) 2006-6753
  “Revisiting Spacetrack Report #3” test vectors,
  <https://celestrak.org/publications/AIAA/2006-6753/>, used by
  `tests/sgp4_verification.rs`; see [`docs/SGP4-VALIDATION.md`](../SGP4-VALIDATION.md).
- **Clock-stability relations oracle**: NIST (National Institute of Standards and
  Technology) Special Publication 1065 (Riley, *Handbook of Frequency Stability
  Analysis*), <https://tf.nist.gov/general/pdf/2220.pdf>, the σ_y(τ)↔phase relations
  behind Tutorial 2.
