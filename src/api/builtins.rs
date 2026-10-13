// SPDX-License-Identifier: AGPL-3.0-only
//! Built-in kinds run through the [`Scenario`] trait (FUT-27).
//!
//! Every built-in kind but two has moved out of the inline `match` in
//! [`super::run_builtin_kind`] and onto its own scenario type: the type implements
//! [`Scenario`] (the run itself, the body that used to sit in the match arm, moved
//! verbatim) and [`BuiltinKind`] (which kind it answers to, how it parses, and the
//! optional per-figure tier block). The match arm is one line, `run_builtin::<T>(src)`.
//! The two exceptions: `campaign`, whose result hash is taken over the scenario's exact
//! source text, which a parsed value no longer carries, so it stays in the match; and
//! `fusion`, which parses the same type as `hybrid` (a type answers to one kind), so it
//! keeps its own driver, [`run_fusion_kind`], over the moved body. The migration is behaviour-preserving: every output stays
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

// ---- bulk migration (FUT-27): each arm body moved verbatim ----

fn run_integrity(scn: &crate::raim::IntegrityScenario) -> Result<RunOutput, String> {
    scn.time.validate()?;
    let n_sats = scn.all_satellites()?.len();
    let report = scn.run()?;
    let summary = format!(
        "integrity | {} satellites | {}/{} epochs available ({:.1}%) | HAL {:.0} m VAL {:.0} m | sigma {:.1} m | Stanford(V): {} integrity events, {} HMI",
        n_sats,
        report.samples_available,
        report.samples_total,
        report.availability() * 100.0,
        report.al_h_m,
        report.al_v_m,
        scn.sigma_uere_m,
        report.stanford.integrity_events(),
        report
            .stanford
            .count(crate::raim::StanfordRegion::HazardouslyMisleadingInformation),
    );
    let (_, sky) = scn.user_and_sky()?;
    let json = match crate::skyline::SkylineSummary::of(
        scn.skyline.as_ref(),
        sky.as_ref(),
        scn.mask_deg,
    ) {
        None => json_of_with_units(&report, crate::raim::UNITS)?,
        Some(skyline) => json_of_with_units(
            &crate::skyline::WithSkyline {
                report: &report,
                skyline,
            },
            &crate::skyline::with_units(true, &[crate::raim::UNITS]),
        )?,
    };
    Ok(RunOutput {
        json,
        svg: crate::raim::availability_svg(&report),
        summary,
        csv: None,
    })
}

impl Scenario for crate::raim::IntegrityScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_integrity(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::raim::IntegrityScenario {
    const KIND: ScenarioKind = ScenarioKind::Integrity;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "integrity")
    }
}

fn run_lunar_integrity(scn: &crate::lunar::LunarScenario) -> Result<RunOutput, String> {
    let report = scn.run();
    let summary = format!(
        "lunar-integrity | south pole | {}/{} epochs available ({:.1}%) | AL {:.0} m | σ_URE {:.0} m | HPL {:.0}–{:.0} m",
        report.samples_available,
        report.samples_total,
        report.availability() * 100.0,
        report.alert_limit_m,
        report.sigma_ure_m,
        report.min_hpl_m,
        report.max_hpl_m,
    );
    Ok(RunOutput {
        json: json_of_with_units(&report, crate::lunar::UNITS)?,
        svg: crate::lunar::lunar_report_svg(&report),
        summary,
        csv: None,
    })
}

impl Scenario for crate::lunar::LunarScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_integrity(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar::LunarScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarIntegrity;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-integrity")
    }
}

fn run_lunar_time(scn: &crate::lunar_time::LunarTimeScenario) -> Result<RunOutput, String> {
    let report = scn.run();
    let summary = format!(
        "lunar-time-offset | secular LTC−TT rate {:.2} µs/day (band {:.0}–{:.0}) | self-pot {:.2} kinetic {:.2} | offset @ {:.2} d = {:.2} µs",
        report.secular_rate_us_per_day,
        report.band_low,
        report.band_high,
        report.self_potential_us_per_day,
        report.kinetic_us_per_day,
        report.horizon_days,
        report.offset_at_horizon_us,
    );
    Ok(RunOutput {
        json: json_of_with_units(&report, crate::lunar_time::UNITS)?,
        svg: crate::lunar_time::lunar_time_svg(&report),
        summary,
        csv: None,
    })
}

impl Scenario for crate::lunar_time::LunarTimeScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_time(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar_time::LunarTimeScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarTime;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-time-offset")
    }
}

fn run_lunar_vlbi(scn: &crate::lunar_vlbi::LunarVlbiScenario) -> Result<RunOutput, String> {
    let report = scn.try_run()?;
    let summary = format!(
        "lunar-vlbi | baseline {:.0} km | beacon range {:.0} km | delay {:.3} µs (rate {:.3e} s/s) | near-field {:.1} µs | {} samples over {:.1} h",
        report.baseline_km,
        report.beacon_range_km,
        report.delay_s * 1e6,
        report.delay_rate_s_per_s,
        report.near_field_correction_us,
        report.samples,
        report.horizon_hours,
    );
    Ok(RunOutput {
        json: json_of_with_units(&report, crate::lunar_vlbi::UNITS)?,
        svg: crate::lunar_vlbi::lunar_vlbi_svg(&report),
        summary,
        csv: None,
    })
}

impl Scenario for crate::lunar_vlbi::LunarVlbiScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_vlbi(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar_vlbi::LunarVlbiScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarVlbi;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-vlbi")
    }
}

fn run_lunar_combination(
    scn: &crate::lunar_combination::LunarCombinationScenario,
) -> Result<RunOutput, String> {
    let report = scn.run();
    let summary = format!(
        "lunar-joint-od-clock | {} sats, {} Earth stations | station 3-D err with VLBI {:.2} m vs range-only {:.2} m ({:.1}× sharper) | sat pos RMS {:.2} m | station clk err {:.2e} s | obs {}/{} params",
        report.n_sat,
        report.n_earth,
        report.with_vlbi.station_pos_err_m,
        report.without_vlbi.station_pos_err_m,
        report.station_observability_improvement_factor,
        report.with_vlbi.sat_pos_rms_m,
        report.with_vlbi.station_clock_err_s,
        report.with_vlbi.n_obs,
        report.with_vlbi.n_params,
    );
    Ok(RunOutput {
        json: json_of_with_units(&report, crate::lunar_combination::UNITS)?,
        svg: crate::lunar_combination::lunar_combination_svg(&report),
        summary,
        csv: None,
    })
}

impl Scenario for crate::lunar_combination::LunarCombinationScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_combination(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar_combination::LunarCombinationScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarCombination;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-joint-od-clock")
    }
}

fn run_lunar_frame_realise(
    scn: &crate::lunar_frame_realise::LunarFrameRealiseScenario,
) -> Result<RunOutput, String> {
    let report = scn.run();
    let summary = format!(
        "lunar-frame-realisation | {} points | translation err {:.3e} m, rotation err {:.3e} rad, scale err {:.3e} ppb | rms residual {:.3} m | converged {}",
        report.n_points,
        report.trans_err_norm_m,
        report.rot_err_norm_rad,
        report.scale_err_ppb,
        report.rms_residual_m,
        report.converged,
    );
    Ok(RunOutput {
        json: json_of_with_units(&report, crate::lunar_frame_realise::UNITS)?,
        svg: crate::lunar_frame_realise::lunar_frame_realise_svg(&report),
        summary,
        csv: None,
    })
}

