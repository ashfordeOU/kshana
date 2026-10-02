# Fixture: M131 leg 3, the polar sweep on the validated path against Orekit 13.1.8 (package D8)

Used by `tests/leo_polar_coverage_on_path_orekit_oracle.rs`. Generated 2026-10-02 by `generate.sh`.
Configurations, grids, epochs and element sets are round 1's
(`tests/fixtures/leo_polar_coverage_full_claim_orekit_oracle/`), read from there.

| File | Source | Licence |
|---|---|---|
| `states_gcrs_A.csv`, `states_gcrs_B.csv` | The engine's GCRS states of every satellite at every epoch (`SgpOrbit::gcrs_state`), written by the test's fixture writer | AGPL-3.0-only (this project) |
| `LeoPolarOnPathDriver.java` | Driver run as a separate program against Orekit 13.1.8 and Hipparchus 4.0.3 (Apache-2.0), data directory with only `tai-utc.dat` (no Earth orientation parameters) | AGPL-3.0-only (driver) |
| `oracle_numpy.py` | Aggregation and the NumPy 2.4.6 (BSD-3-Clause) inverse for multi-clock groups (the round-1 script) | AGPL-3.0-only (script) |
| `oracle_A.json`, `oracle_B.json` | Orekit ITRF positions, per-sample in-view counts, per-latitude figures | numbers computed by Orekit and NumPy |
| `generate.sh` | Regeneration script | AGPL-3.0-only |

SHA-256:

```
d3164f981858beaa36e5d9b4236d5bc1220a33bace841c2bf50bb681ed7b14d7  states_gcrs_A.csv
3f616fbe50ee3e299447bd6cf1c73e07e9cb4b3747ad2a198f35b5ad479c0469  states_gcrs_B.csv
f2fa2e0b91e2419a17030a27f839c02d961d30ab9d2694e084b06c52261f7f5c  oracle_A.json
59d108d8cfb4c1cd66dee968394177b495dc58cee5e9c3cc5ec3a912b6def843  oracle_B.json
535dfd1e9a4dba86b3102980134d4881e447b89a34a42e30a62efa04d6f4fb1c  LeoPolarOnPathDriver.java
5909f63bc67ff7b8ab616cd737ee190eb5d5add0d832ead5f5824249837657cd  oracle_numpy.py
4e4c62d427f35fd16a06b75efad72e08a069f86ccc09d7119f4e44fcfe720bff  generate.sh
```
