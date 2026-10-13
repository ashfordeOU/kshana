// SPDX-License-Identifier: AGPL-3.0-only
//! Shared by `tests/iq_campaign_monitors.rs` and `tests/iq_campaign_roc.rs`: Kshana scenes of GPS
//! L1 C/A signals only, with an optional attenuation of every satellite's own signal over a
//! stated event, built into a campaign with a `[monitors]` table, tracked and scored. Nothing
//! synthesises an interference waveform.

#![allow(dead_code)]

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

pub const FS: f64 = 2.5e6;
pub const NOMINAL: f64 = 45.0;

pub fn scratch(name: &str) -> PathBuf {
    use std::sync::atomic::{AtomicU64, Ordering};
    static SEQ: AtomicU64 = AtomicU64::new(0);
    let uniq = SEQ.fetch_add(1, Ordering::Relaxed);
    let d = std::env::temp_dir().join(format!(
        "kshana-iq-monitors-{}-{uniq}-{name}",
        std::process::id()
    ));
    let _ = std::fs::remove_dir_all(&d);
    std::fs::create_dir_all(&d).unwrap();
    d
}

/// One recording: GPS L1 C/A satellites `(PRN, Doppler)`, each attenuated by `atten_db`
/// over `[a, b)` (none when `atten` is `None`).
pub struct Rec {
    pub id: String,
    pub seed: u64,
    pub duration_s: f64,
    pub sats: Vec<(u8, f64)>,
    pub atten: Option<(f64, f64, f64)>,
}

pub fn scene(dir: &Path, r: &Rec) -> Vec<TruthRecord> {
    let spec = SampleSpec {
        fs_hz: FS,
        center_hz: 1_575.42e6,
        if_hz: 0.0,
    };
    let mut cfg = SceneConfig::new(spec, r.duration_s);
    cfg.seed = r.seed;
    cfg.threads = 2;
    let mut sc = Scene::new(cfg).unwrap();
    let lambda = kshana::iq::C_M_PER_S / 1_575.42e6;
    for (i, &(prn, dop)) in r.sats.iter().enumerate() {
        let profile = RangeProfile {
            range_m: 2.0e7 + i as f64 * 3.1e5,
            range_rate_mps: -dop * lambda,
            range_accel_mps2: 0.0,
            elevation_deg: 45.0,
            azimuth_deg: 0.0,
        };
        sc.add_satellite(
            SceneSatellite::gps_l1ca_profile(prn, profile, Some(NOMINAL), NavData::None).unwrap(),
        );
    }
    let atten = r.atten;
    sc.set_channel(Box::new(move |_id: u32, t: f64| {
        let a = match atten {
            Some((a, b, db)) if t >= a && t < b => 10f64.powf(-db / 20.0),
            _ => 1.0,
        };
        ChannelSnapshot {
            t_s: t,
            paths: vec![PathState {
                amplitude: a,
                ..direct_path()
            }],
        }
    }));
    let data = dir.join(format!("{}.cf32", r.id));
    let mut sink = create_raw(&data, SampleFormat::parse("cf32_le").unwrap()).unwrap();
    let mut tw = CsvTruthWriter::new(std::io::BufWriter::new(
        std::fs::File::create(dir.join(format!("{}.truth.csv", r.id))).unwrap(),
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

/// Build, track and score a campaign of `recs` with the `[monitors]` table `monitors`.
pub fn campaign(name: &str, recs: &[Rec], monitors: &str) -> Vec<CellResult> {
    let dir = scratch(name);
    std::fs::create_dir_all(dir.join("conds")).unwrap();
    for r in recs {
        let truth = scene(&dir, r);
        let hint = |prn: u8| {
            let t = truth.iter().find(|x| x.sat_id == u32::from(prn)).unwrap();
            (t.doppler_hz, t.code_phase_chips)
        };
        let ids: Vec<String> = r.sats.iter().map(|s| s.0.to_string()).collect();
        let dops: Vec<String> = r.sats.iter().map(|s| hint(s.0).0.to_string()).collect();
        let phs: Vec<String> = r.sats.iter().map(|s| hint(s.0).1.to_string()).collect();
        let event = match r.atten {
            Some((a, b, _)) => format!(
                "[[event]]\nid = \"atten\"\nkind = \"other\"\ntype = \"unknown\"\nonset_s = {a}\noffset_s = {b}\n"
            ),
            None => String::new(),
        };
        std::fs::write(
            dir.join("conds").join(format!("{}.toml", r.id)),
            format!(
                "schema = \"kshana.test-conditions/1\"\n[recording]\nid = \"{id}\"\npath = \"../{id}.cf32\"\nsettle_s = 1.0\n[[expected]]\nsignal = \"gps-l1ca\"\nids = [{ids}]\nnominal_cn0_dbhz = {NOMINAL}\ndoppler_hz = [{dops}]\ncode_phase_chips = [{phs}]\n{event}",
                id = r.id,
                ids = ids.join(", "),
                dops = dops.join(", "),
                phs = phs.join(", "),
            ),
        )
        .unwrap();
    }
    std::fs::write(
        dir.join("designs.toml"),
        "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"plain\"\n",
    )
    .unwrap();
    let campaign = dir.join("campaign.toml");
    std::fs::write(
        &campaign,
        format!(
            "schema = \"kshana.campaign/1\"\nname = \"monitors\"\ndata_class = \"synthetic\"\n[inputs]\nconditions = [\"conds/*.toml\"]\ndesigns = \"designs.toml\"\n[[frontend]]\nname = \"raw\"\n[scoring]\nbaseline_window_s = 2.0\n{monitors}"
        ),
    )
    .unwrap();
    let c = LoadedCampaign::load(&campaign).unwrap();
    let out = dir.join("out");
    let s = run(
        &c,
        &out,
        &RunOptions {
            workers: 4,
            ..Default::default()
        },
    )
    .unwrap();
    assert!(s.cells_failed.is_empty(), "{:?}", s.cells_failed);
    let mut cells = Vec::new();
    for e in std::fs::read_dir(out.join("cells")).unwrap().flatten() {
        let p = e.path();
        if p.extension().is_some_and(|x| x == "json") {
            cells.push(serde_json::from_str(&std::fs::read_to_string(&p).unwrap()).unwrap());
        }
    }
    for r in recs {
        let _ = std::fs::remove_file(dir.join(format!("{}.cf32", r.id)));
    }
    cells
}
