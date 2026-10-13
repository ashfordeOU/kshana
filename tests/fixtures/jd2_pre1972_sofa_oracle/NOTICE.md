# jd2_pre1972_sofa_oracle

- `instants.csv`: UTC instants 1960-1971 written from the fixed rules in the header of
  `tests/jd2_pre1972_sofa_oracle.rs` by `generate_jd2_pre1972_sofa_oracle.py --instants-only`.
- `erfa.csv`: pyerfa 2.0.1.5 (BSD-3-Clause; liberfa 2.0.1, the SOFA routines released by the
  ERFA project) `dtf2d("UTC")`, `utctai`, `taiutc` on those instants, generated 2026-10-12.
- Pre-registration: commit 23c40661.
