// SPDX-License-Identifier: AGPL-3.0-only
//! P2 — **VALIDATION** of the satellite-count-sweep GDOP numbers against an
//! INDEPENDENT numpy DOP oracle (upgrades the reproducibility drift-guard in
//! `tests/validate_p2_nsweep_table.rs` from "Reproducible" to "Validated").
//!
//! ## What this validates and why it is non-circular
//! The paper's Table 1 (median GDOP / time-below-GDOP-6 versus constellation size N)
//! is an order statistic over a per-sample GDOP series. This test proves those GDOP
//! numbers are *independently correct*, not merely self-consistent:
//!
//! * The **geometry** — the per-sample line-of-sight unit vectors from each surface
//!   user to every visible satellite, and the user's ENU basis — is reconstructed
//!   here from Kshana's public API (`positions_mcmf` -> `visible_sat_positions` ->
//!   `orbit::los_unit` / `orbit::enu_basis`) and asserted to match the committed
//!   fixture vectors (geometry stability). This is exactly what `tests/dop_reference.rs`
//!   does: the geometry/propagation is a SEPARATELY-Validated claim; only the DOP
//!   number for that geometry is under test here.
//! * The **GDOP number** is checked against a committed reference computed FROM
//!   SCRATCH in numpy (`(HᵀH)⁻¹` via `np.linalg.inv`; see
//!   `tests/fixtures/p2_independent_dop/gen_p2_independent_dop.py`) — a genuinely
//!   different code path from Kshana's hand-rolled 4x4 Gauss-Jordan `orbit::dop`.
//!
//! It then validates the two reported aggregates (median GDOP and fraction-below-6)
//! by recomputing Kshana's `sweep_over_n` order statistics and requiring they equal
//! the INDEPENDENT numpy statistic over the same committed per-sample GDOP series.
//!
//! No Python at runtime: the numpy reference lives in the committed CSVs.

use kshana::lunar::{selenographic_to_mcmf, Selenographic};
use kshana::lunar_service::{sweep_over_n, visible_sat_positions, LunarConstellation, NSweepRow};
use kshana::orbit::{dop, enu_basis, los_unit};

type Vec3 = [f64; 3];

const SAMPLES: &str = include_str!("fixtures/p2_independent_dop/nsweep_samples_reference.csv");
const AGG: &str = include_str!("fixtures/p2_independent_dop/nsweep_aggregate_reference.csv");

/// Matches `tests/dop_reference.rs`: numpy LAPACK vs Kshana Gauss-Jordan agree to
/// ~1e-9 on well-conditioned geometry; this bound also covers the near-singular
/// polar tail (GDOP in the thousands) without hiding a real discrepancy.
const REL_TOL: f64 = 1e-6;
/// The committed LOS unit vectors are the exact f64 the engine produced (round-trip
/// of `{:.17e}`), so geometry reconstruction must match to a few ULP.
const GEOM_TOL: f64 = 1e-12;
const PDOP_THRESHOLD: f64 = 6.0;

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

fn p2_times() -> Vec<f64> {
    (0..=12).map(|k| k as f64 * 3600.0).collect()
}

fn mask_rad() -> f64 {
    5.0_f64.to_radians()
}

fn rel_diff(got: f64, want: f64) -> f64 {
    (got - want).abs() / want.abs().max(1e-12)
}

fn parse_los(field: &str) -> Vec<Vec3> {
    field
        .split('|')
        .map(|tok| {
            let mut it = tok.split(':').map(|v| v.parse::<f64>().unwrap());
            [it.next().unwrap(), it.next().unwrap(), it.next().unwrap()]
        })
        .collect()
}

/// A parsed independent-reference per-sample row.
struct SampleRef {
    n: usize,
    cell_idx: usize,
    epoch_idx: usize,
    n_vis: usize,
    ref_gdop: f64,
    ref_pdop: f64,
    ref_hdop: f64,
    ref_vdop: f64,
    los: Vec<Vec3>,
}

