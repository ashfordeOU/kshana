// SPDX-License-Identifier: AGPL-3.0-only
//! Feeder clients: package and sign a station's own observations for upload (`kshana feed`).
//!
//! A feeder is anyone who runs a receiver or a receive-only SDR and shares what it observes.
//! This module turns local `kshana.obs/1` files (from `kshana station`, `kshana obs convert`
//! or `kshana feed spectrum`) into a signed **feed bundle**, `kshana.feed/1`:
//!
//! * every payload is checked as `kshana.obs/1` before it is packed, and again on [`verify`];
//! * the default privacy mode, `public`, coarsens what the files say about the feeder before
//!   anything leaves the machine: the station id becomes a pseudonym derived from the
//!   feeder's key, the antenna position is generalised to a grid cell (0.1 degrees by default),
//!   the height and the operator are removed, and every per-epoch position fix, every moving-
//!   platform record and every free-text alarm note is removed, so no movement trace is
//!   published. A station whose fixes spread over more than [`MOVING_SPREAD_M`] is treated as
//!   moving and publishes no position at all. `exact` keeps everything and must be asked for;
//! * the bundle is signed with the feeder's Ed25519 key (the same key files as
//!   `kshana evidence keygen`), and [`verify`] checks the signature, every payload digest,
//!   every payload as `kshana.obs/1`, and that a bundle that says `public` really is coarsened.
//!
//! [`spectrum_snapshot`] reads a receive-only SDR capture (RTL-SDR `cu8`, HackRF `ci8`, or
//! `ci16_le`) into an observation file with one spectrum record: the Welch density estimate of
//! [`crate::spectrum::welch_psd`], averaged into equal bins. Nothing here transmits; the levels
//! are relative to the decoded samples, not calibrated power (MODELLED).
//!
//! [`leaderboard`] ranks verified bundles by feeder, counting each payload once however often
//! it is submitted. `docs/FEEDER.md` describes the format, the commands and the Android spec.

use crate::obs::{self, Header, Record, SpectrumRecord, Station};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};
use std::collections::{BTreeMap, BTreeSet};
use std::path::{Path, PathBuf};

/// The schema id of a feed bundle.
pub const FEED_SCHEMA: &str = "kshana.feed/1";
/// The schema id of a leaderboard.
pub const LEADERBOARD_SCHEMA: &str = "kshana.feed-leaderboard/1";
/// The default location grid of the `public` mode, degrees (about 11 km in latitude).
pub const DEFAULT_GRID_DEG: f64 = 0.1;
/// Fixes spread over more than this (metres, from the first fix) mark a moving station.
pub const MOVING_SPREAD_M: f64 = 2000.0;
/// The domain-separation prefix of the signed bytes.
const SIGN_PREFIX: &[u8] = b"kshana.feed/1\n";

/// How much the bundle says about the feeder.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Privacy {
    /// Pseudonymous id, generalised position, no fixes, no movement records, no notes.
    Public,
    /// The files as they are (the feeder's explicit choice).
    Exact,
}

impl Privacy {
    /// Parse `public` or `exact`.
    pub fn parse(s: &str) -> Result<Self, String> {
        match s {
            "public" => Ok(Privacy::Public),
            "exact" => Ok(Privacy::Exact),
            _ => Err(crate::terr!("e-feed-bad-privacy", value = s.to_string())),
        }
    }
}

/// What the privacy step did.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct PrivacyReport {
    /// The mode.
    pub mode: Privacy,
    /// The location grid, degrees (`public` only).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub grid_deg: Option<f64>,
    /// Whether the station was found to move (its position is then withheld).
    pub moving: bool,
    /// The fields that were present and were removed or replaced.
    pub removed: Vec<String>,
}

/// One packed observation file.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct FileEntry {
    /// The payload's name in the bundle.
    pub name: String,
    /// SHA-256 of `content`, hex.
    pub sha256: String,
    /// Epoch records.
    pub epochs: usize,
    /// Alarm records.
    pub alarms: usize,
    /// Correction records.
    pub corrections: usize,
    /// Spectrum records.
    pub spectra: usize,
    /// Seconds from the first to the last timed record.
    pub span_s: f64,
    /// The file's absolute start as its header states it, when known.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub start_label: Option<String>,
    /// The `kshana.obs/1` file itself (JSON Lines).
    pub content: String,
}

