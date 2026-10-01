// SPDX-License-Identifier: AGPL-3.0-only
//! The LEO broadcast-ephemeris fitter on real precise orbits, against the published fit
//! statistics of Liu, Su, Xie, Zhou and Qu (2025), "Study on the Design of Broadcast
//! Ephemeris Parameters for Low Earth Orbit Satellites", Remote Sensing 17(16):2894,
//! doi 10.3390/rs17162894 (CC BY 4.0).
//!
//! ## Oracle (Measured + Reference)
//!
//! * **Truth**: the TU Graz IfG (ITSG) operational reduced-dynamic orbits the paper's data
//!   statement names, for the days its Table 3 lists: GRACE-A (GRACE-1) 2017-06-01, GRACE-C
//!   (GRACEFO-1) 2024-01-01, Sentinel-2A 2024-01-01, Sentinel-6A 2024-01-01, 10 s sampling,
//!   converted from the celestial frame to ITRF by `fixtures/leo_navmsg_fit_real_orbit_oracle/
//!   gen_fixture.py` (pyerfa 2.0.1.5 `c2t06a`, IERS finals2000A). HY-2A is left out: its orbit
//!   is on CDDIS behind an account.
//! * **Published values**: the paper's Tables 4, 5, 6 and 8, the rows "16" (the basic
//!   Keplerian set) and "22: ȧ, ṅ, Crs3, Crc3, Crs1, Crc1" (its recommended 22-parameter set),
//!   RMS along-track A, cross-track C, radial R and SISRE (cm) over 20 min and 30 min arcs.
//!
//! ## What Kshana does here
//!
//! `leo_navmsg::fit::fit_message` with `Kepler16` and `Liu22`, 10 s samples, on consecutive
//! non-overlapping arcs of 20 min (72 per day) and 30 min (48 per day) from 00:00 GPS time.
//! The residual is message minus truth at every fit sample (both ends), in the truth's
//! along/cross/radial frame, pooled over the day as RMS. SISRE is Kshana's own,
//! `sqrt(w_R² R² + w_AC² (A² + C²))` with `sisre::sisre_weights(r, 0°)` at the day's mean
//! radius, accumulated by `sisre::StatsAcc`. Every arc must fit.
//!
//! ## Tolerances, fixed on 2026-10-01 before the first comparison
//!
//! * **G1**: RMS A, C and R each within a factor 1.5 of the printed value, two-sided.
//! * **G2**: SISRE within a factor 1.5 of the printed SISRE, two-sided (the study's bar).
//! * **G3**: `sisre_weights(R_E + h, 0°)` gives `w_R` and `sqrt(w_AC²)` within 0.005 of the
//!   paper's Table 2 at 400 to 1400 km.
//!
//! Known from the paper before the run: its printed SISRE values follow
//! `sqrt(w_R R² + w_AC (A² + C²))` with the Table 2 numbers, not its own Eq. 9 (which Kshana
//! uses, and which Table 2 satisfies as `w_R² + 2 w_AC² = 1`). For identical components G2
//! therefore carries a bias of about 0.78 (Kshana lower); G1 does not.

