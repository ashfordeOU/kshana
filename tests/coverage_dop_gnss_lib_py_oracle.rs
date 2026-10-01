// SPDX-License-Identifier: AGPL-3.0-only
//! Two-sided external-library oracle for the coverage and DOP maps (`constellation::coverage`,
//! verification row "Coverage and DOP maps").
//!
//! Why a new comparison: the earlier test
//! (`tests/constellation_availability_published_spec_oracle.rs`) compared availability with
//! published minimum floors. Those floors are far below what a nominal constellation reaches, so
//! a verifier's doubled-PDOP mutant left it green: it cannot detect a wrong DOP engine. This
//! comparison checks the per-cell DOP statistics and availability two-sided, on identical
//! satellite positions and grid.
//!
//! Pre-registration (validation 0.30, round 2, batch "tools"; written 2026-10-01 before the
//! fixture below was generated and before the oracle was run).
//!
//! Setup: presets `galileo` (Walker 24/3/1) and `gps-baseline` (24 slots), each over one day at
//! 300 s (288 epochs), 5 deg elevation mask, PDOP threshold 6, 5 deg global grid (36 × 72 cell
//! centres on the sphere of the Earth's equatorial radius, the engine's user model), no J2, one
//! receiver clock.
//!
//! Identical inputs: the satellite body-fixed positions at every epoch are exported from the
//! engine (`constellation::satellite_positions_fixed`, the propagation `coverage` uses) with 17
//! significant digits to `tests/fixtures/coverage_dop_gnss_lib_py_oracle/positions_<preset>.txt`;
//! the test first checks that the engine still produces exactly these positions (within 1e-6 m).
//! The oracle reads them and builds the same grid of receiver points.
//!
//! Oracle (Library): gnss_lib_py 1.0.4 (Stanford NAV Lab, MIT licence) `utils.dop.get_dop`, which
//! forms the [e, n, u, 1] geometry from elevation and azimuth and inverts it with numpy, run in a
//! separate Python process (`make_fixture.py`). Elevation and azimuth are computed by the generator
//! in numpy from the committed positions with the local vertical along the radial of the grid
//! point (the engine's spherical user model); a satellite is used when its elevation is at least
//! the mask. A fix needs at least 4 satellites. The generator aggregates per cell: the number of
//! epochs with a fix, the number with PDOP at most 6, the summed number of visible satellites, the
//! mean and the largest PDOP; and the cos(latitude)-weighted global availability and the worst cell.
//!
//! Tolerances (fixed now):
//! - per cell: `fix_pct`, `availability_pct` within 1e-9 percentage points (identical counts),
//!   `mean_visible` within 1e-12;
//! - per cell: `mean_pdop` and `max_pdop` within 1e-9 relative;
//! - `global_availability_pct` and `worst_site_availability_pct` within 1e-9 percentage points.
//!
//! Discrimination check, pre-registered: the doubled-PDOP mutant (`pdop: 2.0 * pdop2.sqrt()` in
//! `NormalAccum::solve`), which left the published-floor test green, must turn this test red.

use kshana::constellation::{
    body_by_name, coverage, satellite_positions_fixed, ClockModel, ConstellationCfg,
    CoverageResult, CoverageSpec, Elements,
};
use std::path::PathBuf;

const PRESETS: [&str; 2] = ["galileo", "gps-baseline"];
const DURATION_S: f64 = 86_400.0;
const STEP_S: f64 = 300.0;
const TOL_PCT: f64 = 1e-9;
const TOL_VIS: f64 = 1e-12;
const TOL_DOP_REL: f64 = 1e-9;
const TOL_POS_M: f64 = 1e-6;

fn dir() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/coverage_dop_gnss_lib_py_oracle")
}

fn elements(preset: &str) -> Vec<Elements> {
    let body = body_by_name("earth").expect("earth");
    let cfg = ConstellationCfg {
        name: preset.to_string(),
        preset: Some(preset.to_string()),
        expanded: None,
        shell: Vec::new(),
        satellite: Vec::new(),
    };
    cfg.build(&body).expect("preset builds").elements
}

fn spec() -> CoverageSpec {
    CoverageSpec {
        duration_s: DURATION_S,
        step_s: STEP_S,
        mask_deg: 5.0,
        pdop_threshold: 6.0,
        grid_step_deg: 5.0,
        lat_min_deg: -90.0,
        lat_max_deg: 90.0,
        lon_min_deg: -180.0,
        lon_max_deg: 180.0,
        clock: ClockModel::Common,
        j2: false,
    }
}

fn epochs() -> Vec<f64> {
    let n = (DURATION_S / STEP_S + 1e-9).floor() as usize;
    (0..n).map(|k| k as f64 * STEP_S).collect()
}

/// Writes the position fixtures when `KSHANA_WRITE_COVERAGE_FIXTURE=1`; otherwise does nothing.
#[test]
fn write_position_fixture_on_request() {
    if std::env::var("KSHANA_WRITE_COVERAGE_FIXTURE").as_deref() != Ok("1") {
        return;
    }
    let body = body_by_name("earth").unwrap();
    std::fs::create_dir_all(dir()).unwrap();
    for p in PRESETS {
        let els = vec![elements(p)];
        let mut out = format!(
            "# {p}: epoch_s sat x y z (m, body-fixed), satellite_positions_fixed, no J2; Earth \
             equatorial radius {:.17e} m\n",
            body.re
        );
        for t in epochs() {
            for (k, s) in satellite_positions_fixed(&body, &els, false, t)
                .iter()
                .enumerate()
            {
                out += &format!("{t} {k} {:.17e} {:.17e} {:.17e}\n", s[0], s[1], s[2]);
            }
        }
        std::fs::write(dir().join(format!("positions_{p}.txt")), out).unwrap();
    }
}