/// A signed feed bundle.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Bundle {
    /// Always [`FEED_SCHEMA`].
    pub schema: String,
    /// The engine version that packed it.
    pub engine: String,
    /// When it was packed (ISO 8601 UTC), as the packing computer states it.
    pub created: String,
    /// The feeder's Ed25519 public key, hex.
    pub signer: String,
    /// The station id every payload carries.
    pub station: String,
    /// What the privacy step did.
    pub privacy: PrivacyReport,
    /// The payloads.
    pub files: Vec<FileEntry>,
    /// Ed25519 signature, hex, over [`signing_bytes`] of the bundle.
    #[serde(default)]
    pub signature: String,
}

/// The bytes the signature covers: the prefix `kshana.feed/1\n`, then the bundle's JSON with an
/// empty signature.
pub fn signing_bytes(b: &Bundle) -> Vec<u8> {
    let mut unsigned = b.clone();
    unsigned.signature = String::new();
    let mut out = SIGN_PREFIX.to_vec();
    out.extend(serde_json::to_vec(&unsigned).unwrap_or_default());
    out
}

fn sha256_hex(b: &[u8]) -> String {
    hex::encode(Sha256::digest(b))
}

/// The pseudonymous station id of a feeder: `feeder-` and the first 12 hex digits of the
/// SHA-256 of its public key.
pub fn pseudonym(public_key_hex: &str) -> String {
    let bytes = hex::decode(public_key_hex).unwrap_or_default();
    format!("feeder-{}", &sha256_hex(&bytes)[..12])
}

fn round6(v: f64) -> f64 {
    (v * 1e6).round() / 1e6
}

/// `v` moved to the centre-free grid of `grid` degrees (the nearest multiple).
pub fn to_grid(v: f64, grid: f64) -> f64 {
    round6((v / grid).round() * grid)
}

fn on_grid(v: f64, grid: f64) -> bool {
    (to_grid(v, grid) - v).abs() < 1e-6
}

fn haversine_m(a: (f64, f64), b: (f64, f64)) -> f64 {
    let r = 6_371_000.0;
    let (p1, p2) = (a.0.to_radians(), b.0.to_radians());
    let dp = p2 - p1;
    let dl = (b.1 - a.1).to_radians();
    let h = (dp / 2.0).sin().powi(2) + p1.cos() * p2.cos() * (dl / 2.0).sin().powi(2);
    2.0 * r * h.sqrt().min(1.0).asin()
}

/// The largest distance (metres) of any fix from the first fix, across all files.
pub fn fix_spread_m(files: &[Vec<Record>]) -> f64 {
    let mut first = None;
    let mut max = 0.0f64;
    for r in files.iter().flatten() {
        if let Record::Epoch(e) = r {
            if let Some(f) = &e.epoch.fix {
                if !(f.lat_deg.is_finite() && f.lon_deg.is_finite()) {
                    continue;
                }
                let p = (f.lat_deg, f.lon_deg);
                match first {
                    None => first = Some(p),
                    Some(q) => max = max.max(haversine_m(q, p)),
                }
            }
        }
    }
    max
}

/// Apply the privacy mode to every file of one station. `pseudo` is the station id to publish
/// under (`public`). Returns the files and what was removed.
pub fn coarsen(
    files: Vec<Vec<Record>>,
    mode: Privacy,
    grid_deg: f64,
    pseudo: &str,
) -> (Vec<Vec<Record>>, PrivacyReport) {
    if mode == Privacy::Exact {
        return (
            files,
            PrivacyReport {
                mode,
                grid_deg: None,
                moving: false,
                removed: Vec::new(),
            },
        );
    }
    let moving = fix_spread_m(&files) > MOVING_SPREAD_M;
    let mut removed = BTreeSet::new();
    let mut note = |s: &str| {
        removed.insert(s.to_string());
    };
    let out = files
        .into_iter()
        .map(|recs| {
            recs.into_iter()
                .map(|r| match r {
                    Record::Header(mut h) => {
                        coarsen_station(&mut h.station, moving, grid_deg, pseudo, &mut note);
                        let before = h.observables.len();
                        h.observables.retain(|o| o != "fix" && o != "marine");
                        if h.observables.len() != before {
                            note("header.observables");
                        }
                        Record::Header(h)
                    }
                    Record::Epoch(mut e) => {
                        e.station = pseudo.to_string();
                        if e.epoch.fix.take().is_some() {
                            note("epoch.fix");
                        }
                        if e.epoch.marine.take().is_some() {
                            note("epoch.marine");
                        }
                        if e.epoch.source_span.take().is_some() {
                            note("epoch.source_span");
                        }
                        if e.iq_ref.take().is_some() {
                            note("epoch.iq_ref");
                        }
                        Record::Epoch(e)
                    }
                    Record::Alarm(mut a) => {
                        a.station = pseudo.to_string();
                        if a.note.take().is_some() {
                            note("alarm.note");
                        }
                        Record::Alarm(a)
                    }
                    Record::Correction(mut c) => {
                        c.station = pseudo.to_string();
                        Record::Correction(c)
                    }
                    Record::Spectrum(mut p) => {
                        p.station = pseudo.to_string();
                        Record::Spectrum(p)
                    }
                })
                .collect()
        })
        .collect();
    (
        out,
        PrivacyReport {
            mode,
            grid_deg: Some(grid_deg),
            moving,
            removed: removed.into_iter().collect(),
        },
    )
}

