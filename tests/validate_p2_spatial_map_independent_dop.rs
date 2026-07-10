// SPDX-License-Identifier: AGPL-3.0-only
//! P2 — **VALIDATION** of the spatial GDOP map values against an INDEPENDENT numpy
//! DOP oracle (upgrades `tests/validate_p2_spatial_map.rs` from "Reproducible" to
//! "Validated").
//!
//! ## What this validates and why it is non-circular
//! The paper's spatial map reports, per grid cell in the -70..-90 deg south-polar
//! band, a GDOP value built from the per-epoch line-of-sight geometry of the 6-sat
//! illustrative constellation. This test proves those per-cell GDOP numbers are
//! *independently correct*:
//!
//! * The **geometry** — the LOS unit vectors from each cell's user to every visible
//!   satellite at each epoch, and the user's ENU basis — is reconstructed from
//!   Kshana's public API and asserted to match the committed fixture vectors
//!   (geometry stability; the propagation is a separately-Validated claim).
//! * The **GDOP number** for each (cell, epoch) is checked against a committed
//!   reference computed FROM SCRATCH in numpy (`(HᵀH)⁻¹`; see
//!   `tests/fixtures/p2_independent_dop/gen_p2_independent_dop.py`) — a different code
//!   path from Kshana's Rust `orbit::dop`.
//!
//! Together these validate the map's cell values (the -80 deg-0-lon cell, the
//! beacon-table user location, is included), not just their reproducibility.
//!
//! No Python at runtime: the numpy reference lives in the committed CSV.

use kshana::lunar::{selenographic_to_mcmf, Selenographic};
use kshana::lunar_service::{visible_sat_positions, LunarConstellation};
use kshana::orbit::{dop, enu_basis, los_unit};

type Vec3 = [f64; 3];

const REF: &str = include_str!("fixtures/p2_independent_dop/spatial_map_reference.csv");

const REL_TOL: f64 = 1e-6;
const GEOM_TOL: f64 = 1e-12;

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

struct CellRef {
    lat_deg: f64,
    lon_deg: f64,
    epoch_idx: usize,
    n_vis: usize,
    ref_gdop: f64,
    ref_hdop: f64,
    ref_vdop: f64,
    los: Vec<Vec3>,
}

fn parse_ref() -> Vec<CellRef> {
    REF.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let c: Vec<&str> = l.split(',').collect();
            CellRef {
                lat_deg: c[0].parse().unwrap(),
                lon_deg: c[1].parse().unwrap(),
                epoch_idx: c[2].parse().unwrap(),
                n_vis: c[3].parse().unwrap(),
                ref_gdop: c[4].parse().unwrap(),
                ref_hdop: c[5].parse().unwrap(),
                ref_vdop: c[6].parse().unwrap(),
                los: parse_los(c[7]),
            }
        })
        .collect()
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
fn spatial_map_per_cell_gdop_matches_independent_numpy() {
    let times = p2_times();
    let mask = mask_rad();
    let constellation = LunarConstellation::illustrative_lcns(6);
    let refs = parse_ref();
    assert!(
        refs.len() >= 100,
        "expected the full per-cell/epoch expansion, got {}",
        refs.len()
    );

    // Distinct representative cells the map covers (the -80/0 beacon-user cell too).
    let mut cells_seen = std::collections::BTreeSet::new();
    let mut checked = 0usize;

    for r in &refs {
        let cell = Selenographic {
            lat_rad: r.lat_deg.to_radians(),
            lon_rad: r.lon_deg.to_radians(),
            alt_m: 0.0,
        };
        let t = times[r.epoch_idx];
        let user = selenographic_to_mcmf(cell);
        let sats = constellation.positions_mcmf(t);
        let vis = visible_sat_positions(user, &sats, mask);
        let los: Vec<Vec3> = vis.iter().filter_map(|&s| los_unit(user, s)).collect();
        let label = format!("cell({},{}) epoch={}", r.lat_deg, r.lon_deg, r.epoch_idx);

        // (1) Geometry stability.
        assert_eq!(los.len(), r.n_vis, "{label}: visible count vs fixture");
        assert_los_matches(&label, &los, &r.los);

        // (2) DOP number validation vs independent numpy.
        let d = dop(user, &vis).unwrap_or_else(|| panic!("{label}: dop() None"));
        assert!(r.ref_gdop > 0.0, "{label}: trivial oracle");
        for (name, got, want) in [
            ("GDOP", d.gdop, r.ref_gdop),
            ("HDOP", d.hdop, r.ref_hdop),
            ("VDOP", d.vdop, r.ref_vdop),
        ] {
            let rd = rel_diff(got, want);
            assert!(
                rd <= REL_TOL,
                "{label}: {name} {got:.9e} vs numpy {want:.9e} (rel {rd:.2e} > {REL_TOL:.0e})"
            );
        }
        assert!(enu_basis(user).is_some(), "{label}: ENU basis defined");
        cells_seen.insert((r.lat_deg.to_bits(), r.lon_deg.to_bits()));
        checked += 1;
    }

    // The map spans multiple distinct cells and includes the -80/0 beacon-user cell.
    assert!(
        cells_seen.len() >= 3,
        "spatial map should cover several distinct cells, saw {}",
        cells_seen.len()
    );
    let has_beacon_cell = refs
        .iter()
        .any(|r| (r.lat_deg + 80.0).abs() < 1e-9 && r.lon_deg.abs() < 1e-9);
    assert!(
        has_beacon_cell,
        "the -80 deg / 0 lon beacon-table user cell must be in the validated map"
    );
    println!(
        "spatial_map: validated {checked} per-cell/epoch GDOPs across {} cells vs independent numpy",
        cells_seen.len()
    );
}
