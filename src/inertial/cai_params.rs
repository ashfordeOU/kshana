// SPDX-License-Identifier: Apache-2.0
//! Cited cold-atom-interferometer (CAI) **performance parameter sheet** (B03).
//!
//! A quantum-PNT bid has to speak the sensor-physics community's language: bias
//! instability, velocity/angle random walk, scale-factor stability, the
//! interrogation-time-limited sample rate, and the fringe-ambiguity-limited
//! dynamic range. This module curates those metrics as **bracketed** (best /
//! nominal / conservative) values, each **traceable to a published source**, and
//! encodes them so the navigation budget ([`crate::inertial::quantum_imu::QuantumNavBudget`])
//! and the trade engine ([`crate::quantum_trade`]) can consume CAI *performance*
//! **without modelling any partner's hardware**.
//!
//! ### Honesty discipline (load-bearing)
//! - **No point numbers.** Every metric is a [`CitedBracket`] — a low/nominal/high
//!   range. The artifact never reports a single spuriously-precise figure.
//! - **Every bracket carries its citation** ([`CitedBracket::source`]) and is
//!   flagged [`CitedBracket::needs_source_confirmation`] = `true`: these are
//!   literature-survey *order-of-magnitude* brackets, to be confirmed against the
//!   named primary source before any bid use.
//! - **Performance-level, not hardware.** We quantify what a navigation-grade CAI
//!   *delivers*; we do not model a specific device, claim flight heritage, or
//!   validate anyone's instrument.
//! - **Cross-checked, not asserted.** The cited velocity-random-walk bracket is
//!   cross-checked against the velocity-random-walk that the *existing* CAI
//!   interferometer physics ([`CaiAccelerometer::accel_asd`]) produces for a
//!   documented reference configuration — an internal-consistency oracle. The raw
//!   dynamic range is **computed** from the fringe-ambiguity limit `2π/(k_eff·T²)`,
//!   not stated.
//! - This is a **MODELLED** sheet over **published** numbers; it must never borrow
//!   the external-oracle validation islands (SGP4 / Allan-Stable32 / IGS).

use serde::Serialize;

use crate::inertial::quantum_imu::{CaiAccelerometer, QuantumNavBudget, RB87_D2_WAVELENGTH_M};

/// Which end of a [`CitedBracket`] a consumer wants.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize)]
pub enum BracketLevel {
    /// The best (most optimistic) published performance.
    Best,
    /// The representative / nominal published performance.
    Nominal,
    /// The conservative (worst-case) published performance.
    Conservative,
}

/// A published performance metric as a low/nominal/high bracket, with its citation.
///
/// The stored values are always **numerically ordered** `low ≤ nominal ≤ high`.
/// Whether *larger is better* (sample rate, dynamic range) or *smaller is better*
/// (bias, random walk, scale-factor error) is carried by [`Self::higher_is_better`]
/// so [`Self::at`] can return the right end for a requested [`BracketLevel`].
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CitedBracket {
    /// Numerically smallest value of the bracket.
    pub low: f64,
    /// Representative / nominal value (`low ≤ nominal ≤ high`).
    pub nominal: f64,
    /// Numerically largest value of the bracket.
    pub high: f64,
    /// Physical unit (e.g. `"m/s^2"`, `"m/s^2/sqrt(Hz)"`, `"ppm"`, `"Hz"`).
    pub unit: String,
    /// `true` when larger numbers are *better* performance (sample rate, dynamic
    /// range); `false` when smaller is better (bias, random walk, scale error).
    pub higher_is_better: bool,
    /// The citation this bracket traces to. Required — a bracket with no source is
    /// invalid by construction.
    pub source: String,
    /// Always `true` here: a literature-survey order-of-magnitude bracket whose
    /// exact values must be confirmed against the primary source before bid use.
    pub needs_source_confirmation: bool,
    /// Free-text note (what limits this metric, hybridisation caveats, etc.).
    pub note: String,
}