fn coarsen_station(
    s: &mut Station,
    moving: bool,
    grid: f64,
    pseudo: &str,
    note: &mut impl FnMut(&str),
) {
    if s.id != pseudo {
        note("station.id");
        s.id = pseudo.to_string();
    }
    if s.height_m.take().is_some() {
        note("station.height_m");
    }
    if s.operator.take().is_some() {
        note("station.operator");
    }
    if moving {
        if s.lat_deg.take().is_some() | s.lon_deg.take().is_some() {
            note("station.position");
        }
    } else {
        if let Some(v) = s.lat_deg {
            s.lat_deg = Some(to_grid(v, grid));
        }
        if let Some(v) = s.lon_deg {
            s.lon_deg = Some(to_grid(v, grid));
        }
    }
}

fn entry(name: String, recs: &[Record]) -> Result<FileEntry, String> {
    let content = obs::to_jsonl(recs)?;
    let (_, rep) = obs::check(&content)?;
    let mut first = None;
    let mut last = None;
    let mut start_label = None;
    for r in recs {
        let t = match r {
            Record::Header(h) => {
                start_label = h.start_label.clone();
                None
            }
            Record::Epoch(e) => Some(e.epoch.t_s),
            Record::Alarm(a) => Some(a.t_s),
            Record::Correction(c) => Some(c.t_s),
            Record::Spectrum(p) => Some(p.t_s),
        };
        if let Some(t) = t {
            first = Some(first.map_or(t, |f: f64| f.min(t)));
            last = Some(last.map_or(t, |l: f64| l.max(t)));
        }
    }
    Ok(FileEntry {
        name,
        sha256: sha256_hex(content.as_bytes()),
        epochs: rep.epochs,
        alarms: rep.alarms,
        corrections: rep.corrections,
        spectra: rep.spectra,
        span_s: round6(last.unwrap_or(0.0) - first.unwrap_or(0.0)),
        start_label,
        content,
    })
}

/// Pack observation files (name, text) of one station into a signed bundle.
pub fn pack(
    inputs: &[(String, String)],
    seed: &[u8; 32],
    mode: Privacy,
    grid_deg: f64,
    created: &str,
) -> Result<Bundle, String> {
    if inputs.is_empty() {
        return Err(crate::terr!("e-feed-no-files"));
    }
    if !(grid_deg.is_finite() && (0.01..=10.0).contains(&grid_deg)) {
        return Err(crate::terr!(
            "e-feed-bad-grid",
            value = grid_deg.to_string()
        ));
    }
    let mut files = Vec::new();
    let mut station: Option<String> = None;
    for (name, text) in inputs {
        let (recs, rep) = obs::check(text)
            .map_err(|e| crate::terr!("e-feed-not-obs", path = name.clone(), e = e))?;
        match &station {
            None => station = Some(rep.station.clone()),
            Some(s) if *s != rep.station => {
                return Err(crate::terr!(
                    "e-feed-mixed-stations",
                    a = s.clone(),
                    b = rep.station.clone()
                ))
            }
            _ => {}
        }
        files.push(recs);
    }
    let signer = crate::evidence::bundle::public_key_hex(seed);
    let pseudo = pseudonym(&signer);
    let (files, privacy) = coarsen(files, mode, grid_deg, &pseudo);
    let published = match mode {
        Privacy::Public => pseudo,
        Privacy::Exact => station.unwrap_or_default(),
    };
    let entries = files
        .iter()
        .zip(inputs)
        .enumerate()
        .map(|(i, (recs, (name, _)))| {
            let n = match mode {
                Privacy::Public => format!("part-{:03}.obs.jsonl", i + 1),
                Privacy::Exact => Path::new(name)
                    .file_name()
                    .map(|f| f.to_string_lossy().to_string())
                    .unwrap_or_else(|| name.clone()),
            };
            entry(n, recs)
        })
        .collect::<Result<Vec<_>, _>>()?;
    let mut b = Bundle {
        schema: FEED_SCHEMA.to_string(),
        engine: env!("CARGO_PKG_VERSION").to_string(),
        created: created.to_string(),
        signer,
        station: published,
        privacy,
        files: entries,
        signature: String::new(),
    };
    let sig = crate::evidence::bundle::sign_detached(seed, &signing_bytes(&b));
    b.signature = hex::encode(sig);
    Ok(b)
}

