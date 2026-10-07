// SPDX-License-Identifier: AGPL-3.0-only
//! The campaign file (`kshana.campaign/1`): which recordings, front-end chains and loop
//! designs to run, and how to score them.

use super::conditions::{resolve, TestConditions};
use super::hash::{canonical_hash, CanonicalHash};
use super::score::ScoringConfig;
use crate::iq::cli::FrontendParams;
use crate::iq::track::design::{Design, DesignFile};
use serde::{Deserialize, Serialize};
use std::path::{Path, PathBuf};

/// The schema tag every campaign file carries.
pub const SCHEMA: &str = "kshana.campaign/1";

/// The campaign's inputs.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Inputs {
    /// Test-condition files, as paths or globs (`*` and `?` in the file-name part),
    /// relative to the campaign file.
    pub conditions: Vec<String>,
    /// A `kshana.loop-design/1` file, relative to the campaign file; omitted runs the
    /// built-in default design.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub designs: Option<String>,
    /// The designs of the file to run; empty runs every design in it.
    #[serde(default, skip_serializing_if = "Vec::is_empty")]
    pub design_names: Vec<String>,
}

/// One front-end chain: the keys of `kshana iq frontend`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct FrontendSpec {
    /// The chain's name in outputs.
    pub name: String,
    /// Band-pass passband `[lo_hz, hi_hz]` relative to baseband.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub bandpass: Option<[f64; 2]>,
    /// Band-pass transition width (Hz).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub bandpass_transition_hz: Option<f64>,
    /// Band-pass stopband attenuation (dB).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub bandpass_atten_db: Option<f64>,
    /// Adaptive notch filter.
    #[serde(default)]
    pub notch: bool,
    /// Notch pole contraction.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub notch_r: Option<f64>,
    /// Notch LMS step.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub notch_mu: Option<f64>,
    /// Pulse-blanking magnitude threshold.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub blank: Option<f64>,
    /// Pulse-blanking hold (samples).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub blank_hold: Option<usize>,
    /// Frequency-domain excision.
    #[serde(default)]
    pub excise: bool,
    /// Excision FFT length.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub excise_fft: Option<usize>,
    /// Excision false-alarm probability per bin.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub excise_pfa: Option<f64>,
    /// Automatic gain control.
    #[serde(default)]
    pub agc: bool,
    /// AGC time constant (s).
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub agc_tau_s: Option<f64>,
    /// Quantiser bits per component.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub bits: Option<u32>,
    /// Quantiser step.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub quant_step: Option<f64>,
    /// Suppress the automatic AGC before a quantiser.
    #[serde(default)]
    pub no_agc: bool,
}

impl FrontendSpec {
    /// The empty chain, named `raw`.
    pub fn raw() -> Self {
        Self {
            name: "raw".into(),
            bandpass: None,
            bandpass_transition_hz: None,
            bandpass_atten_db: None,
            notch: false,
            notch_r: None,
            notch_mu: None,
            blank: None,
            blank_hold: None,
            excise: false,
            excise_fft: None,
            excise_pfa: None,
            agc: false,
            agc_tau_s: None,
            bits: None,
            quant_step: None,
            no_agc: false,
        }
    }

    /// The chain parameters, with the `iq frontend` defaults for unset keys.
    pub(crate) fn params(&self) -> FrontendParams {
        let d = FrontendParams::default();
        FrontendParams {
            bandpass: self.bandpass.map(|[lo, hi]| (lo, hi)),
            bandpass_transition_hz: self.bandpass_transition_hz,
            bandpass_atten_db: self.bandpass_atten_db.unwrap_or(d.bandpass_atten_db),
            notch: self.notch,
            notch_r: self.notch_r.unwrap_or(d.notch_r),
            notch_mu: self.notch_mu.unwrap_or(d.notch_mu),
            blank: self.blank,
            blank_hold: self.blank_hold.unwrap_or(d.blank_hold),
            excise: self.excise,
            excise_fft: self.excise_fft.unwrap_or(d.excise_fft),
            excise_pfa: self.excise_pfa.unwrap_or(d.excise_pfa),
            agc: self.agc,
            agc_tau_s: self.agc_tau_s.unwrap_or(d.agc_tau_s),
            bits: self.bits,
            quant_step: self.quant_step,
            no_agc: self.no_agc,
        }
    }

