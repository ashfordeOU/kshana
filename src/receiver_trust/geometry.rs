// SPDX-License-Identifier: AGPL-3.0-only
//! Geometry-aware trust: is the fix degraded by its satellite geometry, apart from the signal
//! environment and from attack-like inconsistency?
//!
//! A receiver beside a quay crane, in a lock or under a high hull loses satellites and its fix
//! gets worse for a reason that is not an attack. This module follows the 0.36 geometry design
//! note (`docs/design/2026-10-12-geometry-and-skyline-design.md`, section 4):
//!
//! * every epoch gets a geometry assessment ([`EpochGeometry`]: good, degraded with reasons, or
//!   unknown) from what the receiver reports: per-satellite elevation and azimuth (NMEA GSV,
//!   UBX-NAV-SAT), from which the dilution of precision (DOP) is derived with the engine's one
//!   DOP kernel, [`crate::orbit::dop`] (VALIDATED against gnss_lib_py), or the DOP the receiver
//!   states (NMEA GSA). A log with neither gets `unknown`, said as such: the engine does not
//!   guess a geometry it was not given;
//! * every epoch carries a label ([`GeometryLabel`]: `good`, `fair`, `poor`, `unknown`), the
//!   HDOP, PDOP, VDOP, satellite count and signal loss, and a note that says them in words:
//!   always reported, never scored;
//! * a vessel's score gains one monitor, [`super::monitors::Monitor::Geometry`], which deducts
//!   nothing unless the geometry is poor (its ratio `max(hdop / hdop_max, pdop / pdop_max,
//!   min_used / n_used)`, [`sky_ratio`], above 1: HDOP above 4, PDOP above 6 or fewer than 5
//!   satellites), then ramps linearly to `cap_points` (15) at `full_ratio` (1.5), never taking
//!   the score below `floor` (the degraded band) on its own ([`geometry_points`]; founder
//!   decision B1, 0.36). Good and fair geometry score exactly as in 0.35, and so does unknown
//!   geometry (the monitor does not run);
//! * every deduction carries a class ([`super::score::DeductionClass`]): `geometry`,
//!   `environment` or `inconsistency`. `loss-of-lock` is `geometry` when every satellite lost
//!   against the baseline was below `low_elev_deg` at its last report ([`GeometryTracker`]),
//!   and the geometry deduction is `inconsistency` when the HDOP the receiver states disagrees
//!   with the one its stated sky gives by more than the tolerance: a spoofer could fake a poor
//!   sky to buy tolerance, so the engine labels and does not forgive, and the comparison is
//!   the guard. With good or fair geometry the disagreement is reported, not scored.
//!
//! The thresholds and where each comes from are in [`GeometryCfg`] and [`PROVENANCE`]; every
//! run records them in the result's `geometry_model`. They are MODELLED: chosen, not fitted to
//! any log, and nothing here asserts how often natural degradation and attacks are told apart
//! on real data. A degradation classed as geometry is a statement about the sky, not a finding
//! that no attack occurred.

use serde::{Deserialize, Serialize};

use super::{LogEpoch, ReportedDop, SatSky};
use crate::orbit::dop;
use crate::portable_math::PortableFloat;
use crate::skyline::{Skyline, SkylineSummary};

/// The `[geometry]` table.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct GeometryCfg {
    /// HDOP above which the geometry is degraded. Default 4: at `sigma_uere_m` 1.5 m an HDOP of
    /// 4 is a 2drms of 12 m, the kinematic check's own allowance (`[maritime] kin_pos_tol_m`);
    /// above it geometry noise alone can approach that allowance. Chosen (design note, 4.2).
    /// IEC 61108-1 is commonly cited as stating its accuracy requirements for HDOP 4 or less
    /// (or PDOP 6): recalled from secondary GNSS receiver literature, no specific secondary
    /// source consulted and the standard not read; to be checked against the standard's text.
    pub hdop_max: f64,
    /// PDOP above which the geometry is degraded. Default 6: the PDOP availability threshold
    /// of the bundled `scenarios/polar-arctic-leo-coverage.toml` (`pdop_threshold = 6.0`), and
    /// the GPS SPS Performance Standard (5th ed., 2020) PDOP availability standard (PDOP 6 or
    /// less) as cited in `tests/constellation_availability_published_spec_oracle.rs`; to be
    /// checked against the standard's text.
    pub pdop_max: f64,
    /// Fewest satellites used for a geometry that is not degraded. Default 5: one more than a
    /// fix needs, so a single loss does not end the fix, and the fewest with one redundant
    /// measurement for a receiver's own consistency check (RAIM).
    pub min_used: usize,
    /// The ranging error the HDOP threshold is stated against, m. Default 1.5: a stated input
    /// for the 2drms link above; set the receiver's own figure.
    pub sigma_uere_m: f64,
    /// Absolute part of the tolerance between the HDOP the receiver states (GSA, else GGA) and
    /// the HDOP derived from the sky it states. Default 1.0 (design note, 4.2). The tolerance is
    /// `max(reported_vs_derived_tol, reported_vs_derived_rel * derived HDOP)`; beyond it the
    /// geometry deduction is classed `inconsistency`.
    pub reported_vs_derived_tol: f64,
    /// Relative part of that tolerance, a fraction of the derived HDOP. Default 0.25, a
    /// REPRESENTATIVE engineering choice, not a measured or standard figure: a receiver that
    /// solves with one clock per constellation, or with a subset of the satellites it tracks
    /// (an elevation mask, a C/N0 cut, a RAIM exclusion), states an HDOP that differs from the
    /// single-clock HDOP of every tracked satellite by an amount that grows with the HDOP, so a
    /// fixed absolute tolerance alone would class natural poor geometry as inconsistency.
    pub reported_vs_derived_rel: f64,
    /// Elevation below which a lost satellite counts as lost to the sky, degrees. Default 15
    /// (design note, 4.3): when every satellite lost against the baseline was below it at its
    /// last report, `loss-of-lock` is classed `geometry`. With a stated `[skyline]` a satellite
    /// behind the stated obstruction at its last report counts as lost to the sky as well.
    pub low_elev_deg: f64,
    /// Largest azimuth gap between tracked satellites at or above which the reason
    /// `sky-blocked` is reported, degrees. Default 180: every tracked satellite in one half
    /// of the horizon. Geometric, informational: it does not enter the ratio. The fallback
    /// rule: with a stated `[skyline]`, `sky-blocked` comes from the skyline instead.
    pub azimuth_gap_deg: f64,
    /// HDOP at or below which the geometry is labelled `good` (with `pdop_good` and
    /// `used_good`). Default 2: half of `hdop_max`. REPRESENTATIVE: the label only, never the
    /// score.
    pub hdop_good: f64,
    /// PDOP at or below which the geometry is labelled `good`. Default 3: half of `pdop_max`.
    /// REPRESENTATIVE: the label only.
    pub pdop_good: f64,
    /// Fewest satellites used for a `good` label. Default 6: one more than `min_used`, so a
    /// single loss still leaves a redundant measurement. REPRESENTATIVE: the label only.
    pub used_good: usize,
    /// Most points the geometry deduction can take. Default 15 (design note, 4.2).
    pub cap_points: f64,
    /// Ratio (of the poor thresholds) at which the deduction reaches `cap_points`. Default 1.5,
    /// the score's own `full_ratio`: HDOP 6, PDOP 9, or 3 satellites.
    pub full_ratio: f64,
    /// Lowest score geometry alone can leave. Default: the score's `degraded_min` (55), so
    /// geometry alone never reaches the untrusted band; a floor below `degraded_min` is refused.
    /// The cap in force is `min(cap_points, 100 - floor)`.
    pub floor: Option<f64>,
}

impl Default for GeometryCfg {
    fn default() -> Self {
        Self {
            hdop_max: 4.0,
            pdop_max: 6.0,
            min_used: 5,
            sigma_uere_m: 1.5,
            reported_vs_derived_tol: 1.0,
            reported_vs_derived_rel: 0.25,
            low_elev_deg: 15.0,
            azimuth_gap_deg: 180.0,
            hdop_good: 2.0,
            pdop_good: 3.0,
            used_good: 6,
            cap_points: 15.0,
            full_ratio: 1.5,
            floor: None,
        }
    }
}

