// SPDX-License-Identifier: AGPL-3.0-only
//! CAP-06 (a): the `jamming` kind's optional `[crpa]` section against the bars of
//! `docs/design/evidence/crpa-jamming/PREREGISTRATION.md` (committed before the code existed).
//!
//! A2: a one-element array is no array. A3: an independent numpy recomputation
//! (`xval/crpa-jamming/oracle.py`, which shares no code with `crate::crpa`) of every link's array
//! noise gain, jammer gain and effective C/N0 on the `jamming-demo` geometry with a 4-element
//! square array, from the per-link look vectors and element-level J/S and C/N0 exported by
//! `export_crpa_oracle_inputs`; the recorded verdict is NOT MET on the MVDR jammer gain only
//! (finding F1 of `RESULTS.md`), and the test asserts it. A4: MVDR tends to the null-steering result at high JNR. A1
//! (additivity) is the unchanged jamming tests and goldens plus the before/after scenario run
//! recorded in `docs/design/evidence/crpa-jamming/RESULTS.md`.
//!
//! PIN-SCOPE:    the CRPA beam gains and effective C/N0 of the jamming-demo links against the
//!               committed numpy oracle output (xval/crpa-jamming/expected.json).
//! PIN-EXCLUDES: the geometry itself (the existing jamming tests pin it).

use kshana::frames::{geodetic_to_ecef, look_angles, teme_to_ecef, Geodetic};
use kshana::jamming::{
    j_over_s_db, noise_density_dbw_per_hz, q_factor, run_jamming, rx_antenna_gain_db,
    JammingResult, JammingScenario, C_M_PER_S,
};
use kshana::walker::walker_epoch_jd;
use std::collections::BTreeMap;

const RECORDED_A3_OVER: [(&str, &str, usize); 6] = [
    ("mvdr", "cn0_effective", 0),
    ("mvdr", "jammer gain", 202),
    ("mvdr", "noise gain", 0),
    ("null-steering", "cn0_effective", 0),
    ("null-steering", "jammer gain", 0),
    ("null-steering", "noise gain", 0),
];

const DEMO: &str = include_str!("../scenarios/jamming-demo.toml");
const SQUARE: &str = "[[0.0, 0.0, 0.0], [0.095, 0.0, 0.0], [0.0, 0.095, 0.0], [0.095, 0.095, 0.0]]";

fn scenario(extra: &str) -> JammingScenario {
    toml::from_str(&format!("{DEMO}\n{extra}")).unwrap()
}

fn crpa(elements: &str, weighting: &str) -> String {
    format!("[crpa]\nelements_enu_m = {elements}\nweighting = \"{weighting}\"\n")
}

fn run(s: &JammingScenario) -> JammingResult {
    run_jamming(s).unwrap()
}

/// Every link of a run, keyed by (epoch time in ms, PRN).
fn links(r: &JammingResult) -> BTreeMap<(i64, usize), &kshana::jamming::SatLink> {
    r.epochs
        .iter()
        .flat_map(|e| {
            e.sats
                .iter()
                .map(move |l| (((e.t * 1000.0).round() as i64, l.prn), l))
        })
        .collect()
}

/// A2: one element at the origin, either weighting, equals the run without the section.
#[test]
fn a2_one_element_is_no_array() {
    let plain = run(&scenario(""));
    for w in ["null-steering", "mvdr"] {
        let one = run(&scenario(&crpa("[[0.0, 0.0, 0.0]]", w)));
        let (a, b) = (links(&plain), links(&one));
        assert_eq!(a.len(), b.len());
        for (k, x) in &a {
            let y = b[k];
            for (what, p, q) in [
                ("js", x.js_db, y.js_db),
                ("cn0_nominal", x.cn0_nominal_dbhz, y.cn0_nominal_dbhz),
                ("cn0_effective", x.cn0_effective_dbhz, y.cn0_effective_dbhz),
            ] {
                assert!((p - q).abs() <= 1e-12, "{w} {k:?} {what}: {p} vs {q}");
            }
            assert_eq!(x.status, y.status);
        }
    }
}

