# Stream 1: multi-satellite scene generator (`iq::scene`)

Status: built on `claude/gnss-iq-scene`. Module: `src/iq/scene/` (`mod.rs`, `code.rs`,
`geometry.rs`, `nav.rs`, `truth.rs`, `tests.rs`). Receiver-level tests:
`tests/iq_scene_receiver.rs`. Example: `examples/iq_scene.rs`.

## What it does

- `GpsL1Ca`: GPS L1 C/A as a `SpreadingCode`, wrapping `sdr::CaCode` with the same chip
  mapping as `sdr::correlate`'s replica. Each satellite takes any
  `Box<dyn SpreadingCode + Send + Sync>` (`SceneCode`), so stream 6's codes plug in; the
  `Send + Sync` bound is what lets synthesis run on scoped threads.
- Geometry: `SatGeometry::Broadcast` evaluates a `rinex::RinexEphemeris` (from
  `rinex::parse_nav`) with the IS-GPS-200 user algorithm at the light-time-solved transmit
  time, rotated for Earth rotation (`pvt::sagnac_rotate`), with the broadcast satellite clock
  less its reference group delay. `SatGeometry::Profile` takes a quadratic range with fixed
  look angles for tests. Pseudorange rate: exact for profiles, a 1 ms central difference for
  ephemerides.
- Receiver: `Trajectory::{Static, ConstantVelocity, Waypoints}` (linear interpolation, held
  outside), `ReceiverClock { bias_s, drift_s_per_s }`; the local oscillator is locked to the
  receiver clock, so drift appears as `-drift * f` on every carrier.
- Per sample, per satellite, per channel path: code phase from transmit time
  (`t - P/c - τ`), carrier phase `-f P / c` plus the path phase, data bit at the transmit
  time, amplitude `sqrt(C/N0 * N0)`. C/N0 stated per satellite or from `ElevationCn0`
  (MODELLED, `horizon + (zenith - horizon) * sin(el)`). Complex white Gaussian noise of
  power `N0 * fs` (`NoiseConfig`, from a noise figure and antenna temperature), optionally
  normalised to unit power.
- Geometry and channel are evaluated at `geometry_rate_hz` (default 1 kHz) knots; the
  pseudorange between knots is a cubic Hermite interpolant of `P` and `dP/dt` (continuous
  phase and frequency, exact for quadratic range).
- Navigation data: `NavData::Lnav` encodes subframes 1 to 3 with `gps_lnav` (ephemeris from
  `lnav_from_rinex`), subframes 4 and 5 with a valid TLM/HOW and zero data words (MODELLED:
  no almanac pages); `NavData::Seeded` is a seeded random 50 bit/s stream (MODELLED);
  `NavData::None` is data-free.
- Channel hook: `SceneChannel` trait (blanket-implemented for
  `FnMut(sat_id, t_s) -> ChannelSnapshot`), called once per satellite per knot in time-major
  order; each `PathState` is a separate copy of the signal (extra group delay on code and
  data, carrier phase added, amplitude scaled, extra Doppler advancing the phase between
  knots). Default: direct path only.
- Chunked generation: `Scene::generate(sink, truth)` or `Scene::into_stream()` (an
  `IqSource`). Memory is the chunk plus two knots and one bit window per satellite.
  Deterministic for any chunk size and thread count: noise of sample `k` comes from ChaCha8
  stream position `4k` (Box-Muller).
- Truth sidecar: `TruthRecord` per satellite per epoch (time, id, visible, elevation,
  azimuth, C/N0, pseudorange, code phase, Doppler, accumulated carrier phase), streamed
  through `TruthSink` (`Vec`, `CsvTruthWriter`, `JsonLinesTruthWriter`, `NullTruth`) and
  whole-table CSV/JSON round-trips.

## Measured results (seeded, `cargo test --test iq_scene_receiver -- --nocapture`)