    /// SHA-256 of the canonical JSON of the chain (its name excluded).
    pub fn hash(&self) -> CanonicalHash {
        let mut v = serde_json::to_value(self).unwrap_or_default();
        if let Some(m) = v.as_object_mut() {
            m.remove("name");
        }
        canonical_hash(&v)
    }
}

/// Where per-update tracking records go: nowhere (the default; the scorer reads the
/// updates as they are produced), or one file per cell in `epochs/<cell key>.<ext>` in
/// one of the `kshana.track-epoch/1` forms, with the lock events beside it in
/// `epochs/<cell key>.events.jsonl`. A record is one loop update of one channel. The
/// binary form takes 184 bytes per record: at 1 ms updates, about 0.66 GB per channel-hour.
/// CSV and JSON Lines take about three times as much.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "lowercase")]
pub enum EpochOutputKind {
    /// Not kept.
    #[default]
    None,
    /// CSV with a header row.
    Csv,
    /// JSON Lines with a header line.
    Jsonl,
    /// A JSON header line and fixed little-endian records.
    Binary,
}

impl EpochOutputKind {
    /// The writer format and file suffix, or `None` when epochs are not kept.
    pub fn format(self) -> Option<(crate::iq::track::sink::EpochFormat, &'static str)> {
        use crate::iq::track::sink::EpochFormat;
        match self {
            Self::None => None,
            Self::Csv => Some((EpochFormat::Csv, "csv")),
            Self::Jsonl => Some((EpochFormat::Jsonl, "jsonl")),
            Self::Binary => Some((EpochFormat::Binary, "bin")),
        }
    }
}

/// What a campaign's data is, stated so that downstream tools can refuse to mix them. It
/// is required, is copied into the plan and every cell, and is part of every cell key.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum DataClass {
    /// Synthetic or public data.
    Synthetic,
    /// A client's confidential recordings.
    ClientConfidential,
}

impl DataClass {
    /// `synthetic` or `client-confidential`.
    pub fn as_str(self) -> &'static str {
        match self {
            Self::Synthetic => "synthetic",
            Self::ClientConfidential => "client-confidential",
        }
    }
}

/// Execution settings.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct RunConfig {
    /// Seconds of each recording to process; 0 (the default) is the whole recording.
    #[serde(default)]
    pub max_seconds: f64,
    /// Worker threads; 0 (the default) uses every core. Outputs never depend on it.
    #[serde(default)]
    pub workers: usize,
    /// Per-update tracking output.
    #[serde(default)]
    pub epochs: EpochOutputKind,
}

/// A parsed campaign file.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct CampaignSpec {
    /// Must be [`SCHEMA`].
    pub schema: String,
    /// The campaign's name.
    pub name: String,
    /// What the data is (required).
    pub data_class: DataClass,
    /// Inputs.
    pub inputs: Inputs,
    /// Front-end chains; omitted runs the empty chain (`raw`) only.
    #[serde(default, rename = "frontend", skip_serializing_if = "Vec::is_empty")]
    pub frontends: Vec<FrontendSpec>,
    /// Execution settings.
    #[serde(default)]
    pub run: RunConfig,
    /// Scoring settings and pass/fail bars.
    #[serde(default)]
    pub scoring: ScoringConfig,
}

impl CampaignSpec {
    /// Parse TOML or JSON and validate the parts that need no files.
    pub fn parse(text: &str) -> Result<Self, String> {
        let s: CampaignSpec = if text.trim_start().starts_with('{') {
            serde_json::from_str(text).map_err(|e| format!("campaign (JSON): {e}"))?
        } else {
            toml::from_str(text).map_err(|e| format!("campaign (TOML): {e}"))?
        };
        if s.schema != SCHEMA {
            return Err(format!(
                "schema must be \"{SCHEMA}\" (got \"{}\")",
                s.schema
            ));
        }
        if s.inputs.conditions.is_empty() {
            return Err("inputs.conditions must list at least one file or glob".into());
        }
        if !(s.run.max_seconds.is_finite() && s.run.max_seconds >= 0.0) {
            return Err("run.max_seconds must be >= 0".into());
        }
        let mut names = std::collections::BTreeSet::new();
        for f in s.frontends() {
            if f.name.trim().is_empty() || !names.insert(f.name.clone()) {
                return Err(format!(
                    "frontend names must be non-empty and unique ('{}')",
                    f.name
                ));
            }
        }
        s.scoring.validate()?;
        Ok(s)
    }

