// SPDX-License-Identifier: AGPL-3.0-only
//! C5a v2: the optical-navigation partials against an independent complex-step oracle, with the bar relative to each
//! row's largest element (`docs/design/evidence/c5a-optical-navigation-model/PREREGISTRATION-v2.md`, signed 9
//! November 2026; readings `xval/c5a-opnav-v2/README.md`). O1 to O4 re-run on the fresh geometries. The scored run
//! writes `xval/c5a-opnav-v2/result_v2.json` once (`KSHANA_C5A_V2_WRITE=1`).
//!
//! Result (scored 2026-11-09): MET. O5 v2 worst 2.3e-11 of the row's largest, no failing row; fresh O1-O4 within
//! v1's bars (`docs/design/evidence/c5a-optical-navigation-model/RESULTS.md`, v2 section).
//!
//! PIN-SCOPE: the counts and worst values of `xval/c5a-opnav-v2/result_v2.json`. PIN-EXCLUDES: output hashes.

use kshana::ephem_provider::KernelEphemeris;
use kshana::opnav::{measure, project, Camera, Measurement, Target};
use kshana::portable_math::PortableFloat;
use serde_json::{json, Value};

const ORACLE: &str = "xval/c5a-opnav-v2/oracle_v2.json";
const RESULT: &str = "xval/c5a-opnav-v2/result_v2.json";
const KERNEL: &str = "tests/fixtures/c5a_opnav/de440s_2025-01-01_2029-10-08.bsp";
const MAS_PER_RAD: f64 = 180.0 / std::f64::consts::PI * 3_600_000.0;
const STARS: [(f64, f64); 6] = [
    (0.0, 0.0),
    (60.0, 60.0),
    (120.0, -60.0),
    (180.0, 20.0),
    (240.0, -20.0),
    (300.0, 85.0),
];

fn cam() -> Camera {
    Camera {
        f_px: 5000.0,
        cx: 1024.0,
        cy: 1024.0,
        k1: -0.05,
        k2: 0.01,
        k3: 0.0,
        p1: 1e-4,
        p2: -1e-4,
    }
}

fn radec(a: f64, b: f64) -> [f64; 3] {
    let (sa, ca) = a.to_radians().psin_cos();
    let (sb, cb) = b.to_radians().psin_cos();
    [cb * ca, cb * sa, sb]
}

fn angle_mas(a: [f64; 3], b: [f64; 3]) -> f64 {
    let c = [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ];
    let s = (c[0] * c[0] + c[1] * c[1] + c[2] * c[2]).sqrt();
    s.atan2(a[0] * b[0] + a[1] * b[1] + a[2] * b[2]) * MAS_PER_RAD
}

fn v3(v: &Value) -> [f64; 3] {
    std::array::from_fn(|i| v[i].as_f64().unwrap())
}

/// O5 v2 on one measurement: (worst |a − c| over the row's largest |c|, failing rows).
fn o5_v2(an: &[[f64; 6]; 2], cs: &Value) -> (f64, usize) {
    let (mut worst, mut fails) = (0.0f64, 0);
    for k in 0..2 {
        for (lo, hi) in [(0, 3), (3, 6)] {
            let c: Vec<f64> = (lo..hi).map(|j| cs[k][j].as_f64().unwrap()).collect();
            let big = c.iter().fold(0.0f64, |a, x| a.max(x.abs()));
            let d = (lo..hi)
                .map(|j| (an[k][j] - c[j - lo]).abs())
                .fold(0.0f64, f64::max);
            if big == 0.0 {
                fails += usize::from(d != 0.0);
            } else {
                let r = d / big;
                worst = worst.max(r);
                fails += usize::from(r > 1e-6);
            }
        }
    }
    (worst, fails)
}

