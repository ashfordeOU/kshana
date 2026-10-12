// SPDX-License-Identifier: AGPL-3.0-only
//! The `lunar-station-coverage` kind (src/lunar_station.rs) against what it is built from.
//!
//! It adds no physics, so the checks are reductions and invariants of the
//! `lunar-differential-pnt` model it sweeps: one point, one epoch and one trial reduce to
//! that kind; the corrected error vanishes at the station when nothing but the common-mode
//! error is injected; the survey error alone reproduces the survey-transfer prediction;
//! coverage and error are monotone where they must be; unavailable epochs carry a reason
//! and no error; the result is deterministic; the work guard refuses an oversized run.
//! Every band and tolerance below was written before the test was first run. MODELLED: none
//! of this is a statement about any real system.

use kshana::lunar::{selenographic_to_mcmf, Selenographic, R_MOON_M};
use kshana::lunar_dpnt::{survey_position_transfer, LunarDpntScenario};
use kshana::lunar_service::{visible_sat_positions, LunarConstellation, LunarSat};
use kshana::lunar_station::{LunarStationCoverageReport, LunarStationCoverageScenario, UserPoint};

fn scenario(extra: &str) -> LunarStationCoverageScenario {
    toml::from_str(&format!("kind = \"lunar-station-coverage\"\n{extra}"))
        .expect("the test scenario parses")
}

fn run(extra: &str) -> LunarStationCoverageReport {
    scenario(extra).run().expect("the test scenario runs")
}

/// No link terms, no survey, no noise, every satellite in view: the bare common-mode
/// model `lunar-differential-pnt` reports as its headline.
const BARE: &str =
    "survey_sigma_m = 0.0\nlatency_s = 0.0\nquantization_bits = 0\nmask_deg = -90.0\n";

/// Test 1. One point at `lunar-differential-pnt`'s baseline and azimuth, one epoch, one
/// trial, the same seed and inputs: the corrected and uncorrected errors are that kind's.
///
/// The draws are seeded identically (epoch 0, trial 0 and point 0 use exactly `seed`, and
/// the noise stream its noise seed), so the only possible difference is the user position:
/// `lunar-differential-pnt` places it at `ref_lon + baseline / R` radians and this kind at
/// a longitude stated in degrees, which passes through one degrees-to-radians round trip.
/// The tolerance, 1e-12 m, allows for that one rounding and nothing else.
#[test]
fn one_point_one_epoch_one_trial_reduces_to_lunar_differential_pnt() {
    for noise in [0.0, 0.5] {
        let dp = LunarDpntScenario {
            noise_m: noise,
            ..LunarDpntScenario::default()
        };
        let want = dp.run();
        let lon_deg = (dp.baseline_km * 1000.0 / R_MOON_M).to_degrees();
        let r = run(&format!(
            "{BARE}noise_m = {noise}\nt_span_s = 0.0\nn_trials = 1\nseed = {}\n\
             points = [{{ lat_deg = {}, lon_deg = {lon_deg:?} }}]\n",
            dp.seed, dp.ref_lat_deg
        ));
        let p = &r.points[0];
        assert_eq!((r.n_epochs, r.n_trials, p.availability), (1, 1, 1.0));
        let (c, u) = (p.corrected_p_3d_m.unwrap(), p.uncorrected_p_3d_m.unwrap());
        assert!(
            (c - want.user_error_corrected_m).abs() <= 1e-12,
            "noise {noise}: corrected {c} vs {}",
            want.user_error_corrected_m
        );
        assert!(
            (u - want.user_error_uncorrected_m).abs() <= 1e-12,
            "noise {noise}: uncorrected {u} vs {}",
            want.user_error_uncorrected_m
        );
        assert!(
            c > 0.0 && u > 10.0 * c,
            "the reduction is not trivial: {c} {u}"
        );
    }
}

/// Test 2. At the station itself, with no survey error, no latency, no quantization and
/// no noise, the correction removes the common-mode error exactly: the corrected error is
/// 0 to 1e-9 m in every trial of every epoch (the 100th percentile is the largest).
#[test]
fn zero_baseline_floor_is_zero_in_every_trial() {
    let r = run(&format!(
        "{BARE}percentile = 100.0\nt_span_s = 21600.0\nt_step_s = 3600.0\nn_trials = 50\n\
         points = [{{ lat_deg = -89.0, lon_deg = 0.0 }}]\n"
    ));
    let p = &r.points[0];
    assert_eq!(p.availability, 1.0);
    assert!(
        p.corrected_p_3d_m.unwrap() <= 1e-9,
        "{:?}",
        p.corrected_p_3d_m
    );
    assert!(p.uncorrected_p_3d_m.unwrap() > 1.0);
}

