// SPDX-License-Identifier: AGPL-3.0-only
//! D8b row 9 (`VM-6254a75d`): the detection ROC with the C/N0 CUSUM restarted at each scored
//! window's start (`[monitors] roc_restart`, default on), against the bars of
//! `docs/design/DETECTION-ROC.md` §2, with the readings and the oracle of
//! `xval/d8b-roc-restart/` (committed before the engine change).
//!
//! * the restart itself, on seeded synthetic CUSUM-shaped series, against `oracle.py`
//!   (reading 5a (i));
//! * the control: `roc_restart = false` reproduces the recorded R1 and R2 (reading 2);
//! * the scored re-run: R1 and R2 on the seen and the fresh seeds (readings 3 and 4), with each
//!   `cn0_drop` AUC recomputed by `oracle.py` from the cells' window maxima (reading 5a (ii)).
//!
//! PIN-SCOPE: none. PIN-EXCLUDES: everything (no output hash is pinned here).

#[path = "support/monitor_campaign.rs"]
mod support;
use kshana::iq::campaign::detect::{roc, windows, KindSpan, Roc};
use kshana::iq::campaign::report::rocs;
use kshana::iq::campaign::{CellResult, TestConditions};
use support::{campaign, scratch, Rec};

const ORACLE: &str = "xval/d8b-roc-restart/oracle.py";

fn recipe(seed0: u64, atten_db: f64) -> Vec<Rec> {
    let pool = [
        (3u8, 1200.0),
        (11, -800.0),
        (19, 300.0),
        (7, 2300.0),
        (24, -1700.0),
        (14, 650.0),
    ];
    (0..6)
        .map(|i| Rec {
            id: format!("r{i}"),
            seed: seed0 + i as u64,
            duration_s: 22.0,
            sats: (0..3).map(|j| pool[(i + 2 * j) % pool.len()]).collect(),
            atten: Some((10.0, 16.0, atten_db)),
        })
        .collect()
}

fn kind<'a>(r: &'a [Roc], k: &str) -> &'a Roc {
    r.iter()
        .find(|x| x.kind == k)
        .unwrap_or_else(|| panic!("no ROC for {k}"))
}

/// Run `oracle.py` on a dump; its JSON answer.
fn oracle(name: &str, dump: &serde_json::Value) -> serde_json::Value {
    let p = scratch(name).join("dump.json");
    std::fs::write(&p, serde_json::to_string(dump).unwrap()).unwrap();
    let out = std::process::Command::new("python3")
        .arg("-I")
        .arg(ORACLE)
        .arg(&p)
        .output()
        .expect("python3");
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    serde_json::from_slice(&out.stdout).unwrap()
}

/// Reading 5a (ii): the `cn0_drop` AUC recomputed by the oracle from the cells' window maxima.
fn auc_oracle(name: &str, cells: &[CellResult], engine_auc: f64) -> f64 {
    let cs: Vec<serde_json::Value> = cells
        .iter()
        .filter_map(|c| c.monitors.as_ref())
        .map(|m| {
            let ws: Vec<serde_json::Value> = m
                .windows
                .iter()
                .filter(|w| w.kind == "cn0_drop")
                .map(|w| {
                    serde_json::json!({"channel": w.channel, "t0_s": w.t0_s, "t1_s": w.t1_s,
                        "event_id": w.event_id, "max": w.max})
                })
                .collect();
            serde_json::json!({ "windows": ws })
        })
        .collect();
    let o = oracle(name, &serde_json::json!({"cells": cs, "auc": engine_auc}));
    o["auc_diff"].as_f64().unwrap()
}

/// A seeded random walk clamped at zero, sampled every 0.1 s: the shape of a one-sided CUSUM.
fn cusum_like(seed: u64, n: usize) -> Vec<(f64, f64)> {
    let mut s = seed.wrapping_mul(0x9E37_79B9_7F4A_7C15) | 1;
    let mut g = 0.0f64;
    (0..n)
        .map(|i| {
            s ^= s << 13;
            s ^= s >> 7;
            s ^= s << 17;
            let u = (s >> 11) as f64 / (1u64 << 53) as f64;
            g = (g + 2.2 * u - 1.0).max(0.0);
            (i as f64 * 0.1, g)
        })
        .collect()
}

#[test]
fn the_restart_agrees_with_the_oracle_on_synthetic_cusum_series() {
    let tc = TestConditions::parse(
        "schema = \"kshana.test-conditions/1\"\n[recording]\nid = \"r\"\npath = \"r.cf32\"\nsettle_s = 1.0\n[[expected]]\nsignal = \"gps-l1ca\"\nids = [3, 5, 7]\n[[event]]\nid = \"e1\"\nkind = \"other\"\ntype = \"unknown\"\nonset_s = 10.0\noffset_s = 16.0\naffects = [3, 7]\n",
    )
    .unwrap();
    let (mut cells, mut pos, mut neg, mut differs) = (Vec::new(), Vec::new(), Vec::new(), 0);
    for seed in 0..8u64 {
        let mut series = serde_json::Map::new();
        let mut ws = Vec::new();
        for (j, sat) in [3i64, 5, 7].into_iter().enumerate() {
            let ch = format!("G{sat:02}");
            let s = cusum_like(seed * 3 + j as u64 + 1, 300);
            let k = KindSpan {
                kind: "cn0_drop".into(),
                channel: Some(ch.clone()),
                sat: Some(sat),
                from_s: 2.0,
                to_s: 29.9,
            };
            let plain = windows(&k, &s, &tc, 1.0, 5.0, false);
            let restarted = windows(&k, &s, &tc, 1.0, 5.0, true);
            assert_eq!(plain.len(), restarted.len());
            for (p, r) in plain.iter().zip(&restarted) {
                // The restarted statistic never exceeds the running one.
                assert!(r.max <= p.max + 1e-12, "{} > {}", r.max, p.max);
                differs += usize::from(r.max != p.max);
            }
            for w in &restarted {
                (if w.event_id.is_some() {
                    &mut pos
                } else {
                    &mut neg
                })
                .push(w.max);
                ws.push(
                    serde_json::json!({"channel": ch, "t0_s": w.t0_s, "t1_s": w.t1_s,
                    "event_id": w.event_id, "max": w.max}),
                );
            }
            series.insert(
                ch,
                serde_json::Value::Array(
                    s.iter().map(|&(t, g)| serde_json::json!([t, g])).collect(),
                ),
            );
        }
        cells.push(serde_json::json!({"series": series, "windows": ws}));
    }
    assert!(
        differs > 0,
        "the synthetic series never exercise the restart"
    );
    let auc = roc("cn0_drop", &pos, &neg, None).auc.unwrap();
    let o = oracle(
        "synthetic",
        &serde_json::json!({"cells": cells, "auc": auc}),
    );
    eprintln!("synthetic restart: {o}");
    assert!(o["windows_checked"].as_u64().unwrap() >= 100);
    assert!(o["worst_abs_diff"].as_f64().unwrap() <= 1e-9, "{o}");
    assert!(o["auc_diff"].as_f64().unwrap() <= 1e-9, "{o}");
}

