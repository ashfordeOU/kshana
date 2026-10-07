// SPDX-License-Identifier: AGPL-3.0-only
//! The campaign runner: plan the cells, skip the ones already done, run the rest in
//! parallel, and write one content-addressed result per cell.
//!
//! A **cell** is one (recording, front-end chain, loop design). Its key is the SHA-256 of
//! the canonical JSON of everything that determines its result: the recording's SHA-256 and
//! id, the condition hash, the front-end chain's name and hash, the design's name and hash,
//! the run and scoring hashes, and the engine version. A cell's result is written to
//! `cells/<key>.json` atomically: a temporary file is renamed into place. A run that is
//! stopped part-way therefore loses only the cells that were in flight, and the next run
//! skips every cell whose file is present and carries its key.
//!
//! Pending cells that share a recording and a chain are run together. The recording is
//! read once, the chain is applied once, and every design in the group tracks every
//! expected satellite from one bank, as `iq sweep` does. When there are fewer groups than
//! workers, a group's designs are split across several work items so all cores are busy.
//! Channels in a bank never interact, so grouping changes nothing in any result.
//! `tests/iq_campaign.rs` checks this: one worker and many workers give byte-identical
//! cells.
//!
//! A cell holds no wall-clock time, host or worker. Those go to `runs.jsonl`, the one
//! output that is not deterministic.

use super::conditions::{resolve, TestConditions};
use super::hash::{canonical_hash, sha256_file, sha256_hex, CanonicalHash};
use super::lockstate::LockTracker;
use super::score::{SatScore, SatScorer, ScoringConfig};
use super::spec::{FrontendSpec, LoadedCampaign};
use super::truth::TruthDoppler;
use crate::iq::acq::{acquire, samples_needed, AcqConfig, AcqResult};
use crate::iq::cli::{apply_chain, build_chain, build_code};
use crate::iq::io::batch::{default_workers, run_batch_items};
use crate::iq::io::inventory::open_recording;
use crate::iq::signals::SignalCode;
use crate::iq::track::design::Design;
use crate::iq::track::{ChannelInit, EpochOutput, TrackingBank};
use crate::iq::{Cf64, SpreadingCode};
use serde::{Deserialize, Serialize};
use std::collections::BTreeMap;
use std::io::Write;
use std::path::{Path, PathBuf};
use std::sync::{Arc, Mutex};

/// The schema tag of a cell result.
pub const CELL_SCHEMA: &str = "kshana.campaign-cell/1";

/// The schema tag of the resolved campaign (`campaign.json`).
pub const PLAN_SCHEMA: &str = "kshana.campaign-plan/1";

/// How the lock state in a cell was derived.
pub const LOCK_SOURCE: &str = "lock-indicators";

/// Samples read per chunk.
const CHUNK: usize = 1 << 16;

/// The engine version stamped on every result.
pub fn engine_version() -> &'static str {
    env!("CARGO_PKG_VERSION")
}

/// How a satellite's channel was started.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Handoff {
    /// `"hint"` (stated in the test conditions), `"acquired"` or `"not-acquired"`.
    pub source: String,
    /// Starting Doppler (Hz).
    pub doppler_hz: Option<f64>,
    /// Code phase at the first sample (chips).
    pub code_phase_chips: Option<f64>,
    /// Acquisition statistic.
    pub statistic: Option<f64>,
    /// Acquisition threshold.
    pub threshold: Option<f64>,
}

/// One satellite of a cell.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct CellSat {
    /// How the channel was started.
    pub handoff: Handoff,
    /// The scores.
    #[serde(flatten)]
    pub score: SatScore,
}

/// A recording as stamped on a result.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct RecordingStamp {
    /// Recording id.
    pub id: String,
    /// SHA-256 of the sample data.
    pub sha256: String,
    /// Condition hash.
    pub conditions_hash: String,
}

/// A named, hashed input as stamped on a result.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct NamedHash {
    /// Name.
    pub name: String,
    /// Hash.
    pub hash: String,
}

