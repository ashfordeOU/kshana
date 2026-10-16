//! CAP-10: the committed calibration-ensemble report is the generator's, and the
//! pre-registered bars are scored from it
//! (`docs/design/evidence/cap10-calibration/PREREGISTRATION.md`).
//!
//! The whole protocol (40 000 clock runs) is too slow for every test run, so this
//! re-runs the first ensembles of each row and checks that they reproduce the committed
//! CSV lines byte for byte, then rebuilds the report from the committed CSV's outcomes.
//!
//! PIN-SCOPE:    the first three E1 ensembles and the first five E2 and E3 seeds against
//!               the committed CSV, and the committed report against the bars it states.
//! PIN-EXCLUDES: the remaining ensembles, which only the generator re-runs
//!               (`cargo run --release --bin gen_calibration_ensembles`).

use kshana::calibration_ensembles as ce;

fn committed_csv() -> String {
    std::fs::read_to_string(
        std::path::Path::new(env!("CARGO_MANIFEST_DIR"))
            .join("docs/data/calibration-ensembles.csv"),
    )
    .expect("docs/data/calibration-ensembles.csv")
}

#[test]
fn the_first_ensembles_reproduce_the_committed_csv() {
    let partial = ce::Report {
        e1: (0..3).map(|j| ce::e1(j).unwrap()).collect(),
        e2: (0..5).map(ce::e2).collect(),
        e3: (0..5).map(ce::e3).collect(),
    };
    let csv = committed_csv();
    for line in ce::csv(&partial).lines().skip(1) {
        assert!(
            csv.lines().any(|l| l == line),
            "the committed CSV is stale; regenerate it. Missing: {line}"
        );
    }
}

#[test]
fn the_committed_report_states_each_bar_as_scored_from_the_csv() {
    let csv = committed_csv();
    let mut counts = std::collections::BTreeMap::<(&str, usize), usize>::new();
    let mut rows = 0;
    for l in csv.lines().skip(1) {
        let f: Vec<&str> = l.split(',').collect();
        let checks = f[8];
        rows += 1;
        for (i, c) in checks.chars().enumerate() {
            if c == '1' {
                *counts.entry((f[0], i)).or_default() += 1;
            }
        }
    }
    assert_eq!(rows, 3 * ce::K);
    let report = std::fs::read_to_string(
        std::path::Path::new(env!("CARGO_MANIFEST_DIR")).join("docs/CALIBRATION-ENSEMBLES.md"),
    )
    .unwrap();
    let expect = [
        (("E1", 0), 181, 197),
        (("E1", 1), 194, 200),
        (("E1", 2), 190, 200),
        (("E1", 3), 190, 200),
        (("E2", 0), 190, 200),
        (("E3", 0), 190, 200),
    ];
    for (key, lo, hi) in expect {
        let n = counts.get(&key).copied().unwrap_or(0);
        let outcome = if (lo..=hi).contains(&n) {
            "MET"
        } else {
            "**NOT MET**"
        };
        let cell = format!(
            "| {n} of {} ({:.3}) | [{lo}, {hi}] | {outcome} |",
            ce::K,
            n as f64 / ce::K as f64
        );
        assert!(
            report.contains(&cell),
            "report does not state {key:?} as {cell}"
        );
    }
}
