# Package D8 oracle toolchain

`setup.sh` builds what the D8 fixtures were generated with, outside the checkout under
`~/Code/kshana-oracles`:

- Orekit 13.1.8 and Hipparchus 4.0.3 (Apache-2.0). The jars come from Maven Central and are
  checked against its published SHA-1. They are run as separate programs and never vendored.
- `data-no-eop/tai-utc.dat` from orekit-data (main branch). With only the leap-second table
  loaded, Orekit applies no Earth orientation parameters (UT1 = UTC, zero pole offsets), which
  is the engine's stated assumption on this path.
- A Python virtual environment with numpy 2.4.6, pyerfa 2.0.1.5 and python-sgp4 2.24.

The drivers and generators live beside their fixtures:

| Fixture | Generator |
|---|---|
| `tests/fixtures/jd2_sofa_time_oracle/` | `generate_jd2_sofa_time_oracle.py` (pyerfa) |
| `tests/fixtures/leo_polar_coverage_full_claim_orekit_oracle/` | `generate.sh` (Orekit, NumPy); `reference_sgp4_teme.py` (python-sgp4, diagnostic only) |
| `tests/fixtures/pass_predictor_apparent_orekit_oracle/` | `generate.sh` (Orekit) |

Each fixture's `NOTICE.md` gives source, licence, retrieval date and SHA-256.