impl Scenario for crate::lunar_frame_realise::LunarFrameRealiseScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_frame_realise(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar_frame_realise::LunarFrameRealiseScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarFrameRealise;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-frame-realisation")
    }
}

fn run_lunar_service(
    scn: &crate::lunar_service::LunarServiceScenario,
) -> Result<RunOutput, String> {
    // `try_run` rather than `run`: with `ephemeris_path` set the scenario reads a
    // file, and a missing or malformed one must surface as a clean dispatch error
    // rather than a panic. With the path unset the two are identical.
    let report = scn.try_run()?;
    // The headline geometry is the illustrative set UNLESS a file supplied it, in
    // which case saying "illustrative LCNS-class" of it would be false. The
    // default wording is byte-unchanged.
    let geometry_label = match &report.ephemeris {
        None => "illustrative LCNS-class, not affiliated",
        Some(e) if e.provenance_class == "published-ephemeris" => {
            "retrieved ephemeris, published-ephemeris"
        }
        Some(_) => "retrieved constellation definition, published-elements",
    };
    let mut summary = format!(
        "moonlight-service-volume | {} sats ({geometry_label}) | {} pts × {} epochs | coverage {:.1}% (PDOP<{:.1}) | sats {}–{} | PDOP {:.2}/{:.2}/{:.2} | HPL {:.0}–{:.0} m | PL avail {:.1}% | MODELLED",
        report.n_sats,
        report.n_grid_points,
        report.n_epochs,
        report.coverage_pct,
        report.pdop_threshold,
        report.min_sats,
        report.max_sats,
        report.pdop_min,
        report.pdop_mean,
        report.pdop_max,
        report.hpl_min_m,
        report.hpl_max_m,
        report.pl_availability_pct,
    );
    // Appended only when `ephemeris_path` named a file, so the default summary
    // line is unchanged: the sigma requirement under the retrieved geometry and
    // the one it is reported beside, never in place of.
    if let Some(c) = &report.ephemeris_comparison {
        let fmt = |v: Option<f64>| match v {
            Some(x) => format!("{x:.4} m"),
            None => "n/a".to_string(),
        };
        summary.push_str(&format!(
            " | ephemeris {} ({}) σ_URE required {} vs Keplerian {} vs perturbed {} (Δ {})",
            report
                .ephemeris
                .as_ref()
                .map(|e| e.name.as_str())
                .unwrap_or(""),
            c.ephemeris.provenance,
            fmt(c.ephemeris.sigma_required_m),
            fmt(c.keplerian.sigma_required_m),
            fmt(c.perturbed.sigma_required_m),
            fmt(c.sigma_requirement_delta_vs_keplerian_m),
        ));
    }
    // G11: publish the per-satellite geometry as a long-form runtime artifact.
    // It is the largest array the crate emits — 2304 rows in the released joint
    // communications-and-navigation table — and reached consumers only inside
    // JSON, the shape that silently truncated a sibling scenario's curve.
    // `None` unless an export site was configured, so the default run is
    // byte-unchanged and no empty file is written.
    let csv = report.per_sat_geometry_csv();
    Ok(RunOutput {
        json: json_of_with_units(&report, crate::lunar_service::UNITS)?,
        svg: crate::lunar_service::lunar_service_svg(&report),
        summary,
        csv,
    })
}

impl Scenario for crate::lunar_service::LunarServiceScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_service(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar_service::LunarServiceScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarService;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "moonlight-service-volume")
    }
}

fn run_lunar_dpnt(scn: &crate::lunar_dpnt::LunarDpntScenario) -> Result<RunOutput, String> {
    let report = scn.run();
    let summary = format!(
        "lunar-differential-pnt | {} sats (illustrative LCNS-class, not affiliated) | baseline {:.0} km | user error {:.2} m → {:.4} m ({:.0}× reduction) | HPL {:.1} m (σ_resid {:.1} m) | MODELLED",
        report.n_sats,
        report.baseline_km,
        report.user_error_uncorrected_m,
        report.user_error_corrected_m,
        report.reduction_factor,
        report.protection_level_m,
        report.residual_sigma_m,
    );
    Ok(RunOutput {
        json: json_of(&report)?,
        svg: crate::lunar_dpnt::lunar_dpnt_svg(&report),
        summary,
        csv: None,
    })
}

impl Scenario for crate::lunar_dpnt::LunarDpntScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_dpnt(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar_dpnt::LunarDpntScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarDpnt;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-differential-pnt")
    }
}

fn run_lunar_station_coverage(
    scn: &crate::lunar_station::LunarStationCoverageScenario,
) -> Result<RunOutput, String> {
    let report = scn.run()?;
    let f = |v: Option<f64>| v.map_or("n/a".to_string(), |v| format!("{v:.3} m"));
    let summary = format!(
        "lunar-station-coverage | {} points x {} epochs x {} trials | availability {:.1} % | coverage {:.1} % (p{:.0} <= {} m) | corrected p{:.0} 3-D {} (uncorrected {}) | HPL max {} | MODELLED; not a statement about any real system",
        report.n_grid_points,
        report.n_epochs,
        report.n_trials,
        100.0 * report.region.availability,
        100.0 * report.region.coverage_fraction,
        report.percentile,
        report.inputs_echo.accuracy_threshold_m,
        report.percentile,
        f(report.region.corrected_p_3d_m),
        f(report.region.uncorrected_p_3d_m),
        f(report.region.hpl_max_m),
    );
    Ok(RunOutput {
        json: json_of_with_units(&report, crate::lunar_station::UNITS)?,
        svg: crate::lunar_station::lunar_station_coverage_svg(&report),
        summary,
        csv: None,
    })
}

impl Scenario for crate::lunar_station::LunarStationCoverageScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_station_coverage(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar_station::LunarStationCoverageScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarStationCoverage;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-station-coverage")
    }
}

fn run_lunar_interop(
    scn: &crate::lunar_interop::LunarInteropScenario,
) -> Result<RunOutput, String> {
    let report = scn.run();
    let summary = format!(
        "lunar-interop-export | REF_FRAME {} / TIME_SYSTEM {} | {} states, OEM {} lines | conformance {} ({} present / {} missing) | OEM round-trip {} | time-meta round-trip {} | KIF {} bytes | MODELLED",
        report.frame,
        report.time_system,
        report.n_states,
        report.oem_line_count,
        if report.conformance.pass { "PASS" } else { "FAIL" },
        report.conformance.present_fields.len(),
        report.conformance.missing_fields.len(),
        if report.oem_roundtrip_ok { "ok" } else { "fail" },
        if report.time_metadata_roundtrip_ok { "ok" } else { "fail" },
        report.kif_bytes,
    );
    Ok(RunOutput {
        json: json_of_with_units(&report, crate::lunar_interop::UNITS)?,
        svg: crate::lunar_interop::lunar_interop_svg(&report),
        summary,
        csv: None,
    })
}

