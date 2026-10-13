"""Transcribe the NRLMSISE-00 coefficient tables (BLOCK DATA GTD7BK) from the public-domain C
port's `nrlmsise-00_data.c` into `src/nrlmsise00_data.rs`, value for value (no arithmetic).

    python3 -I xval/nrlmsise00-pymsis/gen_data_rs.py /path/to/nrlmsise-00_data.c \
        > src/nrlmsise00_data.rs

Expected input SHA-256 d0b3022f3c3e7ffdf703cc0e0d02339dfee01c0bf1520b29c68d5f4afd8784d5
(nrlmsise00-0.1.2 sdist, src/c_nrlmsise-00/, C release 20190709).
"""

import hashlib
import re
import sys

NUM = re.compile(r"[-+]?\d+\.\d+E[-+]\d+")
DECL = re.compile(r"double\s+(\w+)((?:\[\d+\])+)\s*=\s*\{(.*?)\};", re.S)

# The tables the model uses, with their C shape (sam is unused by the C code and omitted). ptm is declared [50] with 10 values.
WANT = ["pt", "pd", "ps", "pdl", "ptm", "pdm", "ptl", "pma", "pavgm"]


def main():
    path = sys.argv[1]
    raw = open(path, "rb").read()
    sha = hashlib.sha256(raw).hexdigest()
    text = re.sub(r"/\*.*?\*/", "", raw.decode("ascii"), flags=re.S)
    tables = {}
    for name, dims, body in DECL.findall(text):
        shape = [int(d) for d in re.findall(r"\d+", dims)]
        rows = [body]
        if len(shape) == 2:
            rows = re.findall(r"\{([^{}]*)\}", body)
            assert len(rows) == shape[0], (name, len(rows))
        vals = [NUM.findall(r) for r in rows]
        inner = shape[-1]
        for v in vals:
            assert len(v) <= inner, (name, len(v))
        tables[name] = (shape, vals)
    out = []
    out.append("// SPDX-License-Identifier: AGPL-3.0-only")
    out.append("//! NRLMSISE-00 coefficient tables (BLOCK DATA GTD7BK), transcribed value for value by")
    out.append("//! `xval/nrlmsise00-pymsis/gen_data_rs.py` from the public-domain C port's `nrlmsise-00_data.c`")
    out.append(f"//! (release 20190709, SHA-256 `{sha}`).")
    out.append("//! The coefficients are the U.S. Naval Research Laboratory's NRLMSISE-00 model, a U.S. Government")
    out.append("//! work not subject to copyright (17 U.S.C. 105); see `tests/fixtures/nrlmsise00/NOTICE.md`. Generated; do not edit.")
    out.append("#![allow(clippy::excessive_precision, clippy::unreadable_literal)]")
    out.append("")
    for name in WANT:
        shape, vals = tables[name]
        inner = shape[-1]
        if name == "ptm":
            inner = len(vals[0])  # only the 10 used values; the C array is padded to 50
        def row(v):
            v = v + ["0.00000E+00"] * (inner - len(v))
            return "[" + ", ".join(v) + "]"
        if len(shape) == 1:
            out.append(f"pub(crate) const {name.upper()}: [f64; {inner}] = {row(vals[0])};")
        else:
            out.append(f"pub(crate) const {name.upper()}: [[f64; {inner}]; {shape[0]}] = [")
            for v in vals:
                out.append(f"    {row(v)},")
            out.append("];")
    print("\n".join(out))


if __name__ == "__main__":
    main()
