#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the MTIE reference values asserted in ``tests/mtie_reference.rs``.

The oracle is **allantools** (https://pypi.org/project/AllanTools/), an independent
third-party frequency-stability library, using its ``mtie`` on the hermetic **NIST
SP 1065 §12.4 1000-point data set** (W. J. Riley, *Handbook of Frequency Stability
Analysis*, NIST SP 1065): the MINSTD (Park–Miller) LCG generates 1000 normalised
frequencies, mean-removed and cumulatively summed into 1001 phase points. MTIE at
tau = m*tau0 is the peak-to-peak time-error swing over a sliding window of m+1
consecutive phase samples, maximised over all window positions — exactly what
Kshana's ``allan::mtie`` computes. Because MTIE is a pure max/min statistic (no
floating-point accumulation), library-vs-library agreement is bit-exact.

Run:  python3 generate_mtie_reference.py
Pinned: allantools 2024.06, numpy 2.x, Python 3.x. The printed values are the
constants hard-coded (with this provenance) in tests/mtie_reference.rs; Kshana
reproduces them to < 1e-12 (observed: exact).
"""
import numpy as np
import allantools as at


def nbs14_1000_phase():
    """SP 1065 §12.4 MINSTD generator -> 1001 phase points.

    Phase is built with *naive sequential* float arithmetic (Python built-in ``sum``
    for the mean, a left-to-right accumulation for the cumulative sum) rather than
    numpy's pairwise summation, so the Rust known-answer test reproduces the phase
    array bit-for-bit. MTIE is then a pure max/min statistic over that array.
    """
    n = 1234567
    freq = []
    for _ in range(1000):
        n = (16807 * n) % 2147483647
        freq.append(n / 2147483647.0)
    mean = sum(freq) / len(freq)  # naive sequential sum (matches Rust)
    freq = [f - mean for f in freq]
    phase = [0.0]
    acc = 0.0
    for f in freq:
        acc += f
        phase.append(acc)
    return phase


def main():
    phase = np.array(nbs14_1000_phase())  # 1001 phase points; no further arithmetic
    taus = [1, 2, 4, 8, 16, 32, 64, 128, 256]
    tau_out, mtie, _err, _n = at.mtie(phase, rate=1.0, data_type="phase", taus=taus)
    print(f"# allantools {at.__version__}, numpy {np.__version__}")
    print("# N = 1001 phase points (SP 1065 §12.4 LCG, freq->phase cumsum), tau0 = 1")
    print("# MTIE(tau = m) = max peak-to-peak over sliding (m+1)-sample windows")
    for m, mv in zip((int(t) for t in tau_out), mtie):
        print(f"mtie {m} {mv:.15e}")


if __name__ == "__main__":
    main()
