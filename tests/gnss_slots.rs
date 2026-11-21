// SPDX-License-Identifier: AGPL-3.0-only
//! GEO and IGSO slots in `gnss-sim` (`src/gnss_slots.rs`, `data/gnss-slots/`):
//!
//! * an IGSO ground track is a figure eight whose latitude extent is the inclination and whose
//!   ascending crossing (or centre) is the slot's longitude; a QZO spends longer in the north;
//! * a GEO stays on its longitude;
//! * the satellites `gnss-sim` sees from a few cities, and their elevations, equal a computation
//!   made independently in this file (closed-form geosynchronous ground tracks and its own WGS 84
//!   station position), with no external tool.

use kshana::gnss_slots::{geosynchronous_radius_m, slot_orbit, slot_set, Slot};
use kshana::orbit::Orbit;
use serde_json::Value;

const DAY_S: f64 = 86_164.09;

fn slot(set: &str, id: &str) -> Slot {
    slot_set(set)
        .unwrap()
        .slot
        .into_iter()
        .find(|s| s.id == id)
        .unwrap_or_else(|| panic!("no slot {id} in {set}"))
}

/// Latitude and longitude (deg) of the slot's satellite at `t` s, through the engine's own
/// inertial-to-Earth-fixed rotation.
fn lat_lon(o: &Orbit, t: f64) -> (f64, f64) {
    let r = kshana::frames::teme_to_ecef(
        o.position_eci(t),
        kshana::walker::walker_epoch_jd() + t / 86_400.0,
    );
    (
        r[2].atan2((r[0] * r[0] + r[1] * r[1]).sqrt()).to_degrees(),
        r[1].atan2(r[0]).to_degrees(),
    )
}

fn wrap180(x: f64) -> f64 {
    (x + 180.0).rem_euclid(360.0) - 180.0
}

#[test]
fn an_igso_track_is_a_figure_eight_of_the_inclination_about_its_crossing_longitude() {
    let s = slot("navic", "IGSO 55E a");
    let o = slot_orbit(&s).unwrap();
    // A day and a half from a quarter day before the epoch: two ascending crossings and one
    // descending one, none on a sample.
    let track: Vec<(f64, f64)> = (0..=4321)
        .map(|k| lat_lon(&o, DAY_S * (k as f64 / 2880.0 - 0.25)))
        .collect();
    let max_lat = track.iter().map(|p| p.0).fold(f64::MIN, f64::max);
    let min_lat = track.iter().map(|p| p.0).fold(f64::MAX, f64::min);
    // Geocentric latitude extent of a circular orbit: exactly the inclination.
    assert!((max_lat - 29.0).abs() < 0.01, "{max_lat}");
    assert!((min_lat + 29.0).abs() < 0.01, "{min_lat}");
    // Every equator crossing (ascending and descending) is at 55°E: the eight's waist.
    let mut crossings = Vec::new();
    for w in track.windows(2) {
        if (w[0].0 < 0.0) != (w[1].0 < 0.0) {
            let f = w[0].0 / (w[0].0 - w[1].0);
            crossings.push(w[0].1 + f * wrap180(w[1].1 - w[0].1));
        }
    }
    assert!(crossings.len() >= 3, "{crossings:?}");
    for c in &crossings {
        assert!(wrap180(c - 55.0).abs() < 0.02, "{crossings:?}");
    }
    // The east-west half-width of the eight, independently: for a circular geosynchronous
    // orbit the longitude offset is atan2(cos i sin u, cos u) - u; its largest magnitude.
    let i = 29f64.to_radians();
    let half_width = (0..36_000)
        .map(|k| {
            let u = std::f64::consts::TAU * k as f64 / 36_000.0;
            wrap180(((i.cos() * u.sin()).atan2(u.cos()) - u).to_degrees()).abs()
        })
        .fold(0.0, f64::max);
    let east = track
        .iter()
        .map(|p| wrap180(p.1 - 55.0))
        .fold(f64::MIN, f64::max);
    let west = track
        .iter()
        .map(|p| wrap180(p.1 - 55.0))
        .fold(f64::MAX, f64::min);
    assert!((east - half_width).abs() < 0.02, "{east} vs {half_width}");
    assert!((west + half_width).abs() < 0.02, "{west} vs {half_width}");
}