fn read(name: &str) -> String {
    let p = dir().join(name);
    std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()))
}

fn check_preset(preset: &str) -> [f64; 5] {
    let body = body_by_name("earth").unwrap();
    let els = vec![elements(preset)];
    // Identical geometry: the engine still produces the committed positions.
    let mut worst_pos = 0.0f64;
    let pos = read(&format!("positions_{preset}.txt"));
    let mut lines = pos.lines().filter(|l| !l.starts_with('#'));
    for t in epochs() {
        for s in satellite_positions_fixed(&body, &els, false, t) {
            let v: Vec<f64> = lines
                .next()
                .expect("position line")
                .split_whitespace()
                .map(|x| x.parse().unwrap())
                .collect();
            assert_eq!(v[0], t);
            for k in 0..3 {
                worst_pos = worst_pos.max((s[k] - v[2 + k]).abs());
            }
        }
    }
    assert!(
        worst_pos <= TOL_POS_M,
        "{preset}: positions moved by {worst_pos} m"
    );

    let r: CoverageResult = coverage(&body, &els, &spec(), false).expect("coverage");
    let oracle = read(&format!("gnss_lib_py_{preset}.txt"));
    let mut n_cells = 0usize;
    let (mut w_pct, mut w_vis, mut w_dop) = (0.0f64, 0.0f64, 0.0f64);
    for line in oracle.lines().filter(|l| !l.starts_with('#')) {
        let f: Vec<&str> = line.split_whitespace().collect();
        if f[0] == "global" {
            let (g_av, worst): (f64, f64) = (f[1].parse().unwrap(), f[2].parse().unwrap());
            let d1 = (r.global_availability_pct - g_av).abs();
            let d2 = (r.worst_site_availability_pct - worst).abs();
            assert!(
                d1 <= TOL_PCT,
                "{preset}: global availability {} vs {g_av}",
                r.global_availability_pct
            );
            assert!(
                d2 <= TOL_PCT,
                "{preset}: worst site {} vs {worst}",
                r.worst_site_availability_pct
            );
            w_pct = w_pct.max(d1).max(d2);
            continue;
        }
        // ilat ilon fix_pct availability_pct mean_visible mean_pdop max_pdop (nan when no fix)
        let (a, o): (usize, usize) = (f[0].parse().unwrap(), f[1].parse().unwrap());
        let v: Vec<f64> = f[2..].iter().map(|x| x.parse().unwrap()).collect();
        let d_fix = (r.fix_pct[a][o] - v[0]).abs();
        let d_av = (r.availability_pct[a][o] - v[1]).abs();
        let d_vis = (r.mean_visible[a][o] - v[2]).abs();
        assert!(
            d_fix <= TOL_PCT,
            "{preset} cell {a},{o}: fix {} vs {}",
            r.fix_pct[a][o],
            v[0]
        );
        assert!(
            d_av <= TOL_PCT,
            "{preset} cell {a},{o}: availability {} vs {}",
            r.availability_pct[a][o],
            v[1]
        );
        assert!(
            d_vis <= TOL_VIS,
            "{preset} cell {a},{o}: visible {} vs {}",
            r.mean_visible[a][o],
            v[2]
        );
        w_pct = w_pct.max(d_fix).max(d_av);
        w_vis = w_vis.max(d_vis);
        match (r.mean_pdop[a][o], r.max_pdop[a][o]) {
            (Some(mean), Some(max)) => {
                let e1 = (mean - v[3]).abs() / v[3];
                let e2 = (max - v[4]).abs() / v[4];
                assert!(
                    e1 <= TOL_DOP_REL,
                    "{preset} cell {a},{o}: mean PDOP {mean} vs {}",
                    v[3]
                );
                assert!(
                    e2 <= TOL_DOP_REL,
                    "{preset} cell {a},{o}: max PDOP {max} vs {}",
                    v[4]
                );
                w_dop = w_dop.max(e1).max(e2);
            }
            _ => assert!(
                v[3].is_nan() && v[4].is_nan(),
                "{preset} cell {a},{o}: fix mismatch"
            ),
        }
        n_cells += 1;
    }
    assert_eq!(
        n_cells,
        r.lats_deg.len() * r.lons_deg.len(),
        "{preset}: every cell compared"
    );
    [
        worst_pos,
        w_pct,
        w_vis,
        w_dop,
        r.worst_site_availability_pct,
    ]
}

#[test]
#[ignore = "pre-registered; not yet run"]
fn coverage_dop_maps_match_gnss_lib_py_on_identical_geometry() {
    for p in PRESETS {
        let w = check_preset(p);
        println!(
            "{p}: positions {:.1e} m; worst |d pct| {:.1e}; |d visible| {:.1e}; PDOP rel {:.2e}; \
             worst-site availability {:.4} %",
            w[0], w[1], w[2], w[3], w[4]
        );
    }
}
