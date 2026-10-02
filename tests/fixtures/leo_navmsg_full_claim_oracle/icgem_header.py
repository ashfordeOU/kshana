#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Rewrite tools/egm2008_to70.gfc with a header Orekit's strict ICGEM reader accepts.

Format only: the '#' comment lines are dropped, the keywords product_type, modelname and errors
the ICGEM format specifies are added, and Fortran 'd' exponents become 'e'. No coefficient is
changed. Usage: icgem_header.py tools/egm2008_to70.gfc OUTDIR/egm2008_to70.gfc
"""
import sys

src, dst = sys.argv[1], sys.argv[2]
out = ["product_type gravity_field", "modelname EGM2008", "errors no"]
for ln in open(src):
    if ln.startswith("#"):
        continue
    out.append(ln.rstrip("\n").replace("d0", "e0") if ln.startswith("gfc") else ln.rstrip("\n"))
open(dst, "w").write("\n".join(out) + "\n")