    /// The front-end chains, `raw` when none are listed.
    pub fn frontends(&self) -> Vec<FrontendSpec> {
        if self.frontends.is_empty() {
            vec![FrontendSpec::raw()]
        } else {
            self.frontends.clone()
        }
    }

    /// The hash of the settings that change results (not the worker count).
    pub fn run_hash(&self) -> CanonicalHash {
        canonical_hash(&serde_json::json!({
            "max_seconds": self.run.max_seconds,
            "epochs": self.run.epochs,
        }))
    }

    /// The hash of the scorer settings (bars excluded: they are applied in the report).
    pub fn scoring_hash(&self) -> CanonicalHash {
        let mut v = serde_json::to_value(&self.scoring).unwrap_or_default();
        if let Some(m) = v.as_object_mut() {
            m.remove("bars");
        }
        canonical_hash(&v)
    }
}

/// A campaign with its inputs loaded.
#[derive(Clone, Debug)]
pub struct LoadedCampaign {
    /// The campaign file.
    pub spec: CampaignSpec,
    /// Test conditions with the file each came from, sorted by recording id.
    pub conditions: Vec<(PathBuf, TestConditions)>,
    /// The designs to run, in file order.
    pub designs: Vec<Design>,
    /// The front-end chains.
    pub frontends: Vec<FrontendSpec>,
}

impl LoadedCampaign {
    /// Parse `text` (a campaign whose relative paths resolve against `base`, the
    /// campaign file's path) and load every file it names.
    pub fn load_text(text: &str, base: &Path) -> Result<Self, String> {
        let spec = CampaignSpec::parse(text)?;
        let mut files = Vec::new();
        for pat in &spec.inputs.conditions {
            let found = expand_glob(&resolve(base, pat))?;
            if found.is_empty() {
                return Err(format!("inputs.conditions: '{pat}' matches no file"));
            }
            files.extend(found);
        }
        files.sort();
        files.dedup();
        let mut conditions = Vec::new();
        for f in files {
            let tc = TestConditions::load(&f)?;
            conditions.push((f, tc));
        }
        conditions.sort_by(|a, b| a.1.recording.id.cmp(&b.1.recording.id));
        for w in conditions.windows(2) {
            if w[0].1.recording.id == w[1].1.recording.id {
                return Err(format!(
                    "recording id '{}' appears in both {} and {}",
                    w[0].1.recording.id,
                    w[0].0.display(),
                    w[1].0.display()
                ));
            }
        }
        let designs = match &spec.inputs.designs {
            None => {
                if !spec.inputs.design_names.is_empty() {
                    return Err("inputs.design_names needs inputs.designs".into());
                }
                vec![Design::builtin_default()]
            }
            Some(p) => {
                let path = resolve(base, p);
                let text = std::fs::read_to_string(&path)
                    .map_err(|e| format!("{}: {e}", path.display()))?;
                let file =
                    DesignFile::parse(&text).map_err(|e| format!("{}: {e}", path.display()))?;
                if spec.inputs.design_names.is_empty() {
                    file.designs().to_vec()
                } else {
                    spec.inputs
                        .design_names
                        .iter()
                        .map(|n| {
                            file.get(n).cloned().ok_or_else(|| {
                                format!(
                                    "inputs.design_names: no design '{n}' in {}",
                                    path.display()
                                )
                            })
                        })
                        .collect::<Result<Vec<_>, _>>()?
                }
            }
        };
        let frontends = spec.frontends();
        Ok(Self {
            spec,
            conditions,
            designs,
            frontends,
        })
    }

    /// Read and load a campaign file.
    pub fn load(path: &Path) -> Result<Self, String> {
        let text = std::fs::read_to_string(path).map_err(|e| format!("{}: {e}", path.display()))?;
        Self::load_text(&text, path).map_err(|e| format!("{}: {e}", path.display()))
    }
}

