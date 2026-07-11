// SPDX-License-Identifier: AGPL-3.0-only
//! P2 — REPRODUCIBILITY drift guard for the satellite-count sweep (Table 1) of the
//! surface-beacon-DOP service-volume paper.
//!
//! ## What this pins and what it does NOT
//! The paper's Table 1 (availability / median-GDOP / time-below-6 versus N) is an
//! **aggregate order statistic of an illustrative, public-source constellation** —
//! NOT a physically-fixed quantity. There is therefore no independent oracle for
//! the aggregate itself. (The per-sample DOP kernel these order statistics are
//! computed over *is* externally validated against gnss_lib_py — see
//! `tests/dop_reference.rs` — so the numerical machinery underneath is not the
//! thing at risk here.)
//!
//! This test is a **deterministic-regeneration drift guard**, not a claim of
//! external truth: it calls the public `sweep_over_n` on the paper's fixed
//! scenario and asserts the result reproduces a committed golden CSV bit-for-bit
//! (f64, parsed from `{:.17e}`), so any silent change to the aggregation pipeline
//! (median definition, visibility test, coverage bookkeeping, illustrative-orbit
//! elements) is caught. It additionally asserts the qualitative Table-1 structural
//! facts that are robust properties of the geometry: availability increases with
//! N, and the median GDOP transitions from > 6 (N <= 8) to < 6 (N >= 13),
//! bracketing the paper's "median crosses 6 near N ~ 10-12" statement (the
//! crossing zone N in 9..=12 is non-monotone, matching the paper's noted bump).
//!
//! The golden fixture and its regenerator live in
//! `tests/fixtures/lunar_service/nsweep_golden.csv` and
//! `examples/gen_p2_lunar_service_fixtures.rs`. The scenario definition below is
//! duplicated verbatim from that generator (the single source of truth).

use kshana::lunar::Selenographic;
use kshana::lunar_service::{sweep_over_n, NSweepRow};

const GOLDEN: &str = include_str!("fixtures/lunar_service/nsweep_golden.csv");

/// The P2 south-polar service volume: the -70..-90 deg band at three longitudes.
fn p2_grid() -> Vec<Selenographic> {
    let lats = [-90.0_f64, -80.0, -70.0];
    let lons = [-120.0_f64, 0.0, 120.0];
    let mut pts = Vec::new();
    for &lat in &lats {
        for &lon in &lons {
            pts.push(Selenographic {
                lat_rad: lat.to_radians(),
                lon_rad: lon.to_radians(),
                alt_m: 0.0,
            });
        }
    }
    pts
}

/// 12 h horizon at 1 h steps: 13 epochs.
fn p2_times() -> Vec<f64> {
    (0..=12).map(|k| k as f64 * 3600.0).collect()
}

fn mask_rad() -> f64 {
    5.0_f64.to_radians()
}

const PDOP_THRESHOLD: f64 = 6.0;

/// One parsed golden row: (n_sats, coverage_fraction, gdop_median, frac_below_gdop6).
struct GoldenRow {
    n_sats: usize,
    coverage_fraction: f64,
    gdop_median: Option<f64>,
    frac_below_gdop6: f64,
}

fn parse_golden() -> Vec<GoldenRow> {
    GOLDEN
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let c: Vec<&str> = l.split(',').collect();
            GoldenRow {
                n_sats: c[0].parse().unwrap(),
                coverage_fraction: c[1].parse().unwrap(),
                gdop_median: if c[2].is_empty() {
                    None
                } else {
                    Some(c[2].parse().unwrap())
                },
                frac_below_gdop6: c[3].parse().unwrap(),
            }
        })
        .collect()
}

/// Bit-exact f64 comparison via the round-trip of the committed `{:.17e}` text:
/// the golden stores the full 17-significant-digit decimal, which round-trips to
/// the identical f64, so parse-then-compare is exact for a deterministic engine.
fn same_f64(a: f64, b: f64) -> bool {
    a.to_bits() == b.to_bits()
}

#[test]
fn nsweep_reproduces_committed_golden_exactly() {
    let grid = p2_grid();
    let times = p2_times();
    let rows: Vec<NSweepRow> = sweep_over_n(4, 24, &grid, &times, mask_rad(), PDOP_THRESHOLD);
    let golden = parse_golden();

    assert_eq!(
        rows.len(),
        golden.len(),
        "row count drift: engine {} vs golden {}",
        rows.len(),
        golden.len()
    );
    assert_eq!(rows.len(), 21, "N = 4..=24 inclusive is 21 rows");

    for (r, g) in rows.iter().zip(golden.iter()) {
        assert_eq!(r.n_sats, g.n_sats, "n_sats drift");
        assert!(
            same_f64(r.coverage_fraction, g.coverage_fraction),
            "coverage_fraction drift at N={}: engine {:.17e} vs golden {:.17e}",
            r.n_sats,
            r.coverage_fraction,
            g.coverage_fraction
        );
        assert!(
            same_f64(r.frac_below_gdop6, g.frac_below_gdop6),
            "frac_below_gdop6 drift at N={}: engine {:.17e} vs golden {:.17e}",
            r.n_sats,
            r.frac_below_gdop6,
            g.frac_below_gdop6
        );
        match (r.gdop_median, g.gdop_median) {
            (Some(re), Some(ge)) => assert!(
                same_f64(re, ge),
                "gdop_median drift at N={}: engine {:.17e} vs golden {:.17e}",
                r.n_sats,
                re,
                ge
            ),
            (None, None) => {}
            (a, b) => panic!(
                "gdop_median None/Some drift at N={}: {:?} vs {:?}",
                r.n_sats, a, b
            ),
        }
    }
}

#[test]
fn nsweep_structural_table1_facts_hold() {
    let grid = p2_grid();
    let times = p2_times();
    let rows = sweep_over_n(4, 24, &grid, &times, mask_rad(), PDOP_THRESHOLD);

    // (1) Availability increases with constellation size (N=4 -> N=24 strictly up).
    let cov4 = rows.first().unwrap().coverage_fraction;
    let cov24 = rows.last().unwrap().coverage_fraction;
    assert!(
        cov24 > cov4,
        "availability must rise with N: N=4 {cov4} vs N=24 {cov24}"
    );

    // (2) The median GDOP transitions from > 6 to < 6 as N grows, bracketing the
    //     paper's "crosses 6 near N ~ 10-12". Robust bracket: every N <= 8 is
    //     above 6, every N >= 13 is below 6 (the transition zone N in 9..=12 is
    //     non-monotone, matching the paper's noted bump).
    for r in &rows {
        let g = r
            .gdop_median
            .expect("every N in the sweep yields a defined median GDOP");
        if r.n_sats <= 8 {
            assert!(
                g > 6.0,
                "median GDOP should still exceed 6 at N={} (got {g})",
                r.n_sats
            );
        } else if r.n_sats >= 13 {
            assert!(
                g < 6.0,
                "median GDOP should be below 6 at N={} (got {g})",
                r.n_sats
            );
        }
    }

    // (3) The crossing (first N with median GDOP < 6) lands in the paper's
    //     N ~ 10-12 neighbourhood (here N=9, the leading edge of that zone).
    let crossing = rows
        .iter()
        .find(|r| r.gdop_median.map(|g| g < 6.0).unwrap_or(false))
        .map(|r| r.n_sats)
        .expect("some N drives the median GDOP below 6");
    assert!(
        (8..=12).contains(&crossing),
        "median-GDOP-crosses-6 should be near N ~ 10-12 (got N={crossing})"
    );
}
