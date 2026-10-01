// SPDX-License-Identifier: AGPL-3.0-only
//! Pre-registered external validation of the "Off-boresight antenna pattern in the lunar
//! geometry export" row (`lunar_service` per-satellite export with `export_antenna`).
//!
//! ## The quantity
//!
//! Per exported (epoch, satellite) row: the off-boresight angle AT THE SATELLITE between
//! its nadir boresight (the direction to the Moon's centre) and the line of sight to the
//! export site; whether the satellite clears the site's 5 deg elevation mask; the transmit
//! gain toward the site from the uniformly illuminated circular-aperture (Airy) pattern;
//! the in-beam flag under that pattern (gain within 10*log10(2) dB of boresight) and under
//! the symmetric approximation (angle <= half of sqrt(31000 / G_lin) deg). Per run: the
//! visible-link count, both in-beam counts, the correction (real minus approximate) and the
//! worst single-epoch correction.
//!
//! ## The inputs
//!
//! **Part A — flown orbiters.** The committed JPL Horizons evaluation of JPL's
//! reconstructed spacecraft kernels,
//! `tests/fixtures/lunar_ephemeris/horizons_lunar_orbiters_2023001_12h.csv` (LRO, the Lunar
//! Reconnaissance Orbiter; Danuri; Chandrayaan-2; CAPSTONE; Moon-centred ICRF, the
//! International Celestial Reference Frame, 5 min step, epoch 2023-01-01 00:00 TDB,
//! Barycentric Dynamical Time). Horizons is an accepted Reference; these states are inputs
//! to both sides. Run through the scenario's `ephemeris_path` with horizon 11 h and a
//! 5 min step (epochs on the table nodes), at six export sites fixed here, before any
//! result is seen — (lat, lon) deg = (-89.5, 0), (-60, 45), (-20, -100), (0, 0), (35, 160),
//! (75, -30) — and two apertures at 2.4 GHz with efficiency 0.60: a 0.3 m dish (wide beam,
//! so low orbiters give a mix of in-beam and out-of-beam links) and a 1.0 m dish.
//!
//! **Part B — the documented working point.** The row's own measured disagreement:
//! the default eight-satellite illustrative LCNS-class (Lunar Communications and
//! Navigation Services) element set, site (-89.9, 0) deg, 1 m dish at 2.4 GHz,
//! efficiency 0.60, 12 h horizon, 60 min step — 76 visible links, 0 in beam under the real
//! pattern against 28 under the approximation, worst epoch 3. The element set and the
//! engine's mean-rotation Moon-fixed frame convention (a uniform rotation about the spin
//! axis at the sidereal rate, zero at t = 0) are stated inputs of the illustrative
//! constellation.
//!
//! ## The oracle (Library)
//!
//! * **Geometry, Part A:** NAIF SPICE toolkit N0067 through `spiceypy` 8.2.0 (MIT; NAIF
//!   kernels are US Government work, free) with `pck00011.tpc` (the IAU, International
//!   Astronomical Union, 2015 rotation model of the Moon, frame `IAU_MOON`, the same body
//!   frame the engine reduces ICRF states into; not `MOON_PA`, which differs by about
//!   700 m) and `naif0012.tls`. The site is `latrec(1737.4 km, lon, lat)` in `IAU_MOON`,
//!   rotated to J2000 by `pxform` at `et = (epoch_jd_tdb - 2451545.0) * 86400 + t`
//!   (TDB seconds, the time scale the Horizons file states). The off-boresight angle is
//!   `vsep(-r_sat, r_site - r_sat)` and the elevation is `90 deg - vsep(r_site,
//!   r_sat - r_site)`.
//! * **Geometry, Part B:** satellite states from ANISE 0.10.6 (Mozilla Public Licence 2.0)
//!   Keplerian two-body propagation (`Orbit.from_keplerian_mean_anomaly`, `at_epoch`),
//!   rotated by the stated mean-rotation convention, angles by SPICE `vsep` as in Part A.
//! * **Pattern:** the oracle recomputes the gain itself with SciPy 1.18.1
//!   `scipy.special.j1` (BSD-3-Clause): `G0 = 10 log10(eta (pi D / lambda)^2)`,
//!   `lambda = 299792458 / f`, `G = G0 + 10 log10((2 J1(x) / x)^2)`,
//!   `x = (pi D / lambda) sin(theta)`; both in-beam flags follow from it. It does not lean
//!   on the pattern's own row.
//!
//! Generator: `tests/fixtures/lunar_export_offboresight_spice/gen_offboresight_spice.py`;
//! output committed, no Python at run time.
//!
//! ## Tolerances, fixed before the first comparison
//!
//! * Off-boresight angle: **1e-3 deg** per row.
//! * Visibility flag: **exact**, except rows whose oracle elevation is within 1e-3 deg of
//!   the mask, which are listed separately and excluded from the flag comparison.
//! * Both in-beam flags: **exact**, except rows whose oracle angle is within 1e-3 deg of the
//!   respective beam edge, listed separately.
//! * Transmit gain: **0.01 dB** for rows inside the first null of the pattern (the angle
//!   tolerance moves the gain by at most about 2e-3 dB there); beyond the first null the
//!   pattern is near its zeros and only the linear gain relative to boresight is compared,
//!   to **1e-4** absolute.
//! * Counts (links evaluated, in beam under each pattern, the correction, the worst-epoch
//!   correction): **exact** when no row is in an edge band; otherwise each count may differ
//!   by no more than the number of edge-band rows, which is reported.
//!
//! ## What this does not validate
//!
//! The two implied aperture efficiencies the block emits (0.641 against the 70 lambda/D
//! rule, 0.920 against 1.02 lambda/D) are closed-form algebra on stated rules of thumb; no
//! independent library or published worked value recomputes them here.

