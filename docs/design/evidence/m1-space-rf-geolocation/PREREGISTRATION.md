# M1: space RF geolocation accuracy: pre-registration

**Status: Proposed for the owner's sign-off (0.41 phase 2); becomes binding when signed off and committed before any implementing code or data.**
Numbers marked *proposed* are for the owner to fix at sign-off. After that, bars may be tightened
after a run, never loosened. A miss is recorded in `RESULTS.md` with its numbers, and its test
asserts the recorded miss. Public sources only. Advisory software, not certified equipment.

## Why this row

Roadmap row M1 (workstream M, "space RF survey"). A wide-area RF survey from low Earth orbit is
only useful for maritime safety and situational awareness if the location error of each fix is
known: a fix with a 20 km error cannot be matched to a vessel's AIS report, and a fix with a
1 km error can. Public statements about such systems usually give revisit figures but not
geolocation accuracy, which depends on the method (single-satellite Doppler, a formation's time
and frequency differences, several passes fused), on the signal class and on the geometry over
the area. M1 produces those error ellipses as maps, and checks the bound machinery against an
independent recomputation and against one published case.

The engine already has the ground-network pieces in `src/geolocation.rs` (MODELLED): time- and
frequency-difference prediction for moving receivers, an iterative least-squares solver, the
Fisher information and its inverse for time differences (`tdoa_fisher`, `tdoa_crlb`,
`tdoa_crlb_cov`), the bound with the emitter constrained to a sphere (`tdoa_crlb_on_sphere`), and
the joint time- and frequency-difference bound (`tdoa_fdoa_crlb`). Its tests are self-consistency
checks only. **Missing**, and built after this file is committed: the space receiver geometry
(receivers on propagated orbits), a single-satellite frequency-of-arrival model with an unknown
emitter carrier offset, multi-pass fusion, the emitter-class table and the map output.

## Definitions (fixed now)

**Geometry.** Satellites on circular 550 km orbits, sun-synchronous inclination (97.59°, from the
first-order J2 nodal rate), propagated with the engine's existing J2 secular model. Emitter on
the WGS 84 ellipsoid at height 0 (sea surface), static, unless a class below says otherwise. All
bounds use the **known-height constraint** (emitter on the surface), as `tdoa_crlb_on_sphere`
does for time differences, extended to the ellipsoid and to frequency measurements.

**Methods.**
- **S1, single satellite, one pass.** Frequency of arrival `f_k = f_0 (1 − Ṙ_k / c)` at `K`
  epochs over the visible part of one pass (elevation at the emitter ≥ 10°), sampled every
  `Δt = 10 s`. Unknowns: horizontal position (2) and the emitter's carrier `f_0` (1, nuisance).
- **F2 / F3, formation of two or three satellites.** Same orbit plane, in-track separation
  `d = 50 km` (*proposed*) between neighbours. Time differences (`N − 1` per epoch) and frequency
  differences (`N − 1` per epoch) at the same epochs as S1. Unknowns: horizontal position (2).
- **MP, multi-pass fusion.** Fisher information summed over the `M` passes of one satellite
  (S1) or one formation (F2) inside a 24 h window starting 2025-01-01 00:00 UTC, independent
  passes, static emitter, a separate carrier unknown per pass. Reported for `M = 1 … all`.

**Measurement noise per class** (all *proposed*; each row states its public basis). The
standard deviations come from the post-integration SNR with the textbook ambiguity-function
accuracy relations (*Algorithms for ambiguity function processing*, IEEE Trans. Acoustics,
Speech, and Signal Processing 29(3), 1981, pp. 588–599):
`σ_τ = 1 / (β_rms · sqrt(B·T·γ))`, `σ_f = 1 / (τ_rms · sqrt(B·T·γ))`, where `β_rms` is the RMS
bandwidth (rad/s), `τ_rms` the RMS duration (s) of the collected signal, `B` the noise bandwidth,
`T` the integration time and `γ` the effective input SNR
`γ = γ_1 γ_2 / (1 + γ_1 + γ_2)` of the two channels. For S1, `σ_f` uses the single-channel SNR.
The SNR is a free-space link budget: EIRP − FSPL(slant range) + receive gain 0 dBi − kTB with
`T_sys = 500 K`.

| Class | Carrier | EIRP | `B` | `T` per measurement | Public basis |
|---|---|---|---|---|---|
| AIS VHF | 161.975 MHz | 41 dBm (12.5 W, class A) | 25 kHz | 26.7 ms (one 256-bit slot) | ITU-R M.1371-5 |
| Marine radar, S band | 3.05 GHz | 70 dBm peak, 0.5 µs pulses at 1 kHz PRF | 2 MHz | 10 ms (10 pulses) | IMO performance standard MSC.192(79) band; power representative |
| Marine radar, X band | 9.41 GHz | 67 dBm peak, 0.25 µs pulses at 2 kHz PRF | 4 MHz | 10 ms | as above |
| GNSS L1 jammer | 1575.42 MHz | 10, 30 and 40 dBm (three sub-classes) | 2 MHz (swept or noise) | 1 s | representative; matches M5 |
| Satellite-phone uplink, L band | 1.62 GHz | 33 dBm, burst | 30 kHz | 8.3 ms (one burst) | representative |

Antenna patterns of the emitters are isotropic toward the satellite (an upper bound on the
received power for directional radars outside their main beam; the result says so). Radar
power from orbit is taken as the sidelobe-free upper case; this is a known optimism and is
stated in every map.

**Area of interest.** Ten sea points over the Baltic, fixed now:

