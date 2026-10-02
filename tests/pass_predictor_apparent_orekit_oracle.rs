// SPDX-License-Identifier: AGPL-3.0-only
//! Ground-station pass prediction on the validated propagation and frame path, with
//! tropospheric refraction (ITU-R P.834-9, International Telecommunication Union
//! Radiocommunication Sector Recommendation P.834) and light time. New row, package D8.
//!
//! The existing VALIDATED row "Ground-station pass prediction (ground segment)" covers the
//! geometric rise/set scheduler `passes::predict_passes` on a Keplerian ephemeris and is not
//! changed. This file pre-registers a new comparison for a new method,
//! `passes::predict_passes_apparent`.
//!
//! ENGINE PATH UNDER TEST: a satellite given as SGP4 (Simplified General Perturbations 4) mean
//! elements with a two-part Julian date epoch (`sgp4::SgpOrbit`), propagated by `kshana::sgp4`
//! and carried TEME -> GCRS -> ITRS by `nutation::teme_to_gcrs` and `cio::gcrs_to_itrs`
//! (IAU 2006/2000A; no Earth orientation parameters: UT1 = UTC, zero polar motion). A station
//! on the WGS-84 ellipsoid. Options: refraction (the apparent elevation is the free-space
//! elevation plus the ITU-R P.834-9 equation (14) correction for the station height) and
//! light time (the station receives at `t` the signal the satellite emitted at `t - tau`,
//! `tau` solved by fixed-point iteration on the geocentric celestial positions; no aberration).
//! Rise and set (AOS, acquisition of signal; LOS, loss of signal) are solved by bracketing on a
//! sampling grid and refining the apparent elevation's crossing of the mask; the maximum
//! elevation and its time (TCA) by a bounded one-dimensional maximisation.
//!
//! QUANTITY: per pass, AOS, LOS (reception times, s from the window start), TCA and maximum
//! apparent elevation (deg), and the number of passes; at sample instants inside passes, the
//! apparent azimuth and elevation (deg).
//!
//! INPUTS (committed as `tests/fixtures/pass_predictor_apparent_orekit_oracle/cases.json`,
//! written by the generator from these fixed rules before the oracle is run): four element
//! sets, each circular or near-circular SGP4 mean elements with B* zero: (1) the bundled
//! `scenarios/passes.toml` orbit, 550 km, 97.6 deg; (2) 420 km, 51.6 deg, e = 0.0005;
//! (3) 780 km, 86.4 deg; (4) 1200 km, 87.9 deg, e = 0.001; each with a node and initial mean
//! anomaly from a fixed list. Five sea-level stations (height 0 m, where the ITU-R P.834 height
//! terms vanish): 52.2 N 0 E; 0 N 30 E; 78.2 N 15.4 E; 33.9 S 18.5 E; 64.8 N 147.5 W. Masks 0, 5
//! and 10 deg. A 24-hour window from 2026-01-01T00:00:00 UTC for element sets 1 and 3 and from
//! 2024-06-21T06:00:00 UTC for 2 and 4, each element set's epoch at its window start. Sample
//! instants for Q4: every 30 s inside every Q1 pass, from AOS rounded up.
//!
//! ORACLE (Library): Orekit 13.1.8 with Hipparchus 4.0.3 (Apache-2.0), run as a separate
//! program. The satellite an Orekit `TLE` from the same element set in double precision,
//! `TLEPropagator.selectExtrapolator`; the station a `TopocentricFrame` (for the detectors) and
//! a `GroundStation` (for the measurement model) on a WGS-84 `OneAxisEllipsoid` in
//! `FramesFactory.getITRF(IERSConventions.IERS_2010, true)` with no Earth orientation parameter
//! files loaded. Refraction: `ITURP834AtmosphericRefraction(0.0)`.
//! * Q1 (refraction and light time on, the `passes` scenario default): Orekit `AngularAzEl`
//!   theoretical evaluation (`estimateWithoutDerivatives`, which solves the downlink light
//!   time) with `AngularRadioRefractionModifier`; AOS and LOS are the roots of its apparent
//!   elevation minus the mask, solved by Hipparchus `BracketingNthOrderBrentSolver` on brackets
//!   of +/- 2 s around the Q2 events; the maximum by Hipparchus `BrentOptimizer` on +/- 30 s
//!   around Orekit's `ElevationExtremumDetector` event.
//! * Q2 (refraction on, light time off): `ElevationDetector.withConstantElevation(mask)
//!   .withRefraction(...)` with `EventsLogger`, max check 10 s, threshold 1e-6 s; maximum
//!   elevation from `ElevationExtremumDetector` with the refraction model applied to it.
//! * Q3 (both off): the same detectors without refraction.
//! * Q4 (both on): the apparent azimuth and elevation of the Q1 model at the sample instants.
//!
//! The P.834 coefficient of `h * theta0^2` in equation (14) reads 0.01380 in the
//! Recommendation and 0.011380 in Orekit 13.1.8's `ITURP834AtmosphericRefraction` (read in
//! Orekit's source before this pre-registration, when choosing the oracle calls). The term
//! vanishes at height 0, which is why every station of the strict comparison is at sea level;
//! the engine implements the Recommendation's printed value. A separate gated test will pin
//! the size of that difference for heights of 0.5 to 3 km as a disclosed oracle finding.
//!
//! TOLERANCE (fixed before the first comparison, 2026-10-02). Derivation: the engine's and
//! Orekit's Earth-fixed positions differ by the SGP4 floor (order 1 cm) plus the TEME-to-ITRF
//! convention difference (at most 10 milliarcseconds: 0.4 m at a LEO radius of 7 600 km),
//! which seen from the shortest slant range of these cases (about 400 km) is at most 1e-6 rad
//! (5.7e-5 deg) of direction; the elevation rate at a mask crossing of a non-grazing pass is
//! above 0.01 deg/s.
//! * Pass count identical, except that a pass whose maximum apparent elevation is within
//!   1e-3 deg of the mask (on either side's figure) may appear on one side only (a tie).
//! * Matched passes: AOS and LOS within 5 ms when the maximum elevation exceeds the mask by
//!   0.5 deg or more, within 0.5 s otherwise (grazing passes, where the crossing is flat);
//!   a crossing clamped to the window edge compares the clamped value; maximum elevation
//!   within 1e-3 deg; TCA within 0.5 s (the maximum is flat in time).
//! * Q4: apparent elevation within 1e-4 deg and the angle between the two apparent directions
//!   within 1e-4 deg at every sample instant.
//!
//! VERDICT (2026-10-02, first and only run): FINDING, no promotion. Q1 to Q3 HOLD: 1210
//! matched passes over the three quantity sets, no ties, no unmatched pass; worst AOS/LOS
//! 1.4e-3 s (grazing passes 2.6e-3 s), maximum elevation 1.9e-4 deg, TCA 1.4e-3 s. Q4 FAILS:
//! 327 of 8979 samples outside 1e-4 deg, worst apparent direction 3.2e-4 deg (elevation
//! 3.2e-4 deg). Diagnosis after the failure (`the_apparent_pass_finding_is_pinned`): the TEME
//! convention difference found under M131 (about 72 milliarcseconds between Orekit's TEME and
//! the engine's IAU 2006/2000A chain, 2 to 3 m at LEO radius) seen from short slant ranges;
//! the pre-registration's 10 milliarcsecond bound was wrong. The bar is not loosened.
//! Deliberate mutations turn the strict test red: light time ignored (9773 failures, crossings
//! off by up to 2.0e-2 s, Q4 by 1.7e-3 deg); the constant 1.728 of equation (14) changed to
//! 1.828 (8330 failures, crossings off by up to 5.3 s). Disclosed oracle finding: Orekit's
//! `h·θ0²` coefficient (0.011380 against the printed 0.01380) explains the whole gap between
//! the two refraction models above sea level to 4.8e-16 relative (up to 2.6e-3 deg at 3 km);
//! they are the same function at sea level (5.6e-17 deg). Pre-registration commit e947e69d.
//! Fixture, drivers and provenance: `tests/fixtures/pass_predictor_apparent_orekit_oracle/`.

