// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana iq labfit`: fit the tracking-loop loss-of-lock model to a receiver-trust
//! timeline described by a TOML scenario.
//!
//! The scenario names one or more lab runs (a receiver log plus its stated test
//! conditions); [`crate::iq::labfit::run_scenario`] loads each log, fits the loop and
//! empirical models, bootstraps the uncertainty and computes the hold-out error. The
//! command writes the four report forms next to the scenario (JSON, residual and prediction
//! CSVs, and markdown) and prints where they went. Relative log paths in the scenario are
//! resolved against the scenario file's own directory, as the `receiver-trust` CLI does.
//!
//! A scenario whose `[input]` names `campaign = "<out-dir>"` fits a `kshana iq campaign`
//! output folder instead ([`crate::iq::labfit::run_campaign_scenario`]); a relative folder is
//! resolved against the scenario file's directory too. That path writes
//! `<prefix>.labfit-iq.json`, `<prefix>.residuals.csv`, `<prefix>.predictions.csv` and
//! `<prefix>.labfit-iq.md`.

use super::{Args, Fail};
use crate::iq::labfit::{
    campaign_dir, resolve_paths, run_campaign_scenario, run_scenario, LabFitScenario,
};
use std::path::{Path, PathBuf};

/// Run `kshana iq labfit <args>`.
pub(crate) fn run(args: &[String]) -> Result<String, Fail> {
    let a = Args::parse(args, &[]).map_err(Fail::Usage)?;
    a.need_pos(1, "labfit")?;
    let path = Path::new(&a.pos[0]);

    let src = std::fs::read_to_string(path)
        .map_err(|e| Fail::Run(format!("cannot read {}: {e}", path.display())))?;
    let mut scenario: LabFitScenario =
        toml::from_str(&src).map_err(|e| Fail::Usage(format!("invalid labfit scenario: {e}")))?;
    let base = path.parent().map(PathBuf::from).unwrap_or_default();
    resolve_paths(&mut scenario, &base);

    let prefix = match a.get("--out-prefix") {
        Some(p) => PathBuf::from(p),
        None => path.with_extension(""),
    };
    if campaign_dir(&scenario).is_some() {
        return run_campaign(&scenario, &prefix);
    }

    let out = run_scenario(&scenario).map_err(Fail::Run)?;

    let written = write_all(
        &prefix,
        [
            ("labfit.json", &out.json),
            ("residuals.csv", &out.residuals_csv),
            ("predictions.csv", &out.predictions_csv),
            ("labfit.md", &out.markdown),
        ],
    )?;
    Ok(format!(
        "fitted {} run(s); wrote {}",
        scenario.runs.len(),
        written.join(", ")
    ))
}

/// The campaign path: fit the `kshana iq campaign` folder the scenario names and write the
/// four `labfit-iq` report forms under `prefix`.
fn run_campaign(scenario: &LabFitScenario, prefix: &Path) -> Result<String, Fail> {
    let out = run_campaign_scenario(scenario).map_err(Fail::Run)?;
    let written = write_all(
        prefix,
        [
            ("labfit-iq.json", &out.json),
            ("residuals.csv", &out.residuals_csv),
            ("predictions.csv", &out.predictions_csv),
            ("labfit-iq.md", &out.markdown),
        ],
    )?;
    Ok(format!(
        "fitted {} unit(s) from campaign; wrote {}",
        out.report.fit_units.len(),
        written.join(", ")
    ))
}

/// Write each `(extension, body)` to `<prefix>.<extension>`; the paths written, in order.
fn write_all(prefix: &Path, files: [(&str, &String); 4]) -> Result<Vec<String>, Fail> {
    let mut written = Vec::new();
    for (ext, body) in files {
        let target = PathBuf::from(format!("{}.{ext}", prefix.display()));
        std::fs::write(&target, body)
            .map_err(|e| Fail::Run(format!("cannot write {}: {e}", target.display())))?;
        written.push(target.display().to_string());
    }
    Ok(written)
}
