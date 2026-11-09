<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B3b (0.41.x): fixed-station jammer locator by time difference of arrival

**Status: PROPOSED, 9 November 2026. Waiting for the owner's sign-off. No code or data before it.** Numbers marked
*proposed* are fixed at sign-off. After sign-off, bars may be tightened, never loosened. Advisory software, not
certified navigation equipment.

## Why

B3a, the power-difference locator, missed its synthetic gate twice (v1 `f6b4a3336`, v2 `53ca11af5`):
- With 6 dB shadowing, the power differences leave the centroid about 1× the station spacing off, even inside the
  network, against a 0.5× bar.
- A timing observable does not have that floor: TDOA error scales with the jammer's bandwidth and the snapshot
  length, not with shadowing.

B3b locates a jammer from short, time-tagged IQ snapshots taken at fixed stations.

## 1. The method

- **Stations.** Each reports, on a trigger (the C/N0 or AGC alarm of B3a's stations), an IQ snapshot of
  `T` = 10 ms (*proposed*) at 4 Msps around L1. Each snapshot is time-tagged by the station's GNSS-disciplined clock
  (1σ = 20 ns, *proposed*; worse while jammed, so the tag uses the station's holdover estimate).
- **TDOA.**
  - The pairwise cross-correlation of snapshots against a reference station, with the peak refined parabolically.
  - Per-pair σ from the Cramér–Rao bound for the measured SNR and bandwidth, plus the clock σ, both added in
    quadrature.
- **Solver.** Gauss–Newton on the sphere at known height (as M1 and M5), started from a coarse search over a grid
  on the network's hull buffered by 10 km.
- **Region.** The 95% ellipse from the covariance, with a χ²-consistency test of the residuals. A failing test
  gives "not located" (multipath).

## 2. Synthetic gate (before any real data)

- **Network.** 6 to 12 stations on a 5 to 30 km layout.
- **Jammers.** Sources drawn uniformly in the 10 km-buffered domain. Waveforms: CW, chirp and wideband noise jammers
  (equal shares).
- **Channel.** Two-ray ground reflection plus log-normal shadowing (6 dB) on amplitude.
- **Station clocks.** Biases drawn at 20 ns 1σ.
- **Seeds and sessions.** 1 000 sessions; seeds 6001 to 7000 (development 5001 to 5200).

| Id | Bar (*proposed*: B3a's bars) |
|---|---|
| T1 coverage | 95% region contains the truth in at least **0.90** of sessions |
| T2 non-vacuity | median 95% region area at most **25%** of the domain |
| T3 centroid | median centroid error at most **0.5 ×** the median nearest-neighbour station spacing |
| T4 determinism | byte-identical across platforms |

**What a miss on the gate means.** A CW jammer has no bandwidth to time against, so TDOA on CW is weak by physics.
The result reports each waveform's share separately. A miss is published, and the row stops.

## 3. The real run

As B3a, section 3: Jammertest 2027, blind, if multi-station IQ snapshots are published with a stated licence.
Otherwise the row stays MODELLED: "not run: reference not published".

## Process

1. Sign-off.
2. Readings, then the oracle (numpy), then the code, then the synthetic gate, run once.
3. The real run only if the gate is met and the data exist.
