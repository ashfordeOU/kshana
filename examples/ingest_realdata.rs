// SPDX-License-Identifier: AGPL-3.0-only
//! Ingest real public GNSS-impairment datasets into optimism-gap probe records.
//!
//! This is the front of the Phase-A/Phase-B pipeline: it reads a JSON *manifest* that
//! maps each dataset file to its experiment label (clean run, or an attack `class` at a
//! severity `shift_bin`), parses each file with the matching [`kshana::realdata`]
//! adapter, stamps the label, and writes the flat `ProbeRecord` array that
//! `real_data_probe` then analyses. Nothing here computes physics — the adapters reuse
//! the same validated engines as the synthetic study.
//!
//! ```text
//! cargo run --release --example ingest_realdata -- manifest.json paper-artifacts/real-records.json
//! cargo run --release --example real_data_probe  -- paper-artifacts/real-records.json id paper-artifacts/real-probe.json
//! ```
//!
//! ## Manifest schema
//!
//! ```json
//! {
//!   "sigma_m": 5.0,            // RAIM pseudorange 1-sigma (m); default 5.0
//!   "p_fa": 1e-5,              // RAIM false-alarm prob; default 1e-5
//!   "agc_orient": "negate",   // AGC polarity: "negate" (default) or "raw"
//!   "entries": [
//!     {"format":"rinex",      "path":"clean.obs",  "class":"nominal",  "shift_bin":"id",    "is_nominal":true},
//!     {"format":"ubx",        "path":"jam20.ubx",  "class":"jamming",  "shift_bin":"jsr20", "is_nominal":false},
//!     {"format":"gnsslogger", "path":"phone.csv",  "class":"jamming",  "shift_bin":"jsr30", "is_nominal":false},
//!     {"format":"sqm",        "path":"corr.csv",   "class":"spoofing", "shift_bin":"subtle","is_nominal":false},
//!     {"format":"raim",       "path":"jam.obs", "nav":"jam.nav", "apriori":[x,y,z],
//!                             "class":"jamming",  "shift_bin":"jsr20", "is_nominal":false}
//!   ]
//! }
//! ```
//!
//! Relative `path`/`nav` are resolved against the manifest's own directory. The
//! `format` selects the adapter: `rinex` (C/N0), `ubx` (AGC/jamind/C/N0),
//! `gnsslogger` (C/N0/AGC), `sqm` (correlator imbalance), `raim` (obs+nav parity).

use kshana::impairment_study::ProbeRecord;
use kshana::realdata::{
    gnsslogger, raim, rinex, sqm, to_records, ubx, FileLabel, Observation, Orient,
};
use serde::Deserialize;
use std::collections::BTreeMap;
use std::path::{Path, PathBuf};

#[derive(Deserialize)]
struct Manifest {
    #[serde(default = "default_sigma")]
    sigma_m: f64,
    #[serde(default = "default_pfa")]
    p_fa: f64,
    #[serde(default = "default_agc_orient")]
    agc_orient: String,
    entries: Vec<Entry>,
}

#[derive(Deserialize)]
struct Entry {
    format: String,
    path: String,
    #[serde(default)]
    nav: Option<String>,
    #[serde(default)]
    apriori: Option<[f64; 3]>,
    class: String,
    shift_bin: String,
    #[serde(default)]
    is_nominal: bool,
}

fn default_sigma() -> f64 {
    5.0
}
fn default_pfa() -> f64 {
    1e-5
}
fn default_agc_orient() -> String {
    "negate".to_string()
}

fn die(msg: String) -> ! {
    eprintln!("{msg}");
    std::process::exit(1);
}

