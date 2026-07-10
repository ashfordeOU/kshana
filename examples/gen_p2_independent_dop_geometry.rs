// SPDX-License-Identifier: AGPL-3.0-only
//! Throwaway geometry-extraction generator for the P2 *independent DOP validation*
//! fixtures (`tests/fixtures/p2_independent_dop/`).
//!
//! This binary does exactly one thing: it dumps, for each of the three P2
//! configurations (satellite-count sweep, spatial GDOP map, beacon before/after),
//! the *line-of-sight geometry* that Kshana's public API actually produces — the
//! per-source LOS unit vectors from the surface user to every visible satellite (and,
//! for the beacon case, every visible surface beacon) — together with Kshana's own
//! GDOP/HDOP/VDOP for that geometry.
//!
//! It writes those raw geometries to intermediate JSON files. An INDEPENDENT numpy
//! generator (`gen_p2_independent_dop.py`) then reads the geometry, recomputes GDOP
//! FROM SCRATCH via `(HᵀH)⁻¹` (a genuinely different code path than Kshana's
//! `orbit::dop`), and emits the committed reference CSVs. The Rust validation tests
//! (`tests/validate_p2_*_independent_dop.rs`) reconstruct the same geometry via the
//! public API, assert the LOS vectors match the committed fixture (geometry
//! stability), then assert Kshana's GDOP equals the numpy reference GDOP.
//!
//! Non-circular: the DOP *number* is checked against an independent numpy
//! implementation; only the *geometry* comes from Kshana — exactly as
//! `tests/dop_reference.rs` feeds a fully-specified geometry into gnss_lib_py. The
//! geometry/propagation is a separately-Validated claim; here we validate the DOP for
//! that geometry.
//!
//! Run: cargo run --example gen_p2_independent_dop_geometry

use kshana::lunar::{selenographic_to_mcmf, Selenographic};
use kshana::lunar_beacon::{dop_with_beacons, visible_beacons};
use kshana::lunar_service::{
    service_dop, sweep_over_n, visible_sat_positions, LunarConstellation, NSweepRow,
};
use kshana::orbit::{dop, enu_basis, los_unit};
use std::fmt::Write as _;
use std::fs;

type Vec3 = [f64; 3];

// ---------------------------------------------------------------------------
// P2 fixed scenario definition (mirrors the reproducibility generator verbatim).
// ---------------------------------------------------------------------------

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

const PDOP_THRESHOLD: f64 = 6.0;

fn site(lat_deg: f64, lon_deg: f64, height_m: f64) -> Vec3 {
    selenographic_to_mcmf(Selenographic {
        lat_rad: lat_deg.to_radians(),
        lon_rad: lon_deg.to_radians(),
        alt_m: height_m,
    })
}

fn p2_user() -> Vec3 {
    site(-80.0, 0.0, 2.0)
}

fn p2_beacons() -> [Vec3; 3] {
    [
        site(-80.0, 0.0, 2_000.0),
        site(-79.0, 60.0, 2_000.0),
        site(-79.0, -60.0, 2_000.0),
    ]
}

/// Serialise a list of LOS unit vectors as `x:y:z|x:y:z|...` at full f64 precision.
fn los_to_str(los: &[Vec3]) -> String {
    los.iter()
        .map(|v| format!("{:.17e}:{:.17e}:{:.17e}", v[0], v[1], v[2]))
        .collect::<Vec<_>>()
        .join("|")
}

/// Serialise the user's ENU basis (east,north,up) as
/// `ex:ey:ez:nx:ny:nz:ux:uy:uz` at full f64 precision. numpy uses this to
/// reproduce the horizontal/vertical DOP split in the same frame Kshana uses.
fn enu_to_str(user: Vec3) -> String {
    let (e, n, u) = enu_basis(user).expect("valid ENU basis at a surface user");
    format!(
        "{:.17e}:{:.17e}:{:.17e}:{:.17e}:{:.17e}:{:.17e}:{:.17e}:{:.17e}:{:.17e}",
        e[0], e[1], e[2], n[0], n[1], n[2], u[0], u[1], u[2]
    )
}

