// SPDX-License-Identifier: AGPL-3.0-only
//! C5a, the optical-navigation measurement model against SPICE and OpenCV
//! (`docs/design/evidence/c5a-optical-navigation-model/PREREGISTRATION.md`; readings `xval/c5a-opnav/README.md`).
//!
//! Computes O1 to O5 on the 36 oracle rows from the committed de440s cut, and asserts the recorded verdicts in
//! `xval/c5a-opnav/result.json`. The scored run wrote that file once (`KSHANA_C5A_WRITE=1`).

use kshana::ephem_provider::KernelEphemeris;
use kshana::opnav::{measure, project, Camera, Measurement, Target};
use kshana::portable_math::PortableFloat;
use serde_json::{json, Value};

const ORACLE: &str = "xval/c5a-opnav/oracle.json";
const RESULT: &str = "xval/c5a-opnav/result.json";
const KERNEL: &str = "tests/fixtures/c5a_opnav/de440s_2025-01-01_2029-07-02.bsp";
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

/// The worst O5 element: (worst relative difference over the elements judged relatively, worst absolute
/// difference over the elements judged absolutely, the number of elements that fail reading 9).
fn o5(
    m: &Measurement,
    f: &impl Fn([f64; 3], [f64; 3]) -> [f64; 2],
    r: [f64; 3],
    v: [f64; 3],
    steps: (f64, f64),
) -> (f64, f64, usize) {
    let mut fd = [[0.0; 6]; 2];
    for j in 0..6 {
        let h = if j < 3 { steps.0 } else { steps.1 };
        let (mut rp, mut rm, mut vp, mut vm) = (r, r, v, v);
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
    let (mut rel, mut abs, mut fails) = (0.0f64, 0.0f64, 0);
    for (row, an) in fd.iter().zip(&m.partials) {
        let big = row.iter().fold(0.0f64, |a, x| a.max(x.abs()));
        for (f, p) in row.iter().zip(an) {
            let d = (p - f).abs();
            if f.abs() < 1e-6 * big {
                abs = abs.max(d);
                fails += usize::from(d > 1e-12);
            } else {
                let x = d / f.abs();
                rel = rel.max(x);
                fails += usize::from(x > 1e-6);
            }
        }
    }
    (rel, abs, fails)
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
        let r = std::array::from_fn(|i| st[0][i] + d_m * u[i]);
        let v = [st[1][0], st[1][1], st[1][2] + 1_000.0];
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
        let f =
            |rr: [f64; 3], vv: [f64; 3]| measure(&k, target, jd, rr, vv, &cam, q).unwrap().pixel;
        // O5 at the registered steps (1 m, 1 mm/s), then a diagnostic with no bar at 1 km and 1 m/s, added after
        // the scored run to separate round-off in the differences from error in the partials.
        let (rel, abs, fails) = o5(&m, &f, r, v, (1.0, 1e-3));
        let (drel, dabs, dfails) = o5(&m, &f, r, v, (1e3, 1.0));
        rows.push(json!({
            "case": row["case"], "target": name,
            "direction_mas": angle_mas(m.apparent, spice),
            "o3_px": (p3[0] - cv[0]).abs().max((p3[1] - cv[1]).abs()),
            "o4_px": (m.pixel[0] - cv[0]).abs().max((m.pixel[1] - cv[1]).abs()),
            "o5_max_rel": rel, "o5_max_abs": abs, "o5_fails": fails,
            "diag_1km_max_rel": drel, "diag_1km_max_abs": dabs, "diag_1km_fails": dfails,
        }));
    }
    let max = |key: &str, star: Option<bool>| {
        rows.iter()
            .filter(|r| star.is_none_or(|s| r["target"].as_str().unwrap().starts_with("star") == s))
            .map(|r| r[key].as_f64().unwrap())
            .fold(0.0f64, f64::max)
    };
    let fails: u64 = rows.iter().map(|r| r["o5_fails"].as_u64().unwrap()).sum();
    let dfails: u64 = rows
        .iter()
        .map(|r| r["diag_1km_fails"].as_u64().unwrap())
        .sum();
    let (o1, o2, o3, o4) = (
        max("direction_mas", Some(false)),
        max("direction_mas", Some(true)),
        max("o3_px", None),
        max("o4_px", None),
    );
    json!({
        "count": rows.len(),
        "O1_max_mas": o1, "O1_met": o1 <= 1.0,
        "O2_max_mas": o2, "O2_met": o2 <= 1.0,
        "O3_max_px": o3, "O3_met": o3 <= 1e-6,
        "O4_max_px": o4, "O4_met": o4 <= 1e-4,
        "O5_max_rel": max("o5_max_rel", None), "O5_max_abs": max("o5_max_abs", None),
        "O5_failing_elements": fails, "O5_met": fails == 0,
        "diagnostic_no_bar_1km_1mps": {
            "max_rel": max("diag_1km_max_rel", None), "max_abs": max("diag_1km_max_abs", None),
            "failing_elements_under_reading_9": dfails,
        },
        "rows": rows,
    })
}

#[test]
fn c5a_recorded_verdicts() {
    let got = compute();
    if std::env::var("KSHANA_C5A_WRITE").is_ok() {
        std::fs::write(RESULT, serde_json::to_string_pretty(&got).unwrap() + "\n").unwrap();
    }
    let rec: Value = serde_json::from_str(&std::fs::read_to_string(RESULT).unwrap()).unwrap();
    assert_eq!(got["count"], 36);
    for key in ["O1_met", "O2_met", "O3_met", "O4_met", "O5_met"] {
        assert_eq!(got[key], rec[key], "{key}");
    }
    for key in [
        "O1_max_mas",
        "O2_max_mas",
        "O3_max_px",
        "O4_max_px",
        "O5_max_rel",
    ] {
        let (a, b) = (got[key].as_f64().unwrap(), rec[key].as_f64().unwrap());
        // The same arithmetic on every platform up to the last bits of the kernel reader and libm.
        assert!(
            (a - b).abs() <= 1e-3 * b.abs().max(1e-15),
            "{key}: {a} vs recorded {b}"
        );
    }
}