/// The result of one cell (`kshana.campaign-cell/1`).
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct CellResult {
    /// [`CELL_SCHEMA`].
    pub schema: String,
    /// The cell key.
    pub key: String,
    /// Engine version.
    pub engine_version: String,
    /// The recording.
    pub recording: RecordingStamp,
    /// The front-end chain.
    pub frontend: NamedHash,
    /// The loop design.
    pub design: NamedHash,
    /// Run-settings hash.
    pub run_hash: String,
    /// Scoring-settings hash.
    pub scoring_hash: String,
    /// How lock was derived ([`LOCK_SOURCE`]).
    pub lock_source: String,
    /// Sample rate (Hz).
    pub sample_rate_hz: f64,
    /// Samples processed.
    pub samples_processed: u64,
    /// Per-satellite results, in test-condition order.
    pub satellites: Vec<CellSat>,
}

/// One planned cell.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct PlannedCell {
    /// The cell key.
    pub key: String,
    /// Index into the plan's recordings.
    pub recording: usize,
    /// Index into the plan's front-end chains.
    pub frontend: usize,
    /// Index into the plan's designs.
    pub design: usize,
}

/// A recording in the plan.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct PlannedRecording {
    /// Recording id.
    pub id: String,
    /// The test-condition file.
    pub conditions_file: String,
    /// The recording file.
    pub path: String,
    /// SHA-256 of its sample data.
    pub sha256: String,
    /// Condition hash.
    pub conditions_hash: String,
    /// The test conditions.
    pub conditions: TestConditions,
}

/// The resolved campaign (`campaign.json`).
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Plan {
    /// [`PLAN_SCHEMA`].
    pub schema: String,
    /// Campaign name.
    pub name: String,
    /// Engine version.
    pub engine_version: String,
    /// Recordings, by id.
    pub recordings: Vec<PlannedRecording>,
    /// Front-end chains with their hashes.
    pub frontends: Vec<(FrontendSpec, String)>,
    /// Designs, resolved (with name and hash).
    pub designs: Vec<serde_json::Value>,
    /// Run-settings hash.
    pub run_hash: String,
    /// Scoring settings (bars included).
    pub scoring: ScoringConfig,
    /// Scoring-settings hash.
    pub scoring_hash: String,
    /// Every cell, in order (recording, chain, design).
    pub cells: Vec<PlannedCell>,
}

/// How to run a campaign.
#[derive(Clone, Debug, Default)]
pub struct RunOptions {
    /// Worker threads (0 = the campaign's setting, or every core).
    pub workers: usize,
    /// Recompute cells that are already done.
    pub no_resume: bool,
    /// Run at most this many pending cells, then stop.
    pub max_cells: Option<usize>,
    /// Plan only: report what would run.
    pub dry_run: bool,
}

/// What a run did.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct RunSummary {
    /// Campaign name.
    pub name: String,
    /// Output directory.
    pub out_dir: String,
    /// Cells in the plan.
    pub cells_total: usize,
    /// Cells found already done.
    pub cells_skipped: usize,
    /// Cells run now.
    pub cells_run: usize,
    /// Cells that failed now, with their error.
    pub cells_failed: Vec<(String, String)>,
    /// Cells still pending after this run.
    pub cells_pending: usize,
    /// Samples processed now (summed over work items).
    pub samples_processed: u64,
    /// The report digest, once every cell is done.
    pub digest: Option<String>,
}