fn parse_samples() -> Vec<SampleRef> {
    SAMPLES
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let c: Vec<&str> = l.split(',').collect();
            SampleRef {
                n: c[0].parse().unwrap(),
                cell_idx: c[1].parse().unwrap(),
                epoch_idx: c[2].parse().unwrap(),
                n_vis: c[3].parse().unwrap(),
                ref_gdop: c[4].parse().unwrap(),
                ref_pdop: c[5].parse().unwrap(),
                ref_hdop: c[6].parse().unwrap(),
                ref_vdop: c[7].parse().unwrap(),
                los: parse_los(c[8]),
            }
        })
        .collect()
}

struct AggRef {
    n: usize,
    ref_gdop_median: Option<f64>,
    ref_frac_below_gdop6: f64,
    ref_coverage_fraction: f64,
    n_samples_total: usize,
    n_defined_dop: usize,
}

fn parse_agg() -> Vec<AggRef> {
    AGG.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let c: Vec<&str> = l.split(',').collect();
            AggRef {
                n: c[0].parse().unwrap(),
                ref_gdop_median: if c[1].is_empty() {
                    None
                } else {
                    Some(c[1].parse().unwrap())
                },
                ref_frac_below_gdop6: c[2].parse().unwrap(),
                ref_coverage_fraction: c[3].parse().unwrap(),
                n_samples_total: c[4].parse().unwrap(),
                n_defined_dop: c[5].parse().unwrap(),
            }
        })
        .collect()
}

/// Reconstruct the exact LOS unit vectors Kshana produces for one (N, cell, epoch)
/// sample, via the public API only.
fn reconstruct_los(n: usize, cell: Selenographic, t: f64, mask: f64) -> (Vec3, Vec<Vec3>) {
    let constellation = LunarConstellation::illustrative_lcns(n);
    let sats = constellation.positions_mcmf(t);
    let user = selenographic_to_mcmf(cell);
    let vis = visible_sat_positions(user, &sats, mask);
    let los: Vec<Vec3> = vis.iter().filter_map(|&s| los_unit(user, s)).collect();
    (user, los)
}

fn assert_los_matches(label: &str, got: &[Vec3], want: &[Vec3]) {
    assert_eq!(
        got.len(),
        want.len(),
        "{label}: LOS count {} vs fixture {}",
        got.len(),
        want.len()
    );
    for (i, (g, w)) in got.iter().zip(want).enumerate() {
        for k in 0..3 {
            assert!(
                (g[k] - w[k]).abs() <= GEOM_TOL,
                "{label}: LOS[{i}][{k}] geometry drift {:.17e} vs fixture {:.17e}",
                g[k],
                w[k]
            );
        }
    }
}

#[test]
fn nsweep_per_sample_gdop_matches_independent_numpy() {
    let grid = p2_grid();
    let times = p2_times();
    let mask = mask_rad();
    let samples = parse_samples();
    assert!(
        samples.len() >= 300,
        "expected the full per-sample expansion (>=300 rows), got {}",
        samples.len()
    );

    let mut checked = 0usize;
    for s in &samples {
        let cell = grid[s.cell_idx];
        let t = times[s.epoch_idx];

        // (1) Geometry stability: the reconstructed LOS vectors match the fixture.
        let (user, los) = reconstruct_los(s.n, cell, t, mask);
        let label = format!("N={} cell={} epoch={}", s.n, s.cell_idx, s.epoch_idx);
        assert_eq!(los.len(), s.n_vis, "{label}: visible count vs fixture");
        assert_los_matches(&label, &los, &s.los);

        // (2) DOP number validation: Kshana's GDOP for this geometry equals the
        //     INDEPENDENT numpy reference GDOP (and PDOP/HDOP/VDOP).
        let constellation = LunarConstellation::illustrative_lcns(s.n);
        let sats = constellation.positions_mcmf(t);
        let vis = visible_sat_positions(user, &sats, mask);
        let d = dop(user, &vis).unwrap_or_else(|| panic!("{label}: dop() None"));
        // Oracle must be a physical, non-trivial DOP.
        assert!(s.ref_gdop > 0.0 && s.ref_pdop > 0.0, "{label}: trivial oracle");
        for (name, got, want) in [
            ("GDOP", d.gdop, s.ref_gdop),
            ("PDOP", d.pdop, s.ref_pdop),
            ("HDOP", d.hdop, s.ref_hdop),
            ("VDOP", d.vdop, s.ref_vdop),
        ] {
            let rd = rel_diff(got, want);
            assert!(
                rd <= REL_TOL,
                "{label}: {name} {got:.9e} vs numpy {want:.9e} (rel {rd:.2e} > {REL_TOL:.0e})"
            );
        }
        // ENU basis is reconstructible (used by the numpy oracle's H/V split).
        assert!(enu_basis(user).is_some(), "{label}: ENU basis defined");
        checked += 1;
    }
    println!("nsweep: validated {checked} per-sample GDOPs against independent numpy");
}

