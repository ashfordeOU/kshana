// SPDX-License-Identifier: AGPL-3.0-only
//! The SPK type 9/13 writer and reader against the NAIF SPICE Toolkit (CSPICE N0067 through
//! spiceypy 8.3.0), as pre-registered in `xval/spk-writer-spice/PREREGISTRATION.md` (5059fd2a,
//! committed before any comparison). Inputs are synthetic Kepler arcs drawn from the
//! pre-registered seed (`tests/fixtures/spk_writer_spice_oracle/inputs.json`).
//!
//! Kshana writes the kernels in memory from the committed inputs; their SHA-256 must equal the
//! digests recorded when SPICE read them (`outputs/spice.json`), so the committed SPICE values
//! apply to exactly these bytes. With `KSHANA_XVAL_WRITE=1` the kernels are also written to
//! `kshana/` for the generator. SPICE's own kernels (`spice/*.bsp`) are committed.
//!
//! Legs: W1 inventory, W2 SPICE vs Kshana on Kshana files, W3 SPICE at the nodes vs the
//! inputs, R1 Kshana on SPICE files, B1/B2 bytes, T1-T3 the OEM export. State bars are
//! computed here from the inputs only (see the pre-registration).

use kshana::spk_writer::*;
use serde_json::Value;
use sha2::{Digest, Sha256};
use std::path::{Path, PathBuf};

const U: f64 = f64::EPSILON / 2.0;

fn dir() -> PathBuf {
    Path::new(env!("CARGO_MANIFEST_DIR")).join("tests/fixtures/spk_writer_spice_oracle")
}

fn load(rel: &str) -> Value {
    let p = dir().join(rel);
    // Committed: a missing file is a failure, never a skip.
    let s = std::fs::read_to_string(&p).unwrap_or_else(|e| panic!("{}: {e}", p.display()));
    serde_json::from_str(&s).unwrap()
}

fn f(v: &Value) -> f64 {
    v.as_f64().unwrap_or_else(|| panic!("not a number: {v}"))
}

fn fv(v: &Value) -> Vec<f64> {
    v.as_array().unwrap().iter().map(f).collect()
}

fn i(v: &Value) -> i64 {
    v.as_i64().unwrap_or_else(|| panic!("not an integer: {v}"))
}

/// One input segment with its evaluation epochs.
#[derive(Clone)]
struct Inp {
    seg: SpkSegment,
    eval: Vec<f64>,
}

fn inputs() -> (Value, Vec<(String, Inp)>) {
    let v = load("inputs.json");
    let segs = v["segments"]
        .as_array()
        .unwrap()
        .iter()
        .map(|s| {
            let frame = match s["frame"].as_str().unwrap() {
                "J2000" => 1,
                "ECLIPJ2000" => 17,
                o => panic!("{o}"),
            };
            let seg = SpkSegment {
                target: i(&s["target"]) as i32,
                centre: i(&s["centre"]) as i32,
                frame,
                kind: if i(&s["type"]) == 9 {
                    SpkType::Lagrange9
                } else {
                    SpkType::Hermite13
                },
                degree: i(&s["degree"]) as usize,
                start: f(&s["start"]),
                end: f(&s["end"]),
                name: s["name"].as_str().unwrap().to_string(),
                epochs: fv(&s["epochs"]),
                states: s["states"]
                    .as_array()
                    .unwrap()
                    .iter()
                    .map(|r| fv(r).try_into().unwrap())
                    .collect(),
                records: vec![],
                init: 0.0,
                intlen: 0.0,
            };
            (
                s["file"].as_str().unwrap().to_string(),
                Inp {
                    seg,
                    eval: fv(&s["eval"]),
                },
            )
        })
        .collect();
    (v, segs)
}

