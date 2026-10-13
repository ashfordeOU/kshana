# Pre-registration: float precise point positioning (PPP) on real RINEX, IGS station WTZR

Committed on its own on 2026-10-12, BEFORE the PPP filter (`src/ppp_real.rs`, to be written)
exists and before it is run on any data. The bars are not loosened after the run; a miss is
recorded with its numbers and the row stays MODELLED.

## Hold-out discipline

- Development and debugging use ONLY the co-located station WTZZ (`wtzz_2025055_0003_G.rnx`,
  00:00-03:00). The test station WTZR is not processed by the PPP filter before the one test run
  under these criteria. If a defect is found after that run, the fix is made, the run repeated,
  and BOTH results are recorded; the first stands as the registered outcome.
- The station coordinates of the oracle are not used by the filter (it starts from a code
  solution) except to report errors.

## Inputs (fixed now; all in this directory unless noted)

- Observations: WTZR, 2025-02-24 00:00:00-05:59:30, 30 s, GPS only, `C1C L1C C2W L2W`
  (`wtzr_2025055_0006_G.rnx`, cut from the IGS daily file by `make_fixture.py`).
- Orbits: IGS final 15 min SP3 (`../sp3_clock_igs_oracle/igs_2025055_G.sp3`), interpolated by
  the existing 11-point `Sp3Interpolator`.
- Clocks: IGS final 5 min clocks (`igs_2025055_G_05m_0006.clk`), linear interpolation.
- Antennas: `igs20_2025055_G_LEIAR25.atx` (GPS satellite offsets; the receiver antenna
  LEIAR25.R3 LEIT offsets and elevation-dependent variations); antenna height 0.0710 m (RINEX
  header).

## Processing (fixed now)

Ionosphere-free combination of C1C/C2W code and L1C/L2W phase; static station coordinates,
receiver clock as white noise, zenith wet delay as a random walk on top of a Saastamoinen
hydrostatic a priori, one float ambiguity per satellite arc, reset on a cycle slip detected from
the geometry-free and Melbourne-Wubbena combinations or a gap; 10 deg elevation mask; corrections:
satellite antenna offset (ionosphere-free, nominal yaw), receiver antenna height, offset and
elevation-dependent variation, solid Earth tide (IERS Conventions 2010, degree 2 in-phase, with
the permanent part, i.e. the conventional tide-free frame of ITRF2020), phase wind-up, periodic
relativistic clock term, Shapiro delay, Earth rotation during signal travel. Not modelled, and
disclosed: ocean tide loading (sub-centimetre at Wettzell), C1C-C1W code bias, satellite antenna
phase-centre variations, second-order ionosphere, pole tide.

## Reference (published data)

ITRF2020 WTZR (DOMES 14201M010) solution 3 (valid from 2010:181, open), position at 2015.0 plus
velocity times (2025-02-24T03:00 − 2015.0), from `itrf2020_wtzr_wtzz.ssc`. Errors in the local
east/north/up frame at that point.

## Criteria (fixed now)

- **P1** at the last epoch (05:59:30): horizontal error at most 0.05 m and |up error| at most
  0.10 m.
- **P2** over 04:00:00-05:59:30: the 3-D error at most 0.10 m at no fewer than 95 % of the
  solved epochs.
- **P3** at least 95 % of the 720 epochs produce a solution.
- **D** (discrimination, pre-registered): the same filter with the phase rows removed (code
  only) has a 95th-percentile 3-D error over 04:00-05:59:30 at least twice that of the PPP run.
- **Z** (data-gated; EUREF troposphere product not vendored, licence unconfirmed): where the
  file `EUR0OPSFIN_20250540000_07D_01H_TRO.TRO(.gz)` is given through `KSHANA_EUREF_TRO`, the
  root-mean-square of (PPP zenith total delay − EUREF zenith total delay) at the hourly product
  epochs 02:30-05:30 is at most 0.02 m. Reported, not part of the promotion rule, because the
  product is not in the repository.

Outcome rule: if P1, P2, P3 and D hold, float PPP on real RINEX is VALIDATED against the published
ITRF2020 coordinate. Otherwise MODELLED, with the numbers recorded.

The RTKLIB and gLAB comparisons on the same inputs (RM-31) are data-gated harnesses and are not
part of this registration; they get their own pre-registration before their first run.