use kshana::frames::Geodetic;
use kshana::jd2::Jd2;
use kshana::passes::{apparent_look_angles, predict_passes_apparent, ApparentOptions, Pass};
use kshana::sgp4::{wgs72, MeanElementSet, SgpOrbit};
use serde_json::Value;

const DIR: &str = "tests/fixtures/pass_predictor_apparent_orekit_oracle";
const DURATION_S: f64 = 86_400.0;
const STEP_S: f64 = 10.0;

const TIE_DEG: f64 = 1e-3;
const CROSSING_S: f64 = 5e-3;
const GRAZING_CROSSING_S: f64 = 0.5;
const GRAZING_MARGIN_DEG: f64 = 0.5;
const MAX_EL_DEG: f64 = 1e-3;
const TCA_S: f64 = 0.5;
const Q4_DEG: f64 = 1e-4;

/// One element set of the pre-registration: (altitude km, inclination deg, eccentricity,
/// node deg, argument of perigee deg, mean anomaly deg, window start).
struct Orbit {
    alt_km: f64,
    inc_deg: f64,
    e: f64,
    node_deg: f64,
    argp_deg: f64,
    m_deg: f64,
    start: [f64; 6],
}

fn orbits() -> Vec<Orbit> {
    let o = |alt_km, inc_deg, e, node_deg, argp_deg, m_deg, start| Orbit {
        alt_km,
        inc_deg,
        e,
        node_deg,
        argp_deg,
        m_deg,
        start,
    };
    let (jan, jun) = (
        [2026.0, 1.0, 1.0, 0.0, 0.0, 0.0],
        [2024.0, 6.0, 21.0, 6.0, 0.0, 0.0],
    );
    vec![
        // (1) the bundled scenarios/passes.toml orbit: node 0, argument of latitude 0.
        o(550.0, 97.6, 0.0, 0.0, 0.0, 0.0, jan),
        o(420.0, 51.6, 0.0005, 45.0, 90.0, 0.0, jun),
        o(780.0, 86.4, 0.0, 120.0, 0.0, 30.0, jan),
        o(1200.0, 87.9, 0.001, 250.0, 90.0, 200.0, jun),
    ]
}

