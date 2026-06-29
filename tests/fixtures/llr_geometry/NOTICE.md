# LLR Geometry Fixtures — Provenance Notice

## Retroreflector PA-frame coordinates (`reflectors.csv`)

**Source:** Park, R. S. et al. (2021) "The JPL Planetary and Lunar Ephemerides DE440 and
DE441", *The Astronomical Journal*, 161, 105. doi:10.3847/1538-3881/abd414
(DE440 LLR retroreflector solution, Table 4 — principal-axis body-frame positions).

**Secondary survey reference:** Williams, J. G. et al. (2008), "Lunar laser ranging
science: Gravitational physics and lunar interior and geodesy", *Advances in Space
Research*, 37(1), 67–71. doi:10.1016/j.asr.2005.05.013

**Coordinate derivation:** Selenographic lat/lon anchor values converted to PA Cartesian
on a sphere of mean lunar radius R = 1737.4 km using
`x = R·cos(φ)·cos(λ)`, `y = R·cos(φ)·sin(λ)`, `z = R·sin(φ)`
(φ = selenographic latitude, λ = selenographic longitude, east positive).
This is a structural geometry analysis; mm-level positional accuracy is not required.
The test tolerance is |r − 1737.4 km| < 10 km.

Anchor selenographic coordinates:
- Apollo 11:   φ =  0.67°N, λ = 23.47°E
- Apollo 14:   φ =  3.64°S, λ = 17.48°W
- Apollo 15:   φ = 26.13°N, λ =  3.63°E
- Lunokhod 1:  φ = 38.31°N, λ = 35.00°W
- Lunokhod 2:  φ = 25.83°N, λ = 30.92°E

**License note:** Published scientific coordinates are factual constants and are not
copyrightable; cited per good scholarly practice.

## Station geodetic coordinates (`stations.csv`)

**Source:** ILRS (International Laser Ranging Service) station logs and site reports.
Coordinates are ITRF-aligned geodetic (WGS84 compatible):
- Grasse OCA (France):           43.7546°N, 6.9215°E, 1320 m
- APOLLO/APO (New Mexico, USA):  32.780°N, 105.820°W, 2780 m
- Wettzell WLRS (Germany):       49.1450°N, 12.8780°E,  665 m
- Matera MLRO (Italy):           40.6486°N, 16.7046°E,  537 m

## Oracle anchor for downstream analysis

**Sośnica, K. et al. (2025)**, "Definition and Realization of the International Lunar
Reference Frame", arXiv:2510.15484.
Reports lunocenter-X ↔ scale correlation r ≈ −0.97 and a centre-of-mass origin X-floor
~12 cm from LLR normal-point analysis. Used as the external oracle for validating the
Fisher-information datum-defect results produced by `src/lunar_llr.rs`.

## File integrity

| File            | SHA-256                                                          |
|-----------------|------------------------------------------------------------------|
| reflectors.csv  | b400df1e9f8e912a9ac73417c6a0b68bb800dc66ea7b3c5c22d87e8f428480ad |
| stations.csv    | 945cdc3c5c2c5f1721df2f59bf4549005f152a98a9cf86936d2abe880295f416 |
