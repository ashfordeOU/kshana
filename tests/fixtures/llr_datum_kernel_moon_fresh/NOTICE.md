# Provenance: fresh-data LLR datum, kernel Moon

Fixture of `tests/validate_llr_datum_kernel_moon_fresh.rs`, fetched and generated on 2026-10-02
after its pre-registration (commit 830d945a) was pushed.

- `normal_points/*.npt`: the 15 ILRS CRD monthly normal-point files for apollo11, apollo14,
  apollo15, luna17 and luna21, 2019-04..2019-06, verbatim from the EUROLAS Data Center
  (DGFI-TUM), `https://edc.dgfi.tum.de/pub/slr/data/npt_crd/<target>/2019/<target>_2019<mm>.npt`,
  retrieved 2026-10-02; digests in `normal_points/SHA256SUMS`. Openly distributed ILRS data,
  courtesy of the contributing stations (Observatoire de la Côte d'Azur, Agenzia Spaziale
  Italiana, Apache Point and others), the ILRS and EDC; see `tests/fixtures/lunar_llr/NOTICE.md`.
- `de440s_2019-03-31_2019-07-02.bsp` (SHA-256 `286212e7853587bfb934bb390165c6cdff414a35f767a43ee001e0a4b9d80e19`):
  the type-2 records of segments 3, 301 and 399 of NAIF's `de440s.bsp` (SHA-256 `c1c7feea...`)
  over the window, bit for bit (United States government work). Made by `make_kernel_cut.py`,
  which reuses `../llr_datum_kernel_moon/make_kernel_cut.py` and checked with SPICE that the cut
  reproduces the full file at 4462 epochs and that de440s and de440 give identical Moon states.
- `reference.txt`, `points.csv`: the unchanged oracle `../llr_datum_spice/gen_llr_datum_spice.py`
  (CSPICE N0067 through spiceypy 8.2.0, MIT; NumPy 2.3.5, BSD-3-Clause), run by `run_oracle.py`,
  which only redirects its input and output directories. Kernel digests are in the header of
  `reference.txt`.
- Reproduce: `source ~/Code/kshana-oracles/env.sh`, then `$ORACLE_PY tests/fixtures/llr_datum_kernel_moon_fresh/make_kernel_cut.py` and
  `$ORACLE_PY tests/fixtures/llr_datum_kernel_moon_fresh/run_oracle.py`.
