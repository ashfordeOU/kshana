#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""D8a row 3 development study (numpy, no engine code): off-peak CA-CFAR exceedances of a
noise-free 2-bit GPS L1 C/A signal, under the registered reference set and candidate changes.

Development signals only: PRNs 2 to 6 (not the registered PRN 1 nor the fresh 7, 13, 22, 31).
PRN 1 is run once under the registered detector only, to check that this model reproduces the
recorded count (32 of 2495), never under a candidate.

    python3 -I dev_study.py
"""
import math
import numpy as np

FS, RC, F_L1 = 2.5e6, 1.023e6, 1575.42e6
G2_TAPS = {1: (2, 6), 2: (3, 7), 3: (4, 8), 4: (5, 9), 5: (1, 9), 6: (2, 10), 7: (1, 8), 8: (2, 9),
           13: (6, 7), 22: (6, 8), 31: (3, 8)}


def ca(prn):
    g1, g2 = [1] * 10, [1] * 10
    a, b = G2_TAPS[prn]
    out = []
    for _ in range(1023):
        out.append(g1[9] ^ g2[a - 1] ^ g2[b - 1])
        f1 = g1[2] ^ g1[9]
        f2 = g2[1] ^ g2[2] ^ g2[5] ^ g2[7] ^ g2[8] ^ g2[9]
        g1 = [f1] + g1[:9]
        g2 = [f2] + g2[:9]
    return np.array([1.0 - 2.0 * c for c in out])


def two_bit(v):
    return np.sign(v) * np.where(np.abs(v) > 1.0, 3.0, 1.0)


def grid(prn, dopp, phase0):
    c = ca(prn)
    n = int(FS * 1e-3)
    t = np.arange(n) / FS
    rate = RC * (1 + dopp / F_L1)
    chips = np.floor(phase0 + rate * t).astype(int) % 1023
    ph = 2 * np.pi * dopp * t
    x = two_bit(2.0 * c[chips] * np.cos(ph)) + 1j * two_bit(2.0 * c[chips] * np.sin(ph))
    rep = c[np.floor(np.arange(n) * RC / FS).astype(int) % 1023]
    R = np.conj(np.fft.fft(rep))
    rows = []
    for f in np.arange(-5000, 5001, 500):
        y = x * np.exp(-2j * np.pi * f * t)
        rows.append(np.abs(np.fft.ifft(np.fft.fft(y) * R)) ** 2)
    return np.array(rows)


def alpha(pfa, n):
    return n * (pfa ** (-1.0 / n) - 1.0)  # M = 1


def refs_local(lag, length, n=16, g=2, s=4):
    return [(lag + sgn * (g + k * s)) % length for k in range(1, n // 2 + 1) for sgn in (1, -1)]


def refs_row(lag, length, g=2, s=4):
    # every stride-th lag round the period, outside the guard (the whole row as reference)
    out, k = [], 1
    while g + k * s < length - (g + k * s):
        out += [(lag + g + k * s) % length, (lag - g - k * s) % length]
        k += 1
    return out


def exceed(G, refset, pfa=1e-3):
    j, l0 = np.unravel_index(np.argmax(G), G.shape)
    row = G[j]
    L = len(row)
    above = tested = 0
    for l in range(L):
        d = (l - l0) % L
        if min(d, L - d) <= 2:
            continue
        r = refset(l, L)
        a = alpha(pfa, len(r))
        tested += 1
        above += row[l] > a * row[r].mean()
    pr = refset(l0, L)
    return above, tested, row[l0] / row[pr].mean() > alpha(pfa, len(pr)), len(pr)


if __name__ == "__main__":
    a, t, det, _ = exceed(grid(1, 1250.0, 300.25), refs_local)
    print(f"fidelity, PRN 1 registered detector: {a} of {t} (engine recorded 32 of 2495); detected {det}")
    dev = [(2, 1750.0, 100.5), (3, -1250.0, 640.25), (4, 250.0, 222.0), (5, -3750.0, 900.75), (6, 4250.0, 33.25),
           (2, -500.0, 410.0), (3, 2000.0, 5.5), (4, -4000.0, 777.75)]
    for name, rs in (("registered (N=16, g=2, s=4)", refs_local), ("whole row at stride 4", refs_row)):
        tot_a = tot_t = 0
        for prn, f, p in dev:
            a, t, det, n = exceed(grid(prn, f, p), rs)
            tot_a, tot_t = tot_a + a, tot_t + t
            print(f"  {name}: PRN {prn} {f:+.0f} Hz {p} chips: {a}/{t} = {a / t:.4f}; N={n}; peak detected {det}")
        print(f"{name}: pooled {tot_a}/{tot_t} = {tot_a / tot_t:.4f}")
