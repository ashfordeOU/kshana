# joint_eop_table_astropy_erfa_oracle

Independent oracle for the `realtime-frame-eop` joint Earth-orientation table (Table 3) and the
predicted-versus-final tables (Tables 4 and 6); pre-registered in
`tests/joint_eop_table_astropy_erfa_oracle.rs` (commit 455b8fb5, amendments A1 af9fd684 and
A2 a44c0984).

- Generator: `generate.py`, run with the oracle toolchain (`source ~/Code/kshana-oracles/env.sh`;
  astropy 8.0.1 and pyerfa 2.0.1.5, both BSD-3-Clause; NumPy). Run 2026-10-02.
- `joint_input.txt`, `later_2019.txt`: verbatim rows of the IERS finals2000A.all frozen on
  2026-09-30 (SHA-256 cc80680ec05c91b65e7d02c6068fe0d44dd0998dc880551975092d2d14aa8e18),
  https://datacenter.iers.org/ (IERS products: free use with citation). `joint_input.txt`
  holds MJD 60857 through the last row whose two flags are I (451 rows); `later_2019.txt`
  holds MJD 58450-58960.
- `as_issued_32-*.txt`: as-issued finals2000A bodies of IERS Bulletin A Vol. XXXII No. 001,
  014, 027 and 040 (2019; "Distribution statement A"), rebuilt from
  `../joint_eop_error_iers_ar2019_oracle/vintages.csv`.
- `oracle.json`: the oracle's values, with the SHA-256 of every input file
  (`inputs_sha256`) and the tool versions.
