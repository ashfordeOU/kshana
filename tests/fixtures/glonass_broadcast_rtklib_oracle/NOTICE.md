# glonass_broadcast_rtklib_oracle

- `rtklib.csv`: output of RTKLIB v2.4.2-p13 (T. Takasu, BSD-2-Clause, commit 71db0ffa)
  `geph2clk` / `geph2pos`, built and run by `xval/rtklib-glonass/generate.sh` on
  `tests/fixtures/igs/BRDM00DLR_R_20130010000_01D_MN.rnx` (IGS broadcast data, see
  `tests/fixtures/igs/NOTICE`). Generated 2026-10-12. Columns: slot, reference epoch (UTC),
  offset (s), clock bias (s), PZ-90 position (m), 17 significant digits.
- Pre-registration: `xval/rtklib-glonass/PREREGISTRATION.md` (e099c42a).