const STATIONS: [(f64, f64); 5] = [
    (52.2, 0.0),
    (0.0, 30.0),
    (78.2, 15.4),
    (-33.9, 18.5),
    (64.8, -147.5),
];
const MASKS: [f64; 3] = [0.0, 5.0, 10.0];

fn start_of(o: &Orbit) -> Jd2 {
    let c = o.start;
    Jd2::from_utc_calendar(
        c[0] as i32,
        c[1] as u32,
        c[2] as u32,
        c[3] as u32,
        c[4] as u32,
        c[5],
    )
    .unwrap()
}

fn element_set(o: &Orbit) -> MeanElementSet {
    let g = wgs72();
    let a_er = (6_378_137.0 + o.alt_km * 1000.0) / 1000.0 / g.radiusearthkm;
    MeanElementSet {
        epoch_utc: start_of(o),
        no_kozai: g.xke / a_er.powf(1.5),
        ecco: o.e,
        inclo: o.inc_deg.to_radians(),
        nodeo: o.node_deg.to_radians(),
        argpo: o.argp_deg.to_radians(),
        mo: o.m_deg.to_radians(),
        bstar: 0.0,
    }
}

fn station(k: usize) -> Geodetic {
    Geodetic {
        lat_rad: STATIONS[k].0.to_radians(),
        lon_rad: STATIONS[k].1.to_radians(),
        alt_m: 0.0,
    }
}

