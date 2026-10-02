# Lunar rate-frame coupling, second pre-registration: inputs and oracles

- `fields.txt`: the reference radius, gravity constant and fully normalised C20 of the two degree-350
  lunar gravity fields of Bertone, Arnold, Girardin, Lasser, Meyer and Jaeggi 2021, Earth and Space
  Science, doi:10.1029/2020EA001454 (the reference [8] of Ashby and Patla 2024), copied from the files
  of the International Centre for Global Earth Models (ICGEM), https://icgem.gfz-potsdam.de/tom_celestial,
  retrieved 2026-10-02:
  - AIUB-GRL350A, https://icgem.gfz-potsdam.de/getmodel/gfc/0431c2d23ee2ad20c91329da05af67a0711e055ecb5a7f846710413f4c5d9710/AIUB-GRL350A.gfc,
    SHA-256 804db4fd0e524fddc59da2cfd8412702e6658c0534f8bc4fdaff10d8ef0ad1b0;
  - AIUB-GRL350B, https://icgem.gfz-potsdam.de/getmodel/gfc/f17df1b5fe44a1bf945027d159772bf1d0831ff0edf7533ceffcb3ec2836c7e0/AIUB-GRL350B.gfc,
    SHA-256 bc1c082a1db3f773ae97021b61aeb895c0b593d966369d9fd98be8664eade38e.
  The gfc files are not redistributed; only these numbers are quoted with citation. SHA-256 of
  fields.txt 2f3e361c7ab06f6f165fb63bb4b31b98222741bca08d3ed0febeae2b5f0f9375.
- `pyshtools_equatorial.txt`: output of `generate_pyshtools.py` under pyshtools 4.14.1 (BSD-3-Clause,
  https://shtools.github.io/SHTOOLS/, installed from PyPI into a separate environment) with numpy, run on
  the two gfc files: the longitude-mean radial gravity and potential on the equator of the sphere
  r = 1738140 m. SHA-256 d633661f1c0c8fd8d28d649afbf194e7fc07ba67eceec6a8ffd3473f44860862.
- `horizons_moon_velocity.csv`: JPL Horizons API 1.2, DE441 (US Government work, free to use),
  geometric geocentric lunar velocity at 2000 epochs, by `generate_horizons.py` (standard-library
  Python), retrieved 2026-10-02. SHA-256 82902c6373e0a5fab51f71da0e63784cef3d8b47237043dcc2c19fe94846faf2.
- The paper's GM, a_m, omega_m and L_m are read from
  `tests/fixtures/lunar_rate_frame_coupling_oracle/reference.txt`.
- Pre-registered in `tests/lunar_rate_frame_coupling_preregistered.rs` (commit 5590ab21, made before
  the field files, the pyshtools values or the Horizons velocities were fetched or computed).