/// The JNR per element (linear) of the demo jammer over twice the chip rate, and the jammer's
/// unit ENU look vector.
fn jammer_jnr_and_dir(s: &JammingScenario) -> (f64, [f64; 3]) {
    let station = Geodetic {
        lat_rad: s.receiver.lat_deg.to_radians(),
        lon_rad: s.receiver.lon_deg.to_radians(),
        alt_m: s.receiver.alt_m,
    };
    let j = s.jammer.as_ref().unwrap();
    let st = geodetic_to_ecef(station);
    let d = ((0..3)
        .map(|i| (st[i] - j.position_ecef_m[i]).powi(2))
        .sum::<f64>())
    .sqrt();
    let look = look_angles(station, j.position_ecef_m);
    let jam_dbw = j_over_s_db(
        j.power_dbw,
        j.gain_dbi,
        rx_antenna_gain_db(look.el_rad),
        d,
        s.freq_hz,
        0.0,
        0.0,
    );
    let noise = noise_density_dbw_per_hz(s.temp_k) + 10.0 * (2.0 * s.chip_rate_hz).log10();
    (
        10f64.powf((jam_dbw - noise) / 10.0),
        enu(look.az_rad, look.el_rad),
    )
}

fn enu(az: f64, el: f64) -> [f64; 3] {
    [az.sin() * el.cos(), az.cos() * el.cos(), el.sin()]
}

/// Writes `xval/crpa-jamming/inputs.json` for the numpy oracle: the geometry and the
/// element-level J/S and nominal C/N0 of every link (the array does not change those).
#[test]
#[ignore = "fixture export for xval/crpa-jamming/oracle.py; run on demand"]
fn export_crpa_oracle_inputs() {
    let s = scenario("");
    let r = run(&s);
    let station = Geodetic {
        lat_rad: s.receiver.lat_deg.to_radians(),
        lon_rad: s.receiver.lon_deg.to_radians(),
        alt_m: s.receiver.alt_m,
    };
    let sats = s.constellation.satellites();
    let (jnr, jdir) = jammer_jnr_and_dir(&s);
    let mut out = Vec::new();
    for e in &r.epochs {
        let jd = walker_epoch_jd() + e.t / 86_400.0;
        for l in &e.sats {
            let ecef = teme_to_ecef(sats[l.prn].position_eci(e.t), jd);
            let look = look_angles(station, ecef);
            out.push(serde_json::json!({
                "t": e.t, "prn": l.prn,
                "sv_unit_enu": enu(look.az_rad, look.el_rad),
                "js_db": l.js_db, "cn0_nominal_dbhz": l.cn0_nominal_dbhz,
            }));
        }
    }
    let elements: serde_json::Value = serde_json::from_str(SQUARE).unwrap();
    let j = s.jammer.as_ref().unwrap();
    let doc = serde_json::json!({
        "elements_enu_m": elements, "lambda_m": C_M_PER_S / s.freq_hz,
        "jammer_unit_enu": jdir, "jnr_linear": jnr,
        "q": q_factor(&j.jammer_type, j.q_override), "chip_rate_hz": s.chip_rate_hz,
        "links": out,
    });
    let path = concat!(env!("CARGO_MANIFEST_DIR"), "/xval/crpa-jamming/inputs.json");
    std::fs::write(path, serde_json::to_string_pretty(&doc).unwrap()).unwrap();
}

/// A3: every link's array noise gain, jammer gain and effective C/N0 within 1e-9 dB of the
/// independent numpy recomputation (for null-steering the jammer gain only below −200 dB).
/// Returns, per weighting and quantity, the worst difference and the links over the bar.
fn a3_grade() -> BTreeMap<(&'static str, &'static str), (f64, usize, usize)> {
    let expected: serde_json::Value =
        serde_json::from_str(include_str!("../xval/crpa-jamming/expected.json")).unwrap();
    let mut grade = BTreeMap::new();
    for w in ["null-steering", "mvdr"] {
        let r = run(&scenario(&crpa(SQUARE, w)));
        let got = links(&r);
        let rows = expected["weightings"][w].as_array().unwrap();
        assert_eq!(rows.len(), got.len(), "{w}: link count");
        for row in rows {
            let key = (
                (row["t"].as_f64().unwrap() * 1000.0).round() as i64,
                row["prn"].as_u64().unwrap() as usize,
            );
            let l = got[&key];
            let b = l.crpa.as_ref().expect("a crpa block");
            let f = |k: &str| row[k].as_f64().unwrap();
            let mut diffs = vec![
                (
                    "noise gain",
                    (b.array_noise_gain_db - f("array_noise_gain_db")).abs(),
                ),
                (
                    "cn0_effective",
                    (l.cn0_effective_dbhz - f("cn0_effective_dbhz")).abs(),
                ),
            ];
            if w == "mvdr" {
                diffs.push((
                    "jammer gain",
                    (b.jammer_gain_db - f("jammer_gain_db")).abs(),
                ));
            } else {
                // The null-steering jammer gain is graded only as a numerical null.
                let both = b.jammer_gain_db < -200.0 && f("jammer_gain_db") < -200.0;
                diffs.push(("jammer gain", if both { 0.0 } else { f64::INFINITY }));
            }
            for (what, d) in diffs {
                let e = grade.entry((w, what)).or_insert((0.0f64, 0usize, 0usize));
                e.0 = e.0.max(d);
                e.1 += usize::from(d > 1e-9);
                e.2 += 1;
            }
        }
    }
    grade
}

