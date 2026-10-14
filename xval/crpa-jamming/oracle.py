#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent recomputation of the jamming kind's CRPA beams (CAP-06 (a), bar A3).

Reads inputs.json (written by `cargo test --test jamming_crpa -- --ignored export_crpa_oracle_inputs`):
element positions (ENU, m), wavelength, the jammer's unit look vector and per-element JNR, the
jammer type's Q and the chip rate, and per link the satellite's unit look vector, js_db and
cn0_nominal_dbhz without the array. Writes expected.json with, per weighting and link, the
array noise gain, the jammer gain and the effective C/N0.

Shares no code with Kshana: numpy builds the steering vectors and solves with
numpy.linalg.solve / numpy.linalg.inv.

Usage: python3 -I oracle.py inputs.json expected.json
"""
import json
import sys

import numpy as np


def steering(p, u, lam):
    return np.exp(1j * 2.0 * np.pi / lam * (p @ u))


def weights(kind, p, lam, a_sv, u_j, jnr):
    n = len(p)
    if kind == "null-steering":
        if n < 2:
            return a_sv / n  # no room for a null: the conventional beam
        a_j = steering(p, u_j, lam)
        A = np.vstack([a_sv.conj(), a_j.conj()])  # rows a^H
        b = np.array([1.0, 0.0], dtype=complex)
        return A.conj().T @ np.linalg.solve(A @ A.conj().T, b)  # minimum norm
    if kind == "mvdr":
        a_j = steering(p, u_j, lam)
        R = np.eye(n, dtype=complex) + jnr * np.outer(a_j, a_j.conj())
        Ri = np.linalg.inv(R)
        return Ri @ a_sv / (a_sv.conj() @ Ri @ a_sv)
    raise SystemExit("unknown weighting " + kind)


def main():
    inp = json.load(open(sys.argv[1]))
    p = np.array(inp["elements_enu_m"], dtype=float)
    lam = inp["lambda_m"]
    u_j = np.array(inp["jammer_unit_enu"], dtype=float)
    jnr = inp["jnr_linear"]
    q, rc = inp["q"], inp["chip_rate_hz"]
    out = {"numpy": np.__version__, "weightings": {}}
    for kind in ("null-steering", "mvdr"):
        rows = []
        for link in inp["links"]:
            u = np.array(link["sv_unit_enu"], dtype=float)
            a_sv = steering(p, u, lam)
            w = weights(kind, p, lam, a_sv, u_j, jnr)
            assert abs(w.conj() @ a_sv - 1.0) < 1e-9, "distortionless"
            noise_gain = -10.0 * np.log10(np.vdot(w, w).real)
            g_j = w.conj() @ steering(p, u_j, lam)
            # an exact zero (a perfect null) is written as -999, since JSON has no infinity
            jam_gain = 10.0 * np.log10(abs(g_j) ** 2) if abs(g_j) > 0 else -999.0
            cn0_nom = link["cn0_nominal_dbhz"] + noise_gain
            js = link["js_db"] + jam_gain
            cn0_eff = -10.0 * np.log10(10 ** (-cn0_nom / 10.0) + 10 ** (js / 10.0) / (q * rc))
            rows.append({"t": link["t"], "prn": link["prn"], "array_noise_gain_db": noise_gain,
                         "jammer_gain_db": float(jam_gain), "cn0_effective_dbhz": cn0_eff})
        out["weightings"][kind] = rows
    json.dump(out, open(sys.argv[2], "w"), indent=0)


if __name__ == "__main__":
    main()
