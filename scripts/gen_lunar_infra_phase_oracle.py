#!/usr/bin/env python3
"""Independent numpy solve of the study-2 (carrier-phase) float design: bar Q3 of
xval/lunar-infra/PREREGISTRATION.md.  Reads the raw rows (epoch, nine partials, ambiguity pass,
weight) that kshana exports and redoes, with its own code, the reference-pass choice, the
connected component, the per-epoch weighted centring, the normal equations, the ambiguity
covariance, the covariance of the position given the integers and the bootstrapped success rate.

  python3 scripts/gen_lunar_infra_phase_oracle.py tests/fixtures/lunar_infra/phase_design.json \
      > tests/fixtures/lunar_infra/phase_oracle.json
"""
import json, sys
import numpy as np
from math import erf, sqrt

d = json.load(open(sys.argv[1]))
rows = d["rows"]
lam = d["lambda_m"]
n_pass = d["n_pass"]
length = np.zeros(n_pass, int)
for r in rows:
    if r["pass"] is not None:
        length[r["pass"]] += 1
ref = int(np.argmax(length))  # first maximum, as the longest pass
epochs = {}
for r in rows:
    if r["pass"] is not None:
        epochs.setdefault(r["epoch"], set()).add(r["pass"])
comp = {ref}
changed = True
while changed:
    changed = False
    for ps in epochs.values():
        if ps & comp and not ps <= comp:
            comp |= ps
            changed = True
cols = {}
for p in range(n_pass):
    if p in comp and p != ref:
        cols[p] = 9 + len(cols)
dim = 9 + len(cols)
A, W, E = [], [], []
for r in rows:
    if r["pass"] is not None and r["pass"] not in comp:
        continue
    a = np.zeros(dim)
    a[:9] = r["h"]
    if r["pass"] is not None and r["pass"] in cols:
        a[cols[r["pass"]]] = lam
    A.append(a); W.append(r["w"]); E.append(r["epoch"])
A = np.array(A); W = np.array(W); E = np.array(E)
N = np.zeros((dim, dim))
for e in np.unique(E):
    m = E == e
    Ae, We = A[m], W[m]
    mean = (We[:, None] * Ae).sum(0) / We.sum()
    Ac = Ae - mean
    N += Ac.T @ (We[:, None] * Ac)
P = np.linalg.inv(N)
Q = P[9:, 9:]
pf = P[:9, :9]
px = np.linalg.inv(N[:9, :9])
# bootstrapped success rate from the conditional variances (Schur complements), original order
def cdf(x):
    return 0.5 * (1 + erf(x / sqrt(2)))
ps = 1.0
for i in range(Q.shape[0]):
    if i == 0:
        c = Q[0, 0]
    else:
        c = Q[i, i] - Q[i, :i] @ np.linalg.solve(Q[:i, :i], Q[:i, i])
    ps *= 2 * cdf(1 / (2 * sqrt(c))) - 1
print(json.dumps({"passes_used": len(comp), "dim": dim, "q": Q.tolist(), "p_float": pf.tolist(),
                  "p_fixed": px.tolist(), "bootstrap": ps}))