/// What [`verify`] found in a valid bundle.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct VerifyReport {
    /// The signer's public key, hex.
    pub signer: String,
    /// The station id.
    pub station: String,
    /// The privacy mode.
    pub privacy: Privacy,
    /// Payloads.
    pub files: usize,
    /// Epoch records over all payloads.
    pub epochs: usize,
    /// Spectrum records over all payloads.
    pub spectra: usize,
}

fn decode_hex<const N: usize>(s: &str) -> Option<[u8; N]> {
    <[u8; N]>::try_from(hex::decode(s).ok()?.as_slice()).ok()
}

/// Verify a bundle's text: the schema, the signature (against `expected` when given), every
/// payload's digest, every payload as `kshana.obs/1` of the bundle's station with the counts
/// the bundle states, and, for a `public` bundle, that every payload is coarsened.
pub fn verify(text: &str, expected: Option<&str>) -> Result<(Bundle, VerifyReport), String> {
    let b: Bundle = serde_json::from_str(text)
        .map_err(|e| crate::terr!("e-feed-not-bundle", e = e.to_string()))?;
    if b.schema != FEED_SCHEMA {
        return Err(crate::terr!("e-feed-not-bundle", e = b.schema.clone()));
    }
    if let Some(want) = expected {
        if !want.eq_ignore_ascii_case(&b.signer) {
            return Err(crate::terr!(
                "e-feed-key-mismatch",
                found = b.signer.clone(),
                expected = want.to_string()
            ));
        }
    }
    let (Some(pk), Some(sig)) = (decode_hex::<32>(&b.signer), decode_hex::<64>(&b.signature))
    else {
        return Err(crate::terr!("e-feed-bad-signature"));
    };
    if !crate::evidence::verify::verify_detached(&pk, &signing_bytes(&b), &sig)? {
        return Err(crate::terr!("e-feed-bad-signature"));
    }
    if b.files.is_empty() {
        return Err(crate::terr!("e-feed-no-files"));
    }
    let (mut epochs, mut spectra) = (0, 0);
    for f in &b.files {
        if sha256_hex(f.content.as_bytes()) != f.sha256 {
            return Err(crate::terr!("e-feed-hash-mismatch", name = f.name.clone()));
        }
        let (recs, rep) = obs::check(&f.content)
            .map_err(|e| crate::terr!("e-feed-not-obs", path = f.name.clone(), e = e))?;
        let counts_ok = rep.epochs == f.epochs
            && rep.alarms == f.alarms
            && rep.corrections == f.corrections
            && rep.spectra == f.spectra;
        if rep.station != b.station || !counts_ok {
            return Err(crate::terr!(
                "e-feed-payload-mismatch",
                name = f.name.clone()
            ));
        }
        if b.privacy.mode == Privacy::Public {
            check_public(&recs, &b).map_err(|what| {
                crate::terr!("e-feed-not-coarsened", name = f.name.clone(), what = what)
            })?;
        }
        epochs += rep.epochs;
        spectra += rep.spectra;
    }
    let report = VerifyReport {
        signer: b.signer.clone(),
        station: b.station.clone(),
        privacy: b.privacy.mode,
        files: b.files.len(),
        epochs,
        spectra,
    };
    Ok((b, report))
}