/// Where each default of [`GeometryCfg`] comes from, `(key, provenance)`; recorded in every
/// result's `geometry_model`.
pub const PROVENANCE: [(&str, &str); 12] = [
    (
        "hdop_max",
        "chosen (0.36 geometry design note, 4.2): at sigma_uere_m 1.5 m, HDOP 4 is a 2drms of \
         12 m, the kinematic check's kin_pos_tol_m. IEC 61108-1 is commonly cited as stating its \
         accuracy requirements for HDOP <= 4 (or PDOP <= 6): recalled from secondary GNSS \
         receiver literature, no specific secondary source consulted and the standard not \
         read; to be checked against the standard's text",
    ),
    (
        "pdop_max",
        "the PDOP availability threshold of scenarios/polar-arctic-leo-coverage.toml \
         (pdop_threshold = 6.0); GPS SPS Performance Standard, 5th ed. (2020), PDOP <= 6, as \
         cited in tests/constellation_availability_published_spec_oracle.rs; to be checked \
         against the standard's text",
    ),
    (
        "min_used",
        "one more than a fix needs (four unknowns), so a single loss does not end the fix; the \
         fewest with one redundant measurement for RAIM (Parkinson and Axelrad 1988)",
    ),
    (
        "sigma_uere_m",
        "a stated input for the 2drms link of hdop_max (design note, 4.2); set the receiver's \
         own figure",
    ),
    (
        "reported_vs_derived_tol",
        "chosen (design note, 4.2): a stated HDOP more than the tolerance from the derived one \
         is not geometry and is classed inconsistency; the tolerance is max(1.0, \
         reported_vs_derived_rel x derived HDOP)",
    ),
    (
        "reported_vs_derived_rel",
        "REPRESENTATIVE engineering choice (0.25): per-constellation receiver clocks and subset \
         solutions make the stated HDOP differ from the derived single-clock HDOP by an amount \
         that grows with the HDOP; not a measured or standard figure",
    ),
    (
        "low_elev_deg",
        "design note, 4.3: satellites lost below 15 deg are lost to the sky (masking, \
         multipath and low signal); above it a loss stays environment",
    ),
    (
        "azimuth_gap_deg",
        "geometric: every tracked satellite in one half of the horizon (gap >= 180 deg); \
         informational, not in the ratio",
    ),
    (
        "hdop_good / pdop_good / used_good",
        "REPRESENTATIVE engineering choice for the label only (good, fair, poor), never the \
         score: half of hdop_max and pdop_max (the 0.35 score's onset ratio, 0.5), and one \
         satellite more than min_used so a single loss still leaves a redundant measurement",
    ),
    (
        "cap_points",
        "15 points (design note, 4.2): geometry alone moves the score from nominal (>= 90) into \
         degraded and never to untrusted (< 55); nothing is deducted unless the geometry is \
         poor (above hdop_max or pdop_max, or below min_used), so good and fair geometry score \
         as in 0.35 (founder decision B1, 0.36)",
    ),
    (
        "full_ratio",
        "the score's own full_ratio (1.5): the deduction ramps linearly from 0 at the poor \
         thresholds to cap_points at 1.5 times them",
    ),
    (
        "floor",
        "the score's degraded_min unless set: geometry alone never reaches the untrusted band; \
         the cap in force is min(cap_points, 100 - floor), so a [score] table that raises \
         degraded_min lowers the cap rather than being refused",
    ),
];

impl GeometryCfg {
    /// True for the defaults; used to leave the table out of a serialised monitor config.
    pub fn is_default(&self) -> bool {
        *self == GeometryCfg::default()
    }

    /// Reject thresholds that cannot mean anything.
    pub fn validate(&self) -> Result<(), String> {
        for (name, v) in [
            ("hdop_max", self.hdop_max),
            ("pdop_max", self.pdop_max),
            ("sigma_uere_m", self.sigma_uere_m),
            ("reported_vs_derived_tol", self.reported_vs_derived_tol),
        ] {
            if !(v.is_finite() && v > 0.0) {
                return Err(format!("geometry: {name} must be finite and > 0 (got {v})"));
            }
        }
        if !(self.reported_vs_derived_rel.is_finite() && self.reported_vs_derived_rel >= 0.0) {
            return Err(format!(
                "geometry: reported_vs_derived_rel must be finite and >= 0 (got {})",
                self.reported_vs_derived_rel
            ));
        }
        if self.min_used == 0 {
            return Err("geometry: min_used must be at least 1".into());
        }
        if !(self.low_elev_deg.is_finite() && (0.0..=90.0).contains(&self.low_elev_deg)) {
            return Err(format!(
                "geometry: low_elev_deg must be in [0, 90] (got {})",
                self.low_elev_deg
            ));
        }
        if !(self.azimuth_gap_deg.is_finite()
            && self.azimuth_gap_deg > 0.0
            && self.azimuth_gap_deg <= 360.0)
        {
            return Err(format!(
                "geometry: azimuth_gap_deg must be in (0, 360] (got {})",
                self.azimuth_gap_deg
            ));
        }
        if !(self.hdop_good.is_finite()
            && self.hdop_good > 0.0
            && self.hdop_good <= self.hdop_max
            && self.pdop_good.is_finite()
            && self.pdop_good > 0.0
            && self.pdop_good <= self.pdop_max
            && self.used_good >= self.min_used)
        {
            return Err(format!(
                "geometry: need 0 < hdop_good <= hdop_max, 0 < pdop_good <= pdop_max and \
                 used_good >= min_used (got {}, {}, {})",
                self.hdop_good, self.pdop_good, self.used_good
            ));
        }
        if !(self.cap_points.is_finite() && (0.0..=100.0).contains(&self.cap_points)) {
            return Err(format!(
                "geometry: cap_points must be in [0, 100] (got {})",
                self.cap_points
            ));
        }
        if !(self.full_ratio.is_finite() && self.full_ratio > 1.0) {
            return Err(format!(
                "geometry: full_ratio must be finite and > 1 (got {})",
                self.full_ratio
            ));
        }
        if let Some(f) = self.floor {
            if !(f.is_finite() && f > 0.0 && f <= 100.0) {
                return Err(format!("geometry: floor must be in (0, 100] (got {f})"));
            }
        }
        Ok(())
    }

    /// Check against the score's band edge: a floor below `degraded_min` would let geometry
    /// alone reach the untrusted band.
    pub fn validate_with(&self, degraded_min: f64) -> Result<(), String> {
        self.validate()?;
        match self.floor {
            Some(f) if f < degraded_min => Err(format!(
                "geometry: floor ({f}) is below the score's degraded_min ({degraded_min}): \
                 geometry alone could reach the untrusted band"
            )),
            _ => Ok(()),
        }
    }

    /// The lowest score geometry alone can leave.
    pub fn floor_in_force(&self, degraded_min: f64) -> f64 {
        self.floor.unwrap_or(degraded_min)
    }

    /// The most points the geometry deduction takes: `min(cap_points, 100 - floor)`.
    pub fn cap_in_force(&self, degraded_min: f64) -> f64 {
        self.cap_points
            .min(100.0 - self.floor_in_force(degraded_min))
            .max(0.0)
    }
}

/// The geometry verdict of one epoch.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum GeometryStatus {
    /// Enough satellites and DOP within the thresholds.
    Good,
    /// At least one reason in [`GeometryReason`].
    Degraded,
    /// The log gives no satellite geometry for this epoch (no GSV elevations and azimuths, no
    /// GSA, no NAV-SAT, or none within the hold time): geometry unknown.
    Unknown,
}

/// The geometry lane's label, always reported and never scored: `good` within the good levels
/// (`hdop_good`, `pdop_good`, `used_good`), `poor` beyond the thresholds the score deducts at
/// (`hdop_max`, `pdop_max`, `min_used`), `fair` between, `unknown` when the log gives no
/// geometry.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum GeometryLabel {
    /// Within every good level.
    Good,
    /// Neither good nor poor: not scored.
    Fair,
    /// Beyond a threshold: the only label the score deducts for.
    Poor,
    /// The log gives no geometry for this epoch.
    #[default]
    Unknown,
}

impl GeometryLabel {
    /// The label as written in the outputs.
    pub fn as_str(self) -> &'static str {
        match self {
            GeometryLabel::Good => "good",
            GeometryLabel::Fair => "fair",
            GeometryLabel::Poor => "poor",
            GeometryLabel::Unknown => "unknown",
        }
    }
}

/// Why the geometry of an epoch is degraded.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum GeometryReason {
    /// Fewer than `min_used` satellites tracked (derived) or used (reported).
    FewSatellites,
    /// PDOP above `pdop_max`, or no solution from four or more satellites (singular).
    HighPdop,
    /// HDOP above `hdop_max`.
    HighHdop,
    /// With a stated skyline: at least one satellite the receiver lists is behind it and not
    /// tracked. Without one (the fallback): the tracked satellites leave an azimuth gap of
    /// `azimuth_gap_deg` or more. Informational; not in the ratio.
    SkyBlocked,
}

