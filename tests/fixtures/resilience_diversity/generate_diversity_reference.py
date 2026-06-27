#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference values for the PNT-resilience effective-diversity
(inverse-Simpson / Hill-2) kernel.

The oracle is **scikit-bio** 0.7.3 (`skbio.diversity.alpha.inv_simpson`;
McDonald et al., BSD-3-Clause), an independent third-party ecological-diversity
library. `inv_simpson(counts)` computes Simpson's reciprocal index

    1 / D = 1 / sum_i p_i^2 ,   p_i = counts_i / sum_j counts_j ,

documented as the effective number of species and *equivalent to the Hill number
of order 2*. kshana's `resilience::diversity::effective_diversity` computes
exactly this Hill-2 / inverse-Simpson number over the per-independence-group
summed source qualities. So feeding scikit-bio the same group-abundance vector
kshana reduces an architecture to is a genuine library-vs-library cross-check of
the diversity kernel — the same kind of validation the eval metrics get against
scikit-learn and DOP gets against gnss_lib_py.

WHAT IS VALIDATED (honest scope):
  * The inverse-Simpson / Hill-2 DIVERSITY KERNEL itself: that kshana's
    `effective_diversity` reproduces an independent library's inverse-Simpson
    index on identical group-abundance vectors, to f64 round-off.
  * The per-group aggregation convention is exercised end-to-end: each
    architecture below is a list of (kind, independence_group, quality) sources;
    this generator applies the SAME clamp-to-[0,1]-then-sum-per-group reduction
    kshana applies, and feeds the resulting abundance vector to scikit-bio. The
    Rust test builds the byte-identical architectures and calls
    `effective_diversity` on the full PntArchitecture, so the aggregation +
    index are checked together.

WHAT IS NOT VALIDATED (stays Modelled):
  * The wider RPCF v2.0 scoring framework (technique weights, level mapping,
    sub-score aggregation in resilience::score) is a Kshana modelling choice with
    no external authority and is NOT covered here.
  * The empty / all-zero architectures: scikit-bio's inv_simpson returns NaN for
    a zero-sum abundance vector (0/0). kshana DEFINES these as 0.0 effective
    sources (the `total <= 0` guard). That 0.0 is kshana's boundary CONVENTION,
    not an scikit-bio number; the fixture marks those rows EXPECT_ZERO so the
    Rust test pins kshana to its documented 0.0 boundary rather than to NaN.

Cross-check: base R (no vegan needed) recomputes 1/sum(p^2) for the same vectors
and agrees with scikit-bio to full f64 precision, e.g. invsimp(c(2,1,1)) ==
2.666666666666667 in both runtimes (an independent-language confirmation of the
closed form). vegan::diversity(..., index="invsimpson") is the same kernel but is
not installed on this host, so scikit-bio is the committed oracle.

Reproduce (offline, NO kshana code imported here):

    /tmp/kshana-oracles/.venv/bin/python generate_diversity_reference.py \
        > diversity_reference.txt

