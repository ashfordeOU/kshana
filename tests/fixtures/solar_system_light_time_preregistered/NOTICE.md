# Light-time pre-registered sample: JPL Horizons DE441

- Source: NASA/JPL (Jet Propulsion Laboratory) Horizons system API, https://ssd.jpl.nasa.gov/api/horizons.api,
  API version 1.2, planetary ephemeris DE441.
- Licence: Horizons output is a US Government work and free to use; JPL asks for acknowledgement.
- Retrieved: 2026-10-01, by `generate.py` (standard-library Python; re-run it to reproduce).
- Content: the one-way light time LT (seconds, as Horizons prints it) from the system barycentres
  1, 2, 4, 5, 6 to the Earth's centre (CENTER='500@399', VEC_CORR='LT'), 8908 reception epochs each,
  as pre-registered in `tests/solar_system_light_time_preregistered.rs` (commit aa701595, made
  before the fetch).
- SHA-256: horizons_light_time.csv f80e093a3a2fbcb8f82bccdbfeb63415ea08518df493d11c72549bd8de1b9e28
