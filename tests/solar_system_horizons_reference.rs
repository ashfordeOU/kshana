// SPDX-License-Identifier: AGPL-3.0-only
//! The analytic solar-system ephemeris against JPL Horizons.
//!
//! The oracle is JPL Horizons (DE441 for the planets; MAR099, JUP365 and SAT441 for the
//! moons): geometric state vectors committed under `tests/fixtures/solar_system/`, each file
//! recording its exact query, the ephemeris behind it and the retrieval date.
//!
//! What is checked, and against what bar:
//!
//! * **Planets, Standish Table 1 (1800 AD to 2050 AD)**, Mercury to Saturn and the Earth-Moon
//!   barycentre, at 12 epochs: the error in heliocentric ecliptic longitude, latitude and
//!   distance stays within **twice** the nominal error the JPL page states for each planet.
//!   The factor two was set after the first comparison: the page's figures are *nominal*, not
//!   maxima, and the observed worst case is 1.87 times nominal (Saturn's distance in 2020).
//! * **Planets, Standish Tables 2a/2b (3000 BC to 3000 AD)**, Mercury to Neptune, at 15
//!   epochs from about 1000 BC to 2500 AD: within twice the Table 2a nominal error; observed
//!   worst 1.71 times nominal (Mars' distance).
//! * **Uranus and Neptune from Table 1 do not meet the page's figures** against DE441, by up
//!   to 2.0 and 5.2 times; that is pinned here so it cannot be hidden, and those two series
//!   are labelled MODELLED.
//! * **Light time** Earth to Mars and Jupiter: the one-way light time from
//!   `solar_system::link` (`radiometric::light_time_solution`, heliocentric) against the Horizons
//!   light-time-corrected `LT`, within the Standish position bound divided by `c`.
//! * The Earth, the geocentric Moon, the velocities, Pluto and the seven moons are measured
//!   against Horizons with bars stated in each test. They have no published error bound, so
//!   they are MODELLED; the bars keep the numbers honest, they do not validate.

use kshana::body::Body;
use kshana::ephem::{
    icrf_to_ecliptic, satellite_state, standish_nominal_error, standish_state, Planet, Satellite,
    StandishTable,
};
use kshana::ephem_provider::AnalyticSolarSystem;
use kshana::solar_system::link;

const ARCSEC_PER_RAD: f64 = 206_264.806_247_096_36;
const C_M_S: f64 = 299_792_458.0;

fn rows(file: &str) -> Vec<Vec<String>> {
    let path = format!(
        "{}/tests/fixtures/solar_system/{file}",
        env!("CARGO_MANIFEST_DIR")
    );
    std::fs::read_to_string(&path)
        .unwrap_or_else(|e| panic!("read {path}: {e}"))
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| l.split(',').map(|s| s.trim().to_string()).collect())
        .collect()
}

fn f(s: &str) -> f64 {
    s.parse().unwrap_or_else(|_| panic!("not a number: {s}"))
}

fn norm(v: [f64; 3]) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

fn sub(a: [f64; 3], b: [f64; 3]) -> [f64; 3] {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}

/// Longitude, latitude (arcsec) and distance (m) differences, model minus oracle.
fn lbr_error(model: [f64; 3], oracle: [f64; 3]) -> [f64; 3] {
    let sph = |p: [f64; 3]| {
        let r = norm(p);
        (p[1].atan2(p[0]), (p[2] / r).asin(), r)
    };
    let (lm, bm, rm) = sph(model);
    let (lo, bo, ro) = sph(oracle);
    let pi = std::f64::consts::PI;
    let dl = (lm - lo + pi).rem_euclid(2.0 * pi) - pi;
    [dl * ARCSEC_PER_RAD, (bm - bo) * ARCSEC_PER_RAD, rm - ro]
}

fn planet_of(id: &str) -> Option<Planet> {
    Some(match id {
        "1" => Planet::Mercury,
        "2" => Planet::Venus,
        "3" => Planet::EarthMoonBarycentre,
        "4" => Planet::Mars,
        "5" => Planet::Jupiter,
        "6" => Planet::Saturn,
        "7" => Planet::Uranus,
        "8" => Planet::Neptune,
        "9" => Planet::Pluto,
        _ => return None,
    })
}

