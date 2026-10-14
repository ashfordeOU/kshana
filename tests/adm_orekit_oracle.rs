// SPDX-License-Identifier: AGPL-3.0-only
//! CCSDS Attitude Data Messages (AEM, APM; 504.0-B-2) against Orekit 13.1.8, as pre-registered
//! in `xval/adm-orekit/PREREGISTRATION.md` (7a6a05fe, committed before any comparison).
//!
//! The cases are generated here (`inputs.txt`, format in `xval/adm-orekit/FORMAT.md`). Kshana
//! writes every case (`kshana/`); the driver `xval/adm-orekit/AdmOracle.java` writes the same
//! cases through Orekit's objects (`orekit/`) and dumps what Orekit parses from Kshana's files
//! (`outputs/orekit_reads_kshana.txt`). Regenerate the Kshana side with `KSHANA_XVAL_WRITE=1`;
//! otherwise the committed files must equal what Kshana writes now.

use std::fmt::Write as _;
use std::path::{Path, PathBuf};

fn dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/adm_orekit_oracle")
}

/// splitmix64, so the cases do not depend on any library's random generator.
struct Rng(u64);

impl Rng {
    fn next(&mut self) -> u64 {
        self.0 = self.0.wrapping_add(0x9E37_79B9_7F4A_7C15);
        let mut z = self.0;
        z = (z ^ (z >> 30)).wrapping_mul(0xBF58_476D_1CE4_E5B9);
        z = (z ^ (z >> 27)).wrapping_mul(0x94D0_49BB_1331_11EB);
        z ^ (z >> 31)
    }
    fn uniform(&mut self, lo: f64, hi: f64) -> f64 {
        lo + (hi - lo) * ((self.next() >> 11) as f64 / (1u64 << 53) as f64)
    }
}

fn qmul(a: [f64; 4], b: [f64; 4]) -> [f64; 4] {
    // scalar-last (Q1, Q2, Q3, QC)
    let (ax, ay, az, aw) = (a[0], a[1], a[2], a[3]);
    let (bx, by, bz, bw) = (b[0], b[1], b[2], b[3]);
    [
        aw * bx + ax * bw + ay * bz - az * by,
        aw * by - ax * bz + ay * bw + az * bx,
        aw * bz + ax * by - ay * bx + az * bw,
        aw * bw - ax * bx - ay * by - az * bz,
    ]
}

/// A unit quaternion (scalar last) with a positive scalar part.
fn unit_quaternion(r: &mut Rng) -> [f64; 4] {
    loop {
        let q = [
            r.uniform(-1.0, 1.0),
            r.uniform(-1.0, 1.0),
            r.uniform(-1.0, 1.0),
            r.uniform(0.05, 1.0),
        ];
        let n = (q[0] * q[0] + q[1] * q[1] + q[2] * q[2] + q[3] * q[3]).sqrt();
        if n > 0.2 && n <= 1.0 {
            return [q[0] / n, q[1] / n, q[2] / n, q[3] / n];
        }
    }
}

/// A quaternion derivative consistent with the unit norm: `q_dot = q (0, w) / 2`, w in rad/s.
fn q_dot(r: &mut Rng, q: [f64; 4]) -> [f64; 4] {
    let w = [
        r.uniform(-0.01, 0.01),
        r.uniform(-0.01, 0.01),
        r.uniform(-0.01, 0.01),
        0.0,
    ];
    let d = qmul(q, w);
    [d[0] / 2.0, d[1] / 2.0, d[2] / 2.0, d[3] / 2.0]
}

fn epoch(day_s: f64) -> String {
    let h = (day_s / 3600.0).floor();
    let m = ((day_s - h * 3600.0) / 60.0).floor();
    let s = day_s - h * 3600.0 - m * 60.0;
    format!("2026-03-01T{:02}:{:02}:{:06.3}", h as u32, m as u32, s)
}

fn nums(v: &[f64]) -> String {
    v.iter()
        .map(|x| format!("{x:?}"))
        .collect::<Vec<_>>()
        .join(" ")
}

/// Euler angles inside the canonical branch: Tait-Bryan (-180, 180), (-90, 90), (-180, 180);
/// proper Euler (-180, 180), (0, 180), (-180, 180).
fn euler(r: &mut Rng, seq: &str) -> [f64; 3] {
    let b = seq.as_bytes();
    let proper = b.len() == 3 && b[0] == b[2];
    let mid = if proper {
        r.uniform(5.0, 175.0)
    } else {
        r.uniform(-85.0, 85.0)
    };
    [r.uniform(-175.0, 175.0), mid, r.uniform(-175.0, 175.0)]
}

struct Aem {
    id: &'static str,
    version: &'static str,
    att_type: &'static str,
    frame_a: &'static str,
    frame_b: &'static str,
    time_system: &'static str,
    seq: Option<&'static str>,
    angvel_frame: Option<&'static str>,
    v1_quat: Option<&'static str>,
    v1_dir: Option<&'static str>,
    step_s: f64,
    segments: usize,
    extras: bool,
}

const fn aem(
    id: &'static str,
    version: &'static str,
    att_type: &'static str,
    frame_a: &'static str,
    frame_b: &'static str,
    time_system: &'static str,
) -> Aem {
    Aem {
        id,
        version,
        att_type,
        frame_a,
        frame_b,
        time_system,
        seq: None,
        angvel_frame: None,
        v1_quat: None,
        v1_dir: None,
        step_s: 10.0,
        segments: 1,
        extras: false,
    }
}

