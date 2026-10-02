#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Independent GPS L1 C/A complex-baseband IF generator (numpy only; no engine code).

Writes interleaved signed 8-bit I/Q at FS samples/s. Signal: PRN 1 C/A code (IS-GPS-200 G1/G2
generators), random 50 bit/s data (fixed seed), carrier phase 2*pi*(fd*t + rate*t^2/2), code phase
1.023e6*t + (fd*t + rate*t^2/2)/1540 + slew*t chips, amplitude A set by C/N0 against complex
white Gaussian noise of variance SIGMA2 (C/N0 = A^2*FS/SIGMA2). C/N0 is 45 dB-Hz for t < 4 s and
the test value afterwards.
"""
import numpy as np

FS = 4.0e6
SIGMA2 = 800.0  # complex noise variance (per component 400, i.e. 20 LSB)
CHIP = 1.023e6
LEAD_S = 4.0
LEAD_CN0 = 45.0
FD = 1500.0
PHI0 = 0.3
CHI0 = 100.25


def ca_code(prn=1):
    taps = {1: (2, 6)}[prn]
    g1 = np.ones(10, int)
    g2 = np.ones(10, int)
    out = np.zeros(1023, int)
    for i in range(1023):
        out[i] = g1[9] ^ g2[taps[0] - 1] ^ g2[taps[1] - 1]
        f1 = g1[2] ^ g1[9]
        f2 = g2[1] ^ g2[2] ^ g2[5] ^ g2[7] ^ g2[8] ^ g2[9]
        g1 = np.roll(g1, 1)
        g1[0] = f1
        g2 = np.roll(g2, 1)
        g2[0] = f2
    return 1 - 2 * out  # 0 -> +1, 1 -> -1


def truth(t, rate=0.0, slew=0.0):
    """True carrier phase (rad) and code phase (chips) at times t (s)."""
    cyc = FD * t + 0.5 * rate * t * t
    return 2 * np.pi * cyc + PHI0, CHI0 + CHIP * t + cyc / 1540.0 + slew * t


def write(path, cn0_test, duration_s, rate=0.0, slew=0.0, seed=1):
    code = ca_code(1)
    rng = np.random.default_rng(seed)
    bits = 1 - 2 * rng.integers(0, 2, int(duration_s * 50) + 10)
    n_tot = int(duration_s * FS)
    chunk = int(FS)
    with open(path, "wb") as f:
        for k0 in range(0, n_tot, chunk):
            n = np.arange(k0, min(k0 + chunk, n_tot))
            t = n / FS
            phi, chi = truth(t, rate, slew)
            cn0 = np.where(t < LEAD_S, LEAD_CN0, cn0_test)
            amp = np.sqrt(10 ** (cn0 / 10) * SIGMA2 / FS)
            ci = np.floor(chi).astype(np.int64)
            s = amp * code[ci % 1023] * bits[ci // 20460] * np.exp(1j * phi)
            s = s + rng.normal(0, np.sqrt(SIGMA2 / 2), (len(n), 2)) @ np.array([1, 1j])
            iq = np.empty(2 * len(n), np.float64)
            iq[0::2] = s.real
            iq[1::2] = s.imag
            np.clip(np.round(iq), -127, 127).astype(np.int8).tofile(f)


if __name__ == "__main__":
    import sys
    write(sys.argv[1], float(sys.argv[2]), float(sys.argv[3]),
          float(sys.argv[4]) if len(sys.argv) > 4 else 0.0,
          float(sys.argv[5]) if len(sys.argv) > 5 else 0.0)
