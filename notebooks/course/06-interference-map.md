<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable source of 06-interference-map.ipynb. Regenerate the notebook with
jupytext:

  jupytext --to notebook notebooks/course/06-interference-map.md

Runs on the repository's scenarios and synthetic examples; no network from a clone.
tests/python/test_notebooks.py executes every code cell.
-->

# Kshana course — interference map: where did navigation look degraded?

Aircraft broadcast the accuracy of their own navigation data (ADS-B). Where many aircraft report poor accuracy on one day, a map cell is marked degraded. This notebook builds a map from synthetic reports, reads what the map does and does not say, and measures how much of a route lies inside it.

> **Advisory.** Kshana is a research and engineering tool. Everything here is analysis output on
> modelled or synthetic data: it is not type-approved navigation equipment, not a safety-of-life
> service, and not a finding about any receiver, product or standard. Evidence tier: **MODELLED**
> unless a step says otherwise.

**What you will learn**

- build an aggregate interference map from ADS-B CSV text
- see the privacy floor: cells seen by fewer than five aircraft are never published
- read a route's exposure and the caveats that come with it

## Cell 1 — install (code)

```python
# Install the published wheel; fall back to building from source if a wheel is
# unavailable for this Python/platform. (Jupyter or Colab. A browser-only Pyodide runtime has no
# kshana wheel in 0.38; in the browser use the WebAssembly build or Kshana Studio instead.)
try:
    import kshana  # noqa: F401
except ImportError:
    import subprocess, sys
    rc = subprocess.run([sys.executable, "-m", "pip", "install", "kshana"]).returncode
    if rc != 0:
        subprocess.run([sys.executable, "-m", "pip", "install", "maturin"], check=True)
        subprocess.run([sys.executable, "-m", "pip", "install",
                        "git+https://github.com/ashfordeOU/kshana"], check=True)
    import kshana  # noqa: F401
```

## Cell 2 — locate the inputs (code)

```python
# The scenarios and examples live in the repository. From a clone this reads them in place;
# elsewhere (for example Colab) it fetches the same files from GitHub.
import pathlib, urllib.request

RAW = "https://raw.githubusercontent.com/ashfordeOU/kshana/main/"
_here = pathlib.Path.cwd()
REPO = next((p for p in [_here, *_here.parents] if (p / "scenarios").is_dir()), None)

def data(rel):
    if REPO is not None:
        return (REPO / rel).read_text()
    with urllib.request.urlopen(RAW + rel) as r:  # needs network; the clone path does not
        return r.read().decode()
```

## Cell 3 — build the map (code)

Synthetic reports only, generated for the documentation. The licence fields travel with the map.

```python
import json
licence = dict(
    licence="CC0-1.0",
    licence_url="https://creativecommons.org/publicdomain/zero/1.0/",
    attribution="Synthetic data generated for Kshana documentation. Not real observations.",
)
days = kshana.interference_map("adsb", data("examples/interference-map/input/adsb.csv"), "custom", **licence)
day = days[0]
print(day["file_name"], "-", day["cells_published"], "cells published,", day["cells_flagged"], "flagged")
doc = json.loads(day["geojson"])
meta = doc["kshana_interference_map"]
print("notice:", meta["notice"])
assert meta["schema"] == "kshana-interference-map/v1" and day["cells_flagged"] >= 1
```

## Cell 4 — what a cell can and cannot say (code)

A flagged cell means a high share of aircraft reported low accuracy there that day. It does not name interference as the cause, and a cell that is absent was not observed enough, which is not evidence of a clear route.

```python
feats = doc["features"]
print(len(feats), "cells in the file")
props = [f["properties"] for f in feats]
print(sorted(props[0]))
assert all(p["aircraft_observed"] >= 5 for p in props)   # the publication floor: fewer are never published
print("any identifier in the file?", any("icao" in json.dumps(p).lower() for p in props))
```

## Cell 5 — route exposure (code)

The share of a route's length through degraded, clear, unassessed and unobserved cells; the four shares sum to one.

```python
route = json.dumps({"type": "LineString", "coordinates": [[-50.0, 30.2], [-47.0, 30.2]]})
report = json.loads(kshana.route_exposure(route, [day["geojson"]]))["kshana_route_exposure"]
row = report["rows"][0]
print(f"route {row['route_km']:.0f} km on {row['date']}:")
for k in ("share_degraded", "share_not_degraded", "share_unassessed", "share_not_observed"):
    print(f"  {k:20s} {row[k]*100:5.1f} %")
for c in report["caveats"][:3]:
    print("-", c)
assert abs(sum(row[k] for k in row if k.startswith("share_")) - 1.0) < 1e-3
```

## Exercises

1. Move the route north by one degree and compare the four shares. Which share grows when you leave the observed area?
2. Why are ADS-B and AIS maps kept separate (`kshana.interference_map('ais', ...)`) rather than combined into one?
3. Write three sentences a harbour master could safely say from this map, and three they could not.

## Next

The same functions are in the browser build, the MCP server and the command line (`kshana interference-map`, `kshana route-exposure`). `docs/INTERFERENCE-MAP.md` gives the method, the pre-registered thresholds and the data licences. The method is MODELLED and the map is a view of past reports, not a forecast.
