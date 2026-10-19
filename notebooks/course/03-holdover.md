<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable source of 03-holdover.ipynb. Regenerate the notebook with
jupytext:

  jupytext --to notebook notebooks/course/03-holdover.md

Runs on the repository's scenarios and synthetic examples; no network from a clone.
tests/python/test_notebooks.py executes every code cell.
-->

# Kshana course — holdover: how long does the clock keep time without GNSS?

When GNSS is denied, a receiver's clock free-runs and its timing error grows with the clock's noise. This notebook runs the same two-hour scenario for an optical lattice clock and a chip-scale atomic clock and reads their timing error against a stated bound.

> **Advisory.** Kshana is a research and engineering tool. Everything here is analysis output on
> modelled or synthetic data: it is not type-approved navigation equipment, not a safety-of-life
> service, and not a finding about any receiver, product or standard. Evidence tier: **MODELLED**
> unless a step says otherwise.

**What you will learn**

- read a `clock` result: holdover time, 95th-percentile timing error, availability
- see that the bound, not the clock, decides what holdover means
- move the start of the outage and see what changes

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

## Cell 3 — run the bundled scenario (code)

GNSS is nominal for 10 minutes and denied for the remaining 110. The bound (`threshold_ns`) is 20 ns.

```python
toml = data("scenarios/clock-holdover.toml")
r = kshana.run_typed(toml)
print(r.summary)
d = r.data()
for name in ("quantum", "classical"):
    f = d[name]["fom"]
    print(f"{name:9s} holdover {f['holdover_s']:7.0f} s   p95 {f['timing_p95_ns']:.3g} ns   rms {f['timing_rms_ns']:.3g} ns")
print("bound:", d["threshold_ns"], "ns")
assert d["quantum"]["fom"]["timing_p95_ns"] < d["threshold_ns"]
```

## Cell 4 — same scenario, shorter denial (code)

Holdover is only as long as the denial: shorten it and the classical clock stays inside the bound for the whole run. The edit moves the denial window's start from 600 s to 6000 s.

```python
short = toml.replace("{ t0 = 0.0,    t1 = 600.0,  state = \"nominal\" }", "{ t0 = 0.0,    t1 = 6000.0, state = \"nominal\" }") \
            .replace("{ t0 = 600.0,  t1 = 7200.0, state = \"denied\" }", "{ t0 = 6000.0, t1 = 7200.0, state = \"denied\" }")
assert short != toml
ds = kshana.run_typed(short).data()
for name in ("quantum", "classical"):
    f = ds[name]["fom"]
    print(f"{name:9s} p95 {f['timing_p95_ns']:.3g} ns  (bound {ds['threshold_ns']} ns)")
assert ds["classical"]["fom"]["timing_p95_ns"] < d["classical"]["fom"]["timing_p95_ns"]
```

## Cell 5 — the Allan deviation behind it (code)

The result carries each clock's Allan deviation curve (tau, sigma_y). A flat white-FM slope of -1/2 on a log-log plot is why error grows with the square root of time.

```python
for name in ("quantum", "classical"):
    curve = d[name]["adev_curve"]
    print(name, "  tau [s] -> ADEV:", ", ".join(f"{p['tau_s']:g} -> {p['adev']:.2e}" for p in curve[:5]))
# White FM: ADEV falls as tau^(-1/2), so quadrupling tau halves it.
q = d["quantum"]["adev_curve"]
ratio = q[2]["adev"] / q[0]["adev"]
print("ADEV(40 s) / ADEV(10 s) =", round(ratio, 2), "(white FM predicts 0.50)")
assert abs(ratio - 0.5) < 0.05
```

## Exercises

1. Change `threshold_ns` to 5 and to 100 and read `holdover_s` for both clocks. What does a 'holdover time' mean without its bound?
2. Replace the classical clock with a rubidium or OCXO card from `docs/` (the clock library) and compare.
3. Why is the optical clock's 95th-percentile error four orders of magnitude lower here, and what is not modelled (ageing, temperature, the receiver's own steering)?

## Next

Holdover is the `clock` kind; the DHS and ICAO standards packs run it against the scenario's own bound (`kshana standards-pack run dhs-rpcf`). `docs/TELECOM-TIMING.md` and `docs/TIMING-HIL.md` cover timing masks and testing a real holdover. All figures here are MODELLED.