impl CitedBracket {
    /// Validate: all finite, non-negative, ordered `low ≤ nominal ≤ high`, sourced.
    pub fn is_valid(&self) -> bool {
        self.low.is_finite()
            && self.nominal.is_finite()
            && self.high.is_finite()
            && self.low >= 0.0
            && self.low <= self.nominal
            && self.nominal <= self.high
            && !self.source.trim().is_empty()
    }

    /// The value at a requested performance level, respecting [`Self::higher_is_better`].
    pub fn at(&self, level: BracketLevel) -> f64 {
        match (level, self.higher_is_better) {
            (BracketLevel::Nominal, _) => self.nominal,
            (BracketLevel::Best, true) => self.high,
            (BracketLevel::Best, false) => self.low,
            (BracketLevel::Conservative, true) => self.low,
            (BracketLevel::Conservative, false) => self.high,
        }
    }
}

/// A curated, cited cold-atom-interferometer performance parameter sheet.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CaiParameterSheet {
    /// Residual accelerometer bias instability (m/s²); smaller is better.
    pub bias_instability: CitedBracket,
    /// Acceleration noise / velocity-random-walk ASD (m/s²/√Hz); smaller is better.
    pub velocity_random_walk: CitedBracket,
    /// Scale-factor stability (ppm); smaller is better (CAI scale factor is set by
    /// the atomic transition / laser frequency, so it is ppb-class).
    pub scale_factor_stability: CitedBracket,
    /// Interrogation-time-limited measurement sample rate (Hz); larger is better.
    pub sample_rate: CitedBracket,
    /// Fringe-ambiguity-limited dynamic range (m/s²); larger is better. The raw
    /// single-sensor limit is small (see [`Self::raw_fringe_ambiguity_accel`]) and
    /// is extended by hybridisation with a classical accelerometer.
    pub dynamic_range: CitedBracket,
    /// Sagnac atom-gyro angle-random-walk equivalent rotation-rate ASD
    /// (rad/s/√Hz); smaller is better. Informational (the budget here is the
    /// accelerometer path); included so the trade table can quote the gyro too.
    pub angle_random_walk: CitedBracket,
    /// On-artifact caveat.
    pub caveat: String,
}

