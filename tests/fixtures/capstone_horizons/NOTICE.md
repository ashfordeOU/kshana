# Provenance: CAPSTONE ephemeris from JPL Horizons

`capstone_2023-03_moon_icrf.txt` (847 320 bytes, SHA-256 in `../../../docs/design/evidence/cap29d-capstone-nrho/RESULTS.md`):
the JPL Horizons API response for CAPSTONE (NAIF -1176, source `CAPSTONE_merged`), Moon-centred
(`500@301`, DE441), ICRF, state vectors in km and km/s, 2023-03-01 to 2023-03-31 TDB every
10 minutes (4 321 rows), retrieved 2026-10-13 after the pre-registration
`docs/design/evidence/cap29d-capstone-nrho/PREREGISTRATION.md` (4e868170), committed byte for
byte. Request: `url.txt`. A first request, which also put `TDB` on the stop time, was rejected
by the API ("Specify time-scale/zone only with START epoch") and returned no data. JPL Horizons
output is a United States government work (NASA/JPL), publicly available without login.
