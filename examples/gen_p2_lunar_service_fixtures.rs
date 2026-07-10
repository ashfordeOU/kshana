// SPDX-License-Identifier: AGPL-3.0-only
//! Throwaway generator: emit the frozen golden fixtures the P2 surface-beacon-DOP
//! reproducibility drift-guards consume.
//!
//! P2 ("A dilution-of-precision service-volume method for a lunar navigation
//! constellation, with surface-beacon augmentation") reports three aggregate
//! products over an *illustrative, public-source* ELFO constellation:
//!   1. a satellite-count sweep N = 4..24 (Table 1),
//!   2. a spatial GDOP + availability map over a selenographic grid, and
//!   3. a before/after GDOP table for a -80 deg user with three surface beacons.
//!
//! These aggregates are NOT physically-fixed quantities — they are order
//! statistics of a chosen (illustrative) geometry — so there is no independent
//! oracle for the aggregate. The underlying per-sample DOP kernel is already
//! externally validated against gnss_lib_py (see tests/dop_reference.rs); what
//! these fixtures pin is the DETERMINISTIC REPRODUCIBILITY of the aggregate
//! pipeline (`sweep_over_n`, `coverage`, `dop_with_beacons`), i.e. a drift guard,
//! NOT a claim of external truth.
//!
//! This binary serialises the real engine output into three CSVs under
//! `tests/fixtures/lunar_service/`, which the `tests/validate_p2_*.rs` tests then
//! reload and reproduce bit-for-bit. The scenario definitions here are the single
//! source of truth and are duplicated verbatim in the tests (a fixture with no
//! scenario spec would be un-regenerable).
//!
//! Run: cargo run --example gen_p2_lunar_service_fixtures

use kshana::lunar::{selenographic_to_mcmf, Selenographic};
use kshana::lunar_beacon::dop_with_beacons;
use kshana::lunar_service::{coverage, sweep_over_n, LunarConstellation};
use std::fmt::Write as _;
use std::fs;

type Vec3 = [f64; 3];

// ---------------------------------------------------------------------------
// P2 fixed scenario definition (the single source of truth, mirrored in tests).
// ---------------------------------------------------------------------------

/// The P2 south-polar service volume: the -70..-90 deg latitude band at three
/// representative longitudes, over a 12 h horizon at 1 h steps, 5 deg mask,
/// PDOP threshold 6. This is the exact grid the sweep + map are reported over.
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

/// 12 h horizon at 1 h steps: t = 0, 3600, ..., 43200 s (13 epochs).
fn p2_times() -> Vec<f64> {
    (0..=12).map(|k| k as f64 * 3600.0).collect()
}

fn mask_rad() -> f64 {
    5.0_f64.to_radians()
}

const PDOP_THRESHOLD: f64 = 6.0;

/// Selenographic surface site -> MCMF (deg in, altitude m).
fn site(lat_deg: f64, lon_deg: f64, height_m: f64) -> Vec3 {
    selenographic_to_mcmf(Selenographic {
        lat_rad: lat_deg.to_radians(),
        lon_rad: lon_deg.to_radians(),
        alt_m: height_m,
    })
}

/// The three P2 surface beacons for the -80 deg-user before/after table: three
/// surveyed sites ~1 deg of arc from the user at 120 deg azimuth spacing (a few
/// km, within the airless horizon), each on a 2 km mast.
fn p2_beacon_sites() -> [Vec3; 3] {
    [
        site(-80.0, 0.0, 2_000.0),
        site(-79.0, 60.0, 2_000.0),
        site(-79.0, -60.0, 2_000.0),
    ]
}

/// A fixed 6-sat snapshot of MCMF satellite positions at t = 0 for the -80 deg
/// user before/after table (the beacon table is evaluated at a single epoch).
fn p2_six_sat_mcmf_t0() -> Vec<Vec3> {
    LunarConstellation::illustrative_lcns(6).positions_mcmf(0.0)
}

fn p2_user_minus80_mcmf() -> Vec3 {
    site(-80.0, 0.0, 2.0)
}

fn main() {
    let out_dir = format!("{}/tests/fixtures/lunar_service", env!("CARGO_MANIFEST_DIR"));
    fs::create_dir_all(&out_dir).expect("create fixture dir");

    write_nsweep(&out_dir);
    write_spatial_map(&out_dir);
    write_beacon_table(&out_dir);

    println!("wrote P2 golden fixtures to {out_dir}");
}

// ---------------------------------------------------------------------------
// Build 0: satellite-count sweep golden table.
// ---------------------------------------------------------------------------

fn write_nsweep(out_dir: &str) {
    let grid = p2_grid();
    let times = p2_times();
    let rows = sweep_over_n(4, 24, &grid, &times, mask_rad(), PDOP_THRESHOLD);

    let mut s = String::new();
    s.push_str("# P2 satellite-count sweep golden table (drift guard, NOT an independent oracle).\n");
    s.push_str("# Scenario: illustrative_lcns(N) for N=4..24; grid lat {-90,-80,-70} x lon {-120,0,120};\n");
    s.push_str("# horizon 12 h at 1 h steps (13 epochs); elev mask 5 deg; PDOP threshold 6.\n");
    s.push_str("# Columns: n_sats,coverage_fraction,gdop_median,frac_below_gdop6\n");
    s.push_str("# gdop_median empty means None (no sample had >=4 sats). f64 hex-exact regeneration.\n");
    for r in &rows {
        let gdop = match r.gdop_median {
            Some(v) => format!("{v:.17e}"),
            None => String::new(),
        };
        writeln!(
            s,
            "{},{:.17e},{},{:.17e}",
            r.n_sats, r.coverage_fraction, gdop, r.frac_below_gdop6
        )
        .unwrap();
    }
    fs::write(format!("{out_dir}/nsweep_golden.csv"), s).expect("write nsweep");
}