/// The first field of a `public` payload that is not coarsened, by name.
fn check_public(recs: &[Record], b: &Bundle) -> Result<(), String> {
    if b.station != pseudonym(&b.signer) {
        return Err("station.id".into());
    }
    let grid = b.privacy.grid_deg.unwrap_or(DEFAULT_GRID_DEG);
    for r in recs {
        match r {
            Record::Header(h) => {
                let s = &h.station;
                if s.height_m.is_some() {
                    return Err("station.height_m".into());
                }
                if s.operator.is_some() {
                    return Err("station.operator".into());
                }
                for v in [s.lat_deg, s.lon_deg].into_iter().flatten() {
                    if b.privacy.moving || !on_grid(v, grid) {
                        return Err("station.position".into());
                    }
                }
            }
            Record::Epoch(e) => {
                if e.epoch.fix.is_some() {
                    return Err("epoch.fix".into());
                }
                if e.epoch.marine.is_some() {
                    return Err("epoch.marine".into());
                }
                if e.iq_ref.is_some() {
                    return Err("epoch.iq_ref".into());
                }
            }
            Record::Alarm(a) if a.note.is_some() => return Err("alarm.note".into()),
            _ => {}
        }
    }
    Ok(())
}

/// Read a receive-only SDR capture into an observation file with one spectrum record.
#[derive(Clone, Debug)]
pub struct SpectrumParams {
    /// `cu8` (RTL-SDR), `ci8` (HackRF) or `ci16_le`.
    pub format: String,
    /// Sample rate, hertz.
    pub sample_rate_hz: f64,
    /// Centre frequency, hertz.
    pub centre_hz: f64,
    /// Transform length (a power of two).
    pub nfft: usize,
    /// Output bins (a power of two, at most `nfft`).
    pub bins: usize,
    /// At most this many samples are read from the start of the capture.
    pub max_samples: usize,
    /// The front end's name.
    pub front_end: String,
    /// The capture's absolute time, when the operator states it.
    pub time_label: Option<String>,
}

impl Default for SpectrumParams {
    fn default() -> Self {
        SpectrumParams {
            format: "cu8".into(),
            sample_rate_hz: 2.048e6,
            centre_hz: 1_575.42e6,
            nfft: 1024,
            bins: 256,
            max_samples: 1 << 21,
            front_end: "rtl-sdr".into(),
            time_label: None,
        }
    }
}

/// The spectrum snapshot of `bytes` as an observation file for `station`.
pub fn spectrum_snapshot(
    bytes: &[u8],
    p: &SpectrumParams,
    station: &Station,
) -> Result<Vec<Record>, String> {
    use crate::iq::io::format::{decode_samples, SampleFormat};
    let scale = match p.format.as_str() {
        "cu8" => 1.0 / 255.0,
        "ci8" => 1.0 / 128.0,
        "ci16_le" => 1.0 / 32768.0,
        other => return Err(crate::terr!("e-feed-bad-format", value = other.to_string())),
    };
    let fmt = SampleFormat::parse(&p.format).map_err(|e| e.to_string())?;
    for (opt, v) in [("--rate", p.sample_rate_hz), ("--centre", p.centre_hz)] {
        if !(v.is_finite() && v > 0.0) {
            return Err(crate::terr!(
                "e-feed-bad-number",
                option = opt,
                value = v.to_string()
            ));
        }
    }
    if p.bins == 0 || !p.bins.is_power_of_two() || p.bins > p.nfft {
        return Err(crate::terr!(
            "e-feed-bad-number",
            option = "--bins",
            value = p.bins.to_string()
        ));
    }
    let unit = 2 * fmt.encoding.unit_bytes().max(1);
    let take = bytes.len().min(p.max_samples.saturating_mul(unit));
    let x = decode_samples(fmt, &bytes[..take], scale);
    if x.len() < p.nfft {
        return Err(crate::terr!(
            "e-feed-short-capture",
            n = x.len(),
            nfft = p.nfft
        ));
    }
    let w = crate::spectrum::welch_psd(&x, p.sample_rate_hz, p.nfft, 0.5)?;
    let group = p.nfft / p.bins;
    let psd: Vec<f64> = w
        .psd
        .chunks(group)
        .map(|c| {
            let mean = c.iter().sum::<f64>() / c.len() as f64;
            (10.0 * mean.max(1e-30).log10() * 100.0).round() / 100.0
        })
        .collect();
    let header = Header {
        schema: obs::SCHEMA.to_string(),
        station: station.clone(),
        source_format: Some(format!("sdr-{}", p.format)),
        start_label: p.time_label.clone(),
        observables: vec!["spectrum".to_string()],
        skipped_records: 0,
    };
    let rec = SpectrumRecord {
        station: station.id.clone(),
        t_s: 0.0,
        time_label: p.time_label.clone(),
        front_end: p.front_end.clone(),
        centre_hz: p.centre_hz,
        sample_rate_hz: p.sample_rate_hz,
        samples: x.len() as u64,
        nfft: p.nfft,
        segments: w.segments,
        bin_hz: p.sample_rate_hz / p.bins as f64,
        psd_dbfs_hz: psd,
        capture_sha256: sha256_hex(bytes),
    };
    Ok(vec![
        Record::Header(header),
        Record::Spectrum(Box::new(rec)),
    ])
}

