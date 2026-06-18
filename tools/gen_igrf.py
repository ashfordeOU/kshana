#!/usr/bin/env python3
"""Generate the Rust IGRF-14 main-field tables from the official IAGA coefficients.

The IGRF Gauss coefficients are IAGA reference data (public domain). Emits the
2025.0 main-field g/h matrices and the 2025-2030 secular-variation matrices as
Schmidt semi-normalised coefficients (nT and nT/yr), to degree/order 13.

Usage:
    curl -fsSLO https://www.ngdc.noaa.gov/IAGA/vmod/coeffs/igrf14coeffs.txt
    python3 tools/gen_igrf.py igrf14coeffs.txt src/igrf_data.rs
"""
import sys

SRC = sys.argv[1] if len(sys.argv) > 1 else "igrf14coeffs.txt"
OUT = sys.argv[2] if len(sys.argv) > 2 else "src/igrf_data.rs"

NMAX = 13
# 0-indexed columns in a data line: 0=g/h, 1=n, 2=m, 3..28 = epochs 1900.0..2025.0
# (26 values, step 5 yr), 29 = secular variation (nT/yr). 2025.0 is column 28.
COL_2025 = 28
COL_SV = 29

g = [[0.0] * (NMAX + 1) for _ in range(NMAX + 1)]
h = [[0.0] * (NMAX + 1) for _ in range(NMAX + 1)]
gdot = [[0.0] * (NMAX + 1) for _ in range(NMAX + 1)]
hdot = [[0.0] * (NMAX + 1) for _ in range(NMAX + 1)]

count = 0
for line in open(SRC):
    p = line.split()
    if not p or p[0] not in ("g", "h"):
        continue
    n, m = int(p[1]), int(p[2])
    if n > NMAX:
        continue
    val, sv = float(p[COL_2025]), float(p[COL_SV])
    if p[0] == "g":
        g[n][m], gdot[n][m] = val, sv
    else:
        h[n][m], hdot[n][m] = val, sv
    count += 1
assert count == 195, f"parsed {count} coefficients (want 195)"


def emit(name, mat):
    rows = []
    rows.append(f"pub static {name}: [[f64; {NMAX + 1}]; {NMAX + 1}] = [")
    for n in range(NMAX + 1):
        vals = ", ".join(f"{mat[n][m]}" for m in range(NMAX + 1))
        rows.append(f"    [{vals}],")
    rows.append("];")
    return "\n".join(rows)


L = []
L.append("// SPDX-License-Identifier: AGPL-3.0-only")
L.append("//! IGRF-14 main-field Gauss coefficients — AUTO-GENERATED from the IAGA")
L.append("//! `igrf14coeffs.txt` reference by `tools/gen_igrf.py`; do not edit by hand.")
L.append("//! Schmidt semi-normalised, degree/order 13. `IGRF_G`/`IGRF_H` are the 2025.0")
L.append("//! main field (nT); `IGRF_GDOT`/`IGRF_HDOT` are the 2025-2030 secular variation")
L.append("//! (nT/yr). Indexed `[n][m]`. The values are IAGA reference data.")
L.append("")
L.append(f"/// Maximum spherical-harmonic degree/order of the shipped model.")
L.append(f"pub const IGRF_NMAX: usize = {NMAX};")
L.append("/// Reference epoch of the shipped main field (decimal year).")
L.append("pub const IGRF_EPOCH: f64 = 2025.0;")
L.append("")
L.append("#[rustfmt::skip]")
L.append(emit("IGRF_G", g))
L.append("#[rustfmt::skip]")
L.append(emit("IGRF_H", h))
L.append("#[rustfmt::skip]")
L.append(emit("IGRF_GDOT", gdot))
L.append("#[rustfmt::skip]")
L.append(emit("IGRF_HDOT", hdot))
L.append("")

open(OUT, "w").write("\n".join(L))
print(f"OK: {count} coefficients -> 4 [{NMAX + 1}x{NMAX + 1}] matrices written to {OUT}")
