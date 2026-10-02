# embedded_eop_vintage_astropy_preregistered

- `census.json`: produced on 2026-10-01 by `generate.py` with astropy 8.0.1
  (`astropy.utils.iers.IERS_A.read`, BSD-3-Clause, https://docs.astropy.org/en/stable/utils/iers.html),
  run as a tool, on the repository's own `tools/finals2000A_20260930.txt` (174 rows cut verbatim
  from the IERS finals2000A.all frozen on 2026-09-30; IERS products, free use with citation). The
  SHA-256 of the bytes astropy read is stored in `census.json` and checked by the test.
- `census.json` also carries the prediction table (MJD, x, y, UT1-UTC; 365 rows, MJD 61308 to
  61672) of IERS Bulletin A Vol. XXXIX No. 039 (issued 2026-09-24), copied number for number from
  the frozen copy `kshana-oracles/data/iers/bulletinA/bulletina-xxxix-039.txt`
  (https://datacenter.iers.org/data/6/bulletina-xxxix-039.txt, SHA-256
  2ba7392d1f52fd664396d3595d4ec6b33124f866a43faa3dd122e2cd03499584; IERS products, free use with
  citation). The bulletin text itself is not vendored.
- Pre-registered in `tests/embedded_eop_vintage_astropy_preregistered.rs` (commit 6fdae01b) before
  astropy was run.