fn aem_cases() -> Vec<Aem> {
    vec![
        Aem {
            segments: 2,
            extras: true,
            ..aem("A01", "2.0", "QUATERNION", "EME2000", "SC_BODY_1", "UTC")
        },
        aem(
            "A02",
            "2.0",
            "QUATERNION/DERIVATIVE",
            "SC_BODY_1",
            "EME2000",
            "TAI",
        ),
        Aem {
            angvel_frame: Some("SC_BODY_1"),
            ..aem(
                "A03",
                "2.0",
                "QUATERNION/ANGVEL",
                "EME2000",
                "SC_BODY_1",
                "GPS",
            )
        },
        Aem {
            angvel_frame: Some("EME2000"),
            ..aem(
                "A04",
                "2.0",
                "QUATERNION/ANGVEL",
                "EME2000",
                "SC_BODY_1",
                "TT",
            )
        },
        Aem {
            seq: Some("ZYX"),
            ..aem("A05", "2.0", "EULER_ANGLE", "GCRF", "SC_BODY_1", "TDB")
        },
        Aem {
            seq: Some("ZXZ"),
            ..aem("A06", "2.0", "EULER_ANGLE", "LVLH", "SC_BODY_1", "UTC")
        },
        Aem {
            seq: Some("XYZ"),
            ..aem(
                "A07",
                "2.0",
                "EULER_ANGLE/DERIVATIVE",
                "EME2000",
                "SC_BODY_1",
                "UTC",
            )
        },
        Aem {
            seq: Some("YXZ"),
            angvel_frame: Some("SC_BODY_1"),
            ..aem(
                "A08",
                "2.0",
                "EULER_ANGLE/ANGVEL",
                "EME2000",
                "SC_BODY_1",
                "UTC",
            )
        },
        Aem {
            step_s: 0.25,
            ..aem("A09", "2.0", "SPIN", "EME2000", "SC_BODY_1", "UTC")
        },
        aem("A10", "2.0", "SPIN/NUTATION", "EME2000", "SC_BODY_1", "UTC"),
        aem(
            "A11",
            "2.0",
            "SPIN/NUTATION_MOM",
            "EME2000",
            "SC_BODY_1",
            "UTC",
        ),
        Aem {
            v1_quat: Some("FIRST"),
            v1_dir: Some("A2B"),
            ..aem("A12", "1.0", "QUATERNION", "EME2000", "SC_BODY_1", "UTC")
        },
        Aem {
            v1_quat: Some("LAST"),
            v1_dir: Some("B2A"),
            ..aem(
                "A13",
                "1.0",
                "QUATERNION/DERIVATIVE",
                "EME2000",
                "SC_BODY_1",
                "UTC",
            )
        },
        Aem {
            seq: Some("321"),
            v1_dir: Some("A2B"),
            ..aem(
                "A14",
                "1.0",
                "EULER_ANGLE",
                "EME2000",
                "INSTRUMENT_A",
                "UTC",
            )
        },
    ]
}

fn record_values(r: &mut Rng, c: &Aem) -> Vec<f64> {
    let seq = c.seq.unwrap_or("ZXZ");
    let seq_letters: String = seq
        .chars()
        .map(|ch| match ch {
            '1' => 'X',
            '2' => 'Y',
            '3' => 'Z',
            o => o,
        })
        .collect();
    match c.att_type {
        "QUATERNION" => unit_quaternion(r).to_vec(),
        "QUATERNION/DERIVATIVE" => {
            let q = unit_quaternion(r);
            let d = q_dot(r, q);
            [q.to_vec(), d.to_vec()].concat()
        }
        "QUATERNION/ANGVEL" | "EULER_ANGLE/ANGVEL" | "EULER_ANGLE/DERIVATIVE" | "EULER_ANGLE" => {
            let mut v = if c.att_type.starts_with("QUATERNION") {
                unit_quaternion(r).to_vec()
            } else {
                euler(r, &seq_letters).to_vec()
            };
            if c.att_type != "EULER_ANGLE" {
                v.extend((0..3).map(|_| r.uniform(-0.5, 0.5)));
            }
            v
        }
        "SPIN" | "SPIN/NUTATION" | "SPIN/NUTATION_MOM" => {
            let mut v = vec![
                r.uniform(-175.0, 175.0),
                r.uniform(-85.0, 85.0),
                r.uniform(-175.0, 175.0),
                r.uniform(1.0, 30.0),
            ];
            if c.att_type == "SPIN/NUTATION" {
                v.extend([
                    r.uniform(1.0, 20.0),
                    r.uniform(100.0, 2000.0),
                    r.uniform(-175.0, 175.0),
                ]);
            } else if c.att_type == "SPIN/NUTATION_MOM" {
                v.extend([
                    r.uniform(-175.0, 175.0),
                    r.uniform(-85.0, 85.0),
                    r.uniform(0.1, 5.0),
                ]);
            }
            v
        }
        o => panic!("{o}"),
    }
}

fn header(out: &mut String, id: &str, kind: &str, version: &str, extras: bool) {
    let _ = writeln!(out, "case={id}\nkind={kind}\nversion={version}");
    if extras {
        let _ = writeln!(out, "header.comment=Kshana ADM cross-validation case {id}");
        let _ = writeln!(out, "header.comment=synthetic values");
    }
    let _ = writeln!(out, "header.creation_date=2026-10-13T00:00:00.000");
    let _ = writeln!(out, "header.originator=KSHANA XVAL");
    if extras || kind == "APM" && id == "P01" {
        let _ = writeln!(out, "header.message_id={id}-0001");
    }
}

