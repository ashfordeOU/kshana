// SPDX-License-Identifier: AGPL-3.0-only
//! The pre-registered scoring run on the JammerTest 2024 dataset
//! (`xval/jammertest-score/PREREGISTRATION.md`, committed alone in c2e6d3b; results in
//! `xval/jammertest-score/RESULTS.md`).
//!
//! Data-gated: the dataset (Zenodo record 15911589, GPL-3.0-or-later, 375 MB) is never vendored.
//! Extract it outside the repository and point `KSHANA_JAMMERTEST_DIR` at the extracted root;
//! without the variable the test reports that it was skipped.
//!
//! PIN-SCOPE:    the recorded run: 4 of 12 `.ubx` folders kept, 4 scorable jamming windows, so the
//!               registered minimum-data rule fails and every bar is "not assessable"
//! PIN-EXCLUDES: any detection-performance claim (4 windows); the per-test rows (JSON report)

use kshana::jammertest::dataset::run_dataset;

#[test]
fn the_recorded_run_reproduces_and_no_bar_is_assessable() {
    let Ok(root) = std::env::var("KSHANA_JAMMERTEST_DIR") else {
        eprintln!("KSHANA_JAMMERTEST_DIR not set: skipped (data-gated)");
        return;
    };
    let r = run_dataset(std::path::Path::new(&root)).expect("the dataset runs");
    assert_eq!(r.folders.len(), 12);
    assert_eq!((r.kept, r.kept_jamming_folders), (4, 4));
    assert_eq!((r.jamming.windows, r.spoofing.windows), (4, 0));
    assert!(
        !r.minimum_data,
        "the registered minimum (10 windows, 2 folders) is not met"
    );
    assert!(
        r.bars.iter().all(|b| b.verdict == "not assessable"),
        "{:?}",
        r.bars
    );
    assert_eq!(
        (r.jamming.detected, r.jamming.late, r.jamming.missed),
        (4, 0, 0)
    );
    assert_eq!((r.jamming.alarmed, r.jamming.recovered), (4, 1));
    assert_eq!(
        (r.clean_epochs, r.false_alarm_epochs, r.false_alarm_runs),
        (805, 430, 4)
    );
}
