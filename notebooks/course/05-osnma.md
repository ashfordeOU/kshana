<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable source of 05-osnma.ipynb. Regenerate the notebook with
jupytext:

  jupytext --to notebook notebooks/course/05-osnma.md

Runs on the repository's scenarios and synthetic examples; no network from a clone.
tests/python/test_notebooks.py executes every code cell.
-->

# Kshana course — OSNMA: is the navigation data authenticated?

Galileo Open Service Navigation Message Authentication (OSNMA) signs the navigation data with a chain of keys, so a receiver can check that it came from the satellites. Kshana verifies the chain on I/NAV pages: public key, key chain, message authentication codes. This notebook runs the verifier on a good and a corrupted synthetic stream.

> **Advisory.** Kshana is a research and engineering tool. Everything here is analysis output on
> modelled or synthetic data: it is not type-approved navigation equipment, not a safety-of-life
> service, and not a finding about any receiver, product or standard. Evidence tier: **MODELLED**
> unless a step says otherwise.

**What you will learn**

- read an `osnma_verify` report: per-tag status and the overall verdict
- see that a corrupted page is reported, not silently dropped
- see what 'authenticated' does and does not mean

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

## Cell 3 — verify the good pages (code)

The repository's `examples/osnma/` holds synthetic pages built for the documentation, with the matching public key. The key is passed in, because a verifier must be told which key to trust.

```python
import json
key = data("examples/osnma/public-key.txt").strip()
good = kshana.osnma_verify(data("examples/osnma/pages-good.txt"), public_keys=[key])
print("overall:", good["overall"], "| pages:", good["input"]["pages"], "| freshness enforced:", good["freshness_enforced"])
print("advisory:", good["advisory"])
assert good["overall"] == "authenticated"
```

## Cell 4 — verify the corrupted pages (code)

The corrupted file differs by altered bits. The verifier must say so, with a reason.

```python
bad = kshana.osnma_verify(data("examples/osnma/pages-corrupt.txt"), public_keys=[key])
print("overall:", bad["overall"])
tags = bad["tags"]
failed = [t for t in tags if t["status"]["state"] == "failed"]
print(len(tags), "tags,", len(failed), "failed:",
      sorted({(t["prnd"], t["status"]["reason"]) for t in failed}))
assert bad["overall"] == "failed" and failed
```

## Cell 5 — without the key, nothing is established (code)

Without a trusted public key the chain of trust has no root. Pass none and read what changes: a stream that verifies against a key it names itself proves only that it is self-consistent.

```python
try:
    r = kshana.osnma_verify(data("examples/osnma/pages-good.txt"))
    print("overall without a pinned key:", r["overall"])
except ValueError as e:
    print("refused:", e)
```

## Exercises

1. Pass a wrong `public_keys` entry (change one hex digit). What does the verifier report, and why is that the right behaviour?
2. Use `reference_time` and `max_time_error` to enforce freshness. A replayed stream (old, correctly signed data) passes the cryptography; which setting stops it?
3. Read `docs/OSNMA.md`: list three things an 'authenticated' status does not say about a position fix.

## Next

The same verifier is `kshana osnma verify` on the command line (it reads pages, vector CSV or a u-blox UBX stream) and in the browser and MCP builds. `docs/OSNMA.md` states the intellectual-property notice for the Galileo interface and what is checked against which official vectors. The authentication status is not a navigation integrity service.