/// Where an epoch's geometry came from.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum GeometrySource {
    /// Derived by the engine from the satellite elevations and azimuths the receiver reported
    /// (GSV, NAV-SAT), through [`crate::orbit::dop`].
    Derived,
    /// The DOP and satellites used as the receiver reported them (GSA).
    Reported,
    /// Nothing: the geometry is unknown.
    None,
}

/// The geometry of one epoch (the design note's `GeometryObs`).
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct EpochGeometry {
    /// `good`, `degraded` or `unknown`.
    pub status: GeometryStatus,
    /// Why it is degraded, in [`GeometryReason`] order.
    pub reasons: Vec<GeometryReason>,
    /// What the assessment is based on.
    pub source: GeometrySource,
    /// Satellites tracked above the horizon (derived) or used (reported).
    pub n_used: Option<usize>,
    /// Horizontal DOP, rounded to 0.001.
    pub hdop: Option<f64>,
    /// Position DOP, rounded to 0.001; `null` when it cannot be formed.
    pub pdop: Option<f64>,
    /// Vertical DOP, rounded to 0.001.
    pub vdop: Option<f64>,
    /// Fraction of the upper hemisphere's solid angle above the stated skyline (the
    /// scenario's `[skyline]` section), rounded to 0.001; `null` without a stated skyline or
    /// when the geometry is unknown.
    pub open_fraction: Option<f64>,
    /// Largest azimuth gap between tracked satellites, degrees, rounded to 0.1 (derived, four
    /// or more satellites).
    pub max_azimuth_gap_deg: Option<f64>,
    /// Age of the sky positions or GSA used, s.
    pub age_s: Option<f64>,
    /// The HDOP the receiver stated (GSA within the hold, else GGA), where it did.
    pub reported_hdop: Option<f64>,
    /// The stated HDOP and the derived one differ by more than
    /// `max(reported_vs_derived_tol, reported_vs_derived_rel * derived)`.
    pub reported_derived_mismatch: bool,
    /// The reason in words, for example "degraded by geometry: HDOP 5.200 above 4 (derived
    /// from 7 logged satellites); not an inconsistency". `null` for good geometry.
    pub note: Option<String>,
    /// Satellites the receiver lists at or above `low_elev_deg`, tracked or not (derived only).
    #[serde(default)]
    pub in_view: Option<usize>,
    /// Satellites are listed in view but not tracked, the sky they make is good, and they are
    /// not confined to one half of the horizon (or nothing is tracked at all): the loss is the
    /// signal environment, not the geometry. The geometry deduction is then classed
    /// `environment`.
    #[serde(default)]
    pub signal_loss: bool,
    /// `good`, `fair`, `poor` or `unknown` ([`GeometryLabel`]): always reported, never scored;
    /// the score deducts only for `poor`.
    #[serde(default)]
    pub label: GeometryLabel,
    /// With a stated skyline only (absent otherwise): satellites the receiver lists above the
    /// horizon, not tracked, and behind the stated skyline at their azimuth: lost to the sky.
    /// One or more makes the reason `sky-blocked`.
    #[serde(default, skip_serializing_if = "Option::is_none")]
    pub behind_skyline: Option<usize>,
}

impl EpochGeometry {
    /// The assessment of an epoch for which the log gives no geometry.
    pub fn unknown() -> Self {
        Self {
            status: GeometryStatus::Unknown,
            reasons: Vec::new(),
            source: GeometrySource::None,
            n_used: None,
            hdop: None,
            pdop: None,
            vdop: None,
            open_fraction: None,
            max_azimuth_gap_deg: None,
            age_s: None,
            reported_hdop: None,
            reported_derived_mismatch: false,
            note: Some(
                "geometry unknown: the log gives no satellite elevations and azimuths (GSV, \
                 NAV-SAT) and no DOP (GSA) for this epoch"
                    .into(),
            ),
            in_view: None,
            signal_loss: false,
            label: GeometryLabel::Unknown,
            behind_skyline: None,
        }
    }

    /// True when the geometry is degraded.
    pub fn is_degraded(&self) -> bool {
        self.status == GeometryStatus::Degraded
    }
}

/// The geometry monitor's ratio for an epoch and whether its deduction is an inconsistency:
/// `(ratio, inconsistency)`, the ratio being [`sky_ratio`] (`max(hdop / hdop_max, pdop /
/// pdop_max, min_used / n_used)`) and `inconsistency` saying that the HDOP the receiver states
/// disagrees with the one derived from its stated sky by more than `tol = max(reported_vs_
/// derived_tol, reported_vs_derived_rel * derived)`. The disagreement does not add to the
/// ratio: nothing is deducted unless the geometry is poor (founder decision B1, 0.36), and a
/// poor-geometry deduction whose stated HDOP the sky does not explain is classed
/// `inconsistency` rather than forgiven as sky. With good or fair geometry the disagreement is
/// reported (`reported_derived_mismatch` and the note) and not scored. `None` when the
/// geometry is unknown (the monitor does not decide).
pub fn geometry_ratio(g: &EpochGeometry, cfg: &GeometryCfg) -> Option<(f64, bool)> {
    let r = sky_ratio(g, cfg)?;
    let mismatch = match (g.hdop, g.reported_hdop, g.source) {
        (Some(d), Some(s), GeometrySource::Derived) => {
            (d - s).abs()
                / cfg
                    .reported_vs_derived_tol
                    .max(cfg.reported_vs_derived_rel * d)
        }
        _ => 0.0,
    };
    Some((r, mismatch > 1.0))
}

/// The geometry's own ratio, `max(hdop / hdop_max, pdop / pdop_max, min_used / n_used)`
/// (1.5 for a singular derived sky or none at all); above 1 the geometry is poor. `None` when
/// unknown.
pub fn sky_ratio(g: &EpochGeometry, cfg: &GeometryCfg) -> Option<f64> {
    if g.status == GeometryStatus::Unknown {
        return None;
    }
    let n = g.n_used.unwrap_or(0);
    let mut r: f64 = if n == 0 {
        1.5
    } else {
        cfg.min_used as f64 / n as f64
    };
    if let Some(h) = g.hdop {
        r = r.max(h / cfg.hdop_max);
    }
    match g.pdop {
        Some(p) => r = r.max(p / cfg.pdop_max),
        None if g.source == GeometrySource::Derived && n >= 4 => r = r.max(1.5),
        None => {}
    }
    Some(r)
}

/// Points the geometry deduction takes at `ratio` (from [`geometry_ratio`]): nothing up to 1
/// (the geometry is good or fair), rising linearly
/// to the cap in force at `full_ratio`, and flat beyond. With every ratio at or below 1 the
/// score is exactly that of 0.35.
pub fn geometry_points(ratio: f64, cfg: &GeometryCfg, degraded_min: f64) -> f64 {
    let cap = cfg.cap_in_force(degraded_min);
    if !ratio.is_finite() {
        return if ratio > 0.0 { cap } else { 0.0 };
    }
    cap * ((ratio - 1.0) / (cfg.full_ratio - 1.0)).clamp(0.0, 1.0)
}

/// The label of a known assessment.
fn label_of(g: &EpochGeometry, cfg: &GeometryCfg) -> GeometryLabel {
    match sky_ratio(g, cfg) {
        None => GeometryLabel::Unknown,
        Some(r) if r > 1.0 => GeometryLabel::Poor,
        Some(_)
            if g.hdop.is_none_or(|h| h <= cfg.hdop_good)
                && g.pdop.is_none_or(|p| p <= cfg.pdop_good)
                && g.n_used.unwrap_or(0) >= cfg.used_good =>
        {
            GeometryLabel::Good
        }
        Some(_) => GeometryLabel::Fair,
    }
}

fn round_to(x: f64, step: f64) -> f64 {
    (x / step).round() * step
}

/// Largest gap between consecutive azimuths (degrees, around the full circle). `None` for no
/// azimuth; 360 for one.
pub fn max_azimuth_gap_deg(azimuths: &[f64]) -> Option<f64> {
    let mut a: Vec<f64> = azimuths.iter().map(|x| x.rem_euclid(360.0)).collect();
    a.sort_by(f64::total_cmp);
    let first = *a.first()?;
    let last = *a.last()?;
    let mut gap = 360.0 - (last - first);
    for w in a.windows(2) {
        gap = gap.max(w[1] - w[0]);
    }
    Some(gap)
}