struct Sample {
    planet: Planet,
    jd: f64,
    pos_m: [f64; 3],
    vel_m_s: [f64; 3],
}

fn heliocentric() -> Vec<Sample> {
    rows("horizons_heliocentric_ecliptic.csv")
        .into_iter()
        .filter_map(|r| {
            let planet = planet_of(&r[0])?;
            Some(Sample {
                planet,
                jd: f(&r[2]),
                pos_m: [f(&r[3]) * 1e3, f(&r[4]) * 1e3, f(&r[5]) * 1e3],
                vel_m_s: [f(&r[6]) * 1e3, f(&r[7]) * 1e3, f(&r[8]) * 1e3],
            })
        })
        .collect()
}

fn t_jc(jd: f64) -> f64 {
    (jd - 2_451_545.0) / 36_525.0
}

/// The worst ratio of |error| to nominal over the samples, per component, and the samples
/// taken, for one planet and table.
fn worst_ratio(
    planet: Planet,
    table: StandishTable,
    window: Option<(f64, f64)>,
) -> ([f64; 3], usize) {
    let nominal = standish_nominal_error(planet, table).expect("nominal error for this planet");
    let mut worst = [0.0_f64; 3];
    let mut n = 0;
    for s in heliocentric().iter().filter(|s| s.planet == planet) {
        let t = t_jc(s.jd);
        if let Some((lo, hi)) = window {
            if !(lo..=hi).contains(&t) {
                continue;
            }
        }
        let m = standish_state(planet, t, table).expect("state");
        let e = lbr_error(m.pos_m, s.pos_m);
        for k in 0..3 {
            worst[k] = worst[k].max(e[k].abs() / nominal[k]);
        }
        n += 1;
    }
    (worst, n)
}

const TABLE1_WINDOW: Option<(f64, f64)> = Some((-2.0, 0.5));

#[test]
fn standish_table1_mercury_to_saturn_within_twice_the_nominal_error() {
    for planet in [
        Planet::Mercury,
        Planet::Venus,
        Planet::EarthMoonBarycentre,
        Planet::Mars,
        Planet::Jupiter,
        Planet::Saturn,
    ] {
        let (w, n) = worst_ratio(planet, StandishTable::Table1, TABLE1_WINDOW);
        assert_eq!(n, 12, "{planet:?}: twelve epochs inside 1800 AD to 2050 AD");
        println!(
            "Table 1 {:<24} worst/nominal: longitude {:.2}, latitude {:.2}, distance {:.2}",
            planet.name(),
            w[0],
            w[1],
            w[2]
        );
        for (k, what) in ["longitude", "latitude", "distance"].iter().enumerate() {
            assert!(
                w[k] <= 2.0,
                "{planet:?} Table 1 {what} error is {:.2} times the nominal figure (bar 2)",
                w[k]
            );
        }
    }
}

#[test]
fn standish_table2_all_eight_planets_within_twice_the_nominal_error() {
    for planet in &Planet::ALL[..8] {
        let (w, n) = worst_ratio(*planet, StandishTable::Table2, None);
        assert_eq!(
            n, 15,
            "{planet:?}: fifteen epochs from about 1000 BC to 2500 AD"
        );
        println!(
            "Table 2 {:<24} worst/nominal: longitude {:.2}, latitude {:.2}, distance {:.2}",
            planet.name(),
            w[0],
            w[1],
            w[2]
        );
        for (k, what) in ["longitude", "latitude", "distance"].iter().enumerate() {
            assert!(
                w[k] <= 2.0,
                "{planet:?} Table 2 {what} error is {:.2} times the nominal figure (bar 2)",
                w[k]
            );
        }
    }
}

/// The honest limitation, pinned: Table 1's stated figures for Uranus and Neptune are not met
/// against DE441 heliocentric positions. If an edit ever makes these pass the bar, the matrix
/// row that calls them MODELLED must be revisited.
#[test]
fn standish_table1_uranus_and_neptune_exceed_the_nominal_error() {
    let (u, _) = worst_ratio(Planet::Uranus, StandishTable::Table1, TABLE1_WINDOW);
    let (n, _) = worst_ratio(Planet::Neptune, StandishTable::Table1, TABLE1_WINDOW);
    println!("Table 1 Uranus worst/nominal {u:.2?}; Neptune {n:.2?}");
    assert!(u[0] > 2.0, "Uranus longitude {:.2} x nominal", u[0]);
    assert!(n[0] > 2.0 && n[2] > 2.0, "Neptune {n:?} x nominal");
    // Still bounded: within six times nominal, so the series is usable for geometry.
    assert!(
        u.iter().chain(n.iter()).all(|r| *r < 6.0),
        "Uranus {u:?} Neptune {n:?}"
    );
}