#[test]
fn a_qzo_track_is_centred_on_its_longitude_and_dwells_in_the_north() {
    let s = slot("qzss-six-satellite", "QZS2 QZO");
    let o = slot_orbit(&s).unwrap();
    let track: Vec<(f64, f64)> = (0..2880)
        .map(|k| lat_lon(&o, DAY_S * k as f64 / 2880.0))
        .collect();
    let max_lat = track.iter().map(|p| p.0).fold(f64::MIN, f64::max);
    assert!((max_lat - 41.0).abs() < 0.02, "{max_lat}");
    // The centre longitude (mean over one revolution): 147°E in the six-satellite operation.
    let mut acc = track[0].1;
    let mut sum = 0.0;
    for k in 0..track.len() {
        if k > 0 {
            acc += wrap180(track[k].1 - track[k - 1].1);
        }
        sum += acc;
    }
    let centre = wrap180(sum / track.len() as f64);
    assert!((centre - 147.0).abs() < 0.02, "{centre}");
    // e = 0.075 with the apogee over the north (argument of perigee 270°): more than half the
    // day north of the equator. Kepler's equation gives the share, independently: the time from
    // true anomaly -90° to +90° about the apogee.
    let north = track.iter().filter(|p| p.0 > 0.0).count() as f64 / track.len() as f64;
    let e: f64 = 0.075;
    let ea = |nu: f64| 2.0 * (((1.0 - e) / (1.0 + e)).sqrt() * (nu / 2.0).tan()).atan();
    let m = |nu: f64| {
        let x = ea(nu);
        x - e * x.sin()
    };
    // From perigee (nu = 0) the southern half spans |nu| < 90°.
    let south_share = 2.0 * m(std::f64::consts::FRAC_PI_2) / std::f64::consts::TAU;
    assert!(
        (north - (1.0 - south_share)).abs() < 0.002,
        "{north} vs {}",
        1.0 - south_share
    );
    assert!(north > 0.54);
}

#[test]
fn a_geo_stays_on_its_longitude() {
    for (set, id, lon) in [
        ("qzss-six-satellite", "QZS3 GEO 127E", 127.0),
        ("navic", "GEO 32.5E", 32.5),
        ("beidou-geo", "BDS-3 GEO 140E", 140.0),
    ] {
        let o = slot_orbit(&slot(set, id)).unwrap();
        for k in 0..=96 {
            let (la, lo) = lat_lon(&o, 1800.0 * k as f64);
            assert!(la.abs() < 1e-9, "{id} lat {la}");
            assert!(wrap180(lo - lon).abs() < 1e-3, "{id} at {k}: {lo}");
        }
    }
}

/// WGS 84 geodetic to ECEF, written out here so the check does not use the engine's.
fn station_ecef(lat_deg: f64, lon_deg: f64, h: f64) -> ([f64; 3], [f64; 3]) {
    let (a, f) = (6_378_137.0, 1.0 / 298.257_223_563);
    let e2 = f * (2.0 - f);
    let (p, l) = (lat_deg.to_radians(), lon_deg.to_radians());
    let n = a / (1.0 - e2 * p.sin().powi(2)).sqrt();
    let r = [
        (n + h) * p.cos() * l.cos(),
        (n + h) * p.cos() * l.sin(),
        (n * (1.0 - e2) + h) * p.sin(),
    ];
    let up = [p.cos() * l.cos(), p.cos() * l.sin(), p.sin()];
    (r, up)
}

