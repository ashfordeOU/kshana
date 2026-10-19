// SPDX-License-Identifier: AGPL-3.0-only
//! Round trip of `kshana jammertest import` on the published Jammertest 2025 plan.
//!
//! Data-gated: the NPRA catalogue and plan (MIT) are fetched by `xval/jammertest-plan/fetch.sh`
//! to a directory outside the repository, with a pinned SHA-256 per file; point
//! `KSHANA_JAMMERTEST_PLAN_DIR` at it. Without the variable the test reports that it was skipped.
//!
//! PIN-SCOPE:    the slot counts per test area of the 2025 plan at the pinned commit, that every id
//!               resolves in the 2025 catalogue, and that the events survive the TOML round trip
//! PIN-EXCLUDES: whether the planned slots match what was transmitted (nobody records that)

use kshana::jammertest::plan::{
    events_toml, import, parse_catalog, parse_plan, ImportOptions, SCHEDULED_TRUTH,
};
use kshana::receiver_trust::scenario::EventCfg;
use kshana::telemetry::time::parse_rfc3339_utc;
use serde::Deserialize;

#[derive(Deserialize)]
struct Wrap {
    events: Vec<EventCfg>,
}

#[test]
fn the_2025_plan_imports_with_catalogue_ids_and_round_trips() {
    let Ok(dir) = std::env::var("KSHANA_JAMMERTEST_PLAN_DIR") else {
        eprintln!("KSHANA_JAMMERTEST_PLAN_DIR not set: skipped (data-gated)");
        return;
    };
    let read = |f: &str| std::fs::read_to_string(format!("{dir}/{f}")).expect(f);
    let catalog = parse_catalog(&read("testcatalog2025.json")).unwrap();
    let mut slots = Vec::new();
    for d in [
        "monday-2025-09-15",
        "tuesday-2025-09-16",
        "wednesday-2025-09-17",
        "thursday-2025-09-18",
        "friday-2025-09-19",
    ] {
        slots.extend(parse_plan(&read(&format!("plan-{d}.json")), 2.0).unwrap());
    }
    // (area, scheduled slots that transmit, slots that do not)
    for (area, rf, non_rf) in [(1u32, 61usize, 15usize), (2, 63, 14), (3, 32, 13)] {
        let imp = import(
            &slots,
            &catalog,
            &ImportOptions {
                location: Some(area),
                log_start_utc: parse_rfc3339_utc("2025-09-15T00:00:00Z").unwrap(),
                log_duration_s: None,
                year: None,
            },
        )
        .unwrap();
        assert_eq!(
            (imp.events.len(), imp.skipped_non_rf),
            (rf, non_rf),
            "area {area}"
        );
        assert!(imp.unknown_ids.is_empty(), "every id is in the catalogue");
        for e in &imp.events {
            assert_eq!(e.year, 2025);
            assert!(
                e.event.label.starts_with(SCHEDULED_TRUTH),
                "{}",
                e.event.label
            );
            assert!(e.event.label.contains(&e.test_id), "{}", e.event.label);
            assert!(e.event.end_s.unwrap() > e.event.onset_s);
        }
        let text = events_toml(&imp, &[]);
        assert!(
            !text.contains("(NPRA)") && !text.contains("(Nkom)"),
            "no contacts carried over"
        );
        let back: Wrap = toml::from_str(&text).unwrap();
        let want: Vec<EventCfg> = imp.events.iter().map(|e| e.event.clone()).collect();
        assert_eq!(back.events, want, "area {area} round trip");
    }
}