/// DOP of a set of line-of-sight directions given as `(elevation, azimuth)` in degrees, through
/// the engine's DOP kernel [`crate::orbit::dop`]. The user is placed on the equator at
/// longitude 0, where the kernel's local frame has East along +y, North along +z and Up along
/// +x; each satellite is put 20 000 km away along its direction (DOP depends on the directions
/// only). `None` with fewer than four satellites or a singular geometry. The direction cosines
/// use [`PortableFloat`], so the result has the same bits on every platform.
pub fn dop_from_sky(dirs: &[(f64, f64)]) -> Option<crate::orbit::Dop> {
    const R: f64 = 6_371_000.0;
    const D: f64 = 20_000_000.0;
    let user = [R, 0.0, 0.0];
    let sats: Vec<[f64; 3]> = dirs
        .iter()
        .map(|&(el, az)| {
            let (el, az) = (el.to_radians(), az.to_radians());
            let (se, ce) = (el.psin(), el.pcos());
            let (sa, ca) = (az.psin(), az.pcos());
            // East = +y, North = +z, Up = +x at this user.
            [R + D * se, D * ce * sa, D * ce * ca]
        })
        .collect();
    dop(user, &sats)
}

fn fmt_dop(x: Option<f64>) -> String {
    x.map_or("none".into(), |v| format!("{v:.3}"))
}

/// The status, reasons, label and words of an assessment. The words always open with the
/// label and the numbers ("geometry fair: HDOP 1.105, PDOP 1.831, VDOP 1.410, 8 satellites"),
/// then say why it is poor, or that it is not scored.
fn finish(g: EpochGeometry, cfg: &GeometryCfg) -> EpochGeometry {
    let mut g = finish_status(g, cfg);
    g.label = label_of(&g, cfg);
    let lead = format!(
        "geometry {}: HDOP {}, PDOP {}, VDOP {}, {} satellites{}",
        g.label.as_str(),
        fmt_dop(g.hdop),
        fmt_dop(g.pdop),
        fmt_dop(g.vdop),
        g.n_used.unwrap_or(0),
        if g.signal_loss { ", signal loss" } else { "" }
    );
    let rest = match (g.note.take(), g.label) {
        // The flag is never silent: with poor geometry the deduction is an inconsistency; with
        // good or fair geometry nothing is deducted, and the note says so.
        (Some(why), GeometryLabel::Poor) if g.reported_derived_mismatch => {
            format!("{why}: the geometry deduction is classed an inconsistency")
        }
        (Some(why), _) if g.reported_derived_mismatch => {
            format!("{why}: reported, not scored (the geometry is not poor)")
        }
        (Some(why), _) => why,
        (None, GeometryLabel::Poor) => "poor: scored".into(),
        (None, _) => format!(
            "not scored (the score deducts only above HDOP {}, PDOP {} or below {} satellites)",
            cfg.hdop_max, cfg.pdop_max, cfg.min_used
        ),
    };
    g.note = Some(format!("{lead}; {rest}"));
    g
}

/// The status, reasons and reason words of an assessment.
fn finish_status(mut g: EpochGeometry, cfg: &GeometryCfg) -> EpochGeometry {
    let n = g.n_used.unwrap_or(0);
    let mut reasons = Vec::new();
    if n < cfg.min_used {
        reasons.push(GeometryReason::FewSatellites);
    }
    let singular = g.source == GeometrySource::Derived && n >= 4 && g.pdop.is_none();
    if singular || g.pdop.is_some_and(|p| p > cfg.pdop_max) {
        reasons.push(GeometryReason::HighPdop);
    }
    if g.hdop.is_some_and(|h| h > cfg.hdop_max) {
        reasons.push(GeometryReason::HighHdop);
    }
    // A stated skyline decides `sky-blocked`; without one, the azimuth gap (the fallback).
    let blocked = match g.behind_skyline {
        Some(m) => m > 0,
        None => g
            .max_azimuth_gap_deg
            .is_some_and(|gap| gap >= cfg.azimuth_gap_deg),
    };
    if blocked {
        reasons.push(GeometryReason::SkyBlocked);
    }
    let from = match g.source {
        GeometrySource::Derived => format!("derived from {n} logged satellites"),
        _ => format!("as the receiver reports it, {n} satellites used"),
    };
    g.signal_loss = g.signal_loss && !reasons.is_empty();
    let mismatch_note = |g: &EpochGeometry| {
        format!(
            "the stated HDOP {} disagrees with the HDOP {} derived from the stated sky beyond \
             the tolerance",
            fmt_dop(g.reported_hdop),
            fmt_dop(g.hdop)
        )
    };
    g.note = if g.reported_derived_mismatch {
        Some(mismatch_note(&g))
    } else if g.signal_loss {
        Some(format!(
            "satellites in view but not tracked ({} of {} at or above {} deg): signal \
             environment, not geometry",
            g.in_view.unwrap_or(0).saturating_sub(n),
            g.in_view.unwrap_or(0),
            cfg.low_elev_deg
        ))
    } else {
        None
    };
    if g.note.is_some() {
        g.status = if reasons.is_empty() {
            GeometryStatus::Good
        } else {
            GeometryStatus::Degraded
        };
        g.reasons = reasons;
        return g;
    }
    g.note = (!reasons.is_empty()).then(|| {
        let mut parts = Vec::new();
        if reasons.contains(&GeometryReason::FewSatellites) {
            parts.push(format!("{n} satellites, fewer than {}", cfg.min_used));
        }
        if reasons.contains(&GeometryReason::HighPdop) {
            parts.push(format!("PDOP {} above {}", fmt_dop(g.pdop), cfg.pdop_max));
        }
        if reasons.contains(&GeometryReason::HighHdop) {
            parts.push(format!("HDOP {} above {}", fmt_dop(g.hdop), cfg.hdop_max));
        }
        if reasons.contains(&GeometryReason::SkyBlocked) {
            parts.push(match g.behind_skyline {
                Some(m) => format!("{m} satellites behind the stated skyline"),
                None => format!(
                    "every satellite in one half of the sky (gap {} deg)",
                    g.max_azimuth_gap_deg.unwrap_or(0.0)
                ),
            });
        }
        format!(
            "degraded by geometry: {} ({from}); not an inconsistency",
            parts.join(", ")
        )
    });
    g.status = if reasons.is_empty() {
        GeometryStatus::Good
    } else {
        GeometryStatus::Degraded
    };
    g.reasons = reasons;
    g
}

/// Whether a satellite at (`az_deg`, `el_deg`) is behind the stated skyline: below its cut
/// at that azimuth (the skyline alone, no receiver mask). False without a skyline.
fn behind(skyline: Option<&Skyline>, az_deg: f64, el_deg: f64) -> bool {
    skyline.is_some_and(|k| !k.is_empty() && !k.visible(az_deg, el_deg, 0.0))
}

/// The derived geometry of one epoch's sky, under an optional stated skyline.
fn from_sky(
    sky: &[SatSky],
    age_s: f64,
    cfg: &GeometryCfg,
    skyline: Option<&Skyline>,
) -> EpochGeometry {
    let used: Vec<&SatSky> = sky
        .iter()
        .filter(|s| s.tracked && s.elev_deg >= 0.0)
        .collect();
    let n = used.len();
    // Listed at or above low_elev_deg, tracked or not: the sky the receiver says it has. With
    // a stated skyline, a satellite behind it is not in that sky: it is lost to the sky.
    let listed: Vec<&SatSky> = sky
        .iter()
        .filter(|s| s.elev_deg >= cfg.low_elev_deg && !behind(skyline, s.azim_deg, s.elev_deg))
        .collect();
    let behind_skyline = skyline.map(|_| {
        sky.iter()
            .filter(|s| !s.tracked && s.elev_deg >= 0.0 && behind(skyline, s.azim_deg, s.elev_deg))
            .count()
    });
    let untracked: Vec<f64> = listed
        .iter()
        .filter(|s| !s.tracked)
        .map(|s| s.azim_deg)
        .collect();
    let in_view_dop = dop_from_sky(
        &listed
            .iter()
            .map(|s| (s.elev_deg, s.azim_deg))
            .collect::<Vec<_>>(),
    );
    let in_view_good = listed.len() >= cfg.min_used
        && in_view_dop.is_some_and(|d| d.pdop <= cfg.pdop_max && d.hdop <= cfg.hdop_max);
    // An obstruction on one side leaves its untracked satellites in one half of the horizon;
    // a loss with nothing tracked, or spread round the sky, is the signal environment. With a
    // stated skyline the obstruction is known: a satellite in the open sky it leaves that is
    // not tracked is the signal environment, wherever it is.
    let spread = skyline.is_some()
        || max_azimuth_gap_deg(&untracked).is_some_and(|g| g < cfg.azimuth_gap_deg);
    let signal_loss = !untracked.is_empty() && in_view_good && (n == 0 || spread);
    let d = dop_from_sky(
        &used
            .iter()
            .map(|s| (s.elev_deg, s.azim_deg))
            .collect::<Vec<_>>(),
    );
    let r = |x: f64| round_to(x, 1e-3);
    EpochGeometry {
        status: GeometryStatus::Good,
        reasons: Vec::new(),
        source: GeometrySource::Derived,
        n_used: Some(n),
        hdop: d.map(|d| r(d.hdop)),
        pdop: d.map(|d| r(d.pdop)),
        vdop: d.map(|d| r(d.vdop)),
        open_fraction: None,
        max_azimuth_gap_deg: if n >= 4 {
            max_azimuth_gap_deg(&used.iter().map(|s| s.azim_deg).collect::<Vec<_>>())
                .map(|g| round_to(g, 0.1))
        } else {
            None
        },
        age_s: Some(round_to(age_s, 1e-3)),
        reported_hdop: None,
        reported_derived_mismatch: false,
        note: None,
        in_view: Some(listed.len()),
        signal_loss,
        label: GeometryLabel::Unknown,
        behind_skyline,
    }
}

