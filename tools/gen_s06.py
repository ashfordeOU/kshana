#!/usr/bin/env python3
"""Generate the Rust IAU 2006 CIO-locator (s) series from the ERFA s06.c reference.

The numerical series are IAU reference data (not copyrightable); ERFA is the
BSD-licensed clean-room of SOFA. Emits the polynomial + five term arrays.

Usage:
    curl -fsSLO https://raw.githubusercontent.com/liberfa/erfa/master/src/s06.c
    python3 tools/gen_s06.py s06.c src/cio_s06_data.rs
"""
import re
import sys

SRC = sys.argv[1] if len(sys.argv) > 1 else "s06.c"
OUT = sys.argv[2] if len(sys.argv) > 2 else "src/cio_s06_data.rs"

src = open(SRC).read()

# Polynomial sp[] (6 coefficients).
sp_block = src[src.index("static const double sp[]"):]
sp_block = sp_block[: sp_block.index("}")]
sp = re.findall(r"(-?\d+\.\d+e-6)", sp_block)
assert len(sp) == 6, f"sp has {len(sp)} (want 6)"

TERM = re.compile(
    r"\{\{\s*([-\d,\s]+?)\}\s*,\s*(-?\d+\.\d+e-6)\s*,\s*(-?\d+\.\d+e-6)\s*\}"
)


def terms(name, expect):
    seg = src[src.index(f"TERM {name}[]"):]
    seg = seg[: seg.index("};")]
    rows = TERM.findall(seg)
    assert len(rows) == expect, f"{name}: {len(rows)} rows (want {expect})"
    out = []
    for mult, s, c in rows:
        nfa = [x.strip() for x in mult.split(",") if x.strip() != ""]
        assert len(nfa) == 8, f"{name}: {len(nfa)} multipliers"
        out.append((nfa, s, c))
    return out


tables = {
    "S06_0": terms("s0", 33),
    "S06_1": terms("s1", 3),
    "S06_2": terms("s2", 25),
    "S06_3": terms("s3", 4),
    "S06_4": terms("s4", 1),
}

L = []
L.append("// SPDX-License-Identifier: Apache-2.0")
L.append("//! IAU 2006 CIO-locator (s) series — AUTO-GENERATED from the IAU SOFA / ERFA")
L.append("//! `s06.c` reference by `tools/gen_s06.py`; do not edit by hand. The values are")
L.append("//! IAU reference data. Coefficients are in arc-seconds (the `e-6` = micro-arcsec).")
L.append("")
L.append("/// One term of the s+XY/2 series: eight fundamental-argument multipliers")
L.append("/// `(l, l', F, D, Ω, L_Ve, L_E, pA)` and the sine/cosine coefficients (arcsec).")
L.append("pub type S06Term = ([i8; 8], f64, f64);")
L.append("")
L.append("/// Polynomial coefficients of s+XY/2 (arcsec), ascending powers of t.")
L.append("pub const SP06: [f64; 6] = [" + ", ".join(sp) + "];")
for name, rows in tables.items():
    order = name.split("_")[1]
    L.append("")
    L.append(f"/// s+XY/2 terms of order t^{order} ({len(rows)} terms).")
    L.append("#[rustfmt::skip]")
    L.append(f"pub static {name}: [S06Term; {len(rows)}] = [")
    for nfa, s, c in rows:
        L.append(f"    ([{', '.join(nfa)}], {s}, {c}),")
    L.append("];")
L.append("")

open(OUT, "w").write("\n".join(L))
print(f"OK: sp[6] + {sum(len(r) for r in tables.values())} terms written to {OUT}")
