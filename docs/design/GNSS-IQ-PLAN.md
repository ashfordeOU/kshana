# GNSS IQ layer: plan and build rules

Status: in progress. Contract module: `src/iq/mod.rs`.

## Goal

Take Kshana from a single-satellite, short-block GPS L1 C/A front end (`src/sdr.rs`) to a
signal-level layer a receiver engineer can use end to end in software:

1. long, multi-satellite IQ scenes for software-receiver testing;
2. propagation effects applied at the signal level (ionosphere and its scintillation,
   troposphere, multipath, non-line-of-sight);
3. a fuller software receiver (front end, acquisition, tracking, mitigation DSP);
4. more signals than GPS L1 C/A;
5. data handling for large recorded IQ datasets (multi-gigabyte, many files);
6. fitting the open receiver's models to a real receiver's observed behaviour in lab runs.

Everything runs where the engine runs: the command line, Python, the MCP server, and (for
short runs) WebAssembly. Long runs are native only and stream to and from disk in bounded
memory.

## Out of scope

- Synthesis of interference or spoofing waveforms into this layer's scenes (`iq::scene`
  generates legitimate GNSS signals only). The existing analytic jamming, loss-of-lock and
  capture models (`src/jamming.rs`, `src/tracking_loop.rs`, `src/spoof_capture.rs`) and
  recorded lab IQ remain the path for studying receiver response to interference. Scope
  note (2026-10-07): outside this layer, the `spectrum` kind's `[iq]` section has written
  SigMF snapshots of its analytic model, configured jammers included, since 0.29.0, and
  `spoof_capture` sums an authentic and a spoofer replica signal in memory (never written
  out) to test loop capture. Neither transmits anything.
- Any output format or interface that drives radio hardware. Output is files for software
  receivers.
- Claims about a specific commercial receiver's internals. Lab-fit results describe the
  open receiver's models fitted to observed behaviour, with the fit error stated.

## Streams

Each stream is a submodule of `src/iq/`, built on its own branch and merged into
`claude/gnss-iq`.

| # | Stream | Submodule(s) | Depends on |
|---|---|---|---|
| 1 | Multi-satellite scene generator | `iq::scene` | contract; uses `SpreadingCode`, `ChannelSnapshot` |
| 2 | Propagation channel | `iq::channel` | contract |
| 3 | Acquisition and tracking | `iq::acq`, `iq::track` | contract |
| 4 | Front end and mitigation DSP | `iq::frontend` | contract |
| 5 | Large-dataset handling | `iq::io` | contract |
| 6 | Signals and codes | `iq::signals` | contract |
| 7 | Lab fit of receiver behaviour | `iq::labfit` | contract, `receiver_trust`, `tracking_loop` |

Streams meet only through the contract types, so they build in parallel. Stream 1 ships
GPS L1 C/A through `SpreadingCode` itself and accepts any `SpreadingCode` from stream 6;
it accepts any channel model that yields `ChannelSnapshot`s from stream 2.

### 1. Scene generator (`iq::scene`)
Satellite geometry from broadcast ephemerides (reuse the engine's RINEX navigation and
orbit code), receiver trajectory (static, waypoints, constant velocity), receiver clock
bias and drift, per-satellite code phase, Doppler and carrier phase from geometry, C/N0
from the link budget and elevation, LNAV navigation data bits (`src/gps_lnav.rs`),
thermal noise at a stated noise figure. Chunked generation through `IqSink`, so a scene
of hours runs in bounded memory. Truth sidecar (per-satellite code phase, Doppler, C/N0
per epoch) written next to the samples so a receiver's output can be scored.

