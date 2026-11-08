# SPDX-License-Identifier: AGPL-3.0-only
"""Basilisk adapter for the flight-dynamics reference integration (roadmap C7).

Basilisk reads trajectories through SPICE: its `spiceInterface` simulation module loads SPK kernels
with the SPICE Toolkit that Basilisk builds and ships, and `pyswice` is Basilisk's Python wrapper of
that same toolkit. This adapter loads a Kshana SPK with Basilisk's `pyswice` and returns:

- the segment's summary (target, centre, frame, type, addresses) as SPICE reads it;
- the stored records (x, y, z in km, vx, vy, vz in km/s) and epochs (TDB seconds past J2000), read
  with `dafgda_c`, to be compared bit for bit with what was written;
- the state `spkezr_c` returns at each node epoch, Basilisk's SPICE evaluating the kernel.

Basilisk does not read OEM or OPM files.
"""
from __future__ import annotations

import os


def version() -> str:
    """The Basilisk (bsk) release."""
    from importlib.metadata import version as v

    return v("bsk")


def read_spk(path: str | os.PathLike, n: int):
    """Read the first segment of an SPK with Basilisk's SPICE. Returns (summary, records, epochs,
    evaluated states at the epochs)."""
    from Basilisk.topLevelModules import pyswice as ps

    path = str(path)
    ps.furnsh_c(path)
    try:
        h = ps.new_spiceIntArray(1)
        ps.dafopr_c(path, h)
        handle = ps.spiceIntArray_getitem(h, 0)
        ps.dafbfs_c(handle)
        found = ps.new_spiceBoolArray(1)
        ps.daffna_c(found)
        summ = ps.new_doubleArray(5)
        ps.dafgs_c(summ)
        dc = ps.new_doubleArray(2)
        ic = ps.new_spiceIntArray(6)
        ps.dafus_c(summ, 2, 6, dc, ic)
        ics = [ps.spiceIntArray_getitem(ic, i) for i in range(6)]
        summary = {
            "start_et": ps.doubleArray_getitem(dc, 0),
            "end_et": ps.doubleArray_getitem(dc, 1),
            "target": ics[0],
            "centre": ics[1],
            "frame": ics[2],
            "type": ics[3],
            "first_address": ics[4],
            "last_address": ics[5],
        }
        # Types 9 and 13 store the N states, then the N epochs.
        first = ics[4]
        data = ps.new_doubleArray(7 * n)
        ps.dafgda_c(handle, first, first + 7 * n - 1, data)
        words = [ps.doubleArray_getitem(data, i) for i in range(7 * n)]
        ps.dafcls_c(handle)
        records = [words[6 * i: 6 * i + 6] for i in range(n)]
        epochs = words[6 * n: 7 * n]
        st = ps.new_doubleArray(6)
        lt = ps.new_doubleArray(1)
        evaluated = []
        for et in epochs:
            ps.spkezr_c(str(summary["target"]), et, "J2000", "NONE", str(summary["centre"]), st, lt)
            evaluated.append([ps.doubleArray_getitem(st, j) for j in range(6)])
        return summary, records, epochs, evaluated
    finally:
        ps.unload_c(path)
