// SPDX-License-Identifier: AGPL-3.0-only
//! Bars R3 and R4 of `xval/bench/PREREGISTRATION-0.40-R1.md` (signed off 24 Oct 2026, commit
//! 2c44424a): the `cn0_drop` ROC with the 18 event windows of the R1 recipe against the windows of 12
//! null recordings. R1 itself (`iq_campaign_roc.rs`) is unchanged and stays NOT MET.
//!
//! PIN-SCOPE:    the one scored run of the registered recipe (seeds 300 to 305 with 6 dB, 500 to 511 with 0 dB)
//! PIN-EXCLUDES: R1, R2, anything about real recordings

#[path = "support/monitor_campaign.rs"]
mod support;
use kshana::iq::campaign::detect::roc;
use support::{campaign, Rec};

const POOL: [(u8, f64); 6] = [
    (3, 1200.0),
    (11, -800.0),
    (19, 300.0),
    (7, 2300.0),
    (24, -1700.0),
    (14, 650.0),
];

fn recipe(seed0: u64, n: usize, atten_db: f64) -> Vec<Rec> {
    (0..n)
        .map(|i| Rec {
            id: format!("r{i}"),
            seed: seed0 + i as u64,
            duration_s: 22.0,
            sats: (0..3).map(|j| POOL[(i + 2 * j) % POOL.len()]).collect(),
            atten: Some((10.0, 16.0, atten_db)),
        })
        .collect()
}

#[test]
#[cfg_attr(debug_assertions, ignore = "IQ campaign: run in release")]
fn r3_r4_cn0_drop_against_null_recordings() {
    let cfg = "[monitors]\nroc_window_s = 6.0\n";
    let ev = campaign("r3e", &recipe(300, 6, 6.0), cfg);
    let nl = campaign("r3n", &recipe(500, 12, 0.0), cfg);
    let (mut pos, mut neg, mut thr) = (Vec::new(), Vec::new(), None);
    for c in &ev {
        let Some(m) = &c.monitors else { continue };
        for w in m
            .windows
            .iter()
            .filter(|w| w.kind == "cn0_drop" && w.event_id.is_some())
        {
            pos.push(w.max);
        }
        thr = thr.or(m
            .tests
            .iter()
            .find(|t| t.kind == "cn0_drop")
            .map(|t| t.threshold));
    }
    for c in &nl {
        let Some(m) = &c.monitors else { continue };
        for w in m.windows.iter().filter(|w| w.kind == "cn0_drop") {
            neg.push(w.max);
        }
    }
    let r = roc("cn0_drop", &pos, &neg, thr);
    eprintln!(
        "R3/R4: positives {} negatives {} AUC {:?} threshold {:?} at_threshold [P_fa, P_d] {:?}",
        r.positives, r.negatives, r.auc, r.threshold, r.at_threshold
    );
    // Window counts at run time: 18 positives and 108 negatives, as the registration expected.
    assert_eq!((r.positives, r.negatives), (18, 108));
    // R3 MET: AUC >= 0.95 (measured 1.0).
    assert!(r.auc.unwrap() >= 0.95, "R3 NOT MET: {:?}", r.auc);
    // R4 MET: at h = 5, P_fa <= 0.05 (measured 0.0) and P_d >= 0.90 (measured 1.0).
    let [pfa, pd] = r.at_threshold.unwrap();
    assert!(
        pfa <= 0.05 && pd >= 0.90,
        "R4 NOT MET: P_fa {pfa}, P_d {pd}"
    );
    // Every null-recording window has a CUSUM maximum of 0, so the negatives never approach the
    // threshold: the null recordings separate trivially (see RESULTS-0.40.md).
    assert!(neg.iter().all(|&x| x == 0.0));
    assert!(pos.iter().all(|&x| x > 80.0));
}
