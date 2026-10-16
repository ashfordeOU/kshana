# lambert_multirev

- `reference.csv`: output of pykep 3.0.1 (`lambert_problem`, the C++ kep3 core; ESA,
  MPL-2.0, https://github.com/esa/pykep, installed from PyPI), run as a separate program by
  `scripts/gen_lambert_multirev_ref.py` on the case set of
  `docs/design/evidence/lambert-multirev/PREREGISTRATION.md` (pre-registered a75de851). Only
  the numerical output is committed; no pykep code is copied into Kshana.
- Regenerated independently on 2026-10-13 with pykep 3.0.1: byte-identical to the committed file.
