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

use super::{Args, Fail};
use crate::iq::labfit::{resolve_paths, run_scenario, LabFitScenario};
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

    let out = run_scenario(&scenario).map_err(Fail::Run)?;

    let prefix = match a.get("--out-prefix") {
        Some(p) => PathBuf::from(p),
        None => path.with_extension(""),
    };
    let mut written = Vec::new();
    for (ext, body) in [
        ("labfit.json", &out.json),
        ("residuals.csv", &out.residuals_csv),
        ("predictions.csv", &out.predictions_csv),
        ("labfit.md", &out.markdown),
    ] {
        let target = PathBuf::from(format!("{}.{ext}", prefix.display()));
        std::fs::write(&target, body)
            .map_err(|e| Fail::Run(format!("cannot write {}: {e}", target.display())))?;
        written.push(target.display().to_string());
    }
    Ok(format!(
        "fitted {} run(s); wrote {}",
        scenario.runs.len(),
        written.join(", ")
    ))
}