fn file_inputs(all: &[(String, Inp)], name: &str) -> Vec<Inp> {
    let src = if name == "F4" { "F3" } else { name };
    let v: Vec<Inp> = all
        .iter()
        .filter(|(f, _)| f == src)
        .map(|(_, s)| s.clone())
        .collect();
    if name == "F4" {
        v[..25].to_vec()
    } else {
        v
    }
}

fn kshana_file(meta: &Value, name: &str, segs: &[Inp]) -> Vec<u8> {
    let m = &meta["files"][name];
    SpkFile {
        ifname: m["ifname"].as_str().unwrap().to_string(),
        ncomch: i(&m["ncomch"]) as usize,
        comments: m["comments"]
            .as_array()
            .unwrap()
            .iter()
            .map(|c| c.as_str().unwrap().to_string())
            .collect(),
        segments: segs.iter().map(|s| s.seg.clone()).collect(),
    }
    .to_bytes()
    .unwrap()
}

const OEM_EXPORTS: [OemExport; 2] = [
    OemExport {
        target: -1201,
        kind: SpkType::Hermite13,
        degree: 7,
    },
    OemExport {
        target: -1202,
        kind: SpkType::Lagrange9,
        degree: 7,
    },
];

fn oem_segments() -> Vec<SpkSegment> {
    let text = std::fs::read_to_string(dir().join("oem_input.oem")).unwrap();
    oem_to_spk_segments(&text, &OEM_EXPORTS).unwrap()
}

fn oem_file() -> Vec<u8> {
    SpkFile {
        ifname: "KSHANA OEM EXPORT".into(),
        ncomch: 0,
        comments: vec![],
        segments: oem_segments(),
    }
    .to_bytes()
    .unwrap()
}

fn sha(b: &[u8]) -> String {
    hex::encode(Sha256::digest(b))
}

// ---------------------------------------------------------------------------------------------
// The pre-registered state bar.

fn lagrange_basis(x: &[f64], t: f64) -> Vec<f64> {
    (0..x.len())
        .map(|i| {
            (0..x.len())
                .filter(|&j| j != i)
                .map(|j| (t - x[j]) / (x[i] - x[j]))
                .product()
        })
        .collect()
}

fn lagrange_basis_deriv(x: &[f64], t: f64) -> Vec<f64> {
    let m = x.len();
    (0..m)
        .map(|i| {
            (0..m)
                .filter(|&k| k != i)
                .map(|k| {
                    (0..m)
                        .filter(|&j| j != i && j != k)
                        .map(|j| (t - x[j]) / (x[i] - x[j]))
                        .product::<f64>()
                        / (x[i] - x[k])
                })
                .sum()
        })
        .collect()
}

