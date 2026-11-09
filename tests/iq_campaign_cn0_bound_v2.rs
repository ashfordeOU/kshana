// SPDX-License-Identifier: AGPL-3.0-only
//! D8b row 8 v2: M3's timing clause with the C/N0 estimator's delay, `D_est + 2 x ARL1 x stride`
//! (`docs/design/evidence/d8b-iq-timing-campaign-rerun/PREREGISTRATION-v2.md`, signed 9 November
//! 2026; readings and oracle in `xval/d8b-cn0-bound-v2/`, committed before this code). The
//! stepped campaign at the default stride, on seeds 200-205 and 100200-100205 (seen) and
//! 200200-200205 (fresh); M4 on the same.
//!
//! PIN-SCOPE: none. PIN-EXCLUDES: everything (no output hash is pinned here).

#[path = "support/monitor_campaign.rs"]
mod support;
use kshana::iq::campaign::CellResult;
use kshana::iq::monitor::stats;
use support::{campaign, Rec};

const ATT_DB: f64 = 6.0;

fn stepped(name: &str, seed0: u64, mon: &str) -> Vec<CellResult> {
    let pool = [
        (3u8, 1200.0),
        (11, -800.0),
        (19, 300.0),
        (7, 2300.0),
        (24, -1700.0),
        (14, 650.0),
    ];
    let recs: Vec<Rec> = (0..6)
        .map(|i| Rec {
            id: format!("s{i}"),
            seed: seed0 + i as u64,
            duration_s: 22.0,
            sats: (0..3).map(|j| pool[(i + 2 * j) % pool.len()]).collect(),
            atten: Some((10.0, 16.0, ATT_DB)),
        })
        .collect();
    campaign(name, &recs, mon)
}

/// The default design's loop update (s) and its C/N0 estimator: (update, periods per window,
/// windows).
fn design() -> (f64, usize, usize) {
    let d = kshana::iq::track::design::DesignFile::parse(
        "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"plain\"\n",
    )
    .unwrap();
    let lc = d.designs()[0].loop_config_for(1e-3);
    (
        lc.coherent_periods as f64 * 1e-3,
        lc.cn0_window_periods / lc.coherent_periods.max(1),
        lc.cn0_windows,
    )
}

fn upper_median(mut v: Vec<f64>) -> f64 {
    v.sort_by(f64::total_cmp);
    if v.is_empty() {
        f64::NAN
    } else {
        v[v.len() / 2]
    }
}

/// The smallest `c` with `P(Poisson(m) <= c) >= 0.99`.
fn poisson_99_upper(m: f64) -> u64 {
    let (mut c, mut term, mut cdf) = (0u64, (-m).exp(), (-m).exp());
    while cdf < 0.99 {
        c += 1;
        term *= m / c as f64;
        cdf += term;
    }
    c
}

/// M4 on `cells`: (C/N0 false alarms, their Poisson 99 % bound).
fn m4(name: &str, cells: &[CellResult], dt: f64) -> (u64, u64) {
    let (mut count, mut expected) = (0u64, 0.0);
    for c in cells {
        let m = c.monitors.as_ref().unwrap();
        for f in m
            .false_alarms
            .iter()
            .filter(|f| f.kind == "cn0_drop" || f.kind == "cn0_rise")
        {
            count += u64::from(f.count);
            let arl0 = m
                .tests
                .iter()
                .find(|t| t.kind == f.kind && t.channel == f.channel)
                .and_then(|t| t.arl0_samples)
                .unwrap();
            expected += f.exposure_s / (arl0 * dt);
        }
    }
    let bound = poisson_99_upper(expected);
    eprintln!("{name} M4: {count} C/N0 false alarms; exposure / ARL0 gives {expected:.3e}, Poisson 99 % bound {bound}");
    (count, bound)
}

const ORACLE: &str = "xval/d8b-cn0-bound-v2/oracle.py";

