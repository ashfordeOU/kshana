#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Extract the Pc2D_Foster test cases of NASA's CARA Analysis Tools into a JSON file for the opt-in
test `tests/orbit_data_pc.rs::cara_pc2d_foster_cases` (run it with KSHANA_CARA_PC_CASES=<the JSON>).

The CARA Analysis Tools (https://github.com/nasa/CARA_Analysis_Tools) are distributed under the
NASA Open Source Agreement; their test data are not copied into this repository. Clone them
yourself and run this script on the clone:

    git clone --depth 1 https://github.com/nasa/CARA_Analysis_Tools cara
    python3 -m venv /tmp/v && /tmp/v/bin/pip install xlrd==2.0.1
    /tmp/v/bin/python extract_cara_pc_cases.py cara > cara_pc_cases.json

Read from the clone:
  * DistributedMatlab/ProbabilityOfCollision/UnitTests/Pc2D_Foster_UnitTest.m: the hard-body
    radii and expected Pc of the eleven Alfano (2009) cases and the inputs and expected Pc of the
    Omitron circular case;
  * DataFiles/AlfanoInputData/Alfano_2009_Test_Cases/Case<n> data at TCA.xls: the two objects'
    ECI states (m, m/s) and covariances (m, s) at TCA for those cases.
The test compares with the unit test's own relative tolerance (1e-3).
"""

import json
import pathlib
import re
import sys

import xlrd


def numbers(text):
    return [float(x) for x in re.findall(r"[-+]?\d+\.?\d*(?:[eE][-+]?\d+)?", text)]


def cell_list(src, name):
    m = re.search(name + r"\s*=\s*\{(.*?)\};", src, re.S)
    return numbers(m.group(1).replace("...", " "))


def matrix(src, name):
    m = re.search(name + r"\s*=\s*\{\[(.*?)\]\};", src, re.S)
    return numbers(m.group(1))


def xls_case(path):
    sh = xlrd.open_workbook(str(path)).sheet_by_index(0)
    rows = [[sh.cell_value(r, c) for c in range(sh.ncols)] for r in range(sh.nrows)]
    nums = [[v for v in row if isinstance(v, float)] for row in rows]
    nums = [n for n in nums if n]
    # Primary position, velocity, 6x6 covariance; then the same for the secondary.
    p1, v1, c1 = nums[0], nums[1], nums[2:8]
    p2, v2, c2 = nums[8], nums[9], nums[10:16]
    pos3 = lambda c: [row[:3] for row in c[:3]]
    return {"r1_m": p1, "v1_m_s": v1, "c1_m2": pos3(c1), "r2_m": p2, "v2_m_s": v2, "c2_m2": pos3(c2)}


def main():
    root = pathlib.Path(sys.argv[1])
    ut = (root / "DistributedMatlab/ProbabilityOfCollision/UnitTests/Pc2D_Foster_UnitTest.m").read_text()
    hbr = cell_list(ut, "AlfanoHBR")
    exp = cell_list(ut, "AlfanoExpSolution")
    files = re.findall(r"'(\d\d)'", re.search(r"AlfanoFileNum\s*=\s*\{(.*?)\};", ut, re.S).group(1))
    cases = []
    for h, e, f in zip(hbr, exp, files):
        n = int(f)
        c = xls_case(root / f"DataFiles/AlfanoInputData/Alfano_2009_Test_Cases/Case{n} data at TCA.xls")
        c.update({"id": f"alfano-2009-case-{n}", "hbr_m": h, "expected_pc": e})
        cases.append(c)
    om = re.search(r"expSolution = ([0-9.e+-]+);\s*Accuracy = 0.001;\s*Tol = 1e-09;\s*HBRType = 'circle';", ut)
    r1, v1, r2, v2 = (numbers(re.search(n + r"\s*=\s*\{\[(.*?)\]\};", ut, re.S).group(1)) for n in ("r1", "v1", "r2", "v2"))
    c1, c2 = matrix(ut, "cov1"), matrix(ut, "cov2")
    cases.append({
        "id": "omitron-01-circle", "hbr_m": cell_list(ut, "OmitronHBR")[0], "expected_pc": float(om.group(1)),
        "r1_m": r1, "v1_m_s": v1, "c1_m2": [c1[0:3], c1[3:6], c1[6:9]],
        "r2_m": r2, "v2_m_s": v2, "c2_m2": [c2[0:3], c2[3:6], c2[6:9]],
    })
    json.dump({"source": "NASA CARA Analysis Tools, Pc2D_Foster_UnitTest.m and the Alfano 2009 test cases",
               "rel_tol": 1e-3, "cases": cases}, sys.stdout, indent=1)
    print()


if __name__ == "__main__":
    main()
