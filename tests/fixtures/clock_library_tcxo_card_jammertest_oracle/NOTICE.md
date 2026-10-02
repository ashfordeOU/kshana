# NOTICE: receiver-TCXO training fixture (JammerTest 2024)

Used by `tests/clock_library_device_cards_oracle.rs` (card C7) and
`tests/clock_library_tcxo_card_jammertest_oracle.rs` (M010 round 3). Cut by `generate.py` in
this directory (a format converter; it computes nothing). Retrieved 2026-10-02.

## `train_*.obs`: GPL-3.0-or-later

Derived from: Sayyaf, Ortiz and Renaudin, "GNSS Dataset Under Jamming, Spoofing, and Meaconing
Conditions (JammerTest 2024)", Universite Gustave Eiffel, Zenodo record 15911589,
doi:10.5281/zenodo.15910563, file `GNSS_DATASET_JAMMING_SPOOFING.tar.gz`, SHA-256
73e78934aa00d01dfeebabc45f81b38c9c0aecf972f5fc94d9ff60527065b313.

**Licence: GPL-3.0-or-later.** These files are a small modified extract of that dataset (GPS L1
C/A and L2C pseudoranges of the stationary u-blox ZED-F9P receiver, one epoch per second,
converted from the dataset's `rinex.csv` to RINEX 3 text by the M010 round-1 converter). They are
redistributed under the same licence; the full text of the GNU General Public License v3 is at
https://www.gnu.org/licenses/gpl-3.0.txt. The modification is the selection and format
conversion done by the generator. The rest of this repository is not a derivative of the dataset.

| File | Source scenario folder | SHA-256 |
|---|---|---|
| `train_01.obs` | `Meaconing/stationary/High Power (_10W)/Bands_E1_L1_L2/3.1.1,3.1.2` | 8b6df4a3aff51d3b52232c30c7b15ea5baa1694ac42faa22cb8ff4c67082c05c |
| `train_02.obs` | `Meaconing/stationary/Very High Power (≥10W)/Bands_E1_L1_L2/3.2.7` | fb50f20e6d0c74972fdcdfe2aaca3ab6eaa7437fc9597fdbfa8e075be5a7e6e0 |

`sessions.tsv` (SHA-256 e53bfa9208f8420c7cf153cf47d7453fa76e81779652fca76692106fdc6b020f) lists
every candidate session, its epochs and how many the selection kept: the jamming session 1.6.4
(2024-09-09) and the meaconing session 3.2.8 (2024-09-10) keep none.

Epochs within 60 s of any transmission in the official JammerTest 2024 log
("Logg_Jammertest_2024_v1.xlsx", Jammertest consortium,
https://www.jammertest.no/content/files/2026/05/Logg_Jammertest_2024_v1.xlsx, retrieved
2026-10-02, SHA-256 4ef5091a4ee6489e8700b3495c51b4e99e9c37c138617c7c9c7f83f2047e60e2; cited, not
vendored) are removed.

## `brdc_gps_20240910.rnx`: IGS broadcast navigation

The GPS records of 2024-09-10 and the GPSA/GPSB header lines of the IGS merged broadcast
navigation file `BRDC00IGS_R_20242540000_01D_MN.rnx.gz` (BKG,
https://igs.bkg.bund.de/root_ftp/IGS/BRDC/2024/254/, retrieved 2026-10-02, SHA-256 of the
compressed file 43051eb3464e65be61412afab017375e58b2e5289b8c7d5d3db337bb3d7e54d9). Public data
distributed openly by the IGS; cite the IGS. Slice SHA-256
4c9875b83535c67a1def3ef9f506218efbc8584e2e1a66e1b1f43f6dd98a1638.

Regenerate: extract the dataset (the `.ubx` files are not needed), then
`python3 generate.py <extracted root> <Logg_Jammertest_2024_v1.xlsx> <directory of uncompressed BRDC files>`.
