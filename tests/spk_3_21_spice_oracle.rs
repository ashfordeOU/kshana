// SPDX-License-Identifier: AGPL-3.0-only
//! SPK types 3 (Chebyshev) and 21 (extended difference lines) against the NAIF SPICE Toolkit
//! (CSPICE N0067 via spiceypy 8.3.0), as pre-registered in
//! `xval/spk-3-21-spice/PREREGISTRATION.md` (e1cf80d8, committed alone before any of this code).
//!
//! `tests/fixtures/spk_3_21_spice_oracle/generate.py inputs` draws the records from the seed;
//! this test writes Kshana's kernels from them (`kshana/`, regenerate with
//! `KSHANA_XVAL_WRITE=1`); `generate.py oracle` has SPICE write its own kernels from the same
//! records (`spice/`) and evaluate both (`outputs/spice.json`). Legs W1 (inventory), W2 (SPICE on
//! Kshana's files vs Kshana's reader), B1/B2 (bytes vs SPICE's files) and R1 (Kshana's reader on
//! SPICE's files).
//!
//! First run (2026-10-14): every bar met. Kshana's G1-G3 are byte-identical to SPICE's, and
//! 48 876 state components agree bit for bit in W2 and in R1 (`xval/spk-3-21-spice/RESULTS.md`).

use kshana::spk_writer::{InterpolatedSpk, SpkFile, SpkSegment, SpkType};
use serde_json::Value;
use std::path::{Path, PathBuf};

fn dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/spk_3_21_spice_oracle")
}

fn json(rel: &str) -> Value {
    let p = dir().join(rel);
    serde_json::from_str(
        &std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display())),
    )
    .unwrap()
}

fn fv(v: &Value) -> Vec<f64> {
    v.as_array()
        .unwrap()
        .iter()
        .map(|x| x.as_f64().unwrap())
        .collect()
}

const FILES: [&str; 3] = ["G1", "G2", "G3"];

struct Case {
    seg: SpkSegment,
    eval: Vec<f64>,
}

fn segment(s: &Value) -> Case {
    let i = |k: &str| s[k].as_i64().unwrap();
    let kind = match i("type") {
        3 => SpkType::Chebyshev3,
        21 => SpkType::DiffLines21,
        13 => SpkType::Hermite13,
        o => panic!("type {o}"),
    };
    let frame = match s["frame"].as_str().unwrap() {
        "J2000" => 1,
        "ECLIPJ2000" => 17,
        o => panic!("{o}"),
    };
    Case {
        seg: SpkSegment {
            target: i("target") as i32,
            centre: i("centre") as i32,
            frame,
            kind,
            degree: i("degree") as usize,
            start: s["start"].as_f64().unwrap(),
            end: s["end"].as_f64().unwrap(),
            name: s["name"].as_str().unwrap().to_string(),
            epochs: fv(&s["epochs"]),
            states: s["states"]
                .as_array()
                .unwrap()
                .iter()
                .map(|r| fv(r).try_into().unwrap())
                .collect(),
            records: s["records"].as_array().unwrap().iter().map(fv).collect(),
            init: s["init"].as_f64().unwrap(),
            intlen: s["intlen"].as_f64().unwrap(),
        },
        eval: fv(&s["eval"]),
    }
}

/// The segments of a file, in file order, as `generate.py` assigns them.
fn file_cases(inp: &Value, f: &str) -> Vec<Case> {
    let all = inp["segments"].as_array().unwrap();
    if f == "G3" {
        ["G1 S1 CHEB DEG 12", "G2 S2 MDA 25", "G3 TYPE 13"]
            .iter()
            .map(|n| segment(all.iter().find(|s| s["name"] == *n).unwrap()))
            .collect()
    } else {
        all.iter().filter(|s| s["file"] == f).map(segment).collect()
    }
}

fn spk_file(inp: &Value, f: &str) -> SpkFile {
    let m = &inp["files"][f];
    SpkFile {
        ifname: m["ifname"].as_str().unwrap().to_string(),
        ncomch: m["ncomch"].as_u64().unwrap() as usize,
        comments: m["comments"]
            .as_array()
            .unwrap()
            .iter()
            .map(|c| c.as_str().unwrap().to_string())
            .collect(),
        segments: file_cases(inp, f).into_iter().map(|c| c.seg).collect(),
    }
}

