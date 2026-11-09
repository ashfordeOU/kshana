# Provenance: C5a optical-navigation kernel cut

- `de440s_2025-01-01_2029-07-02.bsp` (351 232 bytes, SHA-256
  `359d3b9772dc8ba7d07dbb77f87231ec62b272532810794066fdd4d0883b22f1`): segments 10, 3, 301, 399 and 4 of NAIF's
  `de440s.bsp` (https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp, SHA-256
  `c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2`, JPL, public) over 2024-12-31 to 2029-07-02
  TDB, bit for bit, made by `make_kernel_cut.py` (which reuses the cutting and DAF writing of
  `../llr_datum_kernel_moon/make_kernel_cut.py` unchanged). SPICE checked that it gives the full file's barycentric
  Moon, Earth, Mars barycentre and Sun bit for bit at the 12 C5a case epochs.
- `de440s_2025-01-01_2029-10-08.bsp` (372 736 bytes, SHA-256
  `24f7a9ec10b8971806a28bbd1172419e3e258c3a3ea32a29b2b86929cdbd19a7`): the same five segments of the same file over
  2024-12-31 to 2029-10-08 TDB for C5a v2, made by `make_kernel_cut_v2.py` (v1's script with the window and the
  v1 and fresh epochs); SPICE checked it bit for bit at the 24 epochs.
