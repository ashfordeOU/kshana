// SPDX-License-Identifier: AGPL-3.0-only
//! GPS legacy navigation message (LNAV) encoding conformance: Kshana's subframes 1 to 3,
//! decoded by an independent receiver library, RTKLIB.
//!
//! PRE-REGISTRATION (written 2026-10-02 before the harness below was compiled or run on any
//! Kshana output). A NEW comparison and method, not a re-run of
//! `tests/gps_l1ca_gpssdrsim_cross_generator.rs`: that one compared two ENCODERS and found
//! gps-sdr-sim truncating where the broadcast integer needs rounding (finding pinned there);
//! this one feeds Kshana's encoded words to a DECODER and asks whether the IS-GPS-200
//! (Interface Specification GPS 200) parameters come back. Disclosed: it was designed after
//! that finding; RTKLIB's `decode_word` and `decode_subfrm1`..`3` were read to write the
//! harness.
//!
//! QUANTITY. For each satellite: (R1) the parity of all 30 transmitted words as RTKLIB checks
//! it (with the previous word's D29* and D30* and the inversion of the data bits), and the
//! subframe decoding returning subframes 1, 2 and 3 with consistent issue-of-data; (R2) every
//! decoded parameter equal to Kshana's quantised integer times the IS-GPS-200 scale (times
//! the specification's pi, 3.1415926535898, for semicircles), to one unit in the last place;
//! (R3) every decoded parameter within half a quantum of the input value, and the week, clock
//! reference time and ephemeris reference time exact.
//!
//! ORACLE (Library kind): RTKLIB v2.4.2-p13, commit 71db0ffa0d9735697c6adfd06fdf766d0e5ce807,
//! BSD-2-Clause, `decode_word` (rtkcmn.c) and `decode_frame` (rcvraw.c), built and run as a
//! separate program by `tests/fixtures/gps_lnav_rtklib_decode/generate.sh`.
//!
//! INPUTS. The 32 ephemerides of gps-sdr-sim's bundled `brdc0010.22n` as printed in
//! `tests/fixtures/gps_l1ca_gpssdrsim_cross_generator/gpssdrsim_output.json` (inputs only;
//! gps-sdr-sim is not the oracle here), the transmission week and hand-over-word count of that
//! fixture, `LnavConventions::default()`, previous word zero. Kshana's words are written to
//! `kshana_words.txt` by `write_kshana_words` and the strict test first checks that the
//! committed file is what the encoder produces now.
//!
//! TOLERANCE: R1 every word and every subframe; R2 relative difference at most 2^-52; R3 half a
//! quantum (times 1 + 1e-9 for the decimal input), week and times exact. Non-vacuity: 32
//! satellites. Source: the integers and scale factors IS-GPS-200 Tables 20-I and 20-III define;
//! there is no physical tolerance in a bit-exact format.

use kshana::gps_lnav::{encode_subframes, field_values, LnavConventions, LnavEphemeris, GPS_PI};
use serde_json::Value;

const FIX: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/gps_lnav_rtklib_decode"
);
const INPUT: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/gps_l1ca_gpssdrsim_cross_generator/gpssdrsim_output.json"
);

fn num(v: &Value, k: &str) -> f64 {
    v[k].as_f64().unwrap_or_else(|| panic!("field {k}"))
}

/// The inputs: `(prn, ephemeris, HOW count)`.
fn inputs() -> Vec<(u32, LnavEphemeris, u32)> {
    let v: Value =
        serde_json::from_str(&std::fs::read_to_string(INPUT).expect("input")).expect("JSON");
    v["sats"]
        .as_array()
        .unwrap()
        .iter()
        .map(|s| {
            let e = LnavEphemeris {
                week: num(s, "g_week") as u32,
                toc_s: num(s, "toc_sec"),
                toe_s: num(s, "toe_sec"),
                iodc: num(s, "iodc") as u32,
                iode: num(s, "iode") as u32,
                af0: num(s, "af0"),
                af1: num(s, "af1"),
                af2: num(s, "af2"),
                tgd: num(s, "tgd"),
                crs: num(s, "crs"),
                delta_n: num(s, "deltan"),
                m0: num(s, "m0"),
                cuc: num(s, "cuc"),
                e: num(s, "ecc"),
                cus: num(s, "cus"),
                sqrt_a: num(s, "sqrta"),
                cic: num(s, "cic"),
                omega0: num(s, "omg0"),
                cis: num(s, "cis"),
                i0: num(s, "inc0"),
                crc: num(s, "crc"),
                omega: num(s, "aop"),
                omega_dot: num(s, "omgdot"),
                idot: num(s, "idot"),
                health: num(s, "svhlth") as u32,
                code_on_l2: num(s, "codeL2") as u32,
            };
            (num(s, "prn") as u32, e, (num(s, "g0_sec") / 6.0) as u32 + 1)
        })
        .collect()
}