//! ## Round 2 pre-registration (M124, written 2026-10-01 before any engine change, before any
//! held-out orbit is fetched and before any re-run)
//!
//! Engine changes, from the paper's Section 2.2 (Eq. 1-7) and 2.3, read in full this time:
//! 1. Liu22 user algorithm exactly as Eq. 1: `n = sqrt(mu / A^3) + dn + n_dot (t - toe)` (no
//!    factor 1/2), `A_k = A + a_dot (t - toe)`, harmonics on the uncorrected argument of latitude.
//! 2. Liu22 fit as Section 2.3: plain least squares from the osculating elements at the reference
//!    epoch with every correction term zero, no zero-centred priors.
//! 3. Stop on parameter convergence: iterate until every parameter step is below 1e-3 of its
//!    formal standard deviation (or the paper's 100-iteration cap).
//! The Kepler16 path (M120) is not changed.
//!
//! Comparisons:
//! * Re-run: the same four days, the same published Liu22 rows, the same G1 and G2 at the same
//!   factor 1.5, 20 and 30 min (`liu22_model_matches_the_published_sisre`).
//! * Held out (new): for each satellite the two following days, GRACE-A 2017-06-02 and
//!   2017-06-03, GRACE-C, Sentinel-2A and Sentinel-6A 2024-01-02 and 2024-01-03, from the same
//!   ITSG directory and the same conversion (`gen_fixture.py`), compared with the same printed
//!   values of that satellite (the paper's tables are one-day statistics; day-to-day stability is
//!   the assumption under test) at the same G1 and G2 factor 1.5, Liu22, 20 and 30 min. If a
//!   day's file is missing or incomplete, the next available day is taken, by availability only,
//!   before any fit is run on it. Test: `liu22_holds_on_held_out_days`.
//! * PROMOTE only if both pass. A failure is a finding; no bar moves.
//! Disclosure: the first run's ratios (Sentinel-2A 1.71, Sentinel-6A 1.86 along-track at 20 min)
//! were seen before this amendment.
//! Note added with the engine change, before any re-run or held-out fit: the paper's own
//! termination rule (Section 2.3) is a change of the residual root-mean-square (RMS) between
//! two iterations below 0.1 mm, or 100 iterations. Item 3 above mis-states it; the
//! pre-registered parameter-convergence rule is kept unchanged (it stops no earlier on a
//! converging fit), and the difference is disclosed here rather than amended.
//!
//! ## Round 2 result (2026-10-01): AGREES on both comparisons
//!
//! * Re-run, the four paper days (Liu22, ratios Kshana/published A, C, R, SISRE): GRACE-A 20 min
//!   0.924 1.088 0.927 0.790, 30 min 1.078 1.103 1.114 0.853; GRACE-C 20 min 1.001 1.015 1.010
//!   0.783, 30 min 0.928 1.046 0.974 0.769; Sentinel-2A 20 min 1.103 1.012 1.138 0.822, 30 min
//!   0.987 1.081 0.976 0.788; Sentinel-6A 20 min 0.924 1.118 1.010 0.755, 30 min 1.028 1.055
//!   1.061 0.787. All inside 1.5x two-sided (first run: along-track 1.711 and 1.863).
//! * Held out, eight days: every ratio between 0.683 (Sentinel-2A 2024-01-02, 20 min, SISRE) and
//!   1.186 (GRACE-A 2017-06-02, 30 min, cross-track); all inside 1.5x two-sided.
//! * Mutation: restoring the zero-centred priors on the Liu22 fit (the pre-0.30 fitter, with the
//!   paper's full n_dot) gives Sentinel-6A 20 min along-track 1.08 cm against 0.70 cm (1.540) and
//!   fails `liu22_model_matches_the_published_sisre`; reverted by editing.

use std::path::Path;

use kshana::leo_navmsg::elements::{ephemeris_at, SysTime};
use kshana::leo_navmsg::fit::{fit_message, ModelKind};
use kshana::leo_navmsg::sisre::{sisre_weights, StatsAcc, EARTH_RADIUS_M};
use kshana::leo_navmsg::truth::TruthOrbit;

/// One day of a satellite: fixture file, label, and the printed values
/// `[A, C, R, SISRE]` (cm) for (16 at 20 min, 16 at 30 min, 22 at 20 min, 22 at 30 min).
#[derive(Clone, Copy)]
struct Day {
    file: &'static str,
    name: &'static str,
    k16_20: [f64; 4],
    k16_30: [f64; 4],
    l22_20: [f64; 4],
    l22_30: [f64; 4],
}

