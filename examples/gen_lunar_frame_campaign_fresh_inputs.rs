// SPDX-License-Identifier: AGPL-3.0-only
//! Writes the engine inputs of the two fresh `lunar-frame-campaign` scenarios of
//! `docs/design/evidence/mr05-lunar-datum-cond/PREREGISTRATION.md`, `stations_estimated_fresh`
//! and `stations_fixed_fresh`: the default network on the date D chosen by
//! `examples/mr05_fresh_date_probe.rs`, in the format of the `lunar_frame_campaign` entries of
//! `tests/fixtures/lunar_vlbi_campaign_spice_oracle/inputs.json` (stated inputs, the engine's
//! schedule, Jacobian, weights, station-column count, Helmert design and `rel_tol`), so the
//! unchanged NumPy oracle reads them the same way.
//!
//! Run: `cargo run --release --example gen_lunar_frame_campaign_fresh_inputs -- YYYY-MM-DD \
//!   > tests/fixtures/lunar_frame_campaign_cond_bar/fresh_inputs.json`

use kshana::lunar_frame_campaign::{
    campaign_jacobian_row, helmert_design, LunarFrameCampaignScenario,
};

/// The two fresh scenarios on the date `(y, m, d)`, by the names the pre-registration gives.
pub fn fresh_scenarios(y: i32, m: u32, d: u32) -> Vec<(&'static str, LunarFrameCampaignScenario)> {
    let on = |datum: &str| LunarFrameCampaignScenario {
        epoch_year: Some(y),
        epoch_month: Some(m),
        epoch_day: Some(d),
        station_datum: Some(datum.to_string()),
        ..Default::default()
    };
    vec![
        ("stations_estimated_fresh", on("estimated-anchor-first")),
        ("stations_fixed_fresh", on("fixed")),
    ]
}

fn main() {
    let date = std::env::args().nth(1).expect("usage: <YYYY-MM-DD>");
    let p: Vec<&str> = date.split('-').collect();
    assert_eq!(p.len(), 3, "date as YYYY-MM-DD");
    let (y, m, d): (i32, u32, u32) = (
        p[0].parse().expect("year"),
        p[1].parse().expect("month"),
        p[2].parse().expect("day"),
    );
    let mut campaigns = Vec::new();
    for (name, sc) in fresh_scenarios(y, m, d) {
        let (json, _) = sc.run_json().expect("run");
        let v: serde_json::Value = serde_json::from_str(&json).expect("report json");
        let sched = sc.schedule().expect("schedule");
        let n_b = sched.geoms.len();
        let n_sc = v["station_datum"]["n_station_columns"]
            .as_u64()
            .expect("n_station_columns") as usize;
        let dim = n_sc + 3 * n_b;
        let jac: Vec<Vec<f64>> = sched
            .observations
            .iter()
            .map(|&o| campaign_jacobian_row(&sched.geoms[o.beacon][o.epoch], n_sc, o, dim))
            .collect();
        let sigma = v["campaign"]["delay_sigma_s"].as_f64().expect("sigma");
        let w = vec![1.0 / (sigma * sigma); jac.len()];
        let beacons: Vec<serde_json::Value> = v["campaign"]["beacons"]
            .as_array()
            .expect("beacons")
            .iter()
            .map(|b| serde_json::json!([b["lat_deg"], b["lon_deg"], b["alt_m"]]))
            .collect();
        let points: Vec<kshana::precession::Vec3> = v["campaign"]["beacons"]
            .as_array()
            .expect("beacons")
            .iter()
            .map(|b| {
                kshana::lunar::selenographic_to_mcmf(kshana::lunar::Selenographic {
                    lat_rad: b["lat_deg"].as_f64().expect("lat").to_radians(),
                    lon_rad: b["lon_deg"].as_f64().expect("lon").to_radians(),
                    alt_m: b["alt_m"].as_f64().expect("alt"),
                })
            })
            .collect();
        campaigns.push(serde_json::json!({
            "name": name,
            "stations": v["campaign"]["stations"]
                .as_array()
                .expect("stations")
                .iter()
                .map(|s| serde_json::json!([s["lat_deg"], s["lon_deg"], s["alt_m"]]))
                .collect::<Vec<_>>(),
            "beacons_selenographic_deg_deg_m": beacons,
            "beacon_points_body_m": points,
            "epoch_utc": format!("{y:04}-{m:02}-{d:02}T00:00:00"),
            "step_min": v["campaign"]["step_min"],
            "n_epochs": v["campaign"]["n_epochs"],
            "elevation_mask_deg": v["campaign"]["elevation_mask_deg"],
            "earth_elevation_mask_deg": v["campaign"]["earth_elevation_mask_deg"],
            "delay_sigma_s": sigma,
            "rel_tol": v["helmert"]["rel_tol"],
            "station_datum": v["station_datum"]["choice"],
            "n_station_columns": n_sc,
            "observations": sched
                .observations
                .iter()
                .map(|o| [o.beacon, o.epoch, o.station1, o.station2])
                .collect::<Vec<_>>(),
            "weights": w,
            "engine_jacobian": jac,
            "helmert_design": helmert_design(&points),
        }));
    }
    let doc = serde_json::json!({
        "generator": "examples/gen_lunar_frame_campaign_fresh_inputs.rs",
        "date": date,
        "lunar_frame_campaign": campaigns,
    });
    println!("{}", serde_json::to_string(&doc).expect("serialise"));
}
