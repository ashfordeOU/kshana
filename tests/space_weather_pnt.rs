// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana space-weather` (src/space_weather_pnt/): the density-model scorecard against measured
//! densities, the 4D ionosphere on an IONEX map, and the command line.
//!
//! Density scorecard, pre-registration (written 2026-11-20 before the scorecard was first run on
//! the fixture below). Data: the TOLEOS accelerometer window file of
//! `tests/space_weather_density_accelerometer_oracle.rs`
//! (`tests/fixtures/space_weather_density_accelerometer_oracle/windows_j71.csv`; TOLEOS DNSxACC_2
//! densities of CHAMP 2001, GRACE-A 2002 and 2008 and GRACE-FO 1 2024 from the ESA Swarm DISC
//! server, GFZ indices; sources and SHA-256 in its NOTICE.md). Quantity: per model and campaign,
//! the ratios model/measured of the orbit-window mean densities. Checks:
//!
//! * P1, the published comparison: Emmert, Lean and Picone (2010), "Record-low thermospheric
//!   density during the 2008 solar minimum", Geophys. Res. Lett. 37, L12102, found the 2008
//!   densities lower than the empirical models predict from the solar indices. Reproduced when the
//!   NRLMSISE-00 median ratio of GRACE-A-2008 is above 1.
//! * P2, activity dependence: in every campaign with at least 50 windows, the standard deviation
//!   of log10 ratio of NRLMSISE-00 is below that of the activity-free static profile.
//! * P3: over all windows, the root mean square of log10 ratio of NRLMSISE-00 and of Jacchia 1971
//!   at each point are both below the static profile's.
//!
//! Everything else is reported, not graded. Disclosure: the Jacchia 1971 ratios on this fixture
//! were already known from the existing oracle (about 1.7 times too dense in 2008); NRLMSISE-00
//! and the static profile had not been compared with it in this repository before.

use kshana::space_weather_pnt::{density, iono4d};
use std::path::{Path, PathBuf};
use std::process::Command;

fn root() -> PathBuf {
    PathBuf::from(env!("CARGO_MANIFEST_DIR"))
}

fn score<'a>(s: &'a [density::Score], model: &str, campaign: &str) -> &'a density::Score {
    s.iter()
        .find(|x| x.model == model && x.campaign == campaign)
        .unwrap_or_else(|| panic!("{model} {campaign}"))
}

#[test]
fn the_density_scorecard_reproduces_the_2008_minimum_overestimate() {
    let text = std::fs::read_to_string(
        root().join("tests/fixtures/space_weather_density_accelerometer_oracle/windows_j71.csv"),
    )
    .expect("fixture");
    let w = density::parse_windows(&text).unwrap();
    let s = density::scorecard(&w);
    for x in &s {
        eprintln!(
            "{:<11} {:<16} n {:>4}  median {:.3}  mean log10 {:+.3}  std {:.3}  rms {:.3}  x2 {:.3}  25% {:.3}",
            x.model,
            x.campaign,
            x.windows,
            x.median_ratio,
            x.mean_log10_ratio,
            x.std_log10_ratio,
            x.rms_log10_ratio,
            x.share_within_factor_2,
            x.share_within_25_percent
        );
    }
    // P1
    let m08 = score(&s, "nrlmsise00", "GRACE-A-2008");
    assert!(m08.median_ratio > 1.0, "P1: {m08:?}");
    // P2
    for c in s
        .iter()
        .filter(|x| x.model == "static" && x.campaign != "all" && x.windows >= 50)
    {
        let m = score(&s, "nrlmsise00", &c.campaign);
        assert!(
            m.std_log10_ratio < c.std_log10_ratio,
            "P2 {}: {m:?} vs {c:?}",
            c.campaign
        );
    }
    // P3
    let st = score(&s, "static", "all").rms_log10_ratio;
    assert!(
        score(&s, "nrlmsise00", "all").rms_log10_ratio < st,
        "P3 nrlmsise00"
    );
    assert!(score(&s, "j71", "all").rms_log10_ratio < st, "P3 j71");
}

