# Terrain DEM fixtures — provenance

This directory holds the digital-elevation fixtures used by
`tests/terrain_nav_validation.rs`.

## `mini.hgt` (synthetic)
A tiny 11×11 hand-built `.hgt` grid used to unit-test the SRTM parser's byte layout
(big-endian, north-row-first) and the bilinear sampler with exactly known values. Not real
terrain.

## `N36W117_sub6.hgt` (real, public domain)
A **real NASA/USGS SRTM v3 elevation tile** for the 1°×1° cell whose lower-left corner is
36°N, 117°W — the Death Valley region of California, including Badwater Basin, the lowest
point in North America (36.250°N, 116.825°W; surveyed ≈ −86 m / −282 ft).

- **Source:** NASA Shuttle Radar Topography Mission (SRTM) v3, 1-arc-second (SRTMGL1),
  tile `N36W117`, retrieved from the **AWS Open Data `elevation-tiles-prod` (Skadi) mirror**
  (`s3.amazonaws.com/elevation-tiles-prod/skadi/N36/N36W117.hgt.gz`). In this latitude band
  the elevation-tiles source is NASA SRTM (the mirror blends in other models only above
  60° latitude), so the data here is SRTM.
- **Processing:** decimated to **6-arc-second** by keeping every 6th of the 3601×3601
  1-arc-second samples → a 601×601 full-1° grid (step = 1/600°). The decimated nodes are
  verbatim SRTM elevation values; the file is the standard SRTM `.hgt` format (16-bit signed
  big-endian, row 0 = northernmost). This keeps the committed fixture to ~720 KB while
  validating the reader against real terrain offline.
- **Why decimated rather than the full tile:** the native 1-arc-second tile is ≈ 26 MB;
  decimation to 6-arc-second preserves real relief and the documented benchmark while fitting
  comfortably in git.

## Licence
SRTM elevation data is produced by NASA/USGS and is in the **public domain** (U.S.
Government work; NASA/USGS EOSDIS data policy — free, open, no restriction on use or
redistribution). Retrieved via the AWS Open Data Program `elevation-tiles-prod` mirror.

Cited, not endorsed. Kshana is not affiliated with NASA, USGS, or the mirror operators.

## `N36W119_whitney_crop1s.hgt` and `N36W117_badwater_crop1s.hgt` (real, public domain)
Two **full-resolution** (1-arc-second) windows of NASA/USGS SRTM v3 (SRTMGL1) tiles, cut so
the real-terrain tests that used to need a 25 MB tile run in CI (pre-registered in
`xval/srtm-ungate/PREREGISTRATION.md`).

- **Source:** the same AWS Open Data `elevation-tiles-prod` (Skadi) mirror,
  `s3.amazonaws.com/elevation-tiles-prod/skadi/N36/N36W119.hgt.gz` (unzipped tile sha256
  `0f55d40d89d997178bdbc99dd4d31c9d526d0690fc0bba30696ec22e7d5872b4`) and
  `.../N36W117.hgt.gz` (unzipped tile sha256
  `639c00935467913fe21212b1ceeada4ee48a4dc6d35da168c5c3586cfa51f36a`).
- **Crop (the only transform):** a 361 x 361-sample window copied verbatim (16-bit signed
  big-endian, north row first, no resampling), step 1/3600 deg.
  - Whitney: file rows 1337..1697, columns 2368..2728 of N36W119; south-west node
    36 + 1903/3600 N, -119 + 2368/3600 E (around the Mount Whitney summit).
    sha256 `d26c5393c21855aab4d9558e1642d49df42be5116ba29577770df4b0054e5b05`.
  - Badwater: file rows 2520..2880, columns 450..810 of N36W117; south-west node
    36.2 N, -116.875 E (centred on Badwater Basin).
    sha256 `69c2599a4add14633bedddb0f826b48b26c7f495ed979143edfd7ed8c413ac20`.
- **Licence:** public domain, as above.
