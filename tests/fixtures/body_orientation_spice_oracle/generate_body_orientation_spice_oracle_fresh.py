#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""SPICE reference at the fresh epochs of docs/design/evidence/mr08-body-orientation/PREREGISTRATION.md.

Imports generate_body_orientation_spice_oracle.py unmodified and changes only its epoch grid and
output directory (fresh/ beside this script). Calls no Kshana code.

Epochs (fixed in the pre-registration): et_k = (k - 20) * 61 000 003.25 s + 1 000 000.125 s past
J2000 TDB, k = 0..40.

    source "$KSHANA_ORACLES/env.sh"
    $ORACLE_PY tests/fixtures/body_orientation_spice_oracle/generate_body_orientation_spice_oracle_fresh.py
"""
import pathlib
import sys

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import generate_body_orientation_spice_oracle as base  # noqa: E402

base.HERE = HERE / "fresh"
base.EPOCHS = [(k - 20) * 61_000_003.25 + 1_000_000.125 for k in range(41)]

if __name__ == "__main__":
    base.HERE.mkdir(exist_ok=True)
    base.main()
