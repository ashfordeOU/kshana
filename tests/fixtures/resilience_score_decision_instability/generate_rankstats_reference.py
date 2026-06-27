#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for the resilience instability study's
rank-statistics kernels.

The oracle is **scipy** (Virtanen et al., *Nature Methods* 17, 261-272, 2020;
BSD-3-Clause) together with **numpy** (Harris et al., *Nature* 585, 357-362,
2020; BSD-3-Clause). These are the canonical scientific-computing libraries and
an independent third-party authority on rank statistics, exactly the way DOP is
validated against gnss_lib_py and the trade kernels against scipy.

Four exactly-reproducible kernels in `src/resilience/stats.rs` are checked
against scipy's / numpy's own routines (the scoring *framework* — how the seven
RPCF sub-scores are combined and gated into a composite/Level — stays MODELLED;
only these standalone rank-statistics primitives are validated here):

  KENDALL    resilience::stats::kendall_tau   -> scipy.stats.kendalltau(variant='b')
  RANK       resilience::stats::rank_of       -> scipy.stats.rankdata(-scores, 'ordinal') - 1
  PERCENTILE resilience::stats::percentile_ci -> numpy.percentile(method='nearest')
  DIRICHLET  empirical mean of                -> scipy.stats.dirichlet.mean(alpha)
             resilience::stats::dirichlet_weights (statistical convergence check)

Conventions matched byte-for-byte to the Rust source:

  * kendall_tau computes Kendall's tau-b (concordant-discordant over the
    sqrt((n_pairs-ties_a)(n_pairs-ties_b)) denominator), identical to scipy's
    variant='b'. The one documented divergence is the degenerate all-tied input:
    the tau-b denominator is 0, scipy returns NaN, and kshana returns the finite
    0.0 by contract. Those cases are emitted with want=nan and the Rust side
    asserts the kshana-contract value 0.0.

  * rank_of returns competition ranks with rank 0 = best (largest score), ties
    broken by ascending original index. That is exactly
    scipy.stats.rankdata(-scores, method='ordinal') - 1 (ordinal = ties broken by
    order of appearance, and negating the scores turns "largest first" into the
    ascending ordering rankdata uses).

  * percentile_ci(samples, alpha) returns the (alpha/2, 1-alpha/2) sample
    percentiles by the NEAREST-RANK method: idx(p) = round(p*(n-1)) (Rust
    f64::round = round half away from zero). numpy.percentile(method='nearest')
    is the same nearest-rank rule EXCEPT it rounds half-to-even on the virtual
    index. To keep this an EXACT (1e-12) value comparison we emit only cases
    whose virtual index p*(n-1) is not a half-integer, so the two rounding rules
    pick the identical sample and the endpoint VALUE is a genuine numpy oracle.
    The generator asserts this non-ambiguity for every emitted percentile case.

Honest scope: this validates the study's rank-statistics SPINE (the tau-b
dispersion metric, the competition-rank vectors, the percentile-CI endpoints, and
that the Dirichlet weight sampler's mean converges to the analytic simplex mean).
It does NOT validate the resilience SCORING model itself (the RPCF sub-score
formulas, the composite weighting, the Level/bounded gate), which stay MODELLED.

Reproduce (offline, no kshana code involved):

    python3 -m venv /tmp/rankvenv
    /tmp/rankvenv/bin/pip install "scipy>=1.17" numpy
    /tmp/rankvenv/bin/python generate_rankstats_reference.py > rankstats_reference.txt

