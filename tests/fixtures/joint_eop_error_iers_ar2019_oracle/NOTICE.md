# joint_eop_error_iers_ar2019_oracle

- Oracle: IERS Annual Report 2019, section 3.5.2 (Rapid Service/Prediction Centre), Table 3a
  (page 137), transcribed into `ar2019_table.csv`;
  https://www.iers.org/fileadmin/SharedDocs/Publikationen/EN/IERS/Publications/ar/ar2019/ar2019_352.pdf
  (IERS publications: free use with citation). Only the numbers are cited; the report is not
  vendored. Retrieved 2026-10-02.
- Inputs: IERS Bulletin A Vol. XXXI No. 050-052 and Vol. XXXII No. 001-052 (2019),
  https://datacenter.iers.org/data/6/ (free use with citation; "Distribution statement A"),
  fetched 2026-10-02 by `generate.py` into `$KSHANA_ORACLES/data/iers/bulletinA-2019/`; truth:
  the Bulletin B block of the frozen 2026-09-30 finals2000A.all. Every input's SHA-256 is in
  `issues.sha256`.
- `vintages.csv`, `finals_b.csv`: written by `generate.py` (a copy of the round-1 generator in
  `tests/fixtures/eop_bulletin_a_vintages_oracle/`, restricted to issues with MJD0 in 2019 and
  to the table's horizons). `vintages.rs`: the round-1 reader, reading this directory's files.
