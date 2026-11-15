<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration B3c (0.42 row V1): the TDOA locator's successor, synthetic gate

**Status: PRE-REGISTERED on 15 November 2026 (10:05 UTC), committed before any B3c code, oracle or session.** The
owner signed the 0.42 plan that contains row V1 on 15 November 2026; this file has no separate owner signature. The
bars are B3b's (signed 10 November 2026) and are not changed. After this commit, bars may be tightened, never
loosened. Advisory software, not navigation equipment. Synthetic data only.

## Why

B3b, the TDOA locator, missed its synthetic gate (`docs/design/evidence/b3b-tdoa-locator/RESULTS.md`, `eed00fd84`):
T1 coverage 0.044, T2 median area share 1.000, T3 3.35 × the station spacing. Its results name three causes, each
found after the run, and say what a successor would need:

1. **Refinement.** The parabola through three correlation samples misplaces a peak about one sample wide by up to half a
   sample (125 ns), against a stated σ of about 28 ns, so the χ² test rejects most fits.
2. **Periodic waveforms.** The sawtooth chirp's correlation repeats every period inside the lag window, so the largest
   peak is often the wrong replica.
3. **Solver.** Gauss–Newton has no step bound; on seed 6002 it diverged to 5 × 10⁸ m.

B3c changes exactly these three things and keeps B3b's synthetic world, its σ model (with one added term) and its
bars. A CW jammer still has no bandwidth to time against; B3c says so instead of returning a position.

## 1. The method (readings U1 to U13 in `xval/tdoa-locator-b3c/README.md` fix every detail)

- **Same world.** The sessions are drawn by B3b's own generator (`locate_tdoa::session`, readings T1 to T7 of
  `xval/tdoa-locator/README.md`), unchanged: 6 to 12 stations on 5 to 30 km layouts, CW, chirp and noise jammers in
  equal shares, two-ray ground reflection with 6 dB shadowing, station clocks at 20 ns 1σ, 10 ms snapshots at 4 Msps.
- **Bandwidth and period screen on the reference snapshot.** From the reference's autocorrelation: a signal whose
  correlation does not fall below half its peak within 16 samples has no usable bandwidth, and the session is "not
  located". Otherwise the first later local maximum of at least half the peak, within 200 samples, is the waveform's
  period; without one the waveform is aperiodic.
- **Matched refinement.** The correlation peak is refined on the band-limited interpolant of the correlation (the
  cross-spectrum summed at a continuous delay), maximised by golden-section search on the lag of the largest sample
  ± 1 sample, to 10⁻⁴ sample. No parabola.
- **σ.** B3b's per-pair σ (the Knapp–Carter bound plus both clocks, the reference clock shared) plus a refinement term
  of 2.5 ns (0.01 sample), in quadrature.
- **Periodic waveforms.** With a period found, each delay is known modulo the period: residuals are wrapped to
  ± half a period in the grid search and in the solver.
- **Bounded solver.** The grid start of B3b; then Gauss–Newton with steps capped at 1 km and halved (up to 10 times)
  until the cost falls; at most 50 steps; a solution more than 10 km outside the stations' hull is "not located".
- **Region and consistency.** As B3b: the 95 % covariance ellipse and the χ² test of the residuals at 0.999 with
  `N_s − 3` degrees of freedom.

## 2. Synthetic gate

- **Seeds.** Fresh: development 8001 to 8200 (run once, to find faults, not to tune); gate 9001 to 10000 (run once).
- **Two scored populations, same bars.**
  - **G-all:** all 1 000 gate sessions, as B3b.
  - **G-wb:** the gate sessions whose drawn waveform is wideband (chirp or noise), about 667. The waveform is used
    only to choose the population; the locator never sees it.

| Id | Bar (B3b's, unchanged) |
|---|---|
| T1 coverage | 95 % region contains the truth in at least **0.90** of sessions (an unlocated session counts as not covered) |
| T2 non-vacuity | median 95 % region area at most **25 %** of the domain (unlocated: 100 %) |
| T3 centroid | median centroid error at most **0.5 ×** the median nearest-neighbour station spacing (unlocated: the error to the domain's centroid) |
| T4 determinism | the gate's result bytes are equal in a debug and a release build on Linux, and on Linux, macOS and Windows (CI) |

**Said before the run.** About one third of the sessions are CW. B3c reports a CW session as not located, so
**G-all's T1 cannot exceed about 0.67, and G-all is expected NOT MET by construction**. It is scored and published
anyway, so the whole population stays visible. G-wb is the question B3c asks: does TDOA with these three changes
locate wideband jammers to B3b's bars?

**What a miss means.** A miss on G-wb is published and the row stops; no B3c number is changed afterwards.

**What a pass means, and what it does not.** A met G-wb is necessary for interference geolocation (product row F2), not
sufficient. F2 also needs the real-data run of B3a's section 3 (Jammertest 2027, blind, only if multi-station IQ
snapshots are published with a stated licence) to be met. Until both hold, **geolocation stays off in every product**,
and any later use is limited to sessions the locator itself classes as wideband; a CW-like session is "not located:
no usable bandwidth".

## 3. Process

1. This file and the readings, committed before anything else.
2. The independent oracle (numpy and the standard library, no engine code), then the engine code.
3. The development run, once. A fault (code that does not do what a reading says) is fixed and recorded as a reading;
   no number in this file or in the readings is changed.
4. The gate, once. The oracle recomputes seeds 9001 to 9020. Results in `RESULTS.md`, met or not.
