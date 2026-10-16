# Provenance: DE440 porkchop, SPICE + pykep reference

Generated 2026-10-13 after the pre-registration
`docs/design/evidence/cap20b-porkchop-de440/PREREGISTRATION.md` (2d857fb1).

- `reference.csv`: written by `generate.py` (NAIF SPICE Toolkit CSPICE N0067 through spiceypy
  8.3.0, MIT; NumPy 2.5.4, BSD-3-Clause; pykep 3.0.1 `lambert_problem`, ESA, MPL-2.0, only its
  numerical output is committed), which calls no Kshana code, from NAIF's `de440s.bsp`
  (https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp, SHA-256
  `c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2`, JPL, public).
- `de440s_2026-08-30_2028-04-15.bsp` (81 920 bytes, SHA-256
  `7ee5befc646eef9952df05ac05f8d598d559e651fd907131b9907e81f9199abc`): segments 10, 3, 399 and 4
  of `de440s.bsp` over the window, bit for bit, made by `make_kernel_cut.py` (which reuses the
  cutting and DAF writing of `../llr_datum_kernel_moon/make_kernel_cut.py` unchanged); SPICE
  checked that it reproduces the full file's heliocentric Earth and Mars barycentre bit for bit
  at 593 daily epochs. The engine side reads it.

    source "$KSHANA_ORACLES/env.sh"
    $ORACLE_PY tests/fixtures/porkchop_de440/make_kernel_cut.py
    $ORACLE_PY tests/fixtures/porkchop_de440/generate.py