/// One feeder's line on the leaderboard.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct LeaderRow {
    /// Rank, from 1.
    pub rank: usize,
    /// The feeder's pseudonym (from its key).
    pub feeder: String,
    /// The signer's public key, hex.
    pub signer: String,
    /// Bundles accepted.
    pub bundles: usize,
    /// Distinct payloads.
    pub files: usize,
    /// Epoch records over distinct payloads.
    pub epochs: usize,
    /// Spectrum records over distinct payloads.
    pub spectra: usize,
    /// Hours covered (sum of the payload spans).
    pub hours: f64,
}

/// A bundle left off the leaderboard.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Rejected {
    /// The bundle's name as given.
    pub name: String,
    /// Why.
    pub reason: String,
}

/// The leaderboard of a set of bundles.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Leaderboard {
    /// Always [`LEADERBOARD_SCHEMA`].
    pub schema: String,
    /// Ranked by epochs, then hours, then spectra, then key.
    pub rows: Vec<LeaderRow>,
    /// Bundles that did not verify.
    pub rejected: Vec<Rejected>,
    /// Payloads submitted again (counted once).
    pub duplicates: usize,
}

/// Rank bundles (name, text). Only bundles that verify count; a payload counts once.
pub fn leaderboard(inputs: &[(String, String)]) -> Leaderboard {
    let mut seen = BTreeSet::new();
    let mut by: BTreeMap<String, LeaderRow> = BTreeMap::new();
    let mut rejected = Vec::new();
    let mut duplicates = 0;
    for (name, text) in inputs {
        let b = match verify(text, None) {
            Ok((b, _)) => b,
            Err(reason) => {
                rejected.push(Rejected {
                    name: name.clone(),
                    reason,
                });
                continue;
            }
        };
        let row = by.entry(b.signer.clone()).or_insert_with(|| LeaderRow {
            rank: 0,
            feeder: pseudonym(&b.signer),
            signer: b.signer.clone(),
            bundles: 0,
            files: 0,
            epochs: 0,
            spectra: 0,
            hours: 0.0,
        });
        row.bundles += 1;
        for f in &b.files {
            if !seen.insert(f.sha256.clone()) {
                duplicates += 1;
                continue;
            }
            row.files += 1;
            row.epochs += f.epochs;
            row.spectra += f.spectra;
            row.hours += f.span_s / 3600.0;
        }
    }
    let mut rows: Vec<LeaderRow> = by.into_values().collect();
    for r in &mut rows {
        r.hours = (r.hours * 1000.0).round() / 1000.0;
    }
    rows.sort_by(|a, b| {
        b.epochs
            .cmp(&a.epochs)
            .then(b.hours.total_cmp(&a.hours))
            .then(b.spectra.cmp(&a.spectra))
            .then(a.signer.cmp(&b.signer))
    });
    for (i, r) in rows.iter_mut().enumerate() {
        r.rank = i + 1;
    }
    Leaderboard {
        schema: LEADERBOARD_SCHEMA.to_string(),
        rows,
        rejected,
        duplicates,
    }
}

/// The observation files a path names: the file itself, or the `.obs.jsonl` files of a
/// directory and of its subdirectories one level down (a Station's output). Unless
/// `include_open`, the newest file of each directory is left out: a Station is still writing it.
pub fn collect_inputs(path: &Path, include_open: bool) -> Result<Vec<PathBuf>, String> {
    if !path.is_dir() {
        return Ok(vec![path.to_path_buf()]);
    }
    let mut dirs = vec![path.to_path_buf()];
    let rd = |d: &Path| {
        std::fs::read_dir(d).map_err(|e| {
            crate::terr!(
                "e-feed-cannot-read",
                path = d.display().to_string(),
                e = e.to_string()
            )
        })
    };
    for e in rd(path)?.flatten() {
        if e.path().is_dir() {
            dirs.push(e.path());
        }
    }
    dirs.sort();
    let mut out = Vec::new();
    for d in dirs {
        let mut files: Vec<PathBuf> = rd(&d)?
            .flatten()
            .map(|e| e.path())
            .filter(|p| p.is_file() && p.to_string_lossy().ends_with(".obs.jsonl"))
            .collect();
        files.sort();
        if !include_open {
            files.pop();
        }
        out.extend(files);
    }
    Ok(out)
}