fn kshana_words() -> String {
    let mut out = String::new();
    for (prn, e, tow) in inputs() {
        let w = encode_subframes(&e, &LnavConventions::default(), tow, 0).expect("encode");
        out.push_str(&format!("{prn} 0"));
        for sf in &w {
            for word in sf {
                out.push_str(&format!(" {word}"));
            }
        }
        out.push('\n');
    }
    out
}

/// Regenerate `kshana_words.txt` (run before `generate.sh`).
#[test]
#[ignore = "fixture writer, run by hand"]
fn write_kshana_words() {
    std::fs::write(format!("{FIX}/kshana_words.txt"), kshana_words()).unwrap();
}

/// Field name in RTKLIB's output -> (Kshana field, scale power of two, semicircles,
/// input value, signed width).
fn checks(e: &LnavEphemeris) -> Vec<(&'static str, &'static str, i32, bool, f64, u32)> {
    vec![
        ("tgd", "tgd", -31, false, e.tgd, 8),
        ("f2", "af2", -55, false, e.af2, 8),
        ("f1", "af1", -43, false, e.af1, 16),
        ("f0", "af0", -31, false, e.af0, 22),
        ("crs", "crs", -5, false, e.crs, 16),
        ("deln", "delta_n", -43, true, e.delta_n, 16),
        ("M0", "m0", -31, true, e.m0, 32),
        ("cuc", "cuc", -29, false, e.cuc, 16),
        ("e", "e", -33, false, e.e, 0),
        ("cus", "cus", -29, false, e.cus, 16),
        ("cic", "cic", -29, false, e.cic, 16),
        ("OMG0", "omega0", -31, true, e.omega0, 32),
        ("cis", "cis", -29, false, e.cis, 16),
        ("i0", "i0", -31, true, e.i0, 32),
        ("crc", "crc", -5, false, e.crc, 16),
        ("omg", "omega", -31, true, e.omega, 32),
        ("OMGd", "omega_dot", -43, true, e.omega_dot, 24),
        ("idot", "idot", -43, true, e.idot, 14),
    ]
}

/// The comparison; returns the list of failures (empty on a pass) and the satellite count.
fn compare() -> (Vec<String>, usize) {
    let decoded: Value = serde_json::from_str(
        &std::fs::read_to_string(format!("{FIX}/rtklib_decoded.json")).expect("RTKLIB output"),
    )
    .expect("JSON");
    let sats = decoded["sats"].as_array().expect("sats");
    let mut fail = Vec::new();
    let inputs = inputs();
    for (s, (prn, e, tow)) in sats.iter().zip(&inputs) {
        assert_eq!(num(s, "prn") as u32, *prn);
        // R1.
        if num(s, "parity_ok") as u32 != 30 {
            fail.push(format!(
                "PRN {prn}: {} of 30 words pass RTKLIB parity",
                num(s, "parity_ok")
            ));
        }
        let ret: Vec<u64> = s["ret"]
            .as_array()
            .unwrap()
            .iter()
            .map(|v| v.as_u64().unwrap())
            .collect();
        if ret != [1, 2, 3] {
            fail.push(format!("PRN {prn}: decode_frame returned {ret:?}"));
        }
        let ours = field_values(e, &LnavConventions::default(), *tow).unwrap();
        let int_of = |name: &str, width: u32| -> f64 {
            let raw = ours.iter().find(|(n, _)| *n == name).unwrap().1;
            if width > 0 && raw >> (width - 1) == 1 {
                raw as f64 - 2f64.powi(width as i32)
            } else {
                raw as f64
            }
        };
        for (key, name, p, semi, input, width) in checks(e) {
            let got = num(s, key);
            let mut want = int_of(name, width) * 2f64.powi(p);
            let mut q = 2f64.powi(p);
            if semi {
                want *= GPS_PI;
                q *= GPS_PI;
            }
            // R2.
            if (got - want).abs() > f64::EPSILON * want.abs() {
                fail.push(format!(
                    "PRN {prn} {key}: RTKLIB {got:e}, Kshana integer gives {want:e}"
                ));
            }
            // R3.
            if (got - input).abs() > 0.5 * q * (1.0 + 1e-9) {
                fail.push(format!(
                    "PRN {prn} {key}: decoded {got:e} is not within half a quantum of {input:e}"
                ));
            }
        }
        let sqrt_a = int_of("sqrt_a", 0) * 2f64.powi(-19);
        let a = num(s, "A");
        if (a - sqrt_a * sqrt_a).abs() > f64::EPSILON * a {
            fail.push(format!(
                "PRN {prn} A: RTKLIB {a:e}, Kshana integer gives {:e}",
                sqrt_a * sqrt_a
            ));
        }
        if (a.sqrt() - e.sqrt_a).abs() > 0.5 * 2f64.powi(-19) * (1.0 + 1e-9) {
            fail.push(format!("PRN {prn} sqrt A not within half a quantum"));
        }
        for (key, want) in [
            ("week", e.week as f64),
            ("toc", e.toc_s),
            ("toes", e.toe_s),
            ("iodc", e.iodc as f64),
            ("iode", e.iode as f64),
            ("svh", e.health as f64),
            ("code", e.code_on_l2 as f64),
        ] {
            if num(s, key) != want {
                fail.push(format!(
                    "PRN {prn} {key}: RTKLIB {}, input {want}",
                    num(s, key)
                ));
            }
        }
    }
    (fail, sats.len())
}