/// A recording's SHA-256: the hash of its data file, or for several data files the
/// SHA-256 of their hex digests joined in order. File hashes are cached in
/// `<out>/hashes.json` by (path, size, modification time).
fn recording_sha(
    files: &[(PathBuf, u64)],
    cache: &Mutex<BTreeMap<String, String>>,
) -> Result<String, String> {
    let mut digests = Vec::new();
    for (p, len) in files {
        let mtime = std::fs::metadata(p)
            .and_then(|m| m.modified())
            .ok()
            .and_then(|t| t.duration_since(std::time::UNIX_EPOCH).ok())
            .map(|d| d.as_nanos())
            .unwrap_or(0);
        let ck = format!("{}|{len}|{mtime}", p.display());
        let hit = cache.lock().ok().and_then(|c| c.get(&ck).cloned());
        let h = match hit {
            Some(h) => h,
            None => {
                let h = sha256_file(p)?;
                if let Ok(mut c) = cache.lock() {
                    c.insert(ck, h.clone());
                }
                h
            }
        };
        digests.push(h);
    }
    Ok(if digests.len() == 1 {
        digests.remove(0)
    } else {
        sha256_hex(digests.concat().as_bytes())
    })
}

fn cell_key(
    rec: &PlannedRecording,
    fe: &(FrontendSpec, String),
    d: &Design,
    run_hash: &str,
    scoring_hash: &str,
) -> CanonicalHash {
    canonical_hash(&serde_json::json!({
        "schema": CELL_SCHEMA,
        "recording_id": rec.id,
        "recording_sha256": rec.sha256,
        "conditions_hash": rec.conditions_hash,
        "frontend": fe.0.name,
        "frontend_hash": fe.1,
        "design": d.name(),
        "design_hash": d.hash(),
        "run_hash": run_hash,
        "scoring_hash": scoring_hash,
        "engine_version": engine_version(),
    }))
}

/// Resolve a loaded campaign into a plan: hash every recording (checking stated hashes)
/// and key every cell.
pub fn plan(c: &LoadedCampaign, out_dir: &Path, workers: usize) -> Result<Plan, String> {
    let cache_path = out_dir.join("hashes.json");
    let cache: BTreeMap<String, String> = std::fs::read_to_string(&cache_path)
        .ok()
        .and_then(|t| serde_json::from_str(&t).ok())
        .unwrap_or_default();
    let cache = Mutex::new(cache);
    let shas = run_batch_items(&c.conditions, workers, |(file, tc)| {
        let path = tc.recording_path(file);
        let opened = open_recording(&path, tc.recording.raw_sidecar()?)
            .map_err(|e| format!("{}: {e}", path.display()))?;
        let sha = recording_sha(&opened.data_files, &cache)?;
        if let Some(want) = &tc.recording.sha256 {
            if !want.eq_ignore_ascii_case(&sha) {
                return Err(format!(
                    "recording '{}': SHA-256 {sha} does not match the stated {want}",
                    tc.recording.id
                ));
            }
        }
        Ok((path, sha))
    });
    let mut recordings = Vec::new();
    for ((file, tc), r) in c.conditions.iter().zip(shas) {
        let (path, sha) = r?;
        recordings.push(PlannedRecording {
            id: tc.recording.id.clone(),
            conditions_file: file.display().to_string(),
            path: path.display().to_string(),
            sha256: sha,
            conditions_hash: tc.hash(),
            conditions: tc.clone(),
        });
    }
    if let Ok(cache) = cache.into_inner() {
        std::fs::create_dir_all(out_dir).map_err(|e| format!("{}: {e}", out_dir.display()))?;
        write_atomic(
            &cache_path,
            serde_json::to_string_pretty(&cache)
                .unwrap_or_default()
                .as_bytes(),
        )?;
    }
    let frontends: Vec<(FrontendSpec, String)> =
        c.frontends.iter().map(|f| (f.clone(), f.hash())).collect();
    let run_hash = c.spec.run_hash();
    let scoring_hash = c.spec.scoring_hash();
    let mut cells = Vec::new();
    for (ri, rec) in recordings.iter().enumerate() {
        for (fi, fe) in frontends.iter().enumerate() {
            for (di, d) in c.designs.iter().enumerate() {
                cells.push(PlannedCell {
                    key: cell_key(rec, fe, d, &run_hash, &scoring_hash),
                    recording: ri,
                    frontend: fi,
                    design: di,
                });
            }
        }
    }
    Ok(Plan {
        schema: PLAN_SCHEMA.into(),
        name: c.spec.name.clone(),
        engine_version: engine_version().into(),
        recordings,
        frontends,
        designs: c.designs.iter().map(|d| d.to_json()).collect(),
        run_hash,
        scoring: c.spec.scoring.clone(),
        scoring_hash,
        cells,
    })
}

