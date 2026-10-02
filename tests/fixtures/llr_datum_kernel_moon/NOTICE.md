# Provenance: LLR datum kernel-Moon diagnostic

Fixture of `tests/validate_llr_datum_kernel_moon.rs`, cut on 2026-10-02 by
`make_kernel_cut.py` after the diagnostic was pre-registered (commit c51f8b2).

- `de440s_2015-04-06_2015-06-30.bsp` (20 480 bytes, SHA-256
  `bf1efa316511b944e33d0be609c8cda43a8dbafa45496c31ad2727cebb6bf4b8`): the type-2 Chebyshev
  records of segments 3 (Earth-Moon barycentre wrt the solar-system barycentre), 301 (Moon wrt 3)
  and 399 (Earth wrt 3) covering 2015-04-06 to 2015-06-30 UTC, copied bit for bit from NAIF's
  `de440s.bsp`. United States government work (NASA Jet Propulsion Laboratory), public.
- **Source:** `https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp`,
  retrieved 2026-10-02, SHA-256
  `c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2`.
- **Checks the generator ran (CSPICE N0067 through spiceypy 8.2.0, MIT licence):** the cut
  reproduces `de440s.bsp` bit for bit (Moon wrt Earth and Earth wrt barycentre, 4078 epochs at
  30-minute steps); and `de440s.bsp` and `de440.bsp` (retrieved 2026-10-02, SHA-256
  `a4ce9bf9b3282becc9f4b2ac3cebe03a2ae7599981aabd7265fd8482fff7c4b5`, the file the SPICE oracle
  in `tests/fixtures/llr_datum_spice/` read) give identical Moon-relative-to-Earth positions at
  every one of those epochs (largest difference 0 m).
- **Reproduce:** with the NAIF files in `$KSHANA_NAIF_DIR`,
  `python tests/fixtures/llr_datum_kernel_moon/make_kernel_cut.py` (deterministic).
- The oracle values this diagnostic compares against are the unchanged
  `tests/fixtures/llr_datum_spice/reference.txt`.
