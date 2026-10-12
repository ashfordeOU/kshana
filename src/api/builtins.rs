// SPDX-License-Identifier: AGPL-3.0-only
//! Built-in kinds run through the [`Scenario`] trait (FUT-27).
//!
//! Each built-in kind is migrating out of the inline `match` in
//! [`super::run_builtin_kind`] and onto its own scenario type: the type implements
//! [`Scenario`] (the run itself, the body that used to sit in the match arm, moved
//! verbatim) and [`BuiltinKind`] (which kind it answers to, how it parses, and the
//! optional per-figure tier block). The match arm then shrinks to one line,
//! `run_builtin::<T>(src)`. The migration is behaviour-preserving: every output stays
//! byte-identical, guarded by the registry and cross-platform goldens and by the
//! whole-catalogue output manifest (`tests/scenario_output_manifest.rs`).
//!
//! The impls live here, in one file under `api`, rather than in the kind modules, so
//! a migration touches neither the kind's physics nor its public types, and the
//! private output helpers in [`super`] (`json_of_with_units`, `minimal_svg`, ...) stay
//! private.

use super::*;

/// A built-in scenario kind whose run lives on its own scenario type.
///
/// The contract, for every implementor:
///
/// * [`parse`](BuiltinKind::parse) produces exactly the error string the historical
///   inline arm produced (`invalid <kind> scenario: <toml error>` for most kinds; the
///   clock kind, for one, says `invalid scenario: ...`). Use [`parse_toml`].
/// * [`Scenario::run`] is the arm's body moved verbatim. A `String` error from inside
///   it is wrapped as [`KshanaError::InvalidInput`], whose `Display` passes the text
///   through unchanged, so the CLI and bindings see the same message as before.
/// * [`figure_tiers`](BuiltinKind::figure_tiers) is the per-figure verification-tier
///   seam (RM-04). The default emits nothing, so a kind's document does not move when
///   it migrates. A kind that overrides it returns the block for its own run; the
///   driver appends it as the document's LAST key with the same bytes the
///   `Documented` wrapper writes, so [`without_figure_tiers`] strips it back to the
///   untiered document exactly. A kind that already builds the block inside its run
///   (clock, orbit, hybrid, fusion) leaves this at the default; the driver refuses a
///   second block.
pub trait BuiltinKind: Scenario + Sized {
    /// The kind this type answers to.
    const KIND: ScenarioKind;

    /// Parse the scenario source into this type.
    fn parse(src: &str) -> Result<Self, String>;

    /// The `figure_tiers` block for this run, given its finished output; `None` (the
    /// default) when the kind emits none. See the trait docs for the contract.
    fn figure_tiers(&self, _out: &RunOutput) -> Result<Option<serde_json::Value>, String> {
        Ok(None)
    }
}

/// Deserialize a scenario from TOML, failing with the historical
/// `invalid <label> scenario: <error>` text. `label` is the word the inline arm used,
/// which is not always the kind's registry id.
pub(crate) fn parse_toml<T: serde::de::DeserializeOwned>(
    src: &str,
    label: &str,
) -> Result<T, String> {
    toml::from_str(src).map_err(|e| format!("invalid {label} scenario: {e}"))
}

/// Parse, run and (when the kind provides one) tier a built-in kind. This is the whole
/// body of a migrated arm in [`super::run_builtin_kind`].
pub(crate) fn run_builtin<T: BuiltinKind>(src: &str) -> Result<RunOutput, String> {
    let scn = T::parse(src)?;
    let mut out = <T as Scenario>::run(&scn).map_err(|e| e.to_string())?;
    if let Some(block) = scn.figure_tiers(&out)? {
        out.json = append_figure_tiers(&out.json, &block)?;
    }
    Ok(out)
}

/// `json` with `block` appended as its last key, `figure_tiers`, byte for byte as the
/// `Documented` wrapper would have serialised it: two-space pretty printing, the block
/// nested one level in. Fails on a document that is not a pretty-printed JSON object or
/// that already carries the block.
pub fn append_figure_tiers(json: &str, block: &serde_json::Value) -> Result<String, String> {
    if without_figure_tiers(json).is_some() {
        return Err(format!(
            "the result document already carries `{FIGURE_TIERS_KEY}`"
        ));
    }
    let body = json.trim_end();
    let head = body.strip_suffix("\n}").ok_or_else(|| {
        "figure_tiers: the result document is not a pretty JSON object".to_string()
    })?;
    let pretty = serde_json::to_string_pretty(block)
        .map_err(|e| format!("failed to serialise figure_tiers: {e}"))?;
    let nested = pretty.replace('\n', "\n  ");
    let mut out = String::with_capacity(json.len() + nested.len() + 32);
    out.push_str(head);
    out.push_str(",\n  \"");
    out.push_str(FIGURE_TIERS_KEY);
    out.push_str("\": ");
    out.push_str(&nested);
    out.push_str("\n}");
    out.push_str(&json[body.len()..]);
    Ok(out)
}

impl BuiltinKind for crate::jamming::JammingScenario {
    const KIND: ScenarioKind = ScenarioKind::Jamming;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "jamming")
    }
}

