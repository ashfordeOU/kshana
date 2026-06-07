#!/usr/bin/env python3
"""Generate the Rust IAU 2000A nutation tables from the ERFA nut00a.c reference.

The numerical series are IAU reference data (not copyrightable); ERFA is the
BSD-licensed clean-room of SOFA. Emits two const arrays into a Rust source file.

Usage:
    # Fetch the reference once:
    curl -fsSLO https://raw.githubusercontent.com/liberfa/erfa/master/src/nut00a.c
    python3 tools/gen_nut00a.py nut00a.c src/nutation_iau2000a_data.rs

Args default to ./nut00a.c -> src/nutation_iau2000a_data.rs.
"""
import re, sys

SRC_PATH = sys.argv[1] if len(sys.argv) > 1 else "nut00a.c"
OUT_PATH = sys.argv[2] if len(sys.argv) > 2 else "src/nutation_iau2000a_data.rs"

src = open(SRC_PATH).read()

def block(name_start, name_end):
    i = src.index(name_start)
    j = src.index(name_end, i)
    return src[i:j]

def rows(segment):
    # all {...} groups
    return re.findall(r"\{([^{}]*)\}", segment)

def nums(group):
    parts = [p.strip() for p in group.split(",") if p.strip() != ""]
    return parts

ls_seg = block("} xls[] = {", "const int NLS")
pl_seg = block("} xpl[] = {", "const int NPL")

ls = rows(ls_seg)
pl = rows(pl_seg)
assert len(ls) == 678, f"xls rows = {len(ls)} (want 678)"
assert len(pl) == 687, f"xpl rows = {len(pl)} (want 687)"

out = []
out.append("// SPDX-License-Identifier: Apache-2.0")
out.append("//! IAU 2000A nutation series (MHB2000) — AUTO-GENERATED from the IAU SOFA /")
out.append("//! ERFA `nut00a.c` reference tables by `tools/gen_nut00a.py`; do not edit by hand.")
out.append("//! 678 luni-solar terms + 687 planetary terms. The values are IAU reference data.")
out.append("")
out.append("/// One luni-solar term: Delaunay multipliers (l, l', F, D, Om) and the")
out.append("/// (ps, pst, pc, ec, ect, es) coefficients in 0.1 microarcsecond units.")
out.append("pub type Ls2000a = (i8, i8, i8, i8, i8, f64, f64, f64, f64, f64, f64);")
out.append("/// One planetary term: 13 multipliers (l, F, D, Om, Me, Ve, Ea, Ma, Ju, Sa,")
out.append("/// Ur, Ne, pa) and the (sp, cp, se, ce) coefficients in 0.1 microarcsecond units.")
out.append("#[rustfmt::skip]")
out.append("pub type Pl2000a = (i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, i8, f64, f64, f64, f64);")
out.append("")
out.append(f"/// IAU 2000A luni-solar nutation series ({len(ls)} terms).")
out.append("#[rustfmt::skip]")
out.append(f"pub static LS_2000A: [Ls2000a; {len(ls)}] = [")
for g in ls:
    p = nums(g)
    assert len(p) == 11, f"ls row has {len(p)} fields: {g}"
    ints = ", ".join(p[:5])
    flts = ", ".join(f"{float(x)}" for x in p[5:])
    out.append(f"    ({ints}, {flts}),")
out.append("];")
out.append("")
out.append(f"/// IAU 2000A planetary nutation series ({len(pl)} terms).")
out.append("#[rustfmt::skip]")
out.append(f"pub static PL_2000A: [Pl2000a; {len(pl)}] = [")
for g in pl:
    p = nums(g)
    assert len(p) == 17, f"pl row has {len(p)} fields: {g}"
    ints = ", ".join(p[:13])
    flts = ", ".join(f"{float(x)}" for x in p[13:])
    out.append(f"    ({ints}, {flts}),")
out.append("];")
out.append("")

open(OUT_PATH, "w").write("\n".join(out))
print(f"OK: {len(ls)} luni-solar + {len(pl)} planetary terms written")
