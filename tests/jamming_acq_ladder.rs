// SPDX-License-Identifier: AGPL-3.0-only
//! D8b row 7 (`VM-e6a6348d`): the jamming kind's acquisition hysteresis on the fresh power
//! ladder of `xval/d8b-jamming-ladder/` (fixed from the scenario file alone, before any engine
//! run), against H2 to H4 of `docs/design/evidence/jamming-acq-agc/PREREGISTRATION.md` as
//! registered, with the informativeness precondition of the D8b pre-registration (row 7). No
//! engine change. H1/G1, G2 and G3 are re-run as regressions by `tests/jamming_acq_agc.rs`.
//!
//! PIN-SCOPE: none. PIN-EXCLUDES: everything (no output hash is pinned here).

use kshana::jamming::{run_jamming, JammingResult, JammingScenario};

const DEMO: &str = include_str!("../scenarios/jamming-demo.toml");
const LADDER: &str = include_str!("../xval/d8b-jamming-ladder/ladder.json");
const TRACKING: f64 = 25.0;
const ACQ: f64 = 32.0;

fn ladder() -> Vec<f64> {
    let v: serde_json::Value = serde_json::from_str(LADDER).unwrap();
    let l: Vec<f64> = v["ladder_dbw"]
        .as_array()
        .unwrap()
        .iter()
        .map(|x| x.as_f64().unwrap())
        .collect();
    assert_eq!(
        l,
        [-34.0, -33.0, -32.0, -31.0, -29.0, -28.0, -27.0, -26.0, -24.0, -23.0, -22.0, -21.0]
    );
    l
}

fn run(power_dbw: f64, acq: f64, delay: f64) -> JammingResult {
    let mut s: JammingScenario = toml::from_str(&format!(
        "{DEMO}\n[acquisition]\nacquisition_threshold_dbhz = {acq:?}\nreacquisition_delay_s = {delay:?}\n"
    ))
    .unwrap();
    assert_eq!(s.tracking_threshold_dbhz, TRACKING);
    s.jammer.as_mut().unwrap().power_dbw = power_dbw;
    run_jamming(&s).unwrap()
}

fn scratch() -> std::path::PathBuf {
    use std::sync::atomic::{AtomicU64, Ordering};
    static SEQ: AtomicU64 = AtomicU64::new(0);
    let d = std::env::temp_dir().join(format!(
        "kshana-d8b-ladder-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, Ordering::Relaxed)
    ));
    let _ = std::fs::remove_dir_all(&d);
    std::fs::create_dir_all(&d).unwrap();
    d
}

