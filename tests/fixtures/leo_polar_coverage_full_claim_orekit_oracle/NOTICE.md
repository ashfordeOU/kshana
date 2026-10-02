# Fixture: M131 full claim, LEO polar coverage from element sets against Orekit 13.1.8 (package D8)

Used by `tests/leo_polar_coverage_full_claim_orekit_oracle.rs`. Generated 2026-10-02 by
`generate.sh` (run from the repository root after `source ~/Code/kshana-oracles/env13.sh`), and
`reference_sgp4_teme.py` (diagnostic, written after the comparison failed its position bar).

| File | Source | Licence |
|---|---|---|
| `inputs_A.json`, `inputs_B.json` | Sweep grid, sweep epoch, each system's role, mask and clock model, written by the test's fixture writer | AGPL-3.0-only (this project) |
| `elements_A.csv`, `elements_B.csv` | The SGP4 mean element sets the engine builds from the scenarios (the input both sides share), every double printed to round-trip | AGPL-3.0-only (this project) |
| `LeoPolarFullClaimDriver.java` | Driver run as a separate program against Orekit 13.1.8 and Hipparchus 4.0.3 (Apache-2.0; jars from Maven Central, SHA-1 verified) with a data directory holding only `tai-utc.dat` from orekit-data (no Earth orientation parameters) | AGPL-3.0-only (driver); Orekit is not vendored |
| `oracle_numpy.py` | Aggregation and the NumPy 2.4.6 (BSD-3-Clause) inverse for multi-clock groups, adapted from the round-2 script | AGPL-3.0-only (script) |
| `oracle_A.json`, `oracle_B.json` | Oracle output: Orekit ITRF positions of every satellite at every epoch, per-sample in-view counts per system with the nearest mask margin, per-latitude and per-group mean in view, median PDOP/HDOP/VDOP and availability | numbers computed by Orekit and NumPy |
| `reference_sgp4_teme.py`, `reference_sgp4_teme_A.csv`, `reference_sgp4_teme_B.csv` | Diagnostic: TEME positions at the first and last epoch from python-sgp4 2.24 (D. Vallado's reference SGP4, MIT licence), run as a separate program | AGPL-3.0-only (script); numbers computed by python-sgp4 |
| `generate.sh` | Regeneration script | AGPL-3.0-only |

The raw per-sample Orekit text output (`orekit_<c>.txt`) is removed by `generate.sh` after
aggregation and is not committed. orekit-data `tai-utc.dat` SHA-256
3524e1ae34d67e858873a89e59983bbc5bd100221da898e796c1b36036a310c3 (orekit-data main branch,
retrieved 2026-10-02, archive SHA-256
6565d2ec5d8645c309f4c4b5c1d975276024eaaa81fe07dac8f2c3b94d9d253c).

SHA-256:

```
c85538e28f6ff3cc828ecc298ebedbd1446725b1956e6c007525716718f6d709  inputs_A.json
ce0b1445111a86f56c8fde27b03dfa2552f8515ba54ee00b154271a513275e53  inputs_B.json
c1ed49101903a1c5b58143941496d11a827eef718fe63bf1c666bb7f738d9cc0  elements_A.csv
bfb5d07c65af3523708e3566cbb63abf5dc05359bee2fa61217f01b86d5edbd3  elements_B.csv
f5e0e55e9360bf192f814e051d7dbabd1e583bf7b8a5ccea3eba7507da4a59dd  oracle_A.json
e8f8401394ca473b267542f786ca25e915bf8c7f245b0fa49a2b1e221032e98b  oracle_B.json
657cde95a6499086ab7e8ad2d44e00e88a35eec4694e94adf17dcf003112b1e2  reference_sgp4_teme_A.csv
0c920a58044399df28aa61277ab0ec795bd596fde3a77d9aa5595de4d0b9ff7b  reference_sgp4_teme_B.csv
f38607acb87db731be5e1f31be506852b8cb97360bb532a4a4d7226485b77f8f  LeoPolarFullClaimDriver.java
c0c0113662efcd21c24494cc2f9c088a9a7fccc0b7bc57ea2cd35696804c5a82  oracle_numpy.py
328634954b087e7b4f4a029038df2c155a38e88f7a76cf59ac187a54875c4e09  reference_sgp4_teme.py
dcc245900ae4751bd26fd32b1c701cc53eb34eea6264c7eb9836f8f0c90b4fdf  generate.sh
```
