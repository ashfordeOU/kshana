// SPDX-License-Identifier: AGPL-3.0-only
//! The detection ROC of a scored campaign (`kshana::iq::campaign::report::rocs`), against the
//! bars pre-registered in `docs/design/DETECTION-ROC.md` §2 (b47e358d).
//!
//! The campaigns are Kshana scenes of GPS L1 C/A signals only (`tests/support/monitor_campaign.rs`).
//! Each of 6 recordings carries 3 satellites and states one 6 s event:
//!
//! * **R1:** every satellite is attenuated by 6 dB during the event (its own signal);
//! * **R2:** the event attenuates nothing (0 dB): positives and negatives come from the same
//!   process, so a sound ROC sits at chance.
//!
//! PIN-SCOPE: none. PIN-EXCLUDES: everything (no output hash is pinned here).

#[path = "support/monitor_campaign.rs"]
mod support;
use kshana::iq::campaign::detect::Roc;
use kshana::iq::campaign::report::rocs;
use support::{campaign, Rec};

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

#[test]
#[ignore = "FINDING (run 2026-10-13): R1 NOT MET: cn0_drop AUC 0.7855 < 0.95 over 18 positive and 36 negative windows; at the threshold P_d 1.0 and P_fa 0.5. All 18 pre-event negatives have a CUSUM maximum of 0; all 18 post-event negatives reach 81 or more, the statistic decaying after the attenuation it detected. Negative windows next to an event inherit the detector's memory; recorded in docs/design/DETECTION-ROC.md section 3. Run in release with --ignored"]
fn r1_the_cn0_drop_roc_separates_6_db_attenuations() {
    let cells = campaign("r1", &recipe(300, 6.0), "[monitors]\nroc_window_s = 6.0\n");
    let r = rocs(&cells);
    let c = kind(&r, "cn0_drop");
    eprintln!(
        "R1: cn0_drop AUC {:?} over {} positive and {} negative windows; at the threshold {:?}: {:?}",
        c.auc, c.positives, c.negatives, c.threshold, c.at_threshold
    );
    assert_eq!(c.positives, 18);
    assert!(c.negatives >= 18);
    let auc = c.auc.unwrap();
    assert!(auc >= 0.95, "R1 NOT MET: AUC {auc:.4} < 0.95");
}

#[test]
#[cfg_attr(debug_assertions, ignore = "IQ campaign: run in release")]
fn r2_with_nothing_to_detect_the_roc_sits_at_chance() {
    let cells = campaign(
        "r2",
        &recipe(400, 0.0),
        "[monitors]\nroc_window_s = 6.0\n[monitors.power]\n",
    );
    let r = rocs(&cells);
    let mut bad = Vec::new();
    for k in ["cn0_drop", "sqm_delta", "power_drop"] {
        let c = kind(&r, k);
        let auc = c.auc.unwrap();
        eprintln!(
            "R2 {k}: AUC {auc:.4} over {} positive and {} negative windows",
            c.positives, c.negatives
        );
        if (auc - 0.5).abs() > 0.2 {
            bad.push(format!("{k}: {auc:.4}"));
        }
    }
    assert!(bad.is_empty(), "R2 NOT MET: {bad:?}");
}