Generated with scikit-bio 0.7.3 (inv_simpson) + numpy.
"""

import numpy as np
import skbio
from skbio.diversity.alpha import inv_simpson

# (name, [ (source_kind, independence_group, quality), ... ])
# source_kind strings match kshana::resilience::arch::SourceKind variants exactly.
# quality is the raw value; kshana clamps it to [0, 1] before the per-group sum,
# and so does this generator (see group_abundance).
CASES = [
    # --- equal independent groups: N groups of equal quality -> exactly N ---
    ("equal_3_groups", [
        ("GnssL1", 1, 1.0), ("GnssL5", 2, 1.0), ("Inertial", 3, 1.0)]),
    ("equal_4_groups", [
        ("GnssMultiBand", 1, 1.0), ("Inertial", 2, 1.0),
        ("Clock", 3, 1.0), ("Eloran", 4, 1.0)]),
    ("equal_5_groups_half_quality", [  # scale-invariant: all 0.5 still -> 5
        ("GnssL1", 1, 0.5), ("Inertial", 2, 0.5), ("Clock", 3, 0.5),
        ("Terrain", 4, 0.5), ("Magnetic", 5, 0.5)]),
    ("equal_2_groups_multisource", [  # two groups, two sources each, equal sums
        ("GnssL1", 1, 0.5), ("GnssL5", 1, 0.5),
        ("Inertial", 2, 0.6), ("Clock", 2, 0.4)]),

    # --- fully collapsed: every source shares one independence group -> 1 ---
    ("collapsed_single_group_3src", [
        ("GnssL1", 7, 1.0), ("GnssL5", 7, 1.0), ("GnssMultiBand", 7, 1.0)]),
    ("collapsed_single_group_unequal", [  # one group, unequal qualities -> still 1
        ("GnssL1", 2, 0.9), ("GnssL5", 2, 0.3), ("GnssMultiBand", 2, 0.6)]),

    # --- unequal group quality: dominance lowers effective number ---
    ("unequal_dominant_2_1_1", [  # abundances 2,1,1 -> 8/3 = 2.6667
        ("GnssMultiBand", 1, 1.0), ("GnssMultiBand", 1, 1.0),
        ("Inertial", 2, 1.0), ("Clock", 3, 1.0)]),
    ("unequal_skewed_quality", [  # group sums 0.9, 0.3, 0.3, 0.5
        ("GnssL1", 1, 0.9), ("Inertial", 2, 0.3),
        ("Terrain", 3, 0.3), ("Clock", 4, 0.5)]),
    ("unequal_strong_plus_weak", [  # one strong group, three weak -> ~1.6
        ("GnssMultiBand", 1, 1.0), ("Magnetic", 2, 0.2),
        ("Gravity", 3, 0.2), ("SignalOfOpportunity", 4, 0.2)]),
    ("unequal_six_groups_varied", [
        ("GnssL1", 1, 1.0), ("GnssL5", 2, 0.8), ("Inertial", 3, 0.6),
        ("Clock", 4, 0.7), ("Terrain", 5, 0.4), ("Eloran", 6, 0.9)]),

    # --- clamping is exercised: qualities > 1 must be clamped to 1.0 ---
    ("clamp_overunity_to_equal_3", [  # 1.5,2.0,3.0 all clamp to 1 -> exactly 3
        ("GnssL1", 1, 1.5), ("Inertial", 2, 2.0), ("Clock", 3, 3.0)]),
    ("clamp_negative_drops_to_zero_group", [  # neg clamps to 0; that group sum=0
        ("GnssL1", 1, 1.0), ("GnssL5", 2, 1.0), ("Inertial", 3, -0.4)]),

    # --- single source / single group -> 1 effective independent source ---
    ("single_source", [("GnssMultiBand", 1, 0.6)]),
    ("single_source_full", [("Clock", 9, 1.0)]),

    # --- empty / all-zero: kshana boundary convention is 0.0 (skbio -> NaN) ---
    ("empty_architecture", []),
    ("all_zero_quality", [
        ("GnssL1", 1, 0.0), ("Inertial", 2, 0.0)]),
    ("all_clamped_to_zero", [  # negatives clamp to 0 -> total 0 -> 0.0
        ("GnssL1", 1, -0.2), ("Inertial", 2, -1.0)]),
]


def group_abundance(sources):
    """Reduce a source list to the per-independence-group summed clamped quality
    vector — the SAME reduction kshana::diversity::effective_diversity performs
    before the inverse-Simpson index. (This is bookkeeping, not the index math:
    the index math is scikit-bio's inv_simpson below.)"""
    groups = {}
    for _kind, grp, q in sources:
        qc = min(1.0, max(0.0, q))  # clamp to [0, 1] like kshana
        groups[grp] = groups.get(grp, 0.0) + qc
    # deterministic order by group id (matches kshana's BTreeMap order; the index
    # is order-invariant anyway).
    return [groups[g] for g in sorted(groups)]


def fmt_sources(sources):
    return ";".join(f"{k},{g},{q!r}" for (k, g, q) in sources)


print("# scikit-bio reference for the PNT-resilience effective-diversity kernel.")
print("# Oracle: scikit-bio 0.7.3 skbio.diversity.alpha.inv_simpson (BSD-3-Clause)")
print("#         = inverse Simpson / Hill number order 2 = 1 / sum(p_i^2).")
print("# Consumed by tests/resilience_diversity_reference.rs.")
print("# See generate_diversity_reference.py for provenance + honest scope.")
print("# CASE name | kind,group,quality;kind,group,quality;... | abundance_vec | "
      "inv_simpson_or_EXPECT_ZERO")
n = 0
for name, sources in CASES:
    ab = group_abundance(sources)
    total = sum(ab)
    if total <= 0.0:
        ref = "EXPECT_ZERO"  # kshana boundary convention; skbio would give NaN
    else:
        val = float(inv_simpson(np.array(ab, dtype=float)))
        assert np.isfinite(val), f"{name}: non-finite inv_simpson"
        ref = repr(val)
    ab_str = ",".join(repr(float(x)) for x in ab) if ab else ""
    print(f"CASE {name} | {fmt_sources(sources)} | {ab_str} | {ref}")
    n += 1

print(f"# {n} cases total", flush=True)