| # | lat (°N) | lon (°E) |
|---|---|---|
| P1 | 54.60 | 14.00 |
| P2 | 55.50 | 15.80 |
| P3 | 55.00 | 19.00 |
| P4 | 57.00 | 19.50 |
| P5 | 56.50 | 20.20 |
| P6 | 58.50 | 20.50 |
| P7 | 59.80 | 24.50 |
| P8 | 61.50 | 19.80 |
| P9 | 64.00 | 22.00 |
| P10 | 57.70 | 23.30 |

Maps are also produced on a 0.25° grid over 53.5–66.0°N, 9.5–30.5°E (the M2 area), but no bar
is set on the grid.

**Metrics.** For each point, method and class, `C` is the 2×2 horizontal block of the
constrained bound in local east-north metres. Reported: the 1σ semi-axes
`a ≥ b` (square roots of the eigenvalues of `C`), the orientation, the 95 % ellipse semi-axes
`2.448·a`, `2.448·b`, and the distance-RMS `DRMS = sqrt(trace C)`. For one pass the epoch set is
the pass with the highest maximum elevation over the point in the 24 h window (the first one on
a tie).

## Bars

- **M1-B1 (independent recomputation).** A numpy script that shares no code with the engine
  computes, from the definitions above alone, the orbit positions and velocities, the Jacobians,
  the Fisher information and the constrained bound for S1, F2 and F3 at P1–P10 for the AIS and
  the 30 dBm jammer classes. Bar: every `a`, `b` and `DRMS` agrees with the engine within
  **1e-6 relative** (*proposed*), and every orientation within **1e-6 rad** where `a/b > 1.01`.
- **M1-B2 (published case).** The engine's bound reproduces a published space-based
  geolocation case. Selection rule: the case is a peer-reviewed or archived paper that states
  the satellite positions and velocities (or orbits), the measurement noise and at least three
  numeric bound or error values for surface emitters. The candidate proposed now is
  *Geolocation of a known altitude object from TDOA and FDOA measurements*, IEEE Trans.
  Aerospace and Electronic Systems 33(3), 1997, pp. 770–783
  (https://ieeexplore.ieee.org/document/599239), whose estimators are shown to attain the
  constrained bound. Before any engine code for M1 is written, the paper's inputs and its
  reported values are transcribed into `reference.csv` in this folder with the table, figure
  and page of each value, and committed. Bar (*proposed*): each tabulated value within
  **10 %**; each value read from a plot within **20 %**, the digitised points being committed
  with the transcription. If the owner finds the candidate does not state enough to rebuild
  its geometry, the owner names another paper by the same rule at sign-off; no paper is chosen
  after an engine run.
- **M1-B3 (estimator against the bound).** For F3 and the AIS class at P1–P10, 1 000 Monte
  Carlo trials per point (seed fixed at 4100), normally distributed noise at the class σ, solved by the
  engine's iterative least squares from a start 20 km off truth. Bar (*proposed*): the empirical
  horizontal RMS error is between **0.9×** and **1.25×** `DRMS` at every point, and the solver
  converges in at least **99 %** of trials.
- **M1-B4 (multi-pass fusion is information-additive).** For S1 and F2 at every point, `DRMS`
  for `M + 1` passes is never larger than for `M` passes (to 1e-9 relative), and the fused
  Fisher matrix equals the sum of the per-pass matrices to 1e-12 relative.
- **M1-B5 (additivity).** Every existing scenario under `scenarios/` gives a byte-identical
  `result.json` before and after the change; the existing `geolocation.rs` tests pass unchanged.

M1 is **MET** only if B1 to B5 are all met. The roadmap's done condition is B2; B1, B3 to B5
guard it.

## What MET would and would not mean

MET would mean: the bound computed for satellites on orbits is arithmetically right (B1), the
solver reaches it under the stated noise (B3), and the machinery reproduces one published case
(B2). The maps would then be a defensible MODELLED statement of how well each method could
locate each signal class over the Baltic **under the stated link budget and noise model**.

MET would not mean: that any flown system achieves these numbers; that the link budgets are
right (EIRPs and noise temperatures are representative, not measured); that clock and orbit
knowledge errors are small (they are row M6 and are absent here, which makes these bounds
optimistic); or that multipath, interference between emitters, collisions of AIS slots seen
from orbit, or emitter motion during a pass are handled. Results stay labelled MODELLED.

NOT MET on B2 would mean the engine's bound does not reproduce the published case within the
bar; it would be published with the per-value differences, and the maps would carry the miss.
NOT MET on B3 would mean the solver is not efficient for that geometry; the maps would still be
bounds, labelled as not attained by the shipped solver.

## Scope limits

- No real RF data; every input is a stated model value.
- Static surface emitters only (a moving vessel during a 10 min pass is a second-order effect
  stated as unmodelled).
- No inter-satellite clock error, no orbit error (M6), no ionospheric delay at VHF (stated as
  the largest omitted term for the AIS class).
- The bars test geometry and estimation, not detection; whether a class is detectable at all
  is reported from the same link budget but not scored here (M5 scores it for jammers).
- The wording of every output stays neutral: emitter class, location, uncertainty.

## Owner decisions at sign-off

1. The published case for B2 (the candidate above or another by the same rule).
2. Formation separation `d` (50 km proposed) and `T_sys` (500 K proposed).
3. The emitter-class table, in particular whether radar classes stay in with the
   isotropic-upper-bound caveat or are dropped.
4. The bars B1 (1e-6), B2 (10 % / 20 %), B3 (0.9–1.25× and 99 %).

## Process

1. Owner signs off; this file is committed alone.
2. `reference.csv` (B2 transcription) is committed alone.
3. The oracle script for B1 is written and committed before the engine code.
4. Engine code and tests are written; the comparison runs once; `RESULTS.md` and a test that
   asserts the verdict (a miss included) are committed.
