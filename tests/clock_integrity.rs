// SPDX-License-Identifier: AGPL-3.0-only
//! RAIM beside the clock-holdover figures of merit (CAP-05b, `src/clock_integrity.rs`).
//!
//! * Without `[integrity]` the clock document has no `integrity_fom` key (the goldens pin its
//!   bytes); with it, the holdover figures are unchanged and the block is separate.
//! * While the timeline says GNSS is denied, RAIM is unavailable: no protection level, never
//!   extrapolated.
//! * The protection levels are the snapshot RAIM's (RTKLIB-validated) on the same sky: they
//!   depend on the geometry only, so a zero-residual recomputation gives them exactly.
//! * Fault-free epochs raise no alarm (seeded run); a stated bias on one satellite is detected
//!   while it lasts and not outside it.
//!
//! MODELLED (InternalConsistency).

use kshana::clock_integrity::{sky_at, IntegrityCfg};
use serde_json::Value;

const SECTION: &str =
    "\n[integrity]\nsite = { lat_deg = 59.44, lon_deg = 24.75, height_m = 30.0 }\nstep_s = 60.0\n";

fn clock() -> String {
    std::fs::read_to_string("scenarios/clock-holdover.toml").unwrap()
}

fn doc(src: &str) -> Value {
    serde_json::from_str(&kshana::api::run_toml(src).expect("runs").json).unwrap()
}

/// The clock scenario with its nominal window stretched over the whole run (so every epoch is
/// evaluated), plus `extra`.
fn nominal_all(extra: &str) -> String {
    clock().replace(
        "  { t0 = 0.0,    t1 = 600.0,  state = \"nominal\" },\n  { t0 = 600.0,  t1 = 7200.0, state = \"denied\" },",
        "  { t0 = 0.0,    t1 = 7200.0, state = \"nominal\" },",
    ) + SECTION
        + extra
}

#[test]
fn the_block_is_separate_and_absent_by_default() {
    let plain = doc(&clock());
    assert!(plain.get("integrity_fom").is_none());
    let with = doc(&(clock() + SECTION));
    for k in ["quantum", "classical", "scenario_hash"] {
        if k == "scenario_hash" {
            assert_ne!(
                with[k], plain[k],
                "the section is an input, so it is hashed"
            );
        } else {
            assert_eq!(with[k], plain[k], "{k} moved with [integrity]");
        }
    }
    let f = &with["integrity_fom"];
    assert_eq!(f["label"], "MODELLED");
    assert_eq!(f["n_epochs"], 121);
    // The clock scenario is nominal for 600 s, then denied: epochs 0..=9 evaluated.
    assert_eq!(f["n_evaluated"], 10);
    assert_eq!(f["n_denied"], 111);
    for e in f["epochs"].as_array().unwrap() {
        if e["gnss_state"] == "denied" {
            assert_eq!(e["verdict"], "unavailable-gnss-denied");
            assert!(e.get("hpl_m").is_none() && e.get("vpl_m").is_none());
        }
    }
    let ens = clock().replace("seed = 42", "seed = 42\nruns = 3") + SECTION;
    assert!(
        kshana::api::run_toml(&ens).is_err(),
        "[integrity] needs runs = 1"
    );
}

#[test]
fn protection_levels_are_the_snapshot_raims_on_the_same_sky() {
    let src = nominal_all("");
    let f = doc(&src)["integrity_fom"].clone();
    let cfg: IntegrityCfg =
        toml::from_str(SECTION.trim_start().trim_start_matches("[integrity]\n")).unwrap();
    let user = kshana::geometry::site_ecef(&cfg.site).unwrap();
    // The timeline's windows are half-open, so the final epoch (t = duration) is denied.
    for e in f["epochs"]
        .as_array()
        .unwrap()
        .iter()
        .step_by(20)
        .filter(|e| e["gnss_state"] != "denied")
    {
        let t = e["t_s"].as_f64().unwrap();
        let sky = sky_at(&cfg, user, t).unwrap();
        assert_eq!(e["n_sats"].as_u64().unwrap() as usize, sky.len());
        let sats: Vec<[f64; 3]> = sky.iter().map(|s| s.1).collect();
        let zero = vec![0.0; sats.len()];
        let r = kshana::raim::snapshot_raim(user, &sats, &zero, 1.0, 1e-5, 1e-3).expect("raim");
        assert_eq!(e["hpl_m"].as_f64().unwrap(), r.hpl_m, "t {t}");
        assert_eq!(e["vpl_m"].as_f64().unwrap(), r.vpl_m, "t {t}");
    }
    assert_eq!(f["n_alarm"], 0, "fault-free epochs must not alarm");
    assert!(f["n_available"].as_u64().unwrap() > 100);
}

#[test]
fn a_stated_bias_is_detected_while_it_lasts() {
    let cfg: IntegrityCfg =
        toml::from_str(SECTION.trim_start().trim_start_matches("[integrity]\n")).unwrap();
    let user = kshana::geometry::site_ecef(&cfg.site).unwrap();
    let id = sky_at(&cfg, user, 3000.0).unwrap()[0].0.clone();
    let src = nominal_all(&format!(
        "injected_bias = {{ sat_id = \"{id}\", bias_m = 60.0, t0_s = 3000.0, t1_s = 3600.0 }}\n"
    ));
    let f = doc(&src)["integrity_fom"].clone();
    for e in f["epochs"].as_array().unwrap() {
        let t = e["t_s"].as_f64().unwrap();
        let inside = (3000.0..3600.0).contains(&t);
        let alarm = e["verdict"] == "alarm";
        assert_eq!(alarm, inside, "t {t}: verdict {}", e["verdict"]);
    }
    assert_eq!(f["n_alarm"], 10);
}

#[test]
fn every_integrity_field_has_a_unit() {
    let src = clock()
        + SECTION
        + "injected_bias = { sat_id = \"gps-baseline-2\", bias_m = 60.0, t0_s = 0.0, t1_s = 120.0 }\n";
    let a = kshana::field_schema::audit_document(&doc(&src));
    assert!(a.missing.is_empty(), "missing units: {:?}", a.missing);
    let plain = doc(&clock());
    assert!(!plain["units"]
        .as_object()
        .unwrap()
        .keys()
        .any(|k| k.starts_with("integrity_fom")));
}
