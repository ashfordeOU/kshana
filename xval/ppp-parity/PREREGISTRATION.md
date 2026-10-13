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
