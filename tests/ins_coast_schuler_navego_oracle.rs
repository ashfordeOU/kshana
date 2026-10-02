// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle test for the matrix row "INS/TRN coasting error growth & threshold
//! crossings", round-2 amendment: each per-term error of `inertial::coast::CoastModel`,
//! now propagated through a nine-state local-level inertial error model with Schuler
//! feedback, against the free-inertial position error NaveGo's strapdown mechanization
//! produces from that error source alone.
//!
//! # Pre-registration (amendment, fixed 2026-10-02 before the corrected oracle was run)
//!
//! Why an amendment and not a re-run: the round-1 comparison
//! (`tests/ins_coast_navego_montecarlo_oracle.rs`) disagreed beyond 600 s because the
//! engine's laws were flat-Earth monomials. It also showed two oracle anomalies: the
//! moving scale-factor runs (T3, T4) followed the flat law to within 1.5 % at one hour
//! with no Schuler bounding, and the velocity-random-walk (VRW) run sat 41 % above a
//! single-channel Schuler prediction at 3600 s while the stationary bias runs matched
//! theirs. Cause, found by reading the oracle's code: NaveGo's `ins/qua_update.m` leaves
//! the attitude unchanged whenever the body-to-navigation rate is below 1e-8 rad/s. For a
//! level, north-locked body that rate is the velocity error over the Earth radius, which
//! is 1e-10 to 1e-8 rad/s in T3, T4 and T5, so their attitude froze and the Schuler
//! feedback was cut; T1, T2 and T6 exceed the guard almost at once. The oracle's inputs
//! therefore change (one guard in one NaveGo function), so this is a new comparison with
//! a new fixture; the round-1 test and fixture stay as the record of round 1.
//!
//! * **Quantity.** For each of six error terms, the free-inertial horizontal position
//!   error after a coast of t seconds produced by that term alone.
//! * **Oracle (Library).** NaveGo v1.4 (tag `v1.4`, commit 24d9488,
//!   <https://github.com/rodralez/NaveGo>, GNU LGPL-3.0), run as a tool under GNU Octave
//!   8.4.0: `att_update` (quaternion), `vel_update`, `pos_update`, `earth_rate`,
//!   `transport_rate`, `gravity`, `radius`, `coriolis`, and `imu_si_errors` for the unit
//!   conversion. No aiding. The single change: the generator reads NaveGo's own
//!   `qua_update.m`, replaces `if wnorm < 1.E-8` by `if wnorm == 0` (asserted to match
//!   exactly once) and puts that copy first on the path. Generator:
//!   `tests/fixtures/ins_coast_schuler_navego_oracle/gen_ins_coast_schuler_navego.m`
//!   (committed with this pre-registration); its output will be committed as
//!   `navego_schuler_coast_errors.csv`.
//! * **IMU profile, platform, terms, statistic, durations, seeds.** Exactly those of the
//!   round-1 pre-registration: `ImuGrade::Tactical` in datasheet units; 45 deg N,
//!   longitude 0, 1000 m, level, heading north, 10 Hz, exact initial state; T1
//!   accelerometer bias and T2 gyro bias on the x (north) axis, stationary, one
//!   deterministic run each; T3 scale factor, 10 m/s^2 for 1 s from rest then 10 m/s
//!   north; T4 scale factor, sustained 0.01 m/s^2 north from rest; T5 VRW and T6 angle
//!   random walk (ARW), stationary, white noise on the x and y sensors, 300 seeds
//!   (Octave `randn("seed", k)`, k = 1..300). Run minus the error-free run. T1-T4:
//!   horizontal magnitude `sqrt(dN^2 + dE^2)`. T5, T6: per-axis root mean square (RMS)
//!   `sqrt(mean over seeds of (dN^2 + dE^2) / 2)`. Durations 30, 60, 120, 300, 600, 1200,
//!   1800, 3600 s.
//! * **Kshana side.** `CoastModel::new(ImuGrade::Tactical.params().si(), v, a,
//!   Combination::Rss, 0.0).with_site(45.0, 1000.0)` with (v, a) = (0, 0) for T1, T2, T5,
//!   T6, (10, 0) for T3 and (0, 0.01) for T4; the value compared is
//!   `Contribution::error_m(t)` of the term's contribution. That value comes from the
//!   nine-state local-navigation-frame error model of Groves, *Principles of GNSS,
//!   Inertial, and Multisensor Integrated Navigation Systems*, 2nd ed., 2013, chapter 14
//!   (attitude, velocity and position errors, including the vertical channel with the
//!   gravity gradient 2 g0 / r_eS), linearised about a level platform heading north at the
//!   configured speed, latitude held at the site value, WGS-84 radii and normal gravity,
//!   Earth rate 7.292115e-5 rad/s. Biases and the scale-factor forcing act on the body x
//!   (north) axis, the random walks on x and y; deterministic terms report the horizontal
//!   magnitude, random walks `sqrt((P_NN + P_EE) / 2)` from the propagated covariance. The
//!   model has no fitted parameter.
//! * **Tolerance (unchanged from round 1).** `|NaveGo - Kshana| <= 0.05 x NaveGo` at every
//!   duration for every term (48 comparisons); the row agrees only if all 48 hold. With
//!   600 one-axis samples the relative sampling standard deviation of a stochastic RMS is
//!   about 2.9 %, so the bar on T5 and T6 is about 1.7 sigma of the oracle's own sampling
//!   error; it is kept as written.
//!
//! # Disclosures, stated before the corrected oracle was run
//!
//! * A diagnostic script written during the round-2 research
//!   (`scratch/research-c/schuler.py`, outside the repository) computed single-channel
//!   Schuler laws against the round-1 NaveGo values; its predictions (including the
//!   -41 % VRW gap at 3600 s) were seen before this amendment was written.
//! * Before writing this amendment the round-1 generator (dead band still in place) was
//!   run once more for T1, T3 and T4 at 15 durations to look at the time histories; T3 and
//!   T4 again grew without bound. Those runs carry no information about the corrected
//!   oracle.
//! * The round-1 NaveGo values for T1, T2 and T6, which the dead band barely touches, were
//!   seen in round 1. The engine model below is the textbook error model with no fitted
//!   parameter, so it cannot be tuned to them.