impl Scenario for crate::lunar_interop::LunarInteropScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_interop(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar_interop::LunarInteropScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarInterop;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-interop-export")
    }
}

fn run_time_transfer(scn: &crate::timetransfer::TimeTransferScenario) -> Result<RunOutput, String> {
    let r = crate::timetransfer::run_timetransfer(scn);
    let summary = format!(
        "scenario {} | optical sync_rms {:.2}ps range_rms {:.3}mm adev(1s) {:.2e} | RF sync_rms {:.1}ps range_rms {:.1}mm adev(1s) {:.2e}",
        &r.scenario_hash[..12],
        r.quantum.fom.sync_rms_ps, r.quantum.fom.range_rms_mm, r.quantum.fom.adev_tau0,
        r.classical.fom.sync_rms_ps, r.classical.fom.range_rms_mm, r.classical.fom.adev_tau0,
    );
    Ok(RunOutput {
        json: json_of_with_units(&r, crate::timetransfer::UNITS)?,
        svg: crate::timetransfer::to_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::timetransfer::TimeTransferScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_time_transfer(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::timetransfer::TimeTransferScenario {
    const KIND: ScenarioKind = ScenarioKind::TimeTransfer;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "time-transfer")
    }
}

fn run_quantum_time_transfer(
    scn: &crate::timetransfer_chain::QuantumTimeTransferScenario,
) -> Result<RunOutput, String> {
    let r = scn.run();
    let summary = format!(
        "quantum-time-transfer | quantum chain {:.3e}s vs classical {:.3e}s | PL {:.2} ns | security Pd {:.3} (Pfa {:.0e}) | anomaly Pd {:.3} | trade quantum wins {}/{} | MODELLED",
        r.quantum_chain_sigma_s,
        r.classical_chain_sigma_s,
        r.protection_level_ns,
        r.security_pd,
        r.monitor_pfa,
        r.anomaly_pd,
        r.trade.quantum_wins(),
        r.trade.foms.len(),
    );
    Ok(RunOutput {
        json: json_of_with_units(&r, crate::timetransfer_chain::UNITS)?,
        svg: crate::timetransfer_chain::to_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::timetransfer_chain::QuantumTimeTransferScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_quantum_time_transfer(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::timetransfer_chain::QuantumTimeTransferScenario {
    const KIND: ScenarioKind = ScenarioKind::QuantumTimeTransfer;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "quantum-time-transfer")
    }
}

fn run_quantum_gnss_free_nav(
    scn: &crate::quantum_nav_od::QuantumNavOdScenario,
) -> Result<RunOutput, String> {
    let r = scn.run();
    let summary = format!(
        "quantum-gnss-free-nav | outage {:.0}s | quantum pos err {:.2} m vs classical {:.2} m ({:.1}x) | holdover quantum {:.0}s vs classical {:.0}s (thr {:.0} m) | trade quantum wins {}/{} | MODELLED",
        r.outage_s,
        r.quantum_pos_err_m,
        r.classical_pos_err_m,
        r.improvement_x,
        r.quantum_holdover_s,
        r.classical_holdover_s,
        r.threshold_m,
        r.trade.quantum_wins(),
        r.trade.foms.len(),
    );
    Ok(RunOutput {
        json: json_of_with_units(&r, crate::quantum_nav_od::UNITS)?,
        svg: crate::quantum_nav_od::to_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::quantum_nav_od::QuantumNavOdScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_quantum_gnss_free_nav(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::quantum_nav_od::QuantumNavOdScenario {
    const KIND: ScenarioKind = ScenarioKind::QuantumGnssFreeNav;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "quantum-gnss-free-nav")
    }
}

fn run_quantum_anomaly_detect(
    scn: &crate::quantum_faults::QuantumAnomalyScenario,
) -> Result<RunOutput, String> {
    let r = scn.run();
    let summary = format!(
        "quantum-anomaly-detect | AUC quantum {:.4} vs classical {:.4} | min-detectable fault quantum {:.3} vs classical {:.3} | {} fault classes | trade quantum wins {}/{} | MODELLED",
        r.quantum_auc,
        r.classical_auc,
        r.quantum_min_detectable,
        r.classical_min_detectable,
        r.fault_catalog.len(),
        r.trade.quantum_wins(),
        r.trade.foms.len(),
    );
    Ok(RunOutput {
        json: json_of_with_units(&r, crate::quantum_faults::UNITS)?,
        svg: crate::quantum_faults::to_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::quantum_faults::QuantumAnomalyScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_quantum_anomaly_detect(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::quantum_faults::QuantumAnomalyScenario {
    const KIND: ScenarioKind = ScenarioKind::QuantumAnomalyDetect;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "quantum-anomaly-detect")
    }
}

fn run_hybrid(scn: &crate::hybrid::HybridScenario) -> Result<RunOutput, String> {
    scn.time.validate()?;
    let r = crate::hybrid::run_hybrid(scn);
    let summary = format!(
        "scenario {} | quantum PNT-holdover {:.0}s (t {:.0}s/p {:.0}s) integrity {} security {} | classical PNT-holdover {:.0}s (t {:.0}s/p {:.0}s) integrity {} security {}",
        &r.scenario_hash[..12],
        r.quantum.fom.pnt_holdover_s, r.quantum.fom.timing_holdover_s, r.quantum.fom.position_holdover_s, integ(r.quantum.fom.integrity), SECURITY_NA,
        r.classical.fom.pnt_holdover_s, r.classical.fom.timing_holdover_s, r.classical.fom.position_holdover_s, integ(r.classical.fom.integrity), SECURITY_NA,
    );
    Ok(RunOutput {
        json: json_of_with_units_and_tiers(
            &r,
            crate::hybrid::UNITS,
            &["quantum.fom", "classical.fom"],
            crate::fom_label::HYBRID_FOM_FIELDS,
        )?,
        svg: crate::hybrid::to_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::hybrid::HybridScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_hybrid(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::hybrid::HybridScenario {
    const KIND: ScenarioKind = ScenarioKind::Hybrid;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "hybrid")
    }
}

fn run_fusion(scn: &crate::hybrid::HybridScenario) -> Result<RunOutput, String> {
    scn.time.validate()?;
    let r = crate::fusion::run_fusion(scn);
    let summary = format!(
        "scenario {} | fused | quantum PNT-holdover {:.0}s (t {:.0}s/p {:.0}s) integrity {} security {} | classical PNT-holdover {:.0}s (t {:.0}s/p {:.0}s) integrity {} security {}",
        &r.scenario_hash[..12],
        r.quantum.fom.pnt_holdover_s, r.quantum.fom.timing_holdover_s, r.quantum.fom.position_holdover_s, integ(r.quantum.fom.integrity), SECURITY_NA,
        r.classical.fom.pnt_holdover_s, r.classical.fom.timing_holdover_s, r.classical.fom.position_holdover_s, integ(r.classical.fom.integrity), SECURITY_NA,
    );
    Ok(RunOutput {
        json: json_of_with_units_and_tiers(
            &r,
            crate::fusion::UNITS,
            &["quantum.fom", "classical.fom"],
            crate::fom_label::HYBRID_FOM_FIELDS,
        )?,
        svg: crate::hybrid::to_svg(&r),
        summary,
        csv: None,
    })
}

/// `fusion` parses the same scenario type as `hybrid`, and a type answers to one kind
/// through [`BuiltinKind`], so this arm keeps its own driver: the same parse error text
/// and the same moved body, without the trait.
pub(crate) fn run_fusion_kind(src: &str) -> Result<RunOutput, String> {
    let scn: crate::hybrid::HybridScenario = parse_toml(src, "fusion")?;
    run_fusion(&scn)
}

fn run_hybrid_ukf(scn: &crate::fusion::hybrid_ukf::HybridUkfScenario) -> Result<RunOutput, String> {
    scn.time.validate()?;
    let r = crate::fusion::hybrid_ukf::run_hybrid_ukf(scn);
    let c = &r.consistency;
    let summary = format!(
        "scenario {} | hybrid-ukf (17-state, MODELLED) | sensor {} (q_va {:.2e}) | clock q_wf {:.2e} q_rw {:.2e} | NIS {:.2}/{} in [{:.2},{:.2}] | NEES {:.2}/{} in [{:.2},{:.2}] | {} | aided {:.1}m -> coast {:.1}m over {:.0}s | self-consistency, not accuracy",
        &r.scenario_hash[..12],
        if r.quantum_cai { "quantum-CAI" } else { "classical" },
        r.effective_q_va,
        r.clock_q_wf, r.clock_q_rw,
        c.nis_mean, c.nis_dof, c.nis_chi2_lower_95, c.nis_chi2_upper_95,
        c.nees_mean, c.nees_dof, c.nees_chi2_lower_95, c.nees_chi2_upper_95,
        if c.consistent { "CONSISTENT" } else { "INCONSISTENT" },
        r.coast.aided_pos_rms_m, r.coast.coast_end_pos_rms_m, r.coast.coast_duration_s,
    );
    Ok(RunOutput {
        json: json_of_with_units(&r, crate::fusion::hybrid_ukf::UNITS)?,
        svg: crate::fusion::hybrid_ukf::to_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::fusion::hybrid_ukf::HybridUkfScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_hybrid_ukf(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::fusion::hybrid_ukf::HybridUkfScenario {
    const KIND: ScenarioKind = ScenarioKind::HybridUkf;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "hybrid-ukf")
    }
}

fn run_gnss_ins(scn: &crate::fusion::pack::GnssInsScenario) -> Result<RunOutput, String> {
    scn.time.validate()?;
    scn.validate()?;
    let r = crate::fusion::pack::run_gnss_ins(scn);
    let summary = format!(
        "scenario {} | gnss-ins | quantum outage-RMS fused {:.1}m vs free {:.1}m (hold {:.0}s, avail {:.2}) | classical fused {:.1}m vs free {:.1}m (hold {:.0}s, avail {:.2})",
        &r.scenario_hash[..12],
        r.quantum.fused_outage_rms_m, r.quantum.free_outage_rms_m, r.quantum.fom.holdover_s, r.quantum.fom.availability,
        r.classical.fused_outage_rms_m, r.classical.free_outage_rms_m, r.classical.fom.holdover_s, r.classical.fom.availability,
    );
    Ok(RunOutput {
        json: json_of_with_units(&r, crate::fusion::pack::UNITS)?,
        svg: crate::fusion::pack::to_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::fusion::pack::GnssInsScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_gnss_ins(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::fusion::pack::GnssInsScenario {
    const KIND: ScenarioKind = ScenarioKind::GnssIns;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "gnss-ins")
    }
}

fn run_gnss_sim(scn: &crate::gnss_sim::GnssSimScenario) -> Result<RunOutput, String> {
    scn.time.validate()?;
    let (alert_h, alert_v) = (scn.alert_limit_h_m, scn.alert_limit_v_m);
    let sky = scn.sky()?;
    let r = crate::gnss_sim::run_gnss_sim_sky(scn, sky.as_ref());
    let summary = format!(
        "scenario {} | gnss-sim | mean iono {:.1}m tropo {:.1}m | RAIM avail {:.2} mean HPL {:.1}m VPL {:.1}m fault-rate {:.3}",
        &r.scenario_hash[..12],
        r.fom.mean_iono_m, r.fom.mean_tropo_m,
        r.fom.raim_availability, r.fom.mean_hpl_m, r.fom.mean_vpl_m, r.fom.fault_rate,
    );
    let json = match crate::skyline::SkylineSummary::of(
        scn.skyline.as_ref(),
        sky.as_ref(),
        scn.mask_deg,
    ) {
        None => json_of_with_units(&r, crate::gnss_sim::UNITS)?,
        Some(skyline) => json_of_with_units(
            &crate::skyline::WithSkyline {
                report: &r,
                skyline,
            },
            &crate::skyline::with_units(true, &[crate::gnss_sim::UNITS]),
        )?,
    };
    Ok(RunOutput {
        json,
        svg: crate::gnss_sim::to_svg(&r, alert_h, alert_v),
        summary,
        csv: None,
    })
}

impl Scenario for crate::gnss_sim::GnssSimScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_gnss_sim(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::gnss_sim::GnssSimScenario {
    const KIND: ScenarioKind = ScenarioKind::GnssSim;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "gnss-sim")
    }
}

fn run_spoof_detect(scn: &crate::spoof_detect::SpoofDetectScenario) -> Result<RunOutput, String> {
    let r = crate::spoof_detect::run_spoof_detect(scn);
    let summary = format!(
        "scenario {} | spoof-detect | {} SVs, +{:.1} dB{} | {:?} push | fused score {:.2} (thr {:.2}) | {}",
        &r.scenario_hash[..12],
        r.n_sats,
        r.attack.power_advantage_db,
        if r.attack.carrier_aligned { ", carrier-aligned" } else { "" },
        r.attack.push,
        r.decision.fused.score,
        scn.detector.fusion_threshold,
        r.verdict,
    );
    Ok(RunOutput {
        json: json_of_with_units(&r, crate::spoof_detect::UNITS)?,
        svg: crate::spoof_detect::to_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::spoof_detect::SpoofDetectScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_spoof_detect(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::spoof_detect::SpoofDetectScenario {
    const KIND: ScenarioKind = ScenarioKind::SpoofDetect;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "spoof-detect")
    }
}

fn run_sweep(scn: &crate::sweep::SweepScenario) -> Result<RunOutput, String> {
    scn.base.time.validate()?;
    let r = crate::sweep::run_sweep(scn)?;
    let (first, last) = (r.points.first(), r.points.last());
    let summary = format!(
        "sweep {} over {} ({:.2e}..{:.2e}, {} pts, {} scale) | quantum {:.3}->{:.3} | classical {:.3}->{:.3}",
        r.metric, r.parameter,
        first.map_or(0.0, |p| p.value), last.map_or(0.0, |p| p.value), r.points.len(), r.scale,
        first.map_or(0.0, |p| p.quantum), last.map_or(0.0, |p| p.quantum),
        first.map_or(0.0, |p| p.classical), last.map_or(0.0, |p| p.classical),
    );
    Ok(RunOutput {
        json: json_of_with_units(&r, &crate::sweep::units(&r.parameter, &r.metric))?,
        svg: crate::sweep::to_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::sweep::SweepScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_sweep(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::sweep::SweepScenario {
    const KIND: ScenarioKind = ScenarioKind::Sweep;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "sweep")
    }
}

fn run_orbit(scn: &crate::orbit::OrbitClockScenario) -> Result<RunOutput, String> {
    scn.time.validate()?;
    let r = crate::run::run_orbit_clock(scn)?;
    let sats = scn.all_satellites()?;
    let (user, sky) = scn.user_and_sky_for(&sats)?;
    let geometry = crate::orbit::summarize_dop_at(
        &user,
        &sats,
        scn.time.step_s,
        scn.time.duration_s,
        scn.mask_deg,
        sky.as_ref(),
        scn.sigma_uere_m,
    );
    let skyline =
        crate::skyline::SkylineSummary::of(scn.skyline.as_ref(), sky.as_ref(), scn.mask_deg);
    let has_skyline = skyline.is_some();
    let nominal = r
        .quantum
        .series
        .iter()
        .filter(|s| s.gnss == GnssState::Nominal)
        .count();
    let summary = format!(
        "scenario {} | {}/{} samples GNSS-nominal | best PDOP {} pos {} | quantum holdover {:.0}s p95 {}ns integrity {} security {} | classical holdover {:.0}s p95 {}ns integrity {} security {}",
        &r.scenario_hash[..12],
        nominal, r.quantum.series.len(),
        fnum(geometry.best_pdop), posm(geometry.best_position_sigma_m),
        r.quantum.fom.holdover_s, ns1(r.quantum.fom.timing_p95_ns), integ(r.quantum.fom.integrity), SECURITY_NA,
        r.classical.fom.holdover_s, ns1(r.classical.fom.timing_p95_ns), integ(r.classical.fom.integrity), SECURITY_NA,
    );
    #[derive(serde::Serialize)]
    struct OrbitOutput<'a> {
        #[serde(flatten)]
        run: &'a crate::report::RunResult,
        geometry: crate::orbit::DopSummary,
        #[serde(skip_serializing_if = "Option::is_none")]
        skyline: Option<crate::skyline::SkylineSummary>,
    }
    Ok(RunOutput {
        json: json_of_with_units_and_tiers(
            &OrbitOutput {
                run: &r,
                geometry,
                skyline,
            },
            &crate::skyline::with_units(has_skyline, &[crate::orbit::UNITS, crate::report::UNITS]),
            &["quantum.fom", "classical.fom"],
            crate::fom_label::CLOCK_FOM_FIELDS,
        )?,
        svg: crate::report::to_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::orbit::OrbitClockScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_orbit(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::orbit::OrbitClockScenario {
    const KIND: ScenarioKind = ScenarioKind::Orbit;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "orbit")
    }
}

fn run_ephemeris(scn: &crate::ephemeris::EphemerisScenario) -> Result<RunOutput, String> {
    let r = crate::ephemeris::run_ephemeris(scn).map_err(|e| format!("ephemeris: {e}"))?;
    let pass = match (r.max_elevation_deg, r.peak_doppler_hz) {
        (Some(el), Some(d)) => {
            format!(" | max el {el:.1}° peak Doppler {:.1} kHz", d / 1000.0)
        }
        _ => String::new(),
    };
    let summary = format!(
        "scenario {} | {} | {} samples | alt {:.0}–{:.0} km | |lat| ≤ {:.1}° | speed {:.0}–{:.0} m/s{}",
        &r.scenario_hash[..12],
        r.source,
        r.n_samples,
        r.alt_min_km,
        r.alt_max_km,
        r.lat_max_deg.abs().max(r.lat_min_deg.abs()),
        r.speed_min_m_s,
        r.speed_max_m_s,
        pass,
    );
    Ok(RunOutput {
        json: json_of_with_units(&r, crate::ephemeris::UNITS)?,
        svg: crate::ephemeris::to_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::ephemeris::EphemerisScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_ephemeris(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::ephemeris::EphemerisScenario {
    const KIND: ScenarioKind = ScenarioKind::Ephemeris;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "ephemeris")
    }
}

fn run_pvt(scn: &crate::pvt::PvtScenario) -> Result<RunOutput, String> {
    let r = crate::pvt::run_pvt(scn)?;
    let summary = crate::pvt::summary(&r);
    Ok(RunOutput {
        json: json_of_with_units(&r, crate::pvt::UNITS)?,
        svg: crate::pvt::pvt_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::pvt::PvtScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_pvt(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::pvt::PvtScenario {
    const KIND: ScenarioKind = ScenarioKind::Pvt;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "pvt")
    }
}

fn run_mars_pnt(scn: &crate::mars_pnt::MarsScenario) -> Result<RunOutput, String> {
    let r = crate::mars_pnt::run_mars_pnt(scn)?;
    let summary = crate::mars_pnt::summary(&r);
    Ok(RunOutput {
        json: json_of_with_units(&r, crate::mars_pnt::UNITS)?,
        svg: crate::mars_pnt::to_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::mars_pnt::MarsScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_mars_pnt(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::mars_pnt::MarsScenario {
    const KIND: ScenarioKind = ScenarioKind::MarsPnt;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "mars-pnt")
    }
}

fn run_impairment_eval(
    scn: &crate::impairment_eval::ImpairmentEvalScenario,
) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::impairment_eval::ImpairmentEvalScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_impairment_eval(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::impairment_eval::ImpairmentEvalScenario {
    const KIND: ScenarioKind = ScenarioKind::ImpairmentEval;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "impairment-eval")
    }
}

fn run_quantum_trade(
    scn: &crate::quantum_trade::QuantumTradeScenario,
) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::quantum_trade::QuantumTradeScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_quantum_trade(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::quantum_trade::QuantumTradeScenario {
    const KIND: ScenarioKind = ScenarioKind::QuantumTrade;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "quantum-trade")
    }
}

fn run_space_weather(
    scn: &crate::space_weather::SpaceWeatherScenario,
) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::space_weather::SpaceWeatherScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_space_weather(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::space_weather::SpaceWeatherScenario {
    const KIND: ScenarioKind = ScenarioKind::SpaceWeather;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "space-weather")
    }
}

fn run_oem_interop(scn: &crate::oem::OemInteropScenario) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::oem::OemInteropScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_oem_interop(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::oem::OemInteropScenario {
    const KIND: ScenarioKind = ScenarioKind::OemInterop;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "oem-interop")
    }
}

fn run_launch_window(scn: &crate::launch::LaunchWindowScenario) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::launch::LaunchWindowScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_launch_window(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::launch::LaunchWindowScenario {
    const KIND: ScenarioKind = ScenarioKind::LaunchWindow;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "launch-window")
    }
}

fn run_reentry(scn: &crate::reentry::ReentryScenario) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::reentry::ReentryScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_reentry(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::reentry::ReentryScenario {
    const KIND: ScenarioKind = ScenarioKind::Reentry;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "reentry")
    }
}

fn run_eo_coverage(scn: &crate::eo_payload::EoCoverageScenario) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::eo_payload::EoCoverageScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_eo_coverage(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::eo_payload::EoCoverageScenario {
    const KIND: ScenarioKind = ScenarioKind::EoCoverage;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "eo-coverage")
    }
}

fn run_space_packet(scn: &crate::space_packet::SpacePacketScenario) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::space_packet::SpacePacketScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_space_packet(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::space_packet::SpacePacketScenario {
    const KIND: ScenarioKind = ScenarioKind::SpacePacket;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "space-packet")
    }
}

fn run_attitude_budget(
    scn: &crate::attitude_budget::AttitudeBudgetScenario,
) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::attitude_budget::AttitudeBudgetScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_attitude_budget(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::attitude_budget::AttitudeBudgetScenario {
    const KIND: ScenarioKind = ScenarioKind::AttitudeBudget;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "attitude-budget")
    }
}

fn run_lunar_time_budget(
    scn: &crate::lunar_time_budget_scenario::LunarTimeBudgetScenario,
) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    // G11: publish the long-form (tau, term) budget table as a runtime artifact.
    // The array-valued fields previously reached consumers only as JSON arrays,
    // which is how a released table came to publish 23 of its 57 averaging times.
    let csv = Some(scn.to_csv()?);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv,
    })
}

impl Scenario for crate::lunar_time_budget_scenario::LunarTimeBudgetScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_time_budget(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar_time_budget_scenario::LunarTimeBudgetScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarTimeBudget;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-time-budget")
    }
}

fn run_realtime_frame_eop(
    scn: &crate::realtime_frame_eop::RealtimeFrameEopScenario,
) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    // G4: publish the P4 Table 1 + Table 2 reproducibility CSV as a runtime
    // artifact, so a plain scenario run produces the file the paper cites (not
    // only the #[ignore] golden-regen test).
    let csv = Some(scn.to_csv()?);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv,
    })
}

impl Scenario for crate::realtime_frame_eop::RealtimeFrameEopScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_realtime_frame_eop(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::realtime_frame_eop::RealtimeFrameEopScenario {
    const KIND: ScenarioKind = ScenarioKind::RealtimeFrameEop;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "realtime-frame-eop")
    }
}

fn run_hybrid_optical_rf(
    scn: &crate::hybrid_integrity::HybridOpticalRfScenario,
) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::hybrid_integrity::HybridOpticalRfScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_hybrid_optical_rf(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::hybrid_integrity::HybridOpticalRfScenario {
    const KIND: ScenarioKind = ScenarioKind::HybridOpticalRf;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "hybrid-optical-rf")
    }
}

fn run_cislunar_observability(
    scn: &crate::cislunar_observability::CislunarObservabilityScenario,
) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::cislunar_observability::CislunarObservabilityScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_cislunar_observability(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::cislunar_observability::CislunarObservabilityScenario {
    const KIND: ScenarioKind = ScenarioKind::CislunarObservability;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "cislunar-observability")
    }
}

fn run_cislunar_arc_recovery(
    scn: &crate::cislunar_arc_recovery::CislunarArcRecoveryScenario,
) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::cislunar_arc_recovery::CislunarArcRecoveryScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_cislunar_arc_recovery(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::cislunar_arc_recovery::CislunarArcRecoveryScenario {
    const KIND: ScenarioKind = ScenarioKind::CislunarArcRecovery;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "cislunar-arc-recovery")
    }
}

fn run_earth_gnss_lunar(
    scn: &crate::earth_gnss_lunar::EarthGnssLunarScenario,
) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::earth_gnss_lunar::EarthGnssLunarScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_earth_gnss_lunar(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::earth_gnss_lunar::EarthGnssLunarScenario {
    const KIND: ScenarioKind = ScenarioKind::EarthGnssLunar;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "earth-gnss-lunar")
    }
}

fn run_lunar_beacon(scn: &crate::lunar_beacon::LunarBeaconScenario) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::lunar_beacon::LunarBeaconScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_beacon(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar_beacon::LunarBeaconScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarBeacon;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-beacon")
    }
}

fn run_conflict_resilience(
    scn: &crate::conflict_resilience::ConflictResilienceScenario,
) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::conflict_resilience::ConflictResilienceScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_conflict_resilience(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::conflict_resilience::ConflictResilienceScenario {
    const KIND: ScenarioKind = ScenarioKind::ConflictResilience;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "conflict-resilience")
    }
}

fn run_lunar_attack_surface(
    scn: &crate::attack_surface::LunarAttackSurfaceScenario,
) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::attack_surface::LunarAttackSurfaceScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_attack_surface(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::attack_surface::LunarAttackSurfaceScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarAttackSurface;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-attack-surface")
    }
}

