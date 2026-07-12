#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate an external-oracle reference for kshana's CCSDS 502.0 OEM COVARIANCE
block interchange.

The oracle is **oem** (Brad Sease <bradsease@gmail.com>, MIT) — an independent,
third-party, astropy-backed implementation of the CCSDS 502.0-B Orbit Ephemeris
Message standard (https://pypi.org/project/oem/, version 0.4.5 here). It is a
*completely separate codebase* from kshana's `src/oem.rs`: its own KVN tokenizer
(`oem/parsers.py::parse_kvn_oem`), its own covariance-section state machine, and
its own lower-triangular → symmetric-6x6 reconstruction
(`oem/components/types.py::Covariance._from_raw_data`). This is the SAME library
already trusted by the Validated "CCSDS OEM interoperability" row.

WHAT IS VALIDATED (the uniquely-defined quantity compared):
  kshana's `covariance_block_kvn` serialises a 6x6 position/velocity covariance as
  the CCSDS 502.0 UNLABELLED lower-triangular KVN block (bare numbers, one matrix
  row per line, 21 entries). We embed that block — emitted by kshana — inside a
  full valid OEM 2.0 segment (`tests/fixtures/ccsds_cov/kshana_cov_leo.oem`, frozen
  kshana output) and let the independent `oem` library parse it and RECONSTRUCT the
  symmetric 6x6 matrix. This script records that oem-reconstructed matrix. The Rust
  test then asserts oem's reconstruction equals kshana's INPUT covariance
  element-for-element (to f64 round-off). The comparison is oracle-vs-kshana-input,
  NOT a re-parse by kshana's own reader — a genuine external interchange check.

KEY INTEROP FACTS (verified while building this, recorded below):
  1. The `oem` library's KVN parser parses a covariance ONLY inside a segment
     (Section.DATA → COVARIANCE_START…COVARIANCE_STOP); a bare block outside a
     segment is never reached. Hence the block is embedded in a real segment.
  2. The `oem` library's KVN parser ACCEPTS the bare-number lower-triangular form
     (the exact layout kshana emits) and REJECTS the labelled `CX_X = …` variant
     with "Invalid covariance header" — so kshana's unlabelled layout is precisely
     the form this independent parser needs. (Recorded as the NEGCTL line.)
  3. `oem` reconstructs the full symmetric 6x6 from the 21 lower-triangular values
     in canonical row-major order (CX_X; CY_X CY_Y; CZ_X CZ_Y CZ_Z; …), matching
     CCSDS 502.0 §, so the reconstructed matrix is directly comparable to kshana's
     input matrix.

HONEST SCOPE: this validates the CCSDS-502 covariance-block KVN INTERCHANGE
round-trip (kshana emit → independent oem parse → symmetric-matrix reconstruct).
It does NOT validate the numerical CONTENT of any particular covariance (that is a
filter/OD question handled by other rows) — only that the standard wire format is
emitted such that an independent CCSDS-502 reader reconstructs the identical matrix.

This generator imports ONLY the oracle (oem + numpy) plus a frozen kshana fixture
file; it never imports or calls kshana. The Rust test independently re-emits the
same fixture bytes from kshana's own `covariance_block_kvn` and asserts byte
identity, binding these oracle values to kshana's current serialiser.

Reproduce (offline, no kshana code involved):

    python3 -m pip install --user oem numpy    # oem 0.4.5, MIT
    python3 tests/fixtures/ccsds_cov/generate_p5_ccsds_cov_reference.py \
        > tests/fixtures/ccsds_cov/p5_ccsds_cov_reference.txt

Regenerable offline. Generated with the oem library (Brad Sease, MIT) + numpy.
"""

import os
import sys
import tempfile
import warnings

import numpy as np
from oem import OrbitEphemerisMessage

warnings.filterwarnings("ignore")  # astropy/erfa far-future-epoch warnings are harmless

HERE = os.path.dirname(os.path.abspath(__file__))
FIXTURE = os.path.join(HERE, "kshana_cov_leo.oem")

# Canonical CCSDS 502.0 lower-triangular order (row-major): the 21 (row, col) index
# pairs the oem library reconstructs from, used here to serialise oem's matrix back
# out in the exact order the Rust test reads.
LOWER_TRI = [(i, j) for i in range(6) for j in range(i + 1)]

# The labelled `CX_X = …` covariance variant, embedded in a valid segment, that the
# oem library must REJECT — proving kshana's UNLABELLED bare-number layout is the
# form this independent parser requires (recorded as the NEGCTL line).
LABELLED_COV_OEM = """CCSDS_OEM_VERS = 2.0
CREATION_DATE = 2024-01-01T00:00:00.000000
ORIGINATOR = KSHANA

META_START
OBJECT_NAME = KSHANA-COV-LEO-1
OBJECT_ID = KSHANA-COV-LEO-1
CENTER_NAME = EARTH
REF_FRAME = EME2000
TIME_SYSTEM = UTC
START_TIME = 2024-01-01T00:00:00.000000
STOP_TIME = 2024-01-01T00:05:00.000000
META_STOP

2024-01-01T00:00:00.000000 7000.0 0.0 0.0 0.0 7.5 0.0
2024-01-01T00:05:00.000000 6900.0 100.0 0.0 -0.3 7.4 0.0

COVARIANCE_START
EPOCH = 2024-01-01T00:00:00.000000
COV_REF_FRAME = RTN
CX_X = 1.440000000000000e-04
CY_X = 3.600000000000000e-05 2.340000000000000e-04
CZ_X = -2.400000000000000e-05 5.400000000000000e-05 3.440000000000000e-04
COVARIANCE_STOP
"""


def try_parse_text(oem_text):
    """Parse OEM text with the oem library; return (ok, reason)."""
    with tempfile.NamedTemporaryFile("w", suffix=".oem", delete=False) as tf:
        tf.write(oem_text)
        path = tf.name
    try:
        eph = OrbitEphemerisMessage.open(path)
        segs = list(eph.segments)
        # Force the covariance state-machine to run.
        _ = [list(s.covariances) for s in segs]
        return True, "parsed"
    except Exception as ex:  # noqa: BLE001
        return False, f"{type(ex).__name__}: {ex}".replace("\n", " ").replace("|", "/")
    finally:
        os.unlink(path)


def main():
    print("# External-oracle reference for kshana's CCSDS 502.0 OEM COVARIANCE block.")
    print("# Oracle: the oem library (Brad Sease <bradsease@gmail.com>, MIT, v0.4.5) + numpy.")
    print("# Independent CCSDS 502.0-B OEM parser; separate codebase from src/oem.rs.")
    print("# Consumed by tests/ccsds_oem_covariance_reference.rs.")
    print("# See generate_p5_ccsds_cov_reference.py for provenance/scope/findings.")
    print("# Regenerable offline; kshana is never imported here.")
    print("#")
    print("# The frozen fixture kshana_cov_leo.oem carries kshana's covariance_block_kvn")
    print("# output (unlabelled lower-triangular 6x6) inside a full OEM 2.0 segment; the")
    print("# oem library parses it and reconstructs the symmetric 6x6 matrix recorded here.")
    print("#")
    print("# COVEPOCH | <epoch>          — the covariance block epoch oem read")
    print("# COVFRAME | <frame>          — the COV_REF_FRAME oem read")
    print("# COV <i> <j> | <value>       — oem-reconstructed matrix entry (row i, col j),")
    print("#                               21 lower-triangular entries in canonical order")
    print("# NEGCTL | <ACCEPTED|REJECTED> | <reason>  — oem's verdict on the LABELLED")
    print("#                               CX_X= variant (must be REJECTED: kshana's")
    print("#                               unlabelled layout is the form oem needs)")

    # --- Parse the frozen kshana fixture with the independent oem library ---
    if not os.path.exists(FIXTURE):
        print(f"# ERROR: fixture not found: {FIXTURE}", file=sys.stderr)
        sys.exit(1)
    eph = OrbitEphemerisMessage.open(FIXTURE)
    segs = list(eph.segments)
    if len(segs) != 1:
        print(f"# ERROR: expected 1 segment, got {len(segs)}", file=sys.stderr)
        sys.exit(1)
    seg = segs[0]
    covs = list(seg.covariances)
    if len(covs) != 1:
        print(f"# ERROR: expected 1 covariance, got {len(covs)}", file=sys.stderr)
        sys.exit(1)
    cov = covs[0]
    matrix = np.asarray(cov.matrix, dtype=float)
    if matrix.shape != (6, 6):
        print(f"# ERROR: covariance shape {matrix.shape} != (6, 6)", file=sys.stderr)
        sys.exit(1)

    # Physical-sanity: symmetric, positive-definite, sensible LEO-OD magnitudes.
    sym_err = float(np.max(np.abs(matrix - matrix.T)))
    eigmin = float(np.min(np.linalg.eigvalsh(matrix)))
    if sym_err > 1e-30:
        print(f"# WARNING: oem matrix not symmetric (max|M-M^T|={sym_err:.2e})", file=sys.stderr)
    if eigmin <= 0.0:
        print(f"# WARNING: oem matrix not positive-definite (min eig={eigmin:.2e})", file=sys.stderr)
    pos_sigmas_m = [float(np.sqrt(matrix[k][k])) * 1000.0 for k in range(3)]
    vel_sigmas_mm_s = [float(np.sqrt(matrix[k][k])) * 1e6 for k in range(3, 6)]
    print(f"# sanity: min-eigval = {eigmin:.6e}, max|M-M^T| = {sym_err:.2e}")
    print(
        "# sanity: position sigmas (m) = "
        + ", ".join(f"{x:.3f}" for x in pos_sigmas_m)
        + "; velocity sigmas (mm/s) = "
        + ", ".join(f"{x:.4f}" for x in vel_sigmas_mm_s)
    )

    print(f"COVEPOCH | {cov.epoch}")
    print(f"COVFRAME | {cov.frame}")
    for (i, j) in LOWER_TRI:
        print(f"COV {i} {j} | {repr(float(matrix[i][j]))}")

    # --- Negative control: oem must REJECT the labelled CX_X= variant ---
    ok, reason = try_parse_text(LABELLED_COV_OEM)
    verdict = "ACCEPTED" if ok else "REJECTED"
    print(f"NEGCTL | {verdict} | {reason}")
    if ok:
        print(
            "# WARNING: oem ACCEPTED the labelled CX_X= variant — expected REJECTED",
            file=sys.stderr,
        )


if __name__ == "__main__":
    main()
