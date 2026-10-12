// SPDX-License-Identifier: AGPL-3.0-only
//! The lunar reference-station ledger rows appear in a run's report only when the run used
//! them: the time-lab row only with a `[time_lab]` block, the station-geodesy row only with an
//! added site. A default `lunar-time-budget` or `lunar-llr-datum` report lists neither, so it
//! stays what it was before these rows existed.

use kshana::advanced_report::{build, Invocation};

const TIME_LAB: &str = "Lunar station time laboratory: miniRAFS holdover against LTC";
const GEODESY: &str =
    "Lunar reference-station geodesy: added retroreflector and VLBI beacon against the five-array datum";

fn report_json(src: &str) -> String {
    let out = kshana::api::run_toml(src).expect("runs");
    let inv = Invocation {
        scenario_arg: "scenario.toml".into(),
        ..Default::default()
    };
    serde_json::to_string(&build(&out, src, &inv).expect("report")).expect("json")
}

#[test]
fn time_lab_row_only_with_the_block() {
    assert!(!report_json("kind = \"lunar-time-budget\"\n").contains(TIME_LAB));
    assert!(report_json("kind = \"lunar-time-budget\"\n[time_lab]\n").contains(TIME_LAB));
}

#[test]
fn geodesy_row_only_with_an_added_site() {
    assert!(!report_json("kind = \"lunar-llr-datum\"\n").contains(GEODESY));
    assert!(!report_json("kind = \"lunar-llr-datum\"\nextra_reflectors = []\n").contains(GEODESY));
    let with = std::fs::read_to_string("scenarios/lunar-station-geodesy-with-station.toml")
        .expect("example");
    assert!(report_json(&with).contains(GEODESY));
}