/// The geometry of one epoch from the DOP the receiver reported.
fn from_reported(rep: &ReportedDop, age_s: f64) -> EpochGeometry {
    EpochGeometry {
        status: GeometryStatus::Good,
        reasons: Vec::new(),
        source: GeometrySource::Reported,
        n_used: Some(rep.n_used as usize),
        hdop: rep.hdop,
        pdop: rep.pdop,
        vdop: rep.vdop,
        open_fraction: None,
        max_azimuth_gap_deg: None,
        age_s: Some(round_to(age_s, 1e-3)),
        reported_hdop: rep.hdop,
        reported_derived_mismatch: false,
        note: None,
        in_view: None,
        signal_loss: false,
        label: GeometryLabel::Unknown,
        behind_skyline: None,
    }
}

/// A DOP of 99 or more is the no-fix sentinel receivers send (99.9, 99.99), not a geometry.
pub const NO_FIX_DOP: f64 = 99.0;

/// Whether a GSA carries a fix: satellites used, and no DOP at the no-fix sentinel.
fn is_fix(r: &ReportedDop) -> bool {
    r.n_used > 0
        && [r.pdop, r.hdop, r.vdop]
            .iter()
            .all(|d| d.is_none_or(|v| v < NO_FIX_DOP))
}

/// Follows a log epoch by epoch and assesses each epoch's geometry from the latest sky
/// positions (or, failing them, the latest GSA) no older than the hold time, and remembers
/// each satellite's last reported elevation. Epochs are fed in the order they are scored; the
/// batch run and live mode both use it.
#[derive(Clone, Debug)]
pub struct GeometryTracker {
    cfg: GeometryCfg,
    hold_s: f64,
    sky: Option<(f64, Vec<SatSky>)>,
    reported: Option<(f64, ReportedDop)>,
    last_el: std::collections::BTreeMap<String, f64>,
    /// The last azimuth reported for each satellite, degrees (read only with a skyline).
    last_az: std::collections::BTreeMap<String, f64>,
    /// The stated skyline and its open fraction (rounded), where the scenario states one.
    skyline: Option<(Skyline, f64)>,
}

impl GeometryTracker {
    /// A tracker with thresholds `cfg`, holding sky positions for `hold_s` seconds.
    pub fn new(cfg: &GeometryCfg, hold_s: f64) -> Self {
        Self::with_skyline(cfg, hold_s, None)
    }

    /// [`GeometryTracker::new`] under a stated skyline (the scenario's `[skyline]` section).
    /// With `None` it is exactly [`GeometryTracker::new`]: the azimuth-gap rule decides
    /// `sky-blocked` and `open_fraction` is `null`.
    pub fn with_skyline(cfg: &GeometryCfg, hold_s: f64, skyline: Option<Skyline>) -> Self {
        Self {
            cfg: cfg.clone(),
            hold_s,
            sky: None,
            reported: None,
            last_el: Default::default(),
            last_az: Default::default(),
            skyline: skyline.map(|k| {
                let f = round_to(k.open_fraction(), 1e-3);
                (k, f)
            }),
        }
    }

    /// The last elevation reported for `sat`, degrees, if any.
    pub fn last_elevation(&self, sat: &str) -> Option<f64> {
        self.last_el.get(sat).copied()
    }

    /// Whether `loss-of-lock` is the sky's: every satellite in `lost` was below
    /// `low_elev_deg` at its last report, or (with a stated skyline) behind the skyline at
    /// its last reported azimuth and elevation (false for an empty set or a satellite never
    /// placed).
    pub fn lost_to_the_sky<'a>(&self, lost: impl IntoIterator<Item = &'a str>) -> bool {
        let mut any = false;
        let sk = self.skyline.as_ref().map(|(k, _)| k);
        for s in lost {
            any = true;
            match self.last_elevation(s) {
                Some(el) if el < self.cfg.low_elev_deg => {}
                Some(el) if self.last_az.get(s).is_some_and(|az| behind(sk, *az, el)) => {}
                _ => return false,
            }
        }
        any
    }

    /// Whether a stated skyline is in force.
    pub fn has_skyline(&self) -> bool {
        self.skyline.is_some()
    }

    /// The geometry of the next epoch.
    pub fn push(&mut self, e: &LogEpoch) -> EpochGeometry {
        if !e.sky.is_empty() {
            for s in &e.sky {
                self.last_el.insert(s.sat.clone(), s.elev_deg);
                if self.skyline.is_some() {
                    self.last_az.insert(s.sat.clone(), s.azim_deg);
                }
            }
            self.sky = Some((e.t_s, e.sky.clone()));
        }
        let mut g = self.assess(e);
        if let Some((_, f)) = &self.skyline {
            if g.status != GeometryStatus::Unknown {
                g.open_fraction = Some(*f);
            }
        }
        g
    }

    fn assess(&mut self, e: &LogEpoch) -> EpochGeometry {
        if let Some(r) = e.reported_dop.filter(is_fix) {
            self.reported = Some((e.t_s, r));
        }
        let fresh = |t0: f64| {
            let age = e.t_s - t0;
            (0.0..=self.hold_s).contains(&age).then_some(age)
        };
        // What the receiver says its HDOP is: GSA within the hold, else this epoch's GGA.
        let stated = self
            .reported
            .as_ref()
            .and_then(|(t0, r)| fresh(*t0).and(r.hdop))
            .or_else(|| e.marine.as_ref().and_then(|m| m.hdop))
            .filter(|h| h.is_finite() && *h > 0.0 && *h < NO_FIX_DOP);
        if let Some((t0, sky)) = &self.sky {
            if let Some(age) = fresh(*t0) {
                let mut g = from_sky(sky, age, &self.cfg, self.skyline.as_ref().map(|(k, _)| k));
                g.reported_hdop = stated;
                g.reported_derived_mismatch = match (g.hdop, stated) {
                    (Some(d), Some(s)) => {
                        (d - s).abs()
                            > self
                                .cfg
                                .reported_vs_derived_tol
                                .max(self.cfg.reported_vs_derived_rel * d)
                    }
                    _ => false,
                };
                return finish(g, &self.cfg);
            }
        }
        if let Some((t0, r)) = &self.reported {
            if let Some(age) = fresh(*t0) {
                return finish(from_reported(r, age), &self.cfg);
            }
        }
        EpochGeometry::unknown()
    }
}

/// The thresholds a run used, with their provenance: the `geometry_model` of a result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct GeometryModel {
    /// The thresholds.
    #[serde(flatten)]
    pub cfg: GeometryCfg,
    /// How long sky positions and GSA count after they arrive, s (the score's
    /// `evidence_hold_s`).
    pub hold_s: f64,
    /// The most points the geometry deduction takes, `min(cap_points, 100 - floor)`.
    pub cap_in_force: f64,
    /// The lowest score geometry alone can leave (`floor`, else the score's `degraded_min`).
    pub floor_in_force: f64,
    /// Where each default comes from.
    pub provenance: std::collections::BTreeMap<&'static str, &'static str>,
    /// The classes and the rules that assign them, in words.
    pub classes: &'static str,
    /// The stated skyline (`[skyline]`): its source, open fraction above the skyline alone
    /// and provenance. Absent without one.
    #[serde(skip_serializing_if = "Option::is_none")]
    pub skyline: Option<SkylineSummary>,
}

