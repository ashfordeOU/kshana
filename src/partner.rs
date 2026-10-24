// SPDX-License-Identifier: AGPL-3.0-only
//! Data-partner submissions: the format and metadata check behind `kshana partner check`.
//!
//! A partner who holds measured data (a clock record, an IMU log) describes it in a small TOML
//! file, `kshana.partner-submission/1`, next to the data. [`check_file`] reads that description,
//! confirms the data file is the one described (SHA-256), reads it with the engine's own readers,
//! and says what is missing or wrong, before anyone runs anything.
//!
//! What it does not do: it does not score the data, validate a ledger row, or promise that the
//! data will be used. A submission is scored only against a bar pre-registered before it is
//! run (docs/PARTNER-DATA.md). A report that says `ok` means "the format and the metadata are
//! complete and readable", nothing more. Advisory only.

use crate::clock_log::{read_input, ClockLogFormat, ClockLogInput};
use crate::evidence::bundle::sha256_hex;
use crate::receiver_trust::machines::imu::{read_imu, ImuFormat};
use crate::telemetry::time::parse_rfc3339_utc;
use crate::verification::{verification_matrix, VerificationStatus};
use serde::{Deserialize, Serialize};
use std::path::Path;

/// The schema string a submission must carry.
pub const SCHEMA: &str = "kshana.partner-submission/1";

/// What the report says about itself, in every output.
pub const STATEMENT: &str = "This checks the format and the metadata only. It does not score the data, validate a ledger row or \
    promise that the data will be used: a submission is scored against a bar fixed before any run (docs/PARTNER-DATA.md). \
    Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment.";

/// Device kinds a submission can describe.
pub const DEVICE_KINDS: [&str; 2] = ["clock", "imu"];

/// Device classes for a clock; `other` needs a model.
pub const CLOCK_CLASSES: [&str; 8] = [
    "tcxo",
    "ocxo",
    "rubidium",
    "caesium",
    "csac",
    "hydrogen-maser",
    "optical",
    "other",
];

/// Device classes for an IMU; `other` needs a model.
pub const IMU_CLASSES: [&str; 5] = [
    "mems",
    "fog",
    "ring-laser",
    "cold-atom-interferometer",
    "other",
];

const MAX_BYTES: u64 = 2 * 1024 * 1024 * 1024;
const WARN_BYTES: u64 = 200 * 1024 * 1024;

/// The whole submission file.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Submission {
    /// Must equal [`SCHEMA`].
    pub schema: String,
    /// Who is submitting, by type; the name is optional and only for credit.
    pub submitter: Submitter,
    /// The device the data came from.
    pub device: Device,
    /// The data file.
    pub data: DataFile,
    /// How the data was taken.
    pub measurement: Measurement,
    /// The ledger rows the data is offered against.
    pub rows: Rows,
    /// The licence and how the data may be used in the repository.
    pub licence: Licence,
    /// Statements the submitter makes.
    pub statements: Statements,
}

/// The submitter, by type of organisation.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Submitter {
    /// A type, not a name: "a national timing laboratory", "a university metrology group".
    pub organisation_type: String,
    /// The organisation's name, if the submitter wants to be credited by name.
    #[serde(default)]
    pub organisation: Option<String>,
    /// How to credit the submission. Defaults to the organisation type.
    #[serde(default)]
    pub credit_as: Option<String>,
}

/// The device.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Device {
    /// `clock` or `imu`.
    pub kind: String,
    /// One of [`CLOCK_CLASSES`] or [`IMU_CLASSES`].
    pub class: String,
    /// The model or type, free text. Required for class `other`.
    #[serde(default)]
    pub model: Option<String>,
}

/// The data file and how to read it.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct DataFile {
    /// Path of the data file, relative to the submission file.
    pub path: String,
    /// SHA-256 of the data file, lower-case hex.
    pub sha256: String,
    /// A clock-log format (`ticc`, `timelab`, `rinex-clk`, `ptp4l`, `phc2sys`, `ts2phc`, `chrony-tracking`,
    /// `chrony-statistics`) for a clock, or `csv` / `euroc` for an IMU.
    pub format: String,
    /// RINEX, linuxptp, chrony: the clock or source to read.
    #[serde(default)]
    pub clock: Option<String>,
    /// TICC: the channel to read.
    #[serde(default)]
    pub channel: Option<String>,
    /// Sample interval in seconds, when the file does not state it.
    #[serde(default)]
    pub tau0_s: Option<f64>,
    /// TimeLab: the units of the readings.
    #[serde(default)]
    pub units: Option<String>,
    /// TimeLab: `phase` or `frequency`.
    #[serde(default)]
    pub data: Option<String>,
}

