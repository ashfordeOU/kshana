// SPDX-License-Identifier: AGPL-3.0-only
//! `lunar-station-coverage` against the numeric claims published for a lunar differential
//! reference station, under the bars pre-registered in
//! `tests/fixtures/lunar_station_published/PREREGISTRATION.md` (revision 2, commit 05bf9a19,
//! committed alone before any run).
//!
//! The claims are listed with their exact wording in
//! `tests/fixtures/lunar_station_published/CLAIMS.md`. The sources (S1 to S5) are registered
//! with URL, retrieval date, SHA-256 and licence in `tests/fixtures/lunar_station/SOURCES.md`.
//! They are cited by title and identifier only. The model is this project's own and MODELLED.
//! Nothing here is a statement about the performance of any real system.
//!
//! ## Result (recorded, not tuned): 1 of 6 registered bars passes
//!
//! First and only run (2026-10-12, engine at merge commit d8aa075c plus this file):
//!
//! | bar | claim | Kshana | bar | verdict |
//! |---|---|---|---|---|
//! | K1 | coverage, 300 km circle | 0.0000 | >= 0.95 | FAIL |
//! | K2 | coverage, 600 km circle | 0.0000 | >= 0.95 | FAIL |
//! | K3 | corrected p95 3-D, 300 km | 280.58 m | <= 1.5 m | FAIL |
//! | K4 | "decimeter level" | 280.58 m | <= 0.15 m | FAIL (expected, see the pre-registration) |
//! | K5 | corrected p95 3-D at 600 s latency | 292.96 m | <= 1.5 m | FAIL |
//! | K6 | p95 at 500 km / p95 at 10 km | 1.3945 | <= 1.5 | pass |
//!
//! The failures come from geometry. With the four satellites on the in-tree ILLUSTRATIVE
//! elements (the public sources give no elements), a user and the station have four
//! satellites in common view above the 5 deg mask in only 8.2 % of epochs (300 km) and 6.3 %
//! (600 km). The epochs that are available have very poor DOP: the uncorrected p95 is 3.8 km
//! where the sources quote < 10 m. This is a finding about the ILLUSTRATIVE constellation
//! and the snapshot, 4-in-common-view model, not about the sources' claims. The sources'
//! simulations used a filter, a height constraint and "at least 3 satellites in common view"
//! (S2 p14). The bars still fail, so the ledger row stays MODELLED.

use kshana::lunar_station::{LunarStationCoverageReport, LunarStationCoverageScenario};

/// The pre-registered base inputs. Each value carries its source id from CLAIMS.md §3, or the
/// label ILLUSTRATIVE. `grid_lat_min_deg` is not an input of the kind: its grid always runs
/// to the pole, which is the registered −90.
const BASE: &str = r#"
kind = "lunar-station-coverage"
n_sats = 4                      # S2 p14; S4 p10, p12
sma_km = 9737.4                 # S4 p6 (24 h period); in-tree value
eccentricity = 0.6              # ILLUSTRATIVE (no public source)
inc_deg = 57.7                  # ILLUSTRATIVE (no public source)
argp_deg = 90.0                 # ILLUSTRATIVE (no public source)
station_lat_deg = -89.4765      # S2 p19, Shackleton-Henson Ridge example site
station_lon_deg = -138.135      # S2 p19
station_height_m = 0.0          # ILLUSTRATIVE
sise_sigma_m = 5.102            # S4 p8, S2 p21: 10 m at 95 %, read as a two-sided Gaussian
sise_orbit_variance_fraction = 0.5  # ILLUSTRATIVE (no public source)
noise_m = 0.30                  # S2 p14, high-quality code at zenith
latency_s = 1.0                 # S2 p15
quantization_bits = 8           # ILLUSTRATIVE (no public source)
survey_sigma_m = 0.10           # S1 p4, "sub-decimetre"
grid_lat_max_deg = -80.0        # S2 p10, the 300 km circle
grid_lat_step_deg = 1.0
t_start_s = 0.0
t_span_s = 86400.0
t_step_s = 600.0
n_trials = 200
seed = 42
accuracy_threshold_m = 1.0      # "sub-metre"
percentile = 95.0               # this project's reading
"#;

/// The registered cases: (name, overrides, scored).
const CASES: [(&str, &str, bool); 6] = [
    ("R300", "", true),
    ("R600", "grid_lat_max_deg = -70.0", true),
    ("LAT600", "latency_s = 600.0", true),
    ("R300-lowq", "noise_m = 1.0", false),
    ("R300-survey030", "survey_sigma_m = 0.30", false),
    (
        "R600-orbit100",
        "grid_lat_max_deg = -70.0\nsise_orbit_variance_fraction = 1.0",
        false,
    ),
];

