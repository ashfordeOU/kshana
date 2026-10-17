<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable mirror of notebooks/optical-atmosphere.ipynb. Regenerate
the notebook with jupytext:

  jupytext --to notebook notebooks/optical-atmosphere.md

Runs on the two bundled scenarios; no network. tests/python/test_notebooks.py executes every
code cell.
-->

# Kshana — optical timing links through the atmosphere

How often an optical time-transfer link is up when clouds and turbulence are in the path, what
a second or third ground site buys, what an enhancement technique buys, and what an outage does
to a holdover clock (`docs/OPTICAL-ATMOSPHERE.md`). Evidence tier: **MODELLED**: published
formulas (Hufnagel–Valley turbulence, gamma-gamma scintillation, a cloud-liquid-water
distribution) checked against an independent implementation, not against a measured link. The
bundled sites are ILLUSTRATIVE, not surveys of real places. Advisory only.

```python
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

import pathlib, urllib.request

RAW = "https://raw.githubusercontent.com/ashfordeOU/kshana/main/"
_here = pathlib.Path.cwd()
REPO = next((p for p in [_here, *_here.parents]
             if (p / "scenarios" / "optical-atmosphere-network.toml").is_file()), None)

def data(rel):
    if REPO is not None:
        return (REPO / rel).read_text()
    with urllib.request.urlopen(RAW + rel) as r:  # needs network; the clone path does not
        return r.read().decode()
```

## Per-site availability

Availability is the share of time the link closes: the fade margin must exceed the clear-air
loss plus the cloud depth plus the scintillation fade. It can never exceed the site's cloud-free
ceiling.

```python
net = kshana.run_typed(data("scenarios/optical-atmosphere-network.toml")).data()
print(net["label"])
for s in net["sites"]:
    print(f"{s['name']:10s} availability {s['availability_pct']:5.1f} %  "
          f"(cloud-free ceiling {s['availability_ceiling_pct']:5.1f} %)  "
          f"scintillation alpha {s['turbulence']['alpha']:.2f}, beta {s['turbulence']['beta']:.2f}")
    assert 0 <= s["availability_pct"] <= s["availability_ceiling_pct"] <= 100
```

## Site diversity

With more sites the network is up whenever any one of them is. `independent_pct` assumes the
sites' weather is independent; `correlated_pct` lets nearby sites share weather, so it is never
better.

```python
for row in net["network"]["rows"]:
    print(f"{row['n']} site(s) {'+'.join(row['sites']):28s} "
          f"independent {row['independent_pct']:5.1f} %  correlated {row['correlated_pct']:5.1f} %")
    assert row["correlated_pct"] <= row["independent_pct"] + 1e-9
```

## An outage against a holdover clock

When the link is down the clock free-runs. The report gives the holdover time to the timing
threshold and the share of the year the timing service holds, for each clock.

```python
site = net["sites"][0]
for h in site["holdover"]:
    print(f"{h['clock']:8s} holds {h['holdover_s']:8.0f} s to {h['threshold_ns']:.0f} ns; "
          f"timing availability {h['timing_availability_pct']:5.1f} %")
    for e in h["errors"][:2]:
        print(f"    {e['label']:8s} outage {e['duration_h']:6.1f} h -> {e['timing_sigma_ns']:.3g} ns")
assert site["holdover"]
```

## Enhancement techniques

Aperture size, wavelength and adaptive optics each change the margin or the scintillation. The
second bundled scenario compares them on one uplink.

```python
tech = kshana.run_typed(data("scenarios/optical-atmosphere-techniques.toml")).data()
for t in tech["sites"][0]["techniques"]:
    print(f"{t['name']:28s} {t['baseline_pct']:5.1f} % -> {t['with_technique_pct']:5.1f} %  "
          f"({t['gain_pct_points']:+.1f} points)")
    assert t["with_technique_pct"] >= t["baseline_pct"] - 1e-9 or t["extra_margin_db"] < 0
```