/// One case: (orbit index, station index, mask).
fn cases() -> Vec<(usize, usize, f64)> {
    let mut out = Vec::new();
    for o in 0..4 {
        for s in 0..STATIONS.len() {
            for m in MASKS {
                out.push((o, s, m));
            }
        }
    }
    out
}

fn cases_json() -> String {
    let os = orbits();
    let list: Vec<Value> = cases()
        .iter()
        .map(|&(o, s, m)| {
            let set = element_set(&os[o]);
            serde_json::json!({
                "orbit": o,
                "start_utc": os[o].start,
                "epoch_jd": [set.epoch_utc.day, set.epoch_utc.frac],
                "no_kozai_rad_min": set.no_kozai,
                "ecco": set.ecco,
                "inclo_rad": set.inclo,
                "nodeo_rad": set.nodeo,
                "argpo_rad": set.argpo,
                "mo_rad": set.mo,
                "bstar": set.bstar,
                "station_lat_deg": STATIONS[s].0,
                "station_lon_deg": STATIONS[s].1,
                "station_height_m": 0.0,
                "mask_deg": m,
            })
        })
        .collect();
    serde_json::to_string_pretty(&serde_json::json!({
        "duration_s": DURATION_S,
        "q4_sample_step_s": 30.0,
        "cases": list,
    }))
    .unwrap()
        + "\n"
}

/// The same cases as one CSV line each, for the oracle driver.
fn cases_csv() -> String {
    let os = orbits();
    let mut out = String::from(
        "# case,year,month,day,hour,minute,second,no_kozai_rad_min,ecco,inclo_rad,nodeo_rad,argpo_rad,mo_rad,bstar,station_lat_deg,station_lon_deg,station_height_m,mask_deg\n",
    );
    for (ci, &(o, s, m)) in cases().iter().enumerate() {
        let set = element_set(&os[o]);
        let c = os[o].start;
        out += &format!(
            "{ci},{},{},{},{},{},{:?},{:?},{:?},{:?},{:?},{:?},{:?},{:?},{:?},{:?},0.0,{:?}\n",
            c[0],
            c[1],
            c[2],
            c[3],
            c[4],
            c[5],
            set.no_kozai,
            set.ecco,
            set.inclo,
            set.nodeo,
            set.argpo,
            set.mo,
            set.bstar,
            STATIONS[s].0,
            STATIONS[s].1,
            m
        );
    }
    out
}

/// Writes the comparison's inputs; run by `generate.sh`.
#[test]
#[ignore = "fixture generator: run by tests/fixtures/pass_predictor_apparent_orekit_oracle/generate.sh"]
fn write_the_fixture_inputs() {
    std::fs::create_dir_all(DIR).unwrap();
    std::fs::write(format!("{DIR}/cases.json"), cases_json()).unwrap();
    std::fs::write(format!("{DIR}/cases.csv"), cases_csv()).unwrap();
}

#[test]
fn the_committed_cases_are_the_pre_registered_ones() {
    let committed = std::fs::read_to_string(format!("{DIR}/cases.json")).unwrap();
    assert_eq!(cases_json(), committed);
    let committed_csv = std::fs::read_to_string(format!("{DIR}/cases.csv")).unwrap();
    assert_eq!(cases_csv(), committed_csv);
    assert_eq!(cases().len(), 60);
}

/// The oracle: per case and quantity the passes `[aos, tca, los, max_el_deg]`, and the Q4
/// samples `[t, az_rad, el_rad]`.
struct OracleCase {
    q: [Vec<[f64; 4]>; 3],
    q4: Vec<[f64; 3]>,
}