/// The constellation of the default scenario, as `lunar-differential-pnt` lays it out.
fn default_sats(t_s: f64) -> Vec<[f64; 3]> {
    let s = LunarStationCoverageScenario::default();
    let n = s.n_sats;
    LunarConstellation::new(
        (0..n)
            .map(|k| LunarSat {
                sma_m: s.sma_km * 1000.0,
                eccentricity: s.eccentricity,
                inc_deg: s.inc_deg,
                raan_deg: 360.0 * k as f64 / n as f64,
                argp_deg: s.argp_deg,
                mean_anom_deg: 360.0 * k as f64 / n as f64,
            })
            .collect(),
    )
    .positions_mcmf(t_s)
}

/// Test 3. At the station with only a survey error of 1-sigma `s` (3-D, isotropic), the
/// user's corrected error is the station's coordinate error pushed through the solve:
/// `|e| = sigma_axis |M d|` with `d` standard normal in 3-D and `M` the survey transfer map,
/// which is the identity to within the satellites' parallax. Its 95th percentile is then
/// `sigma_axis (transfer / sqrt 3) chi_3(0.95)`, `chi_3(0.95) = sqrt(7.814728) = 2.795483`.
///
/// Band, stated before the run: 5 % relative. With 4000 trials the standard error of a
/// 95th-percentile estimate of a chi-3 variable is sqrt(0.95 x 0.05 / 4000) / f(q) =
/// 0.0034 / 0.125 = 0.0275 in units of sigma, 1.0 % of the quantile, so the band is five
/// standard errors.
#[test]
fn survey_floor_matches_the_survey_transfer_prediction() {
    let s = 1.0;
    let r = run(&format!(
        "{}survey_sigma_m = {s}\nt_span_s = 0.0\nn_trials = 4000\n\
         points = [{{ lat_deg = -89.0, lon_deg = 0.0 }}]\n",
        BARE.replace("survey_sigma_m = 0.0\n", "")
    ));
    let station = selenographic_to_mcmf(Selenographic {
        lat_rad: (-89.0_f64).to_radians(),
        lon_rad: 0.0,
        alt_m: 0.0,
    });
    let sats = default_sats(0.0);
    let transfer = survey_position_transfer(station, station, &sats).unwrap();
    let predicted = s / 3.0_f64.sqrt() * (transfer / 3.0_f64.sqrt()) * 7.814_728_f64.sqrt();
    let got = r.points[0].corrected_p_3d_m.unwrap();
    assert!(
        (got / predicted - 1.0).abs() <= 0.05,
        "p95 {got} vs predicted {predicted} (transfer {transfer})"
    );
}

/// The point `d_km` from (`lat`, `lon`) along `bearing_deg` on the mean lunar sphere.
fn along(lat: f64, lon: f64, bearing_deg: f64, d_km: f64) -> (f64, f64) {
    let (p1, l1, b) = (lat.to_radians(), lon.to_radians(), bearing_deg.to_radians());
    let c = d_km * 1000.0 / R_MOON_M;
    let p2 = (p1.sin() * c.cos() + p1.cos() * c.sin() * b.cos()).asin();
    let l2 = l1 + (b.sin() * c.sin() * p1.cos()).atan2(c.cos() - p1.sin() * p2.sin());
    (p2.to_degrees(), l2.to_degrees().rem_euclid(360.0))
}

/// Test 4a. Coverage cannot fall as the threshold rises: the samples do not depend on the
/// threshold, so every point's coverage is non-decreasing, exactly.
#[test]
fn coverage_is_non_decreasing_in_the_threshold() {
    let base = "grid_lat_step_deg = 3.0\nt_span_s = 21600.0\nt_step_s = 3600.0\nn_trials = 20\n";
    let runs: Vec<LunarStationCoverageReport> = [0.5, 2.0, 10.0, 50.0, 1000.0]
        .iter()
        .map(|t| run(&format!("{base}accuracy_threshold_m = {t}\n")))
        .collect();
    for w in runs.windows(2) {
        assert!(w[1].region.coverage_fraction >= w[0].region.coverage_fraction);
        for (a, b) in w[0].points.iter().zip(&w[1].points) {
            assert!(b.coverage_fraction >= a.coverage_fraction);
            assert_eq!(a.corrected_p_3d_m, b.corrected_p_3d_m, "samples moved");
        }
    }
    assert!(runs.last().unwrap().region.coverage_fraction > runs[0].region.coverage_fraction);
}

