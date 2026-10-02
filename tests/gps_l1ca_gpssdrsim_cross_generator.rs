// SPDX-License-Identifier: AGPL-3.0-only
//! GPS L1 C/A (coarse/acquisition) cross-generator conformance: the spreading codes and the
//! legacy navigation message (LNAV) bits Kshana generates, against gps-sdr-sim.
//!
//! PRE-REGISTRATION (written 2026-10-02 before the oracle harness was compiled or run and
//! before any Kshana value below was computed; the engine, `kshana::gps_lnav` and
//! `kshana::sdr::CaCode`, was committed beforehand with unit tests on hand-made cases only).
//!
//! QUANTITY. (A) The 1023-chip C/A code of PRN (pseudorandom noise number) 1 to 32. (B) Every
//! IS-GPS-200 (Interface Specification GPS 200) field of LNAV subframes 1 to 3 that is computed
//! from the ephemeris or the transmission time: preamble, hand-over-word (HOW) time-of-week
//! count and subframe identifier, week number, codes on L2, health, issue of data clock and
//! ephemeris, group delay, clock reference time and the three clock coefficients, and the
//! sixteen orbit parameters, each as the integer the specification's scale factor and width
//! make of it. (C) The six parity bits of every transmitted word (IS-GPS-200 Table 20-XIV, with
//! D29* and D30* of the previous word and the inversion of the data bits after D30* = 1).
//!
//! ORACLE (Library kind of docs/VALIDATION.md): gps-sdr-sim by Takuji Ebinuma, MIT licence,
//! <https://github.com/osqzss/gps-sdr-sim>, commit 28ca29a6719475195e3aabd5930c4ed02d67190f
//! (2025-01-07), built and run as a separate program through
//! `tests/fixtures/gps_l1ca_gpssdrsim_cross_generator/harness.c` (`generate.sh` there clones,
//! builds and runs it). Its own `codegen`, `readRinexNavAll`, `eph2sbf` and `generateNavMsg`
//! produce the codes and the transmitted words; Kshana's code is not involved.
//!
//! INPUTS. gps-sdr-sim's bundled broadcast ephemeris file `brdc0010.22n` (RINEX, Receiver
//! Independent Exchange Format, version 2; 1 January 2022). The first ephemeris set
//! `readRinexNavAll` returns, every valid satellite in it; transmission time = the t_oe of the
//! first valid satellite of that set, which `generateNavMsg` aligns down to a 30 s frame. The
//! harness prints the ephemeris values gps-sdr-sim parsed with 17 significant digits; Kshana
//! encodes from exactly those values, so the RINEX parse is not part of the comparison. Kshana's
//! HOW count for subframe 1 is the aligned time / 6 s + 1, the convention IS-GPS-200 gives
//! (the count of the next subframe's start).
//!
//! TOLERANCE: none. These are integers the specification defines; (A), (B) and (C) must agree
//! in every bit: zero differing chips in 32 x 1023, zero differing fields, zero differing parity
//! bits. Non-vacuity: at least 8 satellites in the set.
//!
//! REPORTED, NOT GATING. (D) The full transmitted subframes 1 to 3 with Kshana's operator
//! conventions all zero (`LnavConventions::default()`: TLM message, integrity, alert,
//! anti-spoof, user range accuracy index, L2 P flag, fit flag, age of data offset, reserved
//! bits): the count of differing bits and the fields they fall in. Those fields are operator
//! choices, not computed quantities, and gps-sdr-sim's ephemeris structure does not carry the
//! user range accuracy, fit interval or L2 P flag, so no claim rests on them.
//!
//! DISCLOSURE. Before writing this, `gpssim.h` (structures and constants) and the bodies of
//! `codegen` and `generateNavMsg` were read to write the harness; the bodies of `eph2sbf` and
//! `computeChecksum` were not read. Kshana's encoder rounds to nearest; it was written from
//! IS-GPS-200 and committed (gps_lnav) before any of gps-sdr-sim was read.

use kshana::gps_lnav::{
    decode_fields, encode_subframes, field_values, parity, source_data, LnavConventions,
    LnavEphemeris, FIELDS,
};
use kshana::sdr::CaCode;
use serde_json::Value;

const FIX: &str = concat!(
    env!("CARGO_MANIFEST_DIR"),
    "/tests/fixtures/gps_l1ca_gpssdrsim_cross_generator/gpssdrsim_output.json"
);

fn load() -> Value {
    let text = std::fs::read_to_string(FIX).expect("gps-sdr-sim output fixture");
    serde_json::from_str(&text).expect("JSON")
}