/// At the 1 s C/N0 cadence row 9 was scored at (`xval/d8b-cn0-stride/` reading 8).
const R1_MON: &str = "[monitors]\nroc_window_s = 6.0\n[monitors.epoch.cn0]\nstride = 1000\n";
const R2_MON: &str =
    "[monitors]\nroc_window_s = 6.0\n[monitors.epoch.cn0]\nstride = 1000\n[monitors.power]\n";
const OFF: &str = "roc_restart = false\n";

fn with_off(m: &str) -> String {
    m.replacen(
        "roc_window_s = 6.0\n",
        &format!("roc_window_s = 6.0\n{OFF}"),
        1,
    )
}

/// R1: the `cn0_drop` ROC on 6 dB attenuations; (AUC, positives, negatives, oracle AUC diff).
fn r1(name: &str, seed0: u64, mon: &str) -> (f64, usize, usize, f64) {
    let cells = campaign(name, &recipe(seed0, 6.0), mon);
    let r = rocs(&cells);
    let c = kind(&r, "cn0_drop");
    let auc = c.auc.unwrap();
    eprintln!(
        "{name}: cn0_drop AUC {auc:.4} over {} positive and {} negative windows; at the threshold {:?}: {:?}",
        c.positives, c.negatives, c.threshold, c.at_threshold
    );
    let d = auc_oracle(name, &cells, auc);
    (auc, c.positives, c.negatives, d)
}

/// R2: the AUC of each kind with nothing to detect, and the oracle's `cn0_drop` AUC diff.
fn r2(name: &str, seed0: u64, mon: &str) -> ([f64; 3], f64) {
    let cells = campaign(name, &recipe(seed0, 0.0), mon);
    let r = rocs(&cells);
    let mut a = [0.0; 3];
    for (i, k) in ["cn0_drop", "sqm_delta", "power_drop"]
        .into_iter()
        .enumerate()
    {
        let c = kind(&r, k);
        a[i] = c.auc.unwrap();
        eprintln!(
            "{name} {k}: AUC {:.4} over {} positive and {} negative windows",
            a[i], c.positives, c.negatives
        );
    }
    let d = auc_oracle(name, &cells, a[0]);
    (a, d)
}

#[test]
#[cfg_attr(debug_assertions, ignore = "IQ campaign: run in release")]
fn control_without_the_restart_reproduces_the_recorded_r1_and_r2() {
    let (auc, p, n, _) = r1("ctl-r1", 300, &with_off(R1_MON));
    assert_eq!((p, n), (18, 36));
    assert!((auc - 0.7855).abs() < 5e-5, "control R1 AUC {auc:.6}");
    let (a, _) = r2("ctl-r2", 400, &with_off(R2_MON));
    for (got, want) in a.iter().zip([0.5000, 0.5664, 0.6389]) {
        assert!((got - want).abs() < 5e-5, "control R2 {a:?}");
    }
}

#[test]
#[cfg_attr(debug_assertions, ignore = "IQ campaign: run in release")]
fn r1_with_the_restart_seen_and_fresh_seeds() {
    let mut miss = Vec::new();
    for (name, seed0) in [("r1-seen", 300u64), ("r1-fresh", 100_300)] {
        let (auc, p, n, d) = r1(name, seed0, R1_MON);
        assert_eq!(p, 18);
        assert!(n >= 18);
        assert!(d <= 1e-9, "{name}: oracle AUC differs by {d}");
        if auc < 0.95 {
            miss.push(format!("{name}: {auc:.4}"));
        }
    }
    assert!(miss.is_empty(), "R1 NOT MET: {miss:?}");
}

#[test]
#[cfg_attr(debug_assertions, ignore = "IQ campaign: run in release")]
fn r2_with_the_restart_seen_and_fresh_seeds() {
    let mut bad = Vec::new();
    for (name, seed0) in [("r2-seen", 400u64), ("r2-fresh", 100_400)] {
        let (a, d) = r2(name, seed0, R2_MON);
        assert!(d <= 1e-9, "{name}: oracle AUC differs by {d}");
        for (k, auc) in ["cn0_drop", "sqm_delta", "power_drop"].iter().zip(a) {
            if (auc - 0.5).abs() > 0.2 {
                bad.push(format!("{name} {k}: {auc:.4}"));
            }
        }
    }
    assert!(bad.is_empty(), "R2 NOT MET: {bad:?}");
}
