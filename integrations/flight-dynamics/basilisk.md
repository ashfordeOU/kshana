<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable mirror of integrations/flight-dynamics/basilisk.ipynb.
Regenerate the notebook with jupytext:

  jupytext --to notebook integrations/flight-dynamics/basilisk.md

Needs requirements-basilisk.txt; reads nothing from the network.
.github/workflows/flight-dynamics.yml runs it top to bottom.
-->

# Kshana to Basilisk: an SPK kernel read back record for record

Kshana writes the CAPSTONE states of the mission thread (JPL Horizons, Moon-centred, ICRF, TDB,
4,321 states every 10 minutes in March 2023) as an SPK kernel of type 13. Basilisk reads kernels
through the SPICE Toolkit it builds and ships; here Basilisk's `pyswice` loads the kernel, reads its
stored records and epochs, and evaluates it at each node. This is the Basilisk part of roadmap item
C7 (`docs/FLIGHT-DYNAMICS-EXPORT.md`); it says nothing about whether Kshana's and Basilisk's
propagation agree.

```python
import os, sys, tempfile
from pathlib import Path

# The adapters sit next to this notebook (integrations/flight-dynamics/ in a clone).
here = Path.cwd()
FD = next(d for p in [here, *here.parents] for d in [p, p / "integrations" / "flight-dynamics"]
          if (d / "kshana_fd.py").exists())
sys.path.insert(0, str(FD))
import kshana_fd as fd
import basilisk_reader as bsk

OUT = Path(os.environ.get("KSHANA_FD_OUT", tempfile.mkdtemp(prefix="kshana-fd-")))
files = fd.write_files(OUT / "files")
written = fd.written_states(files["oem"])  # the same states, as text, for the comparison
print("bsk", bsk.version(), files["spk"])
```

Basilisk's SPICE reads the kernel: the segment summary, the 4,321 stored states and epochs, and the
state `spkezr_c` evaluates at each node epoch.

```python
summary, records, epochs, evaluated = bsk.read_spk(files["spk"], len(written.epochs))
print(summary)
assert (summary["target"], summary["centre"], summary["frame"], summary["type"]) == (-1176, 301, 1, 13)
```

The stored records must be the written doubles, bit for bit, and the stored epochs the TDB seconds
past J2000 of the written labels.

```python
want_epochs = [fd.et_of_label(e) for e in written.epochs]
spk = fd.records_compare("Basilisk", written, records, epochs, want_epochs, how="pyswice dafgda_c")
spk.row()
```

At a node, the Hermite interpolation returns the stored state up to the rounding of its own
arithmetic:

```python
dp = max(max(abs(a - b) for a, b in zip(e[:3], w[:3])) for e, w in zip(evaluated, written.values))
dv = max(max(abs(a - b) for a, b in zip(e[3:], w[3:])) for e, w in zip(evaluated, written.values))
spk.notes.append(f"spkezr_c at the nodes: within {dp:.2g} km and {dv:.2g} km/s of the stored state")
print(spk.notes[-1])
assert dp < 1e-9 and dv < 1e-12
```

## The difference report

```python
md = fd.report([spk], OUT)
print(md)
assert spk.carried and not spk.rounds_further, md
assert spk.same_bits == spk.values == 6 * 4321
```
