// SPDX-License-Identifier: AGPL-3.0-only
//! Synthetic labelled data packs (0.41 row B7): `kshana data-pack`.
//!
//! A pack is a directory of generated items with their labels, for training and testing
//! detectors. The same seed and options give the same files, byte for byte, and every label is
//! exact because the generator made the condition it labels.
//!
//! * **Log items** (`logs/`): vessel NMEA 0183 voyages from [`crate::receiver_trust::synth`].
//!   Half carry a position drag-off (a spoofed receiver drawn away along a bearing while the fix
//!   stays valid); the labels file gives, for every one-second epoch, `nominal` or
//!   `spoofed-drag-off` and the vessel's true position.
//! * **IQ items** (`iq/`): GNSS L1 C/A baseband scenes written by `kshana iq scene` (SigMF, with
//!   the scene's truth sidecar), each of one class: `nominal`; `obstruction` (a deep C/N0 drop on
//!   some satellites over a stated window); `scintillation` (Rice fading at a stated S4 on every
//!   satellite); `multipath` (a ground reflection on every satellite). The labels file states the
//!   class, its parameters, the satellites and the time window.
//!
//! These are legitimate signals and their natural impairments. The open engine writes no jamming
//! or spoofing waveform (docs/HARDWARE-SAFETY.md); spoofing is labelled in the text logs only.
//! `manifest.json` lists every file with its SHA-256, so a pack can be checked after copying.

use crate::receiver_trust::synth::{synth_voyage_with_truth, DragSpec, VoyageSpec};
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha20Rng;
use serde::Serialize;
use std::path::Path;

/// What to generate.
#[derive(Clone, Debug)]
pub struct PackSpec {
    /// The pack's seed.
    pub seed: u64,
    /// Number of log items.
    pub n_logs: usize,
    /// Seconds per log item.
    pub log_seconds: f64,
    /// Number of IQ items.
    pub n_iq: usize,
    /// Seconds per IQ item.
    pub iq_seconds: f64,
    /// Complex sample rate of the IQ items, Hz.
    pub iq_rate_hz: f64,
}

/// One file of the pack.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct PackFile {
    /// Path relative to the pack directory.
    pub path: String,
    /// SHA-256 of its bytes.
    pub sha256: String,
    /// Size in bytes.
    pub bytes: u64,
}

/// One item: its class and its files.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct PackItem {
    /// Item id.
    pub id: String,
    /// `log` or `iq`.
    pub kind: &'static str,
    /// Its class.
    pub class: String,
    /// The item's own seed.
    pub seed: u64,
    /// Its files.
    pub files: Vec<PackFile>,
}

/// `manifest.json`.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct Manifest {
    /// `kshana.data-pack/1`.
    pub schema: &'static str,
    /// Engine version.
    pub engine: &'static str,
    /// The pack's seed.
    pub seed: u64,
    /// The items.
    pub items: Vec<PackItem>,
    /// Items per class.
    pub classes: std::collections::BTreeMap<String, usize>,
    /// What the pack is and is not.
    pub note: &'static str,
}

fn sha256_hex(bytes: &[u8]) -> String {
    use sha2::{Digest, Sha256};
    hex::encode(Sha256::digest(bytes))
}

fn write(dir: &Path, rel: &str, bytes: &[u8]) -> Result<PackFile, String> {
    let p = dir.join(rel);
    if let Some(parent) = p.parent() {
        std::fs::create_dir_all(parent).map_err(|e| format!("{}: {e}", parent.display()))?;
    }
    std::fs::write(&p, bytes).map_err(|e| format!("{}: {e}", p.display()))?;
    file_entry(dir, rel)
}

fn file_entry(dir: &Path, rel: &str) -> Result<PackFile, String> {
    let p = dir.join(rel);
    let bytes = std::fs::read(&p).map_err(|e| format!("{}: {e}", p.display()))?;
    Ok(PackFile {
        path: rel.to_string(),
        sha256: sha256_hex(&bytes),
        bytes: bytes.len() as u64,
    })
}

