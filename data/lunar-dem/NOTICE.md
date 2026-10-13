# Lunar south-polar DEM crop: provenance

`lola_ldem_75s_1200m_crop.img` is a crop of a **real** lunar digital elevation model, resampled
to a coarser grid. `lola_ldem_75s_1200m_crop.toml` describes it for the loader
(`kshana::lunar_terrain::PolarDem::load`), which checks the image's size and SHA-256 before
reading it. It is used by the terrain horizon masks of the `lunar-station-coverage` and
`moonlight-service-volume` kinds and by `scenarios/lunar-station-coverage-terrain.toml`.

## Source

- Product: LRO LOLA gridded polar shape map (radius) `LDEM_75S_240M.IMG`, data set
  `LRO-L-LOLA-4-GDR-V1.0`, product version V2.0, created 2017-06-15 (LOLA data
  2009-07-13 to 2017-02-02), from the NASA Planetary Data System Geosciences Node.
- URL: <https://pds-geosciences.wustl.edu/lro/lro-l-lola-3-rdr-v1/lrolol_1xxx/data/lola_gdr/polar/img/ldem_75s_240m.img>
  (label: the same path with `.lbl`; projection description:
  <https://pds-geosciences.wustl.edu/lro/lro-l-lola-3-rdr-v1/lrolol_1xxx/catalog/dsmap_polar.cat>).
- Retrieved: 2026-10-12.
- SHA-256 of `ldem_75s_240m.img` (29,062,688 bytes):
  `d031efe2611b17dfbf3c158f5e15dc04cd5719349dcbf6384bb21fd97697c490`.
- SHA-256 of `ldem_75s_240m.lbl`:
  `ec07239f41d8abc1a3681495b5799b770c7206b5268b76721d69180df0422e02`.
- Layout (from the label): 3812 x 3812 little-endian int16; height = DN x 0.5 m above the
  1737.4 km reference sphere; polar stereographic (spherical, radius 1737.4 km), true at the
  pole, 240 m/pixel, centre latitude -90, longitude 0 up and 90 E to the right; frame "MEAN
  EARTH/POLAR AXIS OF DE421".

## Crop and resample

Done by `scripts/make_lola_south_polar_crop.py` (numpy), which checks the source SHA-256 first:

1. crop the central 3500 x 3500 pixels (0-based lines and samples 156 to 3655), keeping the
   pole at the centre of the crop, at a pixel corner as in the source;
2. take the mean of each 5 x 5 block of DN (an exact integer factor), rounded half to even to
   an integer DN: 700 x 700 pixels at 1200 m/pixel, covering about +-420 km from the pole
   (to about 76.2 S at the edges);
3. write little-endian int16, line 0 first, the source's orientation unchanged.

No value is edited, filled or invented. Result: 980,000 bytes, SHA-256
`639eb45c21e3df38cffbcf8048da4f3a92aa150b9aea534e10712be0dad4edab`, DN -15402 to 13931
(-7701 m to +6965.5 m). Pixel centres are at `x = (sample - 349.5) * 1200 m`,
`y = (349.5 - line) * 1200 m`.

What the resampling costs: relief smaller than about 1.2 km is smoothed away and block means
lower sharp peaks and raise narrow pits, so horizons from this crop are smoother than those from
the 240 m or finer products. The crop ends about 420 km from the pole; a horizon ray that leaves
it ends there.

Orientation was checked on the source grid before cropping: the deep depressions of Shackleton,
Haworth, Shoemaker, Faustini and Cabeus craters and the Malapert massif (+4.8 km) appear at
their published coordinates under the convention above and not under its mirror.

## Licence

LOLA data are produced by NASA and are in the **public domain** (U.S. Government work; NASA
data policy: free and open, no restriction on use or redistribution), distributed by the
NASA PDS Geosciences Node.
