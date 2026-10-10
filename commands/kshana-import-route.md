---
description: Write a GeoJSON route into a track-flying Kshana scenario (terrain-nav, terrain-slam, gravity-map, combined-altpnt) and return the new scenario via the kshana-mcp server
argument-hint: "[the route and the scenario, e.g. 'fly this GeoJSON line in the terrain-nav example']"
---

# Import a route into a scenario

The track kinds `terrain-nav`, `terrain-slam`, `gravity-map` and `combined-altpnt` fly a
straight waypoint track defined by a start position, a step and a count. `import_route` writes
a GeoJSON route into that definition. Use the `kshana` MCP server.

Request: **$ARGUMENTS**

1. Have a scenario of one of those kinds. `get_example_scenario` (for example `terrain-nav`)
   returns a runnable one.
2. The route is GeoJSON text: a `LineString`, or a `Feature` or `FeatureCollection` holding one,
   of `[longitude, latitude]` positions. Give the two ends of the track, or evenly spaced
   positions along a straight line: the track kinds fly start + i x step, so any other shape is
   refused. Say so if it is refused, and offer to simplify the route.
3. Call `import_route` with `toml` and `geojson`. The reply is the new scenario TOML; it
   replaces `start_lat_deg`, `start_lon_deg`, `step_lat_deg`, `step_lon_deg` and `waypoints`.
4. Offer to run it with `run_scenario` (or `/kshana-run`). Content is inline, capped at 4 MiB;
   nothing is read from or written to disk.
