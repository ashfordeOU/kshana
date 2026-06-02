# SGP4 verification vectors

These two files are the canonical SGP4/SDP4 verification set distributed with
the reference implementation in:

> Vallado, D. A., Crawford, P., Hujsak, R., Kelso, T. S.,
> *"Revisiting Spacetrack Report #3"*, AIAA 2006-6753, AIAA/AAS Astrodynamics
> Specialist Conference, Keystone, CO, 2006.

- `SGP4-VER.TLE` — the input two-line element sets. Each case is a normal TLE
  (line 1 + line 2) with three extra numbers appended to line 2: the start,
  stop, and step of the propagation in **minutes from epoch**. Lines beginning
  with `#` are comments describing what each case exercises (near-Earth drag,
  12 h / 24 h resonance, Lyddane choice, deliberate error codes, etc.).
- `tcppver.out` — the expected output. Each case is a `<satnum> xx` header
  followed by rows of `tsince  x y z  ẋ ẏ ż` (TEME position in km, velocity in
  km/s), optionally trailed by derived orbital elements. The reference uses the
  **WGS-72** gravity model.

The data are U.S.-government-origin (Spacetrack Report #3 lineage) and are in
the public domain; they are vendored here solely so Kshana's SGP4 propagator can
be validated against the published reference, byte-for-byte, in CI. See
`tests/sgp4_verification.rs`.
