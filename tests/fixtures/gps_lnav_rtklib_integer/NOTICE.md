# RTKLIB integer-level decode of Kshana LNAV subframes (unseen inputs)

- `harness.c` (BSD-2-Clause, to match RTKLIB): a separate oracle program on RTKLIB v2.4.2-p13
  (commit 71db0ffa0d9735697c6adfd06fdf766d0e5ce807, BSD-2-Clause): `parse` runs `readrnx` on the
  input file; `decode` runs `decode_word` and `decode_frame` on Kshana's words.
- `generate.sh`: fetches `BRDC00IGS_R_20250610000_01D_MN.rnx.gz` (IGS daily broadcast
  navigation file, 2 March 2025, from the BKG mirror of the IGS archive, open use with
  attribution) and runs the two stages.
- `rtklib_ephemerides.json`, `kshana_words.txt`, `rtklib_decoded.json`: written after the
  pre-registration was pushed.
- Generated 2026-10-02 after the pre-registration d4d9eb9d was pushed. SHA-256:
  `BRDC00IGS_R_20250610000_01D_MN.rnx` 0983f7489d516cf5f276f88a5686c136b2bd7d73e9a1eb3ef4475029a0b56463,
  `rtklib_ephemerides.json` fb873770dcd191329a393aaad1bf10985deebc75b0b10836f92b292484245a41,
  `kshana_words.txt` 680e07c528b419acc7c124d460c1edf6e4b4d3a00e503ca8f111bfbadd71e116,
  `rtklib_decoded.json` df06126f2215f0f07117eaf9d0ffe2b112bdb3a36588117e33546e3cfa40a715.
