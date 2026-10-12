# Pre-registration: independent numpy ray-cast of the lunar terrain horizon

Committed alone, before the numpy script exists or has run. It checks the arithmetic of
`kshana::lunar_terrain::horizon_profile` on the real vendored DEM crop
(`data/lunar-dem/lola_ldem_75s_1200m_crop.img`, SHA-256
`639eb45c21e3df38cffbcf8048da4f3a92aa150b9aea534e10712be0dad4edab`), not the model: the row
stays MODELLED whatever the outcome.

## The independent re-computation

`scripts/gen_lunar_terrain_ref.py`, numpy only, no Kshana code. From the documented layout alone
(`data/lunar-dem/NOTICE.md` and `data/lunar-dem/lola_ldem_75s_1200m_crop.toml`):

* read the image as little-endian int16, height = DN x 0.5 m;
* project a selenographic direction with the published south polar stereographic equations,
  `rho = 2 R tan((90 + lat) / 2)`, `x = rho sin(lon)`, `y = rho cos(lon)`, written in
  latitude and longitude (Kshana projects the Cartesian unit vector);
* sample = x / 1200 + 349.5, line = 349.5 - y / 1200, bilinear between the four pixel centres;
* site basis: up radial, east = unit(z x up), north = up x east (the documented convention);
* ray: direction cos(a) north + sin(a) east, points at arc length k 600 m, k = 1 .. 250, on the
  sphere R = 1737400 m at height h, elevation from the observer 2 m above the site's height;
  stop at the first point outside the grid.

## Cases (fixed now)

Antenna 2 m, azimuth step 1 deg (360 azimuths), range step 600 m, maximum 150 km, at the five
sites (lat, lon) in degrees: (-89.0, 0.0), (-88.0, 90.0), (-86.0, 180.0), (-84.0, 270.0),
(-89.66, 129.2).

## Bars (fixed now)

* B1: the terrain height at each site agrees to 1e-6 m.
* B2: every one of the 1800 horizon elevations agrees to 1e-6 deg.
* B3: the number of rays leaving the grid agrees exactly at every site.

A miss is recorded here with its numbers, not tuned away.