/// The bar of each of the six components at `t` for segment `s`: the maximum over every run of
/// `m` consecutive nodes whose span contains `t` (for a one-node window, the two nodes either
/// side of `t`).
fn state_bar(s: &SpkSegment, t: f64) -> [f64; 6] {
    let m = s.window();
    let n = s.epochs.len();
    let mut starts: Vec<usize> = (0..=n - m)
        .filter(|&a| s.epochs[a] <= t && t <= s.epochs[a + m - 1])
        .collect();
    if starts.is_empty() {
        assert_eq!(m, 1);
        let k = s.epochs.iter().filter(|&&e| e < t).count();
        starts = vec![k.saturating_sub(1), k.min(n - 1)];
    }
    let mut out = [0.0f64; 6];
    for a in starts {
        let x = &s.epochs[a..a + m];
        let st = &s.states[a..a + m];
        match s.kind {
            SpkType::Lagrange9 => {
                let l = lagrange_basis(x, t);
                let k = m as f64;
                for c in 0..6 {
                    let b: f64 = (0..m).map(|i| l[i].abs() * st[i][c].abs()).sum();
                    let sm = st.iter().map(|y| y[c].abs()).fold(0.0, f64::max);
                    out[c] = out[c].max(16.0 * k * U * (b + sm));
                }
            }
            SpkType::Hermite13 => {
                let l = lagrange_basis(x, t);
                let dl = lagrange_basis_deriv(x, t);
                let k = 2.0 * m as f64;
                let span = x[m - 1] - x[0];
                let delta = x
                    .windows(2)
                    .map(|w| w[1] - w[0])
                    .fold(f64::INFINITY, f64::min);
                for c in 0..3 {
                    let (mut bp, mut bv) = (0.0, 0.0);
                    let (mut sp, mut sv) = (0.0f64, 0.0f64);
                    for i in 0..m {
                        let ai: f64 = (0..m)
                            .filter(|&j| j != i)
                            .map(|j| 1.0 / (x[i] - x[j]))
                            .sum();
                        let dx = t - x[i];
                        let h = (1.0 - 2.0 * ai * dx) * l[i] * l[i];
                        let kk = dx * l[i] * l[i];
                        let dh =
                            -2.0 * ai * l[i] * l[i] + (1.0 - 2.0 * ai * dx) * 2.0 * l[i] * dl[i];
                        let dk = l[i] * l[i] + 2.0 * dx * l[i] * dl[i];
                        let (p, v) = (st[i][c].abs(), st[i][c + 3].abs());
                        bp += h.abs() * p + kk.abs() * v;
                        bv += dh.abs() * p + dk.abs() * v;
                        sp = sp.max(p).max(v * span);
                        sv = sv.max(p / delta).max(v);
                    }
                    out[c] = out[c].max(16.0 * k * U * (bp + sp));
                    out[c + 3] = out[c + 3].max(16.0 * k * U * (bv + sv));
                }
            }
        }
    }
    out
}

/// The segment SPICE's priority rule picks for `target` at `t` (the last one in the file that
/// covers it).
fn chosen(segs: &[Inp], target: i32, t: f64) -> &SpkSegment {
    &segs
        .iter()
        .rev()
        .find(|s| s.seg.target == target && s.seg.start <= t && t <= s.seg.end)
        .unwrap()
        .seg
}

fn within(a: &[f64], b: &[f64], bar: &[f64; 6], what: &str) -> f64 {
    let mut worst = 0.0f64;
    for c in 0..6 {
        let d = (a[c] - b[c]).abs();
        assert!(
            d <= bar[c],
            "{what}: component {c}: |{} - {}| = {d:e} > bar {:e}",
            a[c],
            b[c],
            bar[c]
        );
        worst = worst.max(d / bar[c]);
    }
    worst
}

// ---------------------------------------------------------------------------------------------

#[test]
fn kshana_kernels_hash_to_the_digests_spice_read() {
    let (meta, all) = inputs();
    let write = std::env::var("KSHANA_XVAL_WRITE").is_ok();
    let out = if write {
        std::fs::create_dir_all(dir().join("kshana")).unwrap();
        Value::Null
    } else {
        load("outputs/spice.json")
    };
    for name in ["F1", "F2", "F3", "F4"] {
        let b = kshana_file(&meta, name, &file_inputs(&all, name));
        if write {
            std::fs::write(dir().join(format!("kshana/{name}.bsp")), &b).unwrap();
        } else {
            assert_eq!(
                sha(&b),
                out["files"][name]["kshana_sha256"].as_str().unwrap(),
                "{name}"
            );
        }
    }
    let b = oem_file();
    if write {
        std::fs::write(dir().join("kshana/oem_export.bsp"), &b).unwrap();
    } else {
        assert_eq!(sha(&b), out["oem"]["kshana_sha256"].as_str().unwrap());
    }
}

fn coverage(segs: &[SpkSegment], body: i32) -> Vec<f64> {
    let mut iv: Vec<(f64, f64)> = segs
        .iter()
        .filter(|s| s.target == body)
        .map(|s| (s.start, s.end))
        .collect();
    iv.sort_by(|a, b| a.partial_cmp(b).unwrap());
    let mut out: Vec<(f64, f64)> = Vec::new();
    for (a, b) in iv {
        match out.last_mut() {
            Some(l) if a <= l.1 => l.1 = l.1.max(b),
            _ => out.push((a, b)),
        }
    }
    out.into_iter().flat_map(|(a, b)| [a, b]).collect()
}

