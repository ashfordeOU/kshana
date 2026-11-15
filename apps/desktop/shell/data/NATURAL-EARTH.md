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

## Offline region packs (0.42 U24)

`packs/baltic-10m.mappack.json` is the 1:10m land of the Baltic Sea (box 9° E to 31° E, 53° N
to 66° N; 572 rings, 14,403 vertices, 92 KB), from `ne_10m_land.geojson` of the
`nvkelso/natural-earth-vector` repository at tag `v5.1.2` (downloaded 15 Nov 2026), clipped to
the box and simplified at 0.002° by the same script:

```bash
python3 -I apps/desktop/tools/pack_natural_earth.py --scale 10m --quantum 0.001 --tolerance 0.002 --version 5.1.2 \
    --region 9,53,31,66 --name "Baltic Sea" ne_10m_land.geojson apps/desktop/shell/data/packs/baltic-10m.mappack.json
```

A pack is `{format: "kshana-mappack/1", name, bbox: [west, south, east, north], source, licence,
land: <a kshana-land/1 layer>}`. Public domain, like the layers above.
