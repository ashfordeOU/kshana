# The CR3BP 9:2 NRHO against CAPSTONE's flown orbit: results (a measurement)

Pre-registration: `PREREGISTRATION.md` (4e868170). Data: JPL Horizons CAPSTONE (-1176),
2023-03-01..31 TDB, 10 min, Moon-centred ICRF; the window was covered, so no move.
`tests/fixtures/capstone_horizons/capstone_2023-03_moon_icrf.txt`, SHA-256 `fed146a1ea7a2a5c92510cea476d9c6903c19baea67cd19e5a306f78071d18a2`.
Run 2026-10-13, `cargo test --release --test capstone_nrho_horizons -- --nocapture`.

| Quantity | CAPSTONE (mean) | CR3BP 9:2 NRHO | Gap | Bar |
|---|---|---|---|---|
| period | 6.5004 d (4 perilunes) | 6.5699 d | 1.07 % | 3 % |
| apolune radius | 71 182.4 km (5 apolunes) | 71 215.0 km | 0.05 % | 5 % |
| perilune radius | 3 384.7 km | 3 245.3 km | 4.1 % | 20 % |

All three hold. The new MODELLED row "Earth-Moon CR3BP 9:2 NRHO against the orbit CAPSTONE
flew" records this as a measurement of how representative the CR3BP member is; it is not a
validation (no Sun, no lunar eccentricity, no station keeping in the model).
