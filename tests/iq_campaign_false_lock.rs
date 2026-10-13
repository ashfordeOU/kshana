// SPDX-License-Identifier: AGPL-3.0-only
//! A real tracker false lock, scored by the campaign (`kshana::iq::campaign`).
//!
//! The scene carries one legitimate GPS L1 C/A signal. Part-way through the run its carrier
//! steps by +1/(2T) (500 Hz for the 1 ms loop): the channel, declared locked, now sits on the
//! Costas alias of the signal. The tracker's false-lock check finds the signal in the alias
//! row and reports a `false-lock` event from the LOCKED state. The campaign scorer must count
//! that as a false-lock episode of the run and of the stated event that contains it. Nothing
//! here synthesises an interference waveform: the step is a frequency change of the satellite's
//! own signal, applied through the scene's channel hook.
//!
//! PIN-SCOPE: none. PIN-EXCLUDES: everything (no output hash is pinned here).

use kshana::iq::campaign::{run, CellResult, LoadedCampaign, RunOptions};
use kshana::iq::io::inventory::{write_sidecar, RawSidecar};
use kshana::iq::io::stream::create_raw;
use kshana::iq::io::SampleFormat;
use kshana::iq::scene::{
    direct_path, CsvTruthWriter, NavData, RangeProfile, Scene, SceneConfig, SceneSatellite,
    TruthRecord,
};
use kshana::iq::{ChannelSnapshot, PathState, SampleSpec};
use std::path::{Path, PathBuf};

const FS: f64 = 2.5e6;
const NOMINAL: f64 = 45.0;
/// The carrier step: +1/(2T) for the 1 ms loop.
const STEP_HZ: f64 = 500.0;
const STEP_T: f64 = 4.0;

fn scratch(name: &str) -> PathBuf {
    let d = std::env::temp_dir().join(format!(
        "kshana-iq-false-lock-{}-{name}",
        std::process::id()
    ));
    let _ = std::fs::remove_dir_all(&d);
    std::fs::create_dir_all(&d).unwrap();
    d
}

/// One GPS L1 C/A satellite whose carrier steps by `STEP_HZ` at `STEP_T`. Returns the
/// truth records (the truth sidecar keeps the geometric Doppler, without the step).
fn scene(dir: &Path, name: &str, duration_s: f64, prn: u8, dop: f64) -> Vec<TruthRecord> {
    let spec = SampleSpec {
        fs_hz: FS,
        center_hz: 1_575.42e6,
        if_hz: 0.0,
    };
    let mut cfg = SceneConfig::new(spec, duration_s);
    cfg.seed = 5;
    cfg.threads = 2;
    let mut sc = Scene::new(cfg).unwrap();
    let lambda = kshana::iq::C_M_PER_S / 1_575.42e6;
    let profile = RangeProfile {
        range_m: 2.0e7,
        range_rate_mps: -dop * lambda,
        range_accel_mps2: 0.0,
        elevation_deg: 45.0,
        azimuth_deg: 0.0,
    };
    sc.add_satellite(
        SceneSatellite::gps_l1ca_profile(prn, profile, Some(NOMINAL), NavData::None).unwrap(),
    );
    // The step: the phase accumulated since STEP_T, plus the within-knot advance.
    sc.set_channel(Box::new(move |_id: u32, t: f64| {
        let after = t >= STEP_T;
        ChannelSnapshot {
            t_s: t,
            paths: vec![PathState {
                carrier_phase_rad: if after {
                    std::f64::consts::TAU * STEP_HZ * (t - STEP_T)
                } else {
                    0.0
                },
                extra_doppler_hz: if after { STEP_HZ } else { 0.0 },
                ..direct_path()
            }],
        }
    }));
    let data = dir.join(format!("{name}.cf32"));
    let mut sink = create_raw(&data, SampleFormat::parse("cf32_le").unwrap()).unwrap();
    let mut tw = CsvTruthWriter::new(std::io::BufWriter::new(
        std::fs::File::create(dir.join(format!("{name}.truth.csv"))).unwrap(),
    ));
    let mut records: Vec<TruthRecord> = Vec::new();
    struct Tee<'a, A: kshana::iq::scene::TruthSink>(&'a mut A, &'a mut Vec<TruthRecord>);
    impl<A: kshana::iq::scene::TruthSink> kshana::iq::scene::TruthSink for Tee<'_, A> {
        fn record(&mut self, r: &TruthRecord) -> Result<(), kshana::iq::IqError> {
            self.1.push(*r);
            self.0.record(r)
        }
        fn finish(&mut self) -> Result<(), kshana::iq::IqError> {
            self.0.finish()
        }
    }
    sc.generate(&mut sink, &mut Tee(&mut tw, &mut records))
        .unwrap();
    write_sidecar(
        &data,
        &RawSidecar {
            format: "cf32_le".into(),
            sample_rate_hz: FS,
            center_hz: Some(1_575.42e6),
            if_hz: Some(0.0),
            header_bytes: None,
            channels: None,
            channel: None,
            datetime: None,
            description: None,
        },
    )
    .unwrap();
    records
}