/// Per set: (detected, missed, median TTD, median bound, max bound, the oracle dump events).
fn m3_v2(
    cells: &[CellResult],
    dt: f64,
) -> (usize, Vec<String>, f64, f64, f64, Vec<serde_json::Value>) {
    let (mut ttd, mut bound, mut missed, mut dump) = (vec![], vec![], vec![], vec![]);
    for c in cells {
        let m = c.monitors.as_ref().unwrap();
        for d in m.detections.iter().filter(|d| d.kind == "cn0_drop") {
            let ch = d.channel.as_deref().unwrap();
            if !d.detected {
                missed.push(format!("{}/{ch}", c.recording.id));
                continue;
            }
            let t = m
                .tests
                .iter()
                .find(|t| t.kind == "cn0_drop" && t.channel.as_deref() == Some(ch))
                .unwrap();
            let [mu0, sd] = t.baseline.unwrap();
            let s = sd.max(0.1);
            let k = 3.0 / (2.0 * s);
            let d_est = stats::cusum_delay_through_m2m4(
                mu0,
                sd,
                t.threshold,
                3.0,
                ATT_DB,
                dt,
                50,
                0.02,
                0.001,
            );
            let b = d_est + 2.0 * stats::cusum_arl(k, t.threshold, ATT_DB / s) * dt;
            ttd.push(d.time_to_detect_s.unwrap());
            bound.push(b);
            dump.push(serde_json::json!({"mu0_dbhz": mu0, "sigma0_db": sd, "h": t.threshold, "shift_db": 3.0,
                "att_db": ATT_DB, "stride_s": dt, "windows": 50, "window_s": 0.02, "coherent_s": 0.001,
                "engine_d_est_s": d_est, "engine_bound_s": b}));
        }
    }
    let maxb = bound.iter().cloned().fold(f64::NEG_INFINITY, f64::max);
    (
        ttd.len(),
        missed,
        upper_median(ttd),
        upper_median(bound),
        maxb,
        dump,
    )
}

fn oracle_check(name: &str, dump: Vec<serde_json::Value>) -> f64 {
    let p = support::scratch(name).join("dump.json");
    std::fs::write(&p, serde_json::json!({"events": dump}).to_string()).unwrap();
    let out = std::process::Command::new("python3")
        .args(["-I", ORACLE, "--check"])
        .arg(&p)
        .output()
        .expect("python3");
    assert!(
        out.status.success(),
        "{}",
        String::from_utf8_lossy(&out.stderr)
    );
    let o: serde_json::Value = serde_json::from_slice(&out.stdout).unwrap();
    o["worst_abs_diff_s"].as_f64().unwrap()
}

#[test]
#[cfg_attr(debug_assertions, ignore = "IQ campaign: run in release")]
fn m3_v2_and_m4_on_seen_and_fresh_seeds() {
    let (upd, per_win, wins) = design();
    assert_eq!(
        (per_win, wins),
        (20, 50),
        "reading 1: the campaigns' estimator"
    );
    let dt = per_win as f64 * upd;
    let mut miss = Vec::new();
    for (name, seed0) in [
        ("v1-registered", 200u64),
        ("v1-fresh", 100_200),
        ("v2-fresh", 200_200),
    ] {
        let cells = stepped(name, seed0, "[monitors]\n");
        let (det, missed, mt, mb, maxb, dump) = m3_v2(&cells, dt);
        let diff = oracle_check(name, dump);
        eprintln!(
            "{name} M3 v2: {det} of {} detected; median time to detect {mt:.4} s against median bound {mb:.4} s (largest bound {maxb:.4} s); oracle worst {diff:.2e} s",
            det + missed.len()
        );
        assert!(diff <= 1e-9, "{name}: oracle {diff}");
        assert_eq!(det + missed.len(), 18);
        if maxb >= 1.0 {
            miss.push(format!("{name}: uninformative (bound {maxb:.3} s)"));
        }
        if !missed.is_empty() {
            miss.push(format!("{name} detection: missed {missed:?}"));
        }
        if mt > mb {
            miss.push(format!("{name} timing: {mt:.4} s > {mb:.4} s"));
        }
        let (count, b4) = m4(name, &cells, dt);
        if count > b4 {
            miss.push(format!("{name} M4: {count} > {b4}"));
        }
    }
    assert!(miss.is_empty(), "NOT MET: {miss:?}");
}