/// Closed-form Earth-fixed position of a circular geosynchronous slot at `t`: the satellite
/// crosses the equator northward at `crossing_deg` when its argument of latitude is a whole turn;
/// in the frame turning with the Earth at the orbital rate, its longitude is
/// `crossing + atan2(cos i sin u, cos u) - u`.
fn closed_form(crossing_deg: f64, inc_deg: f64, phase_deg: f64, t: f64) -> [f64; 3] {
    let n = std::f64::consts::TAU / DAY_S;
    let u = phase_deg.to_radians() + n * t;
    let i = inc_deg.to_radians();
    let lat = (i.sin() * u.sin()).asin();
    let lon = crossing_deg.to_radians() + (i.cos() * u.sin()).atan2(u.cos()) - u;
    let r = geosynchronous_radius_m();
    [
        r * lat.cos() * lon.cos(),
        r * lat.cos() * lon.sin(),
        r * lat.sin(),
    ]
}

fn elevation_deg(sat: [f64; 3], st: [f64; 3], up: [f64; 3]) -> f64 {
    let d = [sat[0] - st[0], sat[1] - st[1], sat[2] - st[2]];
    let norm = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
    ((d[0] * up[0] + d[1] * up[1] + d[2] * up[2]) / norm)
        .asin()
        .to_degrees()
}

fn run(set: &str, lat: f64, lon: f64) -> Value {
    let toml = format!(
        r#"
kind = "gnss-sim"
seed = 1
mask_deg = 10.0
slot_sets = ["{set}"]
[time]
step_s = 3600.0
duration_s = 86400.0
[receiver]
lat_deg = {lat}
lon_deg = {lon}
alt_m = 0.0
clock_bias_m = 0.0
[constellation]
altitude_km = 20200.0
inclination_deg = 55.0
planes = 0
sats_per_plane = 0
"#
    );
    let scn: kshana::gnss_sim::GnssSimScenario = toml::from_str(&toml).unwrap();
    serde_json::to_value(kshana::gnss_sim::run_gnss_sim(&scn).unwrap()).unwrap()
}

#[test]
fn visibility_from_cities_matches_an_independent_closed_form() {
    // (set, city, lat, lon). The NavIC and BeiDou GEO slots are circular, so every position has
    // a closed form.
    let cases = [
        ("navic", "New Delhi", 28.61, 77.21),
        ("navic", "Bengaluru", 12.97, 77.59),
        ("navic", "London", 51.51, -0.13),
        ("navic", "Tokyo", 35.68, 139.69),
        ("beidou-geo", "Beijing", 39.90, 116.40),
        ("beidou-geo", "Sydney", -33.87, 151.21),
    ];
    let mut compared = 0;
    for (set, city, lat, lon) in cases {
        let slots = slot_set(set).unwrap().slot;
        let r = run(set, lat, lon);
        assert_eq!(r["slots"].as_array().unwrap().len(), slots.len());
        let (st, up) = station_ecef(lat, lon, 0.0);
        for e in r["gnss_measurements"].as_array().unwrap() {
            let t = e["t"].as_f64().unwrap();
            let els: Vec<f64> = slots
                .iter()
                .map(|s| {
                    let sat = match s.crossing_lon_deg {
                        Some(c) => closed_form(c, s.inclination_deg, s.phase_deg, t),
                        None => closed_form(s.lon_deg.unwrap(), 0.0, 0.0, t),
                    };
                    elevation_deg(sat, st, up)
                })
                .collect();
            // Skip an epoch with a satellite within 0.1° of the mask, where a count may flip.
            if els.iter().any(|x| (x - 10.0).abs() < 0.1) {
                continue;
            }
            let want = els.iter().filter(|x| **x >= 10.0).count();
            assert_eq!(
                e["n_visible"].as_u64().unwrap() as usize,
                want,
                "{set} {city} t={t}"
            );
            for m in e["measurements"].as_array().unwrap() {
                let prn = m["prn"].as_u64().unwrap() as usize;
                let got = m["el_deg"].as_f64().unwrap();
                assert!(
                    (got - els[prn]).abs() < 0.05,
                    "{set} {city} t={t} prn {prn}: {got} vs {}",
                    els[prn]
                );
            }
            compared += 1;
        }
    }
    assert!(compared > 100, "{compared}");
    // A spot value, checked through the same closed form above: all seven NavIC satellites are
    // above 10° from New Delhi at the epoch.
    let delhi = run("navic", 28.61, 77.21);
    assert_eq!(delhi["gnss_measurements"][0]["n_visible"], 7);
}
