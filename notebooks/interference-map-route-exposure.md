<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable mirror of notebooks/interference-map-route-exposure.ipynb. Regenerate
the notebook with jupytext:

  jupytext --to notebook notebooks/interference-map-route-exposure.md

Runs on synthetic data only; no network from a clone. tests/python/test_notebooks.py
executes every code cell.
-->

# Kshana — where has GNSS looked degraded, and how much of my route is in it?

An interference map built from aircraft (ADS-B) position reports, then the share of a route
that runs through its degraded cells. **Synthetic data only**: the inputs are generated for the
documentation and are not real observations.

**Read this first.**

- A *degraded* cell means a high share of aircraft reported low navigation accuracy there that
  day. It does **not** identify interference as the cause: other causes exist.
- A cell that is not in the map was not observed by enough aircraft (fewer than 5 distinct ones
  are never published). That is **not** evidence of a clear route.
- The map describes past position reports. It is **not a forecast**.
- The method is **MODELLED**: its thresholds are pre-registered, and it is not validated
  against a ground-truth interference measurement.
- The map is aggregate only: no aircraft or vessel identifier is ever returned.

## Cell 2 — install (code)

```python
# Install the published wheel; fall back to building from source if a wheel is
# unavailable for this Python/platform.
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

## Cell 3 — locate the synthetic inputs (code)

```python
# The synthetic inputs live in the repository. From a clone this reads them in place;
# elsewhere (for example Colab) it fetches the same files from GitHub.
import pathlib, urllib.request

RAW = "https://raw.githubusercontent.com/ashfordeOU/kshana/main/"
_here = pathlib.Path.cwd()
REPO = next((p for p in [_here, *_here.parents] if (p / "scenarios" / "training").is_dir()), None)

def data(rel):
    if REPO is not None:
        return (REPO / rel).read_text()
    with urllib.request.urlopen(RAW + rel) as r:  # needs network; the clone path does not
        return r.read().decode()
```

## Cell 4 — build the map from ADS-B CSV text (code)

```python
import json
import kshana

licence = dict(
    licence="CC0-1.0",
    licence_url="https://creativecommons.org/publicdomain/zero/1.0/",
    attribution="Synthetic data generated for Kshana documentation. Not real observations.",
)
days = kshana.interference_map("adsb", data("examples/interference-map/input/adsb.csv"),
                               "custom", **licence)
day = days[0]
print(day["file_name"], "-", day["cells_published"], "cells published,", day["cells_flagged"], "flagged")
doc = json.loads(day["geojson"])
meta = doc["kshana_interference_map"]
print("schema:", meta["schema"], "| source:", meta["source_kind"], "| date:", meta["date"])
print("notice:", meta["notice"])
assert meta["schema"] == "kshana-interference-map/v1" and day["cells_flagged"] >= 1
```

## Cell 5 — the AIS map keeps its own licence and file (code)

```python
ais = kshana.interference_map("ais", data("examples/interference-map/input/ais.csv"),
                              "custom", land_geojson=data("examples/interference-map/input/land.geojson"),
                              **licence)
print(ais[0]["file_name"], "-", ais[0]["cells_published"], "cells,", ais[0]["cells_flagged"], "flagged")
# ADS-B and AIS maps are never combined: each carries its own licence and describes a
# different surface. Route exposure reports them as separate rows.
```

## Cell 6 — route exposure (code)

```python
route = json.dumps({"type": "LineString", "coordinates": [[-50.0, 30.2], [-47.0, 30.2]]})
report = json.loads(kshana.route_exposure(route, [day["geojson"]]))
row = report["kshana_route_exposure"]["rows"][0]
print(f"route {row['route_km']:.0f} km on {row['date']} ({row['source_kind']}):")
for k in ("share_degraded", "share_not_degraded", "share_unassessed", "share_not_observed"):
    print(f"  {k:20s} {row[k]*100:5.1f} %")
for c in report["kshana_route_exposure"]["caveats"][:3]:
    print("-", c)
assert abs(sum(row[k] for k in row if k.startswith("share_")) - 1.0) < 1e-3
```

## Next

The same functions are in the browser build (`interference_map`, `route_exposure`), the MCP
server (`build_interference_map`, `route_exposure`) and the command line
(`kshana interference-map`, `kshana route-exposure`), which also reads readsb trace archives
and fetches the pinned land polygons with `--allow-network`. Method, formats and the data
licences: `docs/INTERFERENCE-MAP.md`.