fn oracle() -> Vec<OracleCase> {
    let text = std::fs::read_to_string(format!("{DIR}/orekit.txt"))
        .unwrap_or_else(|e| panic!("{DIR}/orekit.txt: {e} (run generate.sh)"));
    let mut out: Vec<OracleCase> = (0..cases().len())
        .map(|_| OracleCase {
            q: [Vec::new(), Vec::new(), Vec::new()],
            q4: Vec::new(),
        })
        .collect();
    for line in text
        .lines()
        .filter(|l| !l.starts_with('#') && !l.is_empty())
    {
        let f: Vec<&str> = line.split_whitespace().collect();
        let case: usize = f[1].parse().unwrap();
        let x = |k: usize| -> f64 { f[k].parse().unwrap() };
        match f[0] {
            "P" => {
                let q: usize = f[2].parse().unwrap();
                out[case].q[q - 1].push([x(3), x(4), x(5), x(6)]);
            }
            "S" => out[case].q4.push([x(2), x(3), x(4)]),
            _ => panic!("unknown oracle line {line}"),
        }
    }
    out
}

fn options(q: usize) -> ApparentOptions {
    match q {
        1 => ApparentOptions {
            refraction: true,
            light_time: true,
            ..Default::default()
        },
        2 => ApparentOptions {
            refraction: true,
            light_time: false,
            ..Default::default()
        },
        _ => ApparentOptions {
            refraction: false,
            light_time: false,
            ..Default::default()
        },
    }
}

#[derive(Default)]
struct Worst {
    crossing_s: f64,
    grazing_crossing_s: f64,
    max_el_deg: f64,
    tca_s: f64,
    q4_el_deg: f64,
    q4_dir_deg: f64,
    q4_offset_m: f64,
    q4_fails: usize,
    passes: usize,
    ties: usize,
    samples: usize,
}

