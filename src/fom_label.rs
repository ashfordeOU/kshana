// SPDX-License-Identifier: AGPL-3.0-only
//! **Per-figure-of-merit validation tier.**
//!
//! Every number a study report shows next to a [`crate::fom::FoMScores`] field
//! is either externally *validated* against an authoritative oracle or it is a
//! *modelled* first-principles figure. A reader — especially a procurement
//! reviewer — must be able to tell which, inline, next to the value. This module
//! is the single name→tier lookup that surfaces that distinction.
//!
//! **Single source of truth.** The tier is *derived from* the existing
//! verification matrix ([`crate::verification::verification_matrix`]); this
//! module deliberately does **not** keep a second, independent matrix that could
//! drift. Each FoM field name is mapped to the matrix `requirement` that owns it,
//! and the tier is read back from that row's [`VerificationStatus`]. If a metric
//! has no owning row, the lookup returns the most conservative honest tier rather
//! than inventing a validation halo.
//!
//! **Why the timing FoMs are MODELLED.** The timing-domain figures
//! (`timing_rms_ns`, `timing_p95_ns`, `holdover_s`, `resilience_slope_ns_per_s`,
//! `availability`) are all produced by the clock-holdover scoring engine over a
//! *modelled* GNSS-denied coast (the matrix's "GNSS-denied clock holdover" /
//! "Onboard clock state estimation" rows, both `Modelled`). The `integrity` and
//! `security` FoMs are, per their own field docs in [`crate::fom::FoMScores`], a
//! Kalman self-consistency fraction and an analytic spoof-detectability bound —
//! explicitly **not** the externally-validated aviation RAIM / multi-satellite
//! detector. So they are mapped to their honest modelled rows, never to the
//! Validated RAIM core.

use crate::verification::{verification_matrix, VerificationStatus};

/// The honest validation tier shown next to a figure of merit in a report.
///
/// Mirrors [`VerificationStatus`] but in the FoM-reporting vocabulary the rest of
/// the product uses (`Partial` is reserved for a metric that is only validated in
/// part of its operating envelope; the current FoMs are all `Modelled`).
#[derive(Clone, Copy, Debug, PartialEq, Eq, serde::Serialize)]
pub enum ValidationTier {
    /// Checked against an independent external oracle (dataset / published vectors
    /// / published value) — see the matrix's `Validated` rows.
    Validated,
    /// Implemented from published or first-principles physics with tests, but not
    /// checked against an external oracle to a stated tolerance.
    Modelled,
    /// Validated only over part of its operating envelope; modelled elsewhere.
    Partial,
}

impl ValidationTier {
    /// Short upper-case tag for inline rendering, e.g. `(MODELLED)`.
    pub fn tag(self) -> &'static str {
        match self {
            ValidationTier::Validated => "VALIDATED",
            ValidationTier::Modelled => "MODELLED",
            ValidationTier::Partial => "PARTIAL",
        }
    }
}

/// The verification-matrix `requirement` that owns each FoM field. The tier is
/// read back from that row, so the matrix stays the single source of truth and
/// this is only a name→row crosswalk, never a second status table.
///
/// The timing-domain FoMs are owned by the modelled clock-holdover rows; the
/// `integrity`/`security` FoMs are mapped to the rows describing the actual
/// quantity reported (a filter self-consistency fraction; an analytic
/// spoof-detectability bound) — deliberately not the Validated aviation RAIM row,
/// because [`crate::fom::FoMScores`] documents those fields as *not* being it.
fn owning_requirement(fom: &str) -> Option<&'static str> {
    Some(match fom {
        "timing_rms_ns"
        | "timing_p95_ns"
        | "holdover_s"
        | "timing_holdover_s"
        | "resilience_slope_ns_per_s"
        | "availability" => "GNSS-denied clock holdover",
        "integrity" => "Onboard clock state estimation",
        "security" => "Spoofing detection",
        _ => return None,
    })
}

/// The honest validation tier for a [`crate::fom::FoMScores`] field name, derived
/// from the verification matrix.
///
/// Returns `None` only for a name that is not a known FoM field. For a known FoM
/// whose owning row is missing from the matrix, returns the most conservative
/// honest tier ([`ValidationTier::Modelled`]) — it never fabricates `Validated`.
pub fn tier_for(fom: &str) -> Option<ValidationTier> {
    let requirement = owning_requirement(fom)?;
    let status = verification_matrix()
        .into_iter()
        .find(|it| it.requirement == requirement)
        .map(|it| it.status);
    Some(match status {
        Some(VerificationStatus::Validated) => ValidationTier::Validated,
        // A modelled, partner-owned, or (defensively) absent row all map to the
        // conservative tier — never a validation halo the matrix didn't grant.
        Some(VerificationStatus::Modelled) | Some(VerificationStatus::PartnerOwned) | None => {
            ValidationTier::Modelled
        }
    })
}

/// The verification-matrix `requirement` that owns a figure-of-merit field, or `None`
/// for a name no matrix row owns. Public so a run's output can cite the row, not just
/// the tier read back from it.
pub fn requirement_for(fom: &str) -> Option<&'static str> {
    owning_requirement(fom)
}

