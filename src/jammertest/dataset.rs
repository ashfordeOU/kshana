// SPDX-License-Identifier: AGPL-3.0-only
//! The pre-registered scoring run on the JammerTest 2024 dataset
//! (`xval/jammertest-score/PREREGISTRATION.md`): every folder that carries a `.ubx` log is scored
//! against its own `attack_log`, folders whose baseline may have been formed under interference are
//! dropped, and the scorable windows and clean epochs of the rest are pooled and held to the bars.
//!
//! The dataset (GPL-3.0-or-later) is read from a directory the caller extracted; nothing is
//! vendored.

use super::score::{median, ScoreOptions, Scorecard, TestScore};
use super::{score_log, Schedule, ScoreRequest};
use crate::receiver_trust::scenario::{EventKind, ReceiverTrustScenario};
use serde::Serialize;
use std::path::{Path, PathBuf};

/// Seconds added to the dataset's `attack_log` stamps (they say `Z` but are local time).
pub const TZ_SHIFT_S: f64 = -7200.0;

/// One dataset folder after scoring.
#[derive(Clone, Debug, Serialize)]
pub struct FolderScore {
    /// Path relative to the dataset root.
    pub path: String,
    /// The folder's `scenario_id`.
    pub scenario_id: String,
    /// `attack_type` of `scenario.json`.
    pub attack_type: String,
    /// `stationary` or `dynamic`.
    pub rover_state: String,
    /// Why the folder is not pooled, if it is not.
    pub excluded: Option<String>,
    /// The score, when the run completed.
    pub scorecard: Option<Scorecard>,
}

/// The pooled numbers for one class of windows.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Pooled {
    /// Scorable windows.
    pub windows: usize,
    /// Detected within the tolerance.
    pub detected: usize,
    /// Alarmed later than the tolerance.
    pub late: usize,
    /// Never alarmed.
    pub missed: usize,
    /// (detected + late) / windows.
    pub detection_rate: Option<f64>,
    /// detected / windows.
    pub within_tolerance_rate: Option<f64>,
    /// Median first-alarm latency over windows that alarmed, s.
    pub median_latency_s: Option<f64>,
    /// Windows that alarmed.
    pub alarmed: usize,
    /// Of those, the number that recovered.
    pub recovered: usize,
    /// `recovered` / `alarmed`.
    pub recovered_share: Option<f64>,
    /// Median time to recover over the windows that recovered, s.
    pub median_time_to_recover_s: Option<f64>,
}

/// One bar and how it came out.
#[derive(Clone, Debug, Serialize)]
pub struct Bar {
    /// Bar id.
    pub id: &'static str,
    /// The statement.
    pub statement: &'static str,
    /// The measured value(s), as text.
    pub measured: String,
    /// `met`, `NOT MET` or `not assessable`.
    pub verdict: &'static str,
}

/// The whole run.
#[derive(Clone, Debug, Serialize)]
pub struct DatasetReport {
    /// Every folder with a `.ubx`, in path order.
    pub folders: Vec<FolderScore>,
    /// Kept folders.
    pub kept: usize,
    /// Kept jamming-class folders.
    pub kept_jamming_folders: usize,
    /// Pooled jamming windows.
    pub jamming: Pooled,
    /// Pooled spoofing and meaconing windows (reported only).
    pub spoofing: Pooled,
    /// Pooled clean epochs.
    pub clean_epochs: usize,
    /// Of those, with an alarm.
    pub false_alarm_epochs: usize,
    /// `false_alarm_epochs` / `clean_epochs`.
    pub false_alarm_epoch_rate: Option<f64>,
    /// False-alarm runs.
    pub false_alarm_runs: usize,
    /// Clean hours.
    pub clean_hours: f64,
    /// The minimum-data rule held (at least 10 scorable jamming windows from 2 kept folders).
    pub minimum_data: bool,
    /// The pre-registered bars.
    pub bars: Vec<Bar>,
    /// The honesty label.
    pub label: &'static str,
}

