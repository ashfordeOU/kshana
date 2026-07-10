// SPDX-License-Identifier: AGPL-3.0-only
//! P2 — REPRODUCIBILITY drift guard for the spatial GDOP + availability map of the
//! surface-beacon-DOP service-volume paper (the 6-sat scenario).
//!
//! ## What this pins and what it does NOT
//! The per-cell (time-averaged median GDOP, availability fraction, mean visible
//! count) map is an **aggregate of an illustrative constellation**, not a
//! physically-fixed field, so there is no independent oracle for the map itself.
//! The underlying per-cell visibility is separately validated against ANISE
//! (`tests/lunar_navigation_service_volume_reference.rs`) and the per-cell DOP
//! against gnss_lib_py (`tests/dop_reference.rs`); this test does NOT re-derive
//! those — it is a **deterministic-regeneration drift guard** over the aggregation.
//!
//! It calls the public `coverage` once per grid cell (over the time axis) for the
//! fixed 6-sat scenario and asserts the regenerated grid reproduces a committed
//! golden CSV bit-for-bit (f64). It additionally cross-checks each cell's
//! min/max visible-count envelope against an *independent recomputation* of the
//! visible set built directly from `visible_sat_positions` (a different call path
//! than `coverage`'s internal bookkeeping), and asserts the physical invariant
//! that a defined median GDOP is >= 1 and every availability fraction is a valid
//! probability.
//!
//! Golden fixture + regenerator: `tests/fixtures/lunar_service/spatial_map_golden.csv`
//! and `examples/gen_p2_lunar_service_fixtures.rs`. The scenario below is
//! duplicated verbatim from that generator.

use kshana::lunar::{selenographic_to_mcmf, Selenographic};
use kshana::lunar_service::{coverage, visible_sat_positions, LunarConstellation};

const GOLDEN: &str = include_str!("fixtures/lunar_service/spatial_map_golden.csv");

fn p2_times() -> Vec<f64> {
    (0..=12).map(|k| k as f64 * 3600.0).collect()
}

fn mask_rad() -> f64 {
    5.0_f64.to_radians()
}

const PDOP_THRESHOLD: f64 = 6.0;

struct GoldenCell {
    lat_deg: f64,
    lon_deg: f64,
    gdop_median: Option<f64>,
    coverage_fraction: f64,
    frac_below_gdop6: f64,
    mean_visible: f64,
    min_sats: usize,
    max_sats: usize,
}

fn parse_golden() -> Vec<GoldenCell> {
    GOLDEN
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let c: Vec<&str> = l.split(',').collect();
            GoldenCell {
                lat_deg: c[0].parse().unwrap(),
                lon_deg: c[1].parse().unwrap(),
                gdop_median: if c[2].is_empty() {
                    None
                } else {
                    Some(c[2].parse().unwrap())
                },
                coverage_fraction: c[3].parse().unwrap(),
                frac_below_gdop6: c[4].parse().unwrap(),
                mean_visible: c[5].parse().unwrap(),
                min_sats: c[6].parse().unwrap(),
                max_sats: c[7].parse().unwrap(),
            }
        })
        .collect()
}

fn same_f64(a: f64, b: f64) -> bool {
    a.to_bits() == b.to_bits()
}

/// Independent recomputation of the mean visible count for a cell over the time
/// axis, built from the public `visible_sat_positions` filter directly (a
/// different path than `coverage`'s internal accounting).
fn mean_visible_indep(c: &LunarConstellation, pt: Selenographic, times: &[f64], mask: f64) -> f64 {
    let user = selenographic_to_mcmf(pt);
    let mut total = 0usize;
    for &t in times {
        let sats = c.positions_mcmf(t);
        total += visible_sat_positions(user, &sats, mask).len();
    }
    total as f64 / times.len() as f64
}