/// The figure-of-merit fields of the clock-holdover family (`clock`, `orbit`), in
/// report order. The Monte Carlo `clock` ensemble reports the same names, each as a
/// spread rather than a single value.
pub const CLOCK_FOM_FIELDS: &[&str] = &[
    "holdover_s",
    "timing_rms_ns",
    "timing_p95_ns",
    "resilience_slope_ns_per_s",
    "availability",
    "integrity",
    "security",
];

/// The figure-of-merit fields of the combined timing-and-position packs (`hybrid`,
/// `fusion`), in report order.
pub const HYBRID_FOM_FIELDS: &[&str] = &[
    "timing_holdover_s",
    "position_holdover_s",
    "pnt_holdover_s",
    "timing_p95_ns",
    "position_p95_m",
    "pnt_availability",
    "integrity",
    "security",
];

/// Why `security` is not applicable in a scenario that configures no attack.
pub const SECURITY_NOT_APPLICABLE: &str = "no attack is configured in this scenario, so \
    there is nothing to detect. The value is the clock's analytic spoof-detectability \
    bound (docs/INTEGRITY.md), emitted for continuity; the spoof scenario kind scores \
    detection against an injected attack";

/// Why a figure carries no tier: no verification-matrix row owns it.
const NO_OWNING_ROW: &str = "no verification-matrix row owns this figure, so no tier is \
    claimed for it";

/// The `figure_tiers` block a run's output document carries: one entry per reported
/// figure of merit, giving its verification tier and the matrix row that tier is read
/// from, so a reader of the raw JSON can tell a VALIDATED figure from a MODELLED one
/// without leaving the file.
///
/// `doc` is the report as serialised; `roots` are the dotted paths of the objects that
/// hold the figures (`quantum.fom`, or `quantum` for the ensemble); `fields` is the
/// family's list above. A field that is absent or `null` under a root is skipped — the
/// block describes what the document reports, never more. `attack_configured` is
/// `false` for every scenario kind that has no attack input, and then `security` is
/// marked `applicable: false` with the reason, while its value stays in the document
/// unchanged. A field no matrix row owns goes to `untiered` instead of being given a
/// tier the matrix never granted.
pub fn figure_tiers(
    doc: &serde_json::Value,
    roots: &[&str],
    fields: &[&str],
    attack_configured: bool,
) -> serde_json::Value {
    use serde_json::{json, Value};
    let mut figures = Vec::new();
    let mut untiered = Vec::new();
    for root in roots {
        let mut node = doc;
        for seg in root.split('.') {
            node = node.get(seg).unwrap_or(&Value::Null);
        }
        for field in fields {
            match node.get(*field) {
                None | Some(Value::Null) => continue,
                Some(_) => {}
            }
            let path = format!("{root}.{field}");
            match (tier_for(field), requirement_for(field)) {
                (Some(tier), Some(requirement)) => {
                    let mut entry = json!({
                        "path": path,
                        "tier": tier.tag(),
                        "requirement": requirement,
                        "applicable": true,
                    });
                    if *field == "security" && !attack_configured {
                        entry["applicable"] = json!(false);
                        entry["reason"] = json!(SECURITY_NOT_APPLICABLE);
                    }
                    figures.push(entry);
                }
                _ => untiered.push(json!({ "path": path, "reason": NO_OWNING_ROW })),
            }
        }
    }
    let mut block = json!({
        "source": "src/verification.rs (the verification matrix), read through src/fom_label.rs",
        "legend": "VALIDATED: checked against an independent external oracle. MODELLED: \
                   first-principles or published-formula model, internally tested, with no \
                   external oracle to a stated tolerance. applicable=false: the figure is \
                   emitted for continuity but does not answer a question this scenario asks",
        "figures": figures,
    });
    if !untiered.is_empty() {
        block["untiered"] = Value::Array(untiered);
    }
    block
}

/// Kinds whose result document carries a frozen pre-registered prediction
/// (`tests/prediction_frozen.rs` reproduces it byte for byte). They get no
/// `figure_tiers` block until a new dated prediction replaces the frozen one.
pub const FROZEN_PREDICTION_KINDS: &[&str] = &["lunar-station-coverage"];

/// Kinds that build their own `figure_tiers` block inside their run.
pub const KINDS_WITH_INLINE_TIERS: &[&str] = &["clock", "orbit", "hybrid", "fusion"];

/// Kinds that get no `figure_tiers` block, each with the reason: no scalar headline
/// figure, or a compact (not pretty-printed) result document, which the byte-exact append
/// cannot extend without re-printing the whole document.
pub const KINDS_EXCLUDED_FROM_FIGURE_TIERS: &[(&str, &str)] = &[
    ("lunar-attack-surface", "its result document is compact JSON; appending the block byte-exactly would need the whole document re-printed"),
    ("leo-ppp", "its result carries the convergence times and NEES as arrays; no scalar headline figure"),
    ("solar-system", "its positions and light times are arrays; the only scalars are the epoch and the body count"),
    ("optical-atmosphere", "its figures are per-site and per-network-row arrays; the document carries its own MODELLED label"),
    ("sweep", "its results are arrays of member runs; the members carry their own tiers"),
    ("sweep-nd", "its results are arrays of member metrics; the members carry their own tiers"),
];