impl Scenario for crate::inertial::InertialScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        let scn = self;
        scn.time.validate()?;
        let r = crate::inertial::run_inertial(scn);
        let summary = format!(
            "scenario {} | quantum holdover {:.0}s p95 {:.2}m | classical holdover {:.0}s p95 {:.1}m",
            &r.scenario_hash[..12],
            r.quantum.fom.holdover_s, r.quantum.fom.pos_p95_m,
            r.classical.fom.holdover_s, r.classical.fom.pos_p95_m,
        );
        Ok(RunOutput {
            json: json_of_with_units(&r, crate::inertial::UNITS)?,
            svg: crate::inertial::to_svg(&r),
            summary,
            csv: None,
        })
    }
}

impl BuiltinKind for crate::inertial::InertialScenario {
    const KIND: ScenarioKind = ScenarioKind::Inertial;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "inertial")
    }
}

impl Scenario for crate::spoof::SpoofScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        let scn = self;
        scn.time.validate()?;
        let r = crate::spoof::run_spoof(scn);
        let det = |c: &crate::spoof::SpoofClock| {
            c.detect_time_s
                .map_or_else(|| "undetected".to_string(), |t| format!("detected {t:.0}s"))
        };
        let summary = format!(
            "scenario {} | spoof {:?} vs {:.3} ns spec (P_fa {:.3}) | quantum security {:.3} (P_md {:.3}, MC {:.3}) {} | classical security {:.3} (P_md {:.3}, MC {:.3}) {}",
            &r.scenario_hash[..12], scn.attack.resolved_shape(), r.threshold_ns, scn.attack.target_pfa,
            r.quantum.security_fom, r.quantum.detection.analytic_pmd, r.quantum.detection.mc_pmd, det(&r.quantum),
            r.classical.security_fom, r.classical.detection.analytic_pmd, r.classical.detection.mc_pmd, det(&r.classical),
        );
        Ok(RunOutput {
            json: json_of_with_units(&r, crate::spoof::UNITS)?,
            svg: crate::spoof::to_svg(&r),
            summary,
            csv: None,
        })
    }
}

impl BuiltinKind for crate::spoof::SpoofScenario {
    const KIND: ScenarioKind = ScenarioKind::Spoof;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "spoof")
    }
}

impl Scenario for crate::passes::PassesScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        let (json, summary) = self.run_json()?;
        let svg = minimal_svg(&summary);
        Ok(RunOutput {
            json,
            svg,
            summary,
            csv: None,
        })
    }
}

impl BuiltinKind for crate::passes::PassesScenario {
    const KIND: ScenarioKind = ScenarioKind::Passes;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "passes")
    }
}

impl Scenario for crate::linkbudget::LinkBudgetScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        let (json, summary) = self.run_json()?;
        let svg = minimal_svg(&summary);
        Ok(RunOutput {
            json,
            svg,
            summary,
            csv: None,
        })
    }
}

impl BuiltinKind for crate::linkbudget::LinkBudgetScenario {
    const KIND: ScenarioKind = ScenarioKind::LinkBudget;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "link-budget")
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    // The append is the exact inverse of the strip, and writes the same bytes the
    // `Documented` wrapper writes for a kind that builds its block inline.
    #[test]
    fn append_figure_tiers_matches_the_documented_wrapper_byte_for_byte() {
        let src = include_str!("../../scenarios/clock-holdover.toml");
        let tiered = run_toml(src).unwrap().json;
        let untiered = without_figure_tiers(&tiered).expect("clock emits figure_tiers");
        let doc: serde_json::Value = serde_json::from_str(&tiered).unwrap();
        let block = &doc[FIGURE_TIERS_KEY];
        assert_eq!(append_figure_tiers(&untiered, block).unwrap(), tiered);
        // A second block is refused rather than duplicated.
        assert!(append_figure_tiers(&tiered, block).is_err());
    }

    // Each migrated kind's KIND is the kind the classifier gives its own scenarios.
    #[test]
    fn migrated_kinds_declare_the_kind_they_answer_to() {
        assert_eq!(
            <crate::jamming::JammingScenario as BuiltinKind>::KIND.as_str(),
            "jamming"
        );
        assert_eq!(
            <crate::inertial::InertialScenario as BuiltinKind>::KIND.as_str(),
            "inertial"
        );
        assert_eq!(
            <crate::spoof::SpoofScenario as BuiltinKind>::KIND.as_str(),
            "spoof"
        );
        assert_eq!(
            <crate::passes::PassesScenario as BuiltinKind>::KIND.as_str(),
            "passes"
        );
        assert_eq!(
            <crate::linkbudget::LinkBudgetScenario as BuiltinKind>::KIND.as_str(),
            "link-budget"
        );
    }

    // The parse error text is the historical inline arm's, byte for byte.
    #[test]
    fn parse_errors_keep_the_historical_text() {
        let bad = "kind = \"inertial\"\nnot toml at all = = =";
        let e = <crate::inertial::InertialScenario as BuiltinKind>::parse(bad).unwrap_err();
        let old: Result<crate::inertial::InertialScenario, _> = toml::from_str(bad);
        assert_eq!(
            e,
            format!("invalid inertial scenario: {}", old.unwrap_err())
        );
    }
}
