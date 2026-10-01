# embedded_eop_census_astropy_oracle

- `census.json`: produced by `generate.py` with astropy 8.0.1 (`astropy.utils.iers`,
  BSD-3-Clause, https://docs.astropy.org/en/stable/utils/iers.html), run as a tool, on the
  repository's own `tools/finals2000A_2026.txt` (an IERS finals2000A extract; its provenance
  and SHA-256 are in `tests/fixtures/agency/NOTICE.md`). The SHA-256 of the bytes astropy read
  is stored in `census.json` and checked by the test.
- Generated 2026-10-01. No third-party data is vendored here.
- `IERS_A.read` raises IndexError on a file with no `P`-flagged row (its A/B combining step
  indexes the first `P` row); the generator then calls the parse step `IERS_A.read` itself
  uses, `IERS.read(format="cds", readme=IERS_A_README)`, and records which call it used.
