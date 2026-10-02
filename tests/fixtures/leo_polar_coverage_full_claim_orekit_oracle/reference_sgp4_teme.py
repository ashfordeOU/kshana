# SPDX-License-Identifier: AGPL-3.0-only
"""Diagnostic for the M131 full-claim finding (tests/leo_polar_coverage_full_claim_orekit_oracle.rs).

Written AFTER the pre-registered Orekit comparison failed its position bar, to locate the gap; it
is not the pre-registered oracle and is not counted as one. Propagates every committed element
set with python-sgp4 2.24 (Brandon Rhodes' wrapper of D. Vallado's reference C++ SGP4, the code
behind the AIAA 2006-6753 verification vectors; MIT licence), WGS-72, improved mode 'i', and
writes the TEME positions (m) at the first and last epoch of each configuration.

Run from the repository root:
    ~/Code/kshana-oracles/.venv13/bin/python tests/fixtures/leo_polar_coverage_full_claim_orekit_oracle/reference_sgp4_teme.py
"""
import json
import sys
from pathlib import Path

import sgp4
from sgp4.api import WGS72, Satrec

DIR = Path(__file__).resolve().parent


def main():
    for cfg in ("A", "B"):
        inputs = json.load(open(DIR / f"inputs_{cfg}.json"))
        times = inputs["times_s"]
        picks = [(0, times[0]), (len(times) - 1, times[-1])]
        lines = [f"# python-sgp4 {sgp4.__version__} TEME position (m): epoch_index,satellite_index,x,y,z\n"]
        k = 0
        for row in open(DIR / f"elements_{cfg}.csv"):
            if row.startswith("#") or not row.strip():
                continue
            f = [float(x) for x in row.split(",")]
            day, frac = f[2], f[3]
            s = Satrec()
            s.sgp4init(WGS72, "i", k + 1, (day - 2433281.5) + frac, f[10], 0.0, 0.0,
                       f[5], f[8], f[6], f[9], f[4], f[7])
            for ei, t in picks:
                err, r, _ = s.sgp4(day, frac + t / 86400.0)
                if err:
                    sys.exit(f"sgp4 error {err} for satellite {k}")
                lines.append(f"{ei},{k},{r[0] * 1e3!r},{r[1] * 1e3!r},{r[2] * 1e3!r}\n")
            k += 1
        (DIR / f"reference_sgp4_teme_{cfg}.csv").write_text("".join(lines))
        print(f"config {cfg}: {k} satellites")


if __name__ == "__main__":
    main()
