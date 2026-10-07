// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana iq campaign` and `kshana iq conditions`: run a lab-replay campaign and check
//! test-condition files.
//!
//! * `iq campaign <campaign.toml> [--out <dir>] [--workers <n>] [--no-resume]
//!   [--max-cells <n>] [--dry-run] [--json <path>]` runs every pending cell of the
//!   campaign ([`crate::iq::campaign::runner`]) and rebuilds the scorecards, the HTML report
//!   and the digest. The output directory defaults to the campaign file's path with
//!   `.out` in place of its extension.
//! * `iq campaign report <out-dir>` rebuilds the scorecards, report and digest from the
//!   cells already in `<out-dir>`.
//! * `iq conditions <file>` validates a test-condition file and prints its resolved form
//!   and condition hash.

use super::{Args, Fail};
use crate::iq::campaign::{
    report, run as run_campaign, LoadedCampaign, RunOptions, TestConditions,
};
use std::path::{Path, PathBuf};

/// The default output directory of a campaign file.
fn default_out(campaign: &Path) -> PathBuf {
    campaign.with_extension("out")
}

/// Run `kshana iq campaign <args>`.
pub(crate) fn run(args: &[String]) -> Result<String, Fail> {
    let a = Args::parse(args, &["--no-resume", "--dry-run"]).map_err(Fail::Usage)?;
    if a.pos.first().map(String::as_str) == Some("report") {
        a.need_pos(2, "campaign report")?;
        let s = report::build(Path::new(&a.pos[1])).map_err(Fail::Run)?;
        return Ok(format!(
            "report rebuilt: {} of {} cell(s), {} row(s), {} failing a bar; digest {}",
            s.cells_present,
            s.cells_total,
            s.rows,
            s.rows_failed,
            s.digest.as_deref().unwrap_or("(incomplete)")
        ));
    }
    a.need_pos(1, "campaign")?;
    let path = Path::new(&a.pos[0]);
    let out = a
        .get("--out")
        .map(PathBuf::from)
        .unwrap_or_else(|| default_out(path));
    let opts = RunOptions {
        workers: a.num("--workers").map_err(Fail::Usage)?.unwrap_or(0),
        no_resume: a.has("--no-resume"),
        max_cells: a.num("--max-cells").map_err(Fail::Usage)?,
        dry_run: a.has("--dry-run"),
    };
    let c = LoadedCampaign::load(path).map_err(Fail::Usage)?;
    let s = run_campaign(&c, &out, &opts).map_err(Fail::Run)?;
    if let Some(p) = a.get("--json") {
        let text = serde_json::to_string_pretty(&s).unwrap_or_default();
        std::fs::write(p, text).map_err(|e| Fail::Run(format!("{p}: {e}")))?;
    }
    let mut msg = format!(
        "campaign {}: {} cell(s); {} already done, {} run now, {} failed, {} pending\noutput: {}",
        s.name,
        s.cells_total,
        s.cells_skipped,
        s.cells_run,
        s.cells_failed.len(),
        s.cells_pending,
        s.out_dir
    );
    if opts.dry_run {
        msg.push_str("\n(dry run: nothing was processed)");
    }
    match &s.digest {
        Some(d) => msg.push_str(&format!("\ndigest: {d}")),
        None if !opts.dry_run => msg.push_str("\ndigest: (incomplete; run again to resume)"),
        None => {}
    }
    if let Some((key, e)) = s.cells_failed.first() {
        return Err(Fail::Run(format!(
            "{msg}\nfirst failure ({}…): {e}",
            &key[..12.min(key.len())]
        )));
    }
    Ok(msg)
}

/// Run `kshana iq conditions <file>`.
pub(crate) fn conditions(args: &[String]) -> Result<String, Fail> {
    let a = Args::parse(args, &[]).map_err(Fail::Usage)?;
    a.need_pos(1, "conditions")?;
    let tc = TestConditions::load(Path::new(&a.pos[0])).map_err(Fail::Usage)?;
    let resolved = serde_json::to_string_pretty(&tc).unwrap_or_default();
    Ok(format!(
        "{resolved}\nOK: {} event(s), {} expected satellite(s); condition hash {}",
        tc.events.len(),
        tc.expected.iter().map(|g| g.ids.len()).sum::<usize>(),
        tc.hash()
    ))
}