/// Write `bytes` to `path` atomically (a temporary file in the same directory, renamed).
pub fn write_atomic(path: &Path, bytes: &[u8]) -> Result<(), String> {
    let dir = path.parent().unwrap_or(Path::new("."));
    std::fs::create_dir_all(dir).map_err(|e| format!("{}: {e}", dir.display()))?;
    let tmp = dir.join(format!(
        ".{}.tmp{}",
        path.file_name()
            .map(|s| s.to_string_lossy())
            .unwrap_or_default(),
        std::process::id()
    ));
    std::fs::write(&tmp, bytes).map_err(|e| format!("{}: {e}", tmp.display()))?;
    std::fs::rename(&tmp, path).map_err(|e| format!("{}: {e}", path.display()))
}

/// The path of a cell's result.
pub fn cell_path(out_dir: &Path, key: &str) -> PathBuf {
    out_dir.join("cells").join(format!("{key}.json"))
}

/// Whether a cell's result is present and is that cell's.
pub fn cell_done(out_dir: &Path, key: &str) -> bool {
    std::fs::read_to_string(cell_path(out_dir, key))
        .ok()
        .and_then(|t| serde_json::from_str::<CellResult>(&t).ok())
        .is_some_and(|c| c.key == key)
}

/// The canonical text of a cell result: pretty JSON, keys sorted, trailing newline.
pub fn cell_text(c: &CellResult) -> String {
    let v = serde_json::to_value(c).unwrap_or_default();
    format!("{}\n", serde_json::to_string_pretty(&v).unwrap_or_default())
}

/// One work item: some designs of one (recording, chain) group.
struct WorkItem {
    recording: usize,
    frontend: usize,
    cells: Vec<usize>,
}

/// Run a loaded campaign into `out_dir`, then rebuild the report.
pub fn run(c: &LoadedCampaign, out_dir: &Path, opts: &RunOptions) -> Result<RunSummary, String> {
    let workers = match (opts.workers, c.spec.run.workers) {
        (0, 0) => default_workers(),
        (0, w) => w,
        (w, _) => w,
    };
    std::fs::create_dir_all(out_dir).map_err(|e| format!("{}: {e}", out_dir.display()))?;
    let plan = plan(c, out_dir, workers)?;
    write_atomic(
        &out_dir.join("campaign.json"),
        format!(
            "{}\n",
            serde_json::to_string_pretty(&serde_json::to_value(&plan).unwrap_or_default())
                .unwrap_or_default()
        )
        .as_bytes(),
    )?;

    let mut pending = Vec::new();
    let mut skipped = 0;
    for (i, cell) in plan.cells.iter().enumerate() {
        if !opts.no_resume && cell_done(out_dir, &cell.key) {
            skipped += 1;
        } else {
            pending.push(i);
        }
    }
    let to_run: Vec<usize> = match opts.max_cells {
        Some(m) => pending.iter().copied().take(m).collect(),
        None => pending.clone(),
    };
    let mut summary = RunSummary {
        name: plan.name.clone(),
        out_dir: out_dir.display().to_string(),
        cells_total: plan.cells.len(),
        cells_skipped: skipped,
        cells_run: 0,
        cells_failed: Vec::new(),
        cells_pending: pending.len(),
        samples_processed: 0,
        digest: None,
    };
    if opts.dry_run {
        return Ok(summary);
    }

    let items = work_items(&plan, &to_run, workers);
    let log = Mutex::new(
        std::fs::OpenOptions::new()
            .create(true)
            .append(true)
            .open(out_dir.join("runs.jsonl"))
            .map_err(|e| format!("runs.jsonl: {e}"))?,
    );
    let results = run_batch_items(&items, workers, |item| {
        let t0 = std::time::Instant::now();
        let r = run_item(c, &plan, item, out_dir);
        let wall = t0.elapsed().as_secs_f64();
        if let Ok(mut f) = log.lock() {
            for &ci in &item.cells {
                let cell = &plan.cells[ci];
                let line = serde_json::json!({
                    "key": cell.key,
                    "recording": plan.recordings[cell.recording].id,
                    "frontend": plan.frontends[cell.frontend].0.name,
                    "design": c.designs[cell.design].name(),
                    "item_cells": item.cells.len(),
                    "wall_s": wall,
                    "status": if r.is_ok() { "done" } else { "failed" },
                    "error": r.as_ref().err(),
                });
                let _ = writeln!(f, "{line}");
            }
        }
        r
    });
    for (item, r) in items.iter().zip(results) {
        match r {
            Ok(n) => {
                summary.cells_run += item.cells.len();
                summary.samples_processed += n;
            }
            Err(e) => {
                for &ci in &item.cells {
                    summary
                        .cells_failed
                        .push((plan.cells[ci].key.clone(), e.clone()));
                }
            }
        }
    }
    summary.cells_pending = plan
        .cells
        .iter()
        .filter(|cell| !cell_done(out_dir, &cell.key))
        .count();
    let report = super::report::build(out_dir)?;
    summary.digest = report.digest;
    Ok(summary)
}

