# Provenance: kernel-backed solar-system kind, SPICE reference

Generated 2026-10-13 after the pre-registration
`docs/design/evidence/cap31-solar-system-kernel/PREREGISTRATION.md` (f8e946ea).

- `reference.csv`: written by `generate.py` (NAIF SPICE Toolkit CSPICE N0067 through spiceypy
  8.3.0, MIT), which calls no Kshana code, from NAIF's `de440s.bsp`
  (https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp, SHA-256
  `c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2`, JPL, public).
- `de440s_cut_jd2461041.5.bsp` (8 192 bytes, SHA-256
  `ed8cc2bd9bfa92e296649450e6c2dc4801ce373ef5185863e25fbbb13965b642`),
  `de440s_cut_jd2462668.0.bsp` (6 144 bytes,
  `5736c311b0e655a7da49868f505ec1181b6de5051992e28b05d5e4e8dd8a1233`) and
  `de440s_cut_jd2466519.5.bsp` (7 168 bytes,
  `5e750986148078b5720a1eb55566419a06707dc0bfc286085b91abfc20788348`): segments 10, 1, 199, 2,
  299, 3, 399 and 301 of `de440s.bsp` over +-2 days of each epoch, bit for bit, made by
  `make_kernel_cuts.py` (which reuses `../llr_datum_kernel_moon/make_kernel_cut.py` unchanged);
  SPICE checked each against the full file at 95 hourly epochs.

    source "$KSHANA_ORACLES/env.sh"
    $ORACLE_PY tests/fixtures/solar_system_kernel/make_kernel_cuts.py
    $ORACLE_PY tests/fixtures/solar_system_kernel/generate.py
