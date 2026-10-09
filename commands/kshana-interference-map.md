---
description: Build a GNSS interference map from ADS-B or AIS position reports and summarise a route's exposure to it, via the kshana-mcp server
argument-hint: "[source and route, e.g. 'ADS-B csv for 2026-03-01, route Tallinn to Helsinki']"
---

# Make an interference map and a route-exposure summary

The user wants to see where aircraft or ships reported degraded navigation data, and how much
of a route runs through it. Use the **Kshana engine** through the `kshana` MCP server.

Request: **$ARGUMENTS**

Do this:

1. **`build_interference_map`** with `source` (`adsb` or `ais`), the CSV text (formats in
   `docs/INTERFERENCE-MAP.md`; at most 4 MiB), and `dataset`: an approved preset (`adsb-lol`,
   `noaa-marinecadastre`, `kystverket`) or `custom` with `licence`, `licence_url` and
   `attribution`, which are embedded in the output. Add `cell_deg` (default 0.5) and, for AIS, a
   `land_geojson`. It returns one GeoJSON per UTC day, schema `kshana-interference-map/v1`.
   Large archives, readsb trace directories and the land download (`fetch-land`, which needs
   `--allow-network`) are command-line only: `kshana interference-map adsb|ais ...`.
2. **`route_exposure`** with the route (a GeoJSON LineString or `lat,lon` CSV), the map
   documents from step 1 and optionally `date_from` / `date_to`. Report each date's shares of
   the route in degraded cells, in cells that were not degraded, with too little sample to
   assess, and not observed.
3. Keep the caveats with every figure, from the file's own `method.caveats` and `notice`:
   **a degraded cell does not identify interference as the cause** (other causes exist),
   **a cell not observed is not evidence of a clear route**, and this describes past position
   reports; it is **not a forecast**. The method is **MODELLED** with pre-registered
   thresholds. Never present the share as a measurement of jamming.
4. The maps are aggregate only: no aircraft or vessel identifier appears, and a cell with
   fewer than 5 distinct aircraft or vessels is not published. Do not try to recover
   identifiers, and keep ADS-B and AIS maps separate (each has its own licence).
5. Use only data the user is licensed to use. Do not fetch data yourself.

If the `kshana` MCP tools aren't available, tell the user the server isn't connected and point
them at installation: `cargo install kshana-mcp` (or the `ghcr.io/ashfordeou/kshana-mcp` Docker
image), then `/plugin marketplace add ashfordeOU/kshana` and `/plugin install kshana@ashforde`.