#[test]
fn kshana_kernels_are_reproducible() {
    let inp = json("inputs.json");
    let write = std::env::var("KSHANA_XVAL_WRITE").is_ok();
    for f in FILES {
        let bytes = spk_file(&inp, f).to_bytes().unwrap();
        let p = dir().join("kshana").join(format!("{f}.bsp"));
        if write {
            std::fs::create_dir_all(p.parent().unwrap()).unwrap();
            std::fs::write(&p, &bytes).unwrap();
        } else {
            assert!(
                std::fs::read(&p).unwrap() == bytes,
                "{} is stale",
                p.display()
            );
        }
    }
}

/// The pre-registered state bar for one component.
fn bar(c: usize, spice: f64) -> f64 {
    let floor = if c < 3 { 1.0 } else { 1e-3 };
    1e-12 * spice.abs().max(floor)
}

#[derive(Default)]
struct Tally {
    n: usize,
    worst: f64,
    fails: Vec<String>,
}

impl Tally {
    fn check(&mut self, what: &str, et: f64, got: [f64; 6], want: &[f64], bars: [f64; 6]) {
        for c in 0..6 {
            self.n += 1;
            let d = (got[c] - want[c]).abs();
            if d > bars[c] {
                self.fails.push(format!(
                    "{what} ET {et:?} component {c}: Kshana {:e} SPICE {:e} (|d| {d:e}, bar {:e})",
                    got[c], want[c], bars[c]
                ));
            } else {
                self.worst = self.worst.max(d / bars[c]);
            }
        }
    }
}

/// W2 (on Kshana's files) or R1 (on SPICE's files): Kshana's reader vs SPICE's evaluations.
fn compare_evaluations(which: &str) -> Tally {
    let inp = json("inputs.json");
    let out = json("outputs/spice.json");
    let mut t = Tally::default();
    for f in FILES {
        let bytes = std::fs::read(dir().join(which).join(format!("{f}.bsp"))).unwrap();
        let spk = InterpolatedSpk::from_bytes(bytes).unwrap();
        let ev = &out["files"][f][which];
        for (k, c) in file_cases(&inp, f).iter().enumerate() {
            let rows = ev["pvn_geo"][k].as_array().unwrap();
            assert_eq!(rows.len(), c.eval.len(), "{f} segment {k}");
            for r in rows {
                let r = fv(r);
                let et = r[0];
                let seg = &spk.segments[k];
                let what = format!("{which} {f} {:?}", c.seg.name);
                let pvn = seg.eval(et).unwrap();
                let b: [f64; 6] = std::array::from_fn(|i| bar(i, r[1 + i]));
                t.check(&format!("{what} spkpvn"), et, pvn, &r[1..7], b);
                let geo = spk
                    .state(c.seg.target, c.seg.centre, c.seg.frame, et)
                    .unwrap();
                let b: [f64; 6] = std::array::from_fn(|i| bar(i, r[7 + i]));
                t.check(&format!("{what} spkgeo"), et, geo, &r[7..13], b);
            }
        }
        for ch in ev["chains"].as_array().unwrap() {
            let (tg, ob) = (
                ch["target"].as_i64().unwrap() as i32,
                ch["observer"].as_i64().unwrap() as i32,
            );
            for r in ch["rows"].as_array().unwrap() {
                let r = fv(r);
                let et = r[0];
                let got = spk.state(tg, ob, 1, et).unwrap();
                // the sum of the per-hop bars: -2103 wrt -2101, then -2101 wrt 399
                let h1 = spk.state(tg, -2101, 1, et).unwrap();
                let h2 = spk.state(-2101, ob, 1, et).unwrap();
                let b: [f64; 6] = std::array::from_fn(|i| bar(i, h1[i]) + bar(i, h2[i]));
                t.check(
                    &format!("{which} {f} chain {tg} wrt {ob}"),
                    et,
                    got,
                    &r[1..7],
                    b,
                );
            }
        }
    }
    t
}