/// W1 / T3: the inventory SPICE reads equals the declared values and Kshana's own reader.
fn check_inventory(inv: &Value, segs: &[SpkSegment], bytes: Vec<u8>, what: &str) {
    let k = InterpolatedSpk::from_bytes(bytes).unwrap();
    let si = inv["segments"].as_array().unwrap();
    assert_eq!(si.len(), segs.len(), "{what}: segment count");
    assert_eq!(k.segments.len(), segs.len());
    for (j, ((o, s), r)) in si.iter().zip(segs).zip(&k.segments).enumerate() {
        assert_eq!(fv(&o["doubles"]), vec![s.start, s.end], "{what} seg {j}");
        let ints: Vec<i64> = o["ints"].as_array().unwrap().iter().map(i).collect();
        assert_eq!(
            ints[..4],
            [
                s.target as i64,
                s.centre as i64,
                s.frame as i64,
                s.kind.code() as i64
            ],
            "{what} seg {j}"
        );
        assert_eq!(
            (ints[4] as usize, ints[5] as usize),
            r.addresses,
            "{what} seg {j}"
        );
        assert_eq!(o["name"].as_str().unwrap(), s.name, "{what} seg {j}");
        assert_eq!(
            (r.start, r.end, r.name.as_str()),
            (s.start, s.end, s.name.as_str())
        );
    }
    let mut bodies: Vec<i64> = segs.iter().map(|s| s.target as i64).collect();
    bodies.sort();
    bodies.dedup();
    let got: Vec<i64> = inv["bodies"].as_array().unwrap().iter().map(i).collect();
    assert_eq!(got, bodies, "{what}: spkobj");
    for b in bodies {
        assert_eq!(
            fv(&inv["coverage"][b.to_string()]),
            coverage(segs, b as i32),
            "{what}: spkcov {b}"
        );
    }
}

#[test]
fn w1_inventory_matches_the_declared_values() {
    let (meta, all) = inputs();
    let out = load("outputs/spice.json");
    for name in ["F1", "F2", "F3", "F4"] {
        let segs: Vec<SpkSegment> = file_inputs(&all, name).into_iter().map(|s| s.seg).collect();
        let b = kshana_file(&meta, name, &file_inputs(&all, name));
        check_inventory(&out["files"][name]["kshana"]["inventory"], &segs, b, name);
    }
}

