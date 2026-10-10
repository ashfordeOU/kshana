<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Notebooks

Runnable Jupyter notebooks that use the Kshana Python package on synthetic data only. Each
notebook has a `.md` mirror (the same cells as Markdown, for review in a diff) next to its
`.ipynb`. Nothing here reads the network from a clone.

| Notebook | What it shows | Mirror |
|---|---|---|
| `vessel-trust-and-training.ipynb` | generate a synthetic bridge NMEA training stream with a scripted event, then score it with the vessel trust monitors and read the 0-100 score and its reasons | [`.md`](vessel-trust-and-training.md) |
| `interference-map-route-exposure.ipynb` | where aircraft and ships reported degraded navigation data, and how much of a route falls inside it | [`.md`](interference-map-route-exposure.md) |
| `quantum-vs-classical-gdop.ipynb` | a quantum and a classical sensor in the same constellation geometry, compared by dilution of precision | [`.md`](quantum-vs-classical-gdop.md) |

The training stream and the trust score are advisory, not type-approved navigation equipment;
the stream is synthetic training data and is never for a vessel's live navigation systems.

## Run one

```sh
pip install kshana jupyter
jupyter notebook notebooks/vessel-trust-and-training.ipynb
```

## Keep the pair in step

The `.md` file is the source of the `.ipynb`:

```sh
jupytext --to notebook notebooks/vessel-trust-and-training.md
```

`tests/python/test_notebooks.py` executes every code cell of every notebook, so a notebook
cannot drift from the package it calls. See the other worked examples in
[`docs/tutorials/`](../docs/tutorials/README.md).