use kshana::inertial::coast::{CoastModel, Combination, ImuGrade};
use std::collections::BTreeMap;
use std::path::PathBuf;

const TOL: f64 = 0.05;
const DURATIONS: [f64; 8] = [30.0, 60.0, 120.0, 300.0, 600.0, 1200.0, 1800.0, 3600.0];
const SEEDS: usize = 300;
const LATITUDE_DEG: f64 = 45.0;
const HEIGHT_M: f64 = 1000.0;

struct Row {
    term: &'static str,
    t: f64,
    navego_m: f64,
    kshana_m: f64,
}

impl Row {
    fn rel(&self) -> f64 {
        (self.kshana_m - self.navego_m) / self.navego_m
    }
}

fn oracle_table() -> Vec<Row> {
    let path = PathBuf::from(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/ins_coast_schuler_navego_oracle/navego_schuler_coast_errors.csv");
    let text = std::fs::read_to_string(path).expect("fixture");
    let mut acc: BTreeMap<(String, u64), (f64, usize)> = BTreeMap::new();
    for line in text.lines().skip(1) {
        let f: Vec<&str> = line.split(',').collect();
        let t: f64 = f[2].parse().unwrap();
        let dn: f64 = f[3].parse().unwrap();
        let de: f64 = f[4].parse().unwrap();
        let e = acc.entry((f[0].to_string(), t as u64)).or_insert((0.0, 0));
        e.0 += dn * dn + de * de;
        e.1 += 1;
    }
    let tactical = ImuGrade::Tactical.params().si();
    let at = |v: f64, a: f64| {
        CoastModel::new(tactical, v, a, Combination::Rss, 0.0).with_site(LATITUDE_DEG, HEIGHT_M)
    };
    let (still, cruise, sustained) = (at(0.0, 0.0), at(10.0, 0.0), at(0.0, 0.01));
    let law = |m: &CoastModel, name: &str, t: f64| -> f64 {
        m.contributions()
            .iter()
            .find(|c| c.name == name)
            .expect("contribution")
            .error_m(t)
    };
    let terms: [(&str, &str, &CoastModel, bool); 6] = [
        ("T1", "accel_bias", &still, false),
        ("T2", "gyro_bias_tilt", &still, false),
        ("T3", "scale_factor_cruise", &cruise, false),
        ("T4", "scale_factor_accel", &sustained, false),
        ("T5", "velocity_random_walk", &still, true),
        ("T6", "angle_random_walk", &still, true),
    ];
    let mut rows = Vec::new();
    for (tag, name, model, stochastic) in terms {
        for &t in &DURATIONS {
            let (ss, n) = acc
                .get(&(tag.to_string(), t as u64))
                .copied()
                .unwrap_or_else(|| panic!("{tag} at {t} s missing from the fixture"));
            let navego_m = if stochastic {
                assert_eq!(n, SEEDS, "{tag}: seed count");
                (ss / (2.0 * n as f64)).sqrt()
            } else {
                assert_eq!(n, 1, "{tag}: one deterministic run");
                ss.sqrt()
            };
            rows.push(Row {
                term: name,
                t,
                navego_m,
                kshana_m: law(model, name, t),
            });
        }
    }
    rows
}

fn print_table(rows: &[Row]) {
    eprintln!("term                    t (s)    NaveGo (m)    Kshana (m)   rel diff   within 5%");
    for r in rows {
        eprintln!(
            "{:<22} {:>6} {:>13.5} {:>13.5} {:>+9.4} {:>8}",
            r.term,
            r.t,
            r.navego_m,
            r.kshana_m,
            r.rel(),
            if r.rel().abs() <= TOL { "yes" } else { "NO" }
        );
    }
}

/// The pre-registered comparison: every term within 5 % of the corrected NaveGo runs at
/// every duration (48 comparisons).
#[test]
#[ignore = "pre-registered; not yet run"]
fn coast_error_model_matches_the_corrected_navego_runs() {
    let rows = oracle_table();
    print_table(&rows);
    let bad: Vec<String> = rows
        .iter()
        .filter(|r| r.rel().abs() > TOL)
        .map(|r| format!("{} at {} s: {:+.4}", r.term, r.t, r.rel()))
        .collect();
    assert!(bad.is_empty(), "outside 5 %: {}", bad.join("; "));
}