use kshana::lunar_service::{ExportAntennaCfg, LunarServiceScenario};
use std::collections::HashMap;

const REFERENCE_A: &str = "tests/fixtures/lunar_export_offboresight_spice/flown_orbiters.csv";
const REFERENCE_B: &str = "tests/fixtures/lunar_export_offboresight_spice/working_point.csv";
const EPHEMERIS: &str = "tests/fixtures/lunar_ephemeris/horizons_lunar_orbiters_2023001_12h.csv";

/// Off-boresight angle tolerance (deg).
const ANGLE_TOL_DEG: f64 = 1.0e-3;
/// Gain tolerance inside the first null (dB).
const GAIN_TOL_DB: f64 = 1.0e-2;
/// Linear gain tolerance relative to boresight beyond the first null.
const GAIN_LIN_REL_TOL: f64 = 1.0e-4;

/// One oracle row.
struct OracleRow {
    t_s: f64,
    sat: usize,
    el_deg: f64,
    visible: bool,
    theta_deg: f64,
    gain_dbi: f64,
    gain_lin_rel: f64,
    in_pattern: bool,
    in_symmetric: bool,
    first_null_deg: f64,
    edge: bool,
}

/// The oracle's rows grouped by case, and its per-case summaries.
fn oracle(path: &str) -> (HashMap<String, Vec<OracleRow>>, HashMap<String, serde_json::Value>) {
    let text = std::fs::read_to_string(path).expect("the oracle output is committed");
    let mut rows: HashMap<String, Vec<OracleRow>> = HashMap::new();
    let mut sums = HashMap::new();
    for line in text.lines() {
        if let Some(j) = line.strip_prefix("# SUMMARY ") {
            let v: serde_json::Value = serde_json::from_str(j).unwrap();
            sums.insert(v["case"].as_str().unwrap().to_string(), v);
            continue;
        }
        if line.starts_with('#') || line.starts_with("case,") {
            continue;
        }
        let f: Vec<&str> = line.split(',').collect();
        let x = |k: usize| f[k].parse::<f64>().unwrap();
        rows.entry(f[0].to_string()).or_default().push(OracleRow {
            t_s: x(1),
            sat: f[2].parse().unwrap(),
            el_deg: x(3),
            visible: f[4] == "1",
            theta_deg: x(5),
            gain_dbi: x(6),
            gain_lin_rel: x(7),
            in_pattern: f[8] == "1",
            in_symmetric: f[9] == "1",
            first_null_deg: x(10),
            edge: f[11] == "1",
        });
    }
    (rows, sums)
}

