#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Run the unchanged LLR datum SPICE + NumPy oracle on the fresh 2019 slice.

tests/fixtures/llr_datum_spice/gen_llr_datum_spice.py is imported unmodified; this wrapper only
points its input directory at a scratch directory holding the fresh normal points beside the
unchanged catalogues of tests/fixtures/lunar_llr/, and its output directory here. Calls no
Kshana code.

    $ORACLE_PY tests/fixtures/llr_datum_kernel_moon_fresh/run_oracle.py
"""
import os
import pathlib
import sys
import tempfile

HERE = pathlib.Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / "llr_datum_spice"))
import gen_llr_datum_spice as oracle  # noqa: E402

with tempfile.TemporaryDirectory() as tmp:
    cat = HERE.parent / "lunar_llr"
    for f in ("itrf2020_llr_stations.csv", "de430_retroreflectors_mer.csv"):
        os.symlink(cat / f, os.path.join(tmp, f))
    os.symlink(HERE / "normal_points", os.path.join(tmp, "normal_points"))
    oracle.LLR = tmp
    oracle.HERE = str(HERE)
    oracle.main()
