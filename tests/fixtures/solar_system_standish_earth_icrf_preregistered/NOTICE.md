# Standish amendment sample (the Earth and the ICRF): JPL Horizons DE441

- Source: NASA/JPL (Jet Propulsion Laboratory) Horizons system API, https://ssd.jpl.nasa.gov/api/horizons.api,
  API version 1.2, planetary ephemeris DE441 (every response names DE441).
- Licence: Horizons output is a US Government work and free to use; JPL asks for acknowledgement.
- Retrieved: 2026-10-02, by `generate.py` (standard-library Python; re-run it to reproduce).
- Content: geometric heliocentric (CENTER='500@10') positions rounded to 1 km on the Table 1 grid
  (JD 2378496.5 + 10.25 k, JD 2466154.5 dropped), 8908 epochs per target:
  `horizons_earth_ecliptic.csv` target 399 in the J2000 ecliptic (REF_PLANE=ECLIPTIC);
  `horizons_icrf.csv` targets 1, 2, 3, 4, 5, 6, 399 in the ICRF (REF_PLANE=FRAME).
- Pre-registered in `tests/solar_system_standish_earth_icrf_preregistered.rs` (commit 8d38a28b, made
  before the fetch).
- SHA-256: horizons_earth_ecliptic.csv 29deca201f62071f3552baa4b0900043a2abdc7513ff55f624c324f4a4b8963f; horizons_icrf.csv 7544c2488468d751ba93ab55cb1dece4ae2c944c6109fd2128f48aa579700f93.
