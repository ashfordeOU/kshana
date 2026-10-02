// SPDX-License-Identifier: AGPL-3.0-only
//! GPS legacy navigation message (LNAV) encoding conformance at the integer level: Kshana's
//! subframes 1 to 3 for a broadcast-ephemeris file not used before, parsed by RTKLIB, encoded
//! by Kshana, decoded by RTKLIB.
//!
//! PRE-REGISTRATION (written 2026-10-02 before the input file was downloaded and before the
//! harness was built or run). A NEW comparison with NEW inputs. DISCLOSED: it follows two
//! findings on the encoder (`tests/gps_l1ca_gpssdrsim_cross_generator.rs`, gps-sdr-sim
//! truncating; `tests/gps_lnav_rtklib_decode_oracle.rs`, RTKLIB's decimal 2^-43 constant failing
//! a one-ulp bar on SCALED values while parity, decoding and half-quantum agreement all held).
//! The quantity here is the broadcast INTEGER, which IS-GPS-200 (Interface Specification GPS
//! 200) defines exactly, so the oracle's decimal constants do not enter; the bar is not a
//! loosened version of the earlier one, it is a different quantity on unseen data.
//!
//! INPUTS. The IGS (International GNSS Service) daily broadcast navigation file for 2 March 2025,
//! `BRDC00IGS_R_20250610000_01D_MN.rnx` (from the BKG mirror of the IGS archive), parsed by
//! RTKLIB's `readrnx`; for each GPS PRN 1 to 32 present, the ephemeris with the earliest t_oe.
//! Kshana encodes from the values RTKLIB parsed (printed with 17 digits), with the week and t_oe
//! of that ephemeris as transmission time (hand-over-word count t_oe/6 + 1),
//! `LnavConventions::default()`, previous word zero.
//!
//! ORACLE (Library kind): RTKLIB v2.4.2-p13, commit 71db0ffa0d9735697c6adfd06fdf766d0e5ce807,
//! BSD-2-Clause, `readrnx`, `decode_word`, `decode_frame`, run as a separate program
//! (`tests/fixtures/gps_lnav_rtklib_integer/harness.c`, `generate.sh`). The decoded integer of a
//! field is RTKLIB's decoded value divided by RTKLIB's own scale constant, rounded.
//!
//! CRITERIA (fixed here): I1 every word passes RTKLIB's parity and subframes 1, 2, 3 decode for
//! every satellite; I2 every computed field's decoded integer EQUALS Kshana's (`field_values`),
//! and week, t_oc, t_oe, IODE, IODC, health and codes-on-L2 equal the input; I3 every scaled
//! input value lies within half a quantum of Kshana's integer times the IS-GPS-200 scale (the
//! quantisation is round-to-nearest). Tolerance: exact; none is physical in a bit format.
//! Non-vacuity: at least 25 satellites. If I1 to I3 hold, the row is promotable on this test.

use kshana::gps_lnav::{encode_subframes, field_values, LnavConventions, LnavEphemeris, GPS_PI};
use serde_json::Value;

const FIX: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/gps_lnav_rtklib_integer"
);

fn num(v: &Value, k: &str) -> f64 {
    v[k].as_f64().unwrap_or_else(|| panic!("field {k}"))
}

/// The inputs as RTKLIB parsed them: `(prn, ephemeris, HOW count)`.
fn inputs() -> Vec<(u32, LnavEphemeris, u32)> {
    let v: Value = serde_json::from_str(
        &std::fs::read_to_string(format!("{FIX}/rtklib_ephemerides.json")).expect("inputs"),
    )
    .expect("JSON");
    v["sats"]
        .as_array()
        .unwrap()
        .iter()
        .map(|s| {
            let e = LnavEphemeris {
                week: num(s, "week") as u32,
                toc_s: num(s, "toc"),
                toe_s: num(s, "toe"),
                iodc: num(s, "iodc") as u32,
                iode: num(s, "iode") as u32,
                af0: num(s, "f0"),
                af1: num(s, "f1"),
                af2: num(s, "f2"),
                tgd: num(s, "tgd"),
                crs: num(s, "crs"),
                delta_n: num(s, "deln"),
                m0: num(s, "M0"),
                cuc: num(s, "cuc"),
                e: num(s, "e"),
                cus: num(s, "cus"),
                sqrt_a: num(s, "sqrtA"),
                cic: num(s, "cic"),
                omega0: num(s, "OMG0"),
                cis: num(s, "cis"),
                i0: num(s, "i0"),
                crc: num(s, "crc"),
                omega: num(s, "omg"),
                omega_dot: num(s, "OMGd"),
                idot: num(s, "idot"),
                health: num(s, "svh") as u32,
                code_on_l2: num(s, "code") as u32,
            };
            let tow = (num(s, "toe") / 6.0) as u32 + 1;
            (num(s, "prn") as u32, e, tow)
        })
        .collect()
}

