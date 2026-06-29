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