/// Split the cells to run into work items: one per (recording, chain) group, each group
/// split into design chunks when there are fewer groups than workers.
fn work_items(plan: &Plan, to_run: &[usize], workers: usize) -> Vec<WorkItem> {
    let mut groups: BTreeMap<(usize, usize), Vec<usize>> = BTreeMap::new();
    for &ci in to_run {
        let c = &plan.cells[ci];
        groups
            .entry((c.recording, c.frontend))
            .or_default()
            .push(ci);
    }
    let per_group = workers.div_ceil(groups.len().max(1)).max(1);
    let mut items = Vec::new();
    for ((recording, frontend), cells) in groups {
        let chunks = per_group.min(cells.len());
        let size = cells.len().div_ceil(chunks);
        for chunk in cells.chunks(size) {
            items.push(WorkItem {
                recording,
                frontend,
                cells: chunk.to_vec(),
            });
        }
    }
    items
}

/// The satellites a test-condition file expects, in order.
struct Sat {
    signal: String,
    id: i64,
    code: SignalCode,
    hint: Option<(f64, f64)>,
    periods_per_bit: Option<usize>,
    truth: Option<usize>,
}

fn sats_of(tc: &TestConditions, file: &Path) -> Result<(Vec<Sat>, Vec<TruthDoppler>), String> {
    let mut sats = Vec::new();
    let mut truths = Vec::new();
    for g in &tc.expected {
        let truth = match &g.truth {
            Some(p) => {
                truths.push(TruthDoppler::load(&resolve(file, p))?);
                Some(truths.len() - 1)
            }
            None => None,
        };
        for (k, &id) in g.ids.iter().enumerate() {
            let hint = match (g.doppler_hz.get(k), g.code_phase_chips.get(k)) {
                (Some(&d), Some(&p)) => Some((d, p)),
                _ => None,
            };
            sats.push(Sat {
                signal: g.signal.clone(),
                id,
                code: build_code(&g.signal, id)?,
                hint,
                periods_per_bit: g.periods_per_bit,
                truth,
            });
        }
    }
    Ok((sats, truths))
}