/// Liu et al. 2025, Tables 4 (GRACE-A), 5 (GRACE-C), 6 (Sentinel-2A) and 8 (Sentinel-6A).
const DAYS: [Day; 4] = [
    Day {
        file: "grace_a_2017-06-01.csv",
        name: "GRACE-A 320 km",
        k16_20: [41.75, 7.71, 24.95, 37.66],
        k16_30: [96.99, 21.60, 67.37, 90.78],
        l22_20: [6.90, 7.50, 5.40, 8.88],
        l22_30: [19.98, 21.30, 16.80, 25.80],
    },
    Day {
        file: "grace_c_2024-01-01.csv",
        name: "GRACE-C 475 km",
        k16_20: [33.29, 5.47, 18.09, 29.40],
        k16_30: [82.35, 17.08, 52.99, 75.64],
        l22_20: [4.87, 5.26, 3.69, 6.21],
        l22_30: [15.25, 16.70, 12.12, 19.70],
    },
    Day {
        file: "sentinel_2a_2024-01-01.csv",
        name: "Sentinel-2A 786 km",
        k16_20: [24.40, 2.60, 11.76, 20.81],
        k16_30: [65.37, 10.49, 38.01, 58.21],
        l22_20: [2.47, 2.33, 1.59, 2.87],
        l22_30: [9.55, 10.07, 6.74, 11.79],
    },
    Day {
        file: "sentinel_6a_2024-01-01.csv",
        name: "Sentinel-6A 1336 km",
        k16_20: [12.07, 0.89, 4.45, 9.58],
        k16_30: [38.07, 3.90, 18.78, 31.75],
        l22_20: [0.70, 0.64, 0.33, 0.75],
        l22_30: [3.52, 3.29, 2.13, 3.92],
    },
];

/// G1 and G2: the two-sided ratio bound, fixed before the first comparison.
const RATIO_TOL: f64 = 1.5;
/// G3: absolute tolerance on the SISRE weights, fixed before the first comparison.
const WEIGHT_TOL: f64 = 0.005;

fn fixture(name: &str) -> std::path::PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR"))
        .join("tests/fixtures/leo_navmsg_fit_real_orbit_oracle")
        .join(name)
}

/// Read a fixture day into a truth orbit.
fn load(file: &str) -> TruthOrbit {
    let text = std::fs::read_to_string(fixture(file)).expect("fixture present");
    let (mut week, mut tow0) = (None, None);
    let mut states = Vec::new();
    for line in text.lines() {
        if let Some(rest) = line.strip_prefix("# gps_week ") {
            let f: Vec<&str> = rest.split_whitespace().collect();
            week = Some(f[0].parse::<u32>().unwrap());
            tow0 = Some(f[2].parse::<f64>().unwrap());
            continue;
        }
        if line.starts_with('#') || line.trim().is_empty() {
            continue;
        }
        let v: Vec<f64> = line.split(',').map(|s| s.parse().unwrap()).collect();
        assert_eq!(v[0], 10.0 * states.len() as f64, "uniform 10 s epochs");
        states.push(([v[1], v[2], v[3]], [v[4], v[5], v[6]]));
    }
    assert_eq!(
        states.len(),
        8641,
        "{file}: one day at 10 s, both midnights"
    );
    let epoch = SysTime::new(week.unwrap(), tow0.unwrap());
    TruthOrbit::from_ecef_states(epoch, 10.0, 0.0, &states).expect("truth orbit")
}

/// Pooled RMS `[A, C, R]` and Kshana's SISRE (both in cm) of a day of fits.
fn day_stats(truth: &TruthOrbit, kind: ModelKind, arc_s: f64) -> ([f64; 3], f64) {
    let n_arcs = (86_400.0 / arc_s).round() as usize;
    let mut radius_sum = 0.0;
    let mut radius_n = 0.0;
    let mut errs: Vec<[f64; 3]> = Vec::new();
    for j in 0..n_arcs {
        let start = truth.epoch.plus(j as f64 * arc_s);
        let fitted = fit_message(truth, None, kind, &start, arc_s, 10.0)
            .unwrap_or_else(|e| panic!("arc {j} failed to fit: {e}"));
        let n = (arc_s / 10.0).round() as usize;
        for k in 0..=n {
            let t = start.plus(10.0 * k as f64);
            let (pos, _, frame) = truth.state_ecef(truth.dt_of(&t));
            let msg = ephemeris_at(&fitted.ephemeris, fitted.week, &t).0;
            errs.push(frame.project([msg[0] - pos[0], msg[1] - pos[1], msg[2] - pos[2]]));
            radius_sum += (pos[0] * pos[0] + pos[1] * pos[1] + pos[2] * pos[2]).sqrt();
            radius_n += 1.0;
        }
    }
    let w = sisre_weights(radius_sum / radius_n, 0.0);
    let mut acc = StatsAcc::default();
    for e in &errs {
        acc.push(&w, *e, 0.0);
    }
    let s = acc.finish();
    (
        [
            s.along_rms_m * 100.0,
            s.cross_rms_m * 100.0,
            s.radial_rms_m * 100.0,
        ],
        s.sisre_orb_rms_m * 100.0,
    )
}