fn num(v: &Value, k: &str) -> f64 {
    v[k].as_f64().unwrap_or_else(|| panic!("field {k}"))
}

fn ephemeris(s: &Value) -> LnavEphemeris {
    LnavEphemeris {
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
    }
}

fn words(s: &Value) -> Vec<u32> {
    s["dwrd"]
        .as_array()
        .expect("dwrd")
        .iter()
        .map(|w| w.as_u64().expect("word") as u32)
        .collect()
}

/// The comparison, returning `(chip differences, field differences, parity differences,
/// satellites, full-frame differing bits with the fields they fall in)`.
fn compare(o: &Value) -> (usize, Vec<String>, usize, usize, Vec<String>) {
    let mut chip_diff = 0;
    for (k, ca) in o["ca"].as_array().expect("ca").iter().enumerate() {
        let prn = (k + 1) as u8;
        let ours = CaCode::new(prn).expect("prn");
        let theirs: Vec<u8> = ca
            .as_array()
            .unwrap()
            .iter()
            .map(|c| c.as_u64().unwrap() as u8)
            .collect();
        assert_eq!(theirs.len(), 1023);
        chip_diff += ours
            .chips
            .iter()
            .zip(&theirs)
            .filter(|(a, b)| a != b)
            .count();
    }
    let mut field_diff = Vec::new();
    let mut parity_diff = 0;
    let mut frame_diff = Vec::new();
    let sats = o["sats"].as_array().expect("sats");
    for s in sats {
        let prn = num(s, "prn") as u32;
        let w = words(s);
        assert_eq!(w.len(), 60);
        // (C) parity of every word, subframe 5 of the previous frame included.
        for i in 0..60 {
            let prev = if i == 0 { 0 } else { w[i - 1] };
            let d = source_data(w[i], prev);
            let p = parity(d, (prev >> 1) & 1 == 1, prev & 1 == 1);
            if p != w[i] & 0x3F {
                parity_diff += 1;
            }
        }
        // (B) computed fields of subframes 1 to 3.
        let eph = ephemeris(s);
        let tow = (num(s, "g0_sec") / 6.0) as u32 + 1;
        let theirs: [[u32; 10]; 3] = [
            w[10..20].try_into().unwrap(),
            w[20..30].try_into().unwrap(),
            w[30..40].try_into().unwrap(),
        ];
        let decoded = decode_fields(&theirs, w[9]);
        let ours = field_values(&eph, &LnavConventions::default(), tow).expect("encode");
        for spec in FIELDS.iter().filter(|f| !f.convention) {
            let a = ours.iter().find(|(n, _)| *n == spec.name).unwrap().1;
            let b = decoded.iter().find(|(n, _)| *n == spec.name).unwrap().1;
            if a != b {
                field_diff.push(format!(
                    "PRN {prn} {}: Kshana {a:#x}, gps-sdr-sim {b:#x}",
                    spec.name
                ));
            }
        }
        // (D) whole subframes, reported only.
        let full = encode_subframes(&eph, &LnavConventions::default(), tow, w[9]).expect("encode");
        let mut bits = 0;
        for sf in 0..3 {
            for k in 0..10 {
                bits += (full[sf][k] ^ theirs[sf][k]).count_ones();
            }
        }
        if bits > 0 {
            let conv: Vec<&str> = FIELDS
                .iter()
                .filter(|f| f.convention)
                .filter(|f| {
                    let a = field_values(&eph, &LnavConventions::default(), tow).unwrap();
                    a.iter().find(|(n, _)| *n == f.name).unwrap().1
                        != decoded.iter().find(|(n, _)| *n == f.name).unwrap().1
                })
                .map(|f| f.name)
                .collect();
            frame_diff.push(format!(
                "PRN {prn}: {bits} bits differ; convention fields {conv:?}"
            ));
        }
    }
    (chip_diff, field_diff, parity_diff, sats.len(), frame_diff)
}

#[test]
#[ignore = "FINDING (run 2026-10-02 on f88f2969 + fixture): C/A chips 0 of 32736 differ and the parity of 0 of 1920 words differs, but 230 of 1152 computed LNAV fields differ by one least-significant bit: gps-sdr-sim eph2sbf truncates toward zero with C casts, Kshana rounds to nearest; pinned by gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding"]
fn ca_codes_lnav_fields_and_parity_match_gps_sdr_sim_bit_exactly() {
    let o = load();
    let (chips, fields, parity, sats, frames) = compare(&o);
    eprintln!("satellites {sats}; chip differences {chips}; field differences {}; parity differences {parity}", fields.len());
    for f in &fields {
        eprintln!("  {f}");
    }
    eprintln!(
        "(D, reported) full subframes 1-3 with zero conventions: {} satellites differ",
        frames.len()
    );
    for f in &frames {
        eprintln!("  {f}");
    }
    assert!(sats >= 8, "only {sats} satellites");
    assert_eq!(chips, 0, "C/A chips differ");
    assert!(
        fields.is_empty(),
        "{} computed LNAV fields differ",
        fields.len()
    );
    assert_eq!(parity, 0, "parity bits differ");
}