#[test]
#[ignore = "FINDING (run 2026-10-02 on ca5f0142 + fixture): R1 parity 960 of 960 words and subframes 1-3 decoded for 32 of 32 satellites; R3 every parameter within half a quantum, week and times exact; R2 fails on 41 values, all af1, delta-n and IDOT, by 1 to 4 units in the last place: RTKLIB defines P2_43 as the decimal 1.136868377216160E-13, 2.6e-16 relative from 2^-43, above the registered 2^-52. Pinned by rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43"]
fn kshana_lnav_subframes_decode_in_rtklib_to_the_broadcast_parameters() {
    let committed = std::fs::read_to_string(format!("{FIX}/kshana_words.txt")).expect("words");
    assert_eq!(
        committed,
        kshana_words(),
        "kshana_words.txt is not the encoder's current output"
    );
    let (fail, n) = compare();
    eprintln!("{n} satellites; {} failures", fail.len());
    for f in &fail {
        eprintln!("  {f}");
    }
    assert_eq!(n, 32, "non-vacuity");
    assert!(fail.is_empty());
}

/// The finding of the strict test, pinned on the committed fixtures: every word passes RTKLIB's
/// parity, every subframe decodes, every parameter is within half a quantum of its input, and
/// the only R2 differences are the three fields RTKLIB scales by its decimal `P2_43`; dividing
/// RTKLIB's value by that decimal (and by the semicircle constant where it applies) returns
/// exactly Kshana's integer in every one of them.
#[test]
fn rtklib_recovers_every_integer_and_differs_only_by_its_decimal_two_to_the_minus_43() {
    const RTKLIB_P2_43: f64 = 1.136868377216160E-13;
    let committed = std::fs::read_to_string(format!("{FIX}/kshana_words.txt")).expect("words");
    assert_eq!(committed, kshana_words());
    let (fail, n) = compare();
    assert_eq!(n, 32);
    assert_eq!(fail.len(), 41, "{fail:#?}");
    for f in &fail {
        assert!(
            [" f1: ", " deln: ", " idot: "]
                .iter()
                .any(|k| f.contains(k)),
            "unexpected failure: {f}"
        );
    }
    let decoded: Value = serde_json::from_str(
        &std::fs::read_to_string(format!("{FIX}/rtklib_decoded.json")).unwrap(),
    )
    .unwrap();
    for (s, (prn, e, tow)) in decoded["sats"].as_array().unwrap().iter().zip(inputs()) {
        let ours = field_values(&e, &LnavConventions::default(), tow).unwrap();
        for (key, name, semi, width) in [
            ("f1", "af1", false, 16u32),
            ("deln", "delta_n", true, 16),
            ("idot", "idot", true, 14),
        ] {
            let raw = ours.iter().find(|(n, _)| *n == name).unwrap().1;
            let k = if raw >> (width - 1) == 1 {
                raw as f64 - 2f64.powi(width as i32)
            } else {
                raw as f64
            };
            let scale = if semi {
                RTKLIB_P2_43 * GPS_PI
            } else {
                RTKLIB_P2_43
            };
            assert_eq!((num(s, key) / scale).round(), k, "PRN {prn} {key}");
            assert!(
                (num(s, key) - k * scale).abs() <= 2.0 * f64::EPSILON * num(s, key).abs(),
                "PRN {prn} {key}"
            );
        }
    }
}
