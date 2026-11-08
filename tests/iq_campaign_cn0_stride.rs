// SPDX-License-Identifier: AGPL-3.0-only
//! D8b row 8 (`VM-59bb0091`): the campaign C/N0 monitor on a stride of one NWPR window
//! (20 loop updates, 0.020 s, for the default design) instead of the whole 1 s estimator,
//! against M3 and M4 of `docs/design/MONITORS-IN-CAMPAIGN.md` §3 as written, with the readings
//! and the oracle of `xval/d8b-cn0-stride/` (committed before the engine change).
//!
//! * the control: `[monitors.epoch.cn0] stride = 1000` reproduces the recorded M3 (reading 2);
//! * the scored re-run: M3 (both clauses) and M4 on the seen and the fresh seeds (readings 3 to
//!   5), with the timing clause recomputed by `oracle.py` (reading 6).
//!
//! Result (scored once, 2026-11-08, release): M3 NOT MET on its timing clause (median time to
//! detect 0.221 s seen, 0.201 s fresh, against 0.0068 s and 0.0064 s); detection 18 of 18 and M4
//! hold on both (`docs/design/evidence/d8b-iq-timing-campaign-rerun/RESULTS.md`).
//!
//! PIN-SCOPE: see `m3_m4_recorded_numbers`. PIN-EXCLUDES: output hashes.

#[path = "support/monitor_campaign.rs"]
mod support;
use kshana::iq::campaign::CellResult;
use kshana::iq::monitor::stats;
use support::{campaign, scratch, Rec};

const ORACLE: &str = "xval/d8b-cn0-stride/oracle.py";
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

struct M3 {
    detected: usize,
    missed: Vec<String>,
    median_ttd_s: f64,
    median_bound_s: f64,
    oracle_diffs: [f64; 2],
}

/// M3 on `cells` with detector samples `dt` s apart.
fn m3(name: &str, cells: &[CellResult], dt: f64) -> M3 {
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
            let [_, sd] = t.baseline.unwrap();
            let k = 3.0 / (2.0 * sd.max(0.1));
            let arl1 = stats::cusum_arl(k, t.threshold, ATT_DB / sd.max(0.1));
            let x = d.time_to_detect_s.unwrap();
            ttd.push(x);
            bound.push(2.0 * arl1 * dt);
            dump.push(
                serde_json::json!({"ttd_s": x, "sigma0_db": sd, "h": t.threshold, "dt_s": dt}),
            );
        }
    }
    let (mt, mb) = (upper_median(ttd.clone()), upper_median(bound));
    let p = scratch(name).join("m3.json");
    std::fs::write(
        &p,
        serde_json::json!({"events": dump, "median_ttd_s": mt, "median_bound_s": mb}).to_string(),
    )
    .unwrap();
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
    let o: serde_json::Value = serde_json::from_slice(&out.stdout).unwrap();
    let r = M3 {
        detected: ttd.len(),
        missed,
        median_ttd_s: mt,
        median_bound_s: mb,
        oracle_diffs: [
            o["diffs"][0].as_f64().unwrap(),
            o["diffs"][1].as_f64().unwrap(),
        ],
    };
    eprintln!(
        "{name} M3: {} of {} satellite-events detected; median time to detect {mt:.3} s against 2 x ARL1 x {dt:.3} s = {mb:.4} s; missed {:?}; oracle {o}",
        r.detected,
        r.detected + r.missed.len(),
        r.missed
    );
    r
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

#[test]
#[cfg_attr(debug_assertions, ignore = "IQ campaign: run in release")]
fn control_at_the_estimator_cadence_reproduces_the_recorded_m3() {
    let (upd, per_win, wins) = design();
    let stride = per_win * wins;
    assert_eq!(stride, 1000);
    let cells = stepped(
        "ctl",
        200,
        &format!("[monitors]\n[monitors.epoch.cn0]\nstride = {stride}\n"),
    );
    let r = m3("ctl", &cells, stride as f64 * upd);
    assert_eq!(r.detected, 18);
    assert!((r.median_ttd_s - 1.001).abs() < 5e-4, "{}", r.median_ttd_s);
    assert!(
        (r.median_bound_s - 0.433).abs() < 5e-4,
        "{}",
        r.median_bound_s
    );
}