/// Field scale `2^p`, signedness and semicircle conversion for the computed fields that carry
/// a physical value.
fn scale_of(name: &str) -> Option<(&'static str, i32, bool, bool)> {
    Some(match name {
        "tgd" => ("tgd", -31, true, false),
        "toc" => ("toc_sec", 4, false, false),
        "af2" => ("af2", -55, true, false),
        "af1" => ("af1", -43, true, false),
        "af0" => ("af0", -31, true, false),
        "crs" => ("crs", -5, true, false),
        "delta_n" => ("deltan", -43, true, true),
        "m0" => ("m0", -31, true, true),
        "cuc" => ("cuc", -29, true, false),
        "e" => ("ecc", -33, false, false),
        "cus" => ("cus", -29, true, false),
        "sqrt_a" => ("sqrta", -19, false, false),
        "toe" => ("toe_sec", 4, false, false),
        "cic" => ("cic", -29, true, false),
        "omega0" => ("omg0", -31, true, true),
        "cis" => ("cis", -29, true, false),
        "i0" => ("inc0", -31, true, true),
        "crc" => ("crc", -5, true, false),
        "omega" => ("aop", -31, true, true),
        "omega_dot" => ("omgdot", -43, true, true),
        "idot" => ("idot", -43, true, true),
        _ => return None,
    })
}

/// The finding of the strict test, pinned on the committed oracle output: the codes and
/// the parity agree exactly; every differing field is a one-unit difference in which
/// gps-sdr-sim holds the value truncated toward zero and Kshana the value rounded to nearest;
/// and in every such field the ephemeris value lies within 0.01 of a unit of Kshana's integer,
/// so the integer the satellite broadcast (of which the RINEX value is the decimal print) is
/// Kshana's, not gps-sdr-sim's.
#[test]
fn gps_sdr_sim_truncates_where_the_broadcast_integer_needs_rounding() {
    use kshana::gps_lnav::GPS_PI;
    let o = load();
    let (chips, _, parity, sats, _) = compare(&o);
    assert_eq!(sats, 32);
    assert_eq!(chips, 0);
    assert_eq!(parity, 0);
    let mut differing = 0;
    let mut computed = 0;
    for s in o["sats"].as_array().unwrap() {
        let w = words(s);
        let theirs: [[u32; 10]; 3] = [
            w[10..20].try_into().unwrap(),
            w[20..30].try_into().unwrap(),
            w[30..40].try_into().unwrap(),
        ];
        let decoded = decode_fields(&theirs, w[9]);
        let tow = (num(s, "g0_sec") / 6.0) as u32 + 1;
        let ours = field_values(&ephemeris(s), &LnavConventions::default(), tow).unwrap();
        for spec in FIELDS.iter().filter(|f| !f.convention) {
            computed += 1;
            let a = ours.iter().find(|(n, _)| *n == spec.name).unwrap().1;
            let b = decoded.iter().find(|(n, _)| *n == spec.name).unwrap().1;
            if a == b {
                continue;
            }
            differing += 1;
            let (key, p, signed, semicircle) =
                scale_of(spec.name).unwrap_or_else(|| panic!("{} differs", spec.name));
            let width: u32 = spec.pieces.iter().map(|q| q.2).sum();
            let as_int = |raw: u64| -> i64 {
                if signed && raw >> (width - 1) == 1 {
                    raw as i64 - (1i64 << width)
                } else {
                    raw as i64
                }
            };
            let mut x = num(s, key);
            if semicircle {
                x /= GPS_PI;
            }
            let x = x * 2f64.powi(-p);
            let (k, g) = (as_int(a), as_int(b));
            assert_eq!(k as f64, x.round(), "{}: Kshana is the rounded value", spec.name);
            assert_eq!(g as f64, x.trunc(), "{}: gps-sdr-sim is the truncated value", spec.name);
            assert_eq!((k - g).abs(), 1, "{}", spec.name);
            assert!((x - x.round()).abs() < 0.01, "{}: {x} is not a broadcast integer", spec.name);
        }
    }
    assert_eq!(computed, 32 * FIELDS.iter().filter(|f| !f.convention).count());
    assert_eq!(differing, 230, "the finding as recorded: 230 fields");
}
