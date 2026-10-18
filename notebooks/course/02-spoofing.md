<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable source of 02-spoofing.ipynb. Regenerate the notebook with
jupytext:

  jupytext --to notebook notebooks/course/02-spoofing.md

Runs on the repository's scenarios and synthetic examples; no network from a clone.
tests/python/test_notebooks.py executes every code cell.
-->

# Kshana course — spoofing: what the detector layers see

A spoofer replaces the real signals with counterfeit ones. Kshana's combined detector fuses three independent receiver observables: a RAIM consistency test over the satellites, the automatic gain control (AGC) rise, and signal-quality monitoring (SQM) of the correlation peak. This notebook walks a spoofing attack through the layers, including the case that defeats the RF layers.

> **Advisory.** Kshana is a research and engineering tool. Everything here is analysis output on
> modelled or synthetic data: it is not type-approved navigation equipment, not a safety-of-life
> service, and not a finding about any receiver, product or standard. Evidence tier: **MODELLED**
> unless a step says otherwise.

**What you will learn**

- read a `spoof-detect` result: which layer fired and the fused score
- see why a position push on a satellite subset is visible to RAIM and a common-mode time push is not
- see which attacks are left to the clock-aided detector

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

## Cell 3 — the bundled position push (code)

A matched-power position push (+1.5 dB power advantage, three satellites biased by 75 m) is under the 3 dB AGC margin, so power alone misses it.

```python
toml = data("scenarios/spoof-detect.toml")
r = kshana.run_typed(toml)
print(r.summary)
d = r.data()["decision"]
print("layers:", d["fused"]["layers"], "| fused score", d["fused"]["score"], "| alert", d["fused"]["alert"])
assert d["raim"]["alert"] and d["fused"]["alert"]
```

## Cell 4 — vary the attack (code)

The attack table is the one the public TEXBAT battery classifies records by: power advantage, whether the spoofer is carrier-phase aligned, and whether it pushes time or position. The loop changes one setting at a time.

```python
def variant(**changes):
    t = toml
    for key, value in changes.items():
        import re
        t = re.sub(rf"^{key} = .*$", f"{key} = {value}", t, flags=re.M)
    return kshana.run_typed(t).data()["decision"]

cases = {
    "bundled: +1.5 dB, position push": {},
    "much stronger spoofer (+8 dB)": {"power_advantage_db": 8.0},
    "carrier-phase aligned": {"carrier_aligned": "true"},
    "time push (common mode), aligned, +1.5 dB": {"push": '"time"', "carrier_aligned": "true"},
}
for name, ch in cases.items():
    dec = variant(**ch)
    print(f"{name:45s} RAIM {dec['raim']['alert']!s:5}  AGC +{dec['agc_excess_db']:4.1f} dB  fused {dec['fused']['alert']!s:5} layers {dec['fused']['layers']}")
```

## Cell 5 — what a miss looks like (code)

The last case is the documented hard one: a time push moves every satellite by the same amount, which RAIM cannot see, an aligned carrier leaves no SQM distortion, and a small power advantage stays under the AGC margin. Kshana does not hide it: the clock-aided `spoof` kind is the layer meant to catch it.

```python
hard = variant(push='"time"', carrier_aligned="true")
print("fused alert on the hard case:", hard["fused"]["alert"])
assert hard["fused"]["alert"] is False   # a stated miss, not a bug: see the scenario's header comment
print("The clock-aided detector scores this attack (scenarios/spoof-attack.toml):")
print(kshana.run_typed(data("scenarios/spoof-attack.toml")).summary)
```

## Exercises

1. Find the smallest `power_advantage_db` at which the AGC layer fires on its own. How does it relate to `agc_margin_db`?
2. Increase `num_biased` from 3 to 7 of the 8 satellites. Does RAIM still see a position push? (Think about what RAIM compares.)
3. Raise `sigma_m` and `raim_p_fa`. What happens to the fused score, and what does that say about choosing a threshold before the run?

## Next

The detector is the `spoof-detect` kind; `docs/RECEIVER-TRUST.md` covers scoring a real receiver's own log against events stated before the run, and the DHS standards pack runs the position push against a bar (`kshana standards-pack run dhs-rpcf`). The detector is driven with parameterised observables, not raw IQ.