fn read_text(path: &str) -> Result<String, String> {
    std::fs::read_to_string(path)
        .map_err(|e| crate::terr!("e-feed-cannot-read", path = path, e = e.to_string()))
}

fn write_or_print(out: Option<&String>, text: &str) -> Result<(), String> {
    match out {
        Some(p) => std::fs::write(p, text)
            .map_err(|e| crate::terr!("e-feed-cannot-write", path = p.clone(), e = e.to_string())),
        None => {
            print!("{text}");
            Ok(())
        }
    }
}

struct Args {
    pos: Vec<String>,
    opts: BTreeMap<String, String>,
    flags: BTreeSet<String>,
}

fn parse_args(args: &[String], valued: &[&str], switches: &[&str]) -> Result<Args, String> {
    let mut a = Args {
        pos: Vec::new(),
        opts: BTreeMap::new(),
        flags: BTreeSet::new(),
    };
    let mut it = args.iter();
    while let Some(s) = it.next() {
        if valued.contains(&s.as_str()) {
            let v = it
                .next()
                .ok_or_else(|| crate::terr!("e-feed-missing-value", option = s.clone()))?;
            a.opts.insert(s.clone(), v.clone());
        } else if switches.contains(&s.as_str()) {
            a.flags.insert(s.clone());
        } else if s.starts_with("--") {
            return Err(crate::terr!("e-feed-unknown-option", option = s.clone()));
        } else {
            a.pos.push(s.clone());
        }
    }
    Ok(a)
}

fn num<T: std::str::FromStr>(a: &Args, opt: &str, default: T) -> Result<T, String> {
    match a.opts.get(opt) {
        None => Ok(default),
        Some(v) => v.parse().map_err(|_| {
            crate::terr!(
                "e-feed-bad-number",
                option = opt.to_string(),
                value = v.clone()
            )
        }),
    }
}

