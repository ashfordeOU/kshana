# clock_state_igs_holdout_oracle

- Source: International GNSS Service (IGS) final combined satellite clocks at 30 s,
  `IGS0OPSFIN_20252290000_01D_30S_CLK.CLK.gz` to `..._20252420000_...` (2025-08-17 to
  2025-08-30), https://igs.org/products/ via the BKG mirror
  https://igs.bkg.bund.de/root_ftp/IGS/products/, retrieved by `scripts/fetch_igs_clocks.sh`
  (which checks each file's SHA-256). IGS products are openly available with attribution
  to the IGS.
- Input to `generate.py`: that script's extract `gps_iif_clocks.txt` (SHA-256
  `82ffd8eaee670d49a43ee916a15e45b269420260c7ccf6be993d8e3b26b3b636`).
- `clocks.txt` (SHA-256 `3da6d0a5a7facdc1e564fdeed5f5ada890a2f9cdab6a218fa79a83608a3230a4`): GPS Block IIF satellites G03 G06
  G08 G09 G10 G24 G25 G26 G27 G30 G32, decimated to 300 s, stored as increments in 1e-13 s
  (the IGS values print 1e-16 s; the rounding is below 0.1 ps), with the noise parameters
  fitted from the first half. `adev_first_half.csv`: the allantools 2024.6 overlapping ADEV
  each fit used. Generated 2026-10-01.