/// O5 v2-x: central differences on observer-relative coordinates; the same per-row measure.
fn o5_relative(
    m: &Measurement,
    f: &impl Fn([f64; 3], [f64; 3]) -> [f64; 2],
    rho: [f64; 3],
    dv: [f64; 3],
) -> (f64, usize) {
    let norm = |x: [f64; 3]| (x[0] * x[0] + x[1] * x[1] + x[2] * x[2]).sqrt();
    let (hr, hv) = (1e-6 * norm(rho), 1e-6 * norm(dv));
    let mut fd = [[0.0; 6]; 2];
    for j in 0..6 {
        let (mut rp, mut rm, mut vp, mut vm) = (rho, rho, dv, dv);
        let h = if j < 3 { hr } else { hv };
        if j < 3 {
            rp[j] += h;
            rm[j] -= h;
        } else {
            vp[j - 3] += h;
            vm[j - 3] -= h;
        }
        let (a, b) = (f(rp, vp), f(rm, vm));
        for k in 0..2 {
            fd[k][j] = (a[k] - b[k]) / (2.0 * h);
        }
    }
    let v = json!(fd);
    o5_v2(&m.partials, &v)
}

fn compute() -> Value {
    let o: Value = serde_json::from_str(&std::fs::read_to_string(ORACLE).unwrap()).unwrap();
    let k = KernelEphemeris::open(std::path::Path::new(KERNEL)).unwrap();
    let cam = cam();
    let mut rows = Vec::new();
    for row in o["rows"].as_array().unwrap() {
        let jd = row["jd_tdb"].as_f64().unwrap();
        let ctr = row["centre"].as_i64().unwrap() as i32;
        let d_m = row["d_km"].as_f64().unwrap() * 1e3;
        let (a, b) = (
            row["ra_dec_deg"][0].as_f64().unwrap(),
            row["ra_dec_deg"][1].as_f64().unwrap(),
        );
        let st = k.state(ctr, 0, kshana::jd2::Jd2::new(jd)).unwrap();
        let u = radec(a, b);
        let rho: [f64; 3] = std::array::from_fn(|i| d_m * u[i]);
        let dv = [0.0, 0.0, 1_000.0];
        let r = std::array::from_fn(|i| st[0][i] + rho[i]);
        let v = std::array::from_fn(|i| st[1][i] + dv[i]);
        let name = row["target"].as_str().unwrap();
        let target = match name.strip_prefix("star") {
            Some(i) => {
                let (sa, sb) = STARS[i.parse::<usize>().unwrap()];
                Target::Star(radec(sa, sb))
            }
            None => Target::Body(name.parse().unwrap()),
        };
        let q: [f64; 4] =
            std::array::from_fn(|i| row["quaternion_icrf_to_camera"][i].as_f64().unwrap());
        let m = measure(&k, target, jd, r, v, &cam, q).unwrap();
        let spice = v3(&row["apparent_icrf"]);
        let cv = [
            row["pixel_opencv"][0].as_f64().unwrap(),
            row["pixel_opencv"][1].as_f64().unwrap(),
        ];
        let p3 = project(&cam, q, spice);
        let (worst, fails) = o5_v2(&m.partials, &row["partials_complex_step"]);
        let fr = |rr: [f64; 3], vv: [f64; 3]| {
            let r2 = std::array::from_fn(|i| st[0][i] + rr[i]);
            let v2 = std::array::from_fn(|i| st[1][i] + vv[i]);
            measure(&k, target, jd, r2, v2, &cam, q).unwrap().pixel
        };
        let (xworst, xfails) = o5_relative(&m, &fr, rho, dv);
        rows.push(json!({
            "set": row["set"], "case": row["case"], "target": name,
            "direction_mas": angle_mas(m.apparent, spice),
            "o3_px": (p3[0] - cv[0]).abs().max((p3[1] - cv[1]).abs()),
            "o4_px": (m.pixel[0] - cv[0]).abs().max((m.pixel[1] - cv[1]).abs()),
            "o5v2_worst": worst, "o5v2_failing_rows": fails,
            "o5v2x_worst": xworst, "o5v2x_failing_rows": xfails,
        }));
    }
    let max = |key: &str, set: Option<&str>, star: Option<bool>| {
        rows.iter()
            .filter(|r| set.is_none_or(|s| r["set"] == s))
            .filter(|r| star.is_none_or(|s| r["target"].as_str().unwrap().starts_with("star") == s))
            .map(|r| r[key].as_f64().unwrap())
            .fold(0.0f64, f64::max)
    };
    let sum = |key: &str| rows.iter().map(|r| r[key].as_u64().unwrap()).sum::<u64>();
    let (o1, o2, o3, o4) = (
        max("direction_mas", Some("fresh"), Some(false)),
        max("direction_mas", Some("fresh"), Some(true)),
        max("o3_px", Some("fresh"), None),
        max("o4_px", Some("fresh"), None),
    );
    let o5 = sum("o5v2_failing_rows");
    json!({
        "count": rows.len(),
        "O5v2_worst": max("o5v2_worst", None, None), "O5v2_failing_rows": o5, "O5v2_met": o5 == 0,
        "O5v2x_reported_worst": max("o5v2x_worst", None, None), "O5v2x_reported_failing_rows": sum("o5v2x_failing_rows"),
        "fresh_O1_max_mas": o1, "fresh_O1_met": o1 <= 1.0,
        "fresh_O2_max_mas": o2, "fresh_O2_met": o2 <= 1.0,
        "fresh_O3_max_px": o3, "fresh_O3_met": o3 <= 1e-6,
        "fresh_O4_max_px": o4, "fresh_O4_met": o4 <= 1e-4,
        "rows": rows,
    })
}

