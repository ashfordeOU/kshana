# Fixture: apparent pass prediction on the validated path against Orekit 13.1.8 (package D8, leg 3)

Used by `tests/pass_predictor_on_path_orekit_oracle.rs`. Generated 2026-10-02 by `generate.sh`.
The 60 cases are round 1's (`tests/fixtures/pass_predictor_apparent_orekit_oracle/cases.csv`),
read from there.

| File | Source | Licence |
|---|---|---|
| `PassesOnPathDriver.java` | The round-1 driver with TLEPropagator in an Orekit-built TEME of the stated definition (IERS 2010 TOD rotated by GAST - GMST); run as a separate program against Orekit 13.1.8 and Hipparchus 4.0.3 (Apache-2.0), data directory with only `tai-utc.dat` | AGPL-3.0-only (driver) |
| `orekit.txt` | Oracle output: passes for Q1 to Q3 and the Q4 apparent azimuth and elevation samples | numbers computed by Orekit and Hipparchus |
| `generate.sh` | Regeneration script | AGPL-3.0-only |

SHA-256:

```
3b607b00a76b468199413a94c052aae3d8452239012d229a2cfd75f3744969c3  orekit.txt
1527d0754b15005cf04859d6bc3ecff757a32dd318899ccfbc32cfd41f1364c7  PassesOnPathDriver.java
609cce4aef2590445c6ab908f0f61365756fee3129026bdddeb8f458e462bf49  generate.sh
```