### 2. Propagation channel (`iq::channel`)
Ionosphere: group delay and phase advance of equal size and opposite sign
(code-carrier divergence), from Klobuchar or a TEC input. Troposphere: Saastamoinen
with Niell mapping (as `src/gnss_sim.rs`). Scintillation: amplitude (S4) and phase
(σφ) time series, seeded and reproducible, from a published statistical model such as
the Cornell scintillation model. Multipath and non-line-of-sight: geometric specular
reflectors plus a statistical land-mobile channel (ITU-R P.681 style). Output: a
`ChannelSnapshot` per satellite per update.

### 3. Acquisition and tracking (`iq::acq`, `iq::track`)
FFT parallel code-phase acquisition with coherent and non-coherent integration; a
multi-channel tracking bank with configurable DLL, PLL (2nd and 3rd order), FLL-assisted
PLL and Costas discriminators, carrier-aided code loop, fractional code NCO, lock
detectors, C/N0 estimators (narrowband-wideband power ratio and Beaulieu), bit
synchronisation. Configurable loop bandwidth, integration time and correlator spacing so
the same recording can be replayed through many loop designs.

### 4. Front end and mitigation DSP (`iq::frontend`)
Bandpass filtering (FIR design), quantisation (1, 2, 3, 8, 14 bits) with its SNR loss,
AGC loop, and the standard mitigation stages: adaptive notch filter, pulse blanking,
frequency-domain adaptive filtering.

### 5. Large-dataset handling (`iq::io`)
Streaming readers and writers for int8, int16, float32 and packed 2-bit IQ, real-IF to
complex conversion, decimation and resampling, segment extraction by time, SigMF with
captures and annotations across multi-file recordings, an inventory of a dataset folder,
and a batch runner that processes many recordings on worker threads (std only) and writes
CSV and JSON results. A `kshana iq` subcommand exposes it.

### 6. Signals and codes (`iq::signals`)
GPS L5 (I5, Q5 with Neuman-Hofman), L2C (CM, CL), Galileo E1-B/C (CBOC) and E5a,
BeiDou B1C (Weil codes, BOC), GLONASS L1OF (FDMA). Each code checked against its interface
control document's published first chips or octal tables.

### 7. Lab fit (`iq::labfit`)
Given receiver-trust timelines from lab runs and the stated test conditions (event
onsets, power levels), fit the tracking-loop loss-of-lock model's parameters to the
observed behaviour, report residuals and a hold-out check, and report the fitted model's
prediction for conditions between and beyond the tested ones, labelled as a prediction.

## Rules for every stream

- New files only, under `src/iq/`, `tests/`, `docs/`, `examples/`. Register the submodule
  with one `pub mod` line in `src/iq/mod.rs`. Do not edit `CHANGELOG.md`,
  `docs/VALIDATION.md` or `docs/VERIFICATION-MATRIX.md`; write the entries you would add
  into `docs/design/iq-notes/<stream>.md` and integration merges them.
- No new dependencies. std plus the crates already in `Cargo.toml`.
- Every public item documented (the documentation-coverage ratchet must not move up).
- Each numerical claim tested against an independent reference: an interface control
  document table, a closed form, a published value, or an independent implementation's
  output committed as a fixture. State the reference in the test name or doc comment.
- Honest labels: results are MODELLED unless checked against an independent oracle, and
  the doc comment says which.
- Deterministic: seeded randomness only (the crate's existing generators), same seed gives
  bit-identical output.
- `cargo fmt --all -- --check`, `cargo clippy --all-targets -- -D warnings` and the
  stream's tests pass before pushing. Build with `CARGO_PROFILE_DEV_DEBUG=0` to keep the
  target directory small.

## Integration

1. Each stream pushes its branch.
2. Integration merges the branches into `claude/gnss-iq`, resolves the `pub mod` lines,
   wires the scene generator to the channel and signal implementations, adds the CLI,
   Python, WebAssembly and MCP surfaces, and writes the changelog and validation entries.
3. A cross-stream end-to-end test: generate a scene, run it through the front end,
   acquire and track every satellite, and score the tracking output against the truth
   sidecar.
4. The full suite, then a pull request to `main`.