fn within(ours: f64, published: f64) -> bool {
    let r = ours / published;
    (1.0 / RATIO_TOL..=RATIO_TOL).contains(&r)
}

/// Run one model over every day and arc; return the failures (empty when G1 and G2 hold).
fn compare(kind: ModelKind, label: &str) -> Vec<String> {
    compare_days(&DAYS, kind, label)
}

/// The held-out days (pre-registered in round 2): the two days after each paper day, scored
/// against the same printed values of that satellite.
fn held_out_days() -> Vec<Day> {
    let next = [
        ("grace_a_2017-06-02.csv", "grace_a_2017-06-03.csv"),
        ("grace_c_2024-01-02.csv", "grace_c_2024-01-03.csv"),
        ("sentinel_2a_2024-01-02.csv", "sentinel_2a_2024-01-03.csv"),
        ("sentinel_6a_2024-01-02.csv", "sentinel_6a_2024-01-03.csv"),
    ];
    let mut out = Vec::new();
    for (d, (f1, f2)) in DAYS.iter().zip(next) {
        for f in [f1, f2] {
            out.push(Day { file: f, ..*d });
        }
    }
    out
}

fn compare_days(days: &[Day], kind: ModelKind, label: &str) -> Vec<String> {
    let rows: Vec<(String, [f64; 4], [f64; 3], f64)> = std::thread::scope(|sc| {
        let handles: Vec<_> = days
            .iter()
            .map(|d| {
                sc.spawn(move || {
                    let truth = load(d.file);
                    let mut out = Vec::new();
                    let (p20, p30) = match kind {
                        ModelKind::Liu22 => (d.l22_20, d.l22_30),
                        _ => (d.k16_20, d.k16_30),
                    };
                    for (arc, published) in [(1200.0, p20), (1800.0, p30)] {
                        let (rac, sisre) = day_stats(&truth, kind, arc);
                        out.push((
                            format!("{} {} {} min", d.name, d.file, arc / 60.0),
                            published,
                            rac,
                            sisre,
                        ));
                    }
                    out
                })
            })
            .collect();
        handles
            .into_iter()
            .flat_map(|h| h.join().expect("worker"))
            .collect()
    });
    let mut failures = Vec::new();
    eprintln!("{label}: case | Kshana A C R SISRE (cm) | published A C R SISRE (cm) | ratios");
    for (case, p, rac, sisre) in &rows {
        let ratios = [rac[0] / p[0], rac[1] / p[1], rac[2] / p[2], sisre / p[3]];
        eprintln!(
            "{label}: {case} | {:.2} {:.2} {:.2} {:.2} | {:.2} {:.2} {:.2} {:.2} | {:.3} {:.3} {:.3} {:.3}",
            rac[0], rac[1], rac[2], sisre, p[0], p[1], p[2], p[3],
            ratios[0], ratios[1], ratios[2], ratios[3]
        );
        for (k, comp) in ["A", "C", "R"].iter().enumerate() {
            if !within(rac[k], p[k]) {
                failures.push(format!(
                    "G1 {case}: {comp} {:.2} cm vs published {:.2} cm (ratio {:.3})",
                    rac[k], p[k], ratios[k]
                ));
            }
        }
        if !within(*sisre, p[3]) {
            failures.push(format!(
                "G2 {case}: SISRE {sisre:.2} cm vs published {:.2} cm (ratio {:.3})",
                p[3], ratios[3]
            ));
        }
    }
    failures
}

