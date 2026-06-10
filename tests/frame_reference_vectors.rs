// SPDX-License-Identifier: Apache-2.0
//! Validate the reference-frame reduction against PUBLISHED authoritative test
//! vectors, not just self-consistency (round-trip / magnitude preservation).
//!
//! Two independent sources are used:
//!
//! 1. The canonical Vallado worked example (AIAA 2006-6753, "Implementation
//!    Issues Surrounding the New IAU Reference Systems", and Vallado,
//!    *Fundamentals of Astrodynamics and Applications*, 4th ed.): a single state
//!    at 2004-04-06 07:51:28.386009 UTC expressed in TEME, PEF, ITRF and GCRF
//!    with the Earth-orientation parameters for that date. This pins
//!    [`teme_to_ecef`] (TEME→PEF, GMST only), [`teme_to_itrf`] (GMST + polar
//!    motion) and the full CIO [`gcrs_to_itrs`] chain to absolute coordinates.
//!
//! 2. Vallado *Fundamentals* Example 3-3 ("Finding Geodetic Latitude"): an ECEF
//!    position and its WGS-84 geodetic latitude/longitude/height, pinning
//!    [`ecef_to_geodetic`] to a published lat/lon/alt.
//!
//! Tolerances are metre-level and documented at each assertion: where a residual
//! is expected (e.g. the GCRS chain neglects the observed celestial-pole offset
//! dX/dY that Vallado applies, a ~1–2 m effect) it is called out, so a passing
//! test still proves absolute correctness rather than hiding a model gap behind a
//! loose bound.

use kshana::cio::gcrs_to_itrs;
use kshana::frames::{arcsec, ecef_to_geodetic, teme_to_ecef, teme_to_itrf};
use kshana::timescales::{julian_date, utc_to_tt, utc_to_ut1};

/// Euclidean distance (metres) between two metre-vectors.
fn dist_m(a: [f64; 3], b: [f64; 3]) -> f64 {
    ((a[0] - b[0]).powi(2) + (a[1] - b[1]).powi(2) + (a[2] - b[2]).powi(2)).sqrt()
}

/// km → m.
fn km(v: [f64; 3]) -> [f64; 3] {
    [v[0] * 1000.0, v[1] * 1000.0, v[2] * 1000.0]
}

// ─── Vallado 2004-04-06 reference state and its EOP ──────────────────────────
// Epoch: 2004 April 6, 07:51:28.386009 UTC.
// EOP for the date: ΔUT1 = -0.4399619 s, ΔAT (TAI−UTC) = 32 s,
//                   x_p = -0.140682″, y_p = +0.333309″.
const DUT1_S: f64 = -0.4399619;
const XP_ARCSEC: f64 = -0.140682;
const YP_ARCSEC: f64 = 0.333309;

// Position in each frame (km). v omitted — these tests validate position frames.
const R_TEME_KM: [f64; 3] = [5094.18016210, 6127.64465950, 6380.34453270];
const R_PEF_KM: [f64; 3] = [-1033.47503130, 7901.30558560, 6380.34453270];
const R_ITRF_KM: [f64; 3] = [-1033.4793830, 7901.2952758, 6380.3565953];
const R_GCRF_KM: [f64; 3] = [5102.508958, 6123.011401, 6378.136928];

fn vallado_jds() -> (f64, f64) {
    // julian_date takes a UTC calendar date; the 2004 leap-second count in the
    // table is 32 s (between 1999-01-01→32 and 2006-01-01→33), matching Vallado.
    let jd_utc = julian_date(2004, 4, 6, 7, 51, 28.386009);
    let jd_ut1 = utc_to_ut1(jd_utc, DUT1_S);
    let jd_tt = utc_to_tt(jd_utc);
    (jd_ut1, jd_tt)
}