/// Every pre-registered comparison; returns the failures and the worst gaps.
fn compare() -> (Vec<String>, Worst) {
    let os = orbits();
    let oracle = oracle();
    let mut fails = Vec::new();
    let mut w = Worst::default();
    for (ci, &(o, s, mask)) in cases().iter().enumerate() {
        let sat = SgpOrbit::new(element_set(&os[o]));
        let start = start_of(&os[o]);
        for q in 1..=3 {
            let mine: Vec<Pass> = predict_passes_apparent(
                &sat,
                station(s),
                start,
                DURATION_S,
                mask,
                STEP_S,
                options(q),
            )
            .unwrap();
            let theirs = &oracle[ci].q[q - 1];
            // Pair passes by overlap; an unpaired pass must be a tie at the mask.
            let mut used = vec![false; theirs.len()];
            for p in &mine {
                let k = theirs.iter().position(|t| t[0] < p.los_s && p.aos_s < t[2]);
                match k {
                    None => {
                        if (p.max_elevation_deg - mask).abs() <= TIE_DEG {
                            w.ties += 1;
                        } else {
                            fails.push(format!("case {ci} Q{q}: engine pass {p:?} not in Orekit"));
                        }
                    }
                    Some(k) => {
                        used[k] = true;
                        w.passes += 1;
                        let t = theirs[k];
                        let grazing = t[3] - mask < GRAZING_MARGIN_DEG;
                        let bar = if grazing {
                            GRAZING_CROSSING_S
                        } else {
                            CROSSING_S
                        };
                        for (name, a, b) in [("AOS", p.aos_s, t[0]), ("LOS", p.los_s, t[2])] {
                            let d = (a - b).abs();
                            if grazing {
                                w.grazing_crossing_s = w.grazing_crossing_s.max(d);
                            } else {
                                w.crossing_s = w.crossing_s.max(d);
                            }
                            if d > bar {
                                fails.push(format!(
                                    "case {ci} Q{q}: {name} {a} vs Orekit {b} ({d:.3e} s)"
                                ));
                            }
                        }
                        let de = (p.max_elevation_deg - t[3]).abs();
                        w.max_el_deg = w.max_el_deg.max(de);
                        if de > MAX_EL_DEG {
                            fails.push(format!(
                                "case {ci} Q{q}: max el {} vs Orekit {} ({de:.3e} deg)",
                                p.max_elevation_deg, t[3]
                            ));
                        }
                        let dt = (p.tca_s - t[1]).abs();
                        w.tca_s = w.tca_s.max(dt);
                        if dt > TCA_S {
                            fails.push(format!(
                                "case {ci} Q{q}: TCA {} vs Orekit {} ({dt:.3e} s)",
                                p.tca_s, t[1]
                            ));
                        }
                    }
                }
            }
            for (k, t) in theirs.iter().enumerate() {
                if !used[k] {
                    if (t[3] - mask).abs() <= TIE_DEG {
                        w.ties += 1;
                    } else {
                        fails.push(format!(
                            "case {ci} Q{q}: Orekit pass {t:?} not in the engine"
                        ));
                    }
                }
            }
        }
        // Q4: apparent direction at the sample instants.
        for &[t, az, el] in &oracle[ci].q4 {
            let l = apparent_look_angles(&sat, station(s), start.add_seconds(t), options(1))
                .unwrap()
                .look;
            let de = (l.el_rad - el).to_degrees().abs();
            let u = |az: f64, el: f64| [el.cos() * az.sin(), el.cos() * az.cos(), el.sin()];
            let (a, b) = (u(l.az_rad, l.el_rad), u(az, el));
            let cross = [
                a[1] * b[2] - a[2] * b[1],
                a[2] * b[0] - a[0] * b[2],
                a[0] * b[1] - a[1] * b[0],
            ];
            let dot = a[0] * b[0] + a[1] * b[1] + a[2] * b[2];
            let ang = (cross[0] * cross[0] + cross[1] * cross[1] + cross[2] * cross[2])
                .sqrt()
                .atan2(dot)
                .to_degrees();
            w.q4_el_deg = w.q4_el_deg.max(de);
            w.q4_dir_deg = w.q4_dir_deg.max(ang);
            w.q4_offset_m = w.q4_offset_m.max(ang.to_radians() * l.range_m);
            w.samples += 1;
            if de > Q4_DEG || ang > Q4_DEG {
                w.q4_fails += 1;
                fails.push(format!(
                    "case {ci} Q4 t {t}: elevation off {de:.3e} deg, direction off {ang:.3e} deg"
                ));
            }
        }
    }
    (fails, w)
}

#[test]
#[ignore = "FINDING 2026-10-02: Q4 fails on 327 of 8979 samples (worst apparent direction 3.2e-4 deg against 1e-4 deg: Orekit's TEME is about 72 mas from the IAU 2006/2000A chain, 2 to 3 m at LEO, the M131 finding); Q1 to Q3 hold (1210 passes, crossings within 1.4 ms, max elevation 1.9e-4 deg). Pinned by the_apparent_pass_finding_is_pinned"]
fn apparent_passes_with_refraction_and_light_time_agree_with_orekit() {
    let (fails, w) = compare();
    println!(
        "{} matched passes, {} ties, {} Q4 samples; worst: crossing {:.3e} s (grazing {:.3e} s), max el {:.3e} deg, TCA {:.3e} s, Q4 elevation {:.3e} deg, Q4 direction {:.3e} deg",
        w.passes, w.ties, w.samples, w.crossing_s, w.grazing_crossing_s, w.max_el_deg, w.tca_s, w.q4_el_deg, w.q4_dir_deg
    );
    assert!(
        fails.is_empty(),
        "{} failures:\n{}",
        fails.len(),
        fails
            .iter()
            .take(40)
            .cloned()
            .collect::<Vec<_>>()
            .join("\n")
    );
}

