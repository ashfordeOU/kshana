// SPDX-License-Identifier: AGPL-3.0-only
//! Chooses the date D of the two fresh `lunar-frame-campaign` scenarios of
//! `docs/design/evidence/mr05-lunar-datum-cond/PREREGISTRATION.md`: the first day on or after
//! 2026-12-01 for which the default network with the stations estimated
//! (`estimated-anchor-first`) has a full-rank Helmert matrix and a full-rank station block.
//!
//! An engine-only probe: for each day it prints the observation count, the Helmert defect and
//! `station_block_full_rank`, and nothing else of the report, then stops at the first day that
//! qualifies.
//!
//! Run: `cargo run --release --example mr05_fresh_date_probe`

use kshana::lunar_frame_campaign::LunarFrameCampaignScenario;

fn main() {
    let days_in = |m: u32| match m {
        12 | 1 | 3 | 5 | 7 | 8 | 10 => 31,
        2 => 28,
        _ => 30,
    };
    let (mut y, mut m, mut d) = (2026, 12u32, 1u32);
    for _ in 0..366 {
        let sc = LunarFrameCampaignScenario {
            epoch_year: Some(y),
            epoch_month: Some(m),
            epoch_day: Some(d),
            station_datum: Some("estimated-anchor-first".to_string()),
            ..Default::default()
        };
        let (json, _) = sc.run_json().expect("scenario runs");
        let v: serde_json::Value = serde_json::from_str(&json).expect("json");
        let n_obs = v["campaign"]["n_observations"].as_u64();
        let defect = v["helmert"]["defect"].as_u64();
        let block = v["station_datum"]["station_block_full_rank"].as_bool();
        println!(
            "{y:04}-{m:02}-{d:02}  n_observations {n_obs:?}  helmert_defect {defect:?}  \
             station_block_full_rank {block:?}"
        );
        if defect == Some(0) && block == Some(true) {
            println!("D = {y:04}-{m:02}-{d:02}");
            return;
        }
        d += 1;
        if d > days_in(m) {
            d = 1;
            m += 1;
            if m > 12 {
                m = 1;
                y += 1;
            }
        }
    }
    println!("no qualifying day within a year of 2026-12-01");
}
