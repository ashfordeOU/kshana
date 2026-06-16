//! Regression guard: the README's machine-readable scenario-kind counts must stay
//! in lock-step with the dispatcher.
//!
//! The README states the number of dispatchable scenario kinds in three places. Two of
//! them are digit-form ("typed dispatch over N kinds" in the architecture diagram and
//! "(N kinds)" in the repo-layout tree); this test pins both to the single source of
//! truth, `api::list_scenario_kinds()`. A previous audit found these counts had drifted
//! (the README said 21/32 while the dispatcher exposed 34) because the number was
//! hand-maintained — this guard makes that drift a build failure instead of a silent
//! documentation lie.
//!
//! If you add or remove a scenario kind, update the README counts; this test will tell
//! you exactly which sites are stale.

#[test]
fn readme_dispatch_counts_match_the_api() {
    let n = kshana::api::list_scenario_kinds().len();
    let readme = include_str!("../README.md");

    let mermaid = format!("typed dispatch over {n} kinds");
    assert!(
        readme.contains(&mermaid),
        "README architecture-diagram scenario count is out of sync with \
         api::list_scenario_kinds() (= {n}); expected the substring {mermaid:?}. \
         Update the `api — run_toml: typed dispatch over N kinds` node in README.md."
    );

    let layout = format!("({n} kinds)");
    assert!(
        readme.contains(&layout),
        "README repo-layout scenario count is out of sync with \
         api::list_scenario_kinds() (= {n}); expected the substring {layout:?}. \
         Update the `typed dispatch (N kinds)` line in README.md."
    );
}
