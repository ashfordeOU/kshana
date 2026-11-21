// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana orbit-data pc`: the Foster (1992) 2D probability of collision.
//!
//! * A Monte Carlo cross-check on the self-made CDM (`cdm_selfmade_leo.cdm`): positions drawn from
//!   each object's 3D covariance (rotated from RTN here, independently of the module), projected
//!   onto the plane perpendicular to the relative velocity and counted inside the hard-body circle.
//! * The CDM round trip: the command writes the message back with `COLLISION_PROBABILITY` and
//!   `COLLISION_PROBABILITY_METHOD = FOSTER-1992` set; it reads back valid with the objects
//!   unchanged.
//! * Opt-in: the Pc2D_Foster test cases of NASA's CARA Analysis Tools (eleven Alfano 2009 cases and
//!   one Omitron case), extracted from a local clone by
//!   `tests/fixtures/orbit_data/extract_cara_pc_cases.py` (the cases are not copied into this
//!   repository). Set `KSHANA_CARA_PC_CASES` to the JSON; without it the test does nothing.

use kshana::orbit_data::cdm;
use kshana::orbit_data::pc::{foster_2d, from_cdm, METHOD};
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use std::collections::BTreeMap;
use std::process::Command;
use std::sync::atomic::{AtomicU64, Ordering::Relaxed};

static SEQ: AtomicU64 = AtomicU64::new(0);

fn fixture() -> String {
    std::fs::read_to_string(concat!(
        env!("CARGO_MANIFEST_DIR"),
        "/tests/fixtures/orbit_data/cdm_selfmade_leo.cdm"
    ))
    .unwrap()
}

fn gauss(rng: &mut ChaCha8Rng) -> f64 {
    let u1: f64 = rng.gen::<f64>().max(1e-300);
    let u2: f64 = rng.gen();
    (-2.0 * u1.ln()).sqrt() * (2.0 * std::f64::consts::PI * u2).cos()
}

/// Lower Cholesky factor of a 3x3 positive-definite matrix.
fn chol(c: [[f64; 3]; 3]) -> [[f64; 3]; 3] {
    let mut l = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..=i {
            let s: f64 = (0..j).map(|k| l[i][k] * l[j][k]).sum();
            if i == j {
                l[i][i] = (c[i][i] - s).sqrt();
            } else {
                l[i][j] = (c[i][j] - s) / l[j][j];
            }
        }
    }
    l
}

/// The RTN position covariance of an object rotated to the inertial frame: R along r, N along
/// r x v, T = N x R (CCSDS 508.0-B-1 annex E), written out here without the crate's helpers.
fn inertial_cov(x: &[f64; 6], rtn: &[Vec<f64>]) -> [[f64; 3]; 3] {
    let r = [x[0], x[1], x[2]];
    let v = [x[3], x[4], x[5]];
    let n = |a: [f64; 3]| {
        let m = (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt();
        [a[0] / m, a[1] / m, a[2] / m]
    };
    let cr = |a: [f64; 3], b: [f64; 3]| {
        [
            a[1] * b[2] - a[2] * b[1],
            a[2] * b[0] - a[0] * b[2],
            a[0] * b[1] - a[1] * b[0],
        ]
    };
    let ru = n(r);
    let nu = n(cr(r, v));
    let tu = cr(nu, ru);
    let axes = [ru, tu, nu];
    let mut out = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..3 {
            for k in 0..3 {
                for l in 0..3 {
                    out[i][j] += axes[k][i] * rtn[k][l] * axes[l][j];
                }
            }
        }
    }
    out
}

#[test]
fn the_selfmade_cdm_agrees_with_a_monte_carlo_count() {
    let (m, rep) = cdm::validate(&fixture(), &BTreeMap::new());
    assert!(rep.valid, "{}", rep.to_text());
    let hbr = 20.0;
    let (p, frame) = from_cdm(&m, hbr).unwrap();
    assert_eq!(frame, "EME2000");
    assert_eq!(p.method, METHOD);
    assert!((p.miss_distance_m - 30.0).abs() < 0.01);
    // Monte Carlo: n draws of both objects' position errors.
    let x1 = cdm::state(&m.objects[0]).unwrap();
    let x2 = cdm::state(&m.objects[1]).unwrap();
    let l1 = chol(inertial_cov(&x1, &cdm::covariance(&m.objects[0]).unwrap()));
    let l2 = chol(inertial_cov(&x2, &cdm::covariance(&m.objects[1]).unwrap()));
    let dr: Vec<f64> = (0..3).map(|i| (x2[i] - x1[i]) * 1e3).collect();
    let dv: Vec<f64> = (0..3).map(|i| (x2[i + 3] - x1[i + 3]) * 1e3).collect();
    let speed = dv.iter().map(|v| v * v).sum::<f64>().sqrt();
    let z: Vec<f64> = dv.iter().map(|v| v / speed).collect();
    let mut rng = ChaCha8Rng::seed_from_u64(20261121);
    let n = 400_000;
    let mut hits = 0usize;
    for _ in 0..n {
        let e1: Vec<f64> = (0..3).map(|_| gauss(&mut rng)).collect();
        let e2: Vec<f64> = (0..3).map(|_| gauss(&mut rng)).collect();
        let mut d = [0.0; 3];
        for i in 0..3 {
            let a: f64 = (0..3).map(|k| l1[i][k] * e1[k]).sum();
            let b: f64 = (0..3).map(|k| l2[i][k] * e2[k]).sum();
            d[i] = dr[i] + b - a;
        }
        let along: f64 = (0..3).map(|i| d[i] * z[i]).sum();
        let perp2: f64 = (0..3).map(|i| (d[i] - along * z[i]).powi(2)).sum();
        if perp2 <= hbr * hbr {
            hits += 1;
        }
    }
    let mc = hits as f64 / n as f64;
    let sd = (p.pc * (1.0 - p.pc) / n as f64).sqrt();
    assert!(
        p.pc > 1e-3,
        "the case should give a Pc a Monte Carlo can see: {}",
        p.pc
    );
    assert!(
        (mc - p.pc).abs() < 4.0 * sd,
        "Foster {} vs Monte Carlo {mc} (sd {sd})",
        p.pc
    );
}