/// The pre-registered comparison held every pass bar (Q1 to Q3: pass count, AOS, LOS, TCA,
/// maximum elevation, with refraction and light time on, refraction only, and neither) and
/// failed the apparent-direction bar of Q4 on a minority of samples. This pins what was
/// measured. Diagnosis (after the failure, not a pre-registered oracle): the Q4 misses are the
/// TEME convention difference measured under M131 (Orekit's TEME positions of these near-Earth
/// orbits match the engine's to micrometres, its TEME-to-ITRF rotation differs from the IAU
/// 2006/2000A chain by about 72 milliarcseconds, 2 to 3 m at LEO radius), which seen from slant
/// ranges under about 1 500 km exceeds 1e-4 deg; the transverse offset implied by every Q4
/// gap stays within 3 m.
#[test]
fn the_apparent_pass_finding_is_pinned() {
    let (fails, w) = compare();
    println!(
        "{} passes, {} Q4 samples, {} Q4 failures; worst Q4 direction {:.3e} deg, implied offset {:.3} m",
        w.passes, w.samples, w.q4_fails, w.q4_dir_deg, w.q4_offset_m
    );
    assert!(
        fails.iter().all(|f| f.contains(" Q4 t ")),
        "a pass-level failure: {:?}",
        fails.iter().find(|f| !f.contains(" Q4 t "))
    );
    assert_eq!((w.passes, w.ties, w.samples), (1210, 0, 8979));
    assert_eq!(w.q4_fails, 327);
    assert!((2e-4..4e-4).contains(&w.q4_dir_deg), "{}", w.q4_dir_deg);
    assert!(w.q4_offset_m < 3.0, "implied offset {} m", w.q4_offset_m);
}

/// Disclosed oracle finding, stated in the pre-registration: Orekit 13.1.8's
/// `ITURP834AtmosphericRefraction` uses 0.011380 for the `h·θ0²` coefficient of ITU-R P.834-9
/// equation (14), which the Recommendation prints as 0.01380; the engine uses the printed
/// value. At sea level the two refraction models are the same function; above it they differ
/// by exactly that coefficient, which this test pins (the reciprocal of each refraction differs
/// by `h·0.00242·θ0²`, `h` in km and `θ0` in degrees).
#[test]
fn orekit_p834_coefficient_differs_from_the_recommendation_above_sea_level() {
    use kshana::passes::p834_tau_s_deg;
    let text = std::fs::read_to_string(format!("{DIR}/orekit_refraction.txt")).unwrap();
    let (mut n, mut worst_sea, mut worst_coef, mut largest_gap) = (0, 0.0_f64, 0.0_f64, 0.0_f64);
    for line in text.lines().filter(|l| l.starts_with('R')) {
        let f: Vec<f64> = line
            .split_whitespace()
            .skip(1)
            .map(|x| x.parse().unwrap())
            .collect();
        let (h_km, theta0, orekit_deg) = (f[0] / 1000.0, f[1], f[2].to_degrees());
        let mine = p834_tau_s_deg(h_km, theta0);
        n += 1;
        if h_km == 0.0 {
            worst_sea = worst_sea.max((mine - orekit_deg).abs());
        } else {
            let gap = 1.0 / mine - 1.0 / orekit_deg;
            let expected = h_km * (0.013_80 - 0.011_380) * theta0 * theta0;
            worst_coef = worst_coef.max((gap - expected).abs() / (1.0 / mine));
            largest_gap = largest_gap.max((mine - orekit_deg).abs());
        }
    }
    println!(
        "{n} values; sea level worst {worst_sea:.2e} deg; above it, the coefficient explains the gap to {worst_coef:.2e} relative; largest refraction gap {largest_gap:.3e} deg"
    );
    assert_eq!(n, 40);
    assert!(worst_sea < 1e-12, "sea level {worst_sea}");
    assert!(worst_coef < 1e-12, "coefficient {worst_coef}");
    assert!(largest_gap > 1e-4, "the difference is real above sea level");
}