#[test]
fn c5a_v2_partials_against_the_complex_step_oracle() {
    let got = compute();
    if std::env::var("KSHANA_C5A_V2_WRITE").is_ok() {
        std::fs::write(RESULT, serde_json::to_string_pretty(&got).unwrap() + "\n").unwrap();
    }
    eprintln!(
        "C5a v2: {} measurements; O5 v2 worst {:.3e} of the row's largest, {} failing rows; O5 v2-x (reported) worst {:.3e}, {} rows; fresh O1 {:.3e} mas, O2 {:.3e} mas, O3 {:.3e} px, O4 {:.3e} px",
        got["count"], got["O5v2_worst"].as_f64().unwrap(), got["O5v2_failing_rows"],
        got["O5v2x_reported_worst"].as_f64().unwrap(), got["O5v2x_reported_failing_rows"],
        got["fresh_O1_max_mas"].as_f64().unwrap(), got["fresh_O2_max_mas"].as_f64().unwrap(),
        got["fresh_O3_max_px"].as_f64().unwrap(), got["fresh_O4_max_px"].as_f64().unwrap()
    );
    assert_eq!(got["count"], 72);
    let mut miss = Vec::new();
    for key in [
        "O5v2_met",
        "fresh_O1_met",
        "fresh_O2_met",
        "fresh_O3_met",
        "fresh_O4_met",
    ] {
        if got[key] != true {
            miss.push(key);
        }
    }
    assert!(miss.is_empty(), "C5a v2 NOT MET: {miss:?}");
    // Pinned (2026-11-09): the recorded result file.
    let rec: Value = serde_json::from_str(&std::fs::read_to_string(RESULT).unwrap()).unwrap();
    for key in ["O5v2_failing_rows", "O5v2x_reported_failing_rows", "count"] {
        assert_eq!(got[key], rec[key], "{key}");
    }
    for key in [
        "O5v2_worst",
        "O5v2x_reported_worst",
        "fresh_O1_max_mas",
        "fresh_O4_max_px",
    ] {
        let (g, r) = (got[key].as_f64().unwrap(), rec[key].as_f64().unwrap());
        assert!(
            (g - r).abs() <= 1e-9 * r.abs().max(1e-30) + 1e-18,
            "{key}: {g} vs {r}"
        );
    }
}
