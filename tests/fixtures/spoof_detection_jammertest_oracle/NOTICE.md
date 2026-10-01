# NOTICE: JammerTest 2024 spoofing oracle fixture

Used by `tests/spoof_detection_jammertest_oracle.rs` and `tests/tpl_jammertest_coverage_oracle.rs`
(shared pipeline in `tests/jammertest_spoof_oracle_support/mod.rs`). Cut by
`generate_spoof_detection_jammertest_oracle.py` in this directory (a format converter; it computes
nothing).

## `jt2024_*.obs`: GPL-3.0-or-later

Derived from: Sayyaf, Ortiz and Renaudin, "GNSS Dataset Under Jamming, Spoofing, and Meaconing
Conditions (JammerTest 2024)", Universite Gustave Eiffel, Zenodo record 15911589,
doi:10.5281/zenodo.15910563, file `GNSS_DATASET_JAMMING_SPOOFING.tar.gz`
(https://zenodo.org/api/records/15911589/files/GNSS_DATASET_JAMMING_SPOOFING.tar.gz/content),
retrieved 2026-09-30, SHA-256 73e78934aa00d01dfeebabc45f81b38c9c0aecf972f5fc94d9ff60527065b313.

**Licence: GPL-3.0-or-later.** These files are a small modified extract of that dataset (GPS
L1 C/A and L2C pseudoranges of the stationary u-blox ZED-F9P receiver, one epoch per second,
converted from the dataset's `rinex.csv` to RINEX 3 text). They are redistributed under the same
licence; the full text of the GNU General Public License v3 is at
https://www.gnu.org/licenses/gpl-3.0.txt. The modification is the selection and format conversion
done by the generator script. The rest of this repository is not a derivative of the dataset.

| File | Source scenario folder | SHA-256 |
|---|---|---|
| `jt2024_2_1_1.obs` | `Spoofing/stationary/Medium Power (_1W)/Bands_L1_L2_L5/2.1.1` | fee8c4cc2aae001283a7e586ae661b2d728478543584ecdeb8a9717fbf8ad20d |
| `jt2024_2_1_2.obs` | `Spoofing/stationary/Medium Power (_1W)/Bands_E1_L1/2.1.3,2.1.2,2.1.4` | 05bb19f1793d3bf76b6ecc2449798109fb48b075768e7963100bd413e4e894dd |
| `jt2024_2_1_4.obs` | same folder | 1bd56367b84c213e809e3739da93247bbf45526fdd601e7d68b273067df83932 |
| `jt2024_2_3_5.obs` | `Spoofing/stationary/Medium Power (_1W)/Bands_E1_E5_L1_L2_L5/2.3.5,2.3.8` | 6879f3c2ad6c555c615c208a6ce696b279c27138b751b934b8ee0d2f47d1bef0 |
| `jt2024_2_3_10.obs` | `Spoofing/stationary/Medium Power (_1W)/Bands_E1_E5_L1_L2_L5/2.3.10,2.3.11` | 2e2e992cdde647588d01b75bc35fc5a430f7e73b9fa16da23a9c3a2dcaf1895e |
| `jt2024_2_3_11.obs` | same folder | ede999528edf2740916df09453dbd26e79662fd40e3d64e5e2d2582e00417f7a |
| `jt2024_2_3_15.obs` | `Spoofing/stationary/Medium Power (_1W)/Bands_E1_E5_L1_L2_L5/2.3.15,2.3.12` | 25de0a6d8deb83e6cda4d42f361331bc31bbd3ea729c8e79a654ccc65c8ce12b |
| `jt2024_2_3_12.obs` | same folder | 27ada7e195bf62e8651d549498f7f37c17abe559a510c76a4de0c7c23cf2380c |

## `brdc_gps_20240911.rnx`: IGS broadcast navigation

The GPS records (Toc 2024-09-11 04:00 to 18:59) and the GPSA/GPSB header lines of the IGS merged
broadcast navigation file `BRDC00IGS_R_20242550000_01D_MN.rnx.gz`, from the BKG IGS data centre
(https://igs.bkg.bund.de/root_ftp/IGS/BRDC/2024/255/), retrieved 2026-10-01, SHA-256 of the
compressed file 03a03a0d3a5ada1c281b866501d7d4b69533a651236600206835e1990a61c9c3. Broadcast
navigation messages are public data distributed openly by the IGS (International GNSS Service);
cite the IGS. Slice SHA-256 2bae2766e56c45f443ac75e1d3c2ba69f2531f76004dc97eaf5ea895c1d1c99f.

## `onsets.tsv`: the oracle

Published spoofing slot times transcribed from the JammerTest 2024 transmission plan
(Jammertest Consortium, dated 2024-09-13,
https://gpspatron.com/wp-content/uploads/2024/10/Transmissionplan-Jammertest-2024.pdf, SHA-256
680282b0937f6d3418daae57637d8654d79a90a7439761de9d5d84fda06af24f; cited, not vendored), converted from local CEST to GPS time (local - 2 h +
18 s). SHA-256 36b1333a73dd47508b02d803ae1656c876dfd41bde822bc5f98d92f1b4812f87.

Regenerate: extract the dataset (the `.ubx` files are not needed), then
`python3 generate_spoof_detection_jammertest_oracle.py <extracted root> <BRDC00IGS_R_20242550000_01D_MN.rnx>`.