/// One epoch label of a log item.
#[derive(Serialize)]
struct LogLabel {
    t_s: f64,
    label: &'static str,
    truth_lat_deg: f64,
    truth_lon_deg: f64,
}

fn log_item(dir: &Path, k: usize, seed: u64, seconds: f64) -> Result<PackItem, String> {
    let mut r = ChaCha20Rng::seed_from_u64(seed);
    let lat0 = r.gen_range(54.0..60.0);
    let lon0 = r.gen_range(10.0..25.0);
    let course = r.gen_range(0.0..360.0f64).to_radians();
    let dist_deg = 0.3;
    let spoofed = k % 2 == 1;
    let onset = seconds * r.gen_range(0.3..0.6);
    let spec = VoyageSpec {
        route: vec![
            (lat0, lon0),
            (
                lat0 + dist_deg * course.cos(),
                lon0 + dist_deg * course.sin() / lat0.to_radians().cos(),
            ),
        ],
        duration_s: seconds,
        sog_kn: r.gen_range(8.0..20.0),
        turn_rate_dps: 0.4,
        current_mps: (r.gen_range(-0.3..0.3), r.gen_range(-0.3..0.3)),
        seed: r.gen(),
        drag: spoofed.then(|| DragSpec {
            onset_s: onset,
            accel_mps2: 0.01,
            speed_mps: r.gen_range(1.5..4.0),
            bearing_rel_deg: r.gen_range(-90.0..90.0),
            cn0_common_dbhz: None,
            cn0_ramp_s: 0.0,
        }),
        ..VoyageSpec::default()
    };
    let (text, truth) = synth_voyage_with_truth(&spec);
    let id = format!("log-{k:04}");
    let class = if spoofed {
        "spoofed-drag-off"
    } else {
        "nominal"
    };
    let mut labels = String::new();
    for (i, t) in truth.iter().enumerate() {
        let ts = i as f64;
        let l = LogLabel {
            t_s: ts,
            label: if spoofed && ts >= onset {
                "spoofed-drag-off"
            } else {
                "nominal"
            },
            truth_lat_deg: t[0],
            truth_lon_deg: t[1],
        };
        labels.push_str(&serde_json::to_string(&l).map_err(|e| e.to_string())?);
        labels.push('\n');
    }
    Ok(PackItem {
        id: id.clone(),
        kind: "log",
        class: class.into(),
        seed,
        files: vec![
            write(dir, &format!("logs/{id}.nmea"), text.as_bytes())?,
            write(dir, &format!("logs/{id}.labels.jsonl"), labels.as_bytes())?,
        ],
    })
}

/// The label document of an IQ item.
#[derive(Serialize)]
struct IqLabel {
    id: String,
    class: &'static str,
    signal: &'static str,
    prns: Vec<u32>,
    cn0_dbhz: f64,
    duration_s: f64,
    /// The satellites the condition applies to.
    affected_prns: Vec<u32>,
    /// The window the condition applies over, s from the first sample (the whole item when it
    /// is not windowed).
    window_s: [f64; 2],
    /// The condition's parameters.
    params: serde_json::Value,
}