fn aem_text(c: &Aem, seed: u64) -> String {
    let mut r = Rng(seed);
    let mut out = String::new();
    header(&mut out, c.id, "AEM", c.version, c.extras);
    for s in 0..c.segments {
        let t0 = 3600.0 * s as f64 + 60.0;
        let n = 5;
        let t_last = t0 + c.step_s * (n - 1) as f64;
        let _ = writeln!(out, "segment");
        if c.extras {
            let _ = writeln!(out, "meta.comment=segment {s}");
        }
        let _ = writeln!(out, "meta.object_name=XVAL SAT");
        let _ = writeln!(out, "meta.object_id=2026-999A");
        let _ = writeln!(out, "meta.center_name=EARTH");
        let _ = writeln!(out, "meta.ref_frame_a={}", c.frame_a);
        let _ = writeln!(out, "meta.ref_frame_b={}", c.frame_b);
        if let Some(d) = c.v1_dir {
            let _ = writeln!(out, "meta.attitude_dir={d}");
        }
        let _ = writeln!(out, "meta.time_system={}", c.time_system);
        let _ = writeln!(out, "meta.start_time={}", epoch(t0));
        if c.extras {
            let _ = writeln!(out, "meta.useable_start_time={}", epoch(t0 + c.step_s));
            let _ = writeln!(out, "meta.useable_stop_time={}", epoch(t_last - c.step_s));
        }
        let _ = writeln!(out, "meta.stop_time={}", epoch(t_last));
        let _ = writeln!(out, "meta.attitude_type={}", c.att_type);
        if let Some(q) = c.v1_quat {
            let _ = writeln!(out, "meta.quaternion_type={q}");
        }
        if let Some(q) = c.seq {
            let _ = writeln!(out, "meta.euler_rot_seq={q}");
        }
        if let Some(f) = c.angvel_frame {
            let _ = writeln!(out, "meta.angvel_frame={f}");
        }
        if c.extras {
            let _ = writeln!(out, "meta.interpolation_method=LAGRANGE");
            let _ = writeln!(out, "meta.interpolation_degree=3");
            let _ = writeln!(out, "data.comment=data of segment {s}");
        }
        for k in 0..n {
            let v = record_values(&mut r, c);
            let _ = writeln!(
                out,
                "record={} {}",
                epoch(t0 + c.step_s * k as f64),
                nums(&v)
            );
        }
    }
    out.push_str("end\n");
    out
}

fn apm_text(id: &str, seed: u64) -> String {
    let mut r = Rng(seed);
    let mut out = String::new();
    header(&mut out, id, "APM", "2.0", id == "P01");
    let _ = writeln!(out, "meta.object_name=XVAL SAT");
    let _ = writeln!(out, "meta.object_id=2026-999A");
    let _ = writeln!(out, "meta.center_name=EARTH");
    let _ = writeln!(out, "meta.time_system=UTC");
    let _ = writeln!(out, "epoch=2026-03-01T12:00:00.500");
    let quat = |out: &mut String, r: &mut Rng, dot: bool| {
        let q = unit_quaternion(r);
        let _ = writeln!(
            out,
            "quat\nquat.ref_frame_a=EME2000\nquat.ref_frame_b=SC_BODY_1"
        );
        let _ = writeln!(out, "quat.q={}", nums(&q));
        if dot {
            let _ = writeln!(out, "quat.q_dot={}", nums(&q_dot(r, q)));
        }
    };
    let euler_block = |out: &mut String, r: &mut Rng, seq: &str, rates: bool| {
        let _ = writeln!(
            out,
            "euler\neuler.ref_frame_a=EME2000\neuler.ref_frame_b=SC_BODY_1"
        );
        let _ = writeln!(out, "euler.rot_seq={seq}");
        let _ = writeln!(out, "euler.angles={}", nums(&euler(r, seq)));
        if rates {
            let v: Vec<f64> = (0..3).map(|_| r.uniform(-0.5, 0.5)).collect();
            let _ = writeln!(out, "euler.rates={}", nums(&v));
        }
    };
    let inertia = |out: &mut String, r: &mut Rng| {
        let v = [
            r.uniform(100.0, 2000.0),
            r.uniform(100.0, 2000.0),
            r.uniform(100.0, 2000.0),
            r.uniform(-50.0, 50.0),
            r.uniform(-50.0, 50.0),
            r.uniform(-50.0, 50.0),
        ];
        let _ = writeln!(
            out,
            "inertia\ninertia.ref_frame=SC_BODY_1\ninertia.values={}",
            nums(&v)
        );
    };
    let spin = |out: &mut String, r: &mut Rng| {
        let v = [
            r.uniform(-175.0, 175.0),
            r.uniform(-85.0, 85.0),
            r.uniform(-175.0, 175.0),
            r.uniform(1.0, 30.0),
        ];
        let _ = writeln!(
            out,
            "spin\nspin.ref_frame_a=EME2000\nspin.ref_frame_b=SC_BODY_1"
        );
        let _ = writeln!(out, "spin.values={}", nums(&v));
    };
    match id {
        "P01" => {
            let _ = writeln!(out, "data.comment=quaternion only");
            quat(&mut out, &mut r, false);
        }
        "P02" => {
            quat(&mut out, &mut r, true);
            euler_block(&mut out, &mut r, "ZYX", true);
            let v: Vec<f64> = (0..3).map(|_| r.uniform(-0.5, 0.5)).collect();
            let _ = writeln!(
                out,
                "angvel\nangvel.ref_frame_a=EME2000\nangvel.ref_frame_b=SC_BODY_1\nangvel.angvel_frame=SC_BODY_1\nangvel.xyz={}",
                nums(&v)
            );
            inertia(&mut out, &mut r);
            for (k, dm) in [(0, None), (1, Some(-r.uniform(0.01, 1.0)))] {
                let tor: Vec<f64> = (0..3).map(|_| r.uniform(-0.1, 0.1)).collect();
                let _ = writeln!(
                    out,
                    "man\nman.epoch_start=2026-03-01T12:{:02}:00.000\nman.duration={:?}\nman.ref_frame=SC_BODY_1\nman.torque={}",
                    10 + 20 * k,
                    r.uniform(10.0, 300.0),
                    nums(&tor)
                );
                if let Some(m) = dm {
                    let _ = writeln!(out, "man.delta_mass={m:?}");
                }
            }
        }
        "P03" => {
            euler_block(&mut out, &mut r, "ZXZ", false);
            spin(&mut out, &mut r);
            let v = [
                r.uniform(1.0, 20.0),
                r.uniform(100.0, 2000.0),
                r.uniform(-175.0, 175.0),
            ];
            let _ = writeln!(out, "spin.nutation={}", nums(&v));
        }
        "P04" => {
            quat(&mut out, &mut r, false);
            spin(&mut out, &mut r);
            let v = [
                r.uniform(-175.0, 175.0),
                r.uniform(-85.0, 85.0),
                r.uniform(0.1, 5.0),
            ];
            let _ = writeln!(out, "spin.momentum={}", nums(&v));
            inertia(&mut out, &mut r);
        }
        o => panic!("{o}"),
    }
    out.push_str("end\n");
    out
}

