# Pre-registration: receiver-domain parity of Kshana's PPP and SPP with gLAB and RTKLIB (RM-31)

Committed on its own on 2026-10-13, before either oracle tool has been run on these inputs (in
the session that wrote it neither tool could be built or run; see "Status"). The bars are not
loosened after a run; a miss is recorded with its numbers.

## Inputs (identical for all three tools)

`tests/fixtures/gnss_wettzell_2025055/`: WTZR observations 2025-02-24 00:00-05:59:30 (GPS
`C1C L1C C2W L2W`), IGS final orbit `../sp3_clock_igs_oracle/igs_2025055_G.sp3`, IGS final 5 min
clocks, `igs20_2025055_G_LEIAR25.atx`, antenna height 0.0710 m. Elevation mask 10 deg,
ionosphere-free dual frequency, static, float ambiguities, zenith wet delay estimated.

## Oracles

- gLAB (gAGE/UPC; core under Apache-2.0 per the gAGE download page, read 2026-10-12), version
  6.0.0, run as a separate program by `run.sh` (PPP mode with the products above; SPP mode with
  the same products and no carrier phase).
- RTKLIB v2.4.2-p13 (commit 71db0ffa, BSD-2-Clause), `rnx2rtkp` with `rtklib_ppp.conf`
  (`pos1-posmode = ppp-static`) and `rtklib_spp.conf` (`single`, precise products, dual-frequency).

`run.sh` writes `tests/fixtures/gnss_wettzell_2025055/oracle/{glab,rtklib}_{ppp,spp}.csv` with
columns `sod,x,y,z` (ECEF, m, marker), plus the tool versions and SHA-256 values in
`oracle/RUN.md`. Kshana's side is `ppp_real::run_ppp` with `PppConfig::default()` plus the antenna
(as in `tests/ppp_real_wettzell_oracle.rs`) and the same filter with phase off for SPP-like code
processing; the SPP comparison uses `pvt::assemble_epoch_precise` + `pvt::solve_spp`.

## Criteria (fixed now), per oracle tool, on the epochs both solve

- **R1 (PPP)**: over 04:00-05:59:30, the 3-D difference between Kshana's and the tool's PPP
  position is at most 0.05 m at no fewer than 95 % of the common epochs.
- **R2 (PPP final)**: at the last common epoch, the 3-D difference is at most 0.03 m.
- **R3 (SPP)**: over 00:00-05:59:30, the median 3-D difference between the epoch-by-epoch code
  solutions is at most 0.50 m.
- **Non-vacuity**: at least 200 common PPP epochs in the window and 600 common SPP epochs.

Outcome rule: if R1-R3 hold for gLAB, RM-31's gLAB leg is met; likewise for RTKLIB. Either tool
alone suffices for the parity claim of that tool; each result is reported separately.

## Status

Pending: the run needs gLAB and RTKLIB built or installed as separate programs. The test
`tests/ppp_parity_glab_rtklib.rs` reads the CSV files when they exist (or the directory named by
`KSHANA_PPP_PARITY_DIR`) and otherwise prints that the comparison was not run and passes; it never
claims parity without the files.

## Amendment 1 (2026-10-13, committed before any oracle run; bars unchanged)

RTKLIB's `rnx2rtkp` refuses to run without a broadcast navigation file even in precise mode: its
`satposs` forms the transmit time from a broadcast clock before switching to the precise orbit
and clock (the same behaviour the repository's earlier precise-product RTKLIB test disclosed).
`run.sh` therefore also passes `tests/fixtures/gnss_wettzell_2025055/brdc_2025055_G_0008.rnx`,
the GPS records 00:00-08:00 of the IGS daily merged broadcast file of 2025-02-24 (source and
SHA-256 in that directory's NOTICE.md). Positions and clocks used by the solution remain the IGS
final products. Kshana's side, the criteria R1-R3 and the non-vacuity bars are unchanged. gLAB
could not be fetched in the session that ran RTKLIB (its download was refused by the session's
permission system), so the gLAB leg stays pending and data-gated.

## Amendment 2 (2026-10-13): a new registration for the RTKLIB PPP leg, written after the first run was seen

DISCLOSED: the first registered RTKLIB run (outputs 96dd27a) missed R1 and R2, and the diagnosis
written after it (tests/ppp_parity_glab_rtklib.rs) traced most of the difference to the
registered configuration, which left RTKLIB's solid Earth tide correction off while Kshana
applies it. That run stands as recorded. This amendment registers ONE further RTKLIB PPP run with
`rtklib_ppp_tide.conf`, identical to `rtklib_ppp.conf` except `pos1-tidecorr = on`, written to
`oracle/rtklib_ppp_tide.csv`, against the SAME bars R1 (3-D difference at most 0.05 m at no fewer
than 95 % of the common epochs of 04:00-05:59:30) and R2 (at most 0.03 m at the last common
epoch), not loosened. The SPP leg (R3) is not re-run: its configuration had no such omission and
its finding stands. Nothing on Kshana's side changes. Outcome rule unchanged: if R1, R2 and the
recorded R3 all held, RM-31's RTKLIB leg would be met; R3 already failed, so the leg as a whole
stays a finding whatever this run shows, and this run documents the PPP parity alone.

## Amendment 3 (2026-10-13): the last registration for the RTKLIB PPP leg

DISCLOSED: the amendment 2 run (tide on) also missed R1 and R2 (0 %, 0.232 m): RTKLIB's
solution then sat +0.19 to +0.20 m up from ITRF2020 with its horizontal error near zero. The
cause, found after that run: `rtklib_ppp.conf` (and so `rtklib_ppp_tide.conf`) put the receiver
antenna type and height on RTKLIB's BASE slot (`ant2-anttype`, `ant2-antdelu`), whereas the rover
of `rnx2rtkp` is slot 1, so RTKLIB applied neither WTZR's 0.0710 m antenna height nor the
LEIAR25.R3 LEIT phase-centre offsets. Both earlier runs stand as recorded. This amendment
registers one further and FINAL RTKLIB PPP run with `rtklib_ppp_tide_ant.conf` (tide on; `ant1-anttype
= *` from the RINEX header and `ant1-antdelu = 0.0710`), output `oracle/rtklib_ppp_tide_ant.csv`,
against the same R1 and R2 bars. Its result is recorded whatever it shows; no further amendment
to this leg will be made. R3 (SPP) is not re-run: `rtklib_spp.conf` has the same antenna slot
error, which affects the SPP solution by under 0.3 m and does not change that finding's
conclusion; it is noted, not re-registered.
