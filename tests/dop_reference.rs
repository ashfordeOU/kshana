// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate Kshana's dilution-of-precision engine (`orbit::dop`)
//! against an **independent third-party authority**: gnss_lib_py 1.0.4 (the
//! Stanford NAV Lab GNSS library; open source, peer-reviewed in JOSS 2023).
//!
//! DOP is a deterministic function of line-of-sight geometry alone, so matching
//! gnss_lib_py's numeric output for a fully-specified geometry is a genuine
//! external cross-check of Kshana's design-matrix assembly, 4x4 inversion and
//! East-North-Up projection — the same kind of validation the reference frames
//! get against IAU SOFA/ERFA, not a self-consistency check.
//!
//! The reference vectors (and their provenance / how to regenerate them) live in
//! `tests/fixtures/dop/` — `dop_reference.csv`, `NOTICE`, and the committed
//! `generate_dop_reference.py`. Each row gives a geometry as
//! per-satellite (elevation, azimuth) and the five reference DOP factors.
//!
//! Reconstruction: we place a ground user at a fixed geocentric latitude /
//! longitude and synthesise each satellite at the published (elevation, azimuth)
//! using Kshana's own `orbit::enu_basis`, range scaled out (DOP is range-free).
//! `orbit::dop` then has to reproduce gnss_lib_py's GDOP/PDOP/HDOP/VDOP/TDOP.

use kshana::orbit::{dop, enu_basis};

type Vec3 = [f64; 3];

const REF: &str = include_str!("fixtures/dop/dop_reference.csv");

/// Tight relative tolerance. Kshana inverts the 4x4 normal matrix by Gauss-
/// Jordan with partial pivoting; gnss_lib_py uses numpy/LAPACK. For well-
/// conditioned geometry the two agree to ~1e-9; the bound below also covers the
/// deliberately near-singular stress cases (DOP in the hundreds) without hiding
/// a real discrepancy.
const REL_TOL: f64 = 1e-6;

/// A satellite's ENU unit line-of-sight for (elevation, azimuth), in degrees.
/// Convention matches gnss_lib_py's `el_az_to_enu_unit_vector` and Kshana's
/// `orbit::enu_basis`: E = cos el·sin az, N = cos el·cos az, U = sin el.
fn los_enu(el_deg: f64, az_deg: f64) -> Vec3 {
    let (el, az) = (el_deg.to_radians(), az_deg.to_radians());
    [el.cos() * az.sin(), el.cos() * az.cos(), el.sin()]
}

/// Geocentric ground user at latitude/longitude (degrees), radius ~Earth.
fn user_ecef(lat_deg: f64, lon_deg: f64) -> Vec3 {
    let (lat, lon) = (lat_deg.to_radians(), lon_deg.to_radians());
    let r = 6.371e6;
    [
        r * lat.cos() * lon.cos(),
        r * lat.cos() * lon.sin(),
        r * lat.sin(),
    ]
}

/// Place a satellite at (elevation, azimuth) as seen from `user`, using Kshana's
/// own ENU basis. Range is arbitrary (1 unit cancels under normalisation in
/// `los_unit`); DOP depends only on direction.
fn sat_at(user: Vec3, east: Vec3, north: Vec3, up: Vec3, el_deg: f64, az_deg: f64) -> Vec3 {
    let l = los_enu(el_deg, az_deg);
    let range = 2.0e7;
    [
        user[0] + range * (l[0] * east[0] + l[1] * north[0] + l[2] * up[0]),
        user[1] + range * (l[0] * east[1] + l[1] * north[1] + l[2] * up[1]),
        user[2] + range * (l[0] * east[2] + l[1] * north[2] + l[2] * up[2]),
    ]
}

fn rel_diff(got: f64, want: f64) -> f64 {
    (got - want).abs() / want.abs().max(1e-12)
}

#[test]
fn dop_matches_gnss_lib_py_reference_geometries() {
    let user = user_ecef(45.0, 10.0);
    let (east, north, up) = enu_basis(user).expect("valid ENU basis at a mid-latitude user");

    let mut checked = 0usize;
    for line in REF.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        let cols: Vec<&str> = line.split(';').collect();
        assert!(
            cols.len() == 9,
            "malformed reference row (expected 9 fields): {line}"
        );
        let label = cols[0];
        let n: usize = cols[1].parse().expect("satellite count");
        let els: Vec<f64> = cols[2].split('|').map(|s| s.parse().unwrap()).collect();
        let azs: Vec<f64> = cols[3].split('|').map(|s| s.parse().unwrap()).collect();
        assert_eq!(els.len(), n, "{label}: elevation count");
        assert_eq!(azs.len(), n, "{label}: azimuth count");

        let (want_gdop, want_pdop, want_hdop, want_vdop, want_tdop) = (
            cols[4].parse::<f64>().unwrap(),
            cols[5].parse::<f64>().unwrap(),
            cols[6].parse::<f64>().unwrap(),
            cols[7].parse::<f64>().unwrap(),
            cols[8].parse::<f64>().unwrap(),
        );
        // The oracle must be a non-trivial, physical DOP (guards against an
        // all-zero / empty reference silently passing).
        assert!(
            want_gdop > 0.0 && want_pdop > 0.0,
            "{label}: trivial oracle"
        );

        let sats: Vec<Vec3> = els
            .iter()
            .zip(&azs)
            .map(|(&el, &az)| sat_at(user, east, north, up, el, az))
            .collect();

        let d = dop(user, &sats).unwrap_or_else(|| panic!("{label}: dop() returned None"));

        for (name, got, want) in [
            ("GDOP", d.gdop, want_gdop),
            ("PDOP", d.pdop, want_pdop),
            ("HDOP", d.hdop, want_hdop),
            ("VDOP", d.vdop, want_vdop),
            ("TDOP", d.tdop, want_tdop),
        ] {
            let rd = rel_diff(got, want);
            assert!(
                rd <= REL_TOL,
                "{label}: {name} {got:.9} vs gnss_lib_py {want:.9} (rel {rd:.2e} > {REL_TOL:.0e})"
            );
        }
        checked += 1;
    }

    // The fixture must actually have exercised the engine across its spread of
    // geometries (well-conditioned through near-singular), not zero rows.
    assert!(
        checked >= 8,
        "expected >= 8 reference geometries, checked {checked}"
    );
}

/// Independent identity the oracle and Kshana must both satisfy: PDOP² =
/// HDOP² + VDOP², and GDOP² = PDOP² + TDOP². A correct (HᵀH)⁻¹ and ENU split
/// give these exactly; a transposed/duplicated term would not.
#[test]
fn dop_components_satisfy_the_pythagorean_identities() {
    let user = user_ecef(45.0, 10.0);
    let (east, north, up) = enu_basis(user).expect("valid ENU basis");
    let (els, azs) = (
        [20.0, 45.0, 70.0, 15.0, 30.0, 60.0],
        [10.0, 110.0, 220.0, 300.0, 160.0, 40.0],
    );
    let sats: Vec<Vec3> = els
        .iter()
        .zip(&azs)
        .map(|(&el, &az)| sat_at(user, east, north, up, el, az))
        .collect();
    let d = dop(user, &sats).expect("dop");
    assert!(
        rel_diff(d.pdop * d.pdop, d.hdop * d.hdop + d.vdop * d.vdop) < 1e-9,
        "PDOP² = HDOP² + VDOP²"
    );
    assert!(
        rel_diff(d.gdop * d.gdop, d.pdop * d.pdop + d.tdop * d.tdop) < 1e-9,
        "GDOP² = PDOP² + TDOP²"
    );
}
