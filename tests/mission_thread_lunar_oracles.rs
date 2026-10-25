// SPDX-License-Identifier: AGPL-3.0-only
//! The recorded verdicts of the pre-registered oracle rows A1 (LRO) and A2 (CAPSTONE NRHO) of
//! `xval/mission-thread-lunar/PREREGISTRATION.md`, as amended.
//!
//! Ungated: the committed Horizons responses and the degree-150 GRAIL crop match their recorded SHA-256, the
//! stored results apply the registered bars correctly to the stored numbers, and the verdicts are the ones
//! recorded, **including the miss**: A1 is MET, A2 is NOT MET. A change to either verdict is a new result, not a
//! fix to this test.
//!
//! Gated by `KSHANA_RECOMPUTE_LUNAR_ORACLES=1` (the propagation is heavy, as the full GRAIL tests are): A1 and the
//! end of the A2 window are recomputed from the committed fixtures and agree with the stored numbers to a
//! millimetre. The rows test the propagator the lunar kinds share and nothing else.
//!
//! Advisory software, not certified navigation equipment.

use serde_json::Value;
use sha2::{Digest, Sha256};

const DIR: &str = "tests/fixtures/mission_thread_lunar";
const RESULTS: &str = "xval/mission-thread-lunar/results_oracles.json";

// The registered bars (Amendment 1).
const A1_MAX_3D_M: f64 = 500.0;
const A1_RMS_RADIAL_M: f64 = 60.0;
const A2_END_POS_M: f64 = 25_000.0;
const A2_PERILUNE_M: f64 = 10_000.0;

fn sha(path: &str) -> String {
    hex::encode(Sha256::digest(
        std::fs::read(path).unwrap_or_else(|e| panic!("{path}: {e}")),
    ))
}

fn results() -> Value {
    serde_json::from_str(&std::fs::read_to_string(RESULTS).expect("results file"))
        .expect("results JSON")
}

#[test]
fn the_fixtures_match_their_recorded_hashes() {
    let r = results();
    assert_eq!(
        sha(&format!("{DIR}/a1_lro_horizons.json")),
        r["inputs"]["a1_lro_horizons.json"]
    );
    assert_eq!(
        sha(&format!("{DIR}/a2_capstone_horizons.json")),
        r["inputs"]["a2_capstone_horizons.json"]
    );
    assert_eq!(
        sha(&format!("{DIR}/jggrx_0660b_sha_to150.tab")),
        "5fd5fffa91288f33fb1c917eaddca9fa28bcb05d0e096998dd7c3a577130cb5b"
    );
    // The original GRAIL table the run used is the one the repository already records.
    assert_eq!(
        r["inputs"]["gravity_table"]["sha256"],
        "500e47e0ae2fa32d30615ea4af9ed6cca3a60e05c332d918692596a425708534"
    );
}

#[test]
fn the_stored_numbers_meet_or_miss_the_registered_bars_as_recorded() {
    let r = results();
    let a1 = &r["a1"];
    let (max3, rms) = (
        a1["max_3d_difference_m"].as_f64().unwrap(),
        a1["rms_radial_difference_m"].as_f64().unwrap(),
    );
    assert_eq!(a1["bars"]["max_3d_m"], A1_MAX_3D_M);
    assert_eq!(a1["bars"]["rms_radial_m"], A1_RMS_RADIAL_M);
    assert_eq!(a1["comparisons"], 144);
    assert!(max3 <= A1_MAX_3D_M && rms <= A1_RMS_RADIAL_M);
    assert_eq!(a1["status"], "MET");

    let a2 = &r["a2"];
    let (dpos, dper) = (
        a2["end_position_difference_m"].as_f64().unwrap(),
        a2["periapsis_radius_difference_m"].as_f64().unwrap(),
    );
    assert_eq!(a2["bars"]["end_position_m"], A2_END_POS_M);
    assert_eq!(a2["bars"]["periapsis_radius_m"], A2_PERILUNE_M);
    assert_eq!(a2["window_hours"], 156);
    // The recorded miss: both A2 bars are missed, and the verdict says so.
    assert!(dpos > A2_END_POS_M && dper > A2_PERILUNE_M, "{dpos} {dper}");
    assert_eq!(a2["end_position_met"], false);
    assert_eq!(a2["periapsis_met"], false);
    assert_eq!(a2["status"], "NOT MET");
}

#[test]
fn every_row_says_what_it_tests_and_carries_the_advisory_line() {
    let r = results();
    assert!(r["tests"]
        .as_str()
        .unwrap()
        .contains("no navigation filter"));
    assert!(r["advisory"]
        .as_str()
        .unwrap()
        .contains("not certified navigation equipment"));
}

mod recompute {
    use kshana::gravity_sh::SphericalHarmonicField;
    use kshana::integrator::Tolerance;
    use kshana::lunar_od::{De440LunarEnvironment, LunarForceModel};
    use kshana::precise_od::{propagate, propagate_samples};
    use serde_json::Value;

    type V3 = [f64; 3];
    struct S {
        jd: f64,
        r: V3,
        v: V3,
    }