/// `kshana feed <pack|verify|send|spectrum|leaderboard> ...`.
pub fn run(args: &[String]) -> Result<(), String> {
    let usage = || crate::t!("feed-usage");
    let Some((cmd, rest)) = args.split_first() else {
        return Err(usage());
    };
    match cmd.as_str() {
        "pack" => {
            let a = parse_args(
                rest,
                &["--key", "--privacy", "--grid-deg", "--created", "--out"],
                &["--include-open"],
            )?;
            let key = a.opts.get("--key").ok_or_else(usage)?;
            if a.pos.is_empty() {
                return Err(usage());
            }
            let mode = Privacy::parse(a.opts.get("--privacy").map_or("public", String::as_str))?;
            let grid = num(&a, "--grid-deg", DEFAULT_GRID_DEG)?;
            let mut inputs = Vec::new();
            for p in &a.pos {
                for f in collect_inputs(Path::new(p), a.flags.contains("--include-open"))? {
                    let name = f.display().to_string();
                    let text = read_text(&name)?;
                    inputs.push((name, text));
                }
            }
            let seed = crate::evidence::cli::read_seed(key)?;
            let created = a
                .opts
                .get("--created")
                .cloned()
                .unwrap_or_else(crate::iq::io::record::now_iso);
            let b = pack(&inputs, &seed, mode, grid, &created)?;
            let text = serde_json::to_string(&b).map_err(|e| e.to_string())? + "\n";
            write_or_print(a.opts.get("--out"), &text)?;
            if let Some(out) = a.opts.get("--out") {
                let epochs: usize = b.files.iter().map(|f| f.epochs).sum();
                eprintln!(
                    "{}",
                    crate::t!(
                        "feed-packed",
                        out = out.clone(),
                        station = b.station.clone(),
                        files = b.files.len(),
                        epochs = epochs,
                        mode = if mode == Privacy::Public {
                            "public"
                        } else {
                            "exact"
                        }
                    )
                );
            }
            Ok(())
        }
        "verify" => {
            let a = parse_args(rest, &["--pubkey"], &["--json"])?;
            let [path] = a.pos.as_slice() else {
                return Err(usage());
            };
            let (_, rep) = verify(
                &read_text(path)?,
                a.opts.get("--pubkey").map(String::as_str),
            )
            .map_err(|e| format!("{path}: {e}"))?;
            if a.flags.contains("--json") {
                println!(
                    "{}",
                    serde_json::to_string_pretty(&rep).map_err(|e| e.to_string())?
                );
            } else {
                println!(
                    "{}",
                    crate::t!(
                        "feed-verified",
                        path = path.clone(),
                        key = rep.signer.clone(),
                        station = rep.station.clone(),
                        files = rep.files,
                        epochs = rep.epochs
                    )
                );
            }
            Ok(())
        }
        "send" => {
            let a = parse_args(rest, &["--url", "--token-file"], &[])?;
            let ([path], Some(url)) = (a.pos.as_slice(), a.opts.get("--url")) else {
                return Err(usage());
            };
            let text = read_text(path)?;
            verify(&text, None).map_err(|e| format!("{path}: {e}"))?;
            let token = match a.opts.get("--token-file") {
                Some(p) => Some(read_text(p)?.trim().to_string()),
                None => None,
            };
            let code = crate::station::post(url, token.as_deref(), &text)
                .map_err(|e| crate::terr!("e-feed-send-failed", url = url.clone(), e = e))?;
            if !(200..300).contains(&code) {
                return Err(crate::terr!(
                    "e-feed-send-refused",
                    url = url.clone(),
                    code = code.to_string()
                ));
            }
            println!(
                "{}",
                crate::t!("feed-sent", url = url.clone(), code = code.to_string())
            );
            Ok(())
        }
        "spectrum" => {
            let a = parse_args(
                rest,
                &[
                    "--format",
                    "--rate",
                    "--centre",
                    "--station",
                    "--front-end",
                    "--nfft",
                    "--bins",
                    "--max-samples",
                    "--time",
                    "--out",
                ],
                &[],
            )?;
            let ([capture], Some(station_path)) = (a.pos.as_slice(), a.opts.get("--station"))
            else {
                return Err(usage());
            };
            let d = SpectrumParams::default();
            let format = a.opts.get("--format").cloned().unwrap_or(d.format);
            let front_end = a.opts.get("--front-end").cloned().unwrap_or_else(|| {
                match format.as_str() {
                    "cu8" => "rtl-sdr",
                    "ci8" => "hackrf",
                    _ => "sdr",
                }
                .to_string()
            });
            let (Some(_), Some(_)) = (a.opts.get("--rate"), a.opts.get("--centre")) else {
                return Err(usage());
            };
            let p = SpectrumParams {
                format,
                sample_rate_hz: num(&a, "--rate", d.sample_rate_hz)?,
                centre_hz: num(&a, "--centre", d.centre_hz)?,
                nfft: num(&a, "--nfft", d.nfft)?,
                bins: num(&a, "--bins", d.bins)?,
                max_samples: num(&a, "--max-samples", d.max_samples)?,
                front_end,
                time_label: a.opts.get("--time").cloned(),
            };
            let station: Station = toml::from_str(&read_text(station_path)?).map_err(|e| {
                crate::terr!(
                    "e-feed-not-obs",
                    path = station_path.clone(),
                    e = e.to_string()
                )
            })?;
            let bytes = std::fs::read(capture).map_err(|e| {
                crate::terr!(
                    "e-feed-cannot-read",
                    path = capture.clone(),
                    e = e.to_string()
                )
            })?;
            let recs = spectrum_snapshot(&bytes, &p, &station)?;
            write_or_print(a.opts.get("--out"), &obs::to_jsonl(&recs)?)?;
            if let Some(out) = a.opts.get("--out") {
                eprintln!(
                    "{}",
                    crate::t!("feed-spectrum-written", out = out.clone(), bins = p.bins)
                );
            }
            Ok(())
        }
        "leaderboard" => {
            let a = parse_args(rest, &[], &["--json"])?;
            if a.pos.is_empty() {
                return Err(usage());
            }
            let mut inputs = Vec::new();
            for p in &a.pos {
                inputs.push((p.clone(), read_text(p)?));
            }
            let lb = leaderboard(&inputs);
            if a.flags.contains("--json") {
                println!(
                    "{}",
                    serde_json::to_string_pretty(&lb).map_err(|e| e.to_string())?
                );
            } else {
                println!("rank\tfeeder\tbundles\tfiles\tepochs\thours\tspectra");
                for r in &lb.rows {
                    println!(
                        "{}\t{}\t{}\t{}\t{}\t{}\t{}",
                        r.rank, r.feeder, r.bundles, r.files, r.epochs, r.hours, r.spectra
                    );
                }
                for r in &lb.rejected {
                    eprintln!("{}: {}", r.name, r.reason);
                }
            }
            Ok(())
        }
        _ => Err(usage()),
    }
}