#[test]
fn nsweep_reported_aggregates_match_independent_numpy() {
    let grid = p2_grid();
    let times = p2_times();
    let mask = mask_rad();
    let agg = parse_agg();
    assert!(agg.len() >= 3, "expected >=3 representative N aggregate rows");

    // Kshana's own reported aggregates for every N.
    let sweep: Vec<NSweepRow> = sweep_over_n(4, 24, &grid, &times, mask, PDOP_THRESHOLD);

    for a in &agg {
        let row = sweep
            .iter()
            .find(|r| r.n_sats == a.n)
            .unwrap_or_else(|| panic!("N={} present in the sweep", a.n));
        let label = format!("N={}", a.n);

        // (a) Median GDOP: Kshana's order statistic == the INDEPENDENT numpy median
        //     over the committed per-sample series.
        match (row.gdop_median, a.ref_gdop_median) {
            (Some(k), Some(r)) => {
                let rd = rel_diff(k, r);
                assert!(
                    rd <= REL_TOL,
                    "{label}: median GDOP kshana {k:.9e} vs numpy {r:.9e} (rel {rd:.2e})"
                );
            }
            (None, None) => {}
            (k, r) => panic!("{label}: median None/Some drift {k:?} vs {r:?}"),
        }

        // (b) Time-below-GDOP-6: Kshana's fraction == the INDEPENDENT numpy fraction.
        let rd_fb = rel_diff(row.frac_below_gdop6, a.ref_frac_below_gdop6);
        assert!(
            rd_fb <= REL_TOL,
            "{label}: frac_below_gdop6 kshana {:.9e} vs numpy {:.9e} (rel {rd_fb:.2e})",
            row.frac_below_gdop6,
            a.ref_frac_below_gdop6
        );

        // (c) Availability (PDOP<6): Kshana's coverage fraction == numpy's, a bonus
        //     cross-check on the PDOP series feeding the same table.
        let rd_cov = rel_diff(row.coverage_fraction, a.ref_coverage_fraction);
        assert!(
            rd_cov <= REL_TOL,
            "{label}: coverage_fraction kshana {:.9e} vs numpy {:.9e} (rel {rd_cov:.2e})",
            row.coverage_fraction,
            a.ref_coverage_fraction
        );

        // Sanity: the aggregate really was computed over a non-empty defined-DOP set.
        assert!(
            a.n_defined_dop > 0 && a.n_samples_total > 0,
            "{label}: empty aggregate support"
        );
        println!(
            "N={}: median GDOP kshana {:?} == numpy {:?}; time<6 {:.4} == {:.4}; avail {:.4} == {:.4}",
            a.n,
            row.gdop_median,
            a.ref_gdop_median,
            row.frac_below_gdop6,
            a.ref_frac_below_gdop6,
            row.coverage_fraction,
            a.ref_coverage_fraction
        );
    }
}
