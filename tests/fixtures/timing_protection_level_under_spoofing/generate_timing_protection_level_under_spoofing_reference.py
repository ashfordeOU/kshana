#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for the spoof-monitor CUSUM kernel that
underpins the Timing Protection Level (TPL) under a time-synchronisation attack.

WHAT IS VALIDATED
-----------------
kshana's TPL (src/tpl.rs) bounds the worst-case *undetected* time error a GNSS
spoofer can hold before a clock-aided sequential change detector alarms. Two of
its load-bearing kernels are exactly checkable against published change-detection
theory, and they are what this fixture covers:

  1. Deterministic worst-case detection latency
     `tpl::cusum_latency_s(kref, h, z, dt)`.
     A one-sided tabular CUSUM accumulates S_n = max(0, S_{n-1} + z - kref) and
     alarms on S_n > h (strict). For a *constant* standardized increment z > kref
     the accumulator climbs from 0 by exactly (z - kref) each step, so the first
     sample with S_n > h is the integer first-passage time
         N = floor(h / (z - kref)) + 1
     and the latency is N * dt seconds. This is an EXACT integer identity, so the
     oracle truth is the first-passage time of the CUSUM recursion itself,
     computed here by an INDEPENDENT Python implementation of the recursion (no
     kshana code). The Rust test asserts EXACT integer/latency equality.

  2. Out-of-control Average Run Length ARL1(delta) of the same CUSUM under
     i.i.d. Gaussian residuals N(delta, 1), reference k = kref = 0.5, decision
     intervals h in {4, 5}, shifts delta in {0.5, 1.0, 1.5, 2.0}.
     Two independent external authorities are committed for each (h, delta):
       (a) SIEGMUND (1985) Brownian-motion ARL approximation
               ARL = (exp(-2*D*b) + 2*D*b - 1) / (2*D^2),  D = delta - k,
               b   = h + 1.166   (Siegmund's discrete-overshoot correction),
           the standard closed form reproduced in Hawkins & Olwell (1998),
           "Cumulative Sum Charts and Charting for Quality Improvement",
           Springer, eq. (3.7); and
       (b) MONTGOMERY published ARL points, transcribed from
           D. C. Montgomery, "Introduction to Statistical Quality Control",
           Wiley, ARL tables for the tabular CUSUM with k = 1/2, h = 4 and h = 5
           (the canonical textbook ARL tables; see citation block below).
     The Rust test runs kshana's ACTUAL `tpl::Cusum` in a >=20000-trial Monte
     Carlo (seeded ChaCha8 + Gaussian) and compares the measured ARL1 to (a)
     within 5% and to (b) within 8%.

HONEST SCOPE
------------
- This validates the CUSUM detection KERNEL (latency identity + ARL1 law), which
  is the new, oracle-checkable core. The composed TPL bound
  `tpl::timing_protection_level_ns` remains MODELLED: it is a *conditional*
  bridge over separately validated primitives (the static detectability floor and
  the holdover coast), and against an adversary free to pick an arbitrarily slow
  ramp there is no finite unconditional undetected-error bound. The TPL composite
  is NOT what these vectors certify.
- Montgomery's published ARL tables are for the TWO-sided tabular CUSUM (C+ and
  C- run together). For a POSITIVE shift the lower accumulator C- essentially
  never alarms, so the two-sided out-of-control ARL1 equals the one-sided ARL1 to
  well within the 8% gate; we therefore only compare OUT-of-control points
  (delta > 0) and never the in-control ARL0 (where one- and two-sided differ
  ~2x). This is the honest, apples-to-apples comparison.

REPRODUCE (offline, no kshana code involved):
    /tmp/kshana-oracles/.venv/bin/python \
        generate_timing_protection_level_under_spoofing_reference.py \
        > timing_protection_level_under_spoofing_reference.txt