fn scenario(overrides: &str) -> LunarStationCoverageScenario {
    // A later key in TOML is a duplicate, not an override, so the base line is replaced.
    let mut text = String::new();
    let keys: Vec<&str> = overrides
        .lines()
        .filter_map(|l| l.split('=').next())
        .map(str::trim)
        .filter(|k| !k.is_empty())
        .collect();
    for line in BASE.lines() {
        let key = line.split('=').next().unwrap_or("").trim();
        if !keys.contains(&key) {
            text.push_str(line);
            text.push('\n');
        }
    }
    text.push_str(overrides);
    text.push('\n');
    toml::from_str(&text).expect("the registered scenario parses")
}

fn run(overrides: &str) -> LunarStationCoverageReport {
    scenario(overrides)
        .run()
        .expect("the registered scenario runs")
}

/// The K6 selection: the point nearest `target_km` by |distance_km - target|, ties to the
/// first listed. Returns (lat, lon, distance_km, corrected_p_3d_m).
fn nearest(r: &LunarStationCoverageReport, target_km: f64) -> (f64, f64, f64, Option<f64>) {
    let mut best: Option<(f64, usize)> = None;
    for (i, p) in r.points.iter().enumerate() {
        let d = (p.distance_km - target_km).abs();
        if best.is_none_or(|(bd, _)| d < bd) {
            best = Some((d, i));
        }
    }
    let p = &r.points[best.expect("the grid has points").1];
    (p.lat_deg, p.lon_deg, p.distance_km, p.corrected_p_3d_m)
}

/// Runs every registered case, prints the figures the pre-registration names and asserts the
/// recorded ones. About 7 s for all six cases in a release build; run with
/// `cargo test --release --test lunar_station_published_oracle -- --ignored --nocapture`.
#[test]
#[ignore = "runs the six registered cases (about 7 s in release, minutes in debug); the recorded finding is pinned by the fast test"]
fn published_claims_comparison_run() {
    for (name, ov, scored) in CASES {
        let r = run(ov);
        let g = &r.region;
        println!(
            "CASE {name} scored={scored} points={} epochs={} trials={} percentile={}",
            r.n_grid_points, r.n_epochs, r.n_trials, r.percentile
        );
        println!(
            "  availability={:.6} coverage_fraction={:.6}",
            g.availability, g.coverage_fraction
        );
        println!(
            "  corrected_p_3d_m={:?} corrected_p_h_m={:?} corrected_p_v_m={:?} uncorrected_p_3d_m={:?}",
            g.corrected_p_3d_m, g.corrected_p_h_m, g.corrected_p_v_m, g.uncorrected_p_3d_m
        );
        println!(
            "  worst_point={:?} hpl_max_m={:?}",
            g.worst_point, g.hpl_max_m
        );
        println!("  error_model={:?}", r.error_model);
        let a = nearest(&r, 10.0);
        let b = nearest(&r, 500.0);
        println!("  nearest10={a:?} nearest500={b:?}");
        if let (Some(x), Some(y)) = (a.3, b.3) {
            println!("  ratio500/10={:.6}", y / x);
        }
        if let Some(rec) = RECORDED.iter().find(|c| c.case == name) {
            let close = |a: f64, b: f64| (a - b).abs() <= 1e-9 * b.abs().max(1.0);
            // Availability was recorded to the six decimals the first run printed.
            assert!(
                (g.availability - rec.availability).abs() <= 5e-7,
                "{name}: availability moved"
            );
            assert!(
                close(g.coverage_fraction, rec.coverage_fraction),
                "{name}: coverage moved"
            );
            let p = g.corrected_p_3d_m.expect("a corrected figure");
            assert!(
                close(p, rec.corrected_p_3d_m),
                "{name}: corrected p95 moved: {p}"
            );
            let ratio = b.3.expect("500 km point") / a.3.expect("10 km point");
            assert!(
                close(ratio, rec.ratio_500_10),
                "{name}: K6 ratio moved: {ratio}"
            );
        }
    }
}

/// One scored case as recorded on the first run.
struct Recorded {
    case: &'static str,
    availability: f64,
    coverage_fraction: f64,
    corrected_p_3d_m: f64,
    ratio_500_10: f64,
}

/// The first run's figures for the three scored cases, as printed (availability to six
/// decimals, the rest in full).
const RECORDED: [Recorded; 3] = [
    Recorded {
        case: "R300",
        availability: 0.082086,
        coverage_fraction: 0.0,
        corrected_p_3d_m: 280.577980757984,
        ratio_500_10: 79.99900287513452 / 106.76935578540314,
    },
    Recorded {
        case: "R600",
        availability: 0.063258,
        coverage_fraction: 0.0,
        corrected_p_3d_m: 435.4654620407862,
        ratio_500_10: 157.14360403790693 / 112.69213847329831,
    },
    Recorded {
        case: "LAT600",
        availability: 0.082086,
        coverage_fraction: 0.0,
        corrected_p_3d_m: 292.95967178610704,
        ratio_500_10: 85.69481563048727 / 117.24396384768723,
    },
];