impl CaiParameterSheet {
    /// The curated literature-survey sheet. **Every** bracket is flagged
    /// `needs_source_confirmation = true`: these are order-of-magnitude brackets
    /// distilled from the published atom-interferometry literature, to be
    /// confirmed against the named primary source before bid submission.
    ///
    /// Umbrella survey: Bongs et al., "Taking atom interferometric quantum sensors
    /// from the laboratory to real-world applications", *Nature Reviews Physics* 1,
    /// 731–739 (2019). Primary sources are named per metric below.
    pub fn literature_survey() -> Self {
        let confirm = true;
        CaiParameterSheet {
            bias_instability: CitedBracket {
                low: 1.0e-7,
                nominal: 1.0e-6,
                high: 1.0e-5,
                unit: "m/s^2".into(),
                higher_is_better: false,
                source: "Bongs et al., Nat. Rev. Phys. 1, 731 (2019); Geiger et al., \
                         Nat. Commun. 2, 474 (2011) (airborne CAI ~few µg); Exail/Muquans \
                         AQG instrument class"
                    .into(),
                needs_source_confirmation: confirm,
                note: "≈0.01–1 µg-class residual bias after calibration; long-tau lab \
                       instruments reach the low end, airborne/field the high end"
                    .into(),
            },
            velocity_random_walk: CitedBracket {
                low: 1.0e-8,
                nominal: 1.0e-7,
                high: 1.0e-6,
                unit: "m/s^2/sqrt(Hz)".into(),
                higher_is_better: false,
                source: "Bongs et al., Nat. Rev. Phys. 1, 731 (2019); Geiger et al., \
                         Nat. Commun. 2, 474 (2011); shot-noise-limited CAI sensitivity"
                    .into(),
                needs_source_confirmation: confirm,
                note: "acceleration ASD ≈ tens of ng/√Hz (lab) to ~µg/√Hz (field); \
                       cross-checked against CaiAccelerometer::accel_asd physics"
                    .into(),
            },
            scale_factor_stability: CitedBracket {
                low: 1.0e-3,
                nominal: 1.0e-2,
                high: 1.0e-1,
                unit: "ppm".into(),
                higher_is_better: false,
                source: "CAI scale factor = k_eff·T² set by the atomic transition / \
                         optical frequency reference (ppb-class); Le Gouët et al., \
                         Appl. Phys. B 92, 133 (2008); Bongs et al. (2019)"
                    .into(),
                needs_source_confirmation: confirm,
                note: "≈1–100 ppb (0.001–0.1 ppm); the headline CAI advantage over \
                       MEMS/FOG — scale factor traces to fundamental constants"
                    .into(),
            },
            sample_rate: CitedBracket {
                low: 0.5,
                nominal: 2.0,
                high: 10.0,
                unit: "Hz".into(),
                higher_is_better: true,
                source: "interrogation-time/cycle-time limit (T_c = prepare+interrogate+detect); \
                         interleaved/joint-interrogation extends rate, e.g. Savoie et al., \
                         Sci. Adv. 4, eaau7948 (2018)"
                    .into(),
                needs_source_confirmation: confirm,
                note: "long interrogation T → low rate (≥0.5 Hz); short-T / interleaved \
                       operation → ~10 Hz; dead time is the core limitation"
                    .into(),
            },
            dynamic_range: CitedBracket {
                low: 1.0e-3,
                nominal: 1.0,
                high: 50.0,
                unit: "m/s^2".into(),
                higher_is_better: true,
                source: "raw single-sensor range = fringe-ambiguity limit 2π/(k_eff·T²) \
                         (computed, see raw_fringe_ambiguity_accel); extended by hybrid \
                         CAI+classical operation, e.g. Lautier et al., APL 105, 144102 \
                         (2014); Cheiney et al., PRApplied 10, 034030 (2018)"
                    .into(),
                needs_source_confirmation: confirm,
                note: "raw fringe ambiguity is sub-mg per fringe → CAI must be \
                       hybridised with a classical accelerometer to reach navigation \
                       dynamic ranges (~several g)"
                    .into(),
            },
            angle_random_walk: CitedBracket {
                low: 1.0e-9,
                nominal: 1.0e-8,
                high: 1.0e-7,
                unit: "rad/s/sqrt(Hz)".into(),
                higher_is_better: false,
                source: "atom Sagnac gyroscopes: Gauguet et al., PRA 80, 063604 (2009); \
                         Stockton et al., PRL 107, 133001 (2011); Durfee et al., PRL 97, \
                         240801 (2006)"
                    .into(),
                needs_source_confirmation: confirm,
                note: "rotation-rate sensitivity ≈ 1e-9–1e-7 rad/s/√Hz; informational \
                       (the consumed budget here is the accelerometer path)"
                    .into(),
            },
            caveat: "MODELLED literature-survey parameter sheet. Every bracket is an \
                     order-of-magnitude range distilled from published atom-interferometry \
                     sources and is flagged needs_source_confirmation=true: confirm exact \
                     values against the named primary source before bid submission. \
                     Performance-level only — no hardware is modelled, no device validated, \
                     no flight heritage implied. Does NOT borrow the SGP4/Allan/IGS \
                     external-validation halo."
                .into(),
        }
    }

    /// Validate the whole sheet: every bracket valid and flagged for confirmation.
    pub fn is_valid(&self) -> bool {
        let brackets = [
            &self.bias_instability,
            &self.velocity_random_walk,
            &self.scale_factor_stability,
            &self.sample_rate,
            &self.dynamic_range,
            &self.angle_random_walk,
        ];
        brackets
            .iter()
            .all(|b| b.is_valid() && b.needs_source_confirmation)
    }

    /// A documented reference cold-atom accelerometer configuration for a requested
    /// level. The cycle time follows the [`Self::sample_rate`] bracket; the other
    /// physics (Rb87 D2 line, pulse separation, atom number, contrast) are standard
    /// laboratory values. This is the configuration whose physics-derived VRW is
    /// cross-checked against the cited [`Self::velocity_random_walk`] bracket.
    pub fn reference_cai(&self, level: BracketLevel) -> CaiAccelerometer {
        let rate = self.sample_rate.at(level).max(1.0e-6);
        CaiAccelerometer {
            wavelength_m: RB87_D2_WAVELENGTH_M,
            pulse_sep_t: 0.05,
            atom_number: 1.0e6,
            contrast: 0.5,
            cycle_time_s: 1.0 / rate,
        }
    }

