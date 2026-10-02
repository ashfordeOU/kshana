// SPDX-License-Identifier: AGPL-3.0-only
//! Oracle test for the matrix row "INS/TRN coasting error growth & threshold
//! crossings": each per-term growth law of `inertial::coast::CoastModel` against the
//! free-inertial position error NaveGo's strapdown mechanization produces from that
//! error source alone.
//!
//! # Pre-registration (fixed 2026-10-01T03:30Z, before the first comparison)
//!
//! * **Oracle (Library).** NaveGo v1.4 (tag `v1.4`, commit 24d9488,
//!   <https://github.com/rodralez/NaveGo>, LGPL-3.0), run as a tool under GNU Octave
//!   11.1.0: `att_update` (quaternion), `vel_update`, `pos_update`, `earth_rate`,
//!   `transport_rate`, `gravity`, `radius`, and `imu_si_errors` for the unit conversion.
//!   No aiding. Generator: `tests/fixtures/ins_coast_navego_montecarlo_oracle/
//!   gen_ins_coast_navego.m`; its output is committed as `navego_coast_errors.csv`.
//! * **IMU profile.** `ImuGrade::Tactical`, handed to NaveGo in datasheet units.
//! * **Platform.** 45 deg N, 1000 m, level, heading north, 10 Hz, exact initial state.
//! * **Terms.** T1 accelerometer bias, T2 gyro bias (stationary, one deterministic run
//!   at the 1-sigma value); T3 scale factor, cruise (10 m/s^2 for 1 s, then 10 m/s; Kshana
//!   speed 10, accel 0); T4 scale factor, sustained 0.01 m/s^2 from rest (Kshana speed 0,
//!   accel 0.01); T5 velocity random walk, T6 angle random walk (stationary, white noise on
//!   both horizontal axes, 300 seeds).
//! * **Statistic.** Run minus the error-free run. T1-T4: horizontal magnitude. T5, T6:
//!   per-axis RMS `sqrt(mean over seeds of (dN^2 + dE^2) / 2)`.
//! * **Durations.** 30, 60, 120, 300, 600, 1200, 1800, 3600 s.
//! * **Tolerance.** `|NaveGo - Kshana| <= 0.05 x NaveGo` at every duration for every
//!   term (48 comparisons); the row agrees only if all 48 hold.
//!
//! # Result: the pre-registered comparison DISAGREES (the row stays MODELLED)
//!
//! Every law agrees with NaveGo within 5 % up to 600 s, but from 1200 s on the bias,
//! gyro-bias and random-walk laws overstate NaveGo's free-inertial error (by 7 to 21 %
//! at 1200 s, and by 2.8x to 8x at 3600 s): the monomials are flat-Earth laws with no
//! Schuler feedback, which a full strapdown mechanization bounds. The pre-registered
//! test is kept, `#[ignore]`d, so it can be run to see the disagreement. The live test
//! `finding_laws_hold_to_600_s_and_overstate_beyond` pins that measured finding; it was
//! written after the comparison and promotes nothing.
//!
//! Round 2: the engine's `Contribution::error_m` now comes from a nine-state error model
//! with Schuler feedback, and the round-1 monomials survive as
//! `Contribution::leading_order_m`, which this file compares so that it keeps recording
//! round 1 exactly. This fixture also carries an oracle artefact found in round 2: NaveGo's
//! quaternion update skips body-to-navigation rates below 1e-8 rad/s, which froze the
//! attitude in T3, T4 and T5. The round-2 comparison, with that guard lifted, is
//! `tests/ins_coast_schuler_navego_oracle.rs`.
//!
//! Disclosure: the first run of T3 put the 1 s burst one sample early (the
//! mechanization never integrates sample 1), so the cruise speed reached 9 m/s, not 10,
//! and T3 read 12 to 14 % low at every duration. The generator was corrected and T3
//! re-run after that result had been seen; the corrected rows are committed. T4 is
//! unchanged by the correction (bit-identical), and the row's verdict does not depend
//! on T3.

use kshana::inertial::coast::{CoastModel, Combination, ImuGrade};
use std::collections::BTreeMap;
use std::path::PathBuf;

const TOL: f64 = 0.05;
const DURATIONS: [f64; 8] = [30.0, 60.0, 120.0, 300.0, 600.0, 1200.0, 1800.0, 3600.0];
const SEEDS: usize = 300;

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
        .join("tests/fixtures/ins_coast_navego_montecarlo_oracle/navego_coast_errors.csv");
    let text = std::fs::read_to_string(path).expect("fixture");
    // (term, t) -> (sum of squares, count, is_stochastic)
    let mut acc: BTreeMap<(String, u64), (f64, usize)> = BTreeMap::new();
    for line in text.lines().skip(1) {
        let f: Vec<&str> = line.split(',').collect();
        let term = f[0].to_string();
        let t: f64 = f[2].parse().unwrap();
        let dn: f64 = f[3].parse().unwrap();
        let de: f64 = f[4].parse().unwrap();
        let e = acc.entry((term, t as u64)).or_insert((0.0, 0));
        e.0 += dn * dn + de * de;
        e.1 += 1;
    }

    let tactical = ImuGrade::Tactical.params().si();
    let still = CoastModel::new(tactical, 0.0, 0.0, Combination::Rss, 0.0);
    let cruise = CoastModel::new(tactical, 10.0, 0.0, Combination::Rss, 0.0);
    let sustained = CoastModel::new(tactical, 0.0, 0.01, Combination::Rss, 0.0);
    let law = |m: &CoastModel, name: &str, t: f64| -> f64 {
        m.contributions()
            .iter()
            .find(|c| c.name == name)
            .expect("contribution")
            .leading_order_m(t)
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

/// The pre-registered comparison: every term within 5 % of NaveGo at every duration.
/// Ignored because it does not hold (see the module documentation); run with
/// `--ignored` to see it fail.
#[test]
#[ignore = "the pre-registered 5 % comparison disagrees beyond 600 s; see the promotion record"]
fn coast_error_terms_match_the_navego_monte_carlo() {
    let rows = oracle_table();
    print_table(&rows);
    let bad: Vec<String> = rows
        .iter()
        .filter(|r| r.rel().abs() > TOL)
        .map(|r| format!("{} at {} s: {:+.3}", r.term, r.t, r.rel()))
        .collect();
    assert!(bad.is_empty(), "outside 5 %: {}", bad.join("; "));
}

/// Finding pin, written after the comparison (it promotes nothing): every law sits
/// within 5 % of NaveGo up to 600 s, and from 1200 s on the bias, gyro-bias and
/// random-walk laws overstate NaveGo by more than 5 % (no Schuler feedback in the
/// flat-Earth monomials). A change to the laws or to the fixture breaks this.
#[test]
fn finding_laws_hold_to_600_s_and_overstate_beyond() {
    let rows = oracle_table();
    print_table(&rows);
    for r in &rows {
        if r.t <= 600.0 {
            assert!(
                r.rel().abs() <= TOL,
                "{} at {} s: {:+.4}",
                r.term,
                r.t,
                r.rel()
            );
        }
    }
    let schuler_bounded = [
        "accel_bias",
        "gyro_bias_tilt",
        "velocity_random_walk",
        "angle_random_walk",
    ];
    for r in rows
        .iter()
        .filter(|r| r.t >= 1200.0 && schuler_bounded.contains(&r.term))
    {
        assert!(
            r.rel() > TOL,
            "{} at {} s: {:+.4} (expected the law to overstate NaveGo)",
            r.term,
            r.t,
            r.rel()
        );
    }
}
