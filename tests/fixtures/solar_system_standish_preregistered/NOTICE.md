# Standish pre-registered sample: JPL Horizons DE441

- Source: NASA/JPL (Jet Propulsion Laboratory) Horizons system API, https://ssd.jpl.nasa.gov/api/horizons.api,
  API version 1.2, planetary ephemeris DE441.
- Licence: Horizons output is a US Government work and free to use; JPL asks for acknowledgement
  ("Solar System Dynamics Group, JPL Horizons").
- Retrieved: 2026-10-01, by `generate.py` (standard-library Python; re-run it to reproduce).
- Content: geometric heliocentric (CENTER='500@10') positions in the J2000 mean ecliptic and equinox
  of the system barycentres 1 to 8, rounded to 1 km as pre-registered in
  `tests/solar_system_standish_preregistered.rs` (commit 80451866, made before the fetch).
- SHA-256:
  - horizons_table1.csv 7686b4567cb89ff0f182de20e51fea7ad481a782a2419f39b5ce157ded11f8b5
  - horizons_table2.csv 6924f407d8c2ecc0cb28d5b106495a78566a5ef15a9fe1c19269ab863a34ebf9
- Error table: Explanatory Supplement to the Astronomical Almanac, 3rd ed., Chapter 8 (Standish and
  Williams), Table 8.10.1, from the chapter PDF ch8.pdf (SHA-256
  fa177870ea85697631c3813dae54939a940fbb8096f8386f78718f40b1626104). Its numbers are cited in the
  test, the PDF is not vendored.
