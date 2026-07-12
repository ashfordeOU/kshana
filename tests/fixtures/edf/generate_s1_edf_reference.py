#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the external-oracle EDF reference fixture for
tests/uncertainty_edf_reference.rs.

INDEPENDENT ORACLE
------------------
allantools (https://github.com/aewallin/allantools), the de-facto open-source
frequency-stability library, is used as a genuinely independent second
implementation of the Equivalent Degrees of Freedom (EDF) for the
Allan-variance family. The functions exercised here are:

  * allantools.ci.edf_greenhall(alpha, d, m, N, overlapping, modified)
        the Greenhall & Riley (2003 PTTI / 2004) *combined-EDF* basis-function
        algorithm.  This is NOT a closed form: it evaluates the sw/sx/sz weight
        kernels (Eqns 7-9) and BasicSum (Eqn 10) of the paper.  It is a
        different algorithm from the NIST SP 1065 Table-5 simple approximations
        that kshana already had for the Allan variance.
        - Modified Allan (MVAR): d=2, modified=True, overlapping=True
        - Overlapping Hadamard (HVAR): d=3, modified=False, overlapping=True
  * allantools.ci.edf_totdev(N, m, alpha)
        Total-variance EDF from NIST SP 1065 Table 7 (b*(N/m) - c).

allantools is itself validated against Stable32 (the commercial reference
implementation), so agreement between kshana and allantools here is a real
cross-implementation check, not a self-comparison.

The kshana module under test (src/assurance/uncertainty.rs) contains its own,
independently written port of the Greenhall algorithm and the Table-7 form; it
does NOT call allantools.  This script only *emits committed reference values*.

REGENERABLE OFFLINE: needs only numpy + scipy + allantools from the local
Python user site; no network access.
"""

import json
import os
import sys

import allantools
import allantools.ci as ci

# ---------------------------------------------------------------------------
# Grid of (VarType, NoiseType/alpha, N, m).  Every point below lands in a
# closed / direct-sum Greenhall case (J <= 100) or the Table-7 TOTVAR form,
# which is exactly the regime the kshana port implements.
# ---------------------------------------------------------------------------

# alpha exponents matching kshana's NoiseType.
NOISES = {
    "WhitePM": 2,
    "FlickerPM": 1,
    "WhiteFM": 0,
    "FlickerFM": -1,
    "RandomWalkFM": -2,
}

# (N, m) sample points.
NM = [(1000, 10), (500, 5), (256, 4), (64, 2)]


def mvar_edf(alpha, m, n):
    # Modified Allan variance: d=2, modified filter, overlapping estimator.
    return float(ci.edf_greenhall(alpha, 2, m, n, overlapping=True, modified=True))


def hvar_edf(alpha, m, n):
    # Overlapping Hadamard variance: d=3, unmodified filter, overlapping.
    return float(ci.edf_greenhall(alpha, 3, m, n, overlapping=True, modified=False))


def totvar_edf(alpha, m, n):
    # Total variance: NIST SP 1065 Table 7 (b*(N/m) - c) for FM noises.
    # For PM noises (alpha in {1, 2}) allantools' edf_totdev routes to
    # edf_simple; kshana falls back to its Table-5 Allan EDF for the same
    # inputs, so those points are emitted from edf_totdev too and must match.
    return float(ci.edf_totdev(n, m, alpha))


def main():
    cases = []
    for var, fn in (("Modified", mvar_edf), ("Hadamard", hvar_edf), ("Total", totvar_edf)):
        for noise, alpha in NOISES.items():
            for (n, m) in NM:
                edf = fn(alpha, m, n)
                if not (edf == edf) or edf <= 0.0:  # NaN or non-physical
                    # Skip inputs the oracle itself declines (should not occur
                    # on this grid); keep the fixture to physically sensible
                    # positive EDFs only.
                    continue
                cases.append(
                    {
                        "var": var,
                        "noise": noise,
                        "alpha": alpha,
                        "n": n,
                        "m": m,
                        "edf": edf,
                    }
                )

    out = {
        "_provenance": {
            "tool": "allantools",
            "version": allantools.__version__,
            "functions": [
                "allantools.ci.edf_greenhall (Greenhall & Riley 2003/2004 combined EDF)",
                "allantools.ci.edf_totdev (NIST SP 1065 Table 7)",
            ],
            "note": (
                "Independent oracle for kshana::assurance::uncertainty::edf. "
                "allantools is validated against Stable32. Regenerable offline "
                "with: python3 generate_s1_edf_reference.py"
            ),
            "description": (
                "EDF of the modified-Allan (MVAR), overlapping-Hadamard (HVAR), "
                "and total (TOTVAR) variance estimators over a "
                "(VarType, NoiseType, N, m) grid."
            ),
        },
        "cases": cases,
    }

    here = os.path.dirname(os.path.abspath(__file__))
    path = os.path.join(here, "edf_reference.json")
    with open(path, "w", encoding="utf-8") as fh:
        json.dump(out, fh, indent=2, sort_keys=True)
        fh.write("\n")

    # Sanity print to stderr so the human can eyeball physical plausibility.
    print(f"wrote {len(cases)} EDF reference cases to {path}", file=sys.stderr)
    for c in cases:
        # EDF should be positive and on the order of N/m up to a few times it.
        ratio = c["edf"] / (c["n"] / c["m"])
        assert c["edf"] > 0.0, c
        assert 0.05 < ratio < 5.0, ("EDF/(N/m) out of sane range", c, ratio)
        print(
            f"  {c['var']:>8} {c['noise']:>12} N={c['n']:>4} m={c['m']:>2} "
            f"edf={c['edf']:.6f} (edf/(N/m)={ratio:.3f})",
            file=sys.stderr,
        )


if __name__ == "__main__":
    main()
