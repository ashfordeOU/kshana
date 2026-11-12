<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Commit IDs before and after the 11 November 2026 history rewrite

On 11 November 2026 the history of `main` from `bd0845acd` onward was rewritten once to remove commit-message trailer
lines from 11 commits. File contents, authors, committers, dates and every other line of every message are unchanged;
the tree of the new head is identical to the old one. The 73 commits after `bd0845acd` got new IDs. The results files
cite the new IDs. Recorded run logs keep the ID printed when they ran (for example `xval/planner/run-v3.txt` and
`run-v3-p4.txt`); this table maps them.

| Old | New | Subject |
|---|---|---|
| `75f73524f` | `92d1ea057` | B4a E5 v2 results: result first, then the dated proof that every scoring rule preceded the |
| `f1a82371c` | `92da3d53a` | B4a E5: independent stdlib recomputation (oracle_e5.py) agrees with E5-SCORE.json to 1e-12 |
| `93fadac54` | `571cb9d19` | B4a E5 scored once on all ten TEXBAT recordings: E5 v2 NOT MET (AUC 0.6941, bar 0.70); E5- |
| `635a1887f` | `96ccde9f2` | E5 v2 / E5-PD: founder score and pd files for ds7.bin (pinned hash matches), committed uns |
| `92cec695f` | `af29624d5` | Merge branch 'ws/e5-score': the E5 v2 / E5-PD score command, before the one score |
| `d77dd76fd` | `e1edaf123` | i18n: allowances for the E5 score command's machine values (cli.rs 50 to 53, texbat.rs 4 t |
| `1c31808c6` | `399f228c4` | B4a E5 scorer: reuse the module's existing median (a duplicate definition did not compile) |
| `33d579518` | `bb393a181` | B4a E5 scorer: cargo fmt |
| `4c51c9652` | `8767a61cd` | B4a E5: kshana bench texbat-score, the one score of E5 v2 and E5-PD from the ten committed |
| `3a2494611` | `677fd7afe` | E5 v2 / E5-PD: founder score and pd files for ds8.bin (pinned hash matches), committed uns |
| `e339827da` | `20919e050` | D18 / B4a E5 v2: pin ds7.bin (size and SHA-256 from the owner's fetch, 11 November 2026);  |
| `576284573` | `e761bd3e5` | D18 / B4a E5 v2: pin ds8.bin (size and SHA-256 from the owner's fetch, 11 November 2026) |
| `d3c56cd42` | `e9d1eb27b` | E5 v2 / E5-PD: founder score and pd files for ds6.bin (pinned hash matches), committed uns |
| `1024e8f93` | `898b27166` | E5 v2 / E5-PD: founder score and pd files for cleanDynamic.bin and ds5.bin (pinned hashes  |
| `f641740c9` | `bef8efd87` | D18 / B4a E5 v2: pin cleanDynamic.bin, ds5.bin and ds6.bin (size and SHA-256 from the owne |
| `313081f8b` | `1b14051dd` | E5 v2 / E5-PD: founder score and pd files for ds3.bin and ds4.bin (pinned hashes match), c |
| `f73d0845c` | `327190989` | D18 / B4a E5 v2: pin ds3.bin and ds4.bin (size and SHA-256 from the owner's fetch, 11 Nove |
| `8605183bf` | `351fc9ff6` | labfit-iq report: estimator settings omitted at their defaults, with field units |
| `bd8987e42` | `15d4c29a8` | Merge branch 'ws/ci-fix-1111': cargo package, Python stub, rmcp advisory |
| `8b2d5f035` | `e8d7d7617` | ci: package the bench manifest src/bench/texbat.rs embeds; ephem_export in the Python stub |
| `f42657cac` | `e770df19f` | Merge branch 'ws/matrix-d8a6v2b': D8a row 6 v2 outcome in the matrix (NOT MET) |
| `869a34fb1` | `b52470914` | matrix: artifacts regenerated for the D8a row 6 v2 text (counts unchanged: 412 / 176 / 232 |
| `450753eb9` | `2547bc25a` | matrix: D8a row 6 v2 outcome on VM-c9318c63 (NOT MET; (a') met, (b') 36/32/27 of 50, (c) a |
| `1dc8b6a32` | `3b3fe2a18` | Merge branch 'ws/b5-v3': B5 v3 diagnosis, readings X1 to X12, oracle, and the broadcast-he |
| `c695798a6` | `7fc161a90` | Merge branch 'ws/m4-v3': M4 v3 readings, logic, development and scored runs, RESULTS-v3 (B |
| `3f8751701` | `8e812ca7f` | B5 v3 engine finding: the constellation test's invariant under the health rule, and ENGINE |
| `337ba5b8b` | `7892f3a24` | D8a row 6 v2 results: NOT MET on v2, scored once over 18 batches and three input sets. (a' |
| `164b43581` | `060ee2a07` | Merge branch 'ws/b1a-v3-run': B1a v3 run logs and RESULTS-v3 (P4 MET) |
| `d3cf9fc08` | `82d445e5a` | B1a v3: RESULTS-v3.md (P4 MET: 0.440809 against 0.410470; P1-P3, P6 MET; P5 Linux), the in |
| `ab9910db5` | `ea2c7ff89` | M4 v3: RESULTS-v3.md (B1, B2, B3, B5, B6, B7 MET; B4 NOT MET at 0.489 for 5 km) and the v3 |
| `e8287ffcd` | `1037b0bae` | B1a v3 P4 run log: P4 printed (0.440809 against 0.410470) before the container restarted a |
| `05536ad29` | `db06dc2ce` | M4 v3: the scored run on seeds 3000 to 3009, once (M4Params::v3: m = 3, new-track cost 9.2 |
| `1c48d518b` | `c05569188` | B5 v3 engine finding, scope: health by system (GPS any bit, QZSS all but the L1C/A-only bi |
| `9f734e189` | `1d23cff8f` | M4 v3: the logic builds and runs (readings 25 to 31); development run on seeds 30 to 39 (d |
| `18c49d624` | `4cf06e89c` | B5 v3 reading X12: what T1 and T5 compare on the satellite-fault replays (discrete bytes;  |
| `e08158d8c` | `6873c6ce9` | B5 v3 step 2: oracle_v3.py, the independent oracle for the satellite-fault screen (X4) and |
| `9a2b8f225` | `b77eb8b0b` | B5 v3 engine finding: select_ephemeris skips broadcast records marked unhealthy (X2) |
| `b344deeeb` | `1321d9601` | B5 v3 step 1: the diagnosis of v2's common-epoch alarms and the v3 readings (X1 to X11), b |
| `bfeed38d0` | `a39ce6263` | B1a v3 P4 run log (in progress, detached since 22:25:57Z) |
| `d090f844a` | `07842f332` | B1a v3 run log: the v2 re-run completed (P1-P3, P5 as recorded); the v3 P4 test was stoppe |
| `d04fcb78f` | `932bf5ddf` | Merge branch 'ws/matrix-041': the 0.41 matrix batch (412 rows: 176 VALIDATED, 232 MODELLED |
| `5bf3bea46` | `fb3808b7c` | web/: re-port at the 412-row matrix |
| `b5e31029f` | `889d37473` | Counts: the matrix at 412 rows (176 VALIDATED, 232 MODELLED, 4 PARTNER) in the READMEs and |
| `0604541c9` | `34516b8d6` | B1a v3 run log (in progress; the run started on main fa896fec5) |
| `fa896fec5` | `5bfd1df42` | Merge branch 'ws/b1a-v3': B1a v3 search code (readings 20 to 22), before its one run |
| `90a077493` | `e1edddd81` | i18n: planner.rs allowance 2 to 4 for the B1a v3 method name (machine value) |
| `3df8cc4c0` | `091dc7f50` | B1a v3: cargo fmt |
| `e5b75ce0b` | `600c22a58` | M4 v3 (WIP, not built, not run): v3 parameters, R27 step test, bounded-turn residual, Hung |
| `5a05b6807` | `7ed3d57a9` | M4 v3: readings 25 to 31, before any v3 code or seed |
| `69d24f058` | `5973f56f1` | B1a v3 (WIP, not run): double exchange and 8 restarts (readings 20 to 22); v2 test sets it |
| `633293dd7` | `9dca1381f` | B1a v3: readings 20 to 25 and the 48-candidate instance place_48_v3.json, before any v3 pl |
| `1c3401d3f` | `1ae28f92a` | B1a v3, B5 v3, M4 v3, B3b: signed off by the owner on 10 November 2026, as drafted |
| `c8a9f01d2` | `70c8d3473` | web/studio: the Studio's ledger copy equals the regenerated web/data/verification-matrix.j |
| `340830b78` | `197935c1a` | i18n: the verification matrix's allowance covers the seven 0.41 v2-evidence MODELLED rows  |
| `088c5762a` | `353e69630` | matrix: seven MODELLED rows for 0.41 modules without one and the v2 outcomes on four exist |
| `a7822c365` | `2c0334d5a` | E5-PD: founder pd files for cleanStatic.bin, ds1.bin, ds2.bin (pinned hashes match), commi |
| `4a238820d` | `ef4ac6738` | D8a row 6 v2 batch 05 raw output (per the batch plan; run in a 4-way parallel pool with pe |
| `c0a2dd93e` | `253f9c497` | D8a row 6 v2 batch 06 raw output (per the batch plan; run in a 4-way parallel pool with pe |
| `e154311d8` | `21415777a` | D8a row 6 v2 batch 07 raw output (per the batch plan; run in a 4-way parallel pool with pe |
| `d7f5e27ff` | `9dd8a9b2b` | D8a row 6 v2 batch 04 raw output (per the batch plan; run in a 4-way parallel pool with pe |
| `4a9668c93` | `3c1f02429` | D8a row 6 v2 batch runner: KSHANA_D8A_ROW6_V2_SEEDS (a (b') process runs only the listed s |
| `522cec058` | `f04232e01` | D8a row 6 v2 batch 09: batch sha256 c8768f024311f1e605a7c21c620ef01889421001e9503c080a8ed2 |
| `4751fd2c3` | `d0f505ff9` | D8a row 6 v2 batch 10: batch sha256 1018a05a3d630bbff0e84d8be5f640185fbc5bacd8dc2ca98102d3 |
| `d34a740ad` | `426e006b3` | D8a row 6 v2 batch 15: batch sha256 94d4cb5ecc6d43eb05649d41b675b41d8502fd339c63a2f25d18a7 |
| `1343704d7` | `a6f9ab35a` | D8a row 6 v2 batch 08: batch sha256 f119040bc16d5ed95ce95446c93eda24a3fbbb155c3277f2c9c7e2 |
| `641f3cd80` | `c5154cab9` | E5 v2: founder score file for ds2.bin (pinned sha 65bfba9b…ed5e), 457 windows, committed |
| `90df812e7` | `ebe888460` | D8a row 6 v2 batch 16: batch sha256 fe9edcd588122250a0cfff31cd09abda45a962acbc97950cd8f618 |
| `189763a3e` | `6dac52fb9` | D8a row 6 v2 batch 14: batch sha256 b95fef5400f2eab530bb13961d8f9e3b34872a38dca6c5d76a8588 |
| `d647a2195` | `52c8a2e3f` | D8a row 6 v2 batch 11: batch sha256 80eab83858ba8e3d41696d0a8c020cd88dd11039407ddb342ccfd7 |
| `a917782d1` | `78076ca31` | D8a row 6 v2 batch 13: batch sha256 42687bb26ff481d85a1ae464095ba4c9f40c4404a8d98de8a0c6c8 |
| `e8af1ead1` | `da519e1f0` | D8a row 6 v2 batch 12: batch sha256 31d0e8fe7f9b3618a015c38a394c700491292bd3a8c75ab008bfab |
| `439349466` | `ba7837b63` | D8a row 6 v2 batch 18: batch sha256 e41e635be1cba750d37b9649c1010ca34b4a2b0a1e44932e640e71 |
| `259118add` | `e9e16829d` | D8a row 6 v2 batch 17: batch sha256 046b7a14ec033f58e4d8683dec507e6f062536f5aac8e7321bd6b9 |