/// The headline figures of every other built-in kind: `(path, requirement)` pairs, the
/// path dotted into the result document and the requirement the verification-matrix row
/// that owns the figure (empty: no row owns it, and the figure is listed as untiered).
/// The tier is read from the row, never written here. `None` for a kind not in the table.
pub fn kind_figures(kind: &str) -> Option<&'static [(&'static str, &'static str)]> {
    Some(match kind {
        "acm-link" => &[
            ("acm_volume_mbit", "DVB-S2 adaptive coding and modulation along a LEO downlink pass"),
            ("ccm_volume_mbit", "DVB-S2 adaptive coding and modulation along a LEO downlink pass"),
            ("acm_gain", "DVB-S2 adaptive coding and modulation along a LEO downlink pass"),
        ],
        "aocs" => &[
            ("settle_time_s", ""),
            ("final_pointing_error_deg", ""),
            ("estimator.rms_attitude_error_arcsec", "Multiplicative EKF attitude estimation from a gyro and a star tracker"),
            ("estimator.mean_nees", "Multiplicative EKF attitude estimation from a gyro and a star tracker"),
        ],
        "aperture-duty-cycle" => &[
            ("navigation_duty", "Aperture navigation-versus-communications duty cycle"),
            ("communications_duty", "Aperture navigation-versus-communications duty cycle"),
            ("idle_duty", "Aperture navigation-versus-communications duty cycle"),
            ("contention_s", "Aperture navigation-versus-communications duty cycle"),
        ],
        "araim-reference-check" => &[
            ("worst_acceptance_error_m", "ARAIM MHSS protection levels against published reference vectors"),
        ],
        "ascent-losses" => &[
            ("losses_m_s.total", "Launch ascent gravity, drag, steering and back-pressure losses"),
            ("losses_m_s.gravity", "Launch ascent gravity, drag, steering and back-pressure losses"),
            ("max_q_pa", "Launch ascent gravity, drag, steering and back-pressure losses"),
        ],
        "attitude-budget" => &[
            ("gravity_gradient_torque_max_nm", "3-DOF attitude & pointing error budget (AOCS)"),
            ("total_pointing_error_arcsec", ""),
        ],
        "body-pnt" => &[
            ("fom.availability_relays", "Positioning around any solar-system body with a local constellation and a deep-space link from Earth"),
            ("fom.availability_with_earth", "Positioning around any solar-system body with a local constellation and a deep-space link from Earth"),
            ("fom.rms_error_relays_m", "Positioning around any solar-system body with a local constellation and a deep-space link from Earth"),
            ("fom.rms_error_with_earth_m", "Positioning around any solar-system body with a local constellation and a deep-space link from Earth"),
        ],
        "campaign" => &[
            ("timeline.duration_s", ""),
            ("reproducibility.runs_total", ""),
        ],
        "cislunar-arc-recovery" => &[
            ("claim_under_test.estimator_noise_free_boundary_hours", "Independent-estimator corroboration of the cislunar arc-length threshold"),
            ("claim_under_test.estimator_estimability_boundary_hours", "Independent-estimator corroboration of the cislunar arc-length threshold"),
            ("claim_under_test.rank_ratio_estimator_over_gramian", "Independent-estimator corroboration of the cislunar arc-length threshold"),
            ("claim_under_test.estimability_ratio_estimator_over_gramian", "Independent-estimator corroboration of the cislunar arc-length threshold"),
        ],
        "cislunar-observability" => &[
            ("gramian_spectrum.rank", "Spatial, noisy, multi-family cislunar arc-length observability"),
            ("gramian_spectrum.condition", "Spatial, noisy, multi-family cislunar arc-length observability"),
            ("gdop.range_rate.gdop", "Spatial, noisy, multi-family cislunar arc-length observability"),
            ("srif_cross_validation.full_rank_transition_epoch", "Spatial, noisy, multi-family cislunar arc-length observability"),
        ],
        "combined-altpnt" => &[
            ("combined_m", "Alternative / complementary PNT"),
            ("gravity_only_m", "Alternative / complementary PNT"),
            ("magnetic_only_m", "Alternative / complementary PNT"),
            ("terrain_only_m", "Alternative / complementary PNT"),
        ],
        "conflict-resilience" => &[
            ("resilience_ratio.closed_form_independent", ""),
            ("resilience_ratio.monte_carlo_independent", ""),
            ("correlation_sweep.min_ratio_over_grid", ""),
            ("prior_sensitivity.nominal_ratio", ""),
        ],
        "constellation-design" => &[
            ("global.availability_pct", "Coverage and dilution-of-precision maps for arbitrary multi-constellation designs at scale, around any central body"),
            ("global.worst_site_availability_pct", "Coverage and dilution-of-precision maps for arbitrary multi-constellation designs at scale, around any central body"),
            ("global.pdop.median", "Coverage and dilution-of-precision maps for arbitrary multi-constellation designs at scale, around any central body"),
            ("global.mean_visible", "Coverage and dilution-of-precision maps for arbitrary multi-constellation designs at scale, around any central body"),
        ],
        "contact-schedule" => &[
            ("plans.greedy.delivered_mbit", "Multi-satellite, multi-station ground-contact scheduling with conflict resolution"),
            ("plans.chronological.delivered_mbit", "Multi-satellite, multi-station ground-contact scheduling with conflict resolution"),
            ("conflicting_pairs", "Multi-satellite, multi-station ground-contact scheduling with conflict resolution"),
        ],
        "earth-gnss-lunar" => &[
            ("sweep.fix_availability", "Earth-GNSS at lunar distance"),
            ("sweep.signal_availability", "Earth-GNSS at lunar distance"),
            ("sweep.best_cn0_dbhz", "Earth-GNSS at lunar distance"),
            ("earth_limb_half_angle_deg", "Earth-GNSS at lunar distance"),
        ],
        "entry-heating" => &[
            ("peak_deceleration.g", "3-DoF ballistic entry peak deceleration against the published Stardust nominal"),
            ("relative_entry.speed_m_s", "3-DoF ballistic entry peak deceleration against the published Stardust nominal"),
            ("peak_heat_flux.w_cm2", "Stagnation-point convective entry heating (Sutton-Graves) on a 3-DoF entry"),
            ("heat_load_j_cm2", "Stagnation-point convective entry heating (Sutton-Graves) on a 3-DoF entry"),
        ],
        "eo-coverage" => &[
            ("swath_width_km", "EO payload footprint & coverage geometry"),
            ("nadir_gsd_m", "EO payload footprint & coverage geometry"),
            ("max_access_ground_range_km", "EO payload footprint & coverage geometry"),
            ("equatorial_ground_track_spacing_km", "EO payload footprint & coverage geometry"),
        ],
        "eo-radiometry" => &[
            ("snr", "Electro-optical imager radiometry, MTF, relative edge response and GIQE 4 NIIRS"),
            ("mtf_nyquist.system", "Electro-optical imager radiometry, MTF, relative edge response and GIQE 4 NIIRS"),
            ("rer", "Electro-optical imager radiometry, MTF, relative edge response and GIQE 4 NIIRS"),
            ("niirs_giqe4", "Electro-optical imager radiometry, MTF, relative edge response and GIQE 4 NIIRS"),
        ],
        "ephemeris" => &[
            ("alt_min_km", ""),
            ("alt_max_km", ""),
            ("max_elevation_deg", ""),
            ("peak_doppler_hz", ""),
        ],
        "gnss-ins" => &[
            ("quantum.fused_outage_rms_m", ""),
            ("classical.fused_outage_rms_m", ""),
            ("quantum.fom.availability", ""),
            ("classical.fom.availability", ""),
        ],
        "gnss-sim" => &[
            ("fom.raim_availability", ""),
            ("fom.mean_hpl_m", ""),
            ("fom.mean_vpl_m", ""),
            ("fom.mean_iono_m", ""),
        ],
        "gravity-map" => &[
            ("map_matched_error_m", "Alternative / complementary PNT"),
            ("free_inertial_drift_m", ""),
        ],
        "hybrid-optical-rf" => &[
            ("cross_modality_raim.hpl_m", ""),
            ("cross_modality_raim.vpl_m", ""),
            ("cross_modality_raim.tpl_s", ""),
            ("joint_fom.availability", ""),
        ],
        "hybrid-ukf" => &[
            ("consistency.nis_mean", ""),
            ("consistency.nees_mean", ""),
            ("coast.aided_pos_rms_m", ""),
            ("coast.coast_end_pos_rms_m", ""),
        ],
        "impairment-eval" => &[
            ("distribution_shift.auc_in", "AI/ML RF-impairment detection evaluation (13494)"),
            ("distribution_shift.auc_out", "AI/ML RF-impairment detection evaluation (13494)"),
            ("distribution_shift.optimism_gap", "AI/ML RF-impairment detection evaluation (13494)"),
            ("operating_point.pd", "AI/ML RF-impairment detection evaluation (13494)"),
        ],
        "inertial" => &[
            ("quantum.fom.holdover_s", "Quantum inertial dead-reckoning resilience"),
            ("classical.fom.holdover_s", "Quantum inertial dead-reckoning resilience"),
            ("quantum.fom.pos_p95_m", "Quantum inertial dead-reckoning resilience"),
            ("classical.fom.pos_p95_m", "Quantum inertial dead-reckoning resilience"),
        ],
        "ins-trn-coast" => &[
            ("trn.peak_error_m", "INS/TRN coasting error growth & threshold crossings"),
        ],
        "integrity" => &[
            ("samples_available", ""),
        ],
        "jamming" => &[
            ("fom.availability_under_jamming", "GNSS-denied jamming resilience"),
            ("fom.mean_js_db", "GNSS-denied jamming resilience"),
            ("fom.min_tracking", "GNSS-denied jamming resilience"),
        ],
        "launch-window" => &[
            ("launch_azimuth_deg.ascending", "Launch-window & ascent geometry (mission analysis)"),
            ("circular_velocity_m_s", "Launch-window & ascent geometry (mission analysis)"),
            ("site_rotation_speed_m_s", "Launch-window & ascent geometry (mission analysis)"),
            ("daily_opportunities", "Launch-window & ascent geometry (mission analysis)"),
        ],
        "leo-navmsg" => &[
            ("encode_decode.sisre_exact_rms_m", ""),
            ("encode_decode.sisre_quantised_rms_m", "Documented binary encoding of the LEO navigation message with a quantisation-error budget"),
            ("encode_decode.quantised_max_pos_m", "Documented binary encoding of the LEO navigation message with a quantisation-error budget"),
            ("encode_decode.rinex_round_trip_max_pos_m", "RINEX-4-style and CSV exports of LEO navigation messages"),
        ],
        "leo-pass" => &[
            ("comparison.leo_peak_cn0_dbhz", "A LEO-PNT pass and its per-band link budget against the MEO GNSS satellites in view"),
            ("comparison.gnss_median_cn0_dbhz", "A LEO-PNT pass and its per-band link budget against the MEO GNSS satellites in view"),
            ("comparison.leo_peak_above_gnss_median_db", "A LEO-PNT pass and its per-band link budget against the MEO GNSS satellites in view"),
            ("comparison.leo_seconds_above_gnss_max", "A LEO-PNT pass and its per-band link budget against the MEO GNSS satellites in view"),
        ],
        "leo-pnt-chain" => &[
            ("pass.peak_tracked_cn0_dbhz", "One LEO-PNT system end to end: signal design, pass link budget, navigation message and fused positioning, each stage's output handed to the next"),
            ("navmsg.representation_sisre_rms_m", "One LEO-PNT system end to end: signal design, pass link budget, navigation message and fused positioning, each stage's output handed to the next"),
            ("fusion.gnss.rms_error_3d_m", "One LEO-PNT system end to end: signal design, pass link budget, navigation message and fused positioning, each stage's output handed to the next"),
            ("fusion.fused.rms_error_3d_m", "One LEO-PNT system end to end: signal design, pass link budget, navigation message and fused positioning, each stage's output handed to the next"),
        ],
        "leo-pvt" => &[
            ("joint.fused.availability", "Joint GNSS and LEO pseudorange positioning with inter-system biases and per-signal error models"),
            ("joint.fused.median_pdop", "Joint GNSS and LEO pseudorange positioning with inter-system biases and per-signal error models"),
            ("joint.gnss.rms_error_3d_m", "Joint GNSS and LEO pseudorange positioning with inter-system biases and per-signal error models"),
            ("joint.fused.rms_error_3d_m", "Joint GNSS and LEO pseudorange positioning with inter-system biases and per-signal error models"),
        ],
        "leo-signal" => &[
            ("receiver.noise_density_dbw_per_hz", "Low Earth orbit positioning, navigation and timing signal designs: code tracking, acquisition, GNSS compatibility and a band trade for any system"),
        ],
        "link-budget" => &[
            ("free_space_loss_db", "One-way link budget (comms / link design)"),
            ("cn0_dbhz", "One-way link budget (comms / link design)"),
            ("eb_n0_db", "One-way link budget (comms / link design)"),
            ("margin_db", "One-way link budget (comms / link design)"),
        ],
        "lunar-beacon" => &[
            ("beacon_pdop_improvement", "Lunar surface-beacon DOP augmentation"),
            ("constellation_pdop_improvement", "Lunar surface-beacon DOP augmentation"),
        ],
        "lunar-differential-pnt" => &[
            ("user_error_uncorrected_m", "Lunar differential PNT"),
            ("user_error_corrected_m", "Lunar differential PNT"),
            ("reduction_factor", "Lunar differential PNT"),
            ("protection_level_m", "Lunar differential PNT"),
        ],
        "lunar-frame-campaign" => &[
            ("datum_accuracy.rotation_sigma_norm_rad", "Lunar frame datum from an observing campaign"),
            ("datum_accuracy.scale_sigma_ppb", "Lunar frame datum from an observing campaign"),
            ("comparison.injected_transform_scenario.translation_error_norm_m", "Lunar frame datum from an observing campaign"),
            ("comparison.ratio_injected_over_campaign_translation", "Lunar frame datum from an observing campaign"),
        ],
        "lunar-frame-realisation" => &[
            ("trans_err_norm_m", "Lunar reference-frame realisation"),
            ("rot_err_norm_rad", "Lunar reference-frame realisation"),
            ("scale_err_ppb", "Lunar reference-frame realisation"),
            ("rms_residual_m", "Lunar reference-frame realisation"),
        ],
        "lunar-integrity" => &[
            ("samples_available", ""),
            ("min_hpl_m", ""),
            ("max_hpl_m", ""),
        ],
        "lunar-interop-export" => &[
            ("oem_line_count", "Lunar interoperability export"),
            ("kif_bytes", "Lunar interoperability export"),
            ("conformance.data_lines", "Lunar interoperability export"),
        ],
        "lunar-jamming" => &[
            ("fom.availability_under_jamming", "Lunar surface-navigation RF jamming (per-satellite J/S)"),
            ("fom.availability_nominal", "Lunar surface-navigation RF jamming (per-satellite J/S)"),
            ("denial_contour.loss_of_lock.standoff_median_km", "Lunar denial contour with an uncertainty band from the measured C/N₀ spread"),
        ],
        "lunar-joint-od-clock" => &[
            ("with_vlbi.station_pos_err_m", ""),
            ("without_vlbi.station_pos_err_m", ""),
            ("with_vlbi.sat_pos_rms_m", ""),
            ("observability.station_pos_crlb_m", "Lunar absolute-station observability (datum defect)"),
        ],
        "lunar-llr-datum" => &[
            ("datum_accuracy.translation_sigma_norm_m", "Lunar frame datum from a REAL observing campaign"),
            ("helmert.rank", "Lunar frame datum from a REAL observing campaign"),
            ("helmert.condition_number", "Lunar frame datum from a REAL observing campaign"),
            ("residuals.rms_m", "Lunar frame datum from a REAL observing campaign"),
        ],
        "lunar-time-budget" => &[
            ("crossover_tau_s", "Per-clock-class lunar time crossover table"),
            ("crossover_x_s", "Per-clock-class lunar time crossover table"),
            ("frame_term_s", ""),
            ("time_lab.ltc_realisation_ns", "Lunar station time laboratory: miniRAFS holdover against LTC"),
        ],
        "lunar-time-offset" => &[
            ("secular_rate_us_per_day", ""),
            ("self_potential_us_per_day", ""),
            ("kinetic_us_per_day", ""),
            ("offset_at_horizon_us", ""),
        ],
        "lunar-vlbi" => &[
            ("delay_s", "Lunar geodetic VLBI"),
            ("delay_rate_s_per_s", "Lunar geodetic VLBI"),
            ("near_field_correction_us", "Lunar geodetic VLBI"),
        ],
        "lunar-vlbi-fim" => &[
            ("headline.computed_per_coordinate_sigma_m", "Lunar-VLBI station-coordinate covariance from a tracking schedule"),
            ("headline.ratio_computed_over_equipartition", "Lunar-VLBI station-coordinate covariance from a tracking schedule"),
            ("fim.rank", "Lunar-VLBI station-coordinate covariance from a tracking schedule"),
            ("fim.condition_number", "Lunar-VLBI station-coordinate covariance from a tracking schedule"),
        ],
        "mars-pnt" => &[
            ("fom.converged_pos_rms_m", ""),
            ("fom.converged_pos_sigma_m", ""),
            ("fom.final_clock_freq_sigma", ""),
            ("fom.mean_relays_in_view", ""),
        ],
        "moonlight-service-volume" => &[
            ("coverage_pct", "Lunar navigation service volume"),
            ("pdop_mean", "Lunar navigation service volume"),
            ("hpl_max_m", ""),
            ("pl_availability_pct", "Lunar navigation service volume"),
        ],
        "ntn-positioning" => &[
            ("doppler_pass.horizontal_error_m", ""),
        ],
        "oem-interop" => &[
            ("round_trip_max_pos_error_km", ""),
            ("round_trip_max_vel_error_km_s", ""),
        ],
        "passes" => &[
            ("pass_count", "Apparent ground-station pass prediction with refraction and light time"),
            ("total_access_s", "Apparent ground-station pass prediction with refraction and light time"),
            ("best_max_elevation_deg", "Apparent ground-station pass prediction with refraction and light time"),
        ],
        "pvt" => &[
            ("fom.rms_3d_m", ""),
            ("fom.max_3d_m", ""),
            ("fom.mean_pdop", ""),
            ("fom.epochs_solved", ""),
        ],
        "quantum-anomaly-detect" => &[
            ("quantum_auc", "Fault/anomaly detection for quantum PNT systems"),
            ("classical_auc", "Fault/anomaly detection for quantum PNT systems"),
            ("quantum_min_detectable", "Fault/anomaly detection for quantum PNT systems"),
            ("classical_min_detectable", "Fault/anomaly detection for quantum PNT systems"),
        ],
        "quantum-gnss-free-nav" => &[
            ("quantum_pos_err_m", "GNSS-free quantum navigation"),
            ("classical_pos_err_m", "GNSS-free quantum navigation"),
            ("quantum_holdover_s", "GNSS-free quantum navigation"),
            ("classical_holdover_s", "GNSS-free quantum navigation"),
        ],
        "quantum-time-transfer" => &[
            ("quantum_chain_sigma_s", "Trusted quantum timing (time transfer + secure dissemination + anomaly)"),
            ("classical_chain_sigma_s", "Trusted quantum timing (time transfer + secure dissemination + anomaly)"),
            ("protection_level_ns", "Trusted quantum timing (time transfer + secure dissemination + anomaly)"),
            ("security_pd", "Trusted quantum timing (time transfer + secure dissemination + anomaly)"),
        ],
        "quantum-trade" => &[
            ("trade.candidate.timing_holdover_s", "Quantum-vs-classical PNT trade & GNSS-denied resilience (13503)"),
            ("trade.timing_benefit_x", "Quantum-vs-classical PNT trade & GNSS-denied resilience (13503)"),
            ("trade.candidate.inertial_holdover_s", "Quantum-vs-classical PNT trade & GNSS-denied resilience (13503)"),
            ("trade.inertial_benefit_x", "Quantum-vs-classical PNT trade & GNSS-denied resilience (13503)"),
        ],
        "realtime-frame-eop" => &[
            ("realtime_frame_error_budget.eop_term_m", ""),
            ("realtime_frame_error_budget.delta_ut1_ms", ""),
            ("realtime_frame_error_budget.frame_realization_floor_m", ""),
            ("operational_predictor_model.published_bulletin_a_agreement.ut1_rms_s", "Operational-style Earth-orientation prediction error, measured predicted-versus-final"),
        ],
        "reentry" => &[
            ("peak_deceleration_g", "Ballistic re-entry corridor (Allen–Eggers)"),
            ("altitude_at_peak_g_m", "Ballistic re-entry corridor (Allen–Eggers)"),
            ("velocity_at_peak_g_m_s", "Ballistic re-entry corridor (Allen–Eggers)"),
            ("velocity_at_peak_heating_m_s", "Ballistic re-entry corridor (Allen–Eggers)"),
        ],
        "slot-timing" => &[
            ("result.breach_after_sync_s", "Seconds until a free-running clock leaves a time-indexed slot's guard, and the fix cadence that keeps it inside"),
            ("result.remaining_s", "Seconds until a free-running clock leaves a time-indexed slot's guard, and the fix cadence that keeps it inside"),
            ("result.resync_interval_s", "Seconds until a free-running clock leaves a time-indexed slot's guard, and the fix cadence that keeps it inside"),
            ("result.fixes_per_day", "Seconds until a free-running clock leaves a time-indexed slot's guard, and the fix cadence that keeps it inside"),
        ],
        "space-packet" => &[
            ("total_stream_octets", "CCSDS Space Packet (133.0) TM/TC framing"),
            ("first_packet.data_length_field", "CCSDS Space Packet (133.0) TM/TC framing"),
        ],
        "space-weather" => &[
            ("exospheric_temperature_k", "Space-weather environment & activity-driven thermospheric density"),
            ("ap", "Space-weather environment & activity-driven thermospheric density"),
        ],
        "spectrum" => &[
            ("waterfall.noise_floor_dbw_per_hz", "L-band spectrum waterfall with per-band J/S and effective C/N0 under a scripted jammer timeline"),
            ("waterfall.peak_dbw_per_hz", "L-band spectrum waterfall with per-band J/S and effective C/N0 under a scripted jammer timeline"),
        ],
        "spoof" => &[
            ("quantum.security_fom", "Spoofing detection"),
            ("classical.security_fom", "Spoofing detection"),
            ("quantum.detect_time_s", "Spoofing detection"),
            ("classical.detect_time_s", "Spoofing detection"),
        ],
        "spoof-detect" => &[
            ("decision.fused.score", "Spoofing detection"),
            ("decision.raim.statistic", "Spoofing detection"),
        ],
        "telecom-timing" => &[
            ("time_error.max_abs_te_ns", "Oscillator holdover presets from public datasheets"),
            ("holdover_envelope.time_to_exceed_s", "ITU-T telecom synchronisation masks with PASS/FAIL and margin"),
            ("holdover_envelope.min_margin_ns", "ITU-T telecom synchronisation masks with PASS/FAIL and margin"),
        ],
        "terrain-nav" => &[
            ("matched_error_m", "Alternative / complementary PNT"),
            ("free_inertial_drift_m", ""),
        ],
        "terrain-slam" => &[
            ("matched_rms_m", "Alternative / complementary PNT"),
            ("matched_final_m", "Alternative / complementary PNT"),
            ("free_inertial_rms_m", ""),
        ],
        "time-transfer-budget" => &[
            ("terms_ns.offset", "TWSTFT two-way equation, uncertainty budget and link stability with flicker and diurnal non-reciprocity"),
            ("combined_uncertainty_ns", "TWSTFT two-way equation, uncertainty budget and link stability with flicker and diurnal non-reciprocity"),
        ],
        "timetransfer" => &[
            ("quantum.fom.sync_rms_ps", "Time-transfer error budgeting"),
            ("classical.fom.sync_rms_ps", "Time-transfer error budgeting"),
            ("quantum.fom.range_rms_mm", "Time-transfer error budgeting"),
            ("classical.fom.range_rms_mm", "Time-transfer error budgeting"),
        ],
        "tracking-loop" => &[
            ("lock_history.declared_loss_of_lock_s", "Tracking-loop loss of lock and spoof pull-in under interference"),
            ("denial.denial_radius_loop_dynamics_km", "Tracking-loop loss of lock and spoof pull-in under interference"),
            ("spoof_pull_in.max_code_slew_chips_per_s", "Tracking-loop loss of lock and spoof pull-in under interference"),
            ("spoof_pull_in.max_doppler_rate_hz_per_s", "Tracking-loop loss of lock and spoof pull-in under interference"),
        ],
        _ => return None,
    })
}

