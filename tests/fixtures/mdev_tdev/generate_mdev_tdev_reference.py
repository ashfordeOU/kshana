#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Regenerate the MDEV / TDEV reference deviations asserted in
``tests/mdev_tdev_reference.rs``.

The oracle is **allantools** (https://github.com/aewallin/allantools), an
independent, widely-used third-party frequency-stability library, run on the
hermetic **NIST SP 1065 §12.4 1000-point data set** (W. J. Riley, *Handbook of
Frequency Stability Analysis*, NIST Special Publication 1065, 2008, pp. 107-109),
generated in code from the prime-modulus (MINSTD) linear congruential generator
SP 1065 Eq. (73) defines — so the whole reference is reproducible offline with no
vendored data file, identical to the sibling ``theo1_totvar`` fixture.

allantools implements the *same uniquely-defined quantities* Kshana does:
  * ``allantools.mdev`` — the overlapping **modified Allan deviation** (NIST SP 1065
    Eq. (14), p. 17), the same second-difference sliding-window estimator as
    Kshana's ``allan::modified_adev``;
  * ``allantools.tdev`` — the **time deviation** ``TDEV(τ) = τ/√3 · MDEV(τ)`` (NIST
    SP 1065 Eq. (21), p. 20), exactly Kshana's ``allan::time_deviation``.

Run:  python3 generate_mdev_tdev_reference.py
Pinned: allantools 2024.06, numpy 2.x, Python 3.x. The printed numbers are the
constants hard-coded (with this provenance) in tests/mdev_tdev_reference.rs;
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

    factors = [1, 2, 5, 10, 20, 50, 100, 200]
    print(f"# allantools {at.__version__}, numpy {np.__version__}")
    print("# N = 1001 phase points (SP 1065 §12.4 LCG, freq->phase cumsum), rate=1")
    print("# MDEV: m, deviation")
    for m in factors:
        _, dev, _, _ = at.mdev(phase, rate=1.0, data_type="phase", taus=[float(m)])
        print(f"mdev {m} {dev[0]:.10e}")
    print("# TDEV (= tau/sqrt(3) * MDEV): m, deviation")
    for m in factors:
        _, dev, _, _ = at.tdev(phase, rate=1.0, data_type="phase", taus=[float(m)])
        print(f"tdev {m} {dev[0]:.10e}")


if __name__ == "__main__":
    main()