#[test]
fn the_ladder_holds_the_hysteresis_bars_and_is_informative() {
    let powers = ladder();
    let step_s: f64 = {
        let s: JammingScenario = toml::from_str(DEMO).unwrap();
        s.time.step_s
    };
    let mut miss = Vec::new();

    // H2: no hysteresis is no hysteresis.
    let mut h2_links = 0usize;
    for &p in &powers {
        for e in &run(p, TRACKING, 0.0).epochs {
            for l in &e.sats {
                h2_links += 1;
                if l.acquired != Some(l.status != "LOST") {
                    miss.push(format!("H2 {p} dBW t={} prn {}", e.t, l.prn));
                }
            }
        }
    }

    // H3 and the informativeness precondition, at 32 dB-Hz and 60 s.
    let runs: Vec<(f64, JammingResult)> = powers.iter().map(|&p| (p, run(p, ACQ, 60.0))).collect();
    let (mut links, mut between, mut differing) = (0usize, 0usize, 0usize);
    let mut export = Vec::new();
    for (p, r) in &runs {
        let mut eps = Vec::new();
        for e in &r.epochs {
            let ls: Vec<(usize, f64)> = e
                .sats
                .iter()
                .map(|l| (l.prn, l.cn0_effective_dbhz))
                .collect();
            for l in &e.sats {
                links += 1;
                between += usize::from((TRACKING..ACQ).contains(&l.cn0_effective_dbhz));
                differing += usize::from(l.acquired.unwrap() != (l.status != "LOST"));
            }
            eps.push(serde_json::json!({"t": e.t, "links": ls}));
        }
        export.push(serde_json::json!({"jammer_power_dbw": p, "epochs": eps}));
    }
    let dir = scratch();
    let (inp, out) = (dir.join("inputs.json"), dir.join("expected.json"));
    std::fs::write(
        &inp,
        serde_json::json!({"acquisition_threshold_dbhz": ACQ, "tracking_threshold_dbhz": TRACKING,
            "reacquisition_delay_s": 60.0, "step_s": step_s, "runs": export})
        .to_string(),
    )
    .unwrap();
    let o = std::process::Command::new("python3")
        .arg("-I")
        .arg("xval/jamming-acq-agc/hysteresis.py")
        .arg(&inp)
        .arg(&out)
        .output()
        .expect("python3");
    assert!(o.status.success(), "{}", String::from_utf8_lossy(&o.stderr));
    let x: serde_json::Value =
        serde_json::from_str(&std::fs::read_to_string(&out).unwrap()).unwrap();
    let mut h3_flags = 0usize;
    for ((p, r), xr) in runs.iter().zip(x["runs"].as_array().unwrap()) {
        let got: Vec<(f64, usize, bool)> = r
            .epochs
            .iter()
            .flat_map(|e| {
                e.sats
                    .iter()
                    .map(move |l| (e.t, l.prn, l.acquired.unwrap()))
            })
            .collect();
        let flags = xr["flags"].as_array().unwrap();
        assert_eq!(flags.len(), got.len(), "{p} dBW: link count");
        for (f, (t, prn, a)) in flags.iter().zip(&got) {
            assert_eq!(f[0].as_f64().unwrap(), *t);
            assert_eq!(f[1].as_u64().unwrap() as usize, *prn);
            h3_flags += 1;
            if f[2].as_bool().unwrap() != *a {
                miss.push(format!("H3 {p} dBW t={t} prn {prn}"));
            }
        }
    }
    let frac = between as f64 / links as f64;
    if frac < 0.10 {
        miss.push(format!(
            "informativeness: {between} of {links} = {frac:.4} < 0.10"
        ));
    }
    if differing == 0 {
        miss.push("H3 uninformative: no link has acquired != not lost".into());
    }

    // H4: monotone in the acquisition threshold.
    let mut h4_totals = Vec::new();
    for &p in &powers {
        let counts: Vec<Vec<usize>> = [25.0, 28.0, 32.0, 36.0, 40.0]
            .iter()
            .map(|&a| {
                run(p, a, 60.0)
                    .epochs
                    .iter()
                    .map(|e| e.acquired.unwrap())
                    .collect()
            })
            .collect();
        for w in counts.windows(2) {
            for (i, (lo, hi)) in w[0].iter().zip(&w[1]).enumerate() {
                if hi > lo {
                    miss.push(format!("H4 {p} dBW epoch {i}: {hi} > {lo}"));
                }
            }
        }
        h4_totals.push((
            p,
            counts
                .iter()
                .map(|c| c.iter().sum::<usize>())
                .collect::<Vec<_>>(),
        ));
    }

    eprintln!(
        "D8b row 7: H2 {h2_links} links; H3 {h3_flags} flags against hysteresis.py, {differing} with acquired != not lost; \
informativeness {between} of {links} link-epochs in [25, 32) dB-Hz = {frac:.4}; H4 acquired link-epochs (25/28/32/36/40) {h4_totals:?}; \
misses {}: {:?}",
        miss.len(),
        miss.iter().take(10).collect::<Vec<_>>()
    );
    assert!(miss.is_empty(), "D8b row 7 NOT MET: {} misses", miss.len());
}
