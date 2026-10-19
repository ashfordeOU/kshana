<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable source of 01-jamming.ipynb. Regenerate the notebook with
jupytext:

  jupytext --to notebook notebooks/course/01-jamming.md

Runs on the repository's scenarios and synthetic examples; no network from a clone.
tests/python/test_notebooks.py executes every code cell.
-->

# Kshana course — jamming: how far away does a jammer still hurt?

A ground jammer's received power falls with distance, and a GNSS receiver loses lock when the jammer-to-signal ratio (J/S) is high enough. This notebook moves the same 10 W broadband jammer away from a receiver and watches availability come back.

> **Advisory.** Kshana is a research and engineering tool. Everything here is analysis output on
> modelled or synthetic data: it is not type-approved navigation equipment, not a safety-of-life
> service, and not a finding about any receiver, product or standard. Evidence tier: **MODELLED**
> unless a step says otherwise.

**What you will learn**

- read a `jamming` result: availability under jamming, mean J/S, satellites still tracked
- see that free-space J/S falls 20 dB per decade of range
- see why a modelled denial at 1 km says nothing about a real receiver's front end

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

## Cell 3 — run the bundled 1 km case (code)

The scenario `scenarios/jamming-demo.toml` puts a 10 W broadband jammer 1 km from a receiver at 52 N, 4 E under a 24-satellite GPS-like shell.

```python
import json
toml_1km = data("scenarios/jamming-demo.toml")
r = kshana.run_typed(toml_1km)
print(r.summary)
fom = r.data()["fom"]
print({k: round(v, 3) for k, v in fom.items()})
assert fom["availability_under_jamming"] < fom["availability_nominal"]
```

## Cell 4 — move the jammer away (code)

The jammer's position is an Earth-fixed vector; scaling the offset from the receiver changes the range and nothing else. The helper below rebuilds the TOML with the jammer at a stated range along the same direction.

```python
import math, re

A, F = 6378137.0, 1 / 298.257223563
E2 = F * (2 - F)

def receiver_ecef(lat_deg, lon_deg, alt_m=0.0):
    lat, lon = math.radians(lat_deg), math.radians(lon_deg)
    n = A / math.sqrt(1 - E2 * math.sin(lat) ** 2)
    return [(n + alt_m) * math.cos(lat) * math.cos(lon),
            (n + alt_m) * math.cos(lat) * math.sin(lon),
            (n * (1 - E2) + alt_m) * math.sin(lat)]

rx = receiver_ecef(52.0, 4.0)
m = re.search(r"position_ecef_m = \[([^\]]+)\]", toml_1km)
jam = [float(x) for x in m.group(1).split(",")]
u = [(jam[i] - rx[i]) / math.dist(jam, rx) for i in range(3)]

def at_range(km):
    p = [rx[i] + km * 1000.0 * u[i] for i in range(3)]
    return toml_1km.replace(m.group(0), "position_ecef_m = [%.3f, %.3f, %.3f]" % tuple(p))

rows = []
for km in (1, 3, 10, 30, 100, 300):
    d = kshana.run_typed(at_range(km)).data()["fom"]
    rows.append((km, d["mean_js_db"], d["availability_under_jamming"], d["min_tracking"]))
    print(f"{km:>4} km  mean J/S {d['mean_js_db']:6.1f} dB  availability {d['availability_under_jamming']:.2f}  min tracked {d['min_tracking']}")
```

## Cell 5 — the 20 dB per decade rule (code)

In free space the received power falls with the square of the range, so each tenfold increase in range lowers J/S by 20 dB. The check uses the 1, 10 and 100 km runs above.

```python
js = {km: j for km, j, _, _ in rows}
print("1 km -> 10 km:", round(js[1] - js[10], 2), "dB;  10 km -> 100 km:", round(js[10] - js[100], 2), "dB")
assert abs((js[1] - js[10]) - 20.0) < 0.5 and abs((js[10] - js[100]) - 20.0) < 0.5
avail = {km: a for km, _, a, _ in rows}
assert avail[1] < 0.05 and avail[300] > 0.95   # denied close in, clear far out
```

## Exercises

1. Halve the jammer power (`power_dbw`) and find the range at which availability first reaches 0.5. How does it move?
2. The scenario's tracking threshold is 25 dB-Hz (`tracking_threshold_dbhz`). Lower it to 20 and rerun the 10 km case. What does that say about a receiver with a better front end?
3. Replace the broadband jammer with a narrower one (`bandwidth_mhz`, `jammer_type`) and compare the effective C/N0. Why does the spectral-separation factor matter?

## Next

The same model is the `jamming` kind on the command line (`kshana scenarios/jamming-demo.toml`), in the browser build and in the MCP server. The ICAO and DHS standards packs run this case against stated bars (`kshana standards-pack run icao-doc9849-appf`). Method and limits: `docs/SCENARIOS.md` and `docs/SPECTRUM.md`.