/// Velocities have no published bound. The two-body derivative is checked at every Table 1
/// epoch: the vector error is below 1 % of the speed for every planet.
#[test]
fn standish_velocities_track_horizons_to_one_percent() {
    let mut worst: f64 = 0.0;
    for s in heliocentric() {
        let t = t_jc(s.jd);
        if !(-2.0..=0.5).contains(&t) {
            continue;
        }
        let m = standish_state(s.planet, t, StandishTable::Table1).expect("state");
        let rel = norm(sub(m.vel_m_s, s.vel_m_s)) / norm(s.vel_m_s);
        worst = worst.max(rel);
        assert!(
            rel < 0.01,
            "{:?} at JD {}: velocity error {:.4} of speed",
            s.planet,
            s.jd,
            rel
        );
    }
    println!("worst relative velocity error (Table 1 interval): {worst:.2e}");
}

/// Pluto has no stated error on the current page. Measured: within 45 arcsec in longitude and
/// latitude and 1.5e9 m in distance over 1800 AD to 2050 AD, heliocentric.
#[test]
fn pluto_from_the_1992_row_is_measured_not_validated() {
    let mut worst = [0.0_f64; 3];
    for s in heliocentric().iter().filter(|s| s.planet == Planet::Pluto) {
        let t = t_jc(s.jd);
        if !(-2.0..=0.5).contains(&t) {
            continue;
        }
        let m = standish_state(Planet::Pluto, t, StandishTable::Table1).expect("state");
        let e = lbr_error(m.pos_m, s.pos_m);
        for k in 0..3 {
            worst[k] = worst[k].max(e[k].abs());
        }
    }
    println!(
        "Pluto worst |dl| {:.1}\", |db| {:.1}\", |dr| {:.3e} m",
        worst[0], worst[1], worst[2]
    );
    assert!(
        worst[0] < 45.0 && worst[1] < 45.0 && worst[2] < 1.5e9,
        "{worst:?}"
    );
    assert!(standish_nominal_error(Planet::Pluto, StandishTable::Table1).is_none());
}

/// The Earth itself (not the barycentre), composed from the barycentre and the lunar series:
/// within the barycentre's bar (twice nominal) plus the lunar series' contribution, which the
/// mass ratio scales to a few kilometres.
#[test]
fn earth_from_the_barycentre_and_the_moon() {
    let eph = AnalyticSolarSystem::default();
    let nominal = standish_nominal_error(Planet::EarthMoonBarycentre, StandishTable::Table1)
        .expect("nominal");
    let mut n = 0;
    for r in rows("horizons_heliocentric_ecliptic.csv")
        .into_iter()
        .filter(|r| r[0] == "399")
    {
        let jd = f(&r[2]);
        if !(-2.0..=0.5).contains(&t_jc(jd)) {
            continue;
        }
        let oracle = [f(&r[3]) * 1e3, f(&r[4]) * 1e3, f(&r[5]) * 1e3];
        let (p, _) = eph.heliocentric_state("Earth", jd).expect("Earth");
        let e = lbr_error(icrf_to_ecliptic(p), oracle);
        assert!(
            e[0].abs() <= 2.0 * nominal[0] && e[1].abs() <= 2.0 * nominal[1] + 2.0,
            "Earth at JD {jd}: {e:?}"
        );
        assert!(e[2].abs() <= 2.0 * nominal[2], "Earth at JD {jd}: {e:?}");
        n += 1;
    }
    assert_eq!(n, 12);
}

struct SatSample {
    id: String,
    jd: f64,
    pos_m: [f64; 3],
}