/// How the data was taken.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Measurement {
    /// What the device was compared against ("a hydrogen maser", "UTC(k) through a counter", "a second identical unit").
    pub reference: String,
    /// When the record starts, RFC 3339 in UTC.
    pub start_utc: String,
    /// Where and under what conditions, in words ("a temperature-controlled laboratory", "a rack in an office").
    pub environment: String,
    /// `raw` (as the instrument wrote it) or `processed`.
    pub processing: String,
    /// What was done to it, required when `processing` is `processed`.
    #[serde(default)]
    pub processing_note: Option<String>,
    /// The instruments, free text.
    #[serde(default)]
    pub instruments: Option<String>,
}

/// The ledger rows offered against.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Rows {
    /// The `requirement` text of each MODELLED row in the verification matrix the data is offered against,
    /// exactly as `docs/PARTNER-DATA.md` lists them.
    pub targets: Vec<String>,
}

/// The licence.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Licence {
    /// An SPDX identifier (`CC-BY-4.0`, `CC0-1.0`, ...), or give `text`.
    #[serde(default)]
    pub spdx: Option<String>,
    /// The licence in words, when there is no SPDX identifier.
    #[serde(default)]
    pub text: Option<String>,
    /// `public` (the data may be committed to the repository), `hash-only` (only its SHA-256 and the scores are published) or
    /// `private` (the score is shared with the submitter only).
    pub use_in_repository: String,
    /// The attribution line, required when `use_in_repository` is `public`.
    #[serde(default)]
    pub attribution: Option<String>,
}

/// The statements the submitter makes.
#[derive(Clone, Debug, Deserialize, Serialize, PartialEq)]
#[serde(deny_unknown_fields)]
pub struct Statements {
    /// The data is a measurement, not a simulation.
    pub measured_not_simulated: bool,
    /// The submitter may license it for this use.
    pub permission_to_use: bool,
    /// The files hold no personal data and no contact details.
    pub no_personal_data: bool,
}

/// The result of a check.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct Report {
    /// The submission file checked.
    pub submission: String,
    /// True when there is no error. Warnings do not make it false.
    pub ok: bool,
    /// What must be fixed.
    pub errors: Vec<String>,
    /// What is worth a look.
    pub warnings: Vec<String>,
    /// What was read: sample counts, interval, span, and so on.
    pub info: Vec<String>,
    /// The ledger rows the submission targets.
    pub targets: Vec<String>,
    /// The caveat every report carries ([`STATEMENT`]).
    pub statement: &'static str,
}

impl Report {
    /// Plain-text rendering.
    pub fn to_text(&self) -> String {
        let mut s = format!("kshana partner check: {}\n", self.submission);
        for i in &self.info {
            s.push_str(&format!("  info: {i}\n"));
        }
        for w in &self.warnings {
            s.push_str(&format!("  warning: {w}\n"));
        }
        for e in &self.errors {
            s.push_str(&format!("  ERROR: {e}\n"));
        }
        s.push_str(if self.ok {
            "result: the format and the metadata are complete and readable\n"
        } else {
            "result: not ready; fix the errors above\n"
        });
        s.push_str(self.statement);
        s.push('\n');
        s
    }
}

/// Every MODELLED row of the verification matrix, by requirement text.
pub fn modelled_requirements() -> Vec<&'static str> {
    verification_matrix()
        .iter()
        .filter(|r| r.status == VerificationStatus::Modelled)
        .map(|r| r.requirement)
        .collect()
}

fn blank(s: &str) -> bool {
    s.trim().is_empty()
}

/// An email address or a telephone-like run of digits in free text.
fn looks_personal(s: &str) -> Option<&'static str> {
    if s.contains('@') {
        return Some("an email address");
    }
    let digits = s.chars().filter(char::is_ascii_digit).count();
    let only = s
        .chars()
        .all(|c| c.is_ascii_digit() || matches!(c, ' ' | '+' | '-' | '(' | ')'));
    if only && digits >= 8 {
        return Some("a telephone number");
    }
    None
}

