# Fixture for tests/geometry_free_tec_gim_oracle.rs

`los.csv` (one row per GPS line of sight at whole minutes, elevation at least 10 degrees) is
built by `make_fixture.py` (numpy only; no Kshana code). Columns: PRN, seconds of day (GPS time,
2018-05-13), elevation (deg), measured C1C and C2W code pseudoranges (m, copied from the RINEX
file), the line's C1C-C2W code bias (ns) and the CODE GIM slant TEC (TECU).

Sources (retrieved 2026-10-02 unless stated):

- `ABMF00GLP_R_20181330000_01D_30S_MO.crx.gz`, IGS station ABMF, BKG IGS archive
  https://igs.bkg.bund.de/root_ftp/IGS/obs/2018/133/ (IGS data, open, attribution to the IGS
  and the station operator), SHA-256
  caacbbcc892123e382f126c2279f3e5902dd0e7fd302eded8902c21e416c71b1; decompressed with crx2rnx.
- `CODG1330.18I.Z` (CODE global ionosphere map, AIUB University of Bern, IGS product, open),
  from `~/Code/kshana-oracles/data/igs/` (retrieved 2026-09-30 from the CODE archive), SHA-256
  6f2ef96d339ff0e6fa9ef42f337d9a7ab6ee5c3cc5c8cf94c21080c77ca235c1.
- `P1C11805.DCB.Z` (CODE monthly P1-C1 differential code biases, May 2018), same location and
  date, SHA-256 7e12b6d574fe0e1475fa644a0c070445469664458e9b6f2de8ff4777b7ae38af.
- Broadcast GPS ephemeris: `../joint_pvt_itrf_rtklib_oracle/brdc_2018133_G_Einav.rnx` (already
  committed; its NOTICE gives the source), SHA-256
  144eb4c4b49cae2169d63f5d51c8eaeea1546df8706ad61491df4c71033115dd.
