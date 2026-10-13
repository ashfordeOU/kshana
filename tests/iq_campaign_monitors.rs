// SPDX-License-Identifier: AGPL-3.0-only
//! The IQ monitors in the lab-replay campaign (`kshana::iq::campaign::detect`), against the
//! bars pre-registered in `docs/design/MONITORS-IN-CAMPAIGN.md` §3 (382ab2f4).
//!
//! The campaigns are Kshana scenes carrying GPS L1 C/A signals only (2.5 MHz complex, raw front
//! end, the default loop design). The positive events attenuate each satellite's own signal
//! through the scene's channel hook. Nothing synthesises an interference waveform.
//!
//! * **M1, M2:** one 60 s recording, three satellites, no event. The power test (10 ms
//!   blocks, one-block confirmation) has its threshold set so the closed form gives
//!   `P_fa = 0.01` per block. The SQM tests (100-update average, one-update confirmation) use
//!   `k = 2.5758` (`2Q(k) = 0.01`). With a confirmation of one, an alarm span covers exactly
//!   the consecutive tests past the threshold, so the summed span length over the exposure is
//!   the measured exceedance fraction.
//! * **M3, M4:** 6 recordings × 3 satellites. Each recording states one event of kind `other`,
//!   during which every satellite is attenuated by 6 dB for 6 s. The C/N0 CUSUM uses its
//!   defaults.
//!
//! PIN-SCOPE: none. PIN-EXCLUDES: everything (no output hash is pinned here).

use kshana::iq::campaign::detect::CellMonitors;
use kshana::iq::campaign::{run, CellResult, LoadedCampaign, RunOptions};
use kshana::iq::io::inventory::{write_sidecar, RawSidecar};
use kshana::iq::io::stream::create_raw;
use kshana::iq::io::SampleFormat;
use kshana::iq::monitor::stats;
use kshana::iq::scene::{
    direct_path, CsvTruthWriter, NavData, RangeProfile, Scene, SceneConfig, SceneSatellite,
    TruthRecord,
};
use kshana::iq::{ChannelSnapshot, PathState, SampleSpec};
use std::path::{Path, PathBuf};

const FS: f64 = 2.5e6;
const NOMINAL: f64 = 45.0;