#[test]
fn the_4d_ionosphere_runs_on_an_ionex_map() {
    let ionex =
        std::fs::read_to_string(root().join("tests/fixtures/ionex_code_gim/synthetic/map.18i"))
            .expect("synthetic IONEX");
    let file = kshana::ionex::parse_ionex_file(&ionex).unwrap();
    let e = &file.header.first_epoch;
    let epoch = format!(
        "{:04}-{:02}-{:02}T{:02}:30:00Z",
        e.year,
        e.month,
        e.day,
        e.hour + 1
    );
    let lat = 0.5 * (file.header.lat_deg[0] + file.header.lat_deg[1]);
    let req = format!(
        r#"{{"epochs_utc":["{epoch}"],"vtec":"ionex",
            "gnss_rays":[{{"lat_deg":{lat},"lon_deg":10,"az_deg":0,"el_deg":90}},
                         {{"lat_deg":{lat},"lon_deg":10,"az_deg":90,"el_deg":30}}],
            "lf_paths":[{{"tx_lat_deg":{lat},"tx_lon_deg":0,"rx_lat_deg":{lat},"rx_lon_deg":8}}]}}"#
    );
    let out = iono4d::model_json(&req, Some(&ionex)).unwrap();
    let v: serde_json::Value = serde_json::from_str(&out).unwrap();
    let rays = &v["epochs"][0]["gnss_rays"];
    let zen = &rays[0];
    let want = zen["vtec_at_receiver_tecu"].as_f64().unwrap();
    let got = zen["slant_tec_integrated_tecu"].as_f64().unwrap();
    assert!(want > 0.0 && (got / want - 1.0).abs() < 0.01, "{zen}");
    assert!(rays[1]["slant_tec_integrated_tecu"].as_f64().unwrap() > got);
    let lf = &v["epochs"][0]["lf_paths"][0];
    assert!(lf["skywave_delay_us"].as_f64().unwrap() > 0.0, "{lf}");
    // Outside the maps' span: an error, not an extrapolation.
    let late = req.replace(&epoch, "2030-01-01T00:00:00Z");
    assert!(iono4d::model_json(&late, Some(&ionex)).is_err());
}

fn kshana(args: &[&str], dir: &Path) -> (bool, String, String) {
    let o = Command::new(env!("CARGO_BIN_EXE_kshana"))
        .args(args)
        .current_dir(dir)
        .output()
        .unwrap();
    (
        o.status.success(),
        String::from_utf8_lossy(&o.stdout).into_owned(),
        String::from_utf8_lossy(&o.stderr).into_owned(),
    )
}

static SEQ: std::sync::atomic::AtomicU64 = std::sync::atomic::AtomicU64::new(0);

#[test]
fn the_command_line_serves_every_subcommand() {
    let dir = std::env::temp_dir().join(format!(
        "kshana-sw-cli-{}-{}",
        std::process::id(),
        SEQ.fetch_add(1, std::sync::atomic::Ordering::Relaxed)
    ));
    std::fs::create_dir_all(&dir).unwrap();
    let d = dir.as_path();
    let (ok, out, _) = kshana(&["space-weather", "storms"], d);
    assert!(ok);
    let v: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert!(v["storms"].as_array().unwrap().len() >= 8);
    assert!(v["source"].as_str().unwrap().contains("CC BY 4.0"));

    let (ok, out, _) = kshana(
        &[
            "space-weather",
            "storm",
            "2024-05-gannon",
            "--altitudes",
            "250,450",
        ],
        d,
    );
    assert!(ok);
    let v: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["noaa_level"], "G5");
    assert!(v["peak_density_ratio_msis"][0]["ratio"].as_f64().unwrap() > 1.5);

    let fc = root().join("tests/fixtures/space_weather_pnt/3-day-forecast.txt");
    std::fs::write(
        dir.join("req.json"),
        r#"{"site":{"lat_deg":60.4,"lon_deg":5.3,"name":"North Sea"},"mode":"dgnss","baseline_km":150,"operation_hours":12}"#,
    )
    .unwrap();
    let (ok, out, err) = kshana(
        &[
            "space-weather",
            "dgnss",
            "req.json",
            "--forecast",
            fc.to_str().unwrap(),
        ],
        d,
    );
    assert!(ok, "{err}");
    let v: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert_eq!(v["intervals"], 24);
    assert!(v["label"].as_str().unwrap().starts_with("MODELLED"));

    std::fs::write(
        dir.join("life.json"),
        r#"{"altitude_km":350,"mass_kg":300,"area_m2":2,"f107":150,"ap":12,"density_sigma_ln":0.3}"#,
    )
    .unwrap();
    let (ok, out, err) = kshana(&["space-weather", "lifetime", "life.json"], d);
    assert!(ok, "{err}");
    let v: serde_json::Value = serde_json::from_str(&out).unwrap();
    assert!(v["lifetime_days_p50"].as_f64().unwrap() > 1.0);

    let (ok, _, err) = kshana(&["space-weather", "storm", "no-such"], d);
    assert!(!ok && err.contains("no-such"), "{err}");
    let (ok, _, err) = kshana(&["space-weather"], d);
    assert!(!ok && err.contains("kshana space-weather storms"), "{err}");
    let _ = std::fs::remove_dir_all(&dir);
}