/// Read one entry's observations using the adapter named by `format`.
fn observations_for(
    entry: &Entry,
    base: &Path,
    agc_orient: Orient,
    sigma_m: f64,
    p_fa: f64,
) -> Vec<Observation> {
    let path = base.join(&entry.path);
    match entry.format.as_str() {
        "rinex" => {
            let text = read_text(&path);
            rinex::cn0_observations(&text)
                .unwrap_or_else(|e| die(format!("{}: {e}", path.display())))
        }
        "ubx" => {
            let bytes = std::fs::read(&path)
                .unwrap_or_else(|e| die(format!("read {}: {e}", path.display())));
            ubx::observations(&bytes, agc_orient)
        }
        "gnsslogger" => gnsslogger::observations(&read_text(&path), agc_orient),
        "sqm" => sqm::observations(&read_text(&path)),
        "raim" => {
            let nav = entry
                .nav
                .as_ref()
                .unwrap_or_else(|| die(format!("{}: raim entry needs a \"nav\" file", entry.path)));
            let nav_text = read_text(&base.join(nav));
            raim::observations(&read_text(&path), &nav_text, entry.apriori, sigma_m, p_fa)
                .unwrap_or_else(|e| die(format!("{}: {e}", path.display())))
        }
        other => die(format!("{}: unknown format {other:?}", entry.path)),
    }
}

fn read_text(path: &Path) -> String {
    std::fs::read_to_string(path).unwrap_or_else(|e| die(format!("read {}: {e}", path.display())))
}

fn main() {
    let mut args = std::env::args().skip(1);
    let manifest_path = args
        .next()
        .unwrap_or_else(|| die("usage: ingest_realdata <manifest.json> [out.json]".to_string()));
    let out = args
        .next()
        .unwrap_or_else(|| "paper-artifacts/real-records.json".to_string());

    let manifest_text = read_text(Path::new(&manifest_path));
    let manifest: Manifest = serde_json::from_str(&manifest_text)
        .unwrap_or_else(|e| die(format!("parse manifest: {e}")));
    let base: PathBuf = Path::new(&manifest_path)
        .parent()
        .map(Path::to_path_buf)
        .unwrap_or_default();
    let agc_orient = match manifest.agc_orient.as_str() {
        "negate" => Orient::Negate,
        "raw" => Orient::Raw,
        other => die(format!(
            "agc_orient must be \"negate\" or \"raw\", got {other:?}"
        )),
    };

    let mut records: Vec<ProbeRecord> = Vec::new();
    let mut per_detector: BTreeMap<String, usize> = BTreeMap::new();
    let mut per_class: BTreeMap<String, usize> = BTreeMap::new();
    for entry in &manifest.entries {
        let obs = observations_for(entry, &base, agc_orient, manifest.sigma_m, manifest.p_fa);
        let label = FileLabel {
            class: &entry.class,
            shift_bin: &entry.shift_bin,
            is_nominal: entry.is_nominal,
        };
        for o in &obs {
            *per_detector.entry(o.detector.clone()).or_default() += 1;
        }
        let class_key = if entry.is_nominal {
            "nominal".to_string()
        } else {
            entry.class.clone()
        };
        *per_class.entry(class_key).or_default() += obs.len();
        eprintln!(
            "{:>11} {:<28} -> {:4} obs  [{}/{}{}]",
            entry.format,
            entry.path,
            obs.len(),
            if entry.is_nominal {
                "nominal"
            } else {
                &entry.class
            },
            entry.shift_bin,
            if entry.is_nominal {
                " *id-negatives*"
            } else {
                ""
            },
        );
        records.extend(to_records(&obs, &label));
    }

    if let Some(parent) = Path::new(&out).parent() {
        if !parent.as_os_str().is_empty() {
            std::fs::create_dir_all(parent).unwrap_or_else(|e| die(format!("mkdir: {e}")));
        }
    }
    std::fs::write(
        &out,
        serde_json::to_string_pretty(&records).expect("serialize records"),
    )
    .unwrap_or_else(|e| die(format!("write {out}: {e}")));

    eprintln!("\nby detector: {per_detector:?}");
    eprintln!("by class:    {per_class:?}");
    println!(
        "ingested {} files -> {} probe records ({} detectors) -> {}",
        manifest.entries.len(),
        records.len(),
        per_detector.len(),
        out,
    );
}