    /// Build a [`QuantumNavBudget`] that **consumes** the cited brackets at the
    /// requested level: bias and scale-factor stability are taken directly from the
    /// sheet, the white-noise floor comes from the reference CAI physics, and the
    /// caller supplies the sustained specific force `ref_accel_m_s2` (scale-factor
    /// lever; ≈0 in free-fall) and the long-term stability time `tau_stability_s`
    /// (`≤0` disables degradation).
    pub fn to_nav_budget(
        &self,
        level: BracketLevel,
        ref_accel_m_s2: f64,
        tau_stability_s: f64,
    ) -> QuantumNavBudget {
        QuantumNavBudget {
            cai: self.reference_cai(level),
            bias_m_s2: self.bias_instability.at(level),
            scale_factor_ppm: self.scale_factor_stability.at(level),
            ref_accel_m_s2,
            tau_stability_s,
        }
    }

    /// The **computed** raw single-sensor dynamic range (m/s²) — the acceleration
    /// change that wraps the interferometer fringe by `2π`: `2π/(k_eff·T²)`. This is
    /// derived from the reference CAI physics, not asserted; it shows why a bare CAI
    /// must be hybridised to reach navigation dynamic ranges.
    pub fn raw_fringe_ambiguity_accel(&self, level: BracketLevel) -> f64 {
        let cai = self.reference_cai(level);
        let scale = cai.scale_factor(); // k_eff·T² (rad per m/s²)
        if scale == 0.0 {
            return f64::INFINITY;
        }
        2.0 * std::f64::consts::PI / scale
    }

