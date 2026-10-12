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
//! * a vessel's score gains one monitor, [`super::monitors::Monitor::Geometry`], whose ratio is
//!   `max(hdop / hdop_max, pdop / pdop_max, min_used / n_used)` ([`geometry_ratio`]) with weight
//!   15, so geometry alone can move the score from nominal into degraded and never to
//!   untrusted. It costs nothing when the geometry is good (every ratio under the 0.5 onset)
//!   and does not run when the geometry is unknown, so a good-geometry log scores as in 0.35;
//! * every deduction carries a class ([`super::score::DeductionClass`]): `geometry`,
//!   `environment` or `inconsistency`. `loss-of-lock` is `geometry` when every satellite lost
//!   against the baseline was below `low_elev_deg` at its last report ([`GeometryTracker`]),
//!   and the geometry deduction is `inconsistency` when the HDOP the receiver states disagrees
//!   with the one its stated sky gives by more than `reported_vs_derived_tol`: a spoofer could
//!   fake a poor sky to buy tolerance, so the engine labels and does not forgive, and the
//!   comparison is the guard.
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
    /// last report, `loss-of-lock` is classed `geometry`. A skyline (0.36 item 1) will extend
    /// this to satellites behind a stated obstruction.
    pub low_elev_deg: f64,
    /// Largest azimuth gap between tracked satellites at or above which the reason
    /// `sky-blocked` is reported, degrees. Default 180: every tracked satellite in one half
    /// of the horizon. Geometric, informational: it does not enter the ratio.
    pub azimuth_gap_deg: f64,
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
        }
    }
}

/// Where each default of [`GeometryCfg`] comes from, `(key, provenance)`; recorded in every
/// result's `geometry_model`. The geometry monitor's weight (15) is in the score model.
pub const PROVENANCE: [(&str, &str); 9] = [
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
        "weight",
        "15 points (score.weights.geometry): geometry alone moves the score from nominal \
         (>= 90) into degraded and never to untrusted (< 55) (design note, 4.2)",
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
        Ok(())
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
    /// The tracked satellites leave an azimuth gap of `azimuth_gap_deg` or more
    /// (informational; not in the ratio).
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
    /// Fraction of the sky open above a stated skyline; `null` until a skyline is configured
    /// (0.36 item 1).
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
        }
    }

    /// True when the geometry is degraded.
    pub fn is_degraded(&self) -> bool {
        self.status == GeometryStatus::Degraded
    }
}