fn run_aperture_duty_cycle(
    scn: &crate::aperture_duty::ApertureDutyCycleScenario,
) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::aperture_duty::ApertureDutyCycleScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_aperture_duty_cycle(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::aperture_duty::ApertureDutyCycleScenario {
    const KIND: ScenarioKind = ScenarioKind::ApertureDutyCycle;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "aperture-duty-cycle")
    }
}

fn run_tracking_loop(
    scn: &crate::tracking_loop::TrackingLoopScenario,
) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::tracking_loop::TrackingLoopScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_tracking_loop(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::tracking_loop::TrackingLoopScenario {
    const KIND: ScenarioKind = ScenarioKind::TrackingLoop;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "tracking-loop")
    }
}

fn run_araim_reference_check(
    scn: &crate::araim_reference::AraimReferenceCheckScenario,
) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::araim_reference::AraimReferenceCheckScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_araim_reference_check(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::araim_reference::AraimReferenceCheckScenario {
    const KIND: ScenarioKind = ScenarioKind::AraimReferenceCheck;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "araim-reference-check")
    }
}

fn run_ins_trn_coast(
    scn: &crate::inertial::coast::InsTrnCoastScenario,
) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::inertial::coast::InsTrnCoastScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_ins_trn_coast(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::inertial::coast::InsTrnCoastScenario {
    const KIND: ScenarioKind = ScenarioKind::InsTrnCoast;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "ins-trn-coast")
    }
}