fn pool(tests: &[&TestScore]) -> Pooled {
    let n = tests.len();
    let count = |o: &str| tests.iter().filter(|t| t.outcome == o).count();
    let (detected, late, missed) = (count("detected"), count("late"), count("missed"));
    let alarmed = tests.iter().filter(|t| t.latency_s.is_some()).count();
    let recovered = tests.iter().filter(|t| t.recovered == Some(true)).count();
    let r = |a: usize, b: usize| (b > 0).then(|| a as f64 / b as f64);
    Pooled {
        windows: n,
        detected,
        late,
        missed,
        detection_rate: r(detected + late, n),
        within_tolerance_rate: r(detected, n),
        median_latency_s: median(tests.iter().filter_map(|t| t.latency_s).collect()),
        alarmed,
        recovered,
        recovered_share: r(recovered, alarmed),
        median_time_to_recover_s: median(
            tests.iter().filter_map(|t| t.time_to_recover_s).collect(),
        ),
    }
}

fn walk(dir: &Path, out: &mut Vec<PathBuf>) {
    let Ok(rd) = std::fs::read_dir(dir) else {
        return;
    };
    let mut entries: Vec<PathBuf> = rd.flatten().map(|e| e.path()).collect();
    entries.sort();
    if entries.iter().any(|p| p.ends_with("scenario.json")) {
        out.push(dir.to_path_buf());
    }
    for p in entries {
        if p.is_dir() {
            walk(&p, out);
        }
    }
}

fn score_folder(root: &Path, dir: &Path, opt: &ScoreOptions) -> Option<FolderScore> {
    let rel = dir
        .strip_prefix(root)
        .unwrap_or(dir)
        .to_string_lossy()
        .into_owned();
    let mut ubx: Vec<PathBuf> = std::fs::read_dir(dir)
        .ok()?
        .flatten()
        .map(|e| e.path())
        .filter(|p| p.extension().is_some_and(|x| x == "ubx"))
        .collect();
    ubx.sort();
    let ubx = ubx.into_iter().next()?;
    let meta_text = std::fs::read_to_string(dir.join("scenario.json")).unwrap_or_default();
    let meta: serde_json::Value =
        serde_json::from_str(&meta_text).unwrap_or(serde_json::Value::Null);
    let text = |k: &str| {
        meta.get(k)
            .and_then(|v| v.as_str())
            .unwrap_or("")
            .to_string()
    };
    let lower = rel.to_lowercase();
    let mut f = FolderScore {
        path: rel,
        scenario_id: text("scenario_id"),
        attack_type: text("attack_type"),
        rover_state: if lower.contains("stationary") {
            "stationary"
        } else if lower.contains("dynamic") {
            "dynamic"
        } else {
            "unknown"
        }
        .into(),
        excluded: None,
        scorecard: None,
    };
    let scn: ReceiverTrustScenario = match toml::from_str("[log]\nformat = \"ubx\"\ntext = \"\"\n")
    {
        Ok(s) => s,
        Err(e) => {
            f.excluded = Some(format!("scenario: {e}"));
            return Some(f);
        }
    };
    let bytes = match std::fs::read(&ubx) {
        Ok(b) => b,
        Err(e) => {
            f.excluded = Some(format!("read: {e}"));
            return Some(f);
        }
    };
    let req = ScoreRequest {
        scenario: &scn,
        log_bytes: &bytes,
        schedule: Schedule::AttackLog {
            scenario_json: &meta_text,
            shift_s: TZ_SHIFT_S,
        },
        log_start_utc: None,
        options: *opt,
    };
    match score_log(&req) {
        Ok(o) => {
            if o.scorecard.baseline_contaminated {
                f.excluded = Some(
                    "baseline may have been formed under interference (a window starts less than calibration + guard after the log starts)"
                        .into(),
                );
            }
            f.scorecard = Some(o.scorecard);
        }
        Err(e) => f.excluded = Some(e),
    }
    Some(f)
}