/// The geometry monitor's ratio for an epoch and whether it is an inconsistency: the
/// geometry ratio `max(hdop / hdop_max, pdop / pdop_max, min_used / n_used)` and, where the
/// receiver states an HDOP that disagrees with the derived one, `|stated - derived| / tol` with
/// `tol = max(reported_vs_derived_tol, reported_vs_derived_rel * derived)`. Returns `(ratio, inconsistency)` where `ratio` is the larger and
/// `inconsistency` says the disagreement is at or above its tolerance. `None` when the
/// geometry is unknown (the monitor does not decide). A singular derived geometry with four or
/// more satellites, or no satellite at all, is given the full ratio 1.5.
pub fn geometry_ratio(g: &EpochGeometry, cfg: &GeometryCfg) -> Option<(f64, bool)> {
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
    let mismatch = match (g.hdop, g.reported_hdop, g.source) {
        (Some(d), Some(s), GeometrySource::Derived) => {
            (d - s).abs()
                / cfg
                    .reported_vs_derived_tol
                    .max(cfg.reported_vs_derived_rel * d)
        }
        _ => 0.0,
    };
    Some((r.max(mismatch), mismatch > 1.0))
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

/// The status, reasons and words of an assessment.
fn finish(mut g: EpochGeometry, cfg: &GeometryCfg) -> EpochGeometry {
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
    if g.max_azimuth_gap_deg
        .is_some_and(|gap| gap >= cfg.azimuth_gap_deg)
    {
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
             the tolerance: classed an inconsistency",
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
            parts.push(format!(
                "every satellite in one half of the sky (gap {} deg)",
                g.max_azimuth_gap_deg.unwrap_or(0.0)
            ));
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

/// The derived geometry of one epoch's sky.
fn from_sky(sky: &[SatSky], age_s: f64, cfg: &GeometryCfg) -> EpochGeometry {
    let used: Vec<&SatSky> = sky
        .iter()
        .filter(|s| s.tracked && s.elev_deg >= 0.0)
        .collect();
    let n = used.len();
    // Listed at or above low_elev_deg, tracked or not: the sky the receiver says it has.
    let listed: Vec<&SatSky> = sky
        .iter()
        .filter(|s| s.elev_deg >= cfg.low_elev_deg)
        .collect();
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
    // a loss with nothing tracked, or spread round the sky, is the signal environment.
    let spread = max_azimuth_gap_deg(&untracked).is_some_and(|g| g < cfg.azimuth_gap_deg);
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
}

impl GeometryTracker {
    /// A tracker with thresholds `cfg`, holding sky positions for `hold_s` seconds.
    pub fn new(cfg: &GeometryCfg, hold_s: f64) -> Self {
        Self {
            cfg: cfg.clone(),
            hold_s,
            sky: None,
            reported: None,
            last_el: Default::default(),
        }
    }

    /// The last elevation reported for `sat`, degrees, if any.
    pub fn last_elevation(&self, sat: &str) -> Option<f64> {
        self.last_el.get(sat).copied()
    }

    /// Whether `loss-of-lock` is the sky's: every satellite in `lost` was below
    /// `low_elev_deg` at its last report (false for an empty set or a satellite never placed).
    pub fn lost_to_the_sky<'a>(&self, lost: impl IntoIterator<Item = &'a str>) -> bool {
        let mut any = false;
        for s in lost {
            any = true;
            match self.last_elevation(s) {
                Some(el) if el < self.cfg.low_elev_deg => {}
                _ => return false,
            }
        }
        any
    }

    /// The geometry of the next epoch.
    pub fn push(&mut self, e: &LogEpoch) -> EpochGeometry {
        if !e.sky.is_empty() {
            for s in &e.sky {
                self.last_el.insert(s.sat.clone(), s.elev_deg);
            }
            self.sky = Some((e.t_s, e.sky.clone()));
        }
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
                let mut g = from_sky(sky, age, &self.cfg);
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
    /// The geometry monitor's weight, points.
    pub weight: f64,
    /// Where each default comes from.
    pub provenance: std::collections::BTreeMap<&'static str, &'static str>,
    /// The classes and the rules that assign them, in words.
    pub classes: &'static str,
}

/// The deduction classes and their rules, in words, for the record of a run.
pub const CLASSES: &str = "geometry: the geometry monitor, and loss-of-lock when every \
satellite lost against the baseline was below low_elev_deg at its last report; environment: \
cn0-drop, cn0-spread, cn0-rise, agc, jam-ind, loss-of-lock otherwise; inconsistency: every other monitor, and the \
geometry monitor when the stated HDOP disagrees with the derived one by \
max(reported_vs_derived_tol, reported_vs_derived_rel x derived HDOP) or more. A geometry class is a statement about the sky, not a finding \
that no attack occurred.";

impl GeometryModel {
    /// The record of `cfg` held for `hold_s`, the geometry monitor weighing `weight`.
    pub fn new(cfg: &GeometryCfg, hold_s: f64, weight: f64) -> Self {
        Self {
            cfg: cfg.clone(),
            hold_s,
            weight,
            provenance: PROVENANCE.iter().copied().collect(),
            classes: CLASSES,
        }
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
        // A derived HDOP 1.0 against a stated 3.5: mismatch 2.5 / 1.0, an inconsistency.
        g.source = GeometrySource::Derived;
        (g.n_used, g.hdop, g.pdop, g.reported_hdop) = (Some(10), Some(1.0), Some(2.0), Some(3.5));
        assert_eq!(geometry_ratio(&g, &cfg), Some((2.5, true)));
    }

    #[test]
    fn an_open_sky_is_good_and_a_thin_one_is_degraded() {
        let cfg = GeometryCfg::default();
        let mut tr = GeometryTracker::new(&cfg, 10.0);
        let g = tr.push(&epoch(0.0, open_sky()));
        assert_eq!(g.status, GeometryStatus::Good, "{g:?}");
        assert_eq!(g.source, GeometrySource::Derived);
        assert_eq!((g.n_used, g.note.as_deref()), (Some(8), None));
        assert!(geometry_ratio(&g, &cfg).unwrap().0 < 0.7);
        let east: Vec<SatSky> = open_sky()
            .into_iter()
            .filter(|s| s.azim_deg <= 150.0)
            .collect();
        let g = tr.push(&epoch(1.0, east));
        assert_eq!(g.status, GeometryStatus::Degraded);
        assert!(g.reasons.contains(&GeometryReason::FewSatellites), "{g:?}");
        assert!(g.reasons.contains(&GeometryReason::SkyBlocked), "{g:?}");
        let note = g.note.unwrap();
        assert!(
            note.starts_with("degraded by geometry: 4 satellites, fewer than 5"),
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
        assert!(g.note.unwrap().contains("classed an inconsistency"));
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
}