fn run_telecom_timing(
    scn: &crate::telecom_timing::TelecomTimingScenario,
) -> Result<RunOutput, String> {
    // The MTIE/TDEV table with every selected mask's limit beside it is the
    // result a timing engineer compares, so it is published as the CSV artifact.
    let (json, summary, svg, csv) = scn.run_all()?;
    let csv = Some(csv);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv,
    })
}

impl Scenario for crate::telecom_timing::TelecomTimingScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_telecom_timing(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::telecom_timing::TelecomTimingScenario {
    const KIND: ScenarioKind = ScenarioKind::TelecomTiming;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "telecom-timing")
    }
}

fn run_spectrum(scn: &crate::spectrum::SpectrumScenario) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_all()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::spectrum::SpectrumScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_spectrum(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::spectrum::SpectrumScenario {
    const KIND: ScenarioKind = ScenarioKind::Spectrum;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "spectrum")
    }
}

fn run_solar_system(scn: &crate::solar_system::SolarSystemScenario) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::solar_system::SolarSystemScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_solar_system(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::solar_system::SolarSystemScenario {
    const KIND: ScenarioKind = ScenarioKind::SolarSystem;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "solar-system")
    }
}

fn run_body_pnt(scn: &crate::body_pnt::BodyPntScenario) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::body_pnt::BodyPntScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_body_pnt(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::body_pnt::BodyPntScenario {
    const KIND: ScenarioKind = ScenarioKind::BodyPnt;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "body-pnt")
    }
}

