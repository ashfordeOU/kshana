#!/usr/bin/env python3
"""Generate the Rust EGM2008 geopotential table from the committed ICGEM .gfc subset.

The EGM2008 spherical-harmonic coefficients are an NGA public-domain product. The
committed `tools/egm2008_to70.gfc` is the degree/order <= 70 block, extracted by
streaming the full d/o-2190 model from ICGEM (icgem.gfz-potsdam.de). This script
parses it into `src/egm2008_data.rs` as fully-normalized, tide-free coefficients.

Re-running it on the same input reproduces the committed file byte-for-byte (the
same contract as gen_nut00a.py / gen_igrf.py); CI can assert that.

Usage:
    python3 tools/gen_egm2008.py tools/egm2008_to70.gfc src/egm2008_data.rs
"""
import sys

SRC = sys.argv[1] if len(sys.argv) > 1 else "tools/egm2008_to70.gfc"
OUT = sys.argv[2] if len(sys.argv) > 2 else "src/egm2008_data.rs"


def fortran_float(tok: str) -> float:
    # ICGEM gfc values may use Fortran 'd'/'D' exponent markers (e.g. 1.0d0).
    return float(tok.replace("d", "e").replace("D", "e"))


def fmt(x: float) -> str:
    # Round-trippable, compact. repr() gives the shortest exact decimal in Py3.
    s = repr(x)
    if "e" not in s and "E" not in s and "." not in s and "inf" not in s and "nan" not in s:
        s += ".0"
    return s


gm = re = None
nmax = 0
coeffs = []  # (n, m, C, S)
in_body = False
for line in open(SRC):
    p = line.split()
    if not p:
        continue
    if p[0] == "earth_gravity_constant":
        gm = fortran_float(p[1])
    elif p[0] == "radius":
        re = fortran_float(p[1])
    elif p[0] == "end_of_head":
        in_body = True
    elif p[0] == "gfc":
        n, m = int(p[1]), int(p[2])
        c, s = fortran_float(p[3]), fortran_float(p[4])
        nmax = max(nmax, n)
        coeffs.append((n, m, c, s))

assert gm and re, "missing GM/radius header"
assert coeffs, "no gfc coefficient lines parsed"
# Sanity: the canonical EGM2008 C20 (unnormalized J2-equivalent) is ~-4.8417e-4.
c20 = next(c for (n, m, c, s) in coeffs if n == 2 and m == 0)
assert abs(c20 - (-0.484165143790815e-03)) < 1e-12, f"unexpected C20 {c20}"

with open(OUT, "w") as f:
    f.write("// SPDX-License-Identifier: Apache-2.0\n")
    f.write("//! EGM2008 geopotential spherical-harmonic coefficients to degree/order 70 —\n")
    f.write("//! AUTO-GENERATED from `tools/egm2008_to70.gfc` by `tools/gen_egm2008.py`; do not\n")
    f.write("//! edit by hand. Fully normalized, tide-free. The EGM2008 model is an NGA\n")
    f.write("//! public-domain product (via ICGEM). `EGM2008_COEFFS` are `(n, m, Cnm, Snm)`.\n\n")
    f.write("/// Gravitational parameter GM of the EGM2008 model (m^3/s^2).\n")
    f.write(f"pub const EGM2008_GM: f64 = {fmt(gm)};\n")
    f.write("/// Reference radius of the EGM2008 model (m).\n")
    f.write(f"pub const EGM2008_RE: f64 = {fmt(re)};\n")
    f.write("/// Maximum spherical-harmonic degree/order of the shipped EGM2008 block.\n")
    f.write(f"pub const EGM2008_NMAX: usize = {nmax};\n\n")
    f.write("/// `(degree, order, C_nm, S_nm)` fully-normalized tide-free coefficients.\n")
    f.write(f"pub static EGM2008_COEFFS: [(u16, u16, f64, f64); {len(coeffs)}] = [\n")
    for (n, m, c, s) in coeffs:
        f.write(f"    ({n}, {m}, {fmt(c)}, {fmt(s)}),\n")
    f.write("];\n")

print(f"wrote {OUT}: GM={gm} Re={re} nmax={nmax} coeffs={len(coeffs)}")
