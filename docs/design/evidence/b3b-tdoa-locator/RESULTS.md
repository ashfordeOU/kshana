<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# B3b (0.41): fixed-station jammer locator by time difference of arrival: synthetic gate result

Pre-registration: `PREREGISTRATION.md` (signed off 10 November 2026). Readings: T1 to T17 in
`xval/tdoa-locator/README.md`. The gate was run once. The bars were not changed. MODELLED: synthetic data only.

| Step | Commit |
|---|---|
| Readings T1 to T16, before the oracle, any code and any session | `08555f8d9` |
| The independent oracle `oracle.py` (numpy and the standard library) | `a46a0ee90` |
| Engine code and gate runner, before the development run | `36a55b15c` |
| Development run (seeds 5001 to 5200) and reading T17, before the gate | `7089ec572` |
| The gate (seeds 6001 to 7000), the oracle check and the pinning tests | `eed00fd84` |

## Summary (1 000 sessions; 6 to 12 stations on 5 to 30 km layouts)

| Bar | Result |
|---|---|
| T1 coverage | **NOT MET**: 0.044 (bar ≥ 0.90). |
| T2 non-vacuity | **NOT MET**: median area share 1.000 (bar ≤ 0.25). |
| T3 centroid | **NOT MET**: 3.35 × the median nearest-neighbour spacing (bar ≤ 0.5). |
| T4 determinism | **MET on Linux**: a debug build and the release build give the same gate bytes (SHA-256 `8d657b26…`; the debug run 00:53 to 01:10 UTC). macOS and Windows: the `b3b-determinism` CI job (`tests/locator_tdoa.rs`, whole gate); recorded when it has run. |

872 of 1 000 sessions were not located (the χ² test of T13 failed); by T15 each counts as not covered, a full-domain
area and an error to the domain's centroid.

**Per waveform** (no bar): CW, 334 sessions, all not located, T3 3.65; chirp, 333 sessions, 324 not located, T1 0.018,
T3 3.39; noise, 333 sessions, 214 not located, T1 0.114, T3 2.50.

**B3b is NOT MET.** By the pre-registration the row stops here: no real run is made with this method.

The gate ran on 12 November 2026 from 00:49:07 to 00:50:07 UTC with a release build of `36a55b15c`
(`locate_tdoa_gate gate`; output `xval/tdoa-locator/gate.json.gz`, SHA-256 of the uncompressed file
`8d657b268b7f609d01d761cb51ef0666bc611f3331d3c836f4278e2e5fc00886`).

## Independent check (T16)

`oracle.py` recomputed seeds 6001 to 6020 from the engine's input files (`oracle_6001-6020.json`). On 19 sessions
every reference, every correlation lag, the located and covered flags, every delay (largest difference 1.3 × 10⁻¹⁸ s),
every σ (4.7 × 10⁻¹² relative), the solution and the region area agree within the reading's tolerances. On seed
6002 (a chirp; not located in both) Gauss–Newton diverges in both implementations, to points 5 × 10⁸ m and
8 × 10⁷ m away; the scored outputs agree, the diverged solutions do not. `tests/locator_tdoa.rs` pins this.

## What the result shows (descriptive, after the run)

- **The locator finds the jammer, then rejects itself.** On the noise sessions examined during development, the
  estimates lay 6 to 50 m from the truth; most sessions fail the consistency test, not the search.
- **Why the test fails.** The parabola that refines the correlation peak (T10) misplaces a peak about one sample
  wide by up to half a sample, 125 ns, while the σ of T11 (the Cramér–Rao bound plus the clocks) is about 28 ns.
  The residuals are then too large for the stated σ, and the χ² test rejects the fit.
- **Chirp.** The sawtooth chirp's correlation repeats every period (32 to 120 samples), inside the lag window, so
  the largest peak is often the wrong one.
- **CW.** A carrier has no bandwidth to time against, as the pre-registration expected.
- **What a successor would need** (a new pre-registration, not done here): a refinement matched to the signal's
  correlation shape (for example, fitting the band-limited correlation, or upsampling before the peak search), or a
  σ that includes the refinement error; a lag search that handles periodic waveforms; a bounded solver step. None
  of these is done or claimed here.

## What is not checked

Any real jammer, station or clock; multipath beyond the two-ray model; moving jammers; any surface other than
the Rust library (the locator has no command line, Python or WebAssembly entry).