fn iq_item(dir: &Path, k: usize, seed: u64, spec: &PackSpec) -> Result<PackItem, String> {
    let mut r = ChaCha20Rng::seed_from_u64(seed);
    let classes = ["nominal", "obstruction", "scintillation", "multipath"];
    let class = classes[k % classes.len()];
    let mut pool: Vec<u32> = (1..=32).collect();
    let mut prns = Vec::new();
    for _ in 0..4 {
        let i = r.gen_range(0..pool.len());
        prns.push(pool.remove(i));
    }
    prns.sort_unstable();
    let dopplers: Vec<String> = prns
        .iter()
        .map(|_| format!("{:.0}", r.gen_range(-4000.0..4000.0f64)))
        .collect();
    let cn0 = r.gen_range(40.0..48.0f64).round();
    let dur = spec.iq_seconds;
    let id = format!("iq-{k:04}");
    let rel_data = format!("iq/{id}.sigmf-data");
    let rel_truth = format!("iq/{id}.truth.csv");
    let prn_list = prns
        .iter()
        .map(u32::to_string)
        .collect::<Vec<_>>()
        .join(",");
    let mut args: Vec<String> = vec![
        "scene".into(),
        dir.join(&rel_data).display().to_string(),
        "--rate".into(),
        format!("{}", spec.iq_rate_hz),
        "--duration".into(),
        format!("{dur}"),
        "--signal".into(),
        "gps-l1ca".into(),
        "--prn".into(),
        prn_list,
        "--doppler".into(),
        dopplers.join(","),
        "--cn0".into(),
        format!("{cn0}"),
        "--seed".into(),
        format!("{}", r.gen::<u32>()),
        "--format".into(),
        "sigmf".into(),
        "--truth".into(),
        dir.join(&rel_truth).display().to_string(),
        "--threads".into(),
        "1".into(),
    ];
    let mut affected = prns.clone();
    let mut window = [0.0, dur];
    let params;
    let mut extra_files = Vec::new();
    match class {
        "obstruction" => {
            let n = r.gen_range(1..=2usize);
            affected = prns[..n].to_vec();
            let a = (dur * r.gen_range(0.2..0.4) * 10.0).round() / 10.0;
            let b = (dur * r.gen_range(0.6..0.8) * 10.0).round() / 10.0;
            let depth = -r.gen_range(15.0..30.0f64).round();
            window = [a, b];
            // 1 ms edges: the profile's times must increase strictly.
            let (a1, b0) = (a + 0.001, b - 0.001);
            let profile = format!(
                "[[segment]]\nprns = [{}]\nkind = \"points\"\nt_s = [{a}, {a1}, {b0}, {b}]\ndb = [0.0, {depth}, {depth}, 0.0]\n",
                affected.iter().map(u32::to_string).collect::<Vec<_>>().join(", ")
            );
            let rel = format!("iq/{id}.cn0-profile.toml");
            extra_files.push(write(dir, &rel, profile.as_bytes())?);
            args.extend(["--cn0-profile".into(), dir.join(&rel).display().to_string()]);
            params = serde_json::json!({"depth_db": depth});
        }
        "scintillation" => {
            let s4 = (r.gen_range(0.3..0.8f64) * 100.0).round() / 100.0;
            let tau = (r.gen_range(0.2..1.0f64) * 100.0).round() / 100.0;
            args.extend([
                "--s4".into(),
                format!("{s4}"),
                "--scint-tau0".into(),
                format!("{tau}"),
            ]);
            params = serde_json::json!({"s4": s4, "tau0_s": tau});
        }
        "multipath" => {
            let h = (r.gen_range(2.0..30.0f64) * 10.0).round() / 10.0;
            let ground = ["dry", "wet", "sea"][r.gen_range(0..3)];
            args.extend([
                "--multipath-height".into(),
                format!("{h}"),
                "--multipath-ground".into(),
                ground.into(),
            ]);
            params = serde_json::json!({"antenna_height_m": h, "ground": ground});
        }
        _ => {
            affected.clear();
            params = serde_json::json!({});
        }
    }
    let iq_dir = dir.join("iq");
    std::fs::create_dir_all(&iq_dir).map_err(|e| format!("{}: {e}", iq_dir.display()))?;
    crate::iq::cli::execute(&args).map_err(|e| e.to_string())?;
    let label = IqLabel {
        id: id.clone(),
        class,
        signal: "gps-l1ca",
        prns: prns.clone(),
        cn0_dbhz: cn0,
        duration_s: dur,
        affected_prns: affected,
        window_s: window,
        params,
    };
    let rel_label = format!("iq/{id}.labels.json");
    let mut files = vec![
        file_entry(dir, &rel_data)?,
        file_entry(dir, &format!("iq/{id}.sigmf-meta"))?,
        file_entry(dir, &rel_truth)?,
    ];
    files.extend(extra_files);
    files.push(write(
        dir,
        &rel_label,
        serde_json::to_string_pretty(&label)
            .map_err(|e| e.to_string())?
            .as_bytes(),
    )?);
    Ok(PackItem {
        id,
        kind: "iq",
        class: class.into(),
        seed,
        files,
    })
}

