# Provenance: CR3BP rotating states to MCI, SPICE two-vector frame

Generated 2026-10-13 after the pre-registration
`docs/design/evidence/rm34-cr3bp-to-mci/PREREGISTRATION.md` (2313eb1b, amended d5ef79b3).

- `em_rot.tf`: the two-vector dynamic frame `EM_ROT`, written for this test (SHA-256
  `cf36e016d4f4c692bee5b354229c9b1db9c2bf5877419a4bf9f5ab89d1e8c919`).
- `reference.csv`: written by `generate.py` (NAIF SPICE Toolkit CSPICE N0067 through spiceypy
  8.3.0, MIT; NumPy 2.5.4, BSD-3-Clause), which calls no Kshana code, from NAIF's `de440s.bsp`
  (https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp, SHA-256
  `c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2`, JPL, public) and the
  initial states of the committed JPL Three-Body Periodic Orbits API responses
  (`../cr3bp_families_jpl/`).
- `de440s_2024-12-31_2025-01-30.bsp` (10 240 bytes, SHA-256
  `3cd9600799b86fcca3e11b4b3f7d22c310b032cbb76b8e7b87db95ffe79ba73d`): segments 3, 301 and 399
  of `de440s.bsp` over the window, bit for bit, made by `make_kernel_cut.py` (which reuses
  `../llr_datum_kernel_moon/make_kernel_cut.py` unchanged); SPICE checked that it reproduces the
  full file's Moon wrt the Earth bit for bit at 1 439 epochs. The engine side reads it.

    source "$KSHANA_ORACLES/env.sh"
    $ORACLE_PY tests/fixtures/cr3bp_to_mci_spice/make_kernel_cut.py
    $ORACLE_PY tests/fixtures/cr3bp_to_mci_spice/generate.py