/// The `figure_tiers` block for a kind in [`kind_figures`], built from its result
/// document `doc`: each listed figure that is present and not null, with the tier read
/// from its owning row, and the figures no row owns under `untiered`. `None` for a kind
/// outside the table, a frozen-prediction kind, or a document with no listed figure.
pub fn kind_figure_tiers(kind: &str, doc: &serde_json::Value) -> Option<serde_json::Value> {
    use serde_json::{json, Value};
    if FROZEN_PREDICTION_KINDS.contains(&kind) {
        return None;
    }
    let table = kind_figures(kind)?;
    let matrix = verification_matrix();
    let mut figures = Vec::new();
    let mut untiered = Vec::new();
    for (path, requirement) in table {
        let mut node = doc;
        for seg in path.split('.') {
            node = node.get(seg).unwrap_or(&Value::Null);
        }
        if node.is_null() {
            continue;
        }
        match matrix.iter().find(|it| it.requirement == *requirement) {
            Some(row) if !requirement.is_empty() => {
                let tier = match row.status {
                    VerificationStatus::Validated => ValidationTier::Validated,
                    _ => ValidationTier::Modelled,
                };
                figures.push(json!({
                    "path": path,
                    "tier": tier.tag(),
                    "requirement": requirement,
                    "applicable": true,
                }));
            }
            _ => untiered.push(json!({ "path": path, "reason": NO_OWNING_ROW })),
        }
    }
    if figures.is_empty() && untiered.is_empty() {
        return None;
    }
    let mut block = json!({
        "source": "src/verification.rs (the verification matrix), read through src/fom_label.rs",
        "legend": "VALIDATED: checked against an independent external oracle. MODELLED: \
                   first-principles or published-formula model, internally tested, with no \
                   external oracle to a stated tolerance. applicable=false: the figure is \
                   emitted for continuity but does not answer a question this scenario asks",
        "figures": figures,
    });
    if !untiered.is_empty() {
        block["untiered"] = Value::Array(untiered);
    }
    Some(block)
}