    /// Internal-consistency oracle: does the reference CAI physics reproduce the
    /// cited velocity-random-walk bracket? Returns `(physics_vrw, lit_low, lit_high,
    /// within)` where `physics_vrw` is [`CaiAccelerometer::accel_asd`] and `within`
    /// is true iff it lands inside the cited bracket at this level.
    pub fn vrw_consistency(&self, level: BracketLevel) -> (f64, f64, f64, bool) {
        let physics = self.reference_cai(level).accel_asd();
        let lo = self.velocity_random_walk.low;
        let hi = self.velocity_random_walk.high;
        (physics, lo, hi, physics >= lo && physics <= hi)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn literature_survey_is_valid_and_flagged_for_confirmation() {
        let s = CaiParameterSheet::literature_survey();
        assert!(s.is_valid(), "the curated sheet must validate");
        // Every bracket must carry a non-empty citation AND the confirmation flag.
        for b in [
            &s.bias_instability,
            &s.velocity_random_walk,
            &s.scale_factor_stability,
            &s.sample_rate,
            &s.dynamic_range,
            &s.angle_random_walk,
        ] {
            assert!(!b.source.trim().is_empty(), "bracket without a source");
            assert!(
                b.needs_source_confirmation,
                "bracket not flagged for confirmation"
            );
        }
    }

    #[test]
    fn bracket_level_selection_respects_performance_direction() {
        let s = CaiParameterSheet::literature_survey();
        // Smaller-is-better: Best = low end, Conservative = high end.
        assert_eq!(
            s.bias_instability.at(BracketLevel::Best),
            s.bias_instability.low
        );
        assert_eq!(
            s.bias_instability.at(BracketLevel::Conservative),
            s.bias_instability.high
        );
        // Larger-is-better: Best = high end, Conservative = low end.
        assert_eq!(s.sample_rate.at(BracketLevel::Best), s.sample_rate.high);
        assert_eq!(
            s.sample_rate.at(BracketLevel::Conservative),
            s.sample_rate.low
        );
        // Nominal is always the middle.
        assert_eq!(
            s.bias_instability.at(BracketLevel::Nominal),
            s.bias_instability.nominal
        );
        assert_eq!(
            s.sample_rate.at(BracketLevel::Nominal),
            s.sample_rate.nominal
        );
    }

    #[test]
    fn nav_budget_consumes_the_cited_brackets() {
        let s = CaiParameterSheet::literature_survey();
        let b = s.to_nav_budget(BracketLevel::Nominal, 1.0, 0.0);
        // The budget's bias/scale come straight from the sheet at this level.
        assert_eq!(b.bias_m_s2, s.bias_instability.at(BracketLevel::Nominal));
        assert_eq!(
            b.scale_factor_ppm,
            s.scale_factor_stability.at(BracketLevel::Nominal)
        );
    }

    #[test]
    fn conservative_budget_drifts_more_than_best_budget() {
        // A genuine monotonic consistency check: every error term is worse at the
        // conservative level (larger bias, larger scale error, lower sample rate →
        // larger VRW), so the total dead-reckoning drift must be larger.
        let s = CaiParameterSheet::literature_survey();
        let best = s.to_nav_budget(BracketLevel::Best, 1.0, 0.0);
        let cons = s.to_nav_budget(BracketLevel::Conservative, 1.0, 0.0);
        let t = 100.0;
        assert!(
            cons.position_drift_1sigma(t) > best.position_drift_1sigma(t),
            "conservative {} should exceed best {}",
            cons.position_drift_1sigma(t),
            best.position_drift_1sigma(t)
        );
    }

    #[test]
    fn physics_vrw_lands_within_the_cited_vrw_bracket() {
        // The internal-consistency oracle: the reference CAI interferometer physics
        // must reproduce the cited velocity-random-walk bracket at every level.
        let s = CaiParameterSheet::literature_survey();
        for level in [
            BracketLevel::Best,
            BracketLevel::Nominal,
            BracketLevel::Conservative,
        ] {
            let (physics, lo, hi, within) = s.vrw_consistency(level);
            assert!(
                within,
                "physics VRW {physics:.3e} fell outside cited bracket [{lo:.3e}, {hi:.3e}] at {level:?}"
            );
        }
    }

    #[test]
    fn raw_fringe_ambiguity_is_computed_and_far_below_the_hybrid_range() {
        // The raw single-fringe range is computed from k_eff·T² and is sub-mg —
        // far below the hybrid-extended dynamic-range bracket. This is why a bare
        // CAI must be hybridised, and it is derived, not asserted.
        let s = CaiParameterSheet::literature_survey();
        let raw = s.raw_fringe_ambiguity_accel(BracketLevel::Nominal);
        // Reference T=0.05 s, Rb87 → 2π/(k_eff·T²) ≈ 1.56e-4 m/s².
        assert!(
            (raw - 1.56e-4).abs() < 2.0e-5,
            "raw fringe-ambiguity accel was {raw:.3e}, expected ≈1.56e-4"
        );
        assert!(
            raw < s.dynamic_range.high,
            "hybridisation must extend the range well beyond the raw fringe limit"
        );
    }

    #[test]
    fn invalid_brackets_are_rejected() {
        let mut bad = CaiParameterSheet::literature_survey();
        // Disorder the bias bracket (low > nominal).
        bad.bias_instability.low = 1.0;
        bad.bias_instability.nominal = 0.5;
        assert!(
            !bad.is_valid(),
            "disordered bracket must invalidate the sheet"
        );

        let mut unsourced = CaiParameterSheet::literature_survey();
        unsourced.sample_rate.source = "   ".into();
        assert!(
            !unsourced.is_valid(),
            "unsourced bracket must invalidate the sheet"
        );
    }

    #[test]
    fn serializes_with_sources_caveat_and_confirmation_flag() {
        let s = CaiParameterSheet::literature_survey();
        let json = serde_json::to_string(&s).unwrap();
        assert!(json.contains("source"));
        assert!(json.contains("needs_source_confirmation"));
        assert!(json.contains("MODELLED"));
        assert!(
            json.contains("Bongs"),
            "the umbrella citation should be on the artifact"
        );
        // The whole bracket, never a bare point.
        assert!(
            json.contains("\"low\"") && json.contains("\"nominal\"") && json.contains("\"high\"")
        );
    }
}