#[test]
fn the_command_writes_the_cdm_back_with_the_pc() {
    let dir = std::env::temp_dir().join(format!(
        "kshana-orbit-data-pc-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let input = dir.join("in.cdm");
    std::fs::write(&input, fixture()).unwrap();
    let out_cdm = dir.join("out.cdm");
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args([
            "orbit-data",
            "pc",
            input.to_str().unwrap(),
            "--hbr",
            "20",
            "--cdm-out",
            out_cdm.to_str().unwrap(),
        ])
        .output()
        .unwrap();
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let doc: serde_json::Value = serde_json::from_slice(&o.stdout).unwrap();
    assert_eq!(doc["schema"], "kshana.conjunction-pc/1");
    assert_eq!(doc["evidence"], "MODELLED");
    let pc = doc["result"]["pc"].as_f64().unwrap();
    // Round trip: the written CDM is valid, carries the Pc and the method, and the objects'
    // states and covariances are unchanged.
    let written = std::fs::read_to_string(&out_cdm).unwrap();
    let (m2, rep) = cdm::validate(&written, &BTreeMap::new());
    assert!(rep.valid, "{}", rep.to_text());
    let got: f64 = m2.relative.num("COLLISION_PROBABILITY").unwrap();
    assert!((got - pc).abs() <= 1e-6 * pc, "{got} vs {pc}");
    assert_eq!(
        m2.relative.get("COLLISION_PROBABILITY_METHOD"),
        Some(METHOD)
    );
    let (m1, _) = cdm::validate(&fixture(), &BTreeMap::new());
    for k in 0..2 {
        assert_eq!(cdm::state(&m2.objects[k]), cdm::state(&m1.objects[k]));
        assert_eq!(
            cdm::covariance(&m2.objects[k]),
            cdm::covariance(&m1.objects[k])
        );
    }
    // The same Pc again from the written message.
    assert_eq!(from_cdm(&m2, 20.0).unwrap().0.pc, pc);
    // Usage errors: no radius, a bad radius.
    let run = |args: &[&str]| {
        Command::new(env!("CARGO_BIN_EXE_kshana"))
            .args(args)
            .output()
            .unwrap()
            .status
            .success()
    };
    assert!(!run(&["orbit-data", "pc", input.to_str().unwrap()]));
    assert!(!run(&[
        "orbit-data",
        "pc",
        input.to_str().unwrap(),
        "--hbr",
        "-1"
    ]));
    let _ = std::fs::remove_dir_all(&dir);
}

#[test]
fn cara_pc2d_foster_cases() {
    let Some(path) = std::env::var_os("KSHANA_CARA_PC_CASES") else {
        eprintln!("KSHANA_CARA_PC_CASES not set: the CARA Pc2D_Foster comparison is skipped");
        return;
    };
    let doc: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(path).unwrap()).unwrap();
    let tol = doc["rel_tol"].as_f64().unwrap();
    let v3 = |v: &serde_json::Value| -> [f64; 3] {
        let a = v.as_array().unwrap();
        [
            a[0].as_f64().unwrap(),
            a[1].as_f64().unwrap(),
            a[2].as_f64().unwrap(),
        ]
    };
    let m3 = |v: &serde_json::Value| -> [[f64; 3]; 3] {
        let a = v.as_array().unwrap();
        [v3(&a[0]), v3(&a[1]), v3(&a[2])]
    };
    let cases = doc["cases"].as_array().unwrap();
    assert!(cases.len() >= 12);
    for c in cases {
        let p = foster_2d(
            v3(&c["r1_m"]),
            v3(&c["v1_m_s"]),
            &m3(&c["c1_m2"]),
            v3(&c["r2_m"]),
            v3(&c["v2_m_s"]),
            &m3(&c["c2_m2"]),
            c["hbr_m"].as_f64().unwrap(),
        )
        .unwrap();
        let want = c["expected_pc"].as_f64().unwrap();
        let rel = (p.pc - want).abs() / want;
        eprintln!(
            "{}: Pc {:.9e}, CARA {:.9e}, rel {:.2e}",
            c["id"], p.pc, want, rel
        );
        assert!(rel <= tol, "{}: {} vs {want}", c["id"], p.pc);
    }
}
