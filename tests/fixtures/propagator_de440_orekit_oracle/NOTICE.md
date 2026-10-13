# propagator_de440_orekit_oracle fixture

Used only by `tests/propagator_de440_orekit_oracle.rs`; not shipped in any published package.

- `de440s_2024-03-18_2024-03-23.bsp` (6144 bytes, SHA-256
  e9c2a7a758c21f30fa3c27fd8a453f0f962699e1e81efb9a0537b252bc15d72d): the type-2 Chebyshev records of
  segments 3 (Earth-Moon barycentre wrt the solar-system barycentre), 301 (Moon wrt 3), 399 (Earth
  wrt 3) and 10 (Sun wrt the solar-system barycentre) covering 2024-03-18 to 2024-03-23 UTC, copied
  bit for bit from NAIF's `de440s.bsp` by `make_kernel_cut.py`, which checked with SPICE (spiceypy
  8.2.0, MIT) that the cut reproduces the full file's Moon and Sun states relative to the Earth bit
  for bit at 719 epochs (10-minute steps). Source:
  https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp, retrieved 2026-10-13,
  SHA-256 c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2; leap seconds from NAIF
  naif0012.tls (SHA-256 678e32bdb5a744117a467cd9601cd6b373f0e9bc9bbde1371d5eee39600a039b). United
  States government work (NASA Jet Propulsion Laboratory), public.
- `propagator_de440_orekit_oracle.txt` (SHA-256 5c9e9bedd7935b7beace6f46d4be462686d5b6bf25baddf4c0ef0f2934837227):
  Orekit reference states and its Sun/Moon GCRF positions; generator
  `generate_propagator_de440_orekit_oracle.py`, driver `java/De440Driver.java` (reproduce
  commands in the generator docstring). Tool output on synthetic initial states; no part of the
  tool is included.

| Oracle | Version | Licence | Source |
|---|---|---|---|
| Orekit NumericalPropagator, DormandPrince853, ThirdBodyAttraction, SolarRadiationPressure, JPL ephemerides reader | 12.2 (Maven Central, SHA-1 verified) | Apache-2.0 | https://www.orekit.org |
| Hipparchus | 3.1 | Apache-2.0 | https://hipparchus.org |
| orekit-data `DE-440-ephemerides/lnxp1990.440` | main-branch archive, SHA-256 00a3863ec1ee692d4779a3ba3ad10fca5c90871f5a9c6a5ba4752b8ad8a5df08 | JPL DE440, public | https://gitlab.orekit.org/orekit/orekit-data |

Generated 2026-10-13 with OpenJDK 21.0.12. Tolerances: `xval/propagator-de440-orekit/PREREGISTRATION.md`.
