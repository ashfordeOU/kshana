# Results: the default exponential drag against GMAT R2022a

First comparison run 2026-10-13 after the pre-registration (640c85c1). GMAT was first run on
these cases after that commit; the fixture is committed as produced. Test:
`tests/drag_exponential_gmat_oracle.rs`.

| case | drag displacement at 24 h, GMAT (m) | kshana (m) | worst \|ΔD\| / bar (position and velocity, 25 states) | outcome |
|---|---|---|---|---|
| E400 | 21 498.2 | 21 498.5 | 0.0126 | **AGREES** |
| E300 | 143 889.4 | 143 891.6 | 0.0160 | **AGREES** |
| E250x600 | 92 589.1 | 92 590.5 | 0.0147 | **AGREES** |

The bar is 0.5 m + 1e-3·|D| (velocity: 5e-4 m/s + 1e-3·|ΔV|).

**Bar 1: AGREES** on all 75 equatorial states. **Bar 2: met.** Every |D_gmat(24 h)| exceeds
100 m, and with C_D·A/m 1 % larger kshana's E400 run reaches 9.83 times the bar.

**I400, reported (no bar):** D_gmat(24 h) = 20 300.8 m and D_kshana(24 h) = 22 653.3 m, a 10.4 %
difference (113 times the equatorial bar). This is the stated model difference: GMAT uses geodetic
height, which is above kshana's spherical altitude away from the equator, so GMAT's density is
lower. The pre-registered sign (|D_gmat| < |D_kshana|) holds.

Status: kshana's default exponential drag agrees with GMAT's independent implementation of the same
table at the orbit level on the equator, where the two height definitions coincide. Off the
equator the two models differ by design (spherical against geodetic height), by about 10 % in
24-hour drag displacement at 51.6° and 400 km. The table's accuracy against measured density is
not covered.