fn satellites() -> Vec<SatSample> {
    rows("horizons_satellites_icrf.csv")
        .into_iter()
        .map(|r| SatSample {
            id: r[0].clone(),
            jd: f(&r[2]),
            pos_m: [f(&r[3]) * 1e3, f(&r[4]) * 1e3, f(&r[5]) * 1e3],
        })
        .collect()
}

/// The seven moons, planetocentric, at J2000 and at six epochs over 2010 to 2040. No published
/// bound exists; the measured angular errors are pinned per moon (degrees of arc seen from the
/// planet), so a regression in the model shows here.
#[test]
fn moons_track_horizons_to_the_measured_angles() {
    let bars = [
        ("401", Satellite::Phobos, 7.0),
        ("402", Satellite::Deimos, 1.0),
        ("501", Satellite::Io, 1.0),
        ("502", Satellite::Europa, 2.5),
        ("503", Satellite::Ganymede, 1.0),
        ("504", Satellite::Callisto, 1.0),
        ("606", Satellite::Titan, 4.0),
    ];
    for (id, sat, bar_deg) in bars {
        let mut worst: f64 = 0.0;
        let mut n = 0;
        for s in satellites().iter().filter(|s| s.id == id) {
            let m = satellite_state(sat, s.jd).pos_m;
            let ang = (norm(sub(m, s.pos_m)) / norm(s.pos_m)).to_degrees();
            worst = worst.max(ang);
            n += 1;
        }
        println!("{:<9} worst {:.2} deg (bar {bar_deg})", sat.name(), worst);
        assert_eq!(n, 7, "{id}");
        assert!(worst <= bar_deg, "{sat:?}: {worst:.2} deg > {bar_deg}");
    }
}

/// The geocentric Moon from the Montenbruck & Gill series, which is referred to the J2000
/// equinox by its own precession term. Measured worst 0.046 degrees over the seven epochs.
#[test]
fn geocentric_moon_tracks_horizons() {
    let mut worst: f64 = 0.0;
    for s in satellites().iter().filter(|s| s.id == "301") {
        let m = kshana::ephem::moon_icrf(s.jd);
        let ang = (norm(sub(m, s.pos_m)) / norm(s.pos_m)).to_degrees();
        worst = worst.max(ang);
    }
    println!("Moon worst {worst:.3} deg");
    assert!(worst < 0.1, "Moon {worst:.3} deg");
}

/// One-way light time from Mars and Jupiter to the Earth's centre, through
/// `solar_system::link`, the path the `solar-system` and `body-pnt` kinds ship: the existing
/// radiometric light-time solver in the heliocentric frame (the Sun as centre, the Earth's
/// heliocentric position as the receiver), against the Horizons `LT`. The solver treats its
/// centre as inertial, so the Earth must not be the centre: an Earth-centred solve moves the
/// receiver with the Earth over the light time, about 0.08 s at Mars. Bar: twice the Standish
/// distance bounds of the target and the barycentre, over `c`.
#[test]
fn light_time_matches_horizons_within_the_position_bound() {
    let eph = AnalyticSolarSystem::default();
    for r in rows("horizons_light_time.csv") {
        let (body, planet) = match r[0].as_str() {
            "499" => (Body::mars(), Planet::Mars),
            "599" => (Body::jupiter(), Planet::Jupiter),
            _ => continue,
        };
        let jd = f(&r[2]);
        let lt_oracle = f(&r[7]);
        let range_m = f(&r[8]) * 1e3;
        let lt = link(&eph, &body, &Body::earth(), jd).expect("light time");
        let n_t = standish_nominal_error(planet, StandishTable::Table1).expect("nominal");
        let n_e = standish_nominal_error(Planet::EarthMoonBarycentre, StandishTable::Table1)
            .expect("nominal");
        let bound_m = 2.0 * (n_t[2] + n_e[2]);
        let bar_s = bound_m / C_M_S;
        let err = lt.one_way_light_time_s - lt_oracle;
        println!(
            "{} at JD {jd}: light time {:.3} s vs Horizons {:.3} s, error {:+.3} s (bar {:.3} s), range {:.4e} m",
            body.name, lt.one_way_light_time_s, lt_oracle, err, bar_s, range_m
        );
        assert!(
            err.abs() <= bar_s,
            "{} at {jd}: {err} s > {bar_s} s",
            body.name
        );
    }
}