/// Acquire every satellite with `cfg` over the start of the (front-end processed)
/// recording.
fn acquire_all(
    rec: &PlannedRecording,
    fe: &FrontendSpec,
    sats: &[Sat],
    cfg: &AcqConfig,
) -> Result<Vec<AcqResult>, String> {
    let tc = &rec.conditions;
    let mut opened = open_recording(Path::new(&rec.path), tc.recording.raw_sidecar()?)
        .map_err(|e| e.to_string())?;
    let spec = opened.source.spec();
    let need = sats
        .iter()
        .map(|s| samples_needed(&spec, &s.code, cfg))
        .collect::<Result<Vec<_>, _>>()?
        .into_iter()
        .max()
        .unwrap_or(0);
    let mut buf = vec![Cf64::default(); need];
    let mut got = 0;
    while got < need {
        let n = opened
            .source
            .read(&mut buf[got..])
            .map_err(|e| e.to_string())?;
        if n == 0 {
            break;
        }
        got += n;
    }
    buf.truncate(got);
    let mut chain = build_chain(&fe.params(), spec.fs_hz)?;
    apply_chain(&mut chain, &mut buf);
    sats.iter()
        .map(|s| {
            let n = samples_needed(&spec, &s.code, cfg)?;
            if buf.len() < n {
                return Err(format!(
                    "{}: recording holds {} samples, {n} needed to acquire",
                    s.code.name(),
                    buf.len()
                ));
            }
            acquire(&buf, &spec, &s.code, cfg).map(|g| g.result)
        })
        .collect()
}

/// One channel of a work item.
struct Chan {
    cell: usize,
    sat: usize,
    lock: LockTracker,
    scorer: SatScorer,
}

