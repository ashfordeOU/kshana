# lunar_service_requirement_orekit_oracle fixture

`orekit_requirement.csv` (SHA-256 `df8e7cefbaa541dcdfe8a46a3aae9e91dabd76b7d89189151c76b9c88361715d`) is written by
`xval/orekit-lunar-service/LunarServiceRequirementOracle.java` (no Kshana code), run on
2026-10-02 with Orekit 12.2 and Hipparchus 3.1 (Apache-2.0) and the orekit-data bundle in
`$OREKIT_DATA` (its DE440 `lnxp1990.440`). Inputs: the committed retrieved geometries in
`../lunar_ephemeris/` (LNCSS cases A, B, C of navi.613, CC BY; the LANS demonstration set of
NASA NTRS 20250009447; the JPL Horizons table of four lunar orbiters), and, for the driver's
self-check, `../lunar_protection_level/lunar_protection_level_reference.txt` (the RTKLIB +
SciPy protection-level fixture; worst difference 1.5e-8 m over its seven cases).

One row per (geometry, configuration): the scenario report's coverage, DOP, protection-level
envelope, 95th-percentile HPL and sigma_URE requirements, computed with Orekit propagation,
DOPComputer and TopocentricFrame visibility, and Hipparchus LU, Erf and Brent solvers; see the
driver header and the test header for the definitions.

Regenerate:

    source ~/Code/kshana-oracles/env.sh
    cd xval/orekit-lunar-service
    javac -d /tmp/oracle -cp "$OREKIT_CP" LunarServiceRequirementOracle.java
    java -cp "/tmp/oracle:$OREKIT_CP" LunarServiceRequirementOracle ../../tests/fixtures/lunar_ephemeris \
      > ../../tests/fixtures/lunar_service_requirement_orekit_oracle/orekit_requirement.csv
