// SPDX-License-Identifier: AGPL-3.0-only
//! `kshana iq diagnose`: front-end diagnostics of a recording ([`crate::iq::frontdiag`]).
//!
//! Prints the diagnosis as JSON (English in every language: the document is read by programs).
//! With `--signal` and `--prn` the codes are acquired for the oscillator-offset and
//! clock-consistency check, with the acquisition flags of `kshana iq acquire`.

use super::acquire::{acq_config, codes_from_args};
use super::{open_input, Args, Fail};
use crate::iq::frontdiag::{diagnose, DiagConfig};
use crate::iq::SpreadingCode;

/// Run `kshana iq diagnose <args>`.
pub(crate) fn run(args: &[String]) -> Result<String, Fail> {
    let a = Args::parse(args, &[]).map_err(Fail::Usage)?;
    a.need_pos(1, "diagnose")?;
    let mut cfg = DiagConfig {
        max_seconds: a.num("--max-seconds").map_err(Fail::Usage)?,
        ..DiagConfig::default()
    };
    if let Some(v) = a.num("--block").map_err(Fail::Usage)? {
        cfg.block_s = v;
    }
    if let Some(v) = a.num("--gain-step-db").map_err(Fail::Usage)? {
        cfg.gain_step_db = v;
    }
    if let Some(v) = a.num("--step").map_err(Fail::Usage)? {
        cfg.step_s = v;
    }
    if let Some(v) = a.num("--steps").map_err(Fail::Usage)? {
        cfg.steps = v;
    }
    if let Some(v) = a.num("--max-sat-doppler").map_err(Fail::Usage)? {
        cfg.max_sat_doppler_hz = v;
    }
    if !(cfg.block_s > 0.0 && cfg.step_s > 0.0 && cfg.gain_step_db > 0.0) {
        return Err(Fail::Usage(crate::terr!("e-iq-frontdiag-positive")));
    }
    let codes = if a.get("--signal").is_some() || a.get("--prn").is_some() {
        codes_from_args(&a)?
    } else {
        Vec::new()
    };
    let acq = acq_config(&a, codes.first().map_or(1e-3, |c| c.period_s()))?;
    let mut opened = open_input(&a, 0)?;
    let refs: Vec<&dyn SpreadingCode> = codes.iter().map(|c| c as &dyn SpreadingCode).collect();
    // The document is read by programs: its fields and codes are the same in every language.
    let d = diagnose(opened.source.as_mut(), opened.format, &refs, &acq, &cfg)?;
    serde_json::to_string_pretty(&d).map_err(|e| Fail::Run(e.to_string()))
}