/// Evaluations of one file by SPICE (pvn per segment, geo per body) against Kshana's reader of
/// `bytes`; returns the worst |difference| / bar.
fn check_evals(res: &Value, segs: &[Inp], bytes: Vec<u8>, what: &str) -> f64 {
    let k = InterpolatedSpk::from_bytes(bytes).unwrap();
    let mut worst = 0.0f64;
    let mut count = 0;
    for (j, (rows, s)) in res["pvn_geo"]
        .as_array()
        .unwrap()
        .iter()
        .zip(segs)
        .enumerate()
    {
        let rows = rows.as_array().unwrap();
        assert_eq!(rows.len(), s.eval.len(), "{what} seg {j}");
        for (r, &t) in rows.iter().zip(&s.eval) {
            let r = fv(r);
            assert_eq!(r[0], t);
            let mine = k.segments[j].eval(t).unwrap();
            let bar = state_bar(&s.seg, t);
            worst = worst.max(within(
                &r[1..7],
                &mine,
                &bar,
                &format!("{what} seg {j} pvn ET {t}"),
            ));
            let geo_seg = chosen(segs, s.seg.target, t);
            let gbar = state_bar(geo_seg, t);
            let mine_geo = k.state(s.seg.target, s.seg.centre, s.seg.frame, t).unwrap();
            worst = worst.max(within(
                &r[7..13],
                &mine_geo,
                &gbar,
                &format!("{what} seg {j} geo ET {t}"),
            ));
            count += 1;
        }
    }
    for c in res["chains"].as_array().unwrap() {
        let (targ, obs) = (i(&c["target"]) as i32, i(&c["observer"]) as i32);
        for r in c["rows"].as_array().unwrap() {
            let r = fv(r);
            let t = r[0];
            let mine = k.state(targ, obs, 1, t).unwrap();
            // Hops: -1003 -> -1001 -> 399.
            let mut bar = [0.0; 6];
            let mut mags = [0.0; 2];
            for body in [-1003, -1001] {
                let s = chosen(segs, body, t);
                let b = state_bar(s, t);
                let st = k.state(body, s.centre, 1, t).unwrap();
                for c in 0..6 {
                    bar[c] += b[c];
                }
                mags[0] += (st[0] * st[0] + st[1] * st[1] + st[2] * st[2]).sqrt();
                mags[1] += (st[3] * st[3] + st[4] * st[4] + st[5] * st[5]).sqrt();
            }
            for c in 0..6 {
                bar[c] += 4.0 * U * mags[c / 3];
            }
            worst = worst.max(within(
                &r[1..7],
                &mine,
                &bar,
                &format!("{what} chain {targ} wrt {obs} ET {t}"),
            ));
            count += 1;
        }
    }
    assert!(count > 0);
    worst
}

#[test]
fn w2_spice_and_kshana_agree_on_kshana_kernels() {
    let (meta, all) = inputs();
    let out = load("outputs/spice.json");
    for name in ["F1", "F2", "F3", "F4"] {
        let segs = file_inputs(&all, name);
        let b = kshana_file(&meta, name, &segs);
        let w = check_evals(&out["files"][name]["kshana"], &segs, b, name);
        eprintln!("W2 {name}: worst |d|/bar = {w:.3e}");
    }
}

#[test]
fn w3_spice_at_the_nodes_returns_the_inputs() {
    let (_, all) = inputs();
    let out = load("outputs/spice.json");
    let mut worst = 0.0f64;
    for name in ["F1", "F2", "F3", "F4"] {
        let segs = file_inputs(&all, name);
        for (j, (rows, s)) in out["files"][name]["kshana"]["pvn_geo"]
            .as_array()
            .unwrap()
            .iter()
            .zip(&segs)
            .enumerate()
        {
            for r in rows.as_array().unwrap() {
                let r = fv(r);
                if let Some(k) = s.seg.epochs.iter().position(|&e| e == r[0]) {
                    let bar = state_bar(&s.seg, r[0]);
                    worst = worst.max(within(
                        &r[1..7],
                        &s.seg.states[k],
                        &bar,
                        &format!("{name} seg {j} node {k}"),
                    ));
                }
            }
        }
    }
    eprintln!("W3: worst |d|/bar = {worst:.3e}");
}

fn spice_bytes(name: &str) -> Vec<u8> {
    std::fs::read(dir().join(format!("spice/{name}.bsp"))).unwrap()
}

#[test]
fn r1_kshana_reads_spice_written_kernels_as_spice_does() {
    let (_, all) = inputs();
    let out = load("outputs/spice.json");
    for name in ["F1", "F2", "F3", "F4"] {
        let b = spice_bytes(name);
        assert_eq!(
            sha(&b),
            out["files"][name]["spice_sha256"].as_str().unwrap()
        );
        let segs = file_inputs(&all, name);
        let w = check_evals(&out["files"][name]["spice"], &segs, b, name);
        eprintln!("R1 {name}: worst |d|/bar = {w:.3e}");
    }
}

/// Byte ranges of character records (reserved/comment and name records) in a Kshana file.
fn char_records(bytes: &[u8]) -> Vec<usize> {
    let fward = i32::from_le_bytes(bytes[76..80].try_into().unwrap()) as usize;
    let mut recs: Vec<usize> = (2..fward).collect();
    let mut rec = fward;
    while rec != 0 {
        recs.push(rec + 1);
        let off = (rec - 1) * 1024;
        rec = f64::from_le_bytes(bytes[off..off + 8].try_into().unwrap()) as usize;
    }
    recs
}

