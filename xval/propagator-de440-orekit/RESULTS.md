# Results: the propagator's DE440 ephemeris tier against Orekit 12.2

First comparison run 2026-10-13 after the pre-registration (22a5a01d), fixture committed unchanged
(7f7ff132). Test: `tests/propagator_de440_orekit_oracle.rs`.

| bar | measured | pre-registered | outcome |
|---|---|---|---|
| 2. Orbits, worst over 125 states | D1 LEO 0.0142 m / 1.53e-5 m/s; D1 GEO 0.0003 m / 1.9e-8; D1 HEO 0.0034 m / 2.3e-6; D2 LEO 0.0170 m / 1.84e-5; D2 GEO 0.0037 m / 2.2e-7 | 0.5 m, 5e-4 m/s | **AGREES** |
| 3. Analytic-series control, D1 GEO at 24 h | 9.963 m | must exceed 1 m | **AGREES** (the comparison resolves the ephemeris tier) |
| 1. Sun and Moon positions, every epoch | Sun 6.393 m, Moon 0.2445 m | Sun ≤ 3 m, Moon ≤ 0.2 m | **MISS** |

**The miss, and what the diagnostic shows (post-hoc, no bar changed).** `spice_diagnostic.py` reads
the same cut kernel with SPICE at SPICE's exact TT→TDB: it differs from Orekit by 6.255 m (Sun) and
0.2399 m (Moon), almost the same as kshana (6.394 m, 0.2445 m with kshana's two-term TDB−TT). So
kshana's kernel reading and time conversion agree with SPICE to 0.14 m and 5 mm, and the gap lies
between NAIF's `de440s.bsp` path and Orekit's DE440 reader on `lnxp1990.440` (its file, reader or
time scale; both sizes correspond to about 0.2 ms of motion). The cause is not isolated. The
pre-registered bar was set from kshana's own TDB error only and did not allow for it.

Status: the orbit-level agreement is centimetric, but bar 1 missed, so the row stays MODELLED with
the miss recorded. The test pins it: it fails if the Sun or Moon difference leaves the recorded
band (Sun 3–7 m, Moon 0.2–0.3 m), forcing this file to be updated.
