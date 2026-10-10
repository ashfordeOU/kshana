<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable mirror of notebooks/vessel-trust-and-training.ipynb. Regenerate
the notebook with jupytext:

  jupytext --to notebook notebooks/vessel-trust-and-training.md

Runs on synthetic data only; no network from a clone. tests/python/test_notebooks.py
executes every code cell.
-->

# Kshana — can the bridge trust this fix? A training stream, then a trust score

Two steps, both on **synthetic data**: generate a crew-training NMEA stream with a scripted
GNSS event and an instructor log, then score a made-up ferry log whose receiver keeps
reporting a *valid* fix while its position is dragged away, and watch the 0-100 trust score
fall.

**Read this first.**

- The training stream is **text only**: no RF, IQ or waveform is synthesised and nothing is
  transmitted. It is for training and testing and must **never** be fed to a vessel's live
  navigation systems.
- The trust score is **advisory**: Kshana is not type-approved navigation equipment
  (IEC 61108, IEC 61162) and the operator stays responsible for the vessel. The monitors are
  **MODELLED**: the thresholds are stated inputs, and nothing here says how they perform
  against real interference. A high score is not proof of a genuine fix: the checks cannot see
  a spoofer whose fix is consistent with everything else on the bus.
- `receiver-trust live` (a long-running stream process with a gate and an optional TCP
  listener) is command-line only; here the same engine replays an excerpt.

## Cell 2 — install (code)

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
```

## Cell 3 — locate the synthetic inputs (code)

```python
# The synthetic inputs live in the repository. From a clone this reads them in place;
# elsewhere (for example Colab) it fetches the same files from GitHub.
import pathlib, urllib.request

RAW = "https://raw.githubusercontent.com/ashfordeOU/kshana/main/"
_here = pathlib.Path.cwd()
REPO = next((p for p in [_here, *_here.parents] if (p / "scenarios" / "training").is_dir()), None)

def data(rel):
    if REPO is not None:
        return (REPO / rel).read_text()
    with urllib.request.urlopen(RAW + rel) as r:  # needs network; the clone path does not
        return r.read().decode()
```

## Cell 4 — generate a training stream and read the instructor log (code)

```python
import json
import kshana

drill = data("scenarios/training/open-sea-jamming.toml")
out = kshana.nmea_training(drill, seed=42)          # same seed, same bytes

sentences = out["nmea"].splitlines()
print(len(sentences), "NMEA lines; first three:")
print("\n".join(sentences[:3]))
log = json.loads(out["log_json"])
print("\nschema:", log["schema"])
print("warning:", log["warning"])
for ev in log["events"]:
    print(f"event {ev['id']}: {ev['description'][:110]}...")
assert kshana.nmea_training(drill, seed=42) == out
```

## Cell 5 — replay a synthetic ferry log through the live trust engine (code)

```python
session = data("examples/maritime-trust/session.toml")
session = session.replace('path = "tallinn-helsinki.nmea"', "")        # the log is passed in below
session = session.replace("calibration_s = 300.0", "calibration_s = 60.0")  # short excerpt

lines = data("examples/maritime-trust/tallinn-helsinki.nmea").splitlines(keepends=True)
n = len(lines)
excerpt = "".join(lines[n * 1400 // 3000 : n * 1800 // 3000])   # the drag-off starts at 1500 s

r = kshana.receiver_trust_replay(session, excerpt)
print(r["summary"])
reports = r["epochs"]
first_bad = next(x for x in reports if x["state"] in ("degraded", "untrusted"))
print("score first fell at t =", first_bad["t_s"], "s; reasons:", first_bad["deductions"])
assert r["summary"]["untrusted"] > 0
```

## Cell 6 — plot the score (optional) (code)

```python
try:
    import matplotlib.pyplot as plt
except ImportError:
    plt = None
    print("matplotlib is not installed; skipping the plot")

if plt is not None:
    t = [x["t_s"] for x in reports if x["score"] is not None]
    s = [x["score"] for x in reports if x["score"] is not None]
    plt.figure(figsize=(8, 3))
    plt.plot(t, s)
    plt.axhline(90, ls=":", c="gray"); plt.axhline(55, ls=":", c="gray")
    plt.xlabel("seconds into the excerpt"); plt.ylabel("trust score (0-100)")
    plt.title("Synthetic position drag-off: advisory score, MODELLED monitors")
    plt.tight_layout(); plt.show()
```

## Cell 7 — a signed evidence pack for a window, then verify it (code)

```python
# A pack is a technical record of what the engine computed from this log, with every hash and
# a signature over them. It is not a legal opinion and not a finding of fact.
pack = kshana.evidence_create(session, excerpt, 100.0, 300.0,
                              title="Synthetic drag-off", created_utc="none")
print("signer public key:", pack["public_key"], "| epochs in window:", pack["epochs_in_window"])
# Keep pack["seed_hex"] private; a throwaway key is fine for a demo. Verify against the public
# key you trust (obtained from the signer by another route), and against the log you hold.
report = kshana.evidence_verify(pack["files"], pack["public_key"], excerpt)
print(report["verdict"], "|", report["message"])
print("with no key supplied:", kshana.evidence_verify(pack["files"])["verdict"])  # intact, signer not pinned
tampered = dict(pack["files"]); tampered["epochs.json"] = tampered["epochs.json"].replace(b"nominal", b"NOMINAL", 1)
print("after editing one file:", kshana.evidence_verify(tampered, pack["public_key"])["ok"])
assert report["ok"] and not kshana.evidence_verify(tampered, pack["public_key"])["ok"]
```

## What this does not show

The ferry log is made up: it shows the format and the monitors, not a measurement, and the
route is illustrative, not a chart. The same engine runs behind `kshana receiver-trust live`
(with `--gate` and `--listen`), the MCP server's `assess_vessel_stream` tool and the browser
build's `receiver_trust_replay`. A signed evidence pack of a window of this log is one call
away (`kshana.evidence_create`), and `kshana.evidence_verify` checks it; see
`docs/EVIDENCE-PACKS.md`. Details: `docs/MARITIME-TRUST.md`.