// ---------------------------------------------------------------------------
// Build 1: spatial GDOP + availability map golden grid (6-sat scenario).
// ---------------------------------------------------------------------------

fn write_spatial_map(out_dir: &str) {
    let times = p2_times();
    let mask = mask_rad();
    let constellation = LunarConstellation::illustrative_lcns(6);

    let lats = [-90.0_f64, -80.0, -70.0];
    let lons = [-120.0_f64, 0.0, 120.0];

    let mut s = String::new();
    s.push_str("# P2 spatial GDOP + availability map golden grid (drift guard, NOT an independent oracle).\n");
    s.push_str("# Scenario: illustrative_lcns(6); per-cell time-averaged over 12 h at 1 h steps (13 epochs);\n");
    s.push_str("# elev mask 5 deg; PDOP threshold 6. Each cell is a single-point coverage() over the time axis.\n");
    s.push_str("# Columns: lat_deg,lon_deg,gdop_median,coverage_fraction,frac_below_gdop6,mean_visible,min_sats,max_sats\n");
    for &lat in &lats {
        for &lon in &lons {
            let pt = [Selenographic {
                lat_rad: lat.to_radians(),
                lon_rad: lon.to_radians(),
                alt_m: 0.0,
            }];
            let c = coverage(&constellation, &pt, &times, mask, PDOP_THRESHOLD);
            // Mean visible count over the time axis (independent recomputation of
            // the cell's mean visibility, deterministic).
            let mean_vis = mean_visible_at(&constellation, &pt[0], &times, mask);
            let gdop = match c.gdop_median {
                Some(v) => format!("{v:.17e}"),
                None => String::new(),
            };
            writeln!(
                s,
                "{lat},{lon},{gdop},{:.17e},{:.17e},{:.17e},{},{}",
                c.coverage_fraction, c.frac_below_gdop6, mean_vis, c.min_sats, c.max_sats
            )
            .unwrap();
        }
    }
    fs::write(format!("{out_dir}/spatial_map_golden.csv"), s).expect("write spatial map");
}

/// Mean visible-satellite count for one surface point over the time axis.
fn mean_visible_at(
    constellation: &LunarConstellation,
    pt: &Selenographic,
    times: &[f64],
    mask: f64,
) -> f64 {
    let user = selenographic_to_mcmf(*pt);
    let mut total = 0usize;
    for &t in times {
        let sats = constellation.positions_mcmf(t);
        total += kshana::lunar_service::visible_sat_positions(user, &sats, mask).len();
    }
    total as f64 / times.len() as f64
}

// ---------------------------------------------------------------------------
// Build 2: beacon before/after GDOP table golden.
// ---------------------------------------------------------------------------

fn write_beacon_table(out_dir: &str) {
    let user = p2_user_minus80_mcmf();
    let sats = p2_six_sat_mcmf_t0();
    let beacons = p2_beacon_sites();
    let mask = mask_rad();

    let before = kshana::lunar_service::service_dop(user, &sats, mask);
    let after = dop_with_beacons(user, &sats, &beacons, mask);

    // 24-sat comparison GDOP (median over the P2 volume) for the "expand the
    // constellation instead" alternative row.
    let grid = p2_grid();
    let times = p2_times();
    let sweep24 = sweep_over_n(24, 24, &grid, &times, mask, PDOP_THRESHOLD);
    let gdop24 = sweep24[0].gdop_median;

    let mut s = String::new();
    s.push_str("# P2 beacon before/after GDOP table golden (drift guard, NOT an independent oracle).\n");
    s.push_str("# -80 deg user at (lat -80, lon 0, 2 m mast). 6-sat illustrative_lcns(6) snapshot at t=0.\n");
    s.push_str("# 3 surveyed beacons at (-80,0),(-79,60),(-79,-60) on 2 km masts. 5 deg mask.\n");
    s.push_str("# 24-sat row = median GDOP over the P2 volume from sweep_over_n(24,24,...).\n");
    s.push_str("# Columns: label,gdop,pdop,hdop,vdop,tdop (empty = None / no fix)\n");
    write_dop_row(&mut s, "6sat_only", before);
    write_dop_row(&mut s, "6sat_plus_3beacons", after);
    // The 24-sat comparison row carries only a GDOP (median order statistic).
    let g24 = match gdop24 {
        Some(v) => format!("{v:.17e}"),
        None => String::new(),
    };
    writeln!(s, "24sat_median,{g24},,,,").unwrap();
    fs::write(format!("{out_dir}/beacon_before_after_golden.csv"), s).expect("write beacon table");
}

fn write_dop_row(s: &mut String, label: &str, d: Option<kshana::orbit::Dop>) {
    match d {
        Some(d) => writeln!(
            s,
            "{label},{:.17e},{:.17e},{:.17e},{:.17e},{:.17e}",
            d.gdop, d.pdop, d.hdop, d.vdop, d.tdop
        )
        .unwrap(),
        None => writeln!(s, "{label},,,,,").unwrap(),
    }
}
