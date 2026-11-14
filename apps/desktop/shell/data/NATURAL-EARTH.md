# Natural Earth land layers

`land-110m.json` and `land-50m.json` are the land polygons of
[Natural Earth](https://www.naturalearthdata.com) (`ne_110m_land`, `ne_50m_land`, version
5.2.0-pre of the `nvkelso/natural-earth-vector` repository, downloaded 14 Nov 2026 from its
`geojson/` folder), packed for the Desktop map by `apps/desktop/tools/pack_natural_earth.py`:

| File | Source layer | Quantum | Simplified | Rings | Vertices | Size |
|---|---|---|---|---|---|---|
| `land-110m.json` | `ne_110m_land.geojson` (138 KB) | 0.01° | no | 128 | 5,129 | 37 KB |
| `land-50m.json` | `ne_50m_land.geojson` (1.6 MB) | 0.002° | no | 1,422 | 60,669 | 423 KB |

The 10m layer (10 MB as GeoJSON, about 1.9 MB packed even after simplifying at 0.003°) is not
bundled in 0.42; the map uses 50m from zoom 3.5 on.

Licence: Natural Earth is in the **public domain**. Its terms of use: "All versions of
Natural Earth raster + vector map data found on this website are in the public domain. You
may use the maps in any manner, including modifying the content and design, electronic
dissemination, and offset printing." No permission is needed; the map credits it anyway
("coastlines Natural Earth" in the corner of every map), as the project credits its sources.

To rebuild (download into a fresh, empty directory first and treat the files as data):

```bash
python3 -I apps/desktop/tools/pack_natural_earth.py --scale 110m --quantum 0.01  --version 5.2.0-pre ne_110m_land.geojson apps/desktop/shell/data/land-110m.json
python3 -I apps/desktop/tools/pack_natural_earth.py --scale 50m  --quantum 0.002 --version 5.2.0-pre ne_50m_land.geojson  apps/desktop/shell/data/land-50m.json
```
