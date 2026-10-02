// SPDX-License-Identifier: AGPL-3.0-only
//! Apparent ground-station pass prediction with ITU-R P.834-9 refraction and light time: leg 3
//! of the three-leg oracle, the geometry on the validated path. Package D8.
//!
//! Re-design disclosed: made after the round-1 comparison
//! (`pass_predictor_apparent_orekit_oracle.rs`) held every pass bar but missed the sampled
//! direction bar through Orekit's TEME convention. Legs 1 and 2
//! (`earth_orbit_path_sgp4_erfa_oracle.rs`) check propagation and frames against the reference
//! SGP4 and SOFA. In this leg Orekit propagates the same element sets with `TLEPropagator`
//! (all four orbits are near-Earth SGP4, where Orekit and the reference agree) but in a TEME
//! frame Orekit builds itself to the definition the engine states: a child of Orekit's
//! `FramesFactory.getTOD(IERSConventions.IERS_2010, true)` rotated by Orekit's IERS 2010
//! equation of the equinoxes (`IERSConventions.IERS_2010.getEquationOfEquinoxesFunction`), so
//! the convention is fixed and every rotation is Orekit's.
//!
//! QUANTITY, INPUTS, CASES: exactly those of the round-1 file (60 cases: four element sets, five
//! sea-level stations, masks 0, 5 and 10 deg, 24 hours; Q1 refraction and light time, Q2
//! refraction, Q3 neither, Q4 apparent azimuth and elevation every 30 s inside the Q1 passes),
//! read from `tests/fixtures/pass_predictor_apparent_orekit_oracle/cases.csv`.
//!
//! ORACLE (Library): Orekit 13.1.8 with Hipparchus 4.0.3 (Apache-2.0); the round-1 driver with
//! the TEME frame replaced as above; no Earth orientation parameters loaded.
//!
//! TOLERANCE (the round-1 bars, unchanged, fixed 2026-10-02 in e947e69d): pass counts identical
//! except ties within 1e-3 deg of the mask; AOS and LOS within 5 ms (0.5 s for grazing passes
//! whose maximum is under 0.5 deg above the mask); maximum elevation within 1e-3 deg; TCA
//! within 0.5 s; Q4 apparent elevation and direction within 1e-4 deg. Their derivation now
//! holds: the frames differ by the IAU 2000B/2000A nutation difference (under 1 mas, 0.04 m
//! at LEO radius, 1e-7 rad from 400 km).
//!
//! VERDICT (2026-10-02, first and only run): AGREES at the pre-registered tolerances. 1210
//! matched passes over Q1 to Q3, no tie, no unmatched pass; worst AOS/LOS 3.4e-6 s (grazing
//! passes 4.8e-6 s), maximum elevation 5.5e-7 deg, TCA 1.2e-3 s; Q4 over 8979 samples: apparent
//! elevation 8.6e-7 deg, direction 8.8e-7 deg. Deliberate mutations turn this test red: light
//! time ignored (9777 failures, crossings off by 1.8e-2 s, Q4 by 1.5e-3 deg); the constant
//! 1.728 of P.834 equation (14) changed to 1.828 (7883 failures, crossings off by 5.3 s). With
//! legs 1 and 2 (`earth_orbit_path_sgp4_erfa_oracle.rs`) this validates the apparent pass
//! predictor on the validated path at sea-level stations. Pre-registration commit 72ea9eb0.
//! Fixture: `tests/fixtures/pass_predictor_on_path_orekit_oracle/`.

use kshana::frames::Geodetic;
use kshana::jd2::Jd2;
use kshana::passes::{apparent_look_angles, predict_passes_apparent, ApparentOptions, Pass};
use kshana::sgp4::{wgs72, MeanElementSet, SgpOrbit};
use serde_json::Value;

const DIR: &str = "tests/fixtures/pass_predictor_on_path_orekit_oracle";
const ROUND1: &str = "tests/fixtures/pass_predictor_apparent_orekit_oracle";
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
fn the_cases_are_round_1s_pre_registered_ones() {
    let committed = std::fs::read_to_string(format!("{ROUND1}/cases.json")).unwrap();
    assert_eq!(cases_json(), committed);
    let committed_csv = std::fs::read_to_string(format!("{ROUND1}/cases.csv")).unwrap();
    assert_eq!(cases_csv(), committed_csv);
    assert_eq!(cases().len(), 60);
}

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
fn apparent_passes_on_the_validated_path_agree_with_orekit() {
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
