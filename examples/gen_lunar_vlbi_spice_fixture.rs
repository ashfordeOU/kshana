// SPDX-License-Identifier: AGPL-3.0-only
//! Writes Kshana's committed inputs for `tests/lunar_vlbi_campaign_spice_oracle.rs`: for each
//! named `lunar-vlbi-fim` and `lunar-frame-campaign` scenario, the stated inputs (stations,
//! beacons, epochs, masks, delay sigma, datum), the engine's schedule and the engine's Jacobian
//! and weights. The SPICE/NumPy oracle
//! (`tests/fixtures/lunar_vlbi_campaign_spice_oracle/gen_reference.py`) reads this file: it
//! rebuilds the schedule and the Jacobian from its own geometry (the SPICE leg) and redoes the
//! linear algebra on the engine's committed Jacobian (the P2 leg).
//!
//! Run: `cargo run --example gen_lunar_vlbi_spice_fixture > tests/fixtures/lunar_vlbi_campaign_spice_oracle/inputs.json`

use kshana::lunar_frame_campaign::{
    campaign_jacobian_row, helmert_design, BeaconInput, LunarFrameCampaignScenario,
};
use kshana::lunar_vlbi_fim::{schedule_jacobian, LunarVlbiFimScenario, StateLayout};

/// The `lunar-vlbi-fim` scenarios compared, with their stated datum.
pub fn vlbi_scenarios() -> Vec<(&'static str, LunarVlbiFimScenario)> {
    vec![
        ("default", LunarVlbiFimScenario::default()),
        (
            "free_network",
            LunarVlbiFimScenario {
                datum: Some("free-network".to_string()),
                ..Default::default()
            },
        ),
    ]
}

/// The `lunar-frame-campaign` scenarios compared.
pub fn campaign_scenarios() -> Vec<(&'static str, LunarFrameCampaignScenario)> {
    let b = |n: &str, alt: f64| BeaconInput {
        name: Some(n.to_string()),
        lat_deg: 0.0,
        lon_deg: 0.0,
        alt_m: Some(alt),
    };
    vec![
        ("default", LunarFrameCampaignScenario::default()),
        (
            "arc_16h",
            LunarFrameCampaignScenario {
                arc_hours: Some(16.0),
                ..Default::default()
            },
        ),
        (
            "arc_48h",
            LunarFrameCampaignScenario {
                arc_hours: Some(48.0),
                ..Default::default()
            },
        ),
        (
            "stations_estimated",
            LunarFrameCampaignScenario {
                station_datum: Some("estimated-anchor-first".to_string()),
                ..Default::default()
            },
        ),
        (
            "delay_sigma_3x",
            LunarFrameCampaignScenario {
                delay_sigma_s: Some(3.0e-11),
                ..Default::default()
            },
        ),
        (
            "collinear_beacons",
            LunarFrameCampaignScenario {
                beacons: Some(vec![b("a", 0.0), b("b", 1000.0), b("c", 2000.0)]),
                ..Default::default()
            },
        ),
    ]
}

fn report(json: &str) -> serde_json::Value {
    serde_json::from_str(json).expect("report json")
}

fn main() {
    let mut vlbi = Vec::new();
    for (name, sc) in vlbi_scenarios() {
        let (json, _) = sc.run_json().expect("run");
        let v = report(&json);
        let (geoms, obs) = sc.schedule().expect("schedule");
        let n_st = geoms[0].stations_inertial.len();
        let held: Vec<usize> = v["datum"]["held_fixed"]
            .as_array()
            .expect("held_fixed")
            .iter()
            .map(|x| x.as_u64().expect("index") as usize)
            .collect();
        let layout = StateLayout::new(n_st, &held, false);
        let jac = schedule_jacobian(&geoms, &obs, &layout);
        let sigma = v["schedule"]["delay_sigma_s"].as_f64().expect("sigma");
        vlbi.push(serde_json::json!({
            "name": name,
            "stations": v["schedule"]["stations"]
                .as_array()
                .expect("stations")
                .iter()
                .map(|s| serde_json::json!([s["lat_deg"], s["lon_deg"], s["alt_m"]]))
                .collect::<Vec<_>>(),
            "beacon_selenographic_deg_deg_m": [0.0, 0.0, 0.0],
            "epoch_utc": "2024-01-01T00:00:00",
            "step_min": v["schedule"]["step_min"],
            "n_epochs": v["schedule"]["n_epochs"],
            "elevation_mask_deg": v["schedule"]["elevation_mask_deg"],
            "delay_sigma_s": sigma,
            "rel_tol": v["fim"]["rel_tol"],
            "held_fixed": held,
            "observations": obs
                .iter()
                .map(|o| [o.epoch, o.station1, o.station2])
                .collect::<Vec<_>>(),
            "weights": vec![1.0 / (sigma * sigma); obs.len()],
            "engine_jacobian": jac,
        }));
    }

    let mut campaigns = Vec::new();
    for (name, sc) in campaign_scenarios() {
        let (json, _) = sc.run_json().expect("run");
        let v = report(&json);
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
            "epoch_utc": "2024-01-01T00:00:00",
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
        "generator": "examples/gen_lunar_vlbi_spice_fixture.rs",
        "lunar_vlbi_fim": vlbi,
        "lunar_frame_campaign": campaigns,
    });
    println!("{}", serde_json::to_string(&doc).expect("serialise"));
}