#[test]
fn w1_spice_inventory_of_kshana_files_is_as_declared() {
    let inp = json("inputs.json");
    let out = json("outputs/spice.json");
    for f in FILES {
        let inv = &out["files"][f]["kshana"]["inventory"];
        let cases = file_cases(&inp, f);
        let bytes = std::fs::read(dir().join("kshana").join(format!("{f}.bsp"))).unwrap();
        let spk = InterpolatedSpk::from_bytes(bytes).unwrap();
        let segs = inv["segments"].as_array().unwrap();
        assert_eq!(segs.len(), cases.len(), "{f}");
        for ((s, c), r) in segs.iter().zip(&cases).zip(&spk.segments) {
            let ints: Vec<i64> = s["ints"]
                .as_array()
                .unwrap()
                .iter()
                .map(|x| x.as_i64().unwrap())
                .collect();
            assert_eq!(
                ints[..4],
                [
                    c.seg.target as i64,
                    c.seg.centre as i64,
                    c.seg.frame as i64,
                    c.seg.kind.code() as i64
                ],
                "{f} {}",
                c.seg.name
            );
            assert_eq!(
                fv(&s["doubles"]),
                vec![c.seg.start, c.seg.end],
                "{f} {}",
                c.seg.name
            );
            assert_eq!(s["name"].as_str().unwrap().trim_end(), c.seg.name, "{f}");
            assert_eq!(
                (ints[4] as usize, ints[5] as usize),
                r.addresses,
                "{f} {}",
                c.seg.name
            );
            assert_eq!(
                (r.target, r.centre, r.frame, r.kind),
                (c.seg.target, c.seg.centre, c.seg.frame, c.seg.kind)
            );
            assert_eq!(
                (r.start, r.end, r.name.trim_end()),
                (c.seg.start, c.seg.end, c.seg.name.as_str())
            );
        }
        let mut bodies: Vec<i64> = cases.iter().map(|c| c.seg.target as i64).collect();
        bodies.sort();
        let got: Vec<i64> = inv["bodies"]
            .as_array()
            .unwrap()
            .iter()
            .map(|x| x.as_i64().unwrap())
            .collect();
        assert_eq!(got, bodies, "{f}");
        for c in &cases {
            assert_eq!(
                fv(&inv["coverage"][c.seg.target.to_string()]),
                vec![c.seg.start, c.seg.end],
                "{f} {}",
                c.seg.name
            );
        }
    }
}

#[test]
fn w2_spice_on_kshana_files_matches_kshanas_reader() {
    let t = compare_evaluations("kshana");
    eprintln!("W2: {} components, worst {:.3e} of the bar", t.n, t.worst);
    assert!(
        t.fails.is_empty(),
        "{:#?}",
        &t.fails[..t.fails.len().min(20)]
    );
}

#[test]
fn r1_kshanas_reader_on_spice_files_matches_spice() {
    let t = compare_evaluations("spice");
    eprintln!("R1: {} components, worst {:.3e} of the bar", t.n, t.worst);
    assert!(
        t.fails.is_empty(),
        "{:#?}",
        &t.fails[..t.fails.len().min(20)]
    );
}

/// Character records of a DAF: the reserved (comment) records and every name record (the
/// record after each summary record), 1-based.
fn character_records(b: &[u8]) -> Vec<usize> {
    let i32_at = |o: usize| i32::from_le_bytes(b[o..o + 4].try_into().unwrap()) as usize;
    let fward = i32_at(76);
    let mut recs: Vec<usize> = (2..fward).collect();
    let mut sr = fward;
    while sr != 0 {
        recs.push(sr + 1);
        let o = (sr - 1) * 1024;
        sr = f64::from_le_bytes(b[o..o + 8].try_into().unwrap()) as usize;
    }
    recs
}

#[test]
fn b1_b2_kshana_files_equal_spices_but_character_record_tails() {
    for f in FILES {
        let k = std::fs::read(dir().join("kshana").join(format!("{f}.bsp"))).unwrap();
        let s = std::fs::read(dir().join("spice").join(format!("{f}.bsp"))).unwrap();
        let chars = character_records(&s);
        let n = k.len().max(s.len());
        let mut bad = Vec::new();
        for o in 0..n {
            let (a, b) = (k.get(o), s.get(o));
            if a != b {
                let rec = o / 1024 + 1;
                let tail = o % 1024 >= 1000 && chars.contains(&rec);
                // a byte present in one file only is allowed only inside such a tail
                if !tail {
                    bad.push(o);
                }
            }
        }
        assert!(
            bad.is_empty(),
            "{f}: {} differing bytes outside character-record tails, first at {:?} (lengths {} vs {})",
            bad.len(),
            bad.first(),
            k.len(),
            s.len()
        );
    }
}