fn kshana_words() -> String {
    let mut out = String::new();
    for (prn, e, tow) in inputs() {
        let w = encode_subframes(&e, &LnavConventions::default(), tow, 0).expect("encode");
        out.push_str(&format!("{prn} 0"));
        for word in w.iter().flatten() {
            out.push_str(&format!(" {word}"));
        }
        out.push('\n');
    }
    out
}

/// Regenerate `kshana_words.txt` (between `generate.sh parse` and `generate.sh decode`).
#[test]
#[ignore = "fixture writer, run by hand"]
fn write_kshana_words() {
    std::fs::write(format!("{FIX}/kshana_words.txt"), kshana_words()).unwrap();
}

/// `(Kshana field, scale power of two, semicircles, signed width (0 unsigned), input value)`.
fn scaled(e: &LnavEphemeris) -> Vec<(&'static str, i32, bool, u32, f64)> {
    vec![
        ("tgd", -31, false, 8, e.tgd),
        ("af2", -55, false, 8, e.af2),
        ("af1", -43, false, 16, e.af1),
        ("af0", -31, false, 22, e.af0),
        ("crs", -5, false, 16, e.crs),
        ("delta_n", -43, true, 16, e.delta_n),
        ("m0", -31, true, 32, e.m0),
        ("cuc", -29, false, 16, e.cuc),
        ("e", -33, false, 0, e.e),
        ("cus", -29, false, 16, e.cus),
        ("sqrt_a", -19, false, 0, e.sqrt_a),
        ("cic", -29, false, 16, e.cic),
        ("omega0", -31, true, 32, e.omega0),
        ("cis", -29, false, 16, e.cis),
        ("i0", -31, true, 32, e.i0),
        ("crc", -5, false, 16, e.crc),
        ("omega", -31, true, 32, e.omega),
        ("omega_dot", -43, true, 24, e.omega_dot),
        ("idot", -43, true, 14, e.idot),
    ]
}

/// The comparison: failures (empty on a pass) and the satellite count.
fn compare() -> (Vec<String>, usize) {
    let decoded: Value = serde_json::from_str(
        &std::fs::read_to_string(format!("{FIX}/rtklib_decoded.json")).expect("RTKLIB output"),
    )
    .expect("JSON");
    let sats = decoded["sats"].as_array().expect("sats");
    let inputs = inputs();
    assert_eq!(sats.len(), inputs.len());
    let mut fail = Vec::new();
    for (s, (prn, e, tow)) in sats.iter().zip(&inputs) {
        assert_eq!(num(s, "prn") as u32, *prn);
        if num(s, "parity_ok") as u32 != 30 {
            fail.push(format!(
                "PRN {prn}: {} of 30 words pass parity",
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
        for (name, p, semi, width, input) in scaled(e) {
            let raw = ours.iter().find(|(n, _)| *n == name).unwrap().1;
            let k = if width > 0 && raw >> (width - 1) == 1 {
                raw as f64 - 2f64.powi(width as i32)
            } else {
                raw as f64
            };
            // I2.
            if num(s, name) != k {
                fail.push(format!(
                    "PRN {prn} {name}: RTKLIB integer {}, Kshana {k}",
                    num(s, name)
                ));
            }
            // I3.
            let mut q = 2f64.powi(p);
            if semi {
                q *= GPS_PI;
            }
            if (k * q - input).abs() > 0.5 * q * (1.0 + 1e-9) {
                fail.push(format!(
                    "PRN {prn} {name}: {input:e} is not within half a quantum of {k}"
                ));
            }
        }
        for (key, want) in [
            ("week", e.week as f64),
            ("toc", e.toc_s),
            ("toes", e.toe_s),
            ("iode", e.iode as f64),
            ("iodc", e.iodc as f64),
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
#[ignore = "pre-registered; not yet run"]
fn kshana_lnav_integers_decode_in_rtklib_from_an_unseen_broadcast_file() {
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
    assert!(n >= 25, "non-vacuity: {n}");
    assert!(fail.is_empty());
}
