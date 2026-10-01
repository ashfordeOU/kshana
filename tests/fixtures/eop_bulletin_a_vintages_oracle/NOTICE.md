# eop_bulletin_a_vintages_oracle

Small derived slices of public IERS products, used by
`tests/joint_eop_error_bulletin_a_oracle.rs` and
`tests/operational_eop_predictor_bulletin_a_oracle.rs`. Regenerate with `generate.py`
(instructions in its docstring); `vintages.rs` rebuilds finals2000A-format bodies from them.

## Sources

- **IERS Bulletin A** (IERS Rapid Service/Prediction Centre, U.S. Naval Observatory), weekly
  issues Vol. XXXVI No. 001 (2023-01-05) to Vol. XXXIX No. 039 (2026-09-24), 195 files,
  https://datacenter.iers.org/data/6/bulletina-<vol>-<no>.txt, retrieved 2026-09-30. Each issue
  carries "Distribution statement A: Approved for public release: distribution unlimited." The
  SHA-256 of every issue read is listed in `issues.sha256`.
- **IERS finals2000A.all** (EOP 20 C04-based Bulletin B block only), frozen copy retrieved
  2026-09-30 from https://datacenter.iers.org/data/9/finals2000A.all, SHA-256
  `cc80680ec05c91b65e7d02c6068fe0d44dd0998dc880551975092d2d14aa8e18`. IERS products are free to use with citation.

## Files

- `vintages.csv` (SHA-256 `93dc024ecf8517a56f5a7427f65760c9323fed7e62954d16ffea1baf2ffa5a27`): for 178 issues
  (MJD0 59963-61209; the first two issues and issues whose 40-day target has no final are
  left out), the as-issued rapid values MJD0-20..MJD0 from the issue's own and earlier issues'
  "COMBINED EARTH ORIENTATION PARAMETERS" tables (latest issue wins; nothing published after
  the issue), the issue's predictions at leads 1-10, 20, 30 and 40 days, and the accuracy
  formula it prints.
- `finals_b.csv` (SHA-256 `a236d4a510846f27b0fa8d8a525c54f07bee831419cae6b02512f70e24e5e71d`): the Bulletin B x_p, y_p and UT1-UTC
  at every target date.
- `issues.sha256`: SHA-256 of each input file.
