<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Kshana course notebooks

Six short notebooks, one idea each, on the repository's scenarios and synthetic examples. Each
states what you will learn, runs end to end, and ends with exercises.

> **Advisory.** Kshana is a research and engineering tool. Everything here is analysis output on
> modelled or synthetic data: it is not type-approved navigation equipment, not a safety-of-life
> service, and not a finding about any receiver, product or standard. Evidence tier: **MODELLED**
> unless a step says otherwise.

| # | Notebook | You will see |
|---|---|---|
| 1 | [`01-jamming`](01-jamming.md) | availability coming back as a jammer moves away; J/S falling 20 dB per decade of range |
| 2 | [`02-spoofing`](02-spoofing.md) | which detector layer fires for which attack, and the attack that defeats the RF layers |
| 3 | [`03-holdover`](03-holdover.md) | an optical and a chip-scale atomic clock against a stated timing bound; the Allan deviation behind it |
| 4 | [`04-integrity`](04-integrity.md) | protection levels against alert limits, the range-error budget, a harbour skyline |
| 5 | [`05-osnma`](05-osnma.md) | Galileo OSNMA verification of a good and a corrupted synthetic stream, and why a key must be pinned |
| 6 | [`06-interference-map`](06-interference-map.md) | an aggregate ADS-B interference map, what a cell can and cannot say, a route's exposure |

## Run them

**Jupyter (tested).**

```sh
pip install kshana jupyter
jupyter notebook notebooks/course/01-jamming.ipynb
```

Each notebook's first cell installs the published wheel if it is missing and falls back to a build
from source. From a clone the scenario and example files are read in place; elsewhere (for example
Colab) the same files are fetched from GitHub, which needs the network.

**In a browser.** The notebooks use the `kshana` Python package. A Pyodide runtime
(JupyterLite) can only run them if a Pyodide-compatible `kshana` wheel is installed, and none is
published with 0.38, so that route is **not tested and not claimed**. In a browser without Python,
the same engine runs as WebAssembly (`npm install kshana`) and in Kshana Studio (`/studio/`);
the Python functions each notebook calls have WebAssembly counterparts of the same names where
[`docs/SURFACES.md`](../../docs/SURFACES.md) says so. The notebooks use only the standard library
beside `kshana`, so no numerical package is needed.

## Keep the pair in step

The `.md` file is the source of the `.ipynb`:

```sh
jupytext --to notebook notebooks/course/01-jamming.md
```

`tests/python/test_notebooks.py` executes every code cell of every course notebook, so a notebook
cannot drift from the package it calls.
