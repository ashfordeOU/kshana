---
name: interference-map-route-exposure
description: Build a public GNSS interference map from ADS-B (aircraft) or AIS (ship) position reports and summarise how much of a route passes through degraded cells, using the Kshana engine. Use when the user asks where GNSS has been degraded, for a route's exposure, or for the kshana-interference-map/v1 GeoJSON.
---

# Interference map and route exposure

Use the `kshana` MCP server's `build_interference_map` then `route_exposure`. See
`/kshana-interference-map` for the step list; formats are in `docs/INTERFERENCE-MAP.md`.

Rules that apply every time:

- A degraded cell does **not** identify interference as the cause. A cell not observed is **not**
  evidence of a clear route. The result describes past reports and is **not a forecast**. Show
  the file's own `method.caveats` and `notice` with every figure. The method is **MODELLED**
  (pre-registered thresholds, not validated against a ground-truth interference measurement).
- Aggregate only: no identifier is returned and cells below 5 distinct aircraft or vessels are
  withheld. ADS-B and AIS maps stay separate; each carries its own licence and attribution, and
  `custom` datasets must state theirs.
- Only data the user is licensed to use; never fetch it yourself. Land download, readsb trace
  directories and large archives are command-line only.
- Inputs are capped at 4 MiB per item, the reply at 4 MiB; use a coarser `cell_deg` or the
  command line beyond that.
