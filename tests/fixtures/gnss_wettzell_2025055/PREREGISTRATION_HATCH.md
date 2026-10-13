# Pre-registration: Hatch carrier smoothing on real RINEX, IGS station WTZR

Committed on its own on 2026-10-13, after `src/hatch.rs` was written (unit tests on synthetic
data only) and BEFORE any single-point solution with or without smoothing is computed on the
data below. Disclosed: the same WTZR observations were used for the registered PPP run
(`PREREGISTRATION_PPP.md`); no code-only single-point result on them has been looked at. The
bars are not loosened after the run; a miss is recorded with its numbers.

## Quantity

The effect of `hatch::HatchFilter` (window 100 epochs = 50 min at 30 s, restart on a loss-of-lock
flag, a geometry-free phase jump above 0.05 m or a gap above 90 s), applied in the divergence-free
form to the ionosphere-free code with the ionosphere-free carrier, on epoch-by-epoch single-point
positioning with precise products (`pvt::assemble_epoch_precise` path, `pvt::solve_spp`).

## Inputs (fixed now)

`wtzr_2025055_0006_G.rnx` (2025-02-24 00:00-05:59:30, 30 s, GPS `C1C L1C C2W L2W`), the IGS final
orbit (`../sp3_clock_igs_oracle/igs_2025055_G.sp3`) and 5 min clocks
(`igs_2025055_G_05m_0006.clk`), satellite antenna offsets from `igs20_2025055_G_LEIAR25.atx`,
no P1-C1 bias, 10 deg mask, default meteorology, a-priori position iterated from the previous
epoch's solution (the first from the header position, iterated three times).

## Reference (published data)

ITRF2020 WTZR solution 3 propagated to 2025-02-24T03:00 (as for the PPP test). Receiver antenna
offset and solid tide are not applied in either run (a common few-centimetre to decimetre bias,
below the metre-level code errors compared here).

## Criteria (fixed now)

Over the epochs 01:00:00-05:59:30 (the first hour lets the 50 min window fill), for the raw and
the smoothed solutions on the same epochs:

- **H1**: median 3-D error, smoothed, at most 0.6 times raw.
- **H2**: 95th-percentile 3-D error, smoothed, at most 0.6 times raw.
- **H3**: at least 500 epochs solved by both.

Outcome rule: if H1, H2 and H3 hold, Hatch smoothing on real data is VALIDATED against the
published ITRF2020 coordinate (the smoothed solution measurably closer to it). Otherwise MODELLED,
with the numbers recorded.
