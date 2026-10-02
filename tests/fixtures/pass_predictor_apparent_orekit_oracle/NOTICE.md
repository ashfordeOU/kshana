# Fixture: apparent pass prediction against Orekit 13.1.8 (package D8, new row)

Used by `tests/pass_predictor_apparent_orekit_oracle.rs`. Generated 2026-10-02 by `generate.sh`
(run from the repository root after `source ~/Code/kshana-oracles/env13.sh`).

| File | Source | Licence |
|---|---|---|
| `cases.json`, `cases.csv` | The 60 pre-registered cases (four SGP4 element sets, five sea-level stations, masks 0, 5 and 10 deg), written by the test's fixture writer | AGPL-3.0-only (this project) |
| `PassesApparentDriver.java` | Driver run as a separate program against Orekit 13.1.8 and Hipparchus 4.0.3 (Apache-2.0; jars from Maven Central, SHA-1 verified), with a data directory holding only `tai-utc.dat` from orekit-data (no Earth orientation parameters) | AGPL-3.0-only (driver); Orekit is not vendored |
| `orekit.txt` | Oracle output: passes (AOS, TCA, LOS, maximum elevation) for Q1 to Q3 and the Q4 apparent azimuth and elevation samples | numbers computed by Orekit and Hipparchus |
| `RefractionTableDriver.java`, `orekit_refraction.txt` | Disclosure table: Orekit's `ITURP834AtmosphericRefraction` at heights 0 to 3 km | AGPL-3.0-only (driver); numbers computed by Orekit |
| `generate.sh` | Regeneration script | AGPL-3.0-only |

The refraction model the engine implements is ITU-R P.834-9 (12/2017), equations (9), (10),
(11), (13) and (14), read from the Recommendation as published free of charge by the ITU
(`R-REC-P.834-9-201712-I!!PDF-E.pdf`, retrieved 2026-10-02, SHA-256
eaa89e48778915eb23d67b22c346eab640ad854468ba1606618143ab82059e91); the document is cited, not
vendored. orekit-data `tai-utc.dat` SHA-256
3524e1ae34d67e858873a89e59983bbc5bd100221da898e796c1b36036a310c3.

SHA-256:

```
c06f2bf10c93cc79c3f8c81db062e32af0ea642e37a1297860adea89ab12cf8f  cases.json
fcdae523f6964e7c8955d6f0eddead83d3ff18aa6670ea05c6084ac04c41d299  cases.csv
da0c57726435a33ea1510065763729a614cf6203e212808e9450d9961eaa4b72  orekit.txt
46035aede1c58cf9b499fa8446375188e59562e125876a81357819e0e4c45ee4  orekit_refraction.txt
b4fe5faf33e27b3c6ff2f01bf93e9abbda0e9a9e2d801f638adcf7a64c641832  PassesApparentDriver.java
07c2cd375084d3e428406c6086186003781b483d16cc14add0c5e0da25d453f7  RefractionTableDriver.java
5340837bcfdfd35dea9b00e2c518e24fdcfc474411b0aa7a7405e522255caddb  generate.sh
```