/// The whole pre-registered case set as `inputs.txt`.
fn inputs_text() -> String {
    let mut s = String::new();
    for (k, c) in aem_cases().iter().enumerate() {
        s.push_str(&aem_text(c, 1000 + k as u64));
        s.push('\n');
    }
    for (k, id) in ["P01", "P02", "P03", "P04"].iter().enumerate() {
        s.push_str(&apm_text(id, 2000 + k as u64));
        s.push('\n');
    }
    s
}

#[test]
fn inputs_are_reproducible() {
    let p = dir().join("inputs.txt");
    let text = inputs_text();
    if std::env::var("KSHANA_XVAL_WRITE").is_ok() {
        std::fs::create_dir_all(dir()).unwrap();
        std::fs::write(&p, &text).unwrap();
    } else {
        assert_eq!(std::fs::read_to_string(&p).unwrap(), text);
    }
}

// ---------------------------------------------------------------------------------------------
// The case/dump format (xval/adm-orekit/FORMAT.md) read into the engine's message types.

use kshana::adm::*;

/// One case or dump block.
struct Case {
    id: String,
    format: Option<String>,
    parse_error: Option<String>,
    aem: Option<AemMessage>,
    apm: Option<ApmMessage>,
    /// Orekit's rotation after each AEM record (dumps), scalar first, per segment.
    rots: Vec<Vec<[f64; 4]>>,
}

fn floats(s: &str) -> Vec<f64> {
    s.split_whitespace()
        .map(|x| x.parse::<f64>().unwrap_or_else(|e| panic!("{x}: {e}")))
        .collect()
}

fn arr<const N: usize>(s: &str) -> [f64; N] {
    floats(s).try_into().unwrap_or_else(|v| panic!("{v:?}"))
}

fn parse_cases(text: &str) -> Vec<Case> {
    let mut out = Vec::new();
    let mut lines = text
        .lines()
        .map(str::trim)
        .filter(|l| !l.is_empty())
        .peekable();
    while let Some(l) = lines.next() {
        let id = l
            .strip_prefix("case=")
            .unwrap_or_else(|| panic!("{l}"))
            .to_string();
        let mut kv: Vec<(String, String)> = Vec::new();
        for l in lines.by_ref() {
            if l == "end" {
                break;
            }
            let (k, v) = l.split_once('=').unwrap_or((l, ""));
            kv.push((k.to_string(), v.to_string()));
        }
        out.push(build_case(id, kv));
    }
    out
}

