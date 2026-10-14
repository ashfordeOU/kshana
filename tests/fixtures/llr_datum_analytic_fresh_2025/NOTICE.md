# Provenance: fresh-data LLR datum, analytic Moon, 2025-04..06

Fixture of `tests/validate_llr_datum_analytic_fresh_2025.rs`, fetched and generated after its
pre-registration (`docs/design/evidence/mr06-llr-analytic-fresh/PREREGISTRATION.md`, commit
31f5283, 2026-10-12 19:44 UTC) and committed in 990dee43 (2026-10-12 22:24 UTC).

- `normal_points/*.npt`: the 15 ILRS CRD v2 monthly normal-point files for apollo11, apollo14,
  apollo15, luna17 and luna21, 2025-04..2025-06, verbatim from the EUROLAS Data Center
  (DGFI-TUM), `https://edc.dgfi.tum.de/pub/slr/data/npt_crd_v2/<target>/2025/<target>_2025<mm>.np2`,
  first retrieved 2026-10-12. The only transform is the file name: each upstream
  `<target>_2025<mm>.np2` is stored as `<target>_2025<mm>.npt` with its content unchanged,
  because both readers glob `*.npt`. Digests in `normal_points/SHA256SUMS`; all 15 files were
  fetched again from the same URLs on 2026-10-13 and are byte-identical to the committed ones.
  All 15 upstream files exist; none is missing. Openly distributed ILRS data (no login,
  anonymous access), courtesy of the contributing stations (Observatoire de la Côte d'Azur,
  Agenzia Spaziale Italiana and others), the ILRS and EDC; cite the ILRS as
  `tests/fixtures/lunar_llr/NOTICE.md` describes.

| File (stored name) | Upstream name | SHA-256 |
|---|---|---|
| `apollo11_202504.npt` | `apollo11_202504.np2` | dfd9b9f97b3f065bdecce2c1875ce5c3fc1f674f736f5a60cb02a771b186cdc0 |
| `apollo11_202505.npt` | `apollo11_202505.np2` | 7c9638a10fe6cf88e3593f480c2a97e9285205479c5a5b9bcf836c7ab908ed43 |
| `apollo11_202506.npt` | `apollo11_202506.np2` | 4a422b0c461a423d8c1eb9ba9543870b709c2dec0a14bce4bf40891faca03c66 |
| `apollo14_202504.npt` | `apollo14_202504.np2` | 9bd3e6d1c828ef02ca4316ec7fa309b3e339e999e8ab6eeabb03f863541a99aa |
| `apollo14_202505.npt` | `apollo14_202505.np2` | 9a40a9a328b97293b9969960e21a40e831330fbff33b646247b243b789819041 |
| `apollo14_202506.npt` | `apollo14_202506.np2` | ec0c39ff2ea771e5f24082e108ac3673fd650aa92f98881514c7c34a40999144 |
| `apollo15_202504.npt` | `apollo15_202504.np2` | cd27127388ed207ec597ed5e6a9f83f45ae036f82cfb75794bb7b94cbe857ed6 |
| `apollo15_202505.npt` | `apollo15_202505.np2` | 171d70e8dff8b3457ca163f8e23e2e182761a4f16ae95636e86a1261d08683f7 |
| `apollo15_202506.npt` | `apollo15_202506.np2` | d21bd2739246227e369d98316edd8b10d4d6972e130ca5e3132268249cb6c3eb |
| `luna17_202504.npt` | `luna17_202504.np2` | dd4fdbaf420466e56f9c72d11edddd0177f034c3cb6c0cb06c196c5c00cfdd92 |
| `luna17_202505.npt` | `luna17_202505.np2` | 60df9bdd67af0d41b7e8478431a671e4310bac266b9431d1d1db05eeeb34b78b |
| `luna17_202506.npt` | `luna17_202506.np2` | 791445308b462e0e2b1671db6ff09f2ff0afbdb7ca60b779ff07bc62eecd0efd |
| `luna21_202504.npt` | `luna21_202504.np2` | b8124799e888a4a5e6c563d5d66c849b6468cda61474f388d2dff1afcc0f22c3 |
| `luna21_202505.npt` | `luna21_202505.np2` | 6a9ea8e0fd3829aa5e44971bba09205b065003af10d20b756a8a1658af3ff742 |
| `luna21_202506.npt` | `luna21_202506.np2` | 0254c956168109d2a5f8216940a0836b510777885bc854f88dae3424b9323f9c |

- `de440s_2025-03-31_2025-07-02.bsp` (21 504 bytes, SHA-256
  `473c5c0a79e3a726dbfbcb975b0ba9d82bcfc8a40356ad14c376040c12e106d5`): the type-2 records of
  segments 3, 301 and 399 of NAIF's `de440s.bsp`
  (`https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp`, JPL, public
  United States government work) over the window, bit for bit. Made by `make_kernel_cut.py`,
  which reuses `../llr_datum_kernel_moon/make_kernel_cut.py` unchanged with only the window and
  output file changed. Used only by the information-only kernel-Moon run, never by the verdict.
- `reference.txt` (SHA-256 `45b292121231d9da7d7369b36d0e3f10e9447626823266f21e2bf68a93f14854`)
  and `points.csv` (SHA-256 `476edc06efc41aa6e51185e4deaa4803e430155762aaaccd6486453793dc4d43`):
  the unchanged oracle `../llr_datum_spice/gen_llr_datum_spice.py` (CSPICE N0067 through spiceypy
  8.3.0, MIT; NumPy 2.5.4, BSD-3-Clause), run by `run_oracle.py`, which only redirects its input
  and output directories. Kernel digests are in the header of `reference.txt`. Calls no Kshana
  code.
  Re-run independently on 2026-10-13 from kernels downloaded again from NAIF: every kernel digest
  is the same except `earth_latest_high_prec.bpc`, which NAIF updates daily (re-run digest
  `d7fc98f0fee7e21c352a90b3edff614348810eb915bcbb9d9e021ec8eab21804`). Parsed, used and skipped
  counts, ranks and per-array counts are identical, and every sigma, norm, ratio and the
  condition number agree with the committed `reference.txt` to within 4.4e-8 relative. The
  kernel cut was also regenerated and is byte-identical.
- Reproduce: `source "$KSHANA_ORACLES/env.sh"`, then
  `$ORACLE_PY tests/fixtures/llr_datum_analytic_fresh_2025/make_kernel_cut.py` and
  `$ORACLE_PY tests/fixtures/llr_datum_analytic_fresh_2025/run_oracle.py`.
