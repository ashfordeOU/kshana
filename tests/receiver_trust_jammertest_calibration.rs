// SPDX-License-Identifier: AGPL-3.0-only
//! The pre-registered receiver-trust threshold calibration on the JammerTest 2024 dataset
//! (CAP-13; `xval/jammertest-trust/PREREGISTRATION.md`, committed alone in 0fa012b; results in
//! `xval/jammertest-trust/RESULTS.md`).
//!
//! Data-gated: the dataset (Zenodo record 15911589, GPL-3.0-or-later, 375 MB) is never vendored.
//! Extract it outside the repository and point `KSHANA_JAMMERTEST_DIR` at the extracted root:
//!
//! ```text
//! KSHANA_JAMMERTEST_DIR=/path/to/extracted cargo test --release \
//!     --test receiver_trust_jammertest_calibration -- --ignored
//! ```
//!
//! PIN-SCOPE:    the recorded run's selected thresholds, held-out counts, bar verdicts and
//!               ledger verdict on the dataset as fetched (SHA-256 73e78934...b313)
//! PIN-EXCLUDES: the ROC curves and per-folder detail (in RESULTS.md and the JSON report)

use kshana::receiver_trust::calibration::run_dataset;
use kshana::receiver_trust::monitors::JAMMERTEST_2024_CALIBRATED;

#[test]
#[ignore]
fn the_recorded_calibration_reproduces() {
    let Ok(root) = std::env::var("KSHANA_JAMMERTEST_DIR") else {
        eprintln!("KSHANA_JAMMERTEST_DIR not set: skipped (data-gated)");
        return;
    };
    let r = run_dataset(std::path::Path::new(&root), false).expect("the dataset runs");
    assert_eq!(r.n_jamming_folders, 7);
    assert!(r.minimum_data);
    let (c, a, j) = JAMMERTEST_2024_CALIBRATED;
    assert_eq!(
        r.calibrated,
        [c, a, j],
        "the shipped profile is the recorded selection"
    );
    let held: Vec<(usize, usize, usize, usize)> = r
        .stats
        .iter()
        .map(|s| {
            let h = s.loso_heldout;
            (h.clean_alarmed, h.clean, h.jamming_alarmed, h.jamming)
        })
        .collect();
    assert_eq!(
        held,
        vec![
            (81, 3502, 5352, 9560),
            (1, 3502, 7527, 9560),
            (33, 3502, 1468, 9560)
        ]
    );
    let u = r.union_loso_heldout;
    assert_eq!(
        (u.clean_alarmed, u.clean, u.jamming_alarmed, u.jamming),
        (115, 3502, 7713, 9560)
    );
    let passes: Vec<bool> = r.bars.iter().map(|b| b.pass).collect();
    assert_eq!(
        passes,
        vec![false, true, true, true],
        "B1 cn0 fails; B1 agc, B1 jam_ind, B2 pass"
    );
    assert!(r.verdict.starts_with("MODELLED"));
}

/// A session run with the opt-in profile echoes the thresholds it applied and carries the
/// profile note (MODELLED, the C/N0 bar missed); without it neither appears.
#[test]
fn the_profile_is_echoed_with_its_note() {
    use kshana::receiver_trust::monitors::PROFILE_NOTE;
    use kshana::receiver_trust::scenario::{run_receiver_trust, ReceiverTrustScenario};
    let root = env!("CARGO_MANIFEST_DIR");
    let text =
        std::fs::read_to_string(format!("{root}/examples/maritime-trust/session.toml")).unwrap();
    let load = |t: &str| -> ReceiverTrustScenario {
        let mut s: ReceiverTrustScenario = toml::from_str(t).unwrap();
        if let Some(p) = s.log.source.path.as_mut() {
            *p = format!("{root}/examples/maritime-trust/{p}");
        }
        s
    };
    let plain = run_receiver_trust(&load(&text)).unwrap();
    assert!(plain.profile_note.is_none());
    assert_eq!(plain.monitor_config.cn0_drop_db, 6.0);
    let with = text.replace(
        "[monitors]\n",
        "[monitors]\nprofile = \"jammertest-2024-calibrated\"\n",
    );
    let r = run_receiver_trust(&load(&with)).unwrap();
    assert_eq!(r.profile_note, Some(PROFILE_NOTE));
    assert!(PROFILE_NOTE.contains("MISSED") && PROFILE_NOTE.contains("0.0231"));
    let (c, a, j) = JAMMERTEST_2024_CALIBRATED;
    assert_eq!(
        (
            r.monitor_config.cn0_drop_db,
            r.monitor_config.agc_k_sigma,
            r.monitor_config.jam_ind_threshold
        ),
        (c, a, j)
    );
}
