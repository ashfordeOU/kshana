<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable source of 04-integrity.ipynb. Regenerate the notebook with
jupytext:

  jupytext --to notebook notebooks/course/04-integrity.md

Runs on the repository's scenarios and synthetic examples; no network from a clone.
tests/python/test_notebooks.py executes every code cell.
-->

# Kshana course — integrity: protection levels and alert limits

Receiver autonomous integrity monitoring (RAIM) bounds the position error with a protection level, computed from the satellite geometry and the range-error budget. Availability is the share of epochs on which that bound is inside the alert limit. This notebook varies the error budget and the sky.

> **Advisory.** Kshana is a research and engineering tool. Everything here is analysis output on
> modelled or synthetic data: it is not type-approved navigation equipment, not a safety-of-life
> service, and not a finding about any receiver, product or standard. Evidence tier: **MODELLED**
> unless a step says otherwise.

**What you will learn**

- read an `integrity` result: HPL, VPL, availability against HAL and VAL
- see how the range-error budget, not the constellation, sets the protection level
- see how a harbour skyline and a second constellation change it

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

## Cell 3 — the bundled run (code)

Twelve hours over a 24-satellite shell, a 1 m ranging error (a dual-frequency, carrier-smoothed receiver) and the APV-I alert limits, HAL 40 m and VAL 50 m.

```python
import re
toml = data("scenarios/integrity-raim.toml")
r = kshana.run_typed(toml)
print(r.summary)
d = r.data()
print("available:", d["samples_available"], "of", d["samples_total"])
first = d["epochs"][0]
print({k: first[k] for k in ("t_s", "n_visible", "hpl_m", "vpl_m")})
```

## Cell 4 — vary the error budget (code)

The protection level scales with the assumed range error. Single-frequency RAIM is nearer 5 m: the same sky with that budget is not available against the same limits.

```python
def with_sigma(sigma):
    t = re.sub(r"^sigma_uere_m = [0-9.]+", f"sigma_uere_m = {sigma}", toml, flags=re.M)
    return kshana.run_typed(t).data()

for sigma in (0.5, 1.0, 2.0, 5.0):
    x = with_sigma(sigma)
    print(f"sigma_UERE {sigma:3.1f} m  available {x['samples_available']:3d} of {x['samples_total']}")
a1 = with_sigma(1.0)["samples_available"]
a5 = with_sigma(5.0)["samples_available"]
assert a5 < a1
```

## Cell 5 — a harbour skyline and a second constellation (code)

The same engine with a ground site, a GPS plus Galileo ARAIM, and a representative harbour skyline that hides low satellites in the quay and breakwater directions.

```python
h = kshana.run_typed(data("scenarios/integrity-harbour-approach.toml"))
print(h.summary)
hd = h.data()
hidden = [e.get("masked_by_skyline", 0) for e in hd["epochs"]]
print("satellites hidden by the skyline: most", max(hidden), ", mean", round(sum(hidden) / len(hidden), 2))
```

## Exercises

1. Set the alert limits to the IMO MSC.1/Circ.1575 level B values (HAL 10 m, VAL 5 m) and read the availability. The IMO standards pack states exactly this as a bar (`kshana standards-pack run imo-circ-1575`); what does the result say?
2. Compare `integrity-raim.toml` (single constellation) with `araim-gps-galileo.toml` (GPS plus Galileo, constellation-wide fault hypothesis). Which costs availability, and why?
3. The Stanford diagram counts integrity events. Raise `p_md` tenfold and find the first epoch with a misleading-information event.

## Next

Integrity is the `integrity` kind; `docs/INTEGRITY.md` and `docs/ARAIM_REFERENCE.md` cover the algorithms and what is validated against which oracle. The numbers are a modelled sky and a stated error budget, not a measurement of a receiver.
