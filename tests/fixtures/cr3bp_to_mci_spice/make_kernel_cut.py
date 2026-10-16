#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Cut de440s.bsp to 2024-12-31..2025-01-30 for tests/cr3bp_to_mci_spice_oracle.rs.

The engine side of the RM-34 comparison reads the Moon wrt the Earth from this cut.
Reuses, unchanged, the bit-for-bit cutting, DAF writing and SPICE checks of
tests/fixtures/llr_datum_kernel_moon/make_kernel_cut.py; only the window and output file differ.
Calls no Kshana code.

    $ORACLE_PY tests/fixtures/cr3bp_to_mci_spice/make_kernel_cut.py
"""
import pathlib
import sys

import spiceypy as sp

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "llr_datum_kernel_moon"))
import make_kernel_cut as base  # noqa: E402

base.OUT = HERE / "de440s_2024-12-31_2025-01-30.bsp"
_str2et = sp.str2et
WINDOW = {"2015-04-06 00:00:00 UTC": "2024-12-31 00:00:00 UTC",
          "2015-06-30 00:00:00 UTC": "2025-01-30 00:00:00 UTC"}
base.sp.str2et = lambda s: _str2et(WINDOW.get(s, s))

if __name__ == "__main__":
    base.main()
