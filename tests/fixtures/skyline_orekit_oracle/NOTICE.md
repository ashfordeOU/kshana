# Skyline oracle fixture

- `inputs/` — written by `tests/skyline_orekit_oracle.rs::write_inputs` from the engine's presets
  (Earth-fixed satellite states at four epochs, six sites, six mask tables). AGPL-3.0-only, as the
  rest of the repository.
- `outputs/orekit.csv` — written by `xval/orekit-skyline/OrekitSkyline.java` with Orekit 12.2 and
  Hipparchus 3.1 (Apache-2.0, Maven Central) from the inputs: `TopocentricFrame` azimuth and
  elevation on a WGS-84 `OneAxisEllipsoid`, and `ElevationMask` values. Generated 2026-10-12.
- `outputs/gnss_lib_py_dop.csv` — written by `xval/orekit-skyline/gnss_lib_py_dop.py` with
  gnss_lib_py 1.0.4 (Stanford NAV Lab; the wheel's metadata names the MIT licence) under Python
  3.12: `get_dop` with the DOP matrix on the sets Orekit finds visible. Generated 2026-10-12.

The protocol, tolerances and decision rule were pre-registered in
`xval/orekit-skyline/PREREGISTRATION.md` (commit e4b9d912) before either output existed.