Generated with scipy 1.18.0 + numpy 2.4.6 (BSD-3-Clause).
"""

import math

import numpy as np
from scipy import stats


def csv(xs):
    return ",".join(repr(float(x)) for x in xs)


def emit_kendall():
    """KENDALL <name> | a,... | b,... | want  (want = scipy tau-b, or 'nan' for
    the documented all-tied contract case)."""
    cases = []

    # --- tie-free: random permutations vs the identity, many sizes/seeds ---
    rng = np.random.default_rng(20260627)
    for n in (3, 4, 5, 6, 8, 10, 12, 15, 20, 30):
        base = np.arange(n, dtype=float)
        for k in range(4):  # 4 seeds per size -> 40 tie-free cases
            perm = rng.permutation(n).astype(float)
            cases.append((f"tiefree_n{n}_{k}", base.tolist(), perm.tolist()))

    # --- exact extremes (+1 identity, -1 full reversal) for several sizes ---
    for n in (3, 5, 8, 13):
        base = list(map(float, range(n)))
        cases.append((f"identity_n{n}", base, base[:]))
        cases.append((f"reversal_n{n}", base, base[::-1]))

    # --- single adjacent swap: one discordant pair (tau = (P-1 - 1)/P ... checked numerically) ---
    for n in (4, 6, 9):
        base = list(map(float, range(n)))
        b = base[:]
        b[0], b[1] = b[1], b[0]
        cases.append((f"oneswap_n{n}", base, b))

    # --- tie-heavy: repeated values on both sides (exercises the tau-b denom) ---
    cases.append(("tieheavy_1", [1.0, 1.0, 2.0, 2.0, 3.0], [1.0, 2.0, 2.0, 3.0, 3.0]))
    cases.append(("tieheavy_2", [0.0, 0.0, 0.0, 1.0, 1.0, 2.0], [2.0, 1.0, 1.0, 1.0, 0.0, 0.0]))
    cases.append(("tieheavy_3", [5.0, 5.0, 5.0, 7.0, 7.0, 9.0, 9.0], [1.0, 2.0, 2.0, 2.0, 4.0, 4.0, 9.0]))
    cases.append(("ties_a_only", [1.0, 1.0, 1.0, 2.0, 3.0], [1.0, 2.0, 3.0, 4.0, 5.0]))
    cases.append(("ties_b_only", [1.0, 2.0, 3.0, 4.0, 5.0], [9.0, 9.0, 9.0, 4.0, 1.0]))
    # rank-vector style inputs (what run_instability actually feeds: rank_of -> f64)
    cases.append(("ranks_5", [0.0, 1.0, 2.0, 3.0, 4.0], [1.0, 0.0, 2.0, 4.0, 3.0]))
    cases.append(("ranks_6", [0.0, 1.0, 2.0, 3.0, 4.0, 5.0], [0.0, 2.0, 1.0, 3.0, 5.0, 4.0]))

    for name, a, b in cases:
        tau = stats.kendalltau(a, b, variant="b").correlation
        want = "nan" if (tau is None or (isinstance(tau, float) and math.isnan(tau))) else repr(float(tau))
        print(f"KENDALL {name} | {csv(a)} | {csv(b)} | {want}")

    # --- the documented all-tied contract case: scipy -> NaN, kshana -> 0.0 ---
    for n in (3, 5, 7):
        a = list(map(float, range(n)))
        allt = [2.0] * n
        tau = stats.kendalltau(a, allt, variant="b").correlation
        assert tau is None or math.isnan(tau), "expected scipy NaN for all-tied"
        print(f"KENDALL alltied_n{n} | {csv(a)} | {csv(allt)} | nan")


def emit_rank():
    """RANK <name> | scores,... | r0 r1 ...  (want from rankdata)."""
    cases = []
    rng = np.random.default_rng(7771)
    # distinct-score random cases of several sizes
    for n in (3, 4, 5, 6, 8, 10, 15):
        for k in range(3):
            scores = rng.normal(size=n).round(6)
            # keep distinct to make the no-tie path unambiguous for the random set
            while len(set(scores.tolist())) != n:
                scores = rng.normal(size=n).round(6)
            cases.append((f"rand_n{n}_{k}", scores.tolist()))
    # explicit tie cases: ordinal rule breaks ties by ascending original index,
    # which is exactly kshana's `.then(i.cmp(&j))` tie-break.
    cases.append(("hand1", [0.3, 0.9, 0.5]))
    cases.append(("ties_lead", [0.5, 0.5, 0.9]))
    cases.append(("ties_block", [0.5, 0.5, 0.5, 0.9, 0.1]))
    cases.append(("ties_mixed", [0.2, 0.9, 0.2, 0.9, 0.5]))
    cases.append(("all_equal", [0.4, 0.4, 0.4, 0.4]))
    cases.append(("descending", [5.0, 4.0, 3.0, 2.0, 1.0]))
    cases.append(("ascending", [1.0, 2.0, 3.0, 4.0, 5.0]))

    for name, scores in cases:
        neg = np.array([-s for s in scores], dtype=float)
        ranks = (stats.rankdata(neg, method="ordinal") - 1).astype(int)
        want = " ".join(str(int(r)) for r in ranks)
        print(f"RANK {name} | {csv(scores)} | {want}")


def emit_percentile():
    """PERCENTILE <name> alpha | samples,... | lo hi  (numpy nearest-rank).

    Only emit cases where kshana's nearest-rank index (Rust f64::round =
    round-half-AWAY-from-zero) and numpy's nearest-rank index (round-half-to-
    EVEN) select the IDENTICAL sample, so the emitted endpoint VALUE is a fair
    exact comparison (the half-integer-boundary cases, where the two round-half
    rules disagree, are skipped)."""
    def kshana_idx(n, p):
        # Rust f64::round: round half away from zero.
        v = p * (n - 1)
        i = math.floor(v + 0.5) if v >= 0 else math.ceil(v - 0.5)
        return int(max(0, min(n - 1, i)))

    def numpy_idx(n, p):
        # numpy method='nearest': round half to even on the virtual index.
        v = p * (n - 1)
        # banker's rounding == Python's round() for the half case
        return int(max(0, min(n - 1, round(v))))

    def indices_agree(n, p):
        return kshana_idx(n, p) == numpy_idx(n, p)

    cases = []
    rng = np.random.default_rng(31337)
    grid = [
        (100, 0.10), (100, 0.05), (101, 0.10), (200, 0.10), (201, 0.05),
        (50, 0.10), (75, 0.20), (99, 0.02), (151, 0.10), (37, 0.10),
        (1000, 0.05), (1000, 0.10), (13, 0.10), (64, 0.10), (250, 0.04),
        (500, 0.10), (333, 0.06), (88, 0.10), (1, 0.10), (2, 0.10),
        (300, 0.10), (123, 0.08), (77, 0.10), (444, 0.05), (61, 0.10),
        (210, 0.10), (95, 0.12), (160, 0.10), (29, 0.10), (512, 0.08),
    ]
    for (n, alpha) in grid:
        samples = rng.normal(loc=0.0, scale=1.0, size=n).round(8).tolist()
        cases.append((f"norm_n{n}_a{alpha}", alpha, samples))
    # a sorted-integer case with a known answer
    cases.append(("seq100_a0.1", 0.10, [float(i) for i in range(1, 101)]))

    emitted = 0
    for name, alpha, samples in cases:
        n = len(samples)
        p_lo = alpha / 2.0
        p_hi = 1.0 - alpha / 2.0
        # Only emit when kshana's and numpy's nearest-rank indices coincide on
        # BOTH endpoints (skip the half-integer-boundary disagreements, which are
        # a round-half-rule artefact, not a value error).
        if n >= 2 and not (indices_agree(n, p_lo) and indices_agree(n, p_hi)):
            continue
        lo = float(np.percentile(samples, p_lo * 100.0, method="nearest"))
        hi = float(np.percentile(samples, p_hi * 100.0, method="nearest"))
        print(f"PERCENTILE {name} {repr(float(alpha))} | {csv(samples)} | {repr(lo)} {repr(hi)}")
        emitted += 1
    assert emitted >= 15, f"only {emitted} percentile cases survived the non-ambiguity filter"


def emit_dirichlet():
    """DIRICHLET <name> seed0 ndraws | alpha,... | mean,...  (scipy analytic
    mean; the Rust side checks the EMPIRICAL mean of dirichlet_weights converges
    -- a statistical/characterisation check, not 1e-12)."""
    cases = [
        ("sym3", 0, 4000, [50.0, 50.0, 50.0]),
        ("sym7", 100, 6000, [20.0, 20.0, 20.0, 20.0, 20.0, 20.0, 20.0]),
        ("asym3", 5, 6000, [10.0, 20.0, 30.0]),
        ("rpcf7_unit", 1, 8000, [1.0, 1.0, 1.0, 1.0, 1.0, 1.0, 1.0]),
        ("rpcf7_graded", 42, 8000, [2.0, 4.0, 6.0, 8.0, 10.0, 12.0, 14.0]),
    ]
    for name, seed0, ndraws, alpha in cases:
        mean = stats.dirichlet.mean(alpha)  # = alpha_i / sum(alpha), exact
        # cross-check the analytic identity to 1e-15
        analytic = np.array(alpha) / np.sum(alpha)
        assert np.max(np.abs(mean - analytic)) < 1e-15
        print(f"DIRICHLET {name} {seed0} {ndraws} | {csv(alpha)} | {csv(mean)}")


if __name__ == "__main__":
    print("# resilience rank-statistics reference vectors")
    print("# oracle: scipy 1.18.0 (stats.kendalltau / stats.rankdata / stats.dirichlet)")
    print("#         + numpy 2.4.6 (percentile, method='nearest'); both BSD-3-Clause")
    print("# see generate_rankstats_reference.py header for conventions + honest scope")
    emit_kendall()
    emit_rank()
    emit_percentile()
    emit_dirichlet()
