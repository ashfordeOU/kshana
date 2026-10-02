# Fixture: two-part Julian dates against SOFA through ERFA (package D8)

Used by `tests/jd2_sofa_time_oracle.rs`. Generated 2026-10-02 by
`generate_jd2_sofa_time_oracle.py` (run from the repository root with a Python environment
holding pyerfa 2.0.1.5).

| File | Source | Licence |
|---|---|---|
| `generate_jd2_sofa_time_oracle.py` | Generator: writes the instants from the pre-registered rules, then runs the oracle | AGPL-3.0-only (this project) |
| `instants.csv` | 224 UTC calendar instants: six around each of the 27 leap seconds 1972-2016, two fixed instants, 60 drawn with `random.Random(20261002)` from 1972-01-01 to 2026-12-31 | AGPL-3.0-only (this project) |
| `erfa.csv` | Oracle output: `erfa.dtf2d("UTC", ...)`, `erfa.utctai`, `erfa.taiutc` two-part Julian dates, `repr` of each double | numbers computed by pyerfa 2.0.1.5 (liberfa 2.0.1, BSD-3-Clause; the SOFA algorithms released by the ERFA project) |

Retrieved: pyerfa 2.0.1.5 from the Python Package Index on 2026-10-02 (the oracle is run as a
separate program; nothing of it is vendored).

SHA-256:

```
48b308cc91e9701a33bf632a1b743024ddee4ea292b10d859cb7a564c99d717e  instants.csv
000b9c13d991c55cceb62c3d937776371c4e5d89f5ca1f12af37a9e0d3d2a8e7  erfa.csv
ca9cbd9de12d4a2d1e756bed64dfd3c0c78d0b61aadcf2bdaa99d6abf4aab7e2  generate_jd2_sofa_time_oracle.py
```
