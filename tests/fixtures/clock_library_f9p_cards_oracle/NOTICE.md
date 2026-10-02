# NOTICE: ZED-F9P class oracle data (data-gated, not vendored)

Used by `tests/clock_library_f9p_cards_oracle.rs` and rounds 4 and 4b of
`tests/clock_library_tcxo_card_jammertest_oracle.rs`. Nothing is vendored: `generate.py` fetches
the files into `$KSHANA_ORACLES/data/wroclaw_f9p/` (about 1.5 GB uncompressed) and the tests skip,
saying so, when the directory is absent (`KSHANA_REQUIRE_REALDATA=1` turns a skip into a failure).
Retrieved 2026-10-02.

- Observations: Zenodo record 6488497, doi:10.5281/zenodo.6488497, "RINEX files from low-cost
  GNSS receivers in Wroclaw, Poland; January - March, 2021", **CC BY 4.0** (cite the record).
  Stations with 14 consecutive daily files (earliest run): BX03 (DOY 064-077), BX04 (068-081),
  BX05 (072-085), BX06 (071-084), BX07 (058-071), BX08 (074-087), BX09 (071-084), BX10 (064-077),
  BX12 (058-071), BX13 (059-072), BX14 (068-081), BX22 (071-084); BX02, BX15 and BX17 excluded.
  Each file's MD5 was checked against the Zenodo record; SHA-256 values are in
  `$KSHANA_ORACLES/data/wroclaw_f9p/sources.sha256`.
- Navigation: IGS merged GPS broadcast navigation `BRDC00WRD_R_2021<DOY>0000_01D_GN.rnx.gz`, BKG
  mirror https://igs.bkg.bund.de/root_ftp/IGS/BRDC/2021/ (public, cite the IGS). The
  pre-registration named `BRDC00IGS_R`, which does not exist for 2021; the substitution was made
  before any card was fitted (commit 52178918).