/// Test 4b. Along an azimuth the corrected percentile error grows with distance from the
/// station (the spatial decorrelation), within Monte Carlo noise: each point's percentile
/// is at least 0.95 times the previous one's. Band stated before the run: 5 %, with 6
/// epochs x 400 trials per point.
#[test]
fn corrected_error_grows_with_distance_along_an_azimuth() {
    let dists = [0.0, 25.0, 50.0, 100.0, 200.0];
    let pts: Vec<String> = dists
        .iter()
        .map(|&d| {
            let (lat, lon) = along(-89.0, 0.0, 90.0, d);
            format!("{{ lat_deg = {lat:?}, lon_deg = {lon:?} }}")
        })
        .collect();
    let r = run(&format!(
        "survey_sigma_m = 0.0\nmask_deg = -90.0\nt_span_s = 21600.0\nt_step_s = 3600.0\n\
         n_trials = 400\npoints = [{}]\n",
        pts.join(", ")
    ));
    let e: Vec<f64> = r
        .points
        .iter()
        .map(|p| p.corrected_p_3d_m.unwrap())
        .collect();
    for (k, w) in e.windows(2).enumerate() {
        assert!(
            w[1] >= 0.95 * w[0],
            "{} km {} vs {} km {}",
            dists[k],
            w[0],
            dists[k + 1],
            w[1]
        );
    }
    assert!(e[4] > 2.0 * e[1], "{e:?}");
    for (p, d) in r.points.iter().zip(dists) {
        assert!((p.distance_km - d).abs() < 1e-6, "{} vs {d}", p.distance_km);
    }
}

/// Test 5. Three satellites: every epoch is unavailable for `user_lt4`, with no error value.
#[test]
fn three_satellites_are_unavailable_with_a_reason_and_no_error() {
    let r = run(
        "n_sats = 3\nt_span_s = 7200.0\nt_step_s = 3600.0\nn_trials = 3\n\
                 points = [{ lat_deg = -89.5, lon_deg = 10.0 }]\n",
    );
    let p = &r.points[0];
    assert_eq!(p.unavailable.user_lt4, r.n_epochs);
    assert_eq!(p.unavailable.station_missing_sat, 0);
    assert_eq!(p.availability, 0.0);
    assert_eq!(p.coverage_fraction, 0.0);
    assert!(p.corrected_p_3d_m.is_none() && p.uncorrected_p_3d_m.is_none());
    assert!(p.hpl_max_m.is_none());
    assert!(r.region.corrected_p_3d_m.is_none() && r.region.worst_point.is_none());
}

/// Test 5b. A satellite the user sees but the station does not: unavailable for
/// `station_missing_sat`. Found, not constructed: over a grid wide enough (out to 60 deg S,
/// about 900 km from the station) for the two horizons to differ, every (point, epoch)
/// where the user's set is not inside the station's is counted independently and checked
/// against the report.
#[test]
fn a_satellite_the_station_does_not_see_is_reported() {
    let s = scenario(
        "grid_lat_max_deg = -60.0\ngrid_lat_step_deg = 5.0\nt_span_s = 86400.0\n\
         t_step_s = 3600.0\nn_trials = 2\n",
    );
    let r = s.run().unwrap();
    let station = s.station_mcmf();
    let mask = s.mask_deg.to_radians();
    let pts = s.user_points();
    let mut expected = vec![0usize; pts.len()];
    for t in s.epochs() {
        let sats = default_sats(t);
        for (j, p) in pts.iter().enumerate() {
            let user_sees: Vec<bool> = sats
                .iter()
                .map(|&x| !visible_sat_positions(p.2, &[x], mask).is_empty())
                .collect();
            let station_sees: Vec<bool> = sats
                .iter()
                .map(|&x| !visible_sat_positions(station, &[x], mask).is_empty())
                .collect();
            let n_user = user_sees.iter().filter(|&&b| b).count();
            if n_user >= 4
                && user_sees
                    .iter()
                    .zip(&station_sees)
                    .any(|(&u, &st)| u && !st)
            {
                expected[j] += 1;
            }
        }
    }
    let got: Vec<usize> = r
        .points
        .iter()
        .map(|p| p.unavailable.station_missing_sat)
        .collect();
    assert_eq!(got, expected);
    assert!(
        got.iter().sum::<usize>() > 0,
        "the sweep never exercised the reason"
    );
}