#[cfg(test)]
mod tests {
    use super::*;

    // Every FoM field resolves to a tier; an unknown name does not.
    #[test]
    fn known_foms_resolve_unknown_does_not() {
        for name in [
            "timing_rms_ns",
            "timing_p95_ns",
            "holdover_s",
            "timing_holdover_s",
            "resilience_slope_ns_per_s",
            "availability",
            "integrity",
            "security",
        ] {
            assert!(tier_for(name).is_some(), "no tier for {name}");
        }
        assert_eq!(tier_for("not_a_fom"), None);
    }

    // The tier is the matrix's status, not an independent assertion: every FoM's
    // owning requirement must exist in the matrix and its tier must match.
    #[test]
    fn tier_is_read_back_from_the_matrix() {
        let matrix = verification_matrix();
        for name in [
            "timing_rms_ns",
            "timing_p95_ns",
            "holdover_s",
            "timing_holdover_s",
            "resilience_slope_ns_per_s",
            "availability",
            "integrity",
            "security",
        ] {
            let req = owning_requirement(name).expect("known FoM has an owning requirement");
            let row = matrix
                .iter()
                .find(|it| it.requirement == req)
                .unwrap_or_else(|| panic!("owning requirement '{req}' missing from matrix"));
            let expected = match row.status {
                VerificationStatus::Validated => ValidationTier::Validated,
                _ => ValidationTier::Modelled,
            };
            assert_eq!(tier_for(name), Some(expected), "tier drift for {name}");
        }
    }