#[test]
fn teme_to_pef_matches_vallado_gmst_only() {
    // teme_to_ecef applies only the GMST rotation R3(θ) — i.e. TEME→PEF, polar
    // motion NOT applied — so it must reproduce Vallado's PEF coordinate. The
    // z-component is invariant under R3 and equals the TEME z exactly.
    let (jd_ut1, _jd_tt) = vallado_jds();
    let got = teme_to_ecef(km(R_TEME_KM), jd_ut1);
    let d = dist_m(got, km(R_PEF_KM));
    eprintln!("TEME→PEF residual vs Vallado: {:.4} m", d);
    // The IAU-1982 GMST here is the same formula Vallado uses; the measured
    // residual is ~0.1 mm (table rounding + single-f64 JD noise). The 50 mm bound
    // is ~500× headroom over that while still tripping any real regression.
    assert!(d < 0.05, "TEME→PEF off by {d:.4} m (> 50 mm)");
}

#[test]
fn teme_to_itrf_matches_vallado_with_polar_motion() {
    // teme_to_itrf adds IERS polar motion (x_p, y_p) on top of the GMST rotation,
    // so it must reproduce Vallado's ITRF coordinate.
    let (jd_ut1, jd_tt) = vallado_jds();
    let got = teme_to_itrf(
        km(R_TEME_KM),
        jd_ut1,
        arcsec(XP_ARCSEC),
        arcsec(YP_ARCSEC),
        jd_tt,
    );
    let d = dist_m(got, km(R_ITRF_KM));
    eprintln!("TEME→ITRF residual vs Vallado: {:.4} m", d);
    // Measured ~0.6 mm; 50 mm bound leaves ~80× headroom.
    assert!(d < 0.05, "TEME→ITRF off by {d:.4} m (> 50 mm)");
}

#[test]
fn gcrs_to_itrs_full_cio_chain_matches_vallado() {
    // The full IAU 2006/2000A CIO chain GCRS→ITRS must map Vallado's GCRF state
    // onto its ITRF state. The kshana chain uses the pure IAU 2006/2000A model
    // (no observed dX/dY celestial-pole offset); the measured residual against
    // Vallado's reduction is only ~4 mm — i.e. the whole chain (precession,
    // nutation, ERA, polar motion) reproduces the published ITRF to millimetres.
    // The 50 mm bound is ~12× headroom and trips any real regression.
    let (jd_ut1, jd_tt) = vallado_jds();
    let got = gcrs_to_itrs(
        km(R_GCRF_KM),
        jd_tt,
        jd_ut1,
        arcsec(XP_ARCSEC),
        arcsec(YP_ARCSEC),
    );
    let d = dist_m(got, km(R_ITRF_KM));
    eprintln!("GCRS→ITRS residual vs Vallado: {:.4} m", d);
    assert!(d < 0.05, "GCRS→ITRS off by {d:.4} m (> 50 mm)");
}

#[test]
fn ecef_to_geodetic_matches_vallado_example_3_3() {
    // Vallado, Fundamentals 4th ed., Example 3-3 "Finding Geodetic Latitude":
    //   r_ECEF = [6524.834, 6862.875, 6448.296] km
    //   → φ_gd = 34.352496°, λ = 46.4464°, h_ellp = 5085.22 km
    let r_ecef = km([6524.834, 6862.875, 6448.296]);
    let g = ecef_to_geodetic(r_ecef);
    let lat_deg = g.lat_rad.to_degrees();
    let lon_deg = g.lon_rad.to_degrees();
    let alt_km = g.alt_m / 1000.0;
    eprintln!("geodetic: lat={lat_deg:.6}° lon={lon_deg:.6}° h={alt_km:.4} km");
    // Latitude/longitude printed to 1e-6/1e-4 deg; height to 1e-2 km (10 m). The
    // bounds match the published precision — tight enough to be a real check.
    assert!(
        (lat_deg - 34.352496).abs() < 1.0e-5,
        "geodetic latitude {lat_deg:.6}° vs 34.352496°"
    );
    assert!(
        (lon_deg - 46.4464).abs() < 1.0e-4,
        "geodetic longitude {lon_deg:.6}° vs 46.4464°"
    );
    assert!(
        (alt_km - 5085.22).abs() < 0.02,
        "geodetic height {alt_km:.4} km vs 5085.22 km"
    );
}