/// Run one work item and write its cells; returns the samples processed.
fn run_item(
    c: &LoadedCampaign,
    plan: &Plan,
    item: &WorkItem,
    out_dir: &Path,
) -> Result<u64, String> {
    let rec = &plan.recordings[item.recording];
    let (fe, fe_hash) = &plan.frontends[item.frontend];
    let tc = &rec.conditions;
    let (sats, truths) = sats_of(tc, Path::new(&rec.conditions_file))?;
    let scoring = &plan.scoring;

    let mut opened = open_recording(Path::new(&rec.path), tc.recording.raw_sidecar()?)
        .map_err(|e| e.to_string())?;
    let spec = opened.source.spec();
    let max_samples = (c.spec.run.max_seconds > 0.0)
        .then(|| (c.spec.run.max_seconds * spec.fs_hz).round() as u64);

    // Hand-offs, per cell and satellite. One acquisition per distinct search config.
    let mut acq_cache: Vec<(AcqConfig, Vec<AcqResult>)> = Vec::new();
    let mut handoffs: Vec<Vec<(Handoff, Option<ChannelInit>)>> = Vec::new();
    for &ci in &item.cells {
        let d = &c.designs[plan.cells[ci].design];
        let mut per = Vec::new();
        for (si, s) in sats.iter().enumerate() {
            let arc: Arc<dyn SpreadingCode + Send + Sync> = Arc::new(s.code.clone());
            if let Some((dop, phase)) = s.hint {
                per.push((
                    Handoff {
                        source: "hint".into(),
                        doppler_hz: Some(dop),
                        code_phase_chips: Some(phase),
                        statistic: None,
                        threshold: None,
                    },
                    Some(ChannelInit {
                        code: arc,
                        code_phase_chips: phase,
                        doppler_hz: dop,
                        periods_per_bit: s.periods_per_bit,
                    }),
                ));
                continue;
            }
            let cfg = d.acq_config(s.code.period_s());
            let idx = match acq_cache.iter().position(|(k, _)| *k == cfg) {
                Some(i) => i,
                None => {
                    acq_cache.push((cfg, acquire_all(rec, fe, &sats, &cfg)?));
                    acq_cache.len() - 1
                }
            };
            let r = &acq_cache[idx].1[si];
            let ho = Handoff {
                source: if r.acquired {
                    "acquired"
                } else {
                    "not-acquired"
                }
                .into(),
                doppler_hz: r.acquired.then_some(r.doppler_hz),
                code_phase_chips: r.acquired.then_some(r.code_phase_chips),
                statistic: Some(r.statistic),
                threshold: Some(r.threshold),
            };
            let init = r
                .acquired
                .then(|| ChannelInit::from_acquisition(arc, r, &spec, 0, s.periods_per_bit));
            per.push((ho, init));
        }
        handoffs.push(per);
    }

    // The bank: one channel per (cell, acquired satellite).
    let mut pairs = Vec::new();
    let mut chans = Vec::new();
    for (k, &ci) in item.cells.iter().enumerate() {
        let d = &c.designs[plan.cells[ci].design];
        let lc = d.loop_config();
        for (si, (_, init)) in handoffs[k].iter().enumerate() {
            if let Some(init) = init {
                pairs.push((init.clone(), lc.clone()));
                chans.push(Chan {
                    cell: k,
                    sat: si,
                    lock: LockTracker::new(&d.lock_config(), lc.carrier.has_pll(), lc.cn0_windows),
                    scorer: SatScorer::new(
                        tc,
                        &sats[si].signal,
                        sats[si].id,
                        sats[si].code.chip_rate_hz(),
                        scoring,
                    ),
                });
            }
        }
    }
    let mut bank = TrackingBank::new(spec, &pairs)?;
    let mut cursors: Vec<_> = chans
        .iter()
        .map(|ch| {
            let s = &sats[ch.sat];
            s.truth
                .and_then(|t| u32::try_from(s.id).ok().and_then(|id| truths[t].cursor(id)))
        })
        .collect();
    let mut chain = build_chain(&fe.params(), spec.fs_hz)?;
    let mut buf = vec![Cf64::default(); CHUNK];
    let mut out: Vec<Vec<EpochOutput>> = Vec::new();
    let mut done = 0u64;
    loop {
        let want = match max_samples {
            Some(m) => m.saturating_sub(done).min(CHUNK as u64) as usize,
            None => CHUNK,
        };
        if want == 0 {
            break;
        }
        let n = opened
            .source
            .read(&mut buf[..want])
            .map_err(|e| e.to_string())?;
        if n == 0 {
            break;
        }
        apply_chain(&mut chain, &mut buf[..n]);
        if !chans.is_empty() {
            bank.process(&buf[..n], &mut out);
            for (i, ch) in chans.iter_mut().enumerate() {
                for e in out[i].drain(..) {
                    let se = ch.lock.update(&e);
                    let truth = cursors[i].as_mut().map(|c| c.at(se.t_s));
                    ch.scorer.push(&se, truth);
                }
            }
        }
        done += n as u64;
    }

    // Assemble and write each cell.
    let mut scores: Vec<Vec<Option<SatScore>>> =
        item.cells.iter().map(|_| vec![None; sats.len()]).collect();
    for ch in chans {
        scores[ch.cell][ch.sat] = Some(ch.scorer.finish());
    }
    for (k, &ci) in item.cells.iter().enumerate() {
        let cell = &plan.cells[ci];
        let d = &c.designs[cell.design];
        let satellites = sats
            .iter()
            .enumerate()
            .map(|(si, s)| CellSat {
                handoff: handoffs[k][si].0.clone(),
                score: scores[k][si].take().unwrap_or_else(|| {
                    SatScorer::new(tc, &s.signal, s.id, s.code.chip_rate_hz(), scoring).finish()
                }),
            })
            .collect();
        let result = CellResult {
            schema: CELL_SCHEMA.into(),
            key: cell.key.clone(),
            engine_version: engine_version().into(),
            recording: RecordingStamp {
                id: rec.id.clone(),
                sha256: rec.sha256.clone(),
                conditions_hash: rec.conditions_hash.clone(),
            },
            frontend: NamedHash {
                name: fe.name.clone(),
                hash: fe_hash.clone(),
            },
            design: NamedHash {
                name: d.name().into(),
                hash: d.hash().into(),
            },
            run_hash: plan.run_hash.clone(),
            scoring_hash: plan.scoring_hash.clone(),
            lock_source: LOCK_SOURCE.into(),
            sample_rate_hz: spec.fs_hz,
            samples_processed: done,
            satellites,
        };
        write_atomic(
            &cell_path(out_dir, &cell.key),
            cell_text(&result).as_bytes(),
        )?;
    }
    Ok(done)
}
