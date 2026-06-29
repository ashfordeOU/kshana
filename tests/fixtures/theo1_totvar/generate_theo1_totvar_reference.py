#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the Theo1 / TOTDEV reference deviations asserted in
``tests/theo1_totvar_reference.rs``.

The oracle is **allantools** (https://github.com/aewallin/allantools), an
independent, widely-used third-party frequency-stability library, run on the
hermetic **NIST SP 1065 §12.4 1000-point data set** (W. J. Riley, *Handbook of
Frequency Stability Analysis*, NIST Special Publication 1065, 2008, pp. 107-109).
That data set is generated in code from the prime-modulus (MINSTD) linear
congruential generator SP 1065 Eq. (73) defines for exactly this purpose, so the
whole reference is reproducible offline with no vendored data file.

allantools implements the *same* uniquely-defined quantities Kshana does:
  * ``allantools.theo1``  — NIST SP 1065 Eq. (30), p. 29 (with the 0.75
    normalisation; effective tau 0.75*m*tau0);
  * ``allantools.totdev`` — NIST SP 1065 Eq. (25), p. 23 (reflected/mirrored
    phase extension at both ends).

Run:  python3 generate_theo1_totvar_reference.py
Pinned: allantools 2024.06, numpy 2.x, Python 3.x. The printed numbers are the
constants hard-coded (with this provenance) in tests/theo1_totvar_reference.rs;
Kshana reproduces them to <1e-9 relative with no third-party code.
"""
import numpy as np
import allantools as at


def nbs14_1000_freq():
    """SP 1065 §12.4 Eq. (73) MINSTD generator: 1000 normalized frequencies."""
    modulus = 2_147_483_647  # 2^31 - 1, prime
    multiplier = 16_807
    n = 1_234_567_890
    freq = []
    for _ in range(1000):
        freq.append(n / modulus)
        n = (multiplier * n) % modulus
    return np.array(freq)


def main():
    freq = nbs14_1000_freq()
    # SP 1065 p.108: convert to phase by cumulative sum with a prepended zero
    # (averaging time 1) -> 1001 phase points.
    phase = np.concatenate([[0.0], np.cumsum(freq)])
    assert len(phase) == 1001

    print(f"# allantools {at.__version__}, numpy {np.__version__}")
    print("# N = 1001 phase points (SP 1065 §12.4 LCG, freq->phase cumsum)")
    print("# Theo1 (effective tau = 0.75*m): m, deviation")
    for m in [10, 20, 50, 100, 200, 500]:
        _, dev, _, _ = at.theo1(phase, rate=1.0, data_type="phase", taus=[float(m)])
        print(f"theo1 {m} {dev[0]:.10e}")
    print("# TOTDEV: m, deviation")
    for m in [1, 2, 10, 100, 500, 998]:
        _, dev, _, _ = at.totdev(phase, rate=1.0, data_type="phase", taus=[float(m)])
        print(f"totdev {m} {dev[0]:.10e}")


if __name__ == "__main__":
    main()
