#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Two independent readers of Kshana's lunar CCSDS OEM export.

Reader 1: oem 0.4.5 (MIT, https://pypi.org/project/oem/).
Reader 2: Orekit 12.2 (Apache-2.0) OemParser, strict defaults, via OrekitOemReader.java.

Inputs are the Kshana-written files committed under
tests/fixtures/lunar_interoperability_export/ (the existing test requires them to be
byte-identical to today's export). Writes two_reader_output.txt beside this script.

Pre-registered tolerances (fixed before the first comparison): tokens exact; epochs to
1 microsecond; position 5e-7 km, velocity 5e-10 km/s against Kshana's in-memory state,
in EACH reader. A reader that refuses a file fails the comparison.

    source "$KSHANA_ORACLES/env.sh"
    $ORACLE_PY tests/fixtures/lunar_interop_oem_oracle/generate_lunar_interop_oem_oracle.py
"""

import hashlib
import os
import pathlib
import subprocess
import tempfile
import warnings
from importlib.metadata import version

from oem import OrbitEphemerisMessage

HERE = pathlib.Path(__file__).resolve().parent
SRC = HERE.parent / "lunar_interoperability_export"
FILES = ["kshana_lunar_moon_me_ltc.oem", "kshana_lunar_moon_pa_tcl.oem"]


def oem_reader(path):
    lines = []
    try:
        with warnings.catch_warnings(record=True) as caught:
            warnings.simplefilter("always")
            msg = OrbitEphemerisMessage.open(str(path))
            list(msg.segments[0].states)
    except Exception as e:  # the refusal is the result
        return [f"FILE {path.name} REFUSED {type(e).__name__}: {e}"]
    lines.append(f"FILE {path.name} DECODED")
    for w in sorted({str(w.message) for w in caught}):
        lines.append(f"WARNING {path.name} {w}")
    lines.append(f"HEADER {path.name} | {msg.version} | {msg.header['ORIGINATOR']}")
    for seg in msg.segments:
        md = seg.metadata
        lines.append(
            "META %s | %s | %s | %s | %s | %s | %s | %s"
            % (path.name, md["OBJECT_NAME"], md["OBJECT_ID"], md["CENTER_NAME"], md["REF_FRAME"],
               md["TIME_SYSTEM"], md["START_TIME"], md["STOP_TIME"])
        )
        states = list(seg.states)
        t0 = states[0].epoch
        for st in states:
            dt = st.epoch - t0
            dt = dt.total_seconds() if hasattr(dt, "total_seconds") else float(dt)
            p, v = st.position, st.velocity
            lines.append(
                "STATE %s t+%.6f %s" % (path.name, dt, " ".join("%.17e" % x for x in list(p) + list(v)))
            )
    return lines


def orekit_reader(paths):
    cp = os.environ["OREKIT_CP"]
    with tempfile.TemporaryDirectory(dir=os.environ.get("KSHANA_SCRATCH")) as td:
        subprocess.run(["javac", "-cp", cp, "-d", td, str(HERE / "OrekitOemReader.java")], check=True)
        out = subprocess.run(
            ["java", "-cp", f"{cp}:{td}", "OrekitOemReader", os.environ["OREKIT_DATA"]]
            + [str(p) for p in paths],
            check=True, capture_output=True, text=True,
        ).stdout
    return out.splitlines()


def main():
    paths = [SRC / f for f in FILES]
    out = [
        "# Two independent readers of Kshana's lunar OEM export (generator: generate_lunar_interop_oem_oracle.py)",
        f"# reader oem {version('oem')} (MIT); reader Orekit 12.2 (Apache-2.0) OemParser, default strict settings",
    ]
    for p in paths:
        out.append(f"# input {p.name} sha256 {hashlib.sha256(p.read_bytes()).hexdigest()}")
    out.append("[reader oem]")
    for p in paths:
        out += oem_reader(p)
    out.append("[reader orekit]")
    out += orekit_reader(paths)
    (HERE / "two_reader_output.txt").write_text("\n".join(out) + "\n")
    print("\n".join(l for l in out if l.startswith(("FILE", "#"))))


if __name__ == "__main__":
    main()