/// A3 verdict as recorded (`docs/design/evidence/crpa-jamming/RESULTS.md`): MET on the noise gain and effective C/N0 under both
/// weightings and on the null-steering jammer null; NOT MET on the MVDR jammer gain, where the
/// deep partial nulls lose digits to cancellation in both implementations.
#[test]
fn a3_verdict_is_the_recorded_one() {
    let g = a3_grade();
    for ((w, what), (worst, over, n)) in &g {
        eprintln!("A3 {w} {what}: {over} of {n} links over 1e-9 dB, worst {worst:.3e} dB");
    }
    let over: Vec<(&str, &str, usize)> = g.iter().map(|((w, q), v)| (*w, *q, v.1)).collect();
    assert_eq!(over, RECORDED_A3_OVER, "the A3 verdict moved");
}

/// A4: at a JNR of 80 dB per element, MVDR is within 0.1 dB of null-steering on every link.
#[test]
fn a4_mvdr_tends_to_the_null_at_high_jnr() {
    let base = scenario("");
    let (jnr, _) = jammer_jnr_and_dir(&base);
    let raise = 80.0 - 10.0 * jnr.log10();
    let with_power = |w: &str| {
        let mut s = scenario(&crpa(SQUARE, w));
        s.jammer.as_mut().unwrap().power_dbw += raise;
        run(&s)
    };
    let (m, z) = (with_power("mvdr"), with_power("null-steering"));
    let (lm, lz) = (links(&m), links(&z));
    let mut worst = 0.0f64;
    for (k, x) in &lm {
        worst = worst.max((x.cn0_effective_dbhz - lz[k].cn0_effective_dbhz).abs());
    }
    eprintln!(
        "A4: JNR raised by {raise:.1} dB to 80 dB; worst MVDR - null difference {worst:.3e} dB"
    );
    assert!(worst <= 0.1, "A4 missed: {worst} dB");
}

/// A1 (units): the `crpa` block's units are emitted only with the section, so the units table
/// of a run without it is the one from before the section existed.
#[test]
fn a1_crpa_units_only_with_the_section() {
    let units = |extra: &str| {
        let out = kshana::api::run_toml(&format!("{DEMO}\n{extra}")).unwrap();
        let v: serde_json::Value = serde_json::from_str(&out.json).unwrap();
        v["units"].clone()
    };
    let (plain, with) = (units(""), units(&crpa(SQUARE, "mvdr")));
    for p in [
        "epochs[].sats[].crpa.array_noise_gain_db",
        "epochs[].sats[].crpa.jammer_gain_db",
    ] {
        assert!(plain.get(p).is_none(), "{p} without the section");
        assert_eq!(with[p]["unit"], "dB", "{p} with the section");
    }
}

/// An invalid `[crpa]` section is an error through the public API too, not a silent
/// conventional beam.
#[test]
fn an_invalid_crpa_section_is_an_error_through_the_api() {
    for bad in [
        crpa(SQUARE, "conventional"),
        crpa("[]", "mvdr"),
        format!("{}bandwidth_mhz = 0.0\n", crpa(SQUARE, "mvdr")),
    ] {
        let err = kshana::api::run_toml(&format!("{DEMO}\n{bad}"))
            .err()
            .unwrap_or_else(|| panic!("accepted: {bad}"));
        assert!(err.contains("crpa"), "{err}");
    }
}