fn run_constellation_design(
    scn: &crate::constellation::ConstellationDesignScenario,
) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_all()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::constellation::ConstellationDesignScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_constellation_design(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::constellation::ConstellationDesignScenario {
    const KIND: ScenarioKind = ScenarioKind::ConstellationDesign;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "constellation-design")
    }
}

fn run_leo_signal(scn: &crate::leo_signal::LeoSignalScenario) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_all()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::leo_signal::LeoSignalScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_leo_signal(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::leo_signal::LeoSignalScenario {
    const KIND: ScenarioKind = ScenarioKind::LeoSignal;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "leo-signal")
    }
}

fn run_leo_pass(scn: &crate::leo_pass::LeoPassScenario) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::leo_pass::LeoPassScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_leo_pass(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::leo_pass::LeoPassScenario {
    const KIND: ScenarioKind = ScenarioKind::LeoPass;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "leo-pass")
    }
}

fn run_leo_pvt(scn: &crate::leo_fusion::pvt_kind::LeoPvtScenario) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::leo_fusion::pvt_kind::LeoPvtScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_leo_pvt(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::leo_fusion::pvt_kind::LeoPvtScenario {
    const KIND: ScenarioKind = ScenarioKind::LeoPvt;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "leo-pvt")
    }
}