| Check | Reference | Result | Bar |
|---|---|---|---|
| 4 satellites, 45 to 50 dB-Hz, seeded data: acquisition | `sdr::acquire` | all acquired, ratio 2.8 to 11.0, code within 1 chip, Doppler within half a 500 Hz bin | as stated |
| refined code phase | E-L discriminator on `sdr::correlate` taps | 0.0026 to 0.0037 chip | 0.05 chip |
| refined Doppler | squared-prompt phase slope on `sdr::correlate` | -0.43 to +0.17 Hz | 2 Hz |
| tracking | `sdr::track`, 60 epochs | Q/I power 0.008 to 0.038, E/L 0.011 to 0.067, prompt / A·N 0.95 to 1.01 | 0.1, 0.15, ±15 % |
| C/N0 45 and 38 dB-Hz | closed form `E|P|²/σ² - 1 = C/N0·T`, 400 ms | 44.93, 37.84 dB-Hz | 0.3, 0.6 dB |
| broadcast scene (IGS BRDC 2018-05-13, Frankfurt, clock bias and drift) | `pvt::solve_spp` from truth pseudoranges | 9 visible, position 2.3e-9 m, clock 1.5e-9 m | 1 mm |
| truth Doppler vs `-range_rate/λ` | closed form | equal to 1e-12 relative | 1e-12 |
| carrier rotation in the samples | lag-one phase of the noise-free samples | within 1e-3 Hz | 1e-3 Hz |
| noise power | closed form `N0·fs` | within 2 % | 2 % |
| LNAV frames | `gps_lnav::decode_fields`, parity re-encode | every field and parity bit | exact |
| chunked / threaded vs one-shot (stateful channel, LNAV and seeded data) | itself | bit-identical | exact |

## Limitations (stated, not hidden)

- `sdr::acquire` searches whole chips (up to 6 dB grid loss), so the four-satellite test
  places each code phase 0.1 chip past a whole chip, and the broadcast-scene acquisition
  check uses a peak-ratio bar of 1.5. The scene's own code phase is fractional and exact.
- No ionosphere, troposphere or multipath of its own (stream 2 supplies them through the
  channel hook); no antenna pattern beyond the MODELLED elevation C/N0; no front-end
  filtering or quantisation (stream 4); output is f64 complex through `IqSink` (file formats
  are stream 5).
- LNAV subframes 4 and 5 carry no almanac/ionosphere/UTC pages. A scene must not cross a GPS
  week boundary. Receiver and satellite clocks are deterministic (no clock noise).
- Amplitude, visibility and channel paths are held between geometry knots (1 ms by default).
- Bit-identical output is guaranteed on one platform; `sin`, `cos` and `ln` come from the
  platform library, so another platform may differ in the last bits.
- Out of scope per the plan: no interference or spoofing waveforms in the scene (the
  separate `spectrum` kind writes analytic jammer IQ snapshots, and `spoof_capture` models a
  spoofer replica in memory), nothing that drives radio hardware.

## CHANGELOG entry (for integration to merge)

```
### Added
- `iq::scene`: multi-satellite GNSS IQ scene generator for software-receiver testing. GPS L1
  C/A as a `SpreadingCode` (any code plugs in), geometry from RINEX broadcast ephemerides or
  stated range profiles, static / constant-velocity / waypoint receivers with clock bias and
  drift, LNAV data from `gps_lnav`, C/N0 stated or elevation-based (MODELLED), thermal noise
  from a noise figure, a channel hook applying each `PathState` as a signal copy, chunked and
  threaded generation through `IqSink` (bit-identical for any chunking), and a truth sidecar
  (CSV / JSON). Checked by acquiring and tracking the scene with `sdr` (code 0.004 chip,
  Doppler 0.5 Hz), the closed-form coherent SNR (C/N0 within 0.2 dB) and SPP on broadcast
  pseudoranges (sub-micrometre).
```

## VALIDATION entry (for integration to merge)

```
| IQ scene generator (`iq::scene`) | MODELLED signal; receiver-side checks against independent code |
  `tests/iq_scene_receiver.rs`: `sdr::acquire` / `track` / `correlate` recover injected code
  phase (< 0.004 chip) and Doppler (< 0.5 Hz) for four satellites; prompt power matches the
  closed-form C/N0·T to 0.17 dB at 45 and 38 dB-Hz; `pvt::solve_spp` on the scene's broadcast
  pseudoranges recovers the receiver to 2e-9 m. Unit tests: Doppler = -range_rate/λ (1e-12),
  noise power N0·fs, LNAV frames decode with parity, chunked = one-shot bit for bit. |
```
