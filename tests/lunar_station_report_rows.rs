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

/// The four 0.36 lunar-station extension rows appear only in a report whose run used them.
#[test]
fn station_extension_rows_only_with_their_sections() {
    const BASE: &str = "kind = \"lunar-station-coverage\"\npoints = [ { lat_deg = -89.0, lon_deg = 0.0 }, { lat_deg = -86.0, lon_deg = 180.0 } ]\nt_span_s = 7200.0\nt_step_s = 3600.0\nn_trials = 4\n";
    let rows = [
        ("Lunar terrain horizon masks from a stated profile or a polar DEM", "[terrain]\nuser_horizon = { source = \"x\", table = [[0.0, 1.0]] }\n"),
        ("Lunar reference-station multipath and receiver-hardware terms", "[receiver]\n"),
        ("Lunar reference-station ephemeris-error growth over the correction latency", "orbit_err_growth_m_per_s = 0.01\n"),
        ("Lunar reference-station solution modes: height constraint, three satellites, static-user window", "[solution]\n"),
    ];
    let plain = report_json(BASE);
    for (row, section) in rows {
        assert!(!plain.contains(row), "{row} listed without its section");
        let with = report_json(&format!("{BASE}{section}"));
        assert!(with.contains(row), "{row} missing with its section");
    }
}