    // The honest expectation: holdover is a modelled coast, never validated.
    #[test]
    fn holdover_is_modelled() {
        assert_eq!(tier_for("holdover_s"), Some(ValidationTier::Modelled));
    }

    // The block describes what a document reports: absent and null figures are
    // skipped, a figure no row owns is listed as untiered rather than given a tier,
    // and security is flagged not applicable only when no attack is configured.
    #[test]
    fn figure_tiers_describes_only_what_the_document_reports() {
        let doc = serde_json::json!({
            "quantum": { "fom": {
                "timing_holdover_s": 10.0,
                "position_p95_m": 2.0,
                "integrity": null,
                "security": 0.5,
            }},
        });
        let b = figure_tiers(
            &doc,
            &["quantum.fom", "classical.fom"],
            HYBRID_FOM_FIELDS,
            false,
        );
        let figs = b["figures"].as_array().unwrap();
        let paths: Vec<&str> = figs.iter().map(|f| f["path"].as_str().unwrap()).collect();
        assert_eq!(
            paths,
            ["quantum.fom.timing_holdover_s", "quantum.fom.security"]
        );
        assert_eq!(figs[0]["applicable"], true);
        assert_eq!(figs[1]["applicable"], false);
        assert_eq!(figs[1]["reason"], SECURITY_NOT_APPLICABLE);
        let untiered = b["untiered"].as_array().unwrap();
        assert_eq!(untiered.len(), 1);
        assert_eq!(untiered[0]["path"], "quantum.fom.position_p95_m");

        let with_attack = figure_tiers(&doc, &["quantum.fom"], HYBRID_FOM_FIELDS, true);
        assert_eq!(with_attack["figures"][1]["applicable"], true);
        assert!(with_attack["figures"][1].get("reason").is_none());
    }

    // The tag strings are stable for inline rendering.
    #[test]
    fn tags_are_stable() {
        assert_eq!(ValidationTier::Validated.tag(), "VALIDATED");
        assert_eq!(ValidationTier::Modelled.tag(), "MODELLED");
        assert_eq!(ValidationTier::Partial.tag(), "PARTIAL");
    }
}
