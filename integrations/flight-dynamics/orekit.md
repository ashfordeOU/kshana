<!-- SPDX-License-Identifier: AGPL-3.0-only -->
<!--
This Markdown file is the diff-reviewable mirror of integrations/flight-dynamics/orekit.ipynb.
Regenerate the notebook with jupytext:

  jupytext --to notebook integrations/flight-dynamics/orekit.md

Needs Java 17 or later and requirements-orekit.txt; fetches orekit-data at a pinned commit once.
.github/workflows/flight-dynamics.yml runs it top to bottom.
-->

# Kshana to Orekit: a trajectory read back state for state

Kshana writes the CAPSTONE states of the mission thread (JPL Horizons, Moon-centred, ICRF, TDB,
4,321 states every 10 minutes in March 2023) as a CCSDS OEM and OPM. Orekit reads them with its own
CCSDS parsers, and every state Orekit holds is compared with the state written. This is the Orekit
part of roadmap item C7 (`docs/FLIGHT-DYNAMICS-EXPORT.md`); it says nothing about whether Kshana's
and Orekit's propagation agree.

```python
import json, os, sys, tempfile
from pathlib import Path

# The adapters sit next to this notebook (integrations/flight-dynamics/ in a clone).
here = Path.cwd()
FD = next(d for p in [here, *here.parents] for d in [p, p / "integrations" / "flight-dynamics"]
          if (d / "kshana_fd.py").exists())
sys.path.insert(0, str(FD))
import kshana_fd as fd
import orekit_reader as ok

OUT = Path(os.environ.get("KSHANA_FD_OUT", tempfile.mkdtemp(prefix="kshana-fd-")))
files = fd.write_files(OUT / "files")
{k: str(v) for k, v in files.items()}
```

The OEM as written: the header from the Horizons table, then one line per state with every value
in shortest round-trip form.

```python
print("".join(Path(files["oem"]).read_text().splitlines(keepends=True)[:16]))
```

Orekit reads the OEM. It holds metres and metres per second, so each value it holds is the written
kilometre value times 1000.

```python
written = fd.written_states(files["oem"])
states, epochs_ok, meta = ok.read_oem(files["oem"], written.epochs)
print("orekit_jpype", ok.version(), meta)
oem = fd.compare("Orekit", "oem", written, states, epochs_ok, scale=1000.0, how="OemParser")
oem.row()
```

And the OPM, one state:

```python
written_opm = fd.written_states(files["opm"])
state, epoch_ok = ok.read_opm(files["opm"], written_opm.epochs)
opm = fd.compare("Orekit", "opm", written_opm, state, epoch_ok, scale=1000.0, how="OpmParser")
opm.row()
```

## The difference report

`carried` means every value Orekit holds is its own conversion of the written double and every
epoch is the written one. The report also says whether Orekit rounds further than the digits
written: converting kilometres to metres is a second rounding, at most one unit in the last place
of the metre value.

```python
md = fd.report([oem, opm], OUT)
print(md)
assert oem.carried and opm.carried, md
assert oem.states == 4321 and oem.epochs_equal == 4321
assert oem.worst_ulps <= 1.0 and opm.worst_ulps <= 1.0, "Orekit's conversion moved a value more than one ulp"
```