fn run_leo_ppp(scn: &crate::leo_fusion::ppp::PppScenario) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::leo_fusion::ppp::PppScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_leo_ppp(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::leo_fusion::ppp::PppScenario {
    const KIND: ScenarioKind = ScenarioKind::LeoPpp;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "leo-ppp")
    }
}

fn run_ntn_positioning(scn: &crate::leo_fusion::ntn::NtnScenario) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::leo_fusion::ntn::NtnScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_ntn_positioning(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::leo_fusion::ntn::NtnScenario {
    const KIND: ScenarioKind = ScenarioKind::NtnPositioning;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "ntn-positioning")
    }
}

fn run_leo_pnt_chain(scn: &crate::leo_pnt_chain::LeoPntChainScenario) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::leo_pnt_chain::LeoPntChainScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_leo_pnt_chain(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::leo_pnt_chain::LeoPntChainScenario {
    const KIND: ScenarioKind = ScenarioKind::LeoPntChain;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "leo-pnt-chain")
    }
}

fn run_leo_navmsg(scn: &crate::leo_navmsg::LeoNavmsgScenario) -> Result<RunOutput, String> {
    let (json, summary, svg, csv) = scn.run_all()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv,
    })
}

impl Scenario for crate::leo_navmsg::LeoNavmsgScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_leo_navmsg(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::leo_navmsg::LeoNavmsgScenario {
    const KIND: ScenarioKind = ScenarioKind::LeoNavmsg;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "leo-navmsg")
    }
}

fn run_slot_timing(scn: &crate::slot_timing::SlotTimingScenario) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_all()?;
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::slot_timing::SlotTimingScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_slot_timing(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::slot_timing::SlotTimingScenario {
    const KIND: ScenarioKind = ScenarioKind::SlotTiming;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "slot-timing")
    }
}

fn run_lunar_llr_datum(scn: &crate::lunar_llr::LunarLlrDatumScenario) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::lunar_llr::LunarLlrDatumScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_llr_datum(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar_llr::LunarLlrDatumScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarLlrDatum;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-llr-datum")
    }
}

fn run_lunar_frame_campaign(
    scn: &crate::lunar_frame_campaign::LunarFrameCampaignScenario,
) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::lunar_frame_campaign::LunarFrameCampaignScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_frame_campaign(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar_frame_campaign::LunarFrameCampaignScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarFrameCampaign;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-frame-campaign")
    }
}

fn run_lunar_vlbi_fim(
    scn: &crate::lunar_vlbi_fim::LunarVlbiFimScenario,
) -> Result<RunOutput, String> {
    let (json, summary) = scn.run_json()?;
    let svg = minimal_svg(&summary);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv: None,
    })
}

impl Scenario for crate::lunar_vlbi_fim::LunarVlbiFimScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_vlbi_fim(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar_vlbi_fim::LunarVlbiFimScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarVlbiFim;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-vlbi-fim")
    }
}

fn run_lunar_jamming(
    scn: &crate::lunar_jamming::LunarJammingScenario,
) -> Result<RunOutput, String> {
    let (json, summary, svg) = scn.run_output()?;
    // The per-satellite J/S table is the result, so it is published as a runtime
    // CSV artifact too: the table a paper cites is then a file the engine wrote,
    // not a block a manuscript transcribed out of two separate link-budget runs.
    let csv = Some(scn.to_csv()?);
    Ok(RunOutput {
        json,
        svg,
        summary,
        csv,
    })
}

impl Scenario for crate::lunar_jamming::LunarJammingScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_lunar_jamming(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::lunar_jamming::LunarJammingScenario {
    const KIND: ScenarioKind = ScenarioKind::LunarJamming;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "lunar-jamming")
    }
}

// ---- bulk migration (FUT-27): each arm body moved verbatim ----

