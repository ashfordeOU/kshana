# operational_eop_ls_ar_oracle

- `history_base.csv`: written by `generate.py` from the IERS Bulletin A issues Vol. XXXVI-XXXIX
  (2023-2026, https://datacenter.iers.org/data/6/, free use with citation) and the Bulletin B
  block of the frozen 2026-09-30 finals2000A.all (https://datacenter.iers.org/, free use with
  citation), the same inputs as `tests/fixtures/eop_bulletin_a_vintages_oracle/` (whose
  `issues.sha256` pins every file). Column `source` says which: `A` (the most recent Bulletin
  A combined table that prints the date; `printed_by_mjd0` is that issue's MJD0) or `B`
  (Bulletin B final, for dates before the archived issues' coverage). Generated 2026-10-02.
- The zonal-tide coefficients used by `src/eop_ls_ar.rs` are the published IERS Conventions
  (2010) Table 8.1 (https://iers-conventions.obspm.fr/content/chapter8/icc8.pdf), cited as
  numbers.