fn build_case(id: String, kv: Vec<(String, String)>) -> Case {
    let get = |k: &str| kv.iter().find(|(kk, _)| kk == k).map(|(_, v)| v.clone());
    let all = |k: &str| -> Vec<String> {
        kv.iter()
            .filter(|(kk, _)| kk == k)
            .map(|(_, v)| v.clone())
            .collect()
    };
    let mut case = Case {
        id,
        format: get("format"),
        parse_error: get("parse_error"),
        aem: None,
        apm: None,
        rots: vec![],
    };
    if case.parse_error.is_some() {
        return case;
    }
    let header = AdmHeader {
        version: get("version").unwrap(),
        comments: all("header.comment"),
        classification: get("header.classification"),
        creation_date: get("header.creation_date").unwrap(),
        originator: get("header.originator").unwrap(),
        message_id: get("header.message_id"),
    };
    if get("kind").as_deref() == Some("AEM") {
        let mut segments: Vec<AemSegment> = Vec::new();
        let mut cur: Vec<(String, String)> = Vec::new();
        let flush = |cur: &mut Vec<(String, String)>,
                     segs: &mut Vec<AemSegment>,
                     rots: &mut Vec<Vec<[f64; 4]>>| {
            if cur.is_empty() {
                return;
            }
            let g = |k: &str| cur.iter().find(|(kk, _)| kk == k).map(|(_, v)| v.clone());
            let a = |k: &str| -> Vec<String> {
                cur.iter()
                    .filter(|(kk, _)| kk == k)
                    .map(|(_, v)| v.clone())
                    .collect()
            };
            let metadata = AemMetadata {
                comments: a("meta.comment"),
                object_name: g("meta.object_name").unwrap(),
                object_id: g("meta.object_id").unwrap(),
                center_name: g("meta.center_name"),
                ref_frame_a: g("meta.ref_frame_a").unwrap(),
                ref_frame_b: g("meta.ref_frame_b").unwrap(),
                attitude_dir: g("meta.attitude_dir"),
                time_system: g("meta.time_system").unwrap(),
                start_time: g("meta.start_time").unwrap(),
                useable_start_time: g("meta.useable_start_time"),
                useable_stop_time: g("meta.useable_stop_time"),
                stop_time: g("meta.stop_time").unwrap(),
                attitude_type: AttitudeType::from_keyword(&g("meta.attitude_type").unwrap())
                    .unwrap(),
                quaternion_type: g("meta.quaternion_type"),
                euler_rot_seq: g("meta.euler_rot_seq"),
                angvel_frame: g("meta.angvel_frame"),
                interpolation_method: g("meta.interpolation_method"),
                interpolation_degree: g("meta.interpolation_degree").map(|d| d.parse().unwrap()),
            };
            let records = a("record")
                .iter()
                .map(|r| {
                    let (e, v) = r.split_once(' ').unwrap();
                    AemRecord {
                        epoch: e.to_string(),
                        values: floats(v),
                    }
                })
                .collect();
            rots.push(a("rot").iter().map(|r| arr::<4>(r)).collect());
            segs.push(AemSegment {
                metadata,
                data_comments: a("data.comment"),
                records,
            });
            cur.clear();
        };
        let mut rots = Vec::new();
        let mut in_seg = false;
        for (k, v) in &kv {
            if k == "segment" {
                flush(&mut cur, &mut segments, &mut rots);
                in_seg = true;
            } else if in_seg {
                cur.push((k.clone(), v.clone()));
            }
        }
        flush(&mut cur, &mut segments, &mut rots);
        case.rots = rots;
        case.aem = Some(AemMessage { header, segments });
    } else {
        let mut m = ApmMessage {
            header,
            metadata: ApmMetadata {
                comments: all("meta.comment"),
                object_name: get("meta.object_name").unwrap(),
                object_id: get("meta.object_id").unwrap(),
                center_name: get("meta.center_name"),
                time_system: get("meta.time_system").unwrap(),
            },
            data_comments: all("data.comment"),
            epoch: get("epoch").unwrap(),
            quaternions: vec![],
            eulers: vec![],
            angvels: vec![],
            spins: vec![],
            inertias: vec![],
            maneuvers: vec![],
        };
        // Blocks: split at the bare block markers.
        let mut blocks: Vec<(String, Vec<(String, String)>)> = Vec::new();
        for (k, v) in &kv {
            if ["quat", "euler", "angvel", "spin", "inertia", "man"].contains(&k.as_str()) {
                blocks.push((k.clone(), vec![]));
            } else if let Some(b) = blocks.last_mut() {
                if k.starts_with(&format!("{}.", b.0)) {
                    b.1.push((k[b.0.len() + 1..].to_string(), v.clone()));
                }
            }
        }
        for (name, f) in blocks {
            let g = |k: &str| f.iter().find(|(kk, _)| kk == k).map(|(_, v)| v.clone());
            let c: Vec<String> = f
                .iter()
                .filter(|(k, _)| k == "comment")
                .map(|(_, v)| v.clone())
                .collect();
            match name.as_str() {
                "quat" => m.quaternions.push(ApmQuaternion {
                    comments: c,
                    ref_frame_a: g("ref_frame_a").unwrap(),
                    ref_frame_b: g("ref_frame_b").unwrap(),
                    q: arr(&g("q").unwrap()),
                    q_dot: g("q_dot").map(|v| arr(&v)),
                }),
                "euler" => m.eulers.push(ApmEuler {
                    comments: c,
                    ref_frame_a: g("ref_frame_a").unwrap(),
                    ref_frame_b: g("ref_frame_b").unwrap(),
                    rot_seq: g("rot_seq").unwrap(),
                    angles: arr(&g("angles").unwrap()),
                    rates: g("rates").map(|v| arr(&v)),
                }),
                "angvel" => m.angvels.push(ApmAngVel {
                    comments: c,
                    ref_frame_a: g("ref_frame_a").unwrap(),
                    ref_frame_b: g("ref_frame_b").unwrap(),
                    angvel_frame: g("angvel_frame").unwrap(),
                    xyz: arr(&g("xyz").unwrap()),
                }),
                "spin" => m.spins.push(ApmSpin {
                    comments: c,
                    ref_frame_a: g("ref_frame_a").unwrap(),
                    ref_frame_b: g("ref_frame_b").unwrap(),
                    values: arr(&g("values").unwrap()),
                    nutation: g("nutation").map(|v| arr(&v)),
                    momentum: g("momentum").map(|v| arr(&v)),
                }),
                "inertia" => m.inertias.push(ApmInertia {
                    comments: c,
                    ref_frame: g("ref_frame").unwrap(),
                    values: arr(&g("values").unwrap()),
                }),
                _ => m.maneuvers.push(ApmManeuver {
                    comments: c,
                    epoch_start: g("epoch_start").unwrap(),
                    duration: g("duration").unwrap().parse().unwrap(),
                    ref_frame: g("ref_frame").unwrap(),
                    torque: arr(&g("torque").unwrap()),
                    delta_mass: g("delta_mass").map(|v| v.parse().unwrap()),
                }),
            }
        }
        case.apm = Some(m);
    }
    case
}

fn inputs() -> Vec<Case> {
    parse_cases(&inputs_text())
}

/// Everything Kshana writes: (file name, text). KVN for every case, XML for version 2.0.
fn kshana_files() -> Vec<(String, String)> {
    let mut out = Vec::new();
    for c in inputs() {
        if let Some(m) = &c.aem {
            out.push((format!("{}.kvn", c.id), m.to_kvn().unwrap()));
            if m.header.version == "2.0" {
                out.push((format!("{}.xml", c.id), m.to_xml().unwrap()));
            }
        } else if let Some(m) = &c.apm {
            out.push((format!("{}.kvn", c.id), m.to_kvn().unwrap()));
            out.push((format!("{}.xml", c.id), m.to_xml().unwrap()));
        }
    }
    out
}