fn free_text(sub: &Submission) -> Vec<(&'static str, &str)> {
    let mut v = vec![
        (
            "submitter.organisation_type",
            sub.submitter.organisation_type.as_str(),
        ),
        ("device.class", sub.device.class.as_str()),
        ("measurement.reference", sub.measurement.reference.as_str()),
        (
            "measurement.environment",
            sub.measurement.environment.as_str(),
        ),
        (
            "licence.use_in_repository",
            sub.licence.use_in_repository.as_str(),
        ),
    ];
    for (n, o) in [
        ("submitter.organisation", &sub.submitter.organisation),
        ("submitter.credit_as", &sub.submitter.credit_as),
        ("device.model", &sub.device.model),
        (
            "measurement.processing_note",
            &sub.measurement.processing_note,
        ),
        ("measurement.instruments", &sub.measurement.instruments),
        ("licence.text", &sub.licence.text),
        ("licence.attribution", &sub.licence.attribution),
    ] {
        if let Some(t) = o {
            v.push((n, t.as_str()));
        }
    }
    v
}

/// Check a parsed submission whose data file lives in `dir`.
pub fn check(sub: &Submission, dir: &Path, name: &str) -> Report {
    let mut errors: Vec<String> = Vec::new();
    let mut warnings: Vec<String> = Vec::new();
    let mut info: Vec<String> = Vec::new();

    if sub.schema != SCHEMA {
        errors.push(format!("schema is `{}`, expected `{SCHEMA}`", sub.schema));
    }
    for (field, text) in free_text(sub) {
        if let Some(what) = looks_personal(text) {
            errors.push(format!(
                "{field} contains {what}; the files must hold no personal data or contact details (submit those separately)"
            ));
        }
    }
    if blank(&sub.submitter.organisation_type) {
        errors.push("submitter.organisation_type is empty (give a type such as \"a national timing laboratory\")".into());
    }
    if blank(&sub.measurement.reference) {
        errors.push(
            "measurement.reference is empty: say what the device was compared against".into(),
        );
    }
    if blank(&sub.measurement.environment) {
        errors.push("measurement.environment is empty".into());
    }
    match parse_rfc3339_utc(&sub.measurement.start_utc) {
        Some(_) => {}
        None => errors.push(format!(
            "measurement.start_utc `{}` is not an RFC 3339 UTC time such as 2026-03-01T00:00:00Z",
            sub.measurement.start_utc
        )),
    }
    match sub.measurement.processing.as_str() {
        "raw" => {}
        "processed" => {
            if sub.measurement.processing_note.as_deref().is_none_or(blank) {
                errors.push("measurement.processing is `processed`: measurement.processing_note must say what was done".into());
            }
        }
        other => errors.push(format!(
            "measurement.processing is `{other}`, expected `raw` or `processed`"
        )),
    }

    // device
    let classes: &[&str] = match sub.device.kind.as_str() {
        "clock" => &CLOCK_CLASSES,
        "imu" => &IMU_CLASSES,
        other => {
            errors.push(format!(
                "device.kind is `{other}`, expected one of {DEVICE_KINDS:?}"
            ));
            &[]
        }
    };
    if !classes.is_empty() && !classes.contains(&sub.device.class.as_str()) {
        errors.push(format!(
            "device.class `{}` is not one of {classes:?}",
            sub.device.class
        ));
    }
    if sub.device.class == "other" && sub.device.model.as_deref().is_none_or(blank) {
        errors.push("device.class is `other`: device.model must say what it is".into());
    }

    // statements
    for (n, v) in [
        (
            "measured_not_simulated",
            sub.statements.measured_not_simulated,
        ),
        ("permission_to_use", sub.statements.permission_to_use),
        ("no_personal_data", sub.statements.no_personal_data),
    ] {
        if !v {
            errors.push(format!(
                "statements.{n} must be true for the submission to be considered"
            ));
        }
    }

    // licence
    if sub.licence.spdx.as_deref().is_none_or(blank)
        && sub.licence.text.as_deref().is_none_or(blank)
    {
        errors.push("licence: give an SPDX identifier (licence.spdx) or the licence in words (licence.text)".into());
    }
    if let Some(s) = sub.licence.spdx.as_deref() {
        if !s
            .chars()
            .all(|c| c.is_ascii_alphanumeric() || matches!(c, '-' | '.' | '+' | ' ' | '(' | ')'))
        {
            errors.push(format!("licence.spdx `{s}` is not an SPDX expression"));
        }
    }
    match sub.licence.use_in_repository.as_str() {
        "public" => {
            if sub.licence.attribution.as_deref().is_none_or(blank) {
                errors.push(
                    "licence.use_in_repository is `public`: licence.attribution is required".into(),
                );
            }
        }
        "hash-only" | "private" => {}
        other => errors.push(format!(
            "licence.use_in_repository is `{other}`, expected `public`, `hash-only` or `private`"
        )),
    }

    // target rows
    let modelled = modelled_requirements();
    if sub.rows.targets.is_empty() {
        errors.push(
            "rows.targets is empty: name the MODELLED ledger rows the data is offered against"
                .into(),
        );
    }
    for t in &sub.rows.targets {
        if !modelled.contains(&t.as_str()) {
            let near: Vec<&str> = modelled
                .iter()
                .copied()
                .filter(|r| {
                    let (a, b) = (r.to_lowercase(), t.to_lowercase());
                    !b.is_empty() && (a.contains(&b) || b.contains(&a))
                })
                .take(3)
                .collect();
            let hint = if near.is_empty() {
                String::new()
            } else {
                format!("; did you mean {near:?}")
            };
            errors.push(format!(
                "rows.targets: `{t}` is not the requirement text of a MODELLED row of the verification matrix{hint}"
            ));
        }
    }

    // data file
    let path = dir.join(&sub.data.path);
    let sha_ok = sub.data.sha256.len() == 64
        && sub
            .data
            .sha256
            .chars()
            .all(|c| matches!(c, '0'..='9' | 'a'..='f'));
    if !sha_ok {
        errors.push("data.sha256 must be 64 lower-case hex characters".into());
    }
    match std::fs::metadata(&path) {
        Err(e) => errors.push(format!(
            "data.path {:?} cannot be read: {e}",
            path.display()
        )),
        Ok(m) if m.len() == 0 => errors.push("the data file is empty".into()),
        Ok(m) if m.len() > MAX_BYTES => errors.push(format!(
            "the data file is {} bytes; the largest accepted is {MAX_BYTES}",
            m.len()
        )),
        Ok(m) => {
            if m.len() > WARN_BYTES {
                warnings.push(format!(
                    "the data file is {} MiB; reading it will take a while",
                    m.len() / (1024 * 1024)
                ));
            }
            match std::fs::read(&path) {
                Err(e) => errors.push(format!(
                    "data.path {:?} cannot be read: {e}",
                    path.display()
                )),
                Ok(bytes) => {
                    let got = sha256_hex(&bytes);
                    if sha_ok && got != sub.data.sha256 {
                        errors.push(format!(
                            "data.sha256 does not match the file: the file's SHA-256 is {got}"
                        ));
                    } else if sha_ok {
                        info.push(format!("data file {} bytes, SHA-256 matches", bytes.len()));
                    }
                    read_data(sub, &path, &bytes, &mut errors, &mut warnings, &mut info);
                }
            }
        }
    }

    Report {
        submission: name.to_string(),
        ok: errors.is_empty(),
        errors,
        warnings,
        info,
        targets: sub.rows.targets.clone(),
        statement: STATEMENT,
    }
}

