# Provenance: de440s cut for the opt-in De440LunarEnvironment LRO test

`de440s_2021-12-31_2022-01-02.bsp` (5 120 bytes, SHA-256
`1f62a97afd64d646cdc399f4a4894213562cefeee0db6d696a01197bc2ae75e1`): the type-2 records of
segments 10 (Sun wrt the solar-system barycentre), 3, 301 and 399 of NAIF's `de440s.bsp`
(https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp, SHA-256
`c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2`, JPL, public United States
government work) over 2021-12-31..2022-01-02 UTC, bit for bit. Made on 2026-10-13 by
`make_kernel_cut.py`, which reuses the cutting and DAF writing of
`../llr_datum_kernel_moon/make_kernel_cut.py` unchanged; it checked with SPICE (CSPICE N0067
through spiceypy 8.3.0) that the cut reproduces the full file's geocentric Sun and Moon bit for
bit at 95 epochs. Used only by `tests/agency_lro.rs::lro_fit_with_the_opt_in_de440_environment`
(information only).