#[test]
fn kshana_messages_are_reproducible() {
    let write = std::env::var("KSHANA_XVAL_WRITE").is_ok();
    let d = dir().join("kshana");
    if write {
        std::fs::create_dir_all(&d).unwrap();
    }
    for (name, text) in kshana_files() {
        if write {
            std::fs::write(d.join(&name), &text).unwrap();
        } else {
            let got =
                std::fs::read_to_string(d.join(&name)).unwrap_or_else(|e| panic!("{name}: {e}"));
            assert!(got == text, "{name} differs from what Kshana writes now");
        }
    }
}

// ---------------------------------------------------------------------------------------------
// Bars and comparisons.

fn ep(s: &str) -> f64 {
    epoch_seconds(s).unwrap_or_else(|e| panic!("{e}"))
}

fn same_epoch(a: &str, b: &str, what: &str) {
    let d = (ep(a) - ep(b)).abs();
    assert!(d <= 1e-9, "{what}: epoch {a} vs {b} ({d:e} s)");
}

fn mod360(d: f64) -> f64 {
    let r = d.rem_euclid(360.0);
    if r > 180.0 {
        r - 360.0
    } else {
        r
    }
}

/// The pre-registered bar for value `k` of a record of type `t`: (tolerance, relative?, modulo
/// 360?).
fn aem_bar(t: AttitudeType, k: usize) -> (f64, bool, bool) {
    use AttitudeType::*;
    match t {
        Quaternion | QuaternionDerivative => (1e-14, false, false),
        QuaternionAngVel if k < 4 => (1e-14, false, false),
        QuaternionAngVel => (1e-10, false, false),
        EulerAngle | EulerAngleDerivative | EulerAngleAngVel if k < 3 => (1e-9, false, false),
        EulerAngle | EulerAngleDerivative | EulerAngleAngVel => (1e-10, false, false),
        Spin if k < 3 => (1e-9, false, true),
        Spin => (1e-10, false, false),
        SpinNutation if k == 5 => (1e-10, true, false),
        SpinNutation | SpinNutationMom if k == 3 || (t == SpinNutationMom && k == 6) => {
            (1e-9, false, false)
        }
        SpinNutation | SpinNutationMom => (1e-8, false, true),
        o => panic!("{o:?} is outside the case set"),
    }
}

fn check_value(got: f64, want: f64, (tol, rel, m360): (f64, bool, bool), what: &str) -> f64 {
    let d = if m360 { mod360(got - want) } else { got - want }.abs();
    let bar = if rel { tol * want.abs() } else { tol };
    assert!(
        d <= bar,
        "{what}: {got} vs {want} (|d| = {d:e}, bar {bar:e})"
    );
    d / bar
}

fn apm_value(got: f64, want: f64, what: &str) -> f64 {
    let bar = 1e-14 * want.abs().max(1.0);
    let d = (got - want).abs();
    assert!(
        d <= bar,
        "{what}: {got} vs {want} (|d| = {d:e}, bar {bar:e})"
    );
    d / bar
}

fn apm_values(got: &[f64], want: &[f64], what: &str) -> f64 {
    assert_eq!(got.len(), want.len(), "{what}");
    got.iter()
        .zip(want)
        .enumerate()
        .map(|(k, (g, w))| apm_value(*g, *w, &format!("{what}[{k}]")))
        .fold(0.0, f64::max)
}

fn check_header(got: &AdmHeader, want: &AdmHeader, what: &str) {
    assert_eq!(got.version, want.version, "{what}: version");
    assert_eq!(got.comments, want.comments, "{what}: header comments");
    assert_eq!(got.classification, want.classification, "{what}");
    same_epoch(&got.creation_date, &want.creation_date, what);
    assert_eq!(got.originator, want.originator, "{what}: originator");
    assert_eq!(got.message_id, want.message_id, "{what}: message id");
}

fn opt_epoch(a: &Option<String>, b: &Option<String>, what: &str) {
    match (a, b) {
        (Some(a), Some(b)) => same_epoch(a, b, what),
        (None, None) => {}
        _ => panic!("{what}: {a:?} vs {b:?}"),
    }
}