/// LOS unit vectors from a user to a set of source positions (already visibility
/// filtered). Uses Kshana's own `orbit::los_unit` — the exact directions that feed
/// `orbit::dop`. Any source coincident with the user is skipped (as the kernel does).
fn los_vecs(user: Vec3, sources: &[Vec3]) -> Vec<Vec3> {
    sources.iter().filter_map(|&s| los_unit(user, s)).collect()
}

fn main() {
    let out_dir = "tests/fixtures/p2_independent_dop";
    fs::create_dir_all(out_dir).expect("mkdir fixtures/p2_independent_dop");

    let grid = p2_grid();
    let times = p2_times();
    let mask = mask_rad();

    // -----------------------------------------------------------------------
    // Config 1: satellite-count sweep. For a few representative N, dump every
    // per-(cell,epoch) sample geometry that has >= 4 visible satellites (i.e.
    // every sample that contributes a GDOP to the median / frac-below-6
    // aggregate), plus Kshana's aggregate row. numpy will recompute each per-
    // sample GDOP and the aggregate order statistics independently.
    // -----------------------------------------------------------------------
    {
        let mut s = String::new();
        // header describing scenario for provenance
        writeln!(
            s,
            "# P2 satellite-count-sweep geometry dump — Kshana public API (orbit::los_unit)."
        )
        .unwrap();
        writeln!(
            s,
            "# Per representative N: one line per (cell,epoch) sample with >=4 visible sats."
        )
        .unwrap();
        writeln!(
            s,
            "# sample line: SAMPLE;N;cell_idx;epoch_idx;n_vis;kshana_gdop;kshana_pdop;kshana_hdop;kshana_vdop;los(x:y:z|...);enu(ex:..:uz)"
        )
        .unwrap();
        writeln!(
            s,
            "# aggregate line: AGG;N;kshana_gdop_median;kshana_frac_below_gdop6;kshana_coverage_fraction;n_samples_total"
        )
        .unwrap();

        // The aggregate rows Kshana reports (single source of truth) for N=4..=24.
        let sweep: Vec<NSweepRow> = sweep_over_n(4, 24, &grid, &times, mask, PDOP_THRESHOLD);

        // Representative N to expand the full per-sample geometry for.
        let rep_ns = [6usize, 12, 24];
        for &n in &rep_ns {
            let constellation = LunarConstellation::illustrative_lcns(n);
            for (ti, &t) in times.iter().enumerate() {
                let sats = constellation.positions_mcmf(t);
                for (ci, &cell) in grid.iter().enumerate() {
                    let user = selenographic_to_mcmf(cell);
                    let vis = visible_sat_positions(user, &sats, mask);
                    if vis.len() < 4 {
                        continue;
                    }
                    let los = los_vecs(user, &vis);
                    let d = dop(user, &vis).expect(">=4 visible => defined DOP");
                    writeln!(
                        s,
                        "SAMPLE;{n};{ci};{ti};{};{:.17e};{:.17e};{:.17e};{:.17e};{};{}",
                        los.len(),
                        d.gdop,
                        d.pdop,
                        d.hdop,
                        d.vdop,
                        los_to_str(&los),
                        enu_to_str(user)
                    )
                    .unwrap();
                }
            }
            // Kshana's own aggregate for this N.
            let row = sweep
                .iter()
                .find(|r| r.n_sats == n)
                .expect("representative N present in the sweep");
            let n_samples_total = grid.len() * times.len();
            writeln!(
                s,
                "AGG;{n};{};{:.17e};{:.17e};{}",
                match row.gdop_median {
                    Some(m) => format!("{m:.17e}"),
                    None => String::new(),
                },
                row.frac_below_gdop6,
                row.coverage_fraction,
                n_samples_total
            )
            .unwrap();
        }
        fs::write(format!("{out_dir}/nsweep_geometry.txt"), s).unwrap();
    }

    // -----------------------------------------------------------------------
    // Config 2: spatial GDOP map (6-sat scenario). For each grid cell, dump the
    // TIME-AVERAGED map value Kshana reports is an aggregate; the independently
    // checkable per-cell object is the per-epoch GDOP. We dump, for the 6-sat
    // scenario, every (cell,epoch) sample geometry with >=4 sats so numpy can
    // reproduce each per-cell/per-epoch GDOP. We pick a set of representative
    // cells (all 9) and representative epochs (all 13) — full expansion is cheap.
    // -----------------------------------------------------------------------
    {
        let mut s = String::new();
        writeln!(
            s,
            "# P2 spatial-map geometry dump — 6-sat illustrative_lcns, Kshana public API."
        )
        .unwrap();
        writeln!(
            s,
            "# line: CELL;lat_deg;lon_deg;epoch_idx;n_vis;kshana_gdop;kshana_hdop;kshana_vdop;los(x:y:z|...);enu(ex:..:uz)"
        )
        .unwrap();
        let constellation = LunarConstellation::illustrative_lcns(6);
        let lat_lon: Vec<(f64, f64)> = grid
            .iter()
            .map(|c| (c.lat_rad.to_degrees(), c.lon_rad.to_degrees()))
            .collect();
        for (ti, &t) in times.iter().enumerate() {
            let sats = constellation.positions_mcmf(t);
            for (ci, &cell) in grid.iter().enumerate() {
                let user = selenographic_to_mcmf(cell);
                let vis = visible_sat_positions(user, &sats, mask);
                if vis.len() < 4 {
                    continue;
                }
                let los = los_vecs(user, &vis);
                let d = dop(user, &vis).expect(">=4 visible => defined DOP");
                let (lat, lon) = lat_lon[ci];
                writeln!(
                    s,
                    "CELL;{:.1};{:.1};{ti};{};{:.17e};{:.17e};{:.17e};{};{}",
                    lat,
                    lon,
                    los.len(),
                    d.gdop,
                    d.hdop,
                    d.vdop,
                    los_to_str(&los),
                    enu_to_str(user)
                )
                .unwrap();
            }
        }
        fs::write(format!("{out_dir}/spatial_map_geometry.txt"), s).unwrap();
    }

    // -----------------------------------------------------------------------
    // Config 3: beacon before/after (-80 deg user, 6-sat t0 snapshot + 3 beacons).
    // Dump (a) satellites-only LOS geometry and Kshana GDOP, and (b) satellites +
    // visible-beacons LOS geometry and Kshana GDOP. numpy reproduces both GDOPs
    // and their ratio.
    // -----------------------------------------------------------------------
    {
        let mut s = String::new();
        writeln!(
            s,
            "# P2 beacon before/after geometry dump — -80 deg user, 6-sat t0 + 3 beacons."
        )
        .unwrap();
        writeln!(
            s,
            "# line: CONFIG;label;n_src;kshana_gdop;kshana_hdop;kshana_vdop;los(x:y:z|...);enu(ex:..:uz)"
        )
        .unwrap();
        let user = p2_user();
        let user_enu = enu_to_str(user);
        let sats = LunarConstellation::illustrative_lcns(6).positions_mcmf(0.0);
        let beacons = p2_beacons();

        // (a) satellites only.
        let vis_sats = visible_sat_positions(user, &sats, mask);
        let los_before = los_vecs(user, &vis_sats);
        let d_before = service_dop(user, &sats, mask).expect("6-sat only admits a GDOP");
        writeln!(
            s,
            "CONFIG;sats_only;{};{:.17e};{:.17e};{:.17e};{};{}",
            los_before.len(),
            d_before.gdop,
            d_before.hdop,
            d_before.vdop,
            los_to_str(&los_before),
            user_enu
        )
        .unwrap();

        // (b) satellites + visible beacons.
        let vis_beacons = visible_beacons(user, &beacons);
        let mut sources = vis_sats.clone();
        sources.extend(vis_beacons.iter().copied());
        let los_after = los_vecs(user, &sources);
        let d_after =
            dop_with_beacons(user, &sats, &beacons, mask).expect("6-sat + beacons admits a GDOP");
        writeln!(
            s,
            "CONFIG;sats_plus_beacons;{};{:.17e};{:.17e};{:.17e};{};{}",
            los_after.len(),
            d_after.gdop,
            d_after.hdop,
            d_after.vdop,
            los_to_str(&los_after),
            user_enu
        )
        .unwrap();

        // Record the number of visible beacons for provenance.
        writeln!(s, "# n_visible_beacons={}", vis_beacons.len()).unwrap();
        fs::write(format!("{out_dir}/beacon_before_after_geometry.txt"), s).unwrap();
    }

    println!("wrote geometry dumps to {out_dir}/");
}
