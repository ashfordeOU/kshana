// SPDX-License-Identifier: AGPL-3.0-only
//! Launch-window and ascent geometry against Orekit 12.2 (Apache-2.0).
//!
//! ORACLE (Library): Orekit 12.2 with Kshana's constants (mu = 3.986004418e14 m^3/s^2,
//! R_eq = 6378137 m) and a spherical Earth, the row's stated scope. The driver
//! `LaunchOrekitDriver.java` is fed the azimuths Kshana computes (dumped by the ignored
//! `dump_kshana_launch_azimuths` below); this test first requires today's Kshana azimuths to equal
//! the ones the fixture was generated from.
//!
//! CLAIM CHECKED: launch azimuths, minimum reachable inclination, circular velocity, Earth-rotation
//! eastward speed, dogleg plane-change dv and the daily-opportunity count. `launch.rs` emits no
//! opportunity times, so the plan's "opportunity times to 1 s" has nothing to compare; the count is
//! compared instead.
//!
//! TOLERANCES (fixed before the first comparison, 2026-10-01):
//! 1. Inclination Orekit's `KeplerianOrbit` reads back from a burnout state along Kshana's ascending
//!    and descending azimuth: within 1e-9 rad of the target.
//! 2. Minimum inclination over an Orekit azimuth sweep: never below `min_inclination(lat)` minus
//!    1e-12 rad, and equal to it within 1e-9 rad.
//! 3. Circular velocity: within 1e-12 relative of Orekit's circular `KeplerianOrbit` speed.
//! 4. Dogleg dv: within 1e-10 relative of `|v2 - v1|` between two Orekit circular orbits at a node.
//! 5. Earth-rotation speed: within 1e-6 relative of the GCRF speed of an Earth-fixed point (Orekit
//!    ITRF, IERS 2010, simple EOP, spherical body).
//! 6. Daily opportunities: equal to the number of Orekit-detected crossings of the rotating site
//!    through the orbit plane over one sidereal day (2 or 0); a tangent case (Kshana's 1) is
//!    accepted when Orekit's closest approach min |g| is at most 1e-6 and any detected crossings
//!    are one pair within 120 s.
//!
//! VERDICT (2026-10-01): DISAGREES on comparison 5 only. Comparisons 1, 2, 3, 4 and 6 agree
//! (worst inclination error 2.6e-15 rad over 158 azimuth cases), but the Earth-rotation speed
//! `omega R_eq cos(lat)` differs from Orekit's GCRF speed of the ITRF point by up to 1.12e-6
//! relative at 62.9 deg latitude, above the pre-registered 1e-6. The likely cause is the pole
//! offset of polar motion (about 1.5e-6 rad, amplified by tan(lat)) that the spherical rigid
//! rotation about the z axis omits; the tolerance did not allow for it. The claim was not narrowed
//! before the run, so the row stays MODELLED. The gated test below keeps comparisons 1 to 4 and 6;
//! comparison 5 is kept strict in an ignored test and its gap is pinned as a finding.
//!
//! ROUND 2 (2026-10-01): engine fix, re-run at the same tolerance. `launch::site_rotation_speed_at`
//! rotates the site about the true pole: the Celestial Intermediate Pole placed at (x_p, -y_p, 1)
//! in the terrestrial frame from IERS polar motion, at the rate Omega (1 - LOD / 86400 s). The strict
//! comparison 5 now calls it instead of `site_rotation_speed`, with the same epoch the driver used
//! (2026-03-01T00:00:00 UTC), the same longitude (0 deg) and latitudes, the same Orekit 12.2 values
//! (fixture unchanged) and the same 1e-6. Its EOP input is three rows copied verbatim from the
//! frozen IERS finals2000A.all of 2026-09-30 (`finals2000A_2026-02-28_to_03-02.txt`, provenance in
//! NOTICE.md). Disclosed: the changed call, and that a hand prototype of the same closed form was
//! evaluated against the fixture's ROT values before this test was edited (worst 1.27e-7).
//! `site_rotation_speed` (nominal rate about the z axis) is unchanged and its 1.12e-6 gap stays
//! pinned below as the finding it is.
//! Result: all seven latitudes within 1e-6; worst 1.27e-7 at 62.9 deg (the remainder grows as
//! tan(lat) and is consistent with the precession-nutation rate of the pole, which the function
//! leaves out). Mutation: placing the pole on the z axis again (x_p = y_p = 0) turns the strict
//! test red at 1.12e-6. The fixture's sites are all at longitude 0, so y_p enters only at second
//! order and its sign convention is not exercised by this comparison.
//!
//! Fixture, driver, generator and provenance: `tests/fixtures/launch_geometry_orekit_oracle/`.

use kshana::eop::EopSeries;
use kshana::launch::{
    circular_velocity, daily_launch_opportunities, launch_azimuth, min_inclination,
    plane_change_dv, site_rotation_speed, site_rotation_speed_at,
};
use kshana::timescales::{julian_date, utc_to_tt};

