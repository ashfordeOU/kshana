<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable mirror of notebooks/compliance-and-test-bench.ipynb. Regenerate
the notebook with jupytext:

  jupytext --to notebook notebooks/compliance-and-test-bench.md

Runs on a synthetic scenario only; no network from a clone. tests/python/test_notebooks.py
executes every code cell.
-->

# Kshana — what a run supports for a framework, and files for a laboratory simulator

Two steps on **synthetic data**, the last two 0.35 capabilities without a notebook: fill the
public-framework compliance mapping from a run's result, then export the same scenario's vehicle
motion and events as files a laboratory GNSS simulator can replay. Both return text in memory and
write nothing. Evidence tier: **MODELLED**.

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

# The scenario lives in the repository. From a clone this reads it in place; elsewhere
# (for example Colab) it fetches the same file from GitHub.
import pathlib, urllib.request

RAW = "https://raw.githubusercontent.com/ashfordeOU/kshana/main/"
_here = pathlib.Path.cwd()
REPO = next((p for p in [_here, *_here.parents] if (p / "scenarios" / "gnss-ins.toml").is_file()), None)

def data(rel):
    if REPO is not None:
        return (REPO / rel).read_text()
    with urllib.request.urlopen(RAW + rel) as r:  # needs network; the clone path does not
        return r.read().decode()
```

```python
scenario = data("scenarios/gnss-ins.toml")
result = kshana.run(scenario)

report = kshana.compliance_report([{"label": "gnss-ins", "result": result, "scenario": scenario}])
print(report["report"]["statement"])
print(report["markdown"][:600])
assert report["report"]["runs"]
```

```python
bench = kshana.bench_export(scenario)
print(bench["notice"])
for suffix, text in bench["files"].items():
    print(f"{suffix:>14}  {len(text):>8} characters")
assert ".nmea" in bench["files"] and ".events.csv" in bench["files"]
```

## What this does not show

An evidenced row means a run supports evidence for the capabilities it names; it is not a finding
that a framework is met. The exported files carry vehicle motion, NMEA and labelled events, never a
signal: an event is a time interval, not a recipe for producing interference. Run a simulator only
where authorised.