/// Compare a message read on one side with the case input; returns the worst |d|/bar.
fn check_aem(got: &AemMessage, want: &AemMessage, what: &str) -> f64 {
    check_header(&got.header, &want.header, what);
    assert_eq!(got.segments.len(), want.segments.len(), "{what}: segments");
    let mut worst = 0.0f64;
    for (s, (g, w)) in got.segments.iter().zip(&want.segments).enumerate() {
        let (gm, wm) = (&g.metadata, &w.metadata);
        let ws = format!("{what} segment {s}");
        assert_eq!(gm.comments, wm.comments, "{ws}: comments");
        assert_eq!(
            (&gm.object_name, &gm.object_id, &gm.center_name),
            (&wm.object_name, &wm.object_id, &wm.center_name),
            "{ws}"
        );
        assert_eq!(
            (&gm.ref_frame_a, &gm.ref_frame_b),
            (&wm.ref_frame_a, &wm.ref_frame_b),
            "{ws}"
        );
        assert_eq!(gm.attitude_dir, wm.attitude_dir, "{ws}: ATTITUDE_DIR");
        assert_eq!(gm.time_system, wm.time_system, "{ws}");
        same_epoch(&gm.start_time, &wm.start_time, &ws);
        same_epoch(&gm.stop_time, &wm.stop_time, &ws);
        opt_epoch(&gm.useable_start_time, &wm.useable_start_time, &ws);
        opt_epoch(&gm.useable_stop_time, &wm.useable_stop_time, &ws);
        assert_eq!(gm.attitude_type, wm.attitude_type, "{ws}");
        assert_eq!(
            gm.quaternion_type, wm.quaternion_type,
            "{ws}: QUATERNION_TYPE"
        );
        assert_eq!(gm.euler_rot_seq, wm.euler_rot_seq, "{ws}: EULER_ROT_SEQ");
        assert_eq!(gm.angvel_frame, wm.angvel_frame, "{ws}: ANGVEL_FRAME");
        assert_eq!(gm.interpolation_method, wm.interpolation_method, "{ws}");
        assert_eq!(gm.interpolation_degree, wm.interpolation_degree, "{ws}");
        assert_eq!(g.data_comments, w.data_comments, "{ws}: data comments");
        assert_eq!(g.records.len(), w.records.len(), "{ws}: records");
        for (r, (gr, wr)) in g.records.iter().zip(&w.records).enumerate() {
            same_epoch(&gr.epoch, &wr.epoch, &format!("{ws} record {r}"));
            assert_eq!(gr.values.len(), wr.values.len());
            for k in 0..wr.values.len() {
                worst = worst.max(check_value(
                    gr.values[k],
                    wr.values[k],
                    aem_bar(wm.attitude_type, k),
                    &format!("{ws} record {r} value {k}"),
                ));
            }
        }
    }
    worst
}

fn check_apm(got: &ApmMessage, want: &ApmMessage, what: &str) -> f64 {
    check_header(&got.header, &want.header, what);
    assert_eq!(got.metadata.comments, want.metadata.comments, "{what}");
    assert_eq!(
        (
            &got.metadata.object_name,
            &got.metadata.object_id,
            &got.metadata.center_name,
            &got.metadata.time_system
        ),
        (
            &want.metadata.object_name,
            &want.metadata.object_id,
            &want.metadata.center_name,
            &want.metadata.time_system
        ),
        "{what}"
    );
    assert_eq!(
        got.data_comments, want.data_comments,
        "{what}: data comments"
    );
    same_epoch(&got.epoch, &want.epoch, what);
    let mut w = 0.0f64;
    assert_eq!(
        got.quaternions.len(),
        want.quaternions.len(),
        "{what}: quaternion blocks"
    );
    for (g, x) in got.quaternions.iter().zip(&want.quaternions) {
        assert_eq!(
            (&g.ref_frame_a, &g.ref_frame_b, &g.comments),
            (&x.ref_frame_a, &x.ref_frame_b, &x.comments),
            "{what}"
        );
        w = w.max(apm_values(&g.q, &x.q, &format!("{what} Q")));
        assert_eq!(g.q_dot.is_some(), x.q_dot.is_some(), "{what}: Q_DOT");
        if let (Some(a), Some(b)) = (&g.q_dot, &x.q_dot) {
            w = w.max(apm_values(a, b, &format!("{what} Q_DOT")));
        }
    }
    assert_eq!(got.eulers.len(), want.eulers.len(), "{what}: Euler blocks");
    for (g, x) in got.eulers.iter().zip(&want.eulers) {
        assert_eq!(
            (&g.ref_frame_a, &g.ref_frame_b, &g.rot_seq, &g.comments),
            (&x.ref_frame_a, &x.ref_frame_b, &x.rot_seq, &x.comments),
            "{what}"
        );
        w = w.max(apm_values(&g.angles, &x.angles, &format!("{what} ANGLE")));
        assert_eq!(g.rates.is_some(), x.rates.is_some(), "{what}: rates");
        if let (Some(a), Some(b)) = (&g.rates, &x.rates) {
            w = w.max(apm_values(a, b, &format!("{what} ANGLE_DOT")));
        }
    }
    assert_eq!(
        got.angvels.len(),
        want.angvels.len(),
        "{what}: angvel blocks"
    );
    for (g, x) in got.angvels.iter().zip(&want.angvels) {
        assert_eq!(
            (&g.ref_frame_a, &g.ref_frame_b, &g.angvel_frame, &g.comments),
            (&x.ref_frame_a, &x.ref_frame_b, &x.angvel_frame, &x.comments),
            "{what}"
        );
        w = w.max(apm_values(&g.xyz, &x.xyz, &format!("{what} ANGVEL")));
    }
    assert_eq!(got.spins.len(), want.spins.len(), "{what}: spin blocks");
    for (g, x) in got.spins.iter().zip(&want.spins) {
        assert_eq!(
            (&g.ref_frame_a, &g.ref_frame_b, &g.comments),
            (&x.ref_frame_a, &x.ref_frame_b, &x.comments),
            "{what}"
        );
        w = w.max(apm_values(&g.values, &x.values, &format!("{what} SPIN")));
        assert_eq!(
            (g.nutation.is_some(), g.momentum.is_some()),
            (x.nutation.is_some(), x.momentum.is_some()),
            "{what}"
        );
        if let (Some(a), Some(b)) = (&g.nutation, &x.nutation) {
            w = w.max(apm_values(a, b, &format!("{what} NUTATION")));
        }
        if let (Some(a), Some(b)) = (&g.momentum, &x.momentum) {
            w = w.max(apm_values(a, b, &format!("{what} MOMENTUM")));
        }
    }
    assert_eq!(
        got.inertias.len(),
        want.inertias.len(),
        "{what}: inertia blocks"
    );
    for (g, x) in got.inertias.iter().zip(&want.inertias) {
        assert_eq!(
            (&g.ref_frame, &g.comments),
            (&x.ref_frame, &x.comments),
            "{what}"
        );
        w = w.max(apm_values(&g.values, &x.values, &format!("{what} INERTIA")));
    }
    assert_eq!(
        got.maneuvers.len(),
        want.maneuvers.len(),
        "{what}: maneuvers"
    );
    for (g, x) in got.maneuvers.iter().zip(&want.maneuvers) {
        assert_eq!(
            (&g.ref_frame, &g.comments),
            (&x.ref_frame, &x.comments),
            "{what}"
        );
        same_epoch(&g.epoch_start, &x.epoch_start, what);
        w = w.max(apm_value(
            g.duration,
            x.duration,
            &format!("{what} MAN_DURATION"),
        ));
        w = w.max(apm_values(&g.torque, &x.torque, &format!("{what} MAN_TOR")));
        assert_eq!(
            g.delta_mass.is_some(),
            x.delta_mass.is_some(),
            "{what}: MAN_DELTA_MASS"
        );
        if let (Some(a), Some(b)) = (g.delta_mass, x.delta_mass) {
            w = w.max(apm_value(a, b, &format!("{what} MAN_DELTA_MASS")));
        }
    }
    w
}