#[test]
fn b1_b2_kshana_kernels_are_byte_identical_to_spice_kernels() {
    let (meta, all) = inputs();
    let out = load("outputs/spice.json");
    for name in ["F1", "F2", "F3", "F4"] {
        let segs = file_inputs(&all, name);
        let k = kshana_file(&meta, name, &segs);
        let s = spice_bytes(name);
        // B1: every segment's data words and every summary record.
        for (j, o) in out["files"][name]["spice"]["inventory"]["segments"]
            .as_array()
            .unwrap()
            .iter()
            .enumerate()
        {
            let ints: Vec<i64> = o["ints"].as_array().unwrap().iter().map(i).collect();
            let (a, b) = ((ints[4] as usize - 1) * 8, ints[5] as usize * 8);
            assert!(
                k[a..b] == s[a..b],
                "B1 {name} segment {j}: data words differ"
            );
        }
        let mut rec = i32::from_le_bytes(s[76..80].try_into().unwrap()) as usize;
        while rec != 0 {
            let off = (rec - 1) * 1024;
            assert!(
                k[off..off + 1024] == s[off..off + 1024],
                "B1 {name}: summary record {rec} differs"
            );
            rec = f64::from_le_bytes(s[off..off + 8].try_into().unwrap()) as usize;
        }
        // B2: the whole file, allowing only bytes 1001-1024 of character records.
        assert_eq!(k.len(), s.len(), "B2 {name}: length");
        let chars = char_records(&k);
        let diffs: Vec<usize> = (0..k.len()).filter(|&b| k[b] != s[b]).collect();
        let disallowed: Vec<usize> = diffs
            .iter()
            .copied()
            .filter(|&b| !(chars.contains(&(b / 1024 + 1)) && b % 1024 >= 1000))
            .collect();
        assert!(
            disallowed.is_empty(),
            "B2 {name}: {} differing bytes outside the allowed tails, first at {}",
            disallowed.len(),
            disallowed[0]
        );
        eprintln!(
            "B2 {name}: {} bytes differ, all in allowed tails",
            diffs.len()
        );
    }
}

#[test]
fn t1_t2_t3_oem_export_matches_spice() {
    let out = load("outputs/spice.json");
    let segs = oem_segments();
    check_inventory(&out["oem"]["inventory"], &segs, oem_file(), "OEM");
    let mut worst_t = 0.0f64;
    let mut worst = 0.0f64;
    let lines = out["oem"]["lines"].as_array().unwrap();
    assert_eq!(lines.len(), 41 + 31);
    for row in lines {
        let ts = row["time_system"].as_str().unwrap();
        let label = row["label"].as_str().unwrap();
        let et_spice = f(&row["et"]);
        let et_k = et_from_label(label, ts).unwrap();
        let d = (et_k - et_spice).abs();
        assert!(d <= 1e-6, "T1 {label} {ts}: |d| = {d:e} s");
        worst_t = worst_t.max(d);
        let seg = if ts == "UTC" { &segs[0] } else { &segs[1] };
        let state = fv(&row["state"]);
        let spice_state = fv(&row["spice_state"]);
        let mut bar = state_bar(seg, et_k.clamp(seg.start, seg.end));
        let speed = (state[3] * state[3] + state[4] * state[4] + state[5] * state[5]).sqrt();
        for c in 0..3 {
            bar[c] += 1e-6 * speed;
            bar[c + 3] += 1e-6 * 0.01;
        }
        worst = worst.max(within(&spice_state, &state, &bar, &format!("T2 {label}")));
    }
    eprintln!("T1 worst {worst_t:e} s; T2 worst |d|/bar = {worst:.3e}");
}
