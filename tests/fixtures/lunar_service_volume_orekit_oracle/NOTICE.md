# lunar_service_volume_orekit_oracle: provenance

* `orekit_lncss.csv` (SHA-256 6ff41f402bcd9e98990323e43fa57fd0006bffaff88382e8c6c1f8420ed7c136): computed 2026-10-02 by Orekit 12.2 with Hipparchus 3.1 (Apache-2.0),
  `xval/orekit-lunar-service/LunarServiceVolumeOracle.java` (no Kshana code), from the committed
  LNCSS element files `tests/fixtures/lunar_ephemeris/lncss_case_{a,b,c}_navi613.csv` and the
  Orekit data set at `$OREKIT_DATA` (JPL DE440 `lnxp1990.440`). Regenerate with the commands in
  `xval/orekit-lunar-service/README.md`.
* `de440s_2025-11-09_15d.bsp` (SHA-256
  36f0ec62e60f9396bd5f837d916a5f37189e7367abea7b38d9acce3c380a2aed, 9 216 bytes): the
  records of segments 3/0, 301/3, 399/3 and 10/0 covering 2025-11-08..2025-11-25 UTC, copied
  bit for bit from NAIF `de440s.bsp`
  (https://naif.jpl.nasa.gov/pub/naif/generic_kernels/spk/planets/de440s.bsp, SHA-256
  c1c7feeab882263fc493a9d5a5b2ddd71b54826cdf65d8d17a76126b260a49f2, retrieved 2026-09-30) by
  `make_kernel_subset.py`, which checks with SPICE (CSPICE N0067, spiceypy 8.2.0) that every
  state over the window is identical between the full and the cut kernel.

Licence: NAIF/JPL ephemeris data are public NASA/JPL data; the Orekit output is a numerical
result of an Apache-2.0 tool.