/// The campaign of the step scene: one recording, one front end, one design (observe only,
/// so the channel stays lost after the false lock), epochs and events kept.
fn campaign() -> (PathBuf, CellResult, Vec<serde_json::Value>) {
    let dir = scratch("campaign");
    let truth = scene(&dir, "step", 8.0, 3, 1200.0);
    let r = truth.iter().find(|r| r.sat_id == 3).unwrap();
    std::fs::create_dir_all(dir.join("conds")).unwrap();
    std::fs::write(
        dir.join("conds/step.toml"),
        format!(
            r#"schema = "kshana.test-conditions/1"
[recording]
id = "step"
path = "../step.cf32"
settle_s = 1.0
[[expected]]
signal = "gps-l1ca"
ids = [3]
nominal_cn0_dbhz = {NOMINAL}
doppler_hz = [{}]
code_phase_chips = [{}]
[[event]]
id = "step"
kind = "other"
type = "unknown"
onset_s = {STEP_T}
offset_s = 8.0
"#,
            r.doppler_hz, r.code_phase_chips
        ),
    )
    .unwrap();
    std::fs::write(
        dir.join("designs.toml"),
        "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"observe\"\n",
    )
    .unwrap();
    let campaign = dir.join("campaign.toml");
    std::fs::write(
        &campaign,
        r#"schema = "kshana.campaign/1"
name = "false lock"
data_class = "synthetic"
[inputs]
conditions = ["conds/*.toml"]
designs = "designs.toml"
[[frontend]]
name = "raw"
[run]
epochs = "jsonl"
[scoring]
baseline_window_s = 2.0
"#,
    )
    .unwrap();
    let c = LoadedCampaign::load(&campaign).unwrap();
    let out = dir.join("out");
    let s = run(&c, &out, &RunOptions::default()).unwrap();
    assert!(s.cells_failed.is_empty(), "{:?}", s.cells_failed);
    let cell_file = std::fs::read_dir(out.join("cells"))
        .unwrap()
        .flatten()
        .map(|e| e.path())
        .find(|p| p.extension().is_some_and(|x| x == "json"))
        .unwrap();
    let cell: CellResult =
        serde_json::from_str(&std::fs::read_to_string(&cell_file).unwrap()).unwrap();
    let events_file = out
        .join("epochs")
        .join(format!("{}.events.jsonl", cell.key));
    let events = std::fs::read_to_string(&events_file)
        .unwrap()
        .lines()
        .filter_map(|l| serde_json::from_str::<serde_json::Value>(l).ok())
        .filter(|v| v.get("reason").is_some())
        .collect();
    (dir, cell, events)
}

#[test]
fn a_tracker_false_lock_from_locked_is_scored_as_an_episode() {
    let (_dir, cell, events) = campaign();
    for e in &events {
        eprintln!("event {e}");
    }
    let s = &cell.satellites[0].score;
    eprintln!("whole run {:?}", s.whole_run);
    eprintln!("event {:?}", s.events[0].false_lock_episodes);
    // The tracker reports the false lock from LOCKED, after the step.
    let fl: Vec<&serde_json::Value> = events
        .iter()
        .filter(|e| e["reason"] == "false-lock")
        .collect();
    assert!(!fl.is_empty(), "no false-lock event: {events:?}");
    let first = fl[0];
    assert_eq!(first["from"], "LOCKED", "{first}");
    assert!(first["code_epoch_s"].as_f64().unwrap() >= STEP_T);
    // Scored: one episode per tracker firing from LOCKED, in the run and in the event.
    let n = fl.iter().filter(|e| e["from"] == "LOCKED").count() as u32;
    assert_eq!(s.whole_run.false_lock_episodes, n);
    assert_eq!(s.events[0].false_lock_episodes, n);
    assert!(s.whole_run.false_lock_per_hour.unwrap() > 0.0);
}
