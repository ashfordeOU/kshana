# SPDX-License-Identifier: AGPL-3.0-only
"""CAP-06 (a), finding behind the A3 MVDR jammer-gain miss (written after the run, disclosed).

Recomputes the MVDR jammer gain of every link twice in numpy, once with `inv(R)` and once with
`solve(R, a_sv)`, and prints how many links the two disagree on by more than 1e-9 dB and the
worst disagreement. Usage: python3 -I conditioning.py inputs.json
"""
import json
import sys

import numpy as np

d = json.load(open(sys.argv[1]))
p = np.array(d["elements_enu_m"])
k = 2 * np.pi / d["lambda_m"]


def steer(u):
    return np.exp(1j * k * (p @ np.array(u)))


a_j = steer(d["jammer_unit_enu"])
r = np.eye(len(p)) + d["jnr_linear"] * np.outer(a_j, a_j.conj())
r_inv = np.linalg.inv(r)
worst, over = 0.0, 0
for link in d["links"]:
    a = steer(link["sv_unit_enu"])
    gains = []
    for y in (r_inv @ a, np.linalg.solve(r, a)):
        w = y / (a.conj() @ y)
        gains.append(10 * np.log10(abs(w.conj() @ a_j) ** 2))
    diff = abs(gains[0] - gains[1])
    worst, over = max(worst, diff), over + (diff > 1e-9)
print(f"links {len(d['links'])}, inv vs solve over 1e-9 dB: {over}, worst {worst:.3e} dB")