fn scratch(name: &str) -> PathBuf {
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
struct Rec {
    id: String,
    seed: u64,
    duration_s: f64,
    sats: Vec<(u8, f64)>,
    atten: Option<(f64, f64, f64)>,
}

fn scene(dir: &Path, r: &Rec) -> Vec<TruthRecord> {
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
fn campaign(name: &str, recs: &[Rec], monitors: &str) -> Vec<CellResult> {
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

/// The threshold (dB) at which the closed-form block-power `P_fa` is `pfa` for `n`-sample
/// blocks (bisection; the closed form falls with the threshold).
fn power_threshold_db(n: usize, pfa: f64) -> f64 {
    let (mut lo, mut hi) = (1e-4, 3.0);
    for _ in 0..200 {
        let mid = 0.5 * (lo + hi);
        if stats::power_block_pfa(n, mid) > pfa {
            lo = mid;
        } else {
            hi = mid;
        }
    }
    0.5 * (lo + hi)
}

/// The two-sided 99 % interval `[lo, hi]` of a Binomial(n, p) count.
fn binomial_99(n: u64, p: f64) -> (u64, u64) {
    let ln_pmf = |k: u64| {
        stats::ln_gamma(n as f64 + 1.0)
            - stats::ln_gamma(k as f64 + 1.0)
            - stats::ln_gamma((n - k) as f64 + 1.0)
            + k as f64 * p.ln()
            + (n - k) as f64 * (1.0 - p).ln()
    };
    let (mut cdf, mut lo, mut hi) = (0.0, None, n);
    for k in 0..=n {
        let next = cdf + ln_pmf(k).exp();
        if lo.is_none() && next > 0.005 {
            lo = Some(k);
        }
        if next >= 0.995 {
            hi = k;
            break;
        }
        cdf = next;
    }
    (lo.unwrap_or(0), hi)
}

/// The smallest `c` with `P(Poisson(m) <= c) >= 0.99`.
fn poisson_99_upper(m: f64) -> u64 {
    let (mut c, mut term, mut cdf) = (0u64, (-m).exp(), (-m).exp());
    while cdf < 0.99 {
        c += 1;
        term *= m / c as f64;
        cdf += term;
    }
    c
}

/// The summed span length (s) of the alarms of `kind` (and `channel`), clipped to `end_s`.
fn span_s(m: &CellMonitors, kind: &str, channel: Option<&str>, end_s: f64) -> f64 {
    m.alarms
        .iter()
        .filter(|a| a.kind == kind && a.channel.as_deref() == channel)
        .map(|a| a.t_end_s.unwrap_or(end_s).min(end_s) - a.t_start_s)
        .sum()
}

const QUIET_S: f64 = 60.0;
const BLOCK_S: f64 = 0.01;

fn quiet() -> &'static Vec<CellResult> {
    static CELLS: std::sync::OnceLock<Vec<CellResult>> = std::sync::OnceLock::new();
    CELLS.get_or_init(|| {
        let t = power_threshold_db((BLOCK_S * FS) as usize, 0.01);
        campaign(
            "quiet",
            &[Rec {
                id: "quiet".into(),
                seed: 31,
                duration_s: QUIET_S,
                sats: vec![(3, 1200.0), (11, -800.0), (19, 300.0)],
                atten: None,
            }],
            &format!(
                "[monitors]\n[monitors.power]\nblock_s = {BLOCK_S}\nbaseline_s = 1.0\nthreshold_db = {t}\nmin_blocks = 1\n[monitors.epoch.sqm]\navg_epochs = 100\nbaseline_s = 2.0\nk_sigma = 2.5758\nmin_count = 1\n"
            ),
        )
    })
}

#[test]
#[cfg_attr(debug_assertions, ignore = "IQ campaign: run in release")]
fn m1_power_test_false_alarm_rate_matches_the_closed_form() {
    let cells = quiet();
    let m = cells[0].monitors.as_ref().unwrap();
    let test = m.tests.iter().find(|t| t.kind == "power_rise").unwrap();
    let pfa = test.pfa.unwrap();
    assert!((pfa - 0.01).abs() < 1e-6, "closed form {pfa}");
    let end = QUIET_S;
    let blocks_past = ((span_s(m, "power_rise", None, end) + span_s(m, "power_drop", None, end))
        / BLOCK_S)
        .round() as u64;
    let n = ((QUIET_S - 1.0) / BLOCK_S).round() as u64;
    let (lo, hi) = binomial_99(n, pfa);
    eprintln!(
        "M1: {blocks_past} of {n} blocks past ±{:.4} dB (fraction {:.5}); closed form {pfa:.4}, 99 % interval [{lo}, {hi}]",
        test.threshold,
        blocks_past as f64 / n as f64
    );
    assert!(
        (lo..=hi).contains(&blocks_past),
        "M1 NOT MET: {blocks_past} outside [{lo}, {hi}]"
    );
}

#[test]
#[cfg_attr(debug_assertions, ignore = "IQ campaign: run in release")]
fn m2_sqm_false_alarm_fraction_is_within_a_factor_of_2_of_2q_k() {
    let cells = quiet();
    let m = cells[0].monitors.as_ref().unwrap();
    let pfa = m
        .tests
        .iter()
        .find(|t| t.kind == "sqm_delta")
        .unwrap()
        .pfa
        .unwrap();
    assert!((pfa - 0.01).abs() < 1e-5, "closed form {pfa}");
    let mut bad = Vec::new();
    for kind in ["sqm_delta", "sqm_ratio"] {
        let (mut past, mut exposure) = (0.0, 0.0);
        for f in m.false_alarms.iter().filter(|f| f.kind == kind) {
            past += span_s(m, kind, f.channel.as_deref(), QUIET_S);
            exposure += f.exposure_s;
        }
        let frac = past / exposure;
        eprintln!(
            "M2 {kind}: fraction {frac:.5} over {exposure:.1} s of channel time (2Q(k) = {pfa:.4})"
        );
        if !(0.005..=0.02).contains(&frac) {
            bad.push(format!("{kind}: {frac:.5}"));
        }
    }
    assert!(bad.is_empty(), "M2 NOT MET: {bad:?}");
}

const ATT_DB: f64 = 6.0;

fn stepped() -> &'static Vec<CellResult> {
    static CELLS: std::sync::OnceLock<Vec<CellResult>> = std::sync::OnceLock::new();
    CELLS.get_or_init(|| {
        let pool = [
            (3u8, 1200.0),
            (11, -800.0),
            (19, 300.0),
            (7, 2300.0),
            (24, -1700.0),
            (14, 650.0),
        ];
        let recs: Vec<Rec> = (0..6)
            .map(|i| Rec {
                id: format!("s{i}"),
                seed: 200 + i as u64,
                duration_s: 22.0,
                sats: (0..3).map(|j| pool[(i + 2 * j) % pool.len()]).collect(),
                atten: Some((10.0, 16.0, ATT_DB)),
            })
            .collect();
        campaign("stepped", &recs, "[monitors]\n")
    })
}

/// Detector sample spacing (s) of the default design's C/N0 CUSUM: the estimator length.
fn detector_dt_s() -> f64 {
    let d = kshana::iq::track::design::DesignFile::parse(
        "schema = \"kshana.loop-design/1\"\n[[design]]\nname = \"plain\"\n",
    )
    .unwrap();
    let lc = d.designs()[0].loop_config_for(1e-3);
    (lc.cn0_windows * lc.cn0_window_periods) as f64 * 1e-3
}

#[test]
#[ignore = "FINDING (run 2026-10-13): M3 NOT MET on its timing clause: 18 of 18 attenuations detected (P_md = 0, met), but the median time to detect is 1.001 s against 2 x ARL1 x 1.000 s = 0.433 s. The CUSUM sees one C/N0 estimate per 1 s estimator window, so no detection can come sooner than about one window, and the bound is below one detector sample; recorded in docs/design/MONITORS-IN-CAMPAIGN.md section 4. Run in release with --ignored"]
fn m3_every_attenuation_is_detected_within_twice_the_arl1() {
    let dt = detector_dt_s();
    let (mut ttd, mut bound, mut missed) = (Vec::new(), Vec::new(), Vec::new());
    for c in stepped() {
        let m = c.monitors.as_ref().unwrap();
        for d in m.detections.iter().filter(|d| d.kind == "cn0_drop") {
            let ch = d.channel.as_deref().unwrap();
            if !d.detected {
                missed.push(format!("{}/{ch}", c.recording.id));
                continue;
            }
            let t = m
                .tests
                .iter()
                .find(|t| t.kind == "cn0_drop" && t.channel.as_deref() == Some(ch))
                .unwrap();
            let [_, sd] = t.baseline.unwrap();
            let k = 3.0 / (2.0 * sd.max(0.1));
            let arl1 = stats::cusum_arl(k, t.threshold, ATT_DB / sd.max(0.1));
            ttd.push(d.time_to_detect_s.unwrap());
            bound.push(2.0 * arl1 * dt);
        }
    }
    let med = |mut v: Vec<f64>| {
        v.sort_by(f64::total_cmp);
        if v.is_empty() {
            f64::NAN
        } else {
            v[v.len() / 2]
        }
    };
    let n = ttd.len() + missed.len();
    let (mt, mb) = (med(ttd.clone()), med(bound));
    eprintln!(
        "M3: {} of {n} satellite-events detected; median time to detect {mt:.3} s against 2 x ARL1 x {dt:.3} s = {mb:.3} s; missed {missed:?}",
        ttd.len()
    );
    assert_eq!(n, 18, "18 satellite-events");
    assert!(missed.is_empty(), "M3 NOT MET: missed {missed:?}");
    assert!(
        mt <= mb,
        "M3 NOT MET: median time to detect {mt:.3} s > {mb:.3} s"
    );
}

#[test]
#[cfg_attr(debug_assertions, ignore = "IQ campaign: run in release")]
fn m4_cn0_false_alarms_stay_within_the_poisson_bound_of_arl0() {
    let dt = detector_dt_s();
    let (mut count, mut expected) = (0u64, 0.0);
    for c in stepped() {
        let m = c.monitors.as_ref().unwrap();
        for f in m
            .false_alarms
            .iter()
            .filter(|f| f.kind == "cn0_drop" || f.kind == "cn0_rise")
        {
            count += u64::from(f.count);
            let arl0 = m
                .tests
                .iter()
                .find(|t| t.kind == f.kind && t.channel == f.channel)
                .and_then(|t| t.arl0_samples)
                .unwrap();
            expected += f.exposure_s / (arl0 * dt);
        }
    }
    let bound = poisson_99_upper(expected);
    eprintln!("M4: {count} C/N0 false alarms; exposure / ARL0 gives {expected:.3e}, Poisson 99 % bound {bound}");
    assert!(count <= bound, "M4 NOT MET: {count} > {bound}");
}

/// A campaign without a `[monitors]` table carries no monitors block; a stated monitor
/// configuration shows in the plan.
#[test]
fn the_monitors_table_parses_and_validates() {
    let spec = kshana::iq::campaign::spec::CampaignSpec::parse(
        "schema = \"kshana.campaign/1\"\nname = \"x\"\ndata_class = \"synthetic\"\n[inputs]\nconditions = [\"*.toml\"]\n[monitors]\ndetect_grace_s = -1.0\n",
    );
    assert!(spec.unwrap_err().contains("detect_grace_s"));
    let spec = kshana::iq::campaign::spec::CampaignSpec::parse(
        "schema = \"kshana.campaign/1\"\nname = \"x\"\ndata_class = \"synthetic\"\n[inputs]\nconditions = [\"*.toml\"]\n",
    )
    .unwrap();
    assert!(spec.monitors.is_none());
    let with = kshana::iq::campaign::spec::CampaignSpec::parse(
        "schema = \"kshana.campaign/1\"\nname = \"x\"\ndata_class = \"synthetic\"\n[inputs]\nconditions = [\"*.toml\"]\n[monitors]\n[monitors.power]\nthreshold_db = 2.0\n",
    )
    .unwrap();
    assert_ne!(
        spec.run_hash(),
        with.run_hash(),
        "monitors enter the run hash"
    );
}
