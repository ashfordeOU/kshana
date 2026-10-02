# RTKLIB integer-level decode of Kshana LNAV subframes (unseen inputs)

- `harness.c` (BSD-2-Clause, to match RTKLIB): a separate oracle program on RTKLIB v2.4.2-p13
  (commit 71db0ffa0d9735697c6adfd06fdf766d0e5ce807, BSD-2-Clause): `parse` runs `readrnx` on the
  input file; `decode` runs `decode_word` and `decode_frame` on Kshana's words.
- `generate.sh`: fetches `BRDC00IGS_R_20250610000_01D_MN.rnx.gz` (IGS daily broadcast
  navigation file, 2 March 2025, from the BKG mirror of the IGS archive, open use with
  attribution) and runs the two stages.
- `rtklib_ephemerides.json`, `kshana_words.txt`, `rtklib_decoded.json`: written after the
  pre-registration was pushed.
