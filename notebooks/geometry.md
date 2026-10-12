<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable mirror of notebooks/geometry.ipynb. Regenerate the
notebook with jupytext:

  jupytext --to notebook notebooks/geometry.md

Runs on engine presets and on element sets kept in the repository; no network from a clone.
tests/python/test_notebooks.py executes every code cell.
-->

# Kshana — sky geometry under a skyline

Which satellites a receiver at the bottom of a street, on a quay or in a fjord can see, and
what that does to its dilution of precision (DOP) and its horizontal error ellipse. Five engine
functions: `skyline_presets`, `skyline_profile`, `sky_geometry`, `sky_monte_carlo` and
`skyplot_svg` (`docs/SKYLINE.md`). Evidence tier: **MODELLED**: line-of-sight geometry under a
stated error model (independent, equal, zero-mean Gaussian range errors), not a prediction of a
receiver's real error and not an integrity bound. The skyline presets are REPRESENTATIVE, with
their provenance stated, not surveys of real places.

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

# The element sets live in the repository. From a clone this reads them in place; elsewhere
# (for example Colab) it fetches the same files from GitHub.
import pathlib, urllib.request

RAW = "https://raw.githubusercontent.com/ashfordeOU/kshana/main/"
_here = pathlib.Path.cwd()
REPO = next((p for p in [_here, *_here.parents]
             if (p / "tests" / "fixtures" / "celestrak").is_dir()), None)

def data(rel):
    if REPO is not None:
        return (REPO / rel).read_text()
    with urllib.request.urlopen(RAW + rel) as r:  # needs network; the clone path does not
        return r.read().decode()
```

## The presets

Each preset is a skyline with stated dimensions and provenance. `open_fraction` is the share of
the upper hemisphere's solid angle above the skyline: 1 for open sky.

```python
for p in kshana.skyline_presets():
    print(f"{p['name']:20s} open fraction {p['open_fraction']:.3f}  {p['label']}")

street = kshana.skyline_profile({"preset": "city-street"})
print("\ncity-street cut at 0, 45, 90, 135 deg azimuth:",
      [round(street["table"][a], 1) for a in (0, 45, 90, 135)])
print(street["provenance"])
assert len(street["table"]) == 360
```

## Open sky, a container terminal and a street

The same site and time, four constellation presets, under three skylines. With one receiver
clock per system each system in view costs a state, so a narrow strip of sky can leave too few
satellites for a fix; with one clock in common it can still solve.

```python
SITE = {"lat_deg": 52.0, "lon_deg": 5.0, "height_m": 45.0}
BASE = {"site": SITE, "time_s": 3600,
        "systems": ["gps-baseline", "galileo", "beidou-meo", "glonass"]}

def summary(g):
    d, e = g["dop"], g["ellipse"]
    fix = (f"PDOP {d['pdop']:5.2f} HDOP {d['hdop']:5.2f} VDOP {d['vdop']:5.2f}  "
           f"95 % ellipse {e['semi_major_m']:.2f} x {e['semi_minor_m']:.2f} m "
           f"at {e['orientation_deg']:.0f} deg") if d else "no fix (fewer satellites than states)"
    return f"{g['n_visible']:2d} in view, {g['n_masked']:2d} hidden  {fix}"

rows = {}
for sky in (None, "container-terminal", "city-street"):
    for clock in ("per-system", "common"):
        req = dict(BASE, clock=clock)
        if sky:
            req["skyline"] = {"preset": sky}
        g = kshana.sky_geometry(req)
        rows[(sky, clock)] = g
        print(f"{sky or 'open sky':19s} {clock:10s} {summary(g)}")

assert rows[(None, "common")]["n_masked"] == 0
assert rows[("city-street", "common")]["n_visible"] < rows[(None, "common")]["n_visible"]
print("\n" + rows[(None, "common")]["statement"])
print(rows[(None, "common")]["advisory"])
```

In the street the walls hide everything low across it, so the satellites left lie along the
street and overhead: the ellipse's major axis turns across the street (azimuth near 90 deg for
this north-south street), where the geometry has least leverage.

## A dated sky from element sets

`tle` takes two-line element sets and `epoch` the UTC instant to propagate them to with the
engine's SGP4. The result says what sky it is: the one those element sets give at that epoch,
not a measurement of it. Without an `epoch` the sky is representative again.

```python
gps = data("tests/fixtures/celestrak/gps-ops_2026-06-07.txt")
dated = {"site": SITE, "tle": gps, "tle_system": "GPS", "epoch": "2026-06-07T12:00:00Z"}

for sky in (None, "container-terminal"):
    req = dict(dated, skyline={"preset": sky}) if sky else dated
    g = kshana.sky_geometry(req)
    print(f"{sky or 'open sky':19s} {summary(g)}")
print(g["sky_source"], g["epoch_utc"])
print(g["sky_statement"])
assert g["sky_source"] == "tle-at-epoch"

undated = kshana.sky_geometry({"site": SITE, "tle": gps, "tle_system": "GPS"})
print("\n" + undated["sky_statement"])
assert undated["sky_source"] == "tle-at-element-epoch"
```

## Monte Carlo against the covariance

`sky_monte_carlo` draws seeded Gaussian range errors on the visible set and solves each by least
squares. The empirical RMS should match `σ_UERE × HDOP` and `σ_UERE × PDOP`, and about 95 % of
the samples should fall inside the 95 % ellipse; the same seed gives the same cloud.

```python
terminal = dict(BASE, skyline={"preset": "container-terminal"}, sigma_uere_m=1.5)
mc = kshana.sky_monte_carlo(terminal, seed=36, n=2000)
print(f"horizontal RMS {mc['rms_horizontal_m']:.3f} m, predicted {mc['predicted_rms_horizontal_m']:.3f} m")
print(f"3-D RMS        {mc['rms_3d_m']:.3f} m, predicted {mc['predicted_rms_3d_m']:.3f} m")
print(f"inside the 95 % ellipse: {mc['fraction_inside_95']:.3f}")
assert abs(mc["rms_horizontal_m"] / mc["predicted_rms_horizontal_m"] - 1) < 0.1
assert mc == kshana.sky_monte_carlo(terminal, seed=36, n=2000)
```

## The skyplot

`skyplot_svg` draws the same request as a static SVG (no script, no external reference): the
skyline shaded, satellites in view filled, hidden ones hollow.

```python
svg = kshana.skyplot_svg(dict(dated, skyline={"preset": "container-terminal"}))
assert svg.startswith("<svg") and "TLE sky at" in svg
try:
    from IPython.display import SVG, display
    display(SVG(svg))
except ImportError:
    print(f"{len(svg)} bytes of SVG")
```
