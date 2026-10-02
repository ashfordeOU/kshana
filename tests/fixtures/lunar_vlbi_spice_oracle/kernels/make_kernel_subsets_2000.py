#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Cut the three NAIF kernels of the M038 SPICE comparison down to 2000-01-01..2000-01-02.

Reuses the DAF cutter of ../../lunar_vlbi_anise_oracle/kernels/make_kernel_subsets.py (type-2
Chebyshev records copied bit for bit, segment trailers re-based) for the window
2000-01-01T00:00 to 2000-01-02T12:00 UTC, and checks with SPICE that every state and rotation
at 30-minute steps from 01:00 to 2000-01-02T11:30 is identical bit for bit between the full and
the cut kernels:

* `de440s_2000-01-01.bsp`          SPK segments 3 wrt 0, 301 wrt 3, 399 wrt 3 of de440s.bsp;
* `earth_itrf93_2000-01-01.bpc`    the ITRF93 (3000) segment of earth_latest_high_prec.bpc;
* `moon_pa_de440_2000-01-01.bpc`   the MOON_PA_DE440 (31008) segment of moon_pa_de440_200625.bpc.

    source ~/Code/kshana-oracles/env.sh
    $ORACLE_PY tests/fixtures/lunar_vlbi_spice_oracle/kernels/make_kernel_subsets_2000.py
"""

import importlib.util
import pathlib

import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
CUTTER = HERE.parent.parent / "lunar_vlbi_anise_oracle" / "kernels" / "make_kernel_subsets.py"
spec = importlib.util.spec_from_file_location("cutter", CUTTER)
m = importlib.util.module_from_spec(spec)
spec.loader.exec_module(m)
m.OUT = {
    "spk": HERE / "de440s_2000-01-01.bsp",
    "earth": HERE / "earth_itrf93_2000-01-01.bpc",
    "moon": HERE / "moon_pa_de440_2000-01-01.bpc",
}


def main():
    sp.furnsh(str(m.LSK))
    sp.furnsh(str(m.NAIF / "moon_de440_250416.tf"))
    w0 = sp.str2et("2000-01-01 00:00:00 UTC")
    w1 = sp.str2et("2000-01-02 12:00:00 UTC")
    m.write("spk", w0, w1, lambda ic: (ic[0], ic[1]) in [(3, 0), (301, 3), (399, 3)])
    m.write("earth", w0, w1, lambda ic: ic[0] == 3000)
    m.write("moon", w0, w1, lambda ic: ic[0] == 31008)
    grid = [w0 + 3600.0 + k * 1800.0 for k in range(68)]
    for k in m.SRC:
        sp.furnsh(str(m.SRC[k]))
    full = m.sample(grid)
    for k in m.SRC:
        sp.unload(str(m.SRC[k]))
    for k in m.OUT:
        sp.furnsh(str(m.OUT[k]))
    sub = m.sample(grid)
    assert full == sub, "the cut kernels do not reproduce the full kernels bit for bit"
    print("cut kernels reproduce the full kernels bit for bit at", len(grid), "epochs")
    for k in m.SRC:
        print("source", m.SRC[k].name, m.sha(m.SRC[k]))
    for k in m.OUT:
        print("cut   ", m.OUT[k].name, m.sha(m.OUT[k]), m.OUT[k].stat().st_size, "bytes")


if __name__ == "__main__":
    main()
