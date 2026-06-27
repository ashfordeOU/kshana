// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate kshana's launch-window / ascent geometry against PUBLISHED
//! worked numbers from an authoritative text — not just self-consistency.
//!
//! ORACLE (published-vectors): Vallado, *Fundamentals of Astrodynamics and
//! Applications*, 4th ed. (Microcosm/Springer, 2013, ISBN 978-1881883180):
//!
//!   * §6.4 Algorithm 37 — the *inertial / geometric* launch azimuth
//!     `sin(beta) = cos(i)/cos(lat)` (the auxiliary azimuth before the
//!     rotating-Earth velocity-triangle correction). Anchors: KSC (28.5° N) → ISS
//!     (51.6°) ≈ 45° (textbook), due-east `i = lat` = 90° exactly, polar `i = 90°`
//!     = 0° (due north) exactly.
//!   * §6.3 / Example 6-2 — inclination-only plane change `Δv = 2 v sin(Δi/2)`;
//!     Vallado's published case v = 5.892311 km/s, Δi = 15° → 1.5382 km/s.
//!   * Vis-viva circular speed `v = sqrt(mu/r)` at the geostationary radius
//!     r = 42164.1696 km, where the standard tables publish v_GEO ≈ 3.074660 km/s.
//!
//! HONEST SCOPE — what this DOES and does NOT validate:
//!   * VALIDATES that kshana's `launch_azimuth` reproduces Vallado's geometric /
//!     inertial azimuth to <0.05° across ≥3 (lat, i) cases (KSC→ISS, due-east,
//!     near-polar, plus a retrograde SSO and a high-latitude site).
//!   * The plane-change Δv (<0.5 m/s) and circular velocity (<0.1 m/s) reproduce
//!     Vallado's published worked numbers, but these are exact closed forms
//!     (`2 v sin(Δi/2)`, `sqrt(mu/r)`) evaluated with the same standard constants
//!     kshana uses — so they confirm the formulae + constants, NOT an independent
//!     integration/algorithm.
//!   * Does NOT validate the rotating-Earth velocity-triangle (operational)
//!     azimuth, ascent trajectory, drag/steering losses — those stay MODELLED.
//!     kshana's `launch_azimuth` deliberately returns the geometric relation only.
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/launch_window_ascent_geometry/`.

use kshana::launch::{circular_velocity, launch_azimuth, plane_change_dv};

const REF: &str = include_str!(
    "fixtures/launch_window_ascent_geometry/launch_window_ascent_geometry_reference.txt"
);

/// Inertial azimuth: pinned to <0.05° (the planned tolerance). The geometric
/// relation is exact so the only error is f64 transcendentals — far below 0.05°.
const AZ_TOL_DEG: f64 = 0.05;
/// Plane-change Δv: pinned to <0.5 m/s vs Vallado's published worked numbers.
const DV_TOL_M_S: f64 = 0.5;
/// Circular velocity: pinned to <0.1 m/s vs the published GEO worked value.
const VCIRC_TOL_M_S: f64 = 0.1;

#[test]
fn launch_geometry_matches_vallado_published_numbers() {
    let mut n_az = 0usize;
    let mut n_dv = 0usize;
    let mut n_vc = 0usize;
    let mut worst_az = 0.0_f64;
    let mut worst_dv = 0.0_f64;
    let mut worst_vc = 0.0_f64;

    for line in REF.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }

        if let Some(rest) = line.strip_prefix("AZIMUTH ") {
            // name | lat_deg | i_deg | inertial_azimuth_deg
            let p: Vec<&str> = rest.splitn(4, '|').collect();
            assert_eq!(p.len(), 4, "AZIMUTH row needs 4 fields: {line}");
            let name = p[0].trim();
            let lat: f64 = p[1].trim().parse().unwrap();
            let i: f64 = p[2].trim().parse().unwrap();
            let want: f64 = p[3].trim().parse().unwrap();

            let (asc, _desc) = launch_azimuth(lat.to_radians(), i.to_radians())
                .unwrap_or_else(|e| panic!("AZIMUTH {name}: kshana launch_azimuth errored: {e}"));
            let got = asc.to_degrees();
            let d = (got - want).abs();
            worst_az = worst_az.max(d);
            assert!(
                d <= AZ_TOL_DEG,
                "AZIMUTH {name} (lat={lat}°, i={i}°): kshana {got:.6}° vs Vallado {want:.6}° \
                 (|Δ|={d:.2e}° > {AZ_TOL_DEG}°)"
            );
            n_az += 1;
        } else if let Some(rest) = line.strip_prefix("PLANECHANGE ") {
            // name | v_orbit_m_s | delta_i_deg | dv_m_s
            let p: Vec<&str> = rest.splitn(4, '|').collect();
            assert_eq!(p.len(), 4, "PLANECHANGE row needs 4 fields: {line}");
            let name = p[0].trim();
            let v: f64 = p[1].trim().parse().unwrap();
            let di: f64 = p[2].trim().parse().unwrap();
            let want: f64 = p[3].trim().parse().unwrap();

            let got = plane_change_dv(v, di.to_radians());
            let d = (got - want).abs();
            worst_dv = worst_dv.max(d);
            assert!(
                d <= DV_TOL_M_S,
                "PLANECHANGE {name} (v={v} m/s, Δi={di}°): kshana {got:.6} m/s vs Vallado \
                 {want:.6} m/s (|Δ|={d:.2e} > {DV_TOL_M_S} m/s)"
            );
            n_dv += 1;
        } else if let Some(rest) = line.strip_prefix("CIRCVEL ") {
            // name | altitude_m | v_circ_m_s
            let p: Vec<&str> = rest.splitn(3, '|').collect();
            assert_eq!(p.len(), 3, "CIRCVEL row needs 3 fields: {line}");
            let name = p[0].trim();
            let alt: f64 = p[1].trim().parse().unwrap();
            let want: f64 = p[2].trim().parse().unwrap();

            let got = circular_velocity(alt);
            let d = (got - want).abs();
            worst_vc = worst_vc.max(d);
            assert!(
                d <= VCIRC_TOL_M_S,
                "CIRCVEL {name} (alt={alt} m): kshana {got:.6} m/s vs Vallado {want:.6} m/s \
                 (|Δ|={d:.2e} > {VCIRC_TOL_M_S} m/s)"
            );
            n_vc += 1;
        }
    }

    // Independent published GEO anchor: the *book literal* 3074.660 m/s, not a
    // value derived through mu in the fixture — kshana must land within 0.1 m/s.
    let r_geo_m = 42_164_169.6_f64; // Vallado geostationary radius
    let alt_geo_m = r_geo_m - 6_378_137.0; // above WGS-84 equatorial radius
    let v_geo = circular_velocity(alt_geo_m);
    let d_geo = (v_geo - 3074.660).abs();
    assert!(
        d_geo <= VCIRC_TOL_M_S,
        "v_GEO: kshana {v_geo:.6} m/s vs published 3074.660 m/s (|Δ|={d_geo:.2e} > {VCIRC_TOL_M_S})"
    );

    // Planned minimum coverage.
    assert!(
        n_az >= 3,
        "expected >=3 inertial-azimuth (lat,i) cases, got {n_az}"
    );
    assert!(n_dv >= 1, "expected >=1 plane-change case, got {n_dv}");
    assert!(n_vc >= 1, "expected >=1 circular-velocity case, got {n_vc}");
    assert!(
        n_az + n_dv + n_vc >= 5,
        "expected >=5 pinned cases total, got {}",
        n_az + n_dv + n_vc
    );

    eprintln!(
        "launch_window_ascent_geometry: {n_az} azimuth (worst |Δ|={worst_az:.2e}°), \
         {n_dv} plane-change (worst |Δ|={worst_dv:.2e} m/s), \
         {n_vc} circ-vel (worst |Δ|={worst_vc:.2e} m/s), \
         v_GEO |Δ|={d_geo:.2e} m/s vs Vallado published numbers"
    );
}