/// Compare one engine run with one oracle case; returns (rows, worst angle gap deg, worst
/// main-lobe gain gap dB, edge-band rows).
fn compare(
    case: &str,
    sc: &LunarServiceScenario,
    rows: &[OracleRow],
    sum: &serde_json::Value,
) -> (usize, f64, f64, usize) {
    let rep = sc.try_run().expect("the scenario runs");
    let geom = rep.per_sat_geometry.as_ref().expect("export site configured");
    let ap = rep.antenna_pattern.as_ref().expect("antenna configured");
    assert_eq!(geom.len(), rows.len(), "{case}: row count");
    let g0_lin = 10f64.powf(ap.boresight_gain_dbi / 10.0);
    let (mut worst_angle, mut worst_gain, mut edges) = (0.0_f64, 0.0_f64, 0usize);
    for (g, o) in geom.iter().zip(rows) {
        assert!((g.t_s - o.t_s).abs() < 1e-6 && g.sat == o.sat, "{case}: row order");
        let th = g.off_boresight_deg.unwrap();
        let d = (th - o.theta_deg).abs();
        worst_angle = worst_angle.max(d);
        assert!(
            d <= ANGLE_TOL_DEG,
            "{case} t={} sat {}: off-boresight engine {th:.6} deg, SPICE {:.6} deg",
            o.t_s,
            o.sat,
            o.theta_deg
        );
        let gain = g.pattern_gain_dbi.unwrap();
        if o.theta_deg < o.first_null_deg {
            let e = (gain - o.gain_dbi).abs();
            worst_gain = worst_gain.max(e);
            assert!(
                e <= GAIN_TOL_DB,
                "{case} t={} sat {}: gain engine {gain:.5} dBi, SciPy {:.5} dBi",
                o.t_s,
                o.sat,
                o.gain_dbi
            );
        } else {
            let lin = 10f64.powf(gain / 10.0) / g0_lin;
            assert!(
                (lin - o.gain_lin_rel).abs() <= GAIN_LIN_REL_TOL,
                "{case} t={} sat {}: sidelobe gain engine {lin:.3e}, SciPy {:.3e} of boresight",
                o.t_s,
                o.sat,
                o.gain_lin_rel
            );
        }
        if o.edge {
            edges += 1;
            continue;
        }
        assert_eq!(g.visible, o.visible, "{case} t={} sat {}: visible (el {:.4})", o.t_s, o.sat, o.el_deg);
        assert_eq!(g.in_beam_pattern, Some(o.in_pattern), "{case} t={} sat {}: in beam (pattern)", o.t_s, o.sat);
        assert_eq!(g.in_beam_symmetric, Some(o.in_symmetric), "{case} t={} sat {}: in beam (symmetric)", o.t_s, o.sat);
    }
    let n = |k: &str| sum[k].as_i64().unwrap();
    let slack = edges as i64;
    for (got, key) in [
        (ap.n_links_evaluated as i64, "n_links_evaluated"),
        (ap.in_beam_pattern_links as i64, "in_beam_pattern_links"),
        (ap.in_beam_symmetric_links as i64, "in_beam_symmetric_links"),
        (ap.in_beam_correction_links, "in_beam_correction_links"),
        (ap.max_abs_epoch_correction_sats as i64, "max_abs_epoch_correction_sats"),
    ] {
        assert!(
            (got - n(key)).abs() <= slack,
            "{case}: {key} engine {got}, oracle {} (edge-band rows {edges})",
            n(key)
        );
    }
    (geom.len(), worst_angle, worst_gain, edges)
}