/// Test 6. The same seed gives byte-identical JSON through the engine's front door; a
/// different seed moves the Monte Carlo figures and leaves the geometry alone.
#[test]
fn deterministic_for_a_seed_and_moved_by_another() {
    let src = std::fs::read_to_string("tests/fixtures/lunar_station/gate.toml").unwrap();
    let a = kshana::api::run_toml(&src).unwrap().json;
    let b = kshana::api::run_toml(&src).unwrap().json;
    assert_eq!(a, b);
    let c = kshana::api::run_toml(&format!("{src}seed = 7\n"))
        .unwrap()
        .json;
    assert_ne!(a, c);
    let (ja, jc): (serde_json::Value, serde_json::Value) = (
        serde_json::from_str(&a).unwrap(),
        serde_json::from_str(&c).unwrap(),
    );
    assert_ne!(
        ja["region"]["corrected_p_3d_m"],
        jc["region"]["corrected_p_3d_m"]
    );
    assert_eq!(ja["region"]["availability"], jc["region"]["availability"]);
    assert_eq!(ja["region"]["hpl_max_m"], jc["region"]["hpl_max_m"]);
}

/// Test 7. The work guard refuses an oversized run and names the inputs to lower.
#[test]
fn the_work_guard_refuses_an_oversized_grid() {
    let e = scenario("grid_lat_step_deg = 0.25\nn_trials = 2000\n")
        .run()
        .unwrap_err();
    assert!(e.contains("exceeds 50000000"), "{e}");
    assert!(e.contains("lower n_trials"), "{e}");
    assert!(e.contains("grid_lat_step_deg"), "{e}");
}

/// The bundled scenario parses, is within the work guard and labels every input.
#[test]
fn the_bundled_scenario_states_a_source_for_every_input() {
    let text = std::fs::read_to_string("scenarios/lunar-station-coverage.toml").unwrap();
    let s: LunarStationCoverageScenario = toml::from_str(&text).unwrap();
    assert!(s.user_points().len() as f64 * s.epochs().len() as f64 * s.n_trials as f64 <= 5e7);
    for name in [
        "n_sats",
        "sma_km",
        "eccentricity",
        "inc_deg",
        "argp_deg",
        "mask_deg",
        "station_lat_deg",
        "station_lon_deg",
        "station_height_m",
        "survey_sigma_m",
        "orbit_err_m",
        "clock_err_m",
        "noise_m",
        "latency_s",
        "quantization_bits",
        "alert_limit_m",
        "residual_sigma_m",
    ] {
        let line = text
            .lines()
            .find(|l| l.starts_with(&format!("{name} =")))
            .unwrap_or_else(|| panic!("{name} is not set in the bundled scenario"));
        assert!(
            line.contains("ILLUSTRATIVE") || line.contains("# S"),
            "{name}: no source label in `{line}`"
        );
    }
    assert!(
        !text.to_lowercase().contains("novamoon"),
        "rule 1: generic naming only"
    );
    let _ = UserPoint {
        lat_deg: 0.0,
        lon_deg: 0.0,
    };
}

/// The result carries the MODELLED label and the honesty statement.
#[test]
fn the_result_is_labelled_modelled_with_the_honesty_statement() {
    let src = std::fs::read_to_string("tests/fixtures/lunar_station/gate.toml").unwrap();
    let out = kshana::api::run_toml(&src).unwrap();
    let j: serde_json::Value = serde_json::from_str(&out.json).unwrap();
    assert_eq!(j["kind"], "lunar-station-coverage");
    assert_eq!(j["label"], "MODELLED");
    let note = j["note"].as_str().unwrap();
    for must in [
        "MODELLED",
        "Not a statement about the performance of any real system",
        "not affiliated",
    ] {
        assert!(note.contains(must), "{must}");
    }
    assert!(out.summary.contains("MODELLED"));
    assert!(out.svg.contains("MODELLED") && out.svg.starts_with("<svg"));
}