fn input(id: &str) -> Case {
    inputs().into_iter().find(|c| c.id == id).unwrap()
}

/// Cases whose Orekit-written file is absent because Orekit's writer refused them: pinned
/// findings (see the module documentation and RESULTS.md).
const OREKIT_WRITE_REFUSED: &[&str] = &["P02.kvn", "P02.xml"];

#[test]
fn l1_orekit_reads_every_kshana_message() {
    let p = dir().join("outputs/orekit_reads_kshana.txt");
    let dump = std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()));
    let got = parse_cases(&dump);
    let files = kshana_files();
    assert_eq!(got.len(), files.len(), "one dump block per Kshana file");
    let mut worst = 0.0f64;
    for g in &got {
        let fmt = g.format.clone().unwrap();
        let what = format!("L1 {} {fmt}", g.id);
        assert!(
            g.parse_error.is_none(),
            "{what}: Orekit failed: {:?}",
            g.parse_error
        );
        let want = input(&g.id);
        worst = worst.max(match (&g.aem, &want.aem, &g.apm, &want.apm) {
            (Some(a), Some(b), _, _) => check_aem(a, b, &what),
            (_, _, Some(a), Some(b)) => check_apm(a, b, &what),
            _ => panic!("{what}: kind differs"),
        });
    }
    eprintln!("L1: {} files, worst |d|/bar = {worst:.3e}", got.len());
}

#[test]
fn l2_kshana_reads_every_orekit_message() {
    let mut n = 0;
    let mut worst = 0.0f64;
    for (name, _) in kshana_files() {
        let p = dir().join("orekit").join(&name);
        if OREKIT_WRITE_REFUSED.contains(&name.as_str()) {
            assert!(
                !p.exists(),
                "{name}: pinned as refused by Orekit's writer, but present"
            );
            continue;
        }
        let text = std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()));
        let id = &name[..3];
        let want = input(id);
        let what = format!("L2 {name}");
        worst = worst.max(if let Some(w) = &want.aem {
            check_aem(
                &AemMessage::parse(&text).unwrap_or_else(|e| panic!("{what}: {e}")),
                w,
                &what,
            )
        } else {
            check_apm(
                &ApmMessage::parse(&text).unwrap_or_else(|e| panic!("{what}: {e}")),
                want.apm.as_ref().unwrap(),
                &what,
            )
        });
        n += 1;
    }
    eprintln!("L2: {n} files, worst |d|/bar = {worst:.3e}");
    assert_eq!(n, 31);
}

fn spacecraft_frame(f: &str) -> bool {
    f.starts_with("SC_BODY") || f.starts_with("INSTRUMENT")
}

#[test]
fn l3_record_rotations_match_orekit() {
    let dump = std::fs::read_to_string(dir().join("outputs/orekit_reads_kshana.txt")).unwrap();
    let mut n = 0;
    let mut worst = 0.0f64;
    for g in parse_cases(&dump) {
        let Some(_) = &g.aem else { continue };
        let want = input(&g.id);
        let w = want.aem.unwrap();
        assert_eq!(g.rots.len(), w.segments.len());
        for (s, (rots, seg)) in g.rots.iter().zip(&w.segments).enumerate() {
            assert_eq!(
                rots.len(),
                seg.records.len(),
                "{} segment {s}: rot lines",
                g.id
            );
            for (r, (rot, rec)) in rots.iter().zip(&seg.records).enumerate() {
                let q = quaternion_a_to_b(&seg.metadata, &rec.values).unwrap();
                // Orekit's external-to-body rotation, scalar first.
                let mine = if spacecraft_frame(&seg.metadata.ref_frame_a) {
                    [q[3], -q[0], -q[1], -q[2]]
                } else {
                    [q[3], q[0], q[1], q[2]]
                };
                let d_plus = (0..4).map(|k| (mine[k] - rot[k]).abs()).fold(0.0, f64::max);
                let d_minus = (0..4).map(|k| (mine[k] + rot[k]).abs()).fold(0.0, f64::max);
                let d = d_plus.min(d_minus);
                assert!(
                    d <= 1e-12,
                    "L3 {} {:?} segment {s} record {r}: {mine:?} vs {rot:?} ({d:e})",
                    g.id,
                    g.format
                );
                worst = worst.max(d / 1e-12);
                n += 1;
            }
        }
    }
    eprintln!("L3: {n} records, worst |d|/bar = {worst:.3e}");
    assert!(n > 0);
}