#[test]
fn flown_orbiter_export_matches_spice_geometry_and_scipy_pattern() {
    let (rows, sums) = oracle(REFERENCE_A);
    let sites = [
        (-89.5, 0.0),
        (-60.0, 45.0),
        (-20.0, -100.0),
        (0.0, 0.0),
        (35.0, 160.0),
        (75.0, -30.0),
    ];
    let (mut n_rows, mut wa, mut wg, mut edges) = (0, 0.0_f64, 0.0_f64, 0);
    let mut in_beam = (0, 0);
    for (si, &(lat, lon)) in sites.iter().enumerate() {
        for d in [0.3, 1.0] {
            let case = format!("A{si}_D{d}");
            let sc = LunarServiceScenario {
                ephemeris_path: Some(EPHEMERIS.to_string()),
                // Not compared: these only size the illustrative Keplerian and perturbed
                // comparison sweeps and the coverage grid that run beside the export. The
                // export rows come from the ephemeris file alone.
                n_sats: 1,
                lat_min_deg: -90.0,
                lat_max_deg: -90.0,
                lon_min_deg: 0.0,
                lon_max_deg: 0.0,
                horizon_hours: 11.0,
                step_min: 5.0,
                export_site_lat_deg: Some(lat),
                export_site_lon_deg: Some(lon),
                export_antenna: Some(ExportAntennaCfg {
                    diameter_m: d,
                    carrier_hz: 2.4e9,
                    efficiency: 0.60,
                }),
                ..LunarServiceScenario::default()
            };
            let r = compare(&case, &sc, &rows[&case], &sums[&case]);
            n_rows += r.0;
            wa = wa.max(r.1);
            wg = wg.max(r.2);
            edges += r.3;
            in_beam.0 += sums[&case]["in_beam_pattern_links"].as_i64().unwrap();
            in_beam.1 += sums[&case]["n_links_evaluated"].as_i64().unwrap();
        }
    }
    println!(
        "flown orbiters vs SPICE+SciPy: {n_rows} rows, worst off-boresight gap {wa:.3e} deg \
         (bar {ANGLE_TOL_DEG}), worst main-lobe gain gap {wg:.3e} dB (bar {GAIN_TOL_DB}), \
         edge-band rows {edges}; {} of {} visible links in beam under the real pattern",
        in_beam.0, in_beam.1
    );
}

#[test]
fn documented_working_point_matches_anise_propagation_and_scipy_pattern() {
    let (rows, sums) = oracle(REFERENCE_B);
    let sc = LunarServiceScenario {
        n_sats: 8,
        export_site_lat_deg: Some(-89.9),
        export_site_lon_deg: Some(0.0),
        export_antenna: Some(ExportAntennaCfg {
            diameter_m: 1.0,
            carrier_hz: 2.4e9,
            efficiency: 0.60,
        }),
        ..LunarServiceScenario::default()
    };
    let (n, wa, wg, edges) = compare("B", &sc, &rows["B"], &sums["B"]);
    let s = &sums["B"];
    // The row's printed working point, on the oracle side.
    assert_eq!(
        (
            s["n_links_evaluated"].as_i64(),
            s["in_beam_pattern_links"].as_i64(),
            s["in_beam_symmetric_links"].as_i64(),
            s["max_abs_epoch_correction_sats"].as_i64()
        ),
        (Some(76), Some(0), Some(28), Some(3))
    );
    println!(
        "working point vs ANISE+SPICE+SciPy: {n} rows, worst off-boresight gap {wa:.3e} deg, \
         worst main-lobe gain gap {wg:.3e} dB, edge-band rows {edges}; 76 links, 0 vs 28 in beam"
    );
}