/// Expand `*` and `?` in the file-name part of `pattern` (the directory part is literal).
/// A pattern without wildcards is returned as is if the file exists.
pub fn expand_glob(pattern: &Path) -> Result<Vec<PathBuf>, String> {
    let name = pattern
        .file_name()
        .map(|s| s.to_string_lossy().into_owned())
        .unwrap_or_default();
    if !name.contains(['*', '?']) {
        return Ok(if pattern.is_file() {
            vec![pattern.to_path_buf()]
        } else {
            Vec::new()
        });
    }
    let dir = pattern.parent().unwrap_or(Path::new("."));
    let dir = if dir.as_os_str().is_empty() {
        Path::new(".")
    } else {
        dir
    };
    let rd = std::fs::read_dir(dir).map_err(|e| format!("{}: {e}", dir.display()))?;
    let mut out = Vec::new();
    for ent in rd.flatten() {
        let n = ent.file_name().to_string_lossy().into_owned();
        if wildcard(&name, &n) && ent.path().is_file() {
            out.push(ent.path());
        }
    }
    out.sort();
    Ok(out)
}

/// Whether `text` matches `pat` (`*` any run, `?` any one character).
fn wildcard(pat: &str, text: &str) -> bool {
    let (p, t): (Vec<char>, Vec<char>) = (pat.chars().collect(), text.chars().collect());
    let (mut pi, mut ti, mut star, mut mark) = (0, 0, None, 0);
    while ti < t.len() {
        if pi < p.len() && (p[pi] == '?' || p[pi] == t[ti]) {
            pi += 1;
            ti += 1;
        } else if pi < p.len() && p[pi] == '*' {
            star = Some(pi);
            mark = ti;
            pi += 1;
        } else if let Some(s) = star {
            pi = s + 1;
            mark += 1;
            ti = mark;
        } else {
            return false;
        }
    }
    p[pi..].iter().all(|&c| c == '*')
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn wildcards_match_file_names() {
        assert!(wildcard("*.toml", "run1.toml"));
        assert!(wildcard("run?.toml", "run1.toml"));
        assert!(!wildcard("run?.toml", "run12.toml"));
        assert!(wildcard("r*1*.t*", "run-1-a.toml"));
        assert!(!wildcard("*.json", "x.toml"));
    }

    #[test]
    fn a_campaign_parses_with_defaults_and_refuses_unknown_keys() {
        let s = CampaignSpec::parse(
            "schema = \"kshana.campaign/1\"\nname = \"c\"\ndata_class = \"synthetic\"\n[inputs]\nconditions = [\"*.toml\"]\n[scoring]\njs_bin_db = 2.0\n[scoring.bars]\nmax_reacq_s = 5.0\n",
        )
        .unwrap();
        assert_eq!(s.frontends()[0].name, "raw");
        assert_eq!(s.scoring.js_bin_db, 2.0);
        assert_eq!(s.scoring.bars.as_ref().unwrap().max_reacq_s, Some(5.0));
        let bad = CampaignSpec::parse(
            "schema = \"kshana.campaign/1\"\nname = \"c\"\ndata_class = \"synthetic\"\n[inputs]\nconditions = [\"a\"]\n[run]\nthreads = 3\n",
        );
        assert!(bad.unwrap_err().contains("unknown field"));
    }

    #[test]
    fn data_class_is_required_and_closed() {
        let ok = "schema = \"kshana.campaign/1\"\nname = \"c\"\ndata_class = \"client-confidential\"\n[inputs]\nconditions = [\"a\"]\n";
        assert_eq!(
            CampaignSpec::parse(ok).unwrap().data_class,
            DataClass::ClientConfidential
        );
        let missing = ok.replace("data_class = \"client-confidential\"\n", "");
        assert!(CampaignSpec::parse(&missing)
            .unwrap_err()
            .contains("data_class"));
        let typo = ok.replace("client-confidential", "client-confidental");
        assert!(CampaignSpec::parse(&typo)
            .unwrap_err()
            .contains("unknown variant"));
    }

    #[test]
    fn the_worker_count_does_not_change_the_run_hash() {
        let a = CampaignSpec::parse(
            "schema = \"kshana.campaign/1\"\nname = \"c\"\ndata_class = \"synthetic\"\n[inputs]\nconditions = [\"a\"]\n[run]\nworkers = 1\n",
        )
        .unwrap();
        let mut b = a.clone();
        b.run.workers = 8;
        assert_eq!(a.run_hash(), b.run_hash());
        b.run.max_seconds = 3.0;
        assert_ne!(a.run_hash(), b.run_hash());
    }
}
