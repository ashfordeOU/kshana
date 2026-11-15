<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B3c (0.42 V1): the TDOA locator successor: synthetic gate result

Pre-registration: `PREREGISTRATION.md` (15 November 2026). Readings: U1 to U14 in `xval/tdoa-locator-b3c/README.md`.
The gate was run once. The bars were not changed. MODELLED: synthetic data only.

| Step | Commit |
|---|---|
| Pre-registration and readings U1 to U13, before the oracle, any code and any session | `68552fb09` |
| The independent oracle `oracle.py` (numpy and the standard library) | `f6615bd8b` |
| Engine code (`src/locate_tdoa_b3c.rs`) and gate runner, before the development run | `f8c16b883` |
| Development run (seeds 8001 to 8200) and reading U14, before the gate | `17c1e00d8` |
| The gate (seeds 9001 to 10000), the oracle check, the pinning tests and this file | this commit |

## Summary (1 000 sessions; 6 to 12 stations on 5 to 30 km layouts; B3b's world)

| Bar | G-wb (chirp and noise, 666 sessions) | G-all (every session, 1 000) |
|---|---|---|
| T1 coverage (bar ≥ 0.90) | **MET**: 0.937 | **NOT MET**: 0.624 |
| T2 non-vacuity (bar ≤ 0.25) | **MET**: median area share 3.0 × 10⁻⁶ | **MET**: 1.2 × 10⁻⁵ |
| T3 centroid (bar ≤ 0.5) | **MET**: 0.0049 × the median nearest-neighbour spacing | **MET**: 0.013 |
| T4 determinism | see below | see below |
| **Verdict** | **MET** | **NOT MET** (T1), as stated in the pre-registration before the run |

**Per waveform** (no bar): CW, 334 sessions, all narrowband and not located (T1 0, T3 3.32); chirp, 333 sessions,
all classed periodic, 1 not located, T1 0.934, T3 0.0046; noise, 333 sessions, all classed aperiodic, 8 not located,
T1 0.940, T3 0.0053. The screen of U4 put every CW session, and no other, in the narrowband class.

The gate ran on 15 November 2026 from 10:32:00 to 10:34:56 UTC with a release build of `17c1e00d8`
(`locate_tdoa_b3c_gate gate`; output `xval/tdoa-locator-b3c/gate.json.gz`, SHA-256 of the uncompressed file
`0aca14423c753120d093403f7b44dee773e836deb3e485b02b9cd15cd1ad5fd4`).

**T4.** A debug build of the same commit gives the same bytes on Linux (10:40:43 to 11:00:10 UTC, the same
SHA-256), and the
`b3b-determinism` CI job now also runs `tests/locator_tdoa_b3c.rs` with its ignored tests, which reproduces the
whole recorded gate on Linux, macOS and Windows. T4 is recorded as met on Linux; the three-platform part is met
when that job is green on this branch.

## Independent check (U12)

`oracle.py` recomputed seeds 9001 to 9020 from the engine's input files (`oracle_9001-9020.json`). All 20 agree: the
reference, the class, every `k*`, the located and covered flags are equal; every `τ̂` is equal to the last bit (the
golden-section searches took the same path); `P̂` equal; σ within 3.1 × 10⁻¹⁴ relative; the solutions within
6.3 × 10⁻⁶ m; the region areas within 1.9 × 10⁻⁹ relative. Before the development run the same check passed on
development seeds 8001 to 8020. `tests/locator_tdoa_b3c.rs` pins both the agreement and the recorded verdicts.

## What the result shows (descriptive, after the run)

- **The three changes named after B3b were enough on this world.** With the band-limited refinement the delay errors
  are of the size of the station clocks, which σ already carried, so the χ² test now accepts consistent fits: 657 of
  666 wideband sessions are located (B3b located 128 of 1 000).
- **Periodic chirps are handled.** Every chirp was classed periodic and its delays wrapped; 332 of 333 were located.
- **Coverage is under the nominal 95 %.** G-wb's 0.937 is above the 0.90 bar but below the 0.95 a perfectly calibrated
  ellipse would give: 33 located sessions have the truth outside their 95 % ellipse (21 chirp, 12 noise). Nothing was
  tuned to close that gap.
- **Not located (9 wideband sessions):** every one has its jammer outside the stations' hull, 3.5 to 9.9 km beyond
  it (examined after the run). Three solutions land within 0.5 km of the truth but just past the 10 km domain edge
  (9294, 9510, 9687); three land within 65 m of the truth with a χ² slightly above the 0.999 quantile (9074, 9303,
  9666); three weak jammers (−8.8 to −9.2 dBW) give wrong delays and a fit with a very large cost (9288, 9351, 9810).
- **CW is not located, by design.** A carrier has no bandwidth to time against; B3c says "not located: no usable
  bandwidth" instead of returning a position. That is why G-all misses T1.

## What this does and does not unlock

- **F2 (interference geolocation) stays off.** By the pre-registration a met G-wb is necessary, not sufficient: F2
  also needs the blind real-data run of B3a's section 3 (Jammertest 2027, only if multi-station IQ snapshots are
  published with a stated licence). That run has not been made. Any later use would be limited to sessions the
  locator classes as wideband.
- The world is B3b's synthetic one: two-ray ground reflection, 6 dB shadowing, Gaussian station clocks at 20 ns, one
  stationary jammer, no multipath beyond the two-ray model. A real network differs in all of these.

## What is not checked

Any real jammer, station or clock; multipath beyond the two-ray model; moving or multiple jammers; clocks worse than
20 ns or with jumps; any surface other than the Rust library (B3c has no command line, Python or WebAssembly entry).
