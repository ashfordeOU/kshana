# Provenance: lunar datum classification oracle (Sosnica et al. 2025)

`reference.txt` holds numbers printed in one publication. Nothing is computed here.

- **Publication:** K. Sośnica, A. Fienga, D. Pavlov, N. Rambaux and R. Zajdel, "Definition and
  Realization of the International Lunar Reference Frame", arXiv:2510.15484v1, 17 October 2025
  (Astronomy & Astrophysics proofs), `https://arxiv.org/abs/2510.15484`.
- **Copy read:** `~/Code/kshana-oracles/data/papers/arXiv-2510.15484.pdf` (fetched by the oracle
  toolchain's `setup.sh`, listed in its `data/MANIFEST.tsv`), SHA-256
  `d9bb2be2d367af9972e04ff644294273af1654347dc054c14249828984035856`. Not redistributed here.
- **Values:**
  - the correlation coefficient r = -0.97 between the X translation and the scale of the
    transformation between PA lunar frames (Section 6, text beside Fig. 10);
  - the 1-sigma errors of the ILRF-vs-DE430 transformation, Table 7: T_X 0.0307 m, S_c
    0.0184 x 10^-6;
  - the Table 6 ILRF principal-axis coordinates of the five legacy retroreflector arrays
    (Apollo 11, 14, 15, Luna 17, Luna 21). NGLR-1 is left out (preliminary; absent from DE430).
- **Licence:** the numbers are facts quoted with citation; no text or figure is reproduced.
- **Consumed by:** `tests/lunar_datum_sosnica_oracle.rs`.
