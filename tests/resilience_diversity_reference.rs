// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the PNT-resilience **effective-diversity kernel**
//! (`resilience::diversity::effective_diversity`) against an **independent
//! third-party authority**: scikit-bio 0.7.3
//! (`skbio.diversity.alpha.inv_simpson`; McDonald et al., BSD-3-Clause).
//!
//! `effective_diversity` reduces a PNT architecture to its per-independence-group
//! summed (clamped) source qualities and returns the inverse-Simpson index over
//! that vector — the Hill number of order 2, `1 / sum(p_i^2)`. scikit-bio's
//! `inv_simpson` is exactly that index, documented as the effective number of
//! species and "equivalent to Hill number with order 2". Feeding scikit-bio the
//! identical group-abundance vector kshana reduces an architecture to is a
//! genuine library-vs-library cross-check — the same pattern the eval metrics
//! use against scikit-learn and DOP uses against gnss_lib_py: a different
//! codebase, fed byte-identical inputs, agreeing to a stated tolerance.
//!
//! HONEST SCOPE — what this DOES validate:
//!   * The inverse-Simpson / Hill-2 diversity kernel: that kshana reproduces an
//!     independent library's inverse-Simpson index to f64 round-off, including
//!     the dominance, fully-collapsed, equal-groups and single-source regimes.
//!   * The per-group aggregation + clamp-to-[0,1] convention end-to-end: the
//!     Rust side rebuilds each architecture as a full `PntArchitecture` and calls
//!     `effective_diversity`, so the aggregation and the index are checked
//!     together against the abundance vector scikit-bio was given.
//!
//! HONEST SCOPE — what this does NOT validate (stays Modelled):
//!   * The wider RPCF v2.0 scoring framework in `resilience::score` (technique
//!     weights, level mapping, sub-score aggregation) is a Kshana modelling
//!     choice with no external authority and is not covered here.
//!   * The empty / all-zero architectures: scikit-bio's `inv_simpson` returns
//!     NaN for a zero-sum vector (0/0); kshana DEFINES those as 0.0 effective
//!     sources. Those rows (`EXPECT_ZERO`) pin kshana to its documented 0.0
//!     boundary, which is a Kshana convention, not an scikit-bio number.
//!
//! Reference data, provenance and the committed generator are in
//! `tests/fixtures/resilience_diversity/` (`diversity_reference.txt`,
//! `generate_diversity_reference.py`). Values are stored at full f64 precision.

use kshana::resilience::arch::{PntArchitecture, PntSource, SourceKind};
use kshana::resilience::diversity::effective_diversity;

const REF: &str = include_str!("fixtures/resilience_diversity/diversity_reference.txt");

/// inverse-Simpson is the identical closed form on both sides (kshana's
/// `1/sum((q_g/total)^2)` vs scikit-bio's `1/sum(p_i^2)`), so the only residual
/// is f64 reassociation of the per-group sums. A tight relative bound with a
/// tiny absolute floor captures that; round-off is observed at ~1e-15.
const REL_TOL: f64 = 1e-12;
const ABS_TOL: f64 = 1e-12;

fn approx(got: f64, want: f64) -> bool {
    (got - want).abs() <= REL_TOL * want.abs() + ABS_TOL
}

fn parse_kind(s: &str) -> SourceKind {
    match s.trim() {
        "GnssL1" => SourceKind::GnssL1,
        "GnssL5" => SourceKind::GnssL5,
        "GnssMultiBand" => SourceKind::GnssMultiBand,
        "Inertial" => SourceKind::Inertial,
        "Clock" => SourceKind::Clock,
        "Terrain" => SourceKind::Terrain,
        "Gravity" => SourceKind::Gravity,
        "Magnetic" => SourceKind::Magnetic,
        "SignalOfOpportunity" => SourceKind::SignalOfOpportunity,
        "Eloran" => SourceKind::Eloran,
        other => panic!("unknown SourceKind '{other}' in fixture"),
    }
}

/// Parse the "kind,group,quality;kind,group,quality;..." source field into a
/// `PntArchitecture`. An empty field is an empty architecture.
fn build_arch(name: &str, src_field: &str) -> PntArchitecture {
    let src_field = src_field.trim();
    let mut sources = Vec::new();
    if !src_field.is_empty() {
        for triple in src_field.split(';') {
            let t = triple.trim();
            if t.is_empty() {
                continue;
            }
            let p: Vec<&str> = t.split(',').collect();
            assert_eq!(p.len(), 3, "{name}: source triple needs 3 fields: '{t}'");
            let kind = parse_kind(p[0]);
            let group: u32 = p[1].trim().parse().expect("group id");
            let quality: f64 = p[2].trim().parse().expect("quality");
            sources.push(PntSource::new(kind, group, quality));
        }
    }
    PntArchitecture::new(name, sources, [])
}

#[test]
fn effective_diversity_matches_scikitbio_inverse_simpson() {
    let mut n = 0usize;
    let mut n_zero = 0usize;
    let mut n_equal = 0usize; // N-equal-groups regime exercised
    let mut n_collapsed = 0usize; // fully-collapsed regime exercised
    let mut worst = 0.0_f64;

    for line in REF.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        assert!(line.starts_with("CASE "), "unexpected line: {line}");
        // CASE name | sources | abundance | inv_simpson_or_EXPECT_ZERO
        let parts: Vec<&str> = line.splitn(4, '|').collect();
        assert_eq!(parts.len(), 4, "CASE row needs 4 |-fields: {line}");
        let name = parts[0].trim_start_matches("CASE").trim();
        let src_field = parts[1];
        let ref_field = parts[3].trim();

        let arch = build_arch(name, src_field);
        let got = effective_diversity(&arch);

        if ref_field == "EXPECT_ZERO" {
            // kshana boundary convention: empty / all-zero -> exactly 0.0.
            assert_eq!(
                got, 0.0,
                "{name}: empty/zero architecture must pin to 0.0, got {got}"
            );
            n_zero += 1;
        } else {
            let want: f64 = ref_field.parse().expect("inv_simpson reference value");
            worst = worst.max((got - want).abs());
            assert!(
                approx(got, want),
                "{name}: effective_diversity {got:.16} vs scikit-bio inv_simpson \
                 {want:.16} (|Δ|={:.3e} > {:.3e})",
                (got - want).abs(),
                REL_TOL * want.abs() + ABS_TOL,
            );
            // Bucket a couple of regimes so the fixture must span them.
            if name.starts_with("equal_") || name.starts_with("clamp_overunity") {
                n_equal += 1;
            }
            if name.starts_with("collapsed_") {
                n_collapsed += 1;
            }
        }
        n += 1;
    }

    assert!(n >= 12, "expected >= 12 diversity reference cases, got {n}");
    assert!(
        n_zero >= 1,
        "expected >= 1 empty/zero boundary case, got {n_zero}"
    );
    assert!(
        n_equal >= 2,
        "expected the equal-N-groups regime to be exercised, got {n_equal}"
    );
    assert!(
        n_collapsed >= 1,
        "expected the fully-collapsed regime to be exercised, got {n_collapsed}"
    );
    eprintln!(
        "resilience_diversity_reference: {n} cases vs scikit-bio inv_simpson \
         ({n_zero} pinned-zero boundary), worst |Δ| = {worst:.3e}"
    );
}
