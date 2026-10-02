#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Cut NAIF's de440s.bsp to 2019-03-31..2019-07-02 for tests/validate_llr_datum_kernel_moon_fresh.rs.

Reuses, unchanged, the bit-for-bit cutting, DAF writing and SPICE checks of
tests/fixtures/llr_datum_kernel_moon/make_kernel_cut.py; only the window and output file differ.
Calls no Kshana code.

    $ORACLE_PY tests/fixtures/llr_datum_kernel_moon_fresh/make_kernel_cut.py
"""
import pathlib
import sys

import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "llr_datum_kernel_moon"))
import make_kernel_cut as base  # noqa: E402

base.OUT = HERE / "de440s_2019-03-31_2019-07-02.bsp"
_str2et = sp.str2et
WINDOW = {"2015-04-06 00:00:00 UTC": "2019-03-31 00:00:00 UTC",
          "2015-06-30 00:00:00 UTC": "2019-07-02 00:00:00 UTC"}
base.sp.str2et = lambda s: _str2et(WINDOW.get(s, s))

if __name__ == "__main__":
    base.main()