fn read_data(
    sub: &Submission,
    path: &Path,
    bytes: &[u8],
    errors: &mut Vec<String>,
    warnings: &mut Vec<String>,
    info: &mut Vec<String>,
) {
    match sub.device.kind.as_str() {
        "clock" => {
            if ClockLogFormat::from_name(&sub.data.format).is_err() {
                errors.push(format!(
                    "data.format `{}` is not a clock-log format (ticc, timelab, rinex-clk, ptp4l, phc2sys, ts2phc, chrony-tracking, chrony-statistics)",
                    sub.data.format
                ));
                return;
            }
            let inp = ClockLogInput {
                format: sub.data.format.clone(),
                path: Some(path.display().to_string()),
                clock: sub.data.clock.clone(),
                channel: sub.data.channel.clone(),
                tau0_s: sub.data.tau0_s,
                units: sub.data.units.clone(),
                data: sub.data.data.clone(),
                gaps: Some("refuse".into()),
                ..ClockLogInput::default()
            };
            match read_input(&inp) {
                Err(e) => errors.push(format!("the clock log does not read: {e}")),
                Ok(p) => {
                    let span = p.tau0_s * (p.n_used.saturating_sub(1)) as f64;
                    info.push(format!(
                        "read as {} ({}): {} samples at {} s ({}), spanning {:.0} s; {} missing epochs in {} gaps; units in the log: {}",
                        p.format.name(),
                        p.data,
                        p.n_used,
                        p.tau0_s,
                        p.tau0_source,
                        span,
                        p.n_missing,
                        p.n_gaps,
                        p.unit_in
                    ));
                    if p.n_used < 1000 {
                        warnings.push(format!("only {} samples: too few for a stability estimate beyond the first few averaging times", p.n_used));
                    }
                    if span < 86_400.0 {
                        warnings.push(format!(
                            "the record spans {span:.0} s, under a day: floors and holdover figures need records of days, and a longer record is worth waiting for"
                        ));
                    }
                    if p.n_off_grid + p.n_duplicates > 0 {
                        warnings.push(format!(
                            "{} readings off the grid and {} duplicates were dropped",
                            p.n_off_grid, p.n_duplicates
                        ));
                    }
                }
            }
        }
        "imu" => {
            let fmt = match sub.data.format.as_str() {
                "csv" => ImuFormat::Csv,
                "euroc" => ImuFormat::Euroc,
                other => {
                    errors.push(format!(
                        "data.format `{other}` is not an IMU layout (csv, euroc)"
                    ));
                    return;
                }
            };
            let text = match std::str::from_utf8(bytes) {
                Ok(t) => t,
                Err(_) => {
                    errors.push("the IMU file is not UTF-8 text".into());
                    return;
                }
            };
            match read_imu(fmt, text) {
                Err(e) => errors.push(format!("the IMU file does not read: {e}")),
                Ok(s) => {
                    let span = s.last().map_or(0.0, |l| l.t_s) - s.first().map_or(0.0, |f| f.t_s);
                    info.push(format!(
                        "read {} IMU samples spanning {:.1} s",
                        s.len(),
                        span
                    ));
                    if s.len() < 2000 {
                        warnings.push(format!(
                            "only {} samples: `kshana imu-fit` refuses logs under 2000 samples",
                            s.len()
                        ));
                    }
                }
            }
        }
        _ => {}
    }
}

