// SPDX-License-Identifier: AGPL-3.0-only
//! Position error ≈ σ_UERE × DOP on the engine's own least-squares fix (`pvt::solve_spp`), by
//! seeded Monte Carlo against the analytic covariance σ²(HᵀH)⁻¹ of the DOP kernel, on the 8
//! geometries of `tests/fixtures/dop/dop_reference.csv`, whose DOP is matched to gnss_lib_py
//! 1.0.4 in `tests/dop_reference.rs` (same user, same satellite placement).
//!
//! Method and tolerances: the 0.36 geometry design note, section 5.2
//! (`docs/design/2026-10-12-geometry-and-skyline-design.md`): N = 20,000 epochs per geometry,
//! σ = 1.5 m, `ChaCha8Rng::seed_from_u64(36 + i)` for geometry `i` in file order, solved from
//! the true position; tolerances in `kshana::dop_error_mc::TOLERANCES`, fixed in a
//! pre-registration commit before the first run. The two masked-skyline geometries of the
//! note are added when the skyline core (item 1) lands.
//!
//! A consistency check, MODELLED (InternalConsistency): the estimator and noise against the
//! closed-form covariance of the same model. No external dataset checks it; σ_UERE is an
//! input.

use kshana::dop_error_mc::{check, run_geometry, GeometryResult, McConfig};
use kshana::portable_math::PortableFloat;

const REF: &str = include_str!("fixtures/dop/dop_reference.csv");

/// The user of `tests/dop_reference.rs`: geocentric, latitude 45, longitude 10, radius 6371 km.
fn user() -> [f64; 3] {
    let (lat, lon) = (45.0_f64.to_radians(), 10.0_f64.to_radians());
    let r = 6.371e6;
    [
        r * lat.pcos() * lon.pcos(),
        r * lat.pcos() * lon.psin(),
        r * lat.psin(),
    ]
}

/// `(label, [(elevation, azimuth)], gnss_lib_py PDOP)` of one fixture row.
type Geometry = (String, Vec<(f64, f64)>, f64);

/// Every fixture row, in file order.
fn geometries() -> Vec<Geometry> {
    REF.lines()
        .map(str::trim)
        .filter(|l| !l.is_empty() && !l.starts_with('#'))
        .map(|l| {
            let c: Vec<&str> = l.split(';').collect();
            let num = |s: &str| -> Vec<f64> { s.split('|').map(|x| x.parse().unwrap()).collect() };
            let (el, az) = (num(c[2]), num(c[3]));
            (
                c[0].to_string(),
                el.into_iter().zip(az).collect(),
                c[5].parse().unwrap(),
            )
        })
        .collect()
}

fn run_all(cfg: &McConfig) -> Vec<GeometryResult> {
    geometries()
        .iter()
        .enumerate()
        .map(|(i, (label, dirs, _))| run_geometry(label, user(), dirs, i as u64, cfg).unwrap())
        .collect()
}

#[test]
fn position_error_is_sigma_times_dop_on_the_gnss_lib_py_geometries() {
    let g = geometries();
    assert_eq!(g.len(), 8, "the 8 gnss_lib_py fixture geometries");
    let results = run_all(&McConfig::default());
    let mut failed = Vec::new();
    for (r, (_, _, pdop_ref)) in results.iter().zip(&g) {
        // The covariance is the validated kernel's: its PDOP is the oracle's.
        assert!(
            ((r.dop.pdop - pdop_ref) / pdop_ref).abs() < 1e-6,
            "{}",
            r.label
        );
        for c in check(r) {
            eprintln!(
                "{:<20} {:<9} {:>+10.5} (bound {}) {}",
                r.label,
                c.name,
                c.value,
                c.bound,
                if c.pass { "ok" } else { "FAIL" }
            );
            if !c.pass {
                failed.push(format!("{} {} {}", r.label, c.name, c.value));
            }
        }
    }
    assert!(failed.is_empty(), "{failed:?}");
}

#[test]
fn negative_control_a_doubled_pdop_fails_every_geometry() {
    let results = run_all(&McConfig {
        dop_scale: 2.0,
        ..McConfig::default()
    });
    for r in &results {
        assert!(
            check(r).iter().any(|c| !c.pass),
            "{} passed with PDOP doubled",
            r.label
        );
    }
}

#[test]
fn negative_control_elevation_dependent_errors_fail_the_low_elevation_geometries() {
    // sigma_i = sigma / sin(el_i) with the unweighted Q: every geometry whose lowest satellite
    // is below 20 deg must fail a variance check.
    let g = geometries();
    let results = run_all(&McConfig {
        elevation_dependent_errors: true,
        ..McConfig::default()
    });
    let mut low = 0;
    for (r, (_, dirs, _)) in results.iter().zip(&g) {
        let lowest = dirs.iter().map(|d| d.0).fold(f64::INFINITY, f64::min);
        if lowest < 20.0 {
            low += 1;
            assert!(
                check(r)
                    .iter()
                    .any(|c| c.name.starts_with("var-") && !c.pass),
                "{} (lowest {lowest} deg) passed with elevation-dependent errors",
                r.label
            );
        }
    }
    assert!(low >= 5, "{low}");
}

/// The masked-skyline addendum (tests/fixtures/dop/PREREGISTRATION-MASKED.md, committed alone in
/// 03999c11 before this ran): the `10sat-mixed` sky under the `city-street` (M1) and
/// `container-terminal` (M2) presets, a satellite kept when its elevation is at or above the
/// skyline's cut at its azimuth; geometry indices 8 and 9; the five tolerances unchanged.
#[test]
fn position_error_is_sigma_times_dop_on_masked_skies() {
    let base = geometries()
        .into_iter()
        .find(|g| g.0 == "10sat-mixed")
        .expect("the 10sat-mixed row");
    let mut failed = Vec::new();
    for (i, (label, preset)) in [
        ("M1-city-street", "city-street"),
        ("M2-container-terminal", "container-terminal"),
    ]
    .into_iter()
    .enumerate()
    {
        let sky = kshana::skyline::preset(preset).unwrap().skyline();
        let dirs: Vec<(f64, f64)> = base
            .1
            .iter()
            .copied()
            .filter(|&(el, az)| el >= sky.cut_deg(az))
            .collect();
        eprintln!(
            "{label}: {} of 10 satellites above the skyline: {dirs:?}",
            dirs.len()
        );
        assert!(
            dirs.len() >= 4,
            "{label}: not evaluable ({} satellites)",
            dirs.len()
        );
        let r = run_geometry(label, user(), &dirs, 8 + i as u64, &McConfig::default())
            .unwrap_or_else(|e| panic!("{label}: not evaluable: {e}"));
        eprintln!(
            "{label}: PDOP {:.4} HDOP {:.4} VDOP {:.4}",
            r.dop.pdop, r.dop.hdop, r.dop.vdop
        );
        for c in check(&r) {
            eprintln!(
                "{:<22} {:<9} {:>+10.5} (bound {}) {}",
                r.label,
                c.name,
                c.value,
                c.bound,
                if c.pass { "ok" } else { "FAIL" }
            );
            if !c.pass {
                failed.push(format!("{} {} {}", r.label, c.name, c.value));
            }
        }
    }
    assert!(failed.is_empty(), "{failed:?}");
}
