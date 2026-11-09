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
propagators, in two separate runs, steps through the file at the node spacing, and reports every
state. The states GMAT reports are compared with the written states, and with SPICE's own evaluation
of Kshana's SPK printed at the report's 16 digits, so that both pass through the same readout
(NAMING.md, the 8-9 November amendment). This is the GMAT part of roadmap item C7 (`docs/FLIGHT-DYNAMICS-EXPORT.md`).

GMAT R2026a as shipped refuses an OEM of version 2.0, the version Kshana writes: its `CCSDS-OEM`
propagator accepts one only in GMAT's TESTING mode. The notebook does not turn that mode on. It
gives GMAT the OEM as written and accepts two outcomes: the OEM carried, or that refusal.

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

GMAT runs the SPK script, every step. `GMAT_PLANETARY_SPK` names a planetary SPK (the workflow
gives NAIF's de440s.bsp); GMAT's solar system then reads it through SPICE, so that the Moon GMAT
subtracts and the Moon in its SPK chain are the same.

```python
planetary = os.environ.get("GMAT_PLANETARY_SPK")  # NAIF's de440s.bsp in the workflow
spk_report, spk_log = gm.run_spk(files["spk"], OUT / "gmat", written.epochs[0], ets[0], len(ets),
                                 planetary_spk=Path(planetary) if planetary else None)
print("GMAT's planetary source:", planetary or "GMAT's default")
print(spk_log[-2000:])
```

GMAT runs the OEM script on the OEM as written. `oem_report` is `None` when GMAT refuses the file
with `gm.OEM_V2_REFUSAL`.

```python
oem_report, oem_log = gm.run_oem(files["oem"], OUT / "gmat", ets[0], len(ets))
oem_refused = oem_report is None
print("OEM refused by GMAT:" if oem_refused else "OEM run by GMAT:", oem_log[-2000:])
```

What GMAT reported, against what was written:

```python
rows = []
legs = [("spk", spk_report, "SPK propagator, LunaJ2000 (MJ2000Eq)")]
if not oem_refused:
    legs.append(("oem", oem_report, "CCSDS-OEM propagator, LunaICRF"))
for fmt, path, how in legs:
    g_ets, g_states, g_texts = gm.read_report(path)
    print(fmt, len(g_states), "states reported")
    n = min(len(g_states), len(ets))
    ok, worst_dt = gm.epochs_equal(g_texts[:n], ets[:n])
    w = fd.Written(written.epochs[:n], written.text[:n])
    gm.write_differences(OUT / "gmat" / f"{fmt}_differences.csv", g_texts[:n], g_states[:n], ets[:n], w.values[:n])
    c = fd.evaluated_compare("GMAT", fmt, w, g_states[:n], ok, spice[:n], how=how,
                             readout_digits=gm.REPORT_DIGITS)
    c.notes.append(f"{len(g_states)} of {len(ets)} states reported; epochs within {worst_dt:.3g} s of the written ones")
    if fmt == "spk" and n == len(ets):
        import math
        dr = [math.dist(g[:3], v[:3]) for g, v in zip(g_states, w.values)]
        dv = [math.dist(g[3:], v[3:]) for g, v in zip(g_states, w.values)]
        c.notes.append(f"GMAT minus written: first node {dr[0]:.3g} km, {dv[0]:.3g} km/s; interior nodes up to "
                       f"{max(dr[1:-1]):.3g} km, {max(dv[1:-1]):.3g} km/s; last node {dr[-1]:.3g} km, {dv[-1]:.3g} km/s "
                       f"(per node: gmat/spk_differences.csv)")
        off = gm.epoch_offsets(g_texts[:n], ets[:n])
        c.notes.append(f"last node asked for {gm.LAST_NODE_MARGIN_S:g} s before the kernel's end: its epoch "
                       f"offset {off[-1]:.3g} s; the other nodes within {max(abs(x) for x in off[:-1]):.3g} s")
    rows.append(c)
    print(c.row())
```

## The difference report

```python
md = fd.report(rows, OUT)
if oem_refused:
    note = f"GMAT OEM: not run. GMAT R2026a refuses CCSDS_OEM_VERS = 2.0 outside its TESTING mode: {gm.OEM_V2_REFUSAL}"
    md += "\n" + note + "\n"
    (OUT / "gmat" / "oem_refused.txt").write_text(note + "\n")
print(md)
assert all(len(gm.read_report(p)[1]) == len(ets) for _, p, _ in legs), "GMAT did not report every state"
assert all(c.carried for c in rows), md
```
