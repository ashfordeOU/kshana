# LLR Geometry Fixtures — Provenance Notice

## Retroreflector PA-frame coordinates (`reflectors.csv`)

**Source:** Park, R. S. et al. (2021) "The JPL Planetary and Lunar Ephemerides DE440 and
DE441", *The Astronomical Journal*, 161, 105. doi:10.3847/1538-3881/abd414
(DE440 LLR retroreflector solution, Table 4 — principal-axis body-frame positions).

**Secondary survey reference:** Williams, J. G. et al. (2008), "Lunar laser ranging
science: Gravitational physics and lunar interior and geodesy", *Advances in Space
Research*, 37(1), 67–71. doi:10.1016/j.asr.2005.05.013

**Coordinate values:** PA body-frame Cartesian positions taken directly from Table 1
of the DE440 paper (Park et al. 2021). Values are in metres.

| Site        |        X (m)   |       Y (m)   |        Z (m)  |
|-------------|----------------|---------------|---------------|
| Apollo 11   |  1 591 967.049 |   690 698.573 |    21 004.461 |
| Apollo 14   |  1 652 689.369 |  −520 998.431 |  −109 729.869 |
| Apollo 15   |  1 554 678.104 |    98 094.498 |   765 005.863 |
| Lunokhod 1  |  1 114 291.452 |  −781 299.273 | 1 076 059.049 |
| Lunokhod 2  |  1 339 363.598 |   801 870.995 |   756 359.260 |

The sites lie at radii 1 734–1 737 km, within ~3 km of the mean lunar radius (1 737.4 km).
The test tolerance |r − 1737.4 km| < 10 km checks genuine topography, not a sphere.

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
| reflectors.csv  | 760b8a9b846b5d142add68381a5e92ac219094c4ef03f9ae349b9b06b904a8d1 |
| stations.csv    | 945cdc3c5c2c5f1721df2f59bf4549005f152a98a9cf86936d2abe880295f416 |