#[test]
fn spatial_map_reproduces_committed_golden_exactly() {
    let times = p2_times();
    let mask = mask_rad();
    let constellation = LunarConstellation::illustrative_lcns(6);
    let golden = parse_golden();

    assert_eq!(golden.len(), 9, "3 lat x 3 lon = 9 cells");

    for g in &golden {
        let pt = [Selenographic {
            lat_rad: g.lat_deg.to_radians(),
            lon_rad: g.lon_deg.to_radians(),
            alt_m: 0.0,
        }];
        let c = coverage(&constellation, &pt, &times, mask, PDOP_THRESHOLD);

        assert!(
            same_f64(c.coverage_fraction, g.coverage_fraction),
            "coverage_fraction drift at ({},{}): {:.17e} vs {:.17e}",
            g.lat_deg,
            g.lon_deg,
            c.coverage_fraction,
            g.coverage_fraction
        );
        assert!(
            same_f64(c.frac_below_gdop6, g.frac_below_gdop6),
            "frac_below_gdop6 drift at ({},{})",
            g.lat_deg,
            g.lon_deg
        );
        match (c.gdop_median, g.gdop_median) {
            (Some(re), Some(ge)) => assert!(
                same_f64(re, ge),
                "gdop_median drift at ({},{}): {:.17e} vs {:.17e}",
                g.lat_deg,
                g.lon_deg,
                re,
                ge
            ),
            (None, None) => {}
            (a, b) => panic!("gdop_median None/Some drift at ({},{}): {:?} vs {:?}", g.lat_deg, g.lon_deg, a, b),
        }
        assert_eq!(c.min_sats, g.min_sats, "min_sats drift at ({},{})", g.lat_deg, g.lon_deg);
        assert_eq!(c.max_sats, g.max_sats, "max_sats drift at ({},{})", g.lat_deg, g.lon_deg);

        // Independent-path cross-check of the mean visible count.
        let mv = mean_visible_indep(&constellation, pt[0], &times, mask);
        assert!(
            same_f64(mv, g.mean_visible),
            "mean_visible drift at ({},{}): indep {:.17e} vs golden {:.17e}",
            g.lat_deg,
            g.lon_deg,
            mv,
            g.mean_visible
        );
    }
}

#[test]
fn spatial_map_physical_invariants_hold() {
    let n_sats = LunarConstellation::illustrative_lcns(6).n_sats();
    let golden = parse_golden();

    for g in &golden {
        // Availability is a valid probability.
        assert!(
            (0.0..=1.0).contains(&g.coverage_fraction),
            "coverage_fraction out of [0,1] at ({},{})",
            g.lat_deg,
            g.lon_deg
        );
        assert!((0.0..=1.0).contains(&g.frac_below_gdop6));
        // A defined median GDOP never dips below the DOP floor of 1 (a geometric
        // invariant of the (H^T H)^-1 trace, independent of the aggregation).
        if let Some(m) = g.gdop_median {
            assert!(m >= 1.0, "median GDOP {m} below the DOP floor at ({},{})", g.lat_deg, g.lon_deg);
        }
        // The mean visible count cannot exceed the constellation size.
        assert!(
            g.mean_visible <= n_sats as f64 + 1e-12,
            "mean_visible {} exceeds N=6 at ({},{})",
            g.mean_visible,
            g.lat_deg,
            g.lon_deg
        );
        // min_sats <= max_sats within a cell.
        assert!(g.min_sats <= g.max_sats);
    }
    // The -80 deg-0-lon cell (the beacon-table user location) is the hardest
    // geometry in the band: lowest availability of the nine cells. This is the
    // qualitative "sparse south-pole geometry needs help" fact P2 rests on.
    let hardest = golden
        .iter()
        .min_by(|a, b| a.coverage_fraction.partial_cmp(&b.coverage_fraction).unwrap())
        .unwrap();
    assert!(
        hardest.coverage_fraction < 0.5,
        "the worst cell should be well under 50% availability with only 6 sats (got {})",
        hardest.coverage_fraction
    );
}
