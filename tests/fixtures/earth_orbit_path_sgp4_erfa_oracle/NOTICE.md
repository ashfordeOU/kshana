# Fixture: the Earth-orbit path against the reference SGP4 and SOFA (package D8, legs 1 and 2)

Used by `tests/earth_orbit_path_sgp4_erfa_oracle.rs`. Generated 2026-10-02 by `generate.sh`.

| File | Source | Licence |
|---|---|---|
| `teme_cases.csv`, `frame_cases.csv` | The pre-registered cases, written by the test's fixture writer from the committed M131 and pass fixtures and the fixed instant list | AGPL-3.0-only (this project) |
| `oracle.py`, `generate.sh` | Oracle script, run as a separate program | AGPL-3.0-only (scripts) |
| `reference_sgp4_teme.csv` | TEME positions from python-sgp4 2.24 (D. Vallado's reference SGP4; MIT licence) | numbers computed by python-sgp4 |
| `erfa_matrices.csv` | GCRS->ITRS (`c2t06a`) and TEME->ITRS (`c2t06a . pnm06a^T . rz(-ee06a)`) from pyerfa 2.0.1.5 (liberfa 2.0.1; BSD-3-Clause) | numbers computed by ERFA |

Both Python packages were installed from the Python Package Index on 2026-10-02
(`xval/d8-orekit13/setup.sh` pins them); nothing of them is vendored.

SHA-256:

```
519b13615c712902146e436fd778de9d9fe04e4164c4d05573e95b9dea07bc79  erfa_matrices.csv
9de586202d9a1d8a344e4d815a6a68b3b250316ccceb56d336bbb5cd4f67f99b  frame_cases.csv
72def9c7ec08b1e14edbd77d71166001fe70dfe0ff88995103a5d4bfb3be7c6e  reference_sgp4_teme.csv
a41e6e5689bdad304b301f52b356a03afae0c20f0a1679628b1948ed7976620f  teme_cases.csv
cbc7bfdd7d1f5124fa3e4c1c7d14c3e23fc022cfdc7b0890b5fe4db5ea305843  oracle.py
35765440dd5479d13044057265ab34f02228d2e4c70fd4b92c67ed3e0304b40e  generate.sh
```
