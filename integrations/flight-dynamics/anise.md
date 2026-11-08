<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable mirror of integrations/flight-dynamics/anise.ipynb.
Regenerate the notebook with jupytext:

  jupytext --to notebook integrations/flight-dynamics/anise.md

Needs requirements-anise.txt; reads nothing from the network.
.github/workflows/flight-dynamics.yml runs it top to bottom.
-->

# Kshana to ANISE: an SPK and an OEM read by an independent reader

ANISE is the fourth, file-based tool of roadmap item C7
(`docs/design/evidence/c7-flight-dynamics-adapters/NAMING.md`). It reads SPICE kernels with its
own reader, not the SPICE Toolkit, and converts a CCSDS OEM to a kernel of its own. Kshana writes
the CAPSTONE states of the mission thread (4,321 states, Moon-centred, ICRF, TDB) as an SPK and an
OEM. ANISE evaluates both at every node epoch, and the results are compared with the written states
and with SPICE's own evaluation of Kshana's SPK.

```python
import os, sys, tempfile
from pathlib import Path

# The adapters sit next to this notebook (integrations/flight-dynamics/ in a clone).
here = Path.cwd()
FD = next(d for p in [here, *here.parents] for d in [p, p / "integrations" / "flight-dynamics"]
          if (d / "kshana_fd.py").exists())
sys.path.insert(0, str(FD))
import kshana_fd as fd
import anise_reader as an

OUT = Path(os.environ.get("KSHANA_FD_OUT", tempfile.mkdtemp(prefix="kshana-fd-")))
files = fd.write_files(OUT / "files")
written = fd.written_states(files["oem"])
ets = [fd.et_of_label(e) for e in written.epochs]
print("anise", an.version())
```

The reference: the SPICE Toolkit (through spiceypy) evaluating Kshana's SPK at the same node
epochs. Hermite interpolation returns a node's state up to the rounding of its own arithmetic.

```python
import spiceypy

spiceypy.furnsh(str(files["spk"]))
spice = [[float(x) for x in spiceypy.spkezr("-1176", e, "J2000", "NONE", "301")[0]] for e in ets]
spiceypy.kclear()
```

ANISE reads the SPK. The node epochs are SPICE ephemeris time, as SPK epochs are.

```python
summ, states, (start, end) = an.read_spk(files["spk"], ets)
print(summ["type"], summ["frame"], start, end)
spk_epochs = [start == ets[0] and end == ets[-1]] * len(ets)
spk = fd.evaluated_compare("ANISE", "spk", written, states, spk_epochs, spice, how="Almanac.spk_ezr")
spk.row()
```

ANISE converts the OEM to a kernel of its own and evaluates it. It reads the OEM's TDB labels on
hifitime's TDB, so the node epochs are given as TDB.

```python
summ_o, states_o, (start_o, end_o) = an.read_oem(files["oem"], ets)
print(summ_o["type"], summ_o["frame"], start_o, end_o)
oem_epochs = [start_o == ets[0] and end_o == ets[-1]] * len(ets)
oem = fd.evaluated_compare("ANISE", "oem", written, states_o, oem_epochs, spice, how="Almanac.from_ccsds_oem_file")
oem.row()
```

hifitime's TDB and SPICE's ET differ by microseconds. The same TDB label falls this far apart on
the two scales at the first node, and evaluating the SPK on the wrong one moves the states:

```python
from anise.time import Epoch

dt_us = (Epoch.init_from_tdb_seconds(ets[0]).to_et_seconds() - ets[0]) * 1e6
_, wrong, _ = an.read_spk(files["spk"], [Epoch.init_from_tdb_seconds(e).to_et_seconds() for e in ets])
shift = max(max(abs(a - b) for a, b in zip(r[:3], w[:3])) for r, w in zip(wrong, written.values))
print(f"TDB label read as hifitime TDB is {dt_us:.3f} us from SPICE ET; states move by up to {shift:.2g} km")
```

## The difference report

```python
md = fd.report([spk, oem], OUT)
print(md)
assert spk.carried and oem.carried, md
assert summ["type"].endswith("Type13HermiteUnequalStep")
```