fn run_sweep_nd(scn: &crate::sweep::GenericSweepScenario) -> Result<RunOutput, String> {
    let r = crate::sweep::run_generic_sweep(scn)?;
    let summary = format!(
        "generic sweep of `{}` over [{}] | {} nodes (shape {:?}) | metrics [{}]",
        r.kind,
        r.keys.join(", "),
        r.points.len(),
        r.shape,
        r.metrics.join(", "),
    );
    Ok(RunOutput {
        json: json_of_with_units(&r, crate::sweep::GENERIC_UNITS)?,
        svg: crate::sweep::generic_to_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::sweep::GenericSweepScenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_sweep_nd(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::sweep::GenericSweepScenario {
    const KIND: ScenarioKind = ScenarioKind::SweepNd;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "generic sweep")
    }
}

fn run_gravity_map(cfg: &crate::gravimeter::GravityMapBenchmarkCfg) -> Result<RunOutput, String> {
    let r = crate::gravimeter::run_gps_denied_gravity_nav(cfg);
    let summary = format!(
        "gravity-map | free-inertial drift {:.0} m | gravity-matched {:.0} m | matching sigma {:.3e} mGal",
        r.free_inertial_drift_m, r.map_matched_error_m, r.measurement_sigma_mgal,
    );
    #[derive(serde::Serialize)]
    struct GravityMapOut {
        free_inertial_drift_m: f64,
        map_matched_error_m: f64,
        measurement_sigma_mgal: f64,
    }
    let out = GravityMapOut {
        free_inertial_drift_m: r.free_inertial_drift_m,
        map_matched_error_m: r.map_matched_error_m,
        measurement_sigma_mgal: r.measurement_sigma_mgal,
    };
    Ok(RunOutput {
        json: json_of_with_units(&out, crate::gravimeter::UNITS)?,
        svg: crate::altpnt::terrain::gravity_nav_svg(
            r.free_inertial_drift_m,
            r.map_matched_error_m,
        ),
        summary,
        csv: None,
    })
}

impl Scenario for crate::gravimeter::GravityMapBenchmarkCfg {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_gravity_map(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::gravimeter::GravityMapBenchmarkCfg {
    const KIND: ScenarioKind = ScenarioKind::GravityMap;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "gravity-map")
    }
}

fn run_terrain(cfg: &crate::altpnt::terrain::TerrainNavCfg) -> Result<RunOutput, String> {
    let r = crate::altpnt::terrain::run_terrain_nav(cfg);
    let summary = format!(
        "terrain-nav | free-inertial drift {:.0} m | terrain-matched {:.0} m ({:.0}x cut) | matching sigma {:.1} m",
        r.free_inertial_drift_m,
        r.matched_error_m,
        if r.matched_error_m > 0.0 { r.free_inertial_drift_m / r.matched_error_m } else { 0.0 },
        r.measurement_sigma_m,
    );
    Ok(RunOutput {
        json: json_of_with_units(&r, crate::altpnt::terrain::TERRAIN_NAV_UNITS)?,
        svg: crate::altpnt::terrain::terrain_nav_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::altpnt::terrain::TerrainNavCfg {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_terrain(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::altpnt::terrain::TerrainNavCfg {
    const KIND: ScenarioKind = ScenarioKind::Terrain;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "terrain-nav")
    }
}

fn run_terrain_slam(
    cfg: &crate::altpnt::sequential::SequentialTrnCfg,
) -> Result<RunOutput, String> {
    let r = crate::altpnt::sequential::run_sequential_trn(cfg);
    let summary = format!(
        "terrain-slam | {} waypoints | free-inertial RMS {:.0} m (final {:.0} m) | terrain-matched RMS {:.0} m (final {:.0} m, {:.0}x cut) | mean ESS {:.0}/{} | matching sigma {:.1} m",
        r.waypoints,
        r.free_inertial_rms_m,
        r.free_inertial_final_m,
        r.matched_rms_m,
        r.matched_final_m,
        if r.matched_rms_m > 0.0 { r.free_inertial_rms_m / r.matched_rms_m } else { 0.0 },
        r.mean_ess,
        cfg.n_particles.max(1),
        r.measurement_sigma_m,
    );
    Ok(RunOutput {
        json: json_of_with_units(&r, crate::altpnt::sequential::UNITS)?,
        svg: crate::altpnt::sequential::sequential_trn_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::altpnt::sequential::SequentialTrnCfg {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_terrain_slam(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::altpnt::sequential::SequentialTrnCfg {
    const KIND: ScenarioKind = ScenarioKind::TerrainSlam;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "terrain-slam")
    }
}

fn run_combined_alt_pnt(
    cfg: &crate::altpnt::terrain::CombinedAltPntCfg,
) -> Result<RunOutput, String> {
    let r = crate::altpnt::terrain::run_combined_altpnt(cfg);
    let summary = format!(
        "combined-altpnt | free-inertial drift {:.0} m | gravity {:.0} m magnetic {:.0} m terrain {:.0} m | FUSED {:.0} m",
        r.free_inertial_drift_m,
        r.gravity_only_m,
        r.magnetic_only_m,
        r.terrain_only_m,
        r.combined_m,
    );
    Ok(RunOutput {
        json: json_of_with_units(&r, crate::altpnt::terrain::COMBINED_ALTPNT_UNITS)?,
        svg: crate::altpnt::terrain::combined_altpnt_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::altpnt::terrain::CombinedAltPntCfg {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_combined_alt_pnt(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::altpnt::terrain::CombinedAltPntCfg {
    const KIND: ScenarioKind = ScenarioKind::CombinedAltPnt;
    fn parse(src: &str) -> Result<Self, String> {
        parse_toml(src, "combined-altpnt")
    }
}

fn run_clock(scn: &crate::scenario::Scenario) -> Result<RunOutput, String> {
    scn.time.validate()?;
    if scn.runs > 1 {
        // Monte Carlo ensemble: report confidence bands instead of one run.
        let r = crate::ensemble::run_ensemble(scn);
        let q = &r.quantum;
        let c = &r.classical;
        let summary = format!(
            "scenario {} | {} runs | quantum holdover {:.0}s [{:.0}-{:.0}] p95 {}ns security {} | classical holdover {:.0}s [{:.0}-{:.0}] p95 {}ns security {}",
            &r.scenario_hash[..12], r.runs,
            q.holdover_s.mean, q.holdover_s.p05, q.holdover_s.p95, ns1(q.timing_p95_ns.mean), SECURITY_NA,
            c.holdover_s.mean, c.holdover_s.p05, c.holdover_s.p95, ns1(c.timing_p95_ns.mean), SECURITY_NA,
        );
        return Ok(RunOutput {
            json: json_of_with_units_and_tiers(
                &r,
                crate::ensemble::UNITS,
                &["quantum", "classical"],
                crate::fom_label::CLOCK_FOM_FIELDS,
            )?,
            svg: crate::ensemble::to_svg(&r),
            summary,
            csv: None,
        });
    }
    let r = crate::run::run(scn);
    let summary = format!(
        "scenario {} | quantum holdover {:.0}s p95 {}ns integrity {} security {} | classical holdover {:.0}s p95 {}ns integrity {} security {}",
        &r.scenario_hash[..12],
        r.quantum.fom.holdover_s, ns1(r.quantum.fom.timing_p95_ns), integ(r.quantum.fom.integrity), SECURITY_NA,
        r.classical.fom.holdover_s, ns1(r.classical.fom.timing_p95_ns), integ(r.classical.fom.integrity), SECURITY_NA,
    );
    Ok(RunOutput {
        json: json_of_with_units_and_tiers(
            &r,
            crate::report::UNITS,
            &["quantum.fom", "classical.fom"],
            crate::fom_label::CLOCK_FOM_FIELDS,
        )?,
        svg: crate::report::to_svg(&r),
        summary,
        csv: None,
    })
}

impl Scenario for crate::scenario::Scenario {
    fn run(&self) -> Result<RunOutput, KshanaError> {
        run_clock(self).map_err(KshanaError::from)
    }
}

impl BuiltinKind for crate::scenario::Scenario {
    const KIND: ScenarioKind = ScenarioKind::Clock;
    fn parse(src: &str) -> Result<Self, String> {
        toml::from_str(src).map_err(|e| format!("invalid scenario: {e}"))
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