/// The scored campaigns at the default (one NWPR window) stride, built once per process.
fn scored(which: usize) -> &'static Vec<CellResult> {
    static CELLS: [std::sync::OnceLock<Vec<CellResult>>; 2] =
        [std::sync::OnceLock::new(), std::sync::OnceLock::new()];
    let (name, seed0) = [("seen", 200u64), ("fresh", 100_200)][which];
    CELLS[which].get_or_init(|| stepped(name, seed0, "[monitors]\n"))
}

#[test]
#[ignore = "FINDING (run 2026-11-08, D8b row 8): M3 NOT MET on its timing clause at the one-window stride. 18 of 18 detected on the seen and on the fresh seeds (P_md = 0, met), but the median time to detect is 0.221 s (seen) and 0.201 s (fresh) against 2 x ARL1 x 0.020 s = 0.0068 s and 0.0064 s. The sliding 1 s C/N0 estimate falls only as attenuated windows enter it; the bound is below one detector sample. M4 holds (0 false alarms). Recorded in docs/design/evidence/d8b-iq-timing-campaign-rerun/RESULTS.md; pinned by m3_m4_recorded_numbers. Run in release with --ignored"]
fn m3_and_m4_at_one_nwpr_window_seen_and_fresh_seeds() {
    let (upd, per_win, _) = design();
    assert_eq!(per_win, 20, "reading 1: 20 loop updates");
    let dt = per_win as f64 * upd;
    let mut miss = Vec::new();
    for (name, seed0) in [("seen", 200u64), ("fresh", 100_200)] {
        let cells = scored(usize::from(seed0 != 200));
        let r = m3(name, cells, dt);
        assert!(r.oracle_diffs.iter().all(|d| *d <= 1e-9), "{name}: oracle");
        assert_eq!(r.detected + r.missed.len(), 18, "18 satellite-events");
        if !r.missed.is_empty() {
            miss.push(format!("{name} M3 detection: missed {:?}", r.missed));
        }
        if r.median_ttd_s > r.median_bound_s {
            miss.push(format!(
                "{name} M3 timing: {:.3} s > {:.4} s",
                r.median_ttd_s, r.median_bound_s
            ));
        }
        let (count, bound) = m4(name, cells, dt);
        if count > bound {
            miss.push(format!("{name} M4: {count} > {bound}"));
        }
    }
    assert!(miss.is_empty(), "NOT MET: {miss:?}");
}

/// Pins the scored run (2026-11-08) of `m3_and_m4_at_one_nwpr_window_seen_and_fresh_seeds`.
///
/// PIN-SCOPE:    detections, the median time to detect and the median bound (to 5e-4 s), and
///               the M4 count, on the seen and the fresh seeds.
/// PIN-EXCLUDES: output hashes.
#[test]
#[cfg_attr(debug_assertions, ignore = "IQ campaign: run in release")]
fn m3_m4_recorded_numbers() {
    let (upd, per_win, _) = design();
    let dt = per_win as f64 * upd;
    for (which, (name, mt, mb)) in [("seen", 0.2208, 0.0068), ("fresh", 0.2008, 0.0064)]
        .into_iter()
        .enumerate()
    {
        let r = m3(name, scored(which), dt);
        assert_eq!((r.detected, r.missed.len()), (18, 0), "{name}");
        assert!(
            (r.median_ttd_s - mt).abs() < 5e-4,
            "{name}: {}",
            r.median_ttd_s
        );
        assert!(
            (r.median_bound_s - mb).abs() < 5e-4,
            "{name}: {}",
            r.median_bound_s
        );
        assert_eq!(m4(name, scored(which), dt), (0, 0), "{name}");
    }
}