/// The pinned finding: the recorded figures against the registered bars. K1 to K5 fail and
/// K6 passes, so the published-claims ledger row stays MODELLED. If the model changes and
/// the ignored run above no longer reproduces these figures, re-run it, record the new run
/// as a second run in the pre-registration and keep this one.
#[test]
fn recorded_finding_one_of_six_bars_passes() {
    let get = |c: &str| {
        RECORDED
            .iter()
            .find(|r| r.case == c)
            .expect("recorded case")
    };
    let (r300, r600, lat600) = (get("R300"), get("R600"), get("LAT600"));
    let bars = [
        ("K1", r300.coverage_fraction >= 0.95),
        ("K2", r600.coverage_fraction >= 0.95),
        ("K3", r300.corrected_p_3d_m <= 1.5),
        ("K4", r300.corrected_p_3d_m <= 0.15),
        ("K5", lat600.corrected_p_3d_m <= 1.5),
        ("K6", r600.ratio_500_10 <= 1.5),
    ];
    let passed: Vec<&str> = bars.iter().filter(|b| b.1).map(|b| b.0).collect();
    assert_eq!(passed, ["K6"], "the recorded finding is 1 of 6, K6 only");
    // The cause recorded with the finding: users and the station rarely share four
    // satellites in view on the ILLUSTRATIVE elements.
    assert!(r300.availability < 0.10 && r600.availability < 0.10);
}

/// The K5 addendum with ephemeris-error growth (LRS-03), pre-registered alone in
/// tests/fixtures/lunar_station_published/ADDENDUM-LRS03.md (59d88248) before this run. The
/// recorded comparison above is not edited. Ignored: the full LAT600 grid, three times.
#[test]
#[ignore]
fn k5_growth_addendum_run() {
    // The recorded figures (ADDENDUM-LRS03.md, "Recorded run").
    for (name, rate, recorded) in [
        ("LAT600-g0001", 0.001, 369.778866),
        ("LAT600-g001", 0.01, 2315.253479),
        ("LAT600-g01", 0.1, 22796.634114),
    ] {
        let r = run(&format!(
            "latency_s = 600.0\norbit_err_growth_m_per_s = {rate}"
        ));
        let p = r.region.corrected_p_3d_m.expect("a corrected figure");
        println!(
            "ADDENDUM {name} rate={rate} corrected_p_3d_m={p:.6} change_from_recorded={:.6} K5_pass={}",
            p - 292.95967178610704,
            p <= 1.5
        );
        assert!(
            (p - recorded).abs() <= 1e-6 * recorded,
            "{name}: the addendum figure moved"
        );
        assert!(p > 1.5, "{name}: K5 as recorded (fail)");
    }
}

/// The addendum with the sources' solution style (LRS-06), pre-registered alone in
/// tests/fixtures/lunar_station_published/ADDENDUM-LRS06.md (001ca100) before this run. The
/// recorded comparison above is not edited. Ignored: three full grids.
#[test]
#[ignore]
fn solution_style_addendum_run() {
    const SOL: &str = "\n[solution]\nheight_aided = true\nheight_sigma_m = 1.0\nmin_satellites = 3\nwindow_epochs = 6";
    let r300 = run(SOL);
    let r600 = run(&format!("grid_lat_max_deg = -70.0{SOL}"));
    let lat600 = run(&format!("latency_s = 600.0{SOL}"));
    for (name, r) in [
        ("R300-sol", &r300),
        ("R600-sol", &r600),
        ("LAT600-sol", &lat600),
    ] {
        let g = &r.region;
        println!(
            "ADDENDUM6 {name} availability={:.6} coverage_fraction={:.6} corrected_p_3d_m={:?} corrected_p_h_m={:?}",
            g.availability, g.coverage_fraction, g.corrected_p_3d_m, g.corrected_p_h_m
        );
    }
    let a = nearest(&r600, 10.0);
    let b = nearest(&r600, 500.0);
    println!("ADDENDUM6 nearest10={a:?} nearest500={b:?}");
    let p = |r: &LunarStationCoverageReport| r.region.corrected_p_3d_m.unwrap_or(f64::INFINITY);
    let k6 = match (a.3, b.3) {
        (Some(x), Some(y)) => Some(y / x),
        _ => None,
    };
    let bars = [
        ("K1", r300.region.coverage_fraction >= 0.95),
        ("K2", r600.region.coverage_fraction >= 0.95),
        ("K3", p(&r300) <= 1.5),
        ("K4", p(&r300) <= 0.15),
        ("K5", p(&lat600) <= 1.5),
        ("K6", k6.is_some_and(|v| v <= 1.5)),
    ];
    println!("ADDENDUM6 ratio500/10={k6:?} bars={bars:?}");
    // The recorded figures (ADDENDUM-LRS06.md, "Recorded run").
    let close = |a: f64, b: f64| (a - b).abs() <= 1e-6 * b.abs();
    assert!(close(p(&r300), 2.1103018834825096));
    assert!(close(p(&r600), 2.175292336052316));
    assert!(close(p(&lat600), 2.1123644082489603));
    assert!(close(k6.unwrap(), 1.0379717628453942));
    let passed: Vec<&str> = bars.iter().filter(|b| b.1).map(|b| b.0).collect();
    assert_eq!(
        passed,
        ["K6"],
        "the recorded addendum finding: only K6 passes"
    );
}