const REF: &str =
    include_str!("fixtures/launch_geometry_orekit_oracle/launch_geometry_orekit_oracle.txt");

const INC_TOL_RAD: f64 = 1e-9;
const MIN_INC_FLOOR_RAD: f64 = 1e-12;
const VCIRC_REL_TOL: f64 = 1e-12;
const DOGLEG_REL_TOL: f64 = 1e-10;
const ROT_REL_TOL: f64 = 1e-6;
const TANGENT_MIN_G: f64 = 1e-6;
const TANGENT_PAIR_S: f64 = 120.0;

const LATS: [f64; 9] = [-60.0, -28.5, -5.0, 0.0, 5.0, 28.5, 45.6, 51.6, 62.9];
const LONS: [f64; 2] = [0.0, 123.4];

/// The pre-registered inclination grid for a site latitude, reachable cases only.
fn grid() -> Vec<(f64, f64, f64, f64, f64)> {
    let mut out = Vec::new();
    for lat in LATS {
        let l = lat.abs();
        let incs = [
            l,
            l + 0.5,
            30.0,
            51.6,
            63.4,
            90.0,
            97.8,
            120.0,
            150.0,
            180.0 - l - 0.5,
        ];
        for lon in LONS {
            for i in incs {
                if let Ok((asc, desc)) = launch_azimuth(lat.to_radians(), i.to_radians()) {
                    out.push((lat, lon, i, asc, desc));
                }
            }
        }
    }
    out
}

/// Writes the driver's input: run by `gen_launch_geometry_orekit_oracle.sh`, never by the gate.
#[test]
#[ignore = "fixture generator step, run by gen_launch_geometry_orekit_oracle.sh"]
fn dump_kshana_launch_azimuths() {
    for (lat, lon, i, asc, desc) in grid() {
        println!("INCREQ {lat:?} {lon:?} {i:?} {asc:.17e} {desc:.17e}");
    }
}

fn fields(rest: &str) -> Vec<Vec<f64>> {
    rest.split('|')
        .map(|p| p.split_whitespace().map(|t| t.parse().unwrap()).collect())
        .collect()
}

fn rel(a: f64, b: f64) -> f64 {
    (a - b).abs() / b.abs()
}

#[test]
fn burnout_azimuth_reproduces_the_target_inclination_in_orekit() {
    let mut failures = Vec::new();
    let expected = grid();
    let (mut n_inc, mut n_min, mut n_v, mut n_dog, mut n_rot, mut n_opp) = (0, 0, 0, 0, 0, 0);
    let mut worst_inc = 0.0_f64;
    let (mut worst_min, mut worst_v, mut worst_dog) = (0.0_f64, 0.0_f64, 0.0_f64);
    for line in REF.lines() {
        let Some((tag, rest)) = line.split_once(' ') else {
            continue;
        };
        if tag.starts_with('#') {
            continue;
        }
        let f = fields(rest);
        match tag {
            "INC" => {
                let (lat, lon, i) = (f[0][0], f[0][1], f[0][2]);
                let (asc_fed, desc_fed) = (f[1][0], f[1][1]);
                let (asc, desc) = launch_azimuth(lat.to_radians(), i.to_radians()).unwrap();
                assert!(
                    (asc - asc_fed).abs() <= 1e-15 && (desc - desc_fed).abs() <= 1e-15,
                    "fixture azimuths for lat {lat} i {i} are not today's Kshana output: regenerate"
                );
                assert_eq!(
                    expected[n_inc].0.to_bits(),
                    lat.to_bits(),
                    "grid order changed: regenerate"
                );
                for (which, got) in [("asc", f[2][0]), ("desc", f[2][1])] {
                    let d = (got - i.to_radians()).abs();
                    worst_inc = worst_inc.max(d);
                    if d > INC_TOL_RAD {
                        failures.push(format!(
                            "INC lat {lat} lon {lon} i {i} {which}: Orekit i off by {d:e} rad"
                        ));
                    }
                }
                n_inc += 1;
            }
            "MININC" => {
                let lat = f[0][0];
                let want = min_inclination(lat.to_radians());
                let got = f[1][0];
                worst_min = worst_min.max((got - want).abs());
                if got < want - MIN_INC_FLOOR_RAD || (got - want).abs() > INC_TOL_RAD {
                    failures.push(format!(
                        "MININC lat {lat}: Orekit min {got:e} vs Kshana {want:e}"
                    ));
                }
                n_min += 1;
            }
            "VCIRC" => {
                let h_km = f[0][0];
                let r = rel(circular_velocity(h_km * 1e3), f[1][0]);
                worst_v = worst_v.max(r);
                if r > VCIRC_REL_TOL {
                    failures.push(format!("VCIRC h {h_km} km: rel {r:e}"));
                }
                n_v += 1;
            }
            "DOGLEG" => {
                let (lat, i, h_km) = (f[0][0], f[0][1], f[0][2]);
                let dv =
                    plane_change_dv(circular_velocity(h_km * 1e3), (lat - i).abs().to_radians());
                let r = rel(dv, f[1][0]);
                worst_dog = worst_dog.max(r);
                if r > DOGLEG_REL_TOL {
                    failures.push(format!("DOGLEG lat {lat} i {i}: rel {r:e}"));
                }
                n_dog += 1;
            }
            "ROT" => n_rot += 1, // comparison 5: see the two site-speed tests below
            "OPP" => {
                let (lat, i) = (f[0][0], f[0][1]);
                let events = f[1][0] as u32;
                let (min_g, spread) = (f[2][0], f[3][0]);
                let kshana = daily_launch_opportunities(lat.to_radians(), i.to_radians());
                let ok = match kshana {
                    1 => {
                        min_g <= TANGENT_MIN_G
                            && (events == 0 || (events == 2 && spread <= TANGENT_PAIR_S))
                    }
                    k => events == u32::from(k),
                };
                if !ok {
                    failures.push(format!(
                        "OPP lat {lat} i {i}: Kshana {kshana}, Orekit {events} events, min|g| {min_g:e}"
                    ));
                }
                n_opp += 1;
            }
            _ => panic!("unknown fixture tag {tag}"),
        }
    }
    assert_eq!(
        n_inc,
        expected.len(),
        "every grid case must be in the fixture"
    );
    assert!(n_min >= 18 && n_v == 5 && n_dog == 5 && n_rot == 7 && n_opp >= 40);
    eprintln!(
        "launch vs Orekit: {n_inc} azimuth cases (worst |di| {worst_inc:e} rad), {n_min} sweeps \
         (worst {worst_min:e} rad), {n_v} v_circ (worst rel {worst_v:e}), {n_dog} doglegs (worst \
         rel {worst_dog:e}), {n_rot} site speeds (separate tests), {n_opp} opportunity cases"
    );
    assert!(
        failures.is_empty(),
        "disagreements:\n{}",
        failures.join("\n")
    );
}