/// Build a pack into `dir`, which must not exist yet (nothing is overwritten).
pub fn build(spec: &PackSpec, dir: &Path) -> Result<Manifest, String> {
    if dir.exists() {
        return Err(crate::terr!(
            "e-data-pack-exists",
            path = dir.display().to_string()
        ));
    }
    std::fs::create_dir_all(dir).map_err(|e| format!("{}: {e}", dir.display()))?;
    let mut master = ChaCha20Rng::seed_from_u64(spec.seed);
    let mut items = Vec::new();
    for k in 0..spec.n_logs {
        items.push(log_item(dir, k, master.gen(), spec.log_seconds)?);
    }
    for k in 0..spec.n_iq {
        items.push(iq_item(dir, k, master.gen(), spec)?);
    }
    let mut classes = std::collections::BTreeMap::new();
    for it in &items {
        *classes
            .entry(format!("{}:{}", it.kind, it.class))
            .or_insert(0) += 1;
    }
    let m = Manifest {
        schema: "kshana.data-pack/1",
        engine: env!("CARGO_PKG_VERSION"),
        seed: spec.seed,
        items,
        classes,
        note: "Synthetic data generated by Kshana: every label is exact by construction. Legitimate GNSS signals and natural impairments only; spoofing appears in the NMEA logs as labelled text, never as a radio waveform. Not a measurement.",
    };
    let text = serde_json::to_string_pretty(&m).map_err(|e| e.to_string())?;
    std::fs::write(dir.join("manifest.json"), format!("{text}\n"))
        .map_err(|e| format!("{}: {e}", dir.display()))?;
    Ok(m)
}

/// Usage text for `kshana data-pack`.
pub fn usage() -> String {
    crate::t!("data-pack-usage")
}

/// `kshana data-pack <out-dir> [--seed <n>] [--logs <n>] [--log-seconds <s>] [--iq <n>]
/// [--iq-seconds <s>] [--iq-rate <hz>]`.
pub fn run(args: &[String]) -> Result<(), String> {
    let out = args
        .first()
        .filter(|a| !a.starts_with("--"))
        .ok_or_else(usage)?;
    let flag = |k: &str| {
        args.iter()
            .position(|a| a == k)
            .and_then(|i| args.get(i + 1))
    };
    let num = |k: &str, d: f64| -> Result<f64, String> {
        match flag(k) {
            Some(v) => v
                .parse::<f64>()
                .ok()
                .filter(|x| x.is_finite() && *x >= 0.0)
                .ok_or_else(usage),
            None => Ok(d),
        }
    };
    let spec = PackSpec {
        seed: num("--seed", 1.0)? as u64,
        n_logs: num("--logs", 4.0)? as usize,
        log_seconds: num("--log-seconds", 600.0)?.max(10.0),
        n_iq: num("--iq", 4.0)? as usize,
        iq_seconds: num("--iq-seconds", 2.0)?.max(0.1),
        iq_rate_hz: num("--iq-rate", 2.046e6)?.max(1.023e6),
    };
    let m = build(&spec, Path::new(out))?;
    println!(
        "{}",
        crate::t!(
            "data-pack-done",
            n = m.items.len(),
            out = out.clone(),
            classes = m
                .classes
                .iter()
                .map(|(k, v)| format!("{k} {v}"))
                .collect::<Vec<_>>()
                .join(", ")
        )
    );
    Ok(())
}