/// The deduction classes and their rules, in words, for the record of a run.
pub const CLASSES: &str = "geometry: the geometry monitor (which deducts only when the \
geometry is poor), and loss-of-lock when every satellite lost against the baseline was below \
low_elev_deg at its last report; environment: cn0-drop, cn0-spread, cn0-rise, agc, jam-ind, \
loss-of-lock otherwise, and the geometry monitor during signal loss (satellites in view not \
tracked while their geometry is good); inconsistency: every other monitor, and the geometry \
monitor when the stated HDOP disagrees with the derived one by more than \
max(reported_vs_derived_tol, reported_vs_derived_rel x derived HDOP). A geometry class is a \
statement about the sky, not a finding that no attack occurred.";

/// [`CLASSES`] under a stated skyline: what the skyline adds to the rules.
pub const CLASSES_WITH_SKYLINE: &str = "geometry: the geometry monitor (which deducts only when \
the geometry is poor), and loss-of-lock when every satellite lost against the baseline was below \
low_elev_deg or behind the stated skyline at its last report; environment: cn0-drop, cn0-spread, \
cn0-rise, agc, jam-ind, loss-of-lock otherwise, and the geometry monitor during signal loss \
(satellites in the open sky the stated skyline leaves, not tracked while their geometry is \
good); inconsistency: every other monitor, and the geometry monitor when the stated HDOP \
disagrees with the derived one by more than max(reported_vs_derived_tol, \
reported_vs_derived_rel x derived HDOP). sky-blocked: a satellite listed behind the stated \
skyline and not tracked. A geometry class is a statement about the sky, not a finding that no \
attack occurred.";

impl GeometryModel {
    /// The record of `cfg` held for `hold_s`, under a score whose degraded band starts at
    /// `degraded_min`.
    pub fn new(cfg: &GeometryCfg, hold_s: f64, degraded_min: f64) -> Self {
        Self {
            cfg: cfg.clone(),
            hold_s,
            cap_in_force: cfg.cap_in_force(degraded_min),
            floor_in_force: cfg.floor_in_force(degraded_min),
            provenance: PROVENANCE.iter().copied().collect(),
            classes: CLASSES,
            skyline: None,
        }
    }

    /// The record under a stated skyline: its summary (open fraction above the skyline
    /// alone, as each epoch's `open_fraction`) and the class rules it extends. `None` leaves
    /// the record as [`GeometryModel::new`] makes it.
    pub fn with_skyline(
        mut self,
        cfg: Option<&crate::skyline::SkylineCfg>,
        sky: Option<&Skyline>,
    ) -> Self {
        if let Some(s) = SkylineSummary::of(cfg, sky, 0.0) {
            self.skyline = Some(s);
            self.classes = CLASSES_WITH_SKYLINE;
        }
        self
    }
}

/// Epoch counts by geometry status and by deduction class: the `geometry_summary` of a result.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct GeometrySummary {
    /// Epochs with good geometry.
    pub good: usize,
    /// Epochs with degraded geometry.
    pub degraded: usize,
    /// Epochs whose geometry is unknown.
    pub unknown: usize,
    /// Epochs with at least one deduction classed `geometry`.
    pub class_geometry: usize,
    /// Epochs with at least one deduction classed `environment`.
    pub class_environment: usize,
    /// Epochs with at least one deduction classed `inconsistency`.
    pub class_inconsistency: usize,
    /// Time of the first epoch with degraded geometry, s.
    pub first_degraded_t_s: Option<f64>,
    /// Epochs labelled `good`.
    #[serde(default)]
    pub label_good: usize,
    /// Epochs labelled `fair` (not scored).
    #[serde(default)]
    pub label_fair: usize,
    /// Epochs labelled `poor` (the only label the score deducts for).
    #[serde(default)]
    pub label_poor: usize,
    /// Epochs whose stated HDOP the stated sky does not explain (`reported_derived_mismatch`),
    /// scored or not.
    #[serde(default)]
    pub hdop_mismatch: usize,
}