/// Read `path` as a submission and check it.
pub fn check_file(path: &Path) -> Result<Report, String> {
    let text = std::fs::read_to_string(path)
        .map_err(|e| format!("cannot read {}: {e}", path.display()))?;
    let name = path.display().to_string();
    let dir = path.parent().unwrap_or_else(|| Path::new("."));
    match toml::from_str::<Submission>(&text) {
        Ok(sub) => Ok(check(&sub, dir, &name)),
        // A file that does not parse is a finding, not a crash: say where and what.
        Err(e) => Ok(Report {
            submission: name,
            ok: false,
            errors: vec![format!(
                "the submission file does not parse as {SCHEMA}: {e}"
            )],
            warnings: Vec::new(),
            info: Vec::new(),
            targets: Vec::new(),
            statement: STATEMENT,
        }),
    }
}

/// `kshana partner ...`.
pub mod cli {
    use super::check_file;
    use std::path::Path;
    use std::process::ExitCode;

    const USAGE: &str = "usage: kshana partner check <submission.toml> [--json]
  Checks the format and the metadata of a data-partner submission (kshana.partner-submission/1) and reads its
  data file with the engine's own readers. It does not score or validate anything; see docs/PARTNER-DATA.md.
  Exit status 0: the submission is complete and readable; 1: errors were found; 2: usage.
Advisory software, not type-approved navigation equipment.";

    /// Run the subcommand with the arguments after `partner`.
    pub fn run(args: &[String]) -> ExitCode {
        if args.first().map(String::as_str) != Some("check") {
            eprintln!("{USAGE}");
            return ExitCode::from(2);
        }
        let json = args.iter().any(|a| a == "--json");
        let files: Vec<&String> = args[1..].iter().filter(|a| !a.starts_with("--")).collect();
        if files.len() != 1
            || args[1..]
                .iter()
                .any(|a| a.starts_with("--") && a != "--json")
        {
            eprintln!("{USAGE}");
            return ExitCode::from(2);
        }
        match check_file(Path::new(files[0])) {
            Err(e) => {
                eprintln!("error: {e}");
                ExitCode::from(2)
            }
            Ok(r) => {
                if json {
                    match serde_json::to_string_pretty(&r) {
                        Ok(s) => println!("{s}"),
                        Err(e) => {
                            eprintln!("error: {e}");
                            return ExitCode::from(2);
                        }
                    }
                } else {
                    print!("{}", r.to_text());
                }
                ExitCode::from(u8::from(!r.ok))
            }
        }
    }
}