    fn norm(a: V3) -> f64 {
        (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
    }
    fn sub(a: V3, b: V3) -> V3 {
        [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
    }
    fn dot(a: V3, b: V3) -> f64 {
        a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
    }
    fn cross(a: V3, b: V3) -> V3 {
        [
            a[1] * b[2] - a[2] * b[1],
            a[2] * b[0] - a[0] * b[2],
            a[0] * b[1] - a[1] * b[0],
        ]
    }

    fn parse(path: &str) -> Vec<S> {
        let v: Value = serde_json::from_str(&std::fs::read_to_string(path).unwrap()).unwrap();
        let t = v["result"].as_str().unwrap();
        let (a, b) = (t.find("$$SOE").unwrap(), t.find("$$EOE").unwrap());
        t[a + 5..b]
            .lines()
            .map(str::trim)
            .filter(|l| !l.is_empty())
            .map(|l| {
                let f: Vec<f64> = l
                    .split(',')
                    .map(str::trim)
                    .filter_map(|x| x.parse::<f64>().ok())
                    .collect();
                // The JD, then the calendar text (not a number), then x y z vx vy vz in km, km/s.
                S {
                    jd: f[0],
                    r: [f[1] * 1e3, f[2] * 1e3, f[3] * 1e3],
                    v: [f[4] * 1e3, f[5] * 1e3, f[6] * 1e3],
                }
            })
            .collect()
    }

    fn tol() -> Tolerance {
        Tolerance {
            rtol: 1e-12,
            atol: 1e-9,
            h_min: 1e-3,
            h_max: 60.0,
        }
    }

    fn periapsis(r: V3, v: V3, mu: f64) -> f64 {
        let h = cross(r, v);
        let rn = norm(r);
        let vxh = cross(v, h);
        let e = norm([
            vxh[0] / mu - r[0] / rn,
            vxh[1] / mu - r[1] / rn,
            vxh[2] / mu - r[2] / rn,
        ]);
        dot(h, h) / mu / (1.0 + e)
    }

    pub fn run(dir: &str, stored: &Value) {
        let table = std::fs::read_to_string(format!("{dir}/jggrx_0660b_sha_to150.tab")).unwrap();
        let field = SphericalHarmonicField::from_shadr(&table, 150).unwrap();
        let mu = field.gm;
        // A1.
        let refs = parse(&format!("{dir}/a1_lro_horizons.json"));
        assert_eq!(refs.len(), 145);
        let m = LunarForceModel::with_env(
            field.clone(),
            refs[0].jd,
            De440LunarEnvironment::orientation_only(),
        )
        .relativity();
        let times: Vec<f64> = refs[1..]
            .iter()
            .map(|s| (s.jd - refs[0].jd) * 86_400.0)
            .collect();
        let pos = propagate_samples(&m, refs[0].r, refs[0].v, &times, &tol());
        let (mut max3, mut sr2) = (0.0f64, 0.0f64);
        for (p, s) in pos.iter().zip(&refs[1..]) {
            let d = sub(*p, s.r);
            max3 = max3.max(norm(d));
            let rn = norm(s.r);
            sr2 += dot(d, [s.r[0] / rn, s.r[1] / rn, s.r[2] / rn]).powi(2);
        }
        let rms = (sr2 / pos.len() as f64).sqrt();
        let close = |a: f64, b: f64| (a - b).abs() <= 1e-3;
        assert!(
            close(max3, stored["a1"]["max_3d_difference_m"].as_f64().unwrap()),
            "{max3}"
        );
        assert!(
            close(
                rms,
                stored["a1"]["rms_radial_difference_m"].as_f64().unwrap()
            ),
            "{rms}"
        );
        // A2, from the stored window start.
        let refs = parse(&format!("{dir}/a2_capstone_horizons.json"));
        assert_eq!(refs.len(), 2137);
        let i0 = stored["a2"]["window_start_index"].as_u64().unwrap() as usize;
        let end = &refs[i0 + 156];
        let m = LunarForceModel::with_env(
            field,
            refs[i0].jd,
            De440LunarEnvironment::orientation_only(),
        )
        .relativity();
        let (r, v) = propagate(
            &m,
            refs[i0].r,
            refs[i0].v,
            (end.jd - refs[i0].jd) * 86_400.0,
            &tol(),
        );
        let dpos = norm(sub(r, end.r));
        let dper = (periapsis(r, v, mu) - periapsis(end.r, end.v, mu)).abs();
        assert!(
            close(
                dpos,
                stored["a2"]["end_position_difference_m"].as_f64().unwrap()
            ),
            "{dpos}"
        );
        assert!(
            close(
                dper,
                stored["a2"]["periapsis_radius_difference_m"]
                    .as_f64()
                    .unwrap()
            ),
            "{dper}"
        );
    }
}

/// Gated recompute: `KSHANA_RECOMPUTE_LUNAR_ORACLES=1 cargo test --release --test mission_thread_lunar_oracles`.
#[test]
fn the_stored_numbers_are_what_the_committed_fixtures_give() {
    if std::env::var("KSHANA_RECOMPUTE_LUNAR_ORACLES").is_err() {
        eprintln!(
            "skipped: set KSHANA_RECOMPUTE_LUNAR_ORACLES=1 to recompute A1 and the A2 window end"
        );
        return;
    }
    recompute::run(DIR, &results());
}
