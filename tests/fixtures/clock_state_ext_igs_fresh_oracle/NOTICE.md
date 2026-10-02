# clock_state_ext_igs_fresh_oracle

- Source: International GNSS Service (IGS) final combined satellite clocks at 30 s,
  `IGS0OPSFIN_20252440000_01D_30S_CLK.CLK.gz` to `..._20252570000_...` (2025-09-01 to
  2025-09-14), https://igs.org/products/ via the BKG mirror
  https://igs.bkg.bund.de/root_ftp/IGS/products/ (GPS weeks 2382-2384), retrieved
  2026-10-02 into `$KSHANA_ORACLES/data/realdata/igs/2025-09/`. IGS products are openly
  available with attribution to the IGS. Each file's SHA-256 is in `sources.sha256`.
- `generate.py` (committed with the pre-registration, before the files were fetched)
  extracts GPS Block IIF PRNs G03 G06 G08 G09 G10 G24 G25 G26 G27 G30 G32 at 300 s and
  tunes the extended filter's noise on the first half (scipy 1.18.1 Nelder-Mead, numpy
  2.3.5); allantools 2024.06 for the informational ADEV fit.
- `clocks.txt`: decimated phase as increments in 1e-13 s (IGS prints 1e-16 s; the rounding
  is below 0.1 ps) with the tuned parameters. `ml_fit.csv`: tuning results.
  `adev_first_half.csv`: informational ADEV and its non-negative four-term fit.
- clocks.txt SHA-256: d813620393b4b4905aaedc4eaff8a5f2aad29a2a356b54cb2f06ad9810055de3
