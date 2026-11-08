<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable mirror of integrations/flight-dynamics/gmat.ipynb.
Regenerate the notebook with jupytext:

  jupytext --to notebook integrations/flight-dynamics/gmat.md

Needs GMAT R2026a (GMAT_ROOT names the installation) and spiceypy for the reference.
.github/workflows/flight-dynamics.yml runs it in its own job, gmat.
-->

# Kshana to GMAT: an OEM and an SPK read back by GMAT's ephemeris propagators

Kshana writes the CAPSTONE states of the mission thread (4,321 states, Moon-centred, ICRF, TDB) as
an OEM and an SPK. GMAT loads each into a spacecraft through its `CCSDS-OEM` and `SPK` ephemeris
propagators, steps through the file at the node spacing, and reports every state. The states GMAT
reports are compared with the written states, and with SPICE's own evaluation of Kshana's SPK. This
is the GMAT part of roadmap item C7 (`docs/FLIGHT-DYNAMICS-EXPORT.md`).

```python
import os, sys, tempfile
from pathlib import Path

# The adapters sit next to this notebook (integrations/flight-dynamics/ in a clone).
here = Path.cwd()
FD = next(d for p in [here, *here.parents] for d in [p, p / "integrations" / "flight-dynamics"]
          if (d / "kshana_fd.py").exists())
sys.path.insert(0, str(FD))
import kshana_fd as fd
import gmat_reader as gm

OUT = Path(os.environ.get("KSHANA_FD_OUT", tempfile.mkdtemp(prefix="kshana-fd-")))
files = fd.write_files(OUT / "files")
written = fd.written_states(files["oem"])
ets = [fd.et_of_label(e) for e in written.epochs]
print("GMAT", gm.gmat_root())
```

The reference: the SPICE Toolkit evaluating Kshana's SPK at the node epochs.

```python
import spiceypy

spiceypy.furnsh(str(files["spk"]))
spice = [[float(x) for x in spiceypy.spkezr("-1176", e, "J2000", "NONE", "301")[0]] for e in ets]
spiceypy.kclear()
```

GMAT runs the script: both spacecraft, every step.

```python
oem_report, spk_report, log = gm.run(files["oem"], files["spk"], OUT / "gmat", written.epochs[0], len(ets))
print(log[-2000:])
```

What GMAT reported, against what was written:

```python
rows = []
for fmt, path, how in [("oem", oem_report, "CCSDS-OEM propagator, LunaICRF"),
                       ("spk", spk_report, "SPK propagator, LunaJ2000 (MJ2000Eq)")]:
    g_ets, g_states, g_texts = gm.read_report(path)
    print(fmt, len(g_states), "states reported")
    n = min(len(g_states), len(ets))
    ok, worst_dt = gm.epochs_equal(g_texts[:n], ets[:n])
    w = fd.Written(written.epochs[:n], written.text[:n])
    c = fd.evaluated_compare("GMAT", fmt, w, g_states[:n], ok, spice[:n], how=how)
    c.notes.append(f"{len(g_states)} of {len(ets)} states reported; epochs within {worst_dt:.3g} s of the written ones")
    rows.append(c)
    print(c.row())
```

## The difference report

```python
md = fd.report(rows, OUT)
print(md)
assert all(len(gm.read_report(p)[1]) == len(ets) for p in (oem_report, spk_report)), "GMAT did not report every state"
assert all(c.carried for c in rows), md
```
