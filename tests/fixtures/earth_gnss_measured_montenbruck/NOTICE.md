# Fixture: GENESIS tracking inputs for row M039 (Montenbruck et al. 2023 reproduction)

Retrieved 2026-10-02. Generators in this directory; run with Python 3 (PyMuPDF for the patterns).

- `orbits_20230101_10min.csv` (SHA-256 306289d8d921115fb0366babf3acbbcbb175a0bdc5feb038eee68f1c2643eefc):
  GPS and Galileo Earth-fixed positions every 10 min on 2023-01-01, from the ESA/ESOC final
  multi-GNSS orbit `ESA0MGNFIN_20230010000_01D_05M_ORB.SP3.gz` (SHA-256 of the gzip
  2b59d431d696bfe2894db9329c8af711b578356e707becf905ddba960744dff6), ESA Navigation Office open
  mirror http://navigation-office.esa.int/products/gnss-products/2243/ (no login; IGS/MGEX
  products are published for open scientific use with attribution; credit ESA/ESOC and the IGS).
  Generator `make_orbits.py`. 31 GPS and 26 Galileo satellites, as in the paper.
- `blocks.json` (SHA-256 d1e59a5fdacd9738d8b3e5fdb7b5e569ceecffca461948998ba8b80f654105aa): block of
  each PRN on 2023-01-01 from the IGS satellite metadata SINEX
  https://files.igs.org/pub/station/general/igs_satellite_metadata.snx (IGS, open use with
  attribution; the file's SHA-256 at retrieval is stored in the JSON). Generator `make_blocks.py`.
- `patterns.json` (SHA-256 03d5976168675b497f13847e7f626f7bd292111d30133049cd156b4614fd695c): the
  L1/E1 gain curves of Fig. 3 and Fig. 4 of O. Montenbruck et al., "GNSS visibility and
  performance implications for the GENESIS mission", J. Geod. 97:96 (2023),
  doi 10.1007/s00190-023-01784-4, licensed CC BY 4.0 (reuse with attribution; these are numbers
  extracted from the published figures' vector paths, changes: centre-line extraction and halves
  averaged). Generator `extract_patterns.py`, which also stores its calibration checks.