/// Comparison 5: (latitude deg, relative gap of `site_rotation_speed` to Orekit).
fn site_speed_gaps() -> Vec<(f64, f64)> {
    REF.lines()
        .filter_map(|l| l.strip_prefix("ROT "))
        .map(|rest| {
            let f = fields(rest);
            let lat = f[0][0];
            (lat, rel(site_rotation_speed(lat.to_radians()), f[1][0]))
        })
        .collect()
}

/// Comparison 5 with the true-pole site speed: (latitude deg, relative gap to Orekit), at the
/// driver's epoch 2026-03-01T00:00:00 UTC and longitude 0.
fn true_pole_site_speed_gaps() -> Vec<(f64, f64)> {
    let eop = EopSeries::from_finals2000a(include_str!(
        "fixtures/launch_geometry_orekit_oracle/finals2000A_2026-02-28_to_03-02.txt"
    ));
    assert_eq!(eop.len(), 3, "three verbatim IERS rows");
    let jd_tt = utc_to_tt(julian_date(2026, 3, 1, 0, 0, 0.0));
    REF.lines()
        .filter_map(|l| l.strip_prefix("ROT "))
        .map(|rest| {
            let f = fields(rest);
            let lat = f[0][0];
            let v = site_rotation_speed_at(lat.to_radians(), 0.0, jd_tt, &eop);
            (lat, rel(v, f[1][0]))
        })
        .collect()
}

#[test]
fn earth_rotation_speed_matches_orekit_site_velocity() {
    let gaps = true_pole_site_speed_gaps();
    assert_eq!(gaps.len(), 7);
    for (lat, r) in &gaps {
        eprintln!("true-pole site speed lat {lat}: rel gap to Orekit {r:e}");
    }
    let failures: Vec<String> = gaps
        .into_iter()
        .filter(|g| g.1 > ROT_REL_TOL)
        .map(|(lat, r)| format!("ROT lat {lat}: rel {r:e}"))
        .collect();
    assert!(
        failures.is_empty(),
        "disagreements:\n{}",
        failures.join("\n")
    );
}

/// The finding for the nominal `site_rotation_speed` (rotation about the terrestrial z axis at the
/// nominal rate), still pinned in the gate: at least one latitude misses the pre-registered 1e-6, and
/// every gap stays below 1e-5 (an envelope chosen after the comparison; a characterisation, never
/// a promotion basis).
#[test]
fn earth_rotation_speed_gap_is_recorded_as_a_finding() {
    let gaps = site_speed_gaps();
    assert_eq!(gaps.len(), 7);
    for (lat, r) in &gaps {
        eprintln!("site speed lat {lat}: rel gap to Orekit {r:e}");
        assert!(
            *r < 1e-5,
            "lat {lat}: gap {r:e} outside the characterisation envelope"
        );
    }
    assert!(
        gaps.iter().any(|g| g.1 > ROT_REL_TOL),
        "site speed now agrees within {ROT_REL_TOL:e}: the M018 record says DISAGREES and must be revisited"
    );
}