impl GeometrySummary {
    /// Count one epoch with its geometry and its deductions' classes.
    pub fn add(
        &mut self,
        t_s: f64,
        g: &EpochGeometry,
        classes: impl IntoIterator<Item = super::score::DeductionClass>,
    ) {
        use super::score::DeductionClass as C;
        match g.status {
            GeometryStatus::Good => self.good += 1,
            GeometryStatus::Degraded => {
                self.degraded += 1;
                self.first_degraded_t_s.get_or_insert(t_s);
            }
            GeometryStatus::Unknown => self.unknown += 1,
        }
        match g.label {
            GeometryLabel::Good => self.label_good += 1,
            GeometryLabel::Fair => self.label_fair += 1,
            GeometryLabel::Poor => self.label_poor += 1,
            GeometryLabel::Unknown => {}
        }
        self.hdop_mismatch += usize::from(g.reported_derived_mismatch);
        let (mut geo, mut env, mut inc) = (false, false, false);
        for c in classes {
            match c {
                C::Geometry => geo = true,
                C::Environment => env = true,
                C::Inconsistency => inc = true,
            }
        }
        self.class_geometry += usize::from(geo);
        self.class_environment += usize::from(env);
        self.class_inconsistency += usize::from(inc);
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn sat(id: &str, el: f64, az: f64) -> SatSky {
        SatSky {
            sat: id.into(),
            elev_deg: el,
            azim_deg: az,
            tracked: true,
        }
    }

    fn epoch(t: f64, sky: Vec<SatSky>) -> LogEpoch {
        LogEpoch {
            t_s: t,
            sky,
            ..LogEpoch::default()
        }
    }

    /// Eight satellites spread round the sky: the demo's first GSV.
    fn open_sky() -> Vec<SatSky> {
        [
            (62.0, 40.0),
            (40.0, 95.0),
            (24.0, 150.0),
            (51.0, 205.0),
            (68.0, 262.0),
            (21.0, 310.0),
            (7.0, 350.0),
            (55.0, 120.0),
        ]
        .iter()
        .enumerate()
        .map(|(i, (e, a))| sat(&format!("G{:02}", i + 1), *e, *a))
        .collect()
    }

    #[test]
    fn azimuth_gap_is_the_largest_arc_without_a_satellite() {
        assert_eq!(max_azimuth_gap_deg(&[]), None);
        assert_eq!(max_azimuth_gap_deg(&[10.0]), Some(360.0));
        assert_eq!(max_azimuth_gap_deg(&[0.0, 90.0, 180.0, 270.0]), Some(90.0));
        assert_eq!(max_azimuth_gap_deg(&[350.0, 20.0]), Some(330.0));
        assert_eq!(
            max_azimuth_gap_deg(&[10.0, 60.0, 100.0, 170.0]),
            Some(200.0)
        );
    }

    #[test]
    fn the_dop_is_the_validated_kernel_on_the_same_directions() {
        // Zenith plus three at elevation 0 spaced 120 deg. Hand-derived: the horizontal block of
        // H^T H is diag(1.5, 1.5); up and clock couple as [[1, -1], [-1, 4]], whose inverse has
        // (1,1) = 4/3. HDOP = sqrt(2/1.5), VDOP = sqrt(4/3).
        let d = dop_from_sky(&[(90.0, 0.0), (0.0, 0.0), (0.0, 120.0), (0.0, 240.0)]).unwrap();
        assert!((d.hdop - (2.0_f64 / 1.5).sqrt()).abs() < 1e-9, "{d:?}");
        assert!((d.vdop - (4.0_f64 / 3.0).sqrt()).abs() < 1e-9, "{d:?}");
        assert!(dop_from_sky(&[(10.0, 0.0), (20.0, 90.0), (30.0, 180.0)]).is_none());
    }

    #[test]
    fn ratios_at_the_thresholds_are_hand_derived() {
        let cfg = GeometryCfg::default();
        let mut g = EpochGeometry::unknown();
        assert_eq!(
            geometry_ratio(&g, &cfg),
            None,
            "unknown: the monitor does not decide"
        );
        g.status = GeometryStatus::Good;
        g.source = GeometrySource::Reported;
        // HDOP 4 of 4 = 1; PDOP 3 of 6 = 0.5; 5 used of 5 = 1.
        (g.n_used, g.hdop, g.pdop) = (Some(5), Some(4.0), Some(3.0));
        assert_eq!(geometry_ratio(&g, &cfg), Some((1.0, false)));
        // HDOP 1, PDOP 9 of 6 = 1.5; 10 used: 0.5.
        (g.n_used, g.hdop, g.pdop) = (Some(10), Some(1.0), Some(9.0));
        assert_eq!(geometry_ratio(&g, &cfg), Some((1.5, false)));
        // Four used: 5/4 = 1.25.
        (g.n_used, g.hdop, g.pdop) = (Some(4), Some(1.0), Some(2.0));
        assert_eq!(geometry_ratio(&g, &cfg), Some((1.25, false)));
        // A derived HDOP 1.0 against a stated 3.5: mismatch 2.5 / 1.0, an inconsistency, but
        // the sky itself is good (10 / 2.0 / 1.0: ratio 0.5), so it is labelled, not scored.
        g.source = GeometrySource::Derived;
        (g.n_used, g.hdop, g.pdop, g.reported_hdop) = (Some(10), Some(1.0), Some(2.0), Some(3.5));
        assert_eq!(geometry_ratio(&g, &cfg), Some((0.5, true)));
        assert_eq!(geometry_points(0.5, &cfg, 55.0), 0.0);
    }

    #[test]
    fn an_open_sky_is_good_and_a_thin_one_is_degraded() {
        let cfg = GeometryCfg::default();
        let mut tr = GeometryTracker::new(&cfg, 10.0);
        let g = tr.push(&epoch(0.0, open_sky()));
        assert_eq!(g.status, GeometryStatus::Good, "{g:?}");
        assert_eq!(g.source, GeometrySource::Derived);
        assert_eq!(g.n_used, Some(8));
        let note = g.note.as_deref().unwrap();
        assert!(
            note.starts_with(&format!("geometry {}: HDOP ", g.label.as_str()))
                && note.contains(", 8 satellites; not scored"),
            "{note}"
        );
        assert!(geometry_ratio(&g, &cfg).unwrap().0 < 0.7);
        let east: Vec<SatSky> = open_sky()
            .into_iter()
            .filter(|s| s.azim_deg <= 150.0)
            .collect();
        let g = tr.push(&epoch(1.0, east));
        assert_eq!(g.status, GeometryStatus::Degraded);
        assert!(g.reasons.contains(&GeometryReason::FewSatellites), "{g:?}");
        assert!(g.reasons.contains(&GeometryReason::SkyBlocked), "{g:?}");
        assert_eq!(g.label, GeometryLabel::Poor);
        let note = g.note.unwrap();
        assert!(
            note.starts_with("geometry poor: HDOP ")
                && note
                    .contains(", 4 satellites; degraded by geometry: 4 satellites, fewer than 5"),
            "{note}"
        );
        assert!(note.ends_with("; not an inconsistency"), "{note}");
    }

    #[test]
    fn lost_satellites_low_at_their_last_report_are_lost_to_the_sky() {
        let mut tr = GeometryTracker::new(&GeometryCfg::default(), 10.0);
        tr.push(&epoch(0.0, open_sky()));
        // G07 was at 7 deg, G03 at 24 deg.
        assert!(tr.lost_to_the_sky(["G07"]));
        assert!(!tr.lost_to_the_sky(["G07", "G03"]));
        assert!(!tr.lost_to_the_sky(["G99"]), "never placed");
        assert!(!tr.lost_to_the_sky(std::iter::empty::<&str>()));
    }

    #[test]
    fn a_held_sky_expires_and_then_the_geometry_is_unknown() {
        let mut tr = GeometryTracker::new(&GeometryCfg::default(), 10.0);
        tr.push(&epoch(0.0, open_sky()));
        let g = tr.push(&epoch(10.0, Vec::new()));
        assert_eq!((g.status, g.age_s), (GeometryStatus::Good, Some(10.0)));
        assert_eq!(tr.push(&epoch(10.5, Vec::new())), EpochGeometry::unknown());
    }

    #[test]
    fn a_log_without_geometry_is_unknown_not_guessed() {
        let g = GeometryTracker::new(&GeometryCfg::default(), 10.0).push(&LogEpoch::default());
        assert_eq!(
            (g.status, g.source),
            (GeometryStatus::Unknown, GeometrySource::None)
        );
        assert!(g.note.unwrap().starts_with("geometry unknown"));
    }

    #[test]
    fn reported_dop_is_used_without_a_sky() {
        let e = LogEpoch {
            reported_dop: Some(ReportedDop {
                pdop: Some(7.5),
                hdop: Some(3.0),
                vdop: Some(6.8),
                n_used: 6,
            }),
            ..LogEpoch::default()
        };
        let g = GeometryTracker::new(&GeometryCfg::default(), 10.0).push(&e);
        assert_eq!(g.source, GeometrySource::Reported);
        assert_eq!(g.reasons, vec![GeometryReason::HighPdop]);
        assert!(!g.reported_derived_mismatch);
    }

    #[test]
    fn a_stated_hdop_the_sky_does_not_explain_is_flagged() {
        let mut e = epoch(0.0, open_sky().into_iter().take(5).collect());
        e.marine = Some(super::super::MarineObs {
            hdop: Some(0.9),
            ..Default::default()
        });
        let g = GeometryTracker::new(&GeometryCfg::default(), 10.0).push(&e);
        assert!(g.hdop.unwrap() > 1.9, "{g:?}");
        assert!(g.reported_derived_mismatch);
        assert!(geometry_ratio(&g, &GeometryCfg::default()).unwrap().1);
    }

    #[test]
    fn in_poor_geometry_the_tolerance_grows_with_the_hdop() {
        // Four satellites in one quarter of the sky: a poor derived HDOP. A receiver solving
        // with one clock per constellation, or with a subset of its satellites, states an HDOP
        // 1.2 above it: inside 25 % of the derived HDOP, so not an inconsistency.
        let sky: Vec<SatSky> = [(70.0, 10.0), (40.0, 30.0), (20.0, 60.0), (55.0, 80.0)]
            .iter()
            .enumerate()
            .map(|(i, (e, a))| sat(&format!("G{:02}", i + 1), *e, *a))
            .collect();
        let stated = |h: Option<f64>| {
            let mut e = epoch(0.0, sky.clone());
            e.marine = Some(super::super::MarineObs {
                hdop: h,
                ..Default::default()
            });
            GeometryTracker::new(&GeometryCfg::default(), 10.0).push(&e)
        };
        let derived = stated(None).hdop.unwrap();
        assert!(derived > 4.8, "a poor geometry: HDOP {derived}");
        let cfg = GeometryCfg::default();
        let g = stated(Some(derived + 1.2));
        assert!(!g.reported_derived_mismatch);
        assert!(!geometry_ratio(&g, &cfg).unwrap().1);
        // Beyond 25 % it is an inconsistency.
        let g = stated(Some(derived * 1.3));
        assert!(g.reported_derived_mismatch);
        assert!(geometry_ratio(&g, &cfg).unwrap().1);
        // In an open sky the 1.0 absolute floor applies.
        let open = |h: f64| {
            let mut e = epoch(0.0, open_sky());
            e.marine = Some(super::super::MarineObs {
                hdop: Some(h),
                ..Default::default()
            });
            GeometryTracker::new(&GeometryCfg::default(), 10.0).push(&e)
        };
        let d = open(1.0).hdop.unwrap();
        assert!(!open(d + 0.9).reported_derived_mismatch);
        assert!(open(d + 1.1).reported_derived_mismatch);
    }

    #[test]
    fn satellites_in_view_but_not_tracked_are_the_signal_not_the_sky() {
        let cfg = GeometryCfg::default();
        // Every satellite listed, none tracked (every SNR empty): total signal loss.
        let mut sky = open_sky();
        sky.iter_mut().for_each(|s| s.tracked = false);
        let g = GeometryTracker::new(&cfg, 10.0).push(&epoch(0.0, sky));
        assert_eq!(
            (g.n_used, g.in_view),
            (Some(0), Some(7)),
            "G07 at 7 deg is below 15"
        );
        assert!(g.signal_loss, "{g:?}");
        assert!(g
            .note
            .as_deref()
            .unwrap()
            .contains("signal environment, not geometry"));
        // Half the sky untracked in a spread pattern (every other satellite): signal.
        let mut sky = open_sky();
        sky.iter_mut().step_by(2).for_each(|s| s.tracked = false);
        let g = GeometryTracker::new(&cfg, 10.0).push(&epoch(0.0, sky));
        assert!(g.signal_loss || g.status == GeometryStatus::Good, "{g:?}");
        // The western half untracked (a wall): the untracked satellites sit in one half, so
        // it stays geometry.
        let mut sky = open_sky();
        sky.iter_mut()
            .filter(|s| s.azim_deg > 200.0)
            .for_each(|s| s.tracked = false);
        let g = GeometryTracker::new(&cfg, 10.0).push(&epoch(0.0, sky));
        assert!(!g.signal_loss, "{g:?}");
    }

    #[test]
    fn a_mismatch_always_carries_a_note() {
        let mut e = epoch(0.0, open_sky());
        e.marine = Some(super::super::MarineObs {
            hdop: Some(3.5),
            ..Default::default()
        });
        let g = GeometryTracker::new(&GeometryCfg::default(), 10.0).push(&e);
        assert_eq!(g.status, GeometryStatus::Good);
        assert!(g.reported_derived_mismatch);
        assert!(g
            .note
            .unwrap()
            .ends_with("beyond the tolerance: reported, not scored (the geometry is not poor)"));
    }

    #[test]
    fn no_fix_sentinels_are_ignored() {
        // GGA HDOP 99.9 is not a stated HDOP.
        let mut e = epoch(0.0, open_sky());
        e.marine = Some(super::super::MarineObs {
            hdop: Some(99.9),
            ..Default::default()
        });
        let g = GeometryTracker::new(&GeometryCfg::default(), 10.0).push(&e);
        assert_eq!(
            (g.reported_hdop, g.reported_derived_mismatch),
            (None, false)
        );
        // A GSA with PDOP 99.99 or nothing used is no geometry: unknown, not degraded.
        for r in [
            ReportedDop {
                pdop: Some(99.99),
                hdop: Some(99.99),
                vdop: Some(99.99),
                n_used: 3,
            },
            ReportedDop {
                pdop: None,
                hdop: None,
                vdop: None,
                n_used: 0,
            },
        ] {
            let e = LogEpoch {
                reported_dop: Some(r),
                ..LogEpoch::default()
            };
            let g = GeometryTracker::new(&GeometryCfg::default(), 10.0).push(&e);
            assert_eq!(g.status, GeometryStatus::Unknown, "{r:?}");
        }
    }

    #[test]
    fn thresholds_are_validated() {
        assert!(GeometryCfg::default().validate().is_ok());
        for bad in [
            GeometryCfg {
                azimuth_gap_deg: 400.0,
                ..GeometryCfg::default()
            },
            GeometryCfg {
                pdop_max: 0.0,
                ..GeometryCfg::default()
            },
            GeometryCfg {
                low_elev_deg: 95.0,
                ..GeometryCfg::default()
            },
        ] {
            assert!(bad.validate().is_err());
        }
    }

    /// A reported geometry with the given numbers.
    fn stated(n: usize, hdop: f64, pdop: f64) -> EpochGeometry {
        let mut g = EpochGeometry::unknown();
        (g.status, g.source) = (GeometryStatus::Good, GeometrySource::Reported);
        (g.n_used, g.hdop, g.pdop) = (Some(n), Some(hdop), Some(pdop));
        g
    }

    #[test]
    fn nothing_is_deducted_up_to_the_poor_thresholds() {
        let cfg = GeometryCfg::default();
        // At each threshold exactly: ratio 1, fair, no points.
        for g in [
            stated(5, 1.0, 2.0),
            stated(9, 4.0, 2.0),
            stated(9, 1.0, 6.0),
        ] {
            let r = sky_ratio(&g, &cfg).unwrap();
            assert_eq!(r, 1.0, "{g:?}");
            assert_eq!(geometry_points(r, &cfg, 55.0), 0.0);
            assert_eq!(label_of(&g, &cfg), GeometryLabel::Fair);
        }
        // Just beyond each: poor, and points.
        for g in [
            stated(4, 1.0, 2.0),
            stated(9, 4.004, 2.0),
            stated(9, 1.0, 6.006),
        ] {
            let r = sky_ratio(&g, &cfg).unwrap();
            assert!(r > 1.0, "{g:?}");
            assert!(geometry_points(r, &cfg, 55.0) > 0.0);
            assert_eq!(label_of(&g, &cfg), GeometryLabel::Poor);
        }
        // GPS-only open sky, 8 satellites: 5 / 8 = 0.625, which the 0.35-onset ramp charged
        // 1.875 points for; now nothing.
        let g = stated(8, 1.1, 1.8);
        assert_eq!(sky_ratio(&g, &cfg), Some(0.625));
        assert_eq!(geometry_points(0.625, &cfg, 55.0), 0.0);
        assert_eq!(label_of(&g, &cfg), GeometryLabel::Good);
    }

    #[test]
    fn the_deduction_ramps_to_the_cap_and_stays_there() {
        let cfg = GeometryCfg::default();
        // Linear from 0 at ratio 1 to cap_points (15) at full_ratio (1.5).
        assert_eq!(geometry_points(1.25, &cfg, 55.0), 7.5);
        assert_eq!(geometry_points(1.5, &cfg, 55.0), 15.0);
        assert_eq!(geometry_points(3.0, &cfg, 55.0), 15.0);
        assert_eq!(geometry_points(f64::INFINITY, &cfg, 55.0), 15.0);
        // HDOP 6 is 1.5 times hdop_max: the cap.
        let r = sky_ratio(&stated(9, 6.0, 2.0), &cfg).unwrap();
        assert_eq!(geometry_points(r, &cfg, 55.0), 15.0);
    }

    #[test]
    fn the_floor_keeps_geometry_alone_out_of_the_untrusted_band() {
        let cfg = GeometryCfg::default();
        assert_eq!(
            (cfg.floor_in_force(55.0), cfg.cap_in_force(55.0)),
            (55.0, 15.0)
        );
        // A [score] table that raises degraded_min to 90 lowers the cap to 10, not refused.
        assert_eq!(cfg.cap_in_force(90.0), 10.0);
        assert_eq!(geometry_points(f64::INFINITY, &cfg, 90.0), 10.0);
        assert!(cfg.validate_with(90.0).is_ok());
        // A stated floor: the cap is min(cap_points, 100 - floor).
        let high = GeometryCfg {
            floor: Some(95.0),
            ..GeometryCfg::default()
        };
        assert_eq!(high.cap_in_force(55.0), 5.0);
        // A floor below degraded_min would let geometry alone reach untrusted: refused.
        let low = GeometryCfg {
            floor: Some(50.0),
            ..GeometryCfg::default()
        };
        assert!(low.validate_with(55.0).unwrap_err().contains("untrusted"));
        assert!(low.validate_with(50.0).is_ok());
    }

    #[test]
    fn the_label_edges_follow_the_good_levels() {
        let cfg = GeometryCfg::default();
        assert_eq!(label_of(&stated(6, 2.0, 3.0), &cfg), GeometryLabel::Good);
        assert_eq!(label_of(&stated(5, 2.0, 3.0), &cfg), GeometryLabel::Fair);
        assert_eq!(label_of(&stated(6, 2.001, 3.0), &cfg), GeometryLabel::Fair);
        assert_eq!(label_of(&stated(6, 2.0, 3.001), &cfg), GeometryLabel::Fair);
        assert_eq!(
            label_of(&EpochGeometry::unknown(), &cfg),
            GeometryLabel::Unknown
        );
    }

    #[test]
    fn the_geometry_table_overrides_thresholds_cap_floor_and_label() {
        let cfg: GeometryCfg = toml::from_str(
            "hdop_max = 3.0\nhdop_good = 1.5\ncap_points = 10.0\nfull_ratio = 2.0\n\
             floor = 70.0\nused_good = 8\n",
        )
        .unwrap();
        assert!(cfg.validate_with(55.0).is_ok());
        let g = stated(9, 3.6, 2.0);
        let r = sky_ratio(&g, &cfg).unwrap();
        assert!((r - 1.2).abs() < 1e-12);
        assert_eq!(label_of(&g, &cfg), GeometryLabel::Poor);
        // (1.2 - 1) / (2 - 1) of a cap of min(10, 100 - 70) = 10.
        assert!((geometry_points(r, &cfg, 55.0) - 2.0).abs() < 1e-12);
        assert_eq!(geometry_points(5.0, &cfg, 55.0), 10.0);
        assert_eq!(label_of(&stated(9, 1.6, 2.0), &cfg), GeometryLabel::Fair);
        assert_eq!(label_of(&stated(7, 1.0, 2.0), &cfg), GeometryLabel::Fair);
        for bad in [
            "hdop_good = 5.0\n",
            "used_good = 4\n",
            "cap_points = 101.0\n",
            "full_ratio = 1.0\n",
            "floor = 0.0\n",
        ] {
            let c: GeometryCfg = toml::from_str(bad).unwrap();
            assert!(c.validate().is_err(), "{bad}");
        }
    }
}
