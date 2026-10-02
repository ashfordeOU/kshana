# NOTICE: M120 round 2 fixture

Used by `tests/leo_navmsg_full_claim_oracle.rs`.

- `grace_c_clock_2024-01-01.csv`: the GRACE-FO 1 (GRACE-C) onboard clock offset of 2024-01-01
  (receiver time minus GPS time) on a 10 s GPS grid, from the GRACE-FO Level-1B product CLK1B
  (NASA Jet Propulsion Laboratory, release 04), file `CLK1B_2024-01-01_C_04.txt` inside
  `gracefo_1B_2024-01-01_RL04.ascii.noLRI.tgz`, GFZ Information System and Data Center,
  https://isdc-data.gfz.de/grace-fo/Level-1B/JPL/INSTRUMENT/RL04/2024/, retrieved 2026-10-02,
  SHA-256 of the archive dee5478487f822d737ae944d8ac248846e739a25dba7c9c428f2960637a34a54.
  Licence: NASA Earth science data and information policy (open data, no restriction on use;
  https://science.nasa.gov/earth-science/earth-science-data/data-information-policy). Cut by
  `gen_clock.py`.
- `kshana_messages.json`: Kshana's fitted messages (the oracle's input), written by the
  ignored test `export_kshana_messages_for_the_oracle`.
- `oracle_part_a.json`: the independent oracle's values, written by `oracle_part_a.py`
  (numpy 2.3.5 from the oracle virtual environment).
- \`orekit_cases.txt\`: Kshana's node-0 states of the Part B cases (written by the ignored test
  \`export_truth_cases_for_orekit\`); \`orekit_truth.txt\`: Earth-fixed positions from Orekit 12.2
  (CS GROUP, Apache-2.0) and Hipparchus 3.1 through \`java/TruthOrekitDriver.java\`, with the EGM2008
  file rewritten by \`icgem_header.py\` (format only) so Orekit's ICGEM reader accepts it.
- The orbit is the round-1 fixture `../leo_navmsg_fit_real_orbit_oracle/grace_c_2024-01-01.csv`
  (TU Graz ITSG, see its NOTICE).

SHA-256:

```
f459dedc70a1cf923bf10b7f9564ba24e0e6743595fe0e4c527610a21773540f  grace_c_clock_2024-01-01.csv
9b355b4f7fa1b0b9e130bce78ac7f6300977e222277c8da5831910f0ebb957cf  kshana_messages.json
1567a0788179bddaf2979a665d09cf9a90bb358cee0ad94e427aa619db26b0ed  oracle_part_a.json
d6046d070443a2a2452a50349bc8331e411ec32b794fe33c6b34fef2352b0d05  orekit_cases.txt
c166853e283097e2146837b9b82daf65989d752730ce83f0eb27f549349dc9e9  orekit_truth.txt
```