/// M120: the 16-parameter Keplerian fitter and its SISRE against fit interval, on real
/// precise orbits, against Liu et al. 2025 (rows "16"), plus the SISRE weights (G3).
#[test]
fn fitted_sisre_matches_liu_2025_on_real_orbits() {
    // G3: the paper's Table 2, (altitude km, w_R, w_A,C).
    let table2 = [
        (400.0, 0.419, 0.642),
        (600.0, 0.488, 0.617),
        (800.0, 0.540, 0.595),
        (1000.0, 0.582, 0.575),
        (1200.0, 0.618, 0.556),
        (1400.0, 0.648, 0.539),
    ];
    let mut failures = Vec::new();
    for (h, wr, wac) in table2 {
        let w = sisre_weights(EARTH_RADIUS_M + h * 1e3, 0.0);
        let wac_k = w.w_ac2.sqrt();
        eprintln!(
            "G3 {h} km: w_R {:.4} (table {wr}), w_AC {:.4} (table {wac})",
            w.w_r, wac_k
        );
        if (w.w_r - wr).abs() > WEIGHT_TOL || (wac_k - wac).abs() > WEIGHT_TOL {
            failures.push(format!(
                "G3 {h} km: w_R {:.4} vs {wr}, w_AC {wac_k:.4} vs {wac}",
                w.w_r
            ));
        }
    }
    failures.extend(compare(ModelKind::Kepler16, "kepler16"));
    assert!(failures.is_empty(), "{}", failures.join("\n"));
}

/// M124: the Liu et al. 22-parameter model on the same orbits, against the paper's
/// recommended 22-parameter rows.
///
/// Result of the pre-registered run (2026-10-01): DISAGREES. G1 fails on the 20 min arcs of
/// the two higher orbits, along-track RMS 4.23 cm against 2.47 cm (Sentinel-2A, ratio 1.71)
/// and 1.30 cm against 0.70 cm (Sentinel-6A, ratio 1.86); every other component and every
/// SISRE is inside the factor 1.5. The row stayed MODELLED (finding M124).
/// Round 2 re-run after the engine change pre-registered above (paper's Eq. 1 n_dot, no priors,
/// zero start): AGREES, every ratio between 0.755 and 1.138.
#[test]
fn liu22_model_matches_the_published_sisre() {
    let failures = compare(ModelKind::Liu22, "liu22");
    assert!(failures.is_empty(), "{}", failures.join("\n"));
}

/// The tabulated-truth constructor returns the fixture's Earth-fixed states at its nodes
/// (an internal identity of the adapter, not part of the oracle comparison).
#[test]
fn tabulated_truth_returns_its_states_at_the_nodes() {
    let truth = load(DAYS[1].file);
    let text = std::fs::read_to_string(fixture(DAYS[1].file)).unwrap();
    let rows: Vec<Vec<f64>> = text
        .lines()
        .filter(|l| !l.starts_with('#') && !l.trim().is_empty())
        .map(|l| l.split(',').map(|s| s.parse().unwrap()).collect())
        .collect();
    for k in [0usize, 1, 4321, 8640] {
        let (p, v, _) = truth.state_ecef(10.0 * k as f64);
        for c in 0..3 {
            assert!((p[c] - rows[k][1 + c]).abs() < 1e-6, "node {k} position");
            assert!((v[c] - rows[k][4 + c]).abs() < 1e-9, "node {k} velocity");
        }
    }
}

/// M124 round 2, pre-registered above: the Liu22 fit on held-out days.
#[test]
fn liu22_holds_on_held_out_days() {
    let failures = compare_days(&held_out_days(), ModelKind::Liu22, "liu22-held-out");
    assert!(failures.is_empty(), "{}", failures.join("\n"));
}