Generated with numpy + the closed forms above. The Montgomery points are a
hand-transcribed PUBLISHED-VECTORS fixture (citation in the header below).
"""

import math


# ---------------------------------------------------------------------------
# 1. Deterministic worst-case latency: independent CUSUM-recursion first passage
# ---------------------------------------------------------------------------
def cusum_first_passage_samples(kref: float, h: float, z: float) -> int:
    """Integer first-passage time of S_n = max(0, S_{n-1} + z - kref) over h,
    by direct simulation of the recursion (independent of kshana)."""
    s = 0.0
    n = 0
    # z <= kref never alarms; the test treats that as infinity separately, so the
    # committed grid only contains z > kref cases.
    while True:
        n += 1
        s = max(0.0, s + z - kref)
        if s > h:
            return n
        if n > 1_000_000:
            raise RuntimeError("no alarm; case should have z > kref")


# (kref, h, z, dt) — all with z > kref so the latency is finite.
LATENCY_CASES = [
    (0.5, 4.0, 1.0, 1.0),
    (0.5, 4.0, 1.25, 1.0),
    (0.5, 4.0, 1.5, 1.0),
    (0.5, 4.0, 2.0, 1.0),
    (0.5, 4.0, 3.0, 1.0),
    (0.5, 4.0, 4.5, 1.0),
    (0.5, 5.0, 1.0, 1.0),
    (0.5, 5.0, 1.1, 1.0),
    (0.5, 5.0, 1.5, 1.0),
    (0.5, 5.0, 2.0, 1.0),
    (0.5, 5.0, 2.5, 1.0),
    (0.5, 5.0, 5.5, 0.1),
    (0.5, 5.0, 10.5, 0.05),
    (0.25, 4.0, 1.25, 0.5),
    (0.75, 6.0, 2.75, 1.0),
    (1.0, 8.0, 3.0, 2.0),
]


# ---------------------------------------------------------------------------
# 2. Out-of-control ARL1: Siegmund (1985) approximation
# ---------------------------------------------------------------------------
def siegmund_arl(delta: float, kref: float, h: float) -> float:
    """Siegmund (1985) Brownian-motion ARL for the one-sided CUSUM.
    D = delta - kref is the random-walk drift; b = h + 1.166 corrects for the
    discrete overshoot at the boundary."""
    drift = delta - kref
    b = h + 1.166
    if abs(drift) < 1e-12:
        return b * b
    return (math.exp(-2.0 * drift * b) + 2.0 * drift * b - 1.0) / (2.0 * drift * drift)


# Montgomery, "Introduction to Statistical Quality Control" (Wiley) — published
# ARL tables for the tabular CUSUM, k = 1/2. The canonical textbook values for
# h = 4 (h* = 4) and h = 5 (h* = 5), shift delta in sigma units.
# (Cross-checked numerically against the Siegmund closed form and an independent
#  Monte-Carlo of the recursion before committing; see header.)
MONTGOMERY_ARL1 = {
    # h: {delta: published_ARL}
    4: {0.5: 26.6, 1.0: 8.38, 1.5: 4.75, 2.0: 3.34},
    5: {0.5: 38.0, 1.0: 10.4, 1.5: 5.75, 2.0: 4.01},
}

KREF = 0.5
H_GRID = [4.0, 5.0]
DELTA_GRID = [0.5, 1.0, 1.5, 2.0]


print("# Reference vectors for the TPL spoof-monitor CUSUM kernel (src/tpl.rs).")
print("# Consumed by tests/timing_protection_level_under_spoofing_reference.rs.")
print("# Generator: generate_timing_protection_level_under_spoofing_reference.py.")
print("#")
print("# Oracle 1 (LATENCY): deterministic CUSUM first-passage N=floor(h/(z-kref))+1,")
print("#   computed by an independent Python simulation of S_n=max(0,S_{n-1}+z-kref)>h.")
print("#   EXACT integer identity. Rust asserts exact match of samples and latency_s.")
print("# Oracle 2 (ARL1): out-of-control Average Run Length, k=0.5, two anchors:")
print("#   siegmund = Siegmund(1985) Brownian ARL (Hawkins&Olwell 1998 eq 3.7),")
print("#   montgomery = published tabular-CUSUM ARL (Montgomery, Intro to SQC, Wiley,")
print("#     ARL tables k=1/2 h=4 & h=5). Two-sided table; compared only for delta>0")
print("#     where the lower accumulator is inert, so it equals the one-sided ARL1.")
print("#   Rust runs kshana's tpl::Cusum in a seeded >=20000-trial Monte Carlo and")
print("#   matches siegmund within 5% and montgomery within 8%.")
print("#")
print("# LATENCY kref h z dt | samples latency_s")
for kref, h, z, dt in LATENCY_CASES:
    n = cusum_first_passage_samples(kref, h, z)
    assert n == math.floor(h / (z - kref)) + 1, (kref, h, z, n)
    lat = n * dt
    print(f"LATENCY {kref!r} {h!r} {z!r} {dt!r} | {n} {lat!r}")

print("#")
print("# ARL1 kref h delta | siegmund montgomery")
for h in H_GRID:
    for delta in DELTA_GRID:
        sg = siegmund_arl(delta, KREF, h)
        mo = MONTGOMERY_ARL1[int(h)][delta]
        print(f"ARL1 {KREF!r} {h!r} {delta!r} | {sg!r} {mo!r}")
