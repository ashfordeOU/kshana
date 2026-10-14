# Provenance: DE440 transfer optimiser, SPICE + pykep + SciPy reference

Generated 2026-10-14 after the pre-registration
`docs/design/evidence/cap20cd-transfer-optimiser/PREREGISTRATION.md` (bf0439e8).

- `reference.csv`: written by `generate.py`, which calls no Kshana code. It uses the NAIF
  SPICE Toolkit (CSPICE_N0067 through spiceypy 8.3.0, MIT), NumPy 2.5.3 (BSD-3-Clause), SciPy 1.18.1
  (BSD-3-Clause) and pykep 3.0.1 `lambert_problem` (ESA, MPL-2.0; only its numerical output is
  committed). It reads the committed DE440 cut `../porkchop_de440/de440s_2026-08-30_2028-04-15.bsp`
  (provenance in `../porkchop_de440/NOTICE.md`).
- The oracle's Nelder-Mead starts from a 1-day simplex, as the engine's does. SciPy's default
  (5 % of each coordinate, about 1e5 days for a Julian date) left the kernel on the first
  attempt; the pre-registration fixes the tolerances, not the starting simplex.

    python3 -I tests/fixtures/transfer_optimiser/generate.py
