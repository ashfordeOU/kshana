// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle test for the per-satellite look angles and slant range a lunar surface user sees
//! (`lunar::selenographic_to_mcmf` and `lunar_service::topocentric`), against ANISE.
//!
//! ## Oracle (kind: Library)
//!
//! ANISE 0.10.2 (Nyx Space, MPL-2.0, <https://github.com/nyx-space/anise>), run as the
//! fixture generator `xval/anise-service-geometry/src/bin/lunar_look_angles.rs`, which calls
//! no Kshana code. With NAIF `de440s.bsp`, `moon_pa_de440_200625.bpc`, `pck00011.tpc` and
//! `gm_de440.tpc`, it places each site with `Orbit::try_latlongalt` on the pck00011 Moon,
//! propagates eight Keplerian lunar satellites in Moon J2000, rotates them into
//! MOON_PA_DE440 through the binary PCK, and computes azimuth, elevation and range with
//! `Almanac::azimuth_elevation_range_sez` (no aberration, no obstruction): 8 sites x 12
//! epochs x 8 satellites = 768 samples, above and below the horizon.
//!
//! ## Claim compared
//!
//! Given a selenographic site and a satellite position in the same Moon body-fixed frame,
//! Kshana places the site and returns azimuth (clockwise from north), elevation and slant
//! range. How Kshana realises its own Moon-fixed frame is outside this claim.
//!
//! ## Tolerances (fixed before the first comparison)
//!
//! Site position 1 mm per axis; azimuth and elevation 1e-6 deg (azimuth compared modulo
//! 360 deg, where cos(elevation) > 1e-6); range 1 mm. Every sample must be inside every
//! bound.

use kshana::lunar::{selenographic_to_mcmf, Selenographic, NAMED_SITES};
use kshana::lunar_service::topocentric;

const REF: &str =
    include_str!("fixtures/lunar_service_geometry_oracle/anise_look_angles_reference.txt");

const SITE_TOL_M: f64 = 1.0e-3;
const ANGLE_TOL_DEG: f64 = 1.0e-6;
const RANGE_TOL_M: f64 = 1.0e-3;

struct Sample {
    site: String,
    lat_deg: f64,
    lon_deg: f64,
    site_m: [f64; 3],
    sat_m: [f64; 3],
    az_deg: f64,
    el_deg: f64,
    range_m: f64,
}

fn samples() -> Vec<Sample> {
    REF.lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| {
            let t: Vec<&str> = l.split_whitespace().collect();
            assert_eq!(t.len(), 14, "malformed fixture line: {l}");
            let f = |i: usize| -> f64 { t[i].parse().unwrap() };
            Sample {
                site: t[0].to_string(),
                lat_deg: f(1),
                lon_deg: f(2),
                site_m: [f(5) * 1e3, f(6) * 1e3, f(7) * 1e3],
                sat_m: [f(8) * 1e3, f(9) * 1e3, f(10) * 1e3],
                az_deg: f(11),
                el_deg: f(12),
                range_m: f(13) * 1e3,
            }
        })
        .collect()
}

#[test]
fn look_angles_match_anise_at_selenographic_sites() {
    let s = samples();
    assert_eq!(s.len(), 768, "8 sites x 12 epochs x 8 satellites");

    // The four named sites in the fixture are Kshana's own named sites.
    for site in NAMED_SITES {
        assert!(
            s.iter()
                .any(|x| x.lat_deg == site.lat_deg && x.lon_deg == site.lon_deg),
            "named site {} ({}, {}) is missing from the oracle fixture",
            site.name,
            site.lat_deg,
            site.lon_deg
        );
    }

    let (mut w_site, mut w_az, mut w_el, mut w_rng) = (0.0_f64, 0.0_f64, 0.0_f64, 0.0_f64);
    let mut n_az = 0usize;
    let mut n_below = 0usize;
    for x in &s {
        let site = selenographic_to_mcmf(Selenographic {
            lat_rad: x.lat_deg.to_radians(),
            lon_rad: x.lon_deg.to_radians(),
            alt_m: 0.0,
        });
        for (a, b) in site.iter().zip(&x.site_m) {
            w_site = w_site.max((a - b).abs());
        }
        let (az, el, rng) = topocentric(site, x.sat_m);
        if x.el_deg < 0.0 {
            n_below += 1;
        }
        let d_el = (el - x.el_deg).abs();
        let d_rng = (rng - x.range_m).abs();
        w_el = w_el.max(d_el);
        w_rng = w_rng.max(d_rng);
        if x.el_deg.to_radians().cos() > 1e-6 {
            let mut d_az = (az - x.az_deg).rem_euclid(360.0);
            if d_az > 180.0 {
                d_az = 360.0 - d_az;
            }
            w_az = w_az.max(d_az);
            n_az += 1;
            assert!(
                d_az <= ANGLE_TOL_DEG,
                "{} sat at ({:?}): azimuth Kshana {az} vs ANISE {} (diff {d_az:e} deg)",
                x.site,
                x.sat_m,
                x.az_deg
            );
        }
        assert!(
            d_el <= ANGLE_TOL_DEG,
            "{}: elevation Kshana {el} vs ANISE {} (diff {d_el:e} deg)",
            x.site,
            x.el_deg
        );
        assert!(
            d_rng <= RANGE_TOL_M,
            "{}: range Kshana {rng} m vs ANISE {} m (diff {d_rng:e} m)",
            x.site,
            x.range_m
        );
    }
    eprintln!(
        "M045 oracle: {} samples ({n_below} below the horizon, {n_az} with azimuth compared); \
         worst site {w_site:.3e} m, azimuth {w_az:.3e} deg, elevation {w_el:.3e} deg, range \
         {w_rng:.3e} m",
        s.len()
    );
    assert!(
        w_site <= SITE_TOL_M,
        "site placement differs from ANISE by {w_site:e} m"
    );
}