/// Score every `.ubx` folder under `root` and hold the pool to the pre-registered bars.
pub fn run_dataset(root: &Path) -> Result<DatasetReport, String> {
    let opt = ScoreOptions::default();
    let mut dirs = Vec::new();
    walk(root, &mut dirs);
    let folders: Vec<FolderScore> = dirs
        .iter()
        .filter_map(|d| score_folder(root, d, &opt))
        .collect();
    if folders.is_empty() {
        return Err(format!(
            "no folder with a scenario.json and a .ubx under {}",
            root.display()
        ));
    }
    let kept_cards: Vec<&Scorecard> = folders
        .iter()
        .filter(|f| f.excluded.is_none())
        .filter_map(|f| f.scorecard.as_ref())
        .collect();
    let all_tests: Vec<&TestScore> = kept_cards
        .iter()
        .flat_map(|c| c.tests.iter())
        .filter(|t| t.evaluable)
        .collect();
    let jam: Vec<&TestScore> = all_tests
        .iter()
        .copied()
        .filter(|t| t.kind == EventKind::Jamming)
        .collect();
    let spoof: Vec<&TestScore> = all_tests
        .iter()
        .copied()
        .filter(|t| t.kind != EventKind::Jamming)
        .collect();
    let kept_jamming_folders = folders
        .iter()
        .filter(|f| f.excluded.is_none())
        .filter(|f| {
            f.scorecard.as_ref().is_some_and(|c| {
                c.tests
                    .iter()
                    .any(|t| t.evaluable && t.kind == EventKind::Jamming)
            })
        })
        .count();
    let clean_epochs: usize = kept_cards.iter().map(|c| c.summary.clean_epochs).sum();
    let false_alarm_epochs: usize = kept_cards
        .iter()
        .map(|c| c.summary.false_alarm_epochs)
        .sum();
    let false_alarm_runs: usize = kept_cards.iter().map(|c| c.summary.false_alarm_runs).sum();
    let clean_hours: f64 = kept_cards
        .iter()
        .filter_map(|c| c.summary.clean_hours)
        .sum();
    let (j, s) = (pool(&jam), pool(&spoof));
    let rate = (clean_epochs > 0).then(|| false_alarm_epochs as f64 / clean_epochs as f64);
    let minimum_data = j.windows >= 10 && kept_jamming_folders >= 2;
    let verdict = |ok: Option<bool>| match (minimum_data, ok) {
        (false, _) | (_, None) => "not assessable",
        (true, Some(true)) => "met",
        (true, Some(false)) => "NOT MET",
    };
    let f2 = |v: Option<f64>| v.map_or("n/a".to_string(), |x| format!("{x:.4}"));
    let bars = vec![
        Bar {
            id: "B1",
            statement: "detection: (detected + late) / scorable over jamming windows >= 0.80",
            measured: format!("{} ({}+{} of {})", f2(j.detection_rate), j.detected, j.late, j.windows),
            verdict: verdict(j.detection_rate.map(|x| x >= 0.80)),
        },
        Bar {
            id: "B2",
            statement: "timeliness: median latency over jamming windows that alarmed <= 30 s",
            measured: format!("{} s", f2(j.median_latency_s)),
            verdict: verdict(j.median_latency_s.map(|x| x <= 30.0)),
        },
        Bar {
            id: "B3",
            statement: "false alarms: alarmed clean epochs / clean epochs <= 0.02",
            measured: format!("{} ({} of {})", f2(rate), false_alarm_epochs, clean_epochs),
            verdict: verdict(rate.map(|x| x <= 0.02)),
        },
        Bar {
            id: "B4",
            statement: "recovery: share of alarmed jamming windows recovered >= 0.80 and their median time to recover <= 60 s",
            measured: format!(
                "{} recovered ({} of {}), median {} s",
                f2(j.recovered_share),
                j.recovered,
                j.alarmed,
                f2(j.median_time_to_recover_s)
            ),
            verdict: verdict(match (j.recovered_share, j.median_time_to_recover_s) {
                (Some(r), Some(t)) => Some(r >= 0.80 && t <= 60.0),
                (Some(_), None) => Some(false),
                _ => None,
            }),
        },
    ];
    Ok(DatasetReport {
        kept: folders.iter().filter(|f| f.excluded.is_none()).count(),
        kept_jamming_folders,
        folders,
        jamming: j,
        spoofing: s,
        clean_epochs,
        false_alarm_epochs,
        false_alarm_epoch_rate: rate,
        false_alarm_runs,
        clean_hours,
        minimum_data,
        bars,
        label: super::score::SCORE_LABEL,
    })
}
