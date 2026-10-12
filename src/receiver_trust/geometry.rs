// SPDX-License-Identifier: AGPL-3.0-only
//! Geometry-aware trust: is the fix degraded by its satellite geometry, apart from anything
//! that looks like an attack?
//!
//! Every monitor of [`super::monitors`] and [`super::maritime`] is a consistency check: it
//! looks for evidence that the signals or the fix are not what a genuine receiver in a clean
//! environment would show. A receiver under a quay crane, in a lock or beside a high hull
//! loses satellites on one side, and its fix gets worse for a reason that is not an attack.
//! This module says so separately: every epoch gets a geometry assessment (good, degraded or
//! unknown, with reason codes and the dilution of precision), and an attribution of the
//! epoch's degradation to geometry, to attack-like inconsistency, to both or to neither.
//!
//! **It never changes the trust score, the band, a deduction or an alarm.** The score is the
//! consistency evidence as 0.35 computed it; the geometry is a second axis beside it.
//! `tests/geometry_trust_no_change.rs` holds every recorded output of the example sessions to
//! the 0.35.0 bytes once the appended keys are removed.
//!
//! The geometry comes from what the receiver reports: per-satellite elevation and azimuth
//! (NMEA GSV, UBX-NAV-SAT), from which the dilution of precision (DOP) is computed with the
//! engine's one DOP kernel, [`crate::orbit::dop`] (VALIDATED against gnss_lib_py in
//! `tests/dop_reference.rs`); or, where the log has no satellite positions, the DOP and
//! satellite count the receiver states (NMEA GSA). A log with neither (GGA, RMC and nothing
//! else; Android `Raw` rows; RINEX) gets the status `unknown`, said as such: the engine does
//! not guess a geometry it was not given. Sky positions and GSA arrive less often than
//! fixes on many buses, so the last ones count for the score's `evidence_hold_s` (default
//! 10 s), as a monitor's statistic does; the age is reported.
//!
//! The four thresholds and where each comes from are in [`GeometryCfg`] and [`PROVENANCE`];
//! each run records them in the result's `geometry_model`. They are MODELLED: stated before
//! the run, not fitted to any log, and nothing here asserts how often natural degradation
//! and attacks are told apart on real data.

use serde::{Deserialize, Serialize};

use super::monitors::Monitor;
use super::{LogEpoch, ReportedDop, SatSky};
use crate::orbit::dop;
use crate::portable_math::PortableFloat;

/// The `[geometry]` table: when the satellite geometry counts as degraded.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct GeometryCfg {
    /// PDOP above which the geometry is degraded. Default 6: the GPS Standard Positioning
    /// Service Performance Standard (5th edition, 2020) states its PDOP availability standard
    /// as PDOP of 6 or less, and the accuracy requirements of IEC 61108-1 for shipborne GPS
    /// receivers are stated for HDOP of 4 or less (or PDOP of 6 or less).
    pub pdop_max: f64,
    /// HDOP above which the geometry is degraded. Default 4: the HDOP condition of the
    /// IEC 61108-1 accuracy requirements (see `pdop_max`).
    pub hdop_max: f64,
    /// Fewest satellites for a geometry that is not degraded. Default 5: a single-
    /// constellation fix has four unknowns (position and clock), so five is the fewest with
    /// one redundant measurement, the minimum for a receiver's own consistency check
    /// (receiver autonomous integrity monitoring, RAIM) to detect anything at all
    /// (Parkinson and Axelrad 1988; Brown 1992). Below it an inconsistency is invisible to
    /// the receiver.
    pub min_sats: usize,
    /// Largest gap in azimuth between tracked satellites at or above which the sky is
    /// partially blocked, degrees. Default 180: every tracked satellite in one half of the
    /// horizon, so the horizontal fix is constrained from one side only (a wall, a hull or
    /// a quay on the other). A geometric definition, not a tuned value. Evaluated with four
    /// or more tracked satellites (with fewer, `few-satellites` already says the sky is
    /// thin).
    pub azimuth_gap_deg: f64,
    /// Largest difference between the HDOP the receiver reports (GSA, else GGA) and the HDOP
    /// derived from the sky positions it reports, above which the two disagree. Default 1.0
    /// (the value of the 0.36 design note, chosen, not a standard's figure). A disagreement is
    /// not geometry: a stream whose own sky does not explain its stated precision explains
    /// nothing, so nothing is attributed to geometry at that epoch and it counts as
    /// inconsistency. This is the guard against a forged poor sky buying the `geometry` label.
    pub hdop_report_tol: f64,
}

impl Default for GeometryCfg {
    fn default() -> Self {
        Self {
            pdop_max: 6.0,
            hdop_max: 4.0,
            min_sats: 5,
            azimuth_gap_deg: 180.0,
            hdop_report_tol: 1.0,
        }
    }
}

/// Where each default of [`GeometryCfg`] comes from, `(key, provenance)`; recorded in every
/// result's `geometry_model`.
pub const PROVENANCE: [(&str, &str); 5] = [
    (
        "pdop_max",
        "GPS SPS Performance Standard, 5th ed. (2020): PDOP availability standard, PDOP <= 6; \
         IEC 61108-1 states its accuracy requirements for HDOP <= 4 (or PDOP <= 6)",
    ),
    (
        "hdop_max",
        "IEC 61108-1 accuracy requirements are stated for HDOP <= 4 (or PDOP <= 6)",
    ),
    (
        "min_sats",
        "four unknowns (position, clock): five satellites give the one redundant measurement \
         RAIM needs to detect anything (Parkinson and Axelrad 1988; Brown 1992)",
    ),
    (
        "azimuth_gap_deg",
        "geometric: every tracked satellite in one half of the horizon (gap >= 180 deg) \
         constrains the horizontal fix from one side only",
    ),
    (
        "hdop_report_tol",
        "chosen in the 0.36 geometry design note (docs/design/2026-10-12-geometry-and-skyline-\
         design.md, section 4.2): a reported HDOP more than 1.0 from the derived one is raised as \
         inconsistency, not geometry",
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
            ("pdop_max", self.pdop_max),
            ("hdop_max", self.hdop_max),
            ("hdop_report_tol", self.hdop_report_tol),
        ] {
            if !(v.is_finite() && v > 0.0) {
                return Err(format!("geometry: {name} must be finite and > 0 (got {v})"));
            }
        }
        if self.min_sats == 0 {
            return Err("geometry: min_sats must be at least 1".into());
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
    /// Enough satellites, DOP within the thresholds, no half of the sky empty.
    Good,
    /// At least one reason in [`GeometryReason`].
    Degraded,
    /// The log gives no satellite geometry for this epoch (no GSV elevations and azimuths,
    /// no GSA, no NAV-SAT, or none within the hold time): geometry unknown.
    Unknown,
}

/// Why the geometry of an epoch is degraded.
#[derive(Clone, Copy, Debug, PartialEq, Eq, PartialOrd, Ord, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum GeometryReason {
    /// Fewer than `min_sats` satellites tracked (or, from GSA, used).
    FewSatellites,
    /// PDOP above `pdop_max`, or no position solution from the satellites there are (four or
    /// more in a singular arrangement).
    HighPdop,
    /// HDOP above `hdop_max`.
    HighHdop,
    /// Every tracked satellite in an azimuth sector that leaves a gap of `azimuth_gap_deg`
    /// or more: part of the sky is masked.
    SkyBlocked,
}

/// Where an epoch's geometry came from.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum GeometryBasis {
    /// Satellite elevations and azimuths the receiver reported (GSV, NAV-SAT); DOP computed
    /// with [`crate::orbit::dop`].
    Sky,
    /// DOP and satellites used as the receiver reported them (GSA); no azimuths, so
    /// `sky-blocked` cannot be decided.
    Reported,
    /// Nothing: the geometry is unknown.
    None,
}

/// The geometry assessment of one epoch.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct EpochGeometry {
    /// `good`, `degraded` or `unknown`.
    pub status: GeometryStatus,
    /// Why it is degraded (empty unless `status` is `degraded`), in [`GeometryReason`] order.
    pub reasons: Vec<GeometryReason>,
    /// What the assessment is based on.
    pub basis: GeometryBasis,
    /// Satellites tracked above the horizon (`sky`) or used (`reported`).
    pub n_sats: Option<usize>,
    /// Position DOP, rounded to 0.001; `null` when it cannot be formed.
    pub pdop: Option<f64>,
    /// Horizontal DOP, rounded to 0.001.
    pub hdop: Option<f64>,
    /// Vertical DOP, rounded to 0.001.
    pub vdop: Option<f64>,
    /// Largest azimuth gap between tracked satellites, degrees, rounded to 0.1 (`sky` with
    /// four or more satellites only).
    pub max_azimuth_gap_deg: Option<f64>,
    /// Age of the sky positions or GSA the assessment used, s (0 when they came with the
    /// epoch).
    pub age_s: Option<f64>,
    /// The HDOP the receiver reported at this epoch (GSA within the hold, else GGA), where it
    /// did.
    pub reported_hdop: Option<f64>,
    /// The reported HDOP and the one derived from the reported sky differ by more than
    /// `hdop_report_tol`: the geometry explains nothing at this epoch.
    pub hdop_report_mismatch: bool,
}

impl EpochGeometry {
    /// The assessment of an epoch for which the log gives no geometry.
    pub fn unknown() -> Self {
        Self {
            status: GeometryStatus::Unknown,
            reasons: Vec::new(),
            basis: GeometryBasis::None,
            n_sats: None,
            pdop: None,
            hdop: None,
            vdop: None,
            max_azimuth_gap_deg: None,
            age_s: None,
            reported_hdop: None,
            hdop_report_mismatch: false,
        }
    }

    /// True when the geometry is degraded.
    pub fn is_degraded(&self) -> bool {
        self.status == GeometryStatus::Degraded
    }
}

/// What an epoch's degradation is attributed to.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Serialize, Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Degradation {
    /// No consistency check is active and the geometry is not degraded (good or unknown).
    #[default]
    None,
    /// The geometry is degraded and every active consistency check is one the geometry
    /// explains (or none is active): natural degradation, not attack-like.
    Geometry,
    /// At least one consistency check the geometry does not explain is active, and the
    /// geometry is good or unknown.
    Inconsistency,
    /// Both: the geometry is degraded and an unexplained consistency check is active.
    GeometryAndInconsistency,
}

/// The signal-power monitors. While any of them is at or above its alarm threshold, a loss of
/// satellites is not put down to the sky: a jammer removes satellites too, and lowers or
/// shapes the power of the rest.
pub const POWER_MONITORS: [Monitor; 5] = [
    Monitor::Cn0Drop,
    Monitor::Agc,
    Monitor::JamInd,
    Monitor::Cn0Spread,
    Monitor::Cn0Rise,
];

/// Attribute an epoch's degradation, given its geometry and the consistency checks active at
/// it, each with whether it is at or above its alarm threshold (`(monitor, alarmed)`: the
/// monitors that deducted points for a vessel, the monitors that alarmed for a static
/// platform). Returns the attribution and the active monitors the geometry explains.
///
/// The geometry explains only a masked sky's own signature. When the geometry is
/// `sky-blocked` (what is left sits in one half of the sky) and no [`POWER_MONITORS`] check
/// is at or above its alarm threshold, it explains `loss-of-lock` (the satellites behind the
/// obstruction are lost against the baseline) and any power monitor still below its threshold
/// (losing one side's satellites moves the statistics taken across satellites, such as the
/// spread of C/N0, without any transmitter). Every other monitor, and all of these without
/// that signature, stays attack-like inconsistency whatever the geometry: a poor geometry is
/// reported beside it, never instead of it.
pub fn attribute(g: &EpochGeometry, active: &[(Monitor, bool)]) -> (Degradation, Vec<Monitor>) {
    // A stream whose reported precision its own sky does not explain explains nothing.
    let masked = g.reasons.contains(&GeometryReason::SkyBlocked) && !g.hdop_report_mismatch;
    let power_alarm = active
        .iter()
        .any(|(m, alarmed)| *alarmed && POWER_MONITORS.contains(m));
    let explained: Vec<Monitor> = active
        .iter()
        .filter(|(m, alarmed)| {
            masked
                && !power_alarm
                && (*m == Monitor::LossOfLock || (!*alarmed && POWER_MONITORS.contains(m)))
        })
        .map(|(m, _)| *m)
        .collect();
    let unexplained = g.hdop_report_mismatch || active.iter().any(|(m, _)| !explained.contains(m));
    let d = match (g.is_degraded(), unexplained) {
        (false, false) => Degradation::None,
        (true, false) => Degradation::Geometry,
        (false, true) => Degradation::Inconsistency,
        (true, true) => Degradation::GeometryAndInconsistency,
    };
    (d, explained)
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
/// +x; each satellite is put 20 000 km away along its direction (DOP depends on the
/// directions only). `None` with fewer than four satellites or a singular geometry. The
/// direction cosines use [`PortableFloat`], so the result has the same bits on every
/// platform.
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

/// The geometry of one epoch's sky.
fn from_sky(sky: &[SatSky], age_s: f64, cfg: &GeometryCfg) -> EpochGeometry {
    let used: Vec<&SatSky> = sky
        .iter()
        .filter(|s| s.tracked && s.elev_deg >= 0.0)
        .collect();
    let n = used.len();
    let mut reasons = Vec::new();
    if n < cfg.min_sats {
        reasons.push(GeometryReason::FewSatellites);
    }
    let d = dop_from_sky(
        &used
            .iter()
            .map(|s| (s.elev_deg, s.azim_deg))
            .collect::<Vec<_>>(),
    );
    let (pdop, hdop, vdop) = match d {
        Some(d) => (
            Some(round_to(d.pdop, 1e-3)),
            Some(round_to(d.hdop, 1e-3)),
            Some(round_to(d.vdop, 1e-3)),
        ),
        None => (None, None, None),
    };
    if n >= 4 && pdop.is_none_or(|p| p > cfg.pdop_max) {
        reasons.push(GeometryReason::HighPdop);
    }
    if hdop.is_some_and(|h| h > cfg.hdop_max) {
        reasons.push(GeometryReason::HighHdop);
    }
    let gap = if n >= 4 {
        max_azimuth_gap_deg(&used.iter().map(|s| s.azim_deg).collect::<Vec<_>>())
            .map(|g| round_to(g, 0.1))
    } else {
        None
    };
    if gap.is_some_and(|g| g >= cfg.azimuth_gap_deg) {
        reasons.push(GeometryReason::SkyBlocked);
    }
    finish(GeometryBasis::Sky, reasons, n, pdop, hdop, vdop, gap, age_s)
}

/// The geometry of one epoch from the DOP the receiver reported.
fn from_reported(r: &ReportedDop, age_s: f64, cfg: &GeometryCfg) -> EpochGeometry {
    let n = r.n_used as usize;
    let mut reasons = Vec::new();
    if n < cfg.min_sats {
        reasons.push(GeometryReason::FewSatellites);
    }
    if r.pdop.is_some_and(|p| p > cfg.pdop_max) {
        reasons.push(GeometryReason::HighPdop);
    }
    if r.hdop.is_some_and(|h| h > cfg.hdop_max) {
        reasons.push(GeometryReason::HighHdop);
    }
    finish(
        GeometryBasis::Reported,
        reasons,
        n,
        r.pdop,
        r.hdop,
        r.vdop,
        None,
        age_s,
    )
}

#[allow(clippy::too_many_arguments)]
fn finish(
    basis: GeometryBasis,
    reasons: Vec<GeometryReason>,
    n: usize,
    pdop: Option<f64>,
    hdop: Option<f64>,
    vdop: Option<f64>,
    gap: Option<f64>,
    age_s: f64,
) -> EpochGeometry {
    EpochGeometry {
        status: if reasons.is_empty() {
            GeometryStatus::Good
        } else {
            GeometryStatus::Degraded
        },
        reasons,
        basis,
        n_sats: Some(n),
        pdop,
        hdop,
        vdop,
        max_azimuth_gap_deg: gap,
        age_s: Some(round_to(age_s, 1e-3)),
        reported_hdop: None,
        hdop_report_mismatch: false,
    }
}

/// Follows a log epoch by epoch and assesses each epoch's geometry from the latest sky
/// positions (or, failing them, the latest GSA) no older than the hold time. Epochs are fed in
/// the order they are scored; the batch run and live mode both use it, so they agree.
#[derive(Clone, Debug)]
pub struct GeometryTracker {
    cfg: GeometryCfg,
    hold_s: f64,
    sky: Option<(f64, Vec<SatSky>)>,
    reported: Option<(f64, ReportedDop)>,
}

impl GeometryTracker {
    /// A tracker with thresholds `cfg`, holding sky positions for `hold_s` seconds.
    pub fn new(cfg: &GeometryCfg, hold_s: f64) -> Self {
        Self {
            cfg: cfg.clone(),
            hold_s,
            sky: None,
            reported: None,
        }
    }

    /// The geometry of the next epoch.
    pub fn push(&mut self, e: &LogEpoch) -> EpochGeometry {
        if !e.sky.is_empty() {
            self.sky = Some((e.t_s, e.sky.clone()));
        }
        if let Some(r) = e.reported_dop {
            self.reported = Some((e.t_s, r));
        }
        let fresh = |t0: f64| {
            let age = e.t_s - t0;
            (0.0..=self.hold_s).contains(&age).then_some(age)
        };
        // What the receiver says its HDOP is: GSA within the hold, else this epoch's GGA.
        let reported_hdop = self
            .reported
            .as_ref()
            .and_then(|(t0, r)| fresh(*t0).and(r.hdop))
            .or_else(|| e.marine.as_ref().and_then(|m| m.hdop))
            .filter(|h| h.is_finite() && *h > 0.0);
        if let Some((t0, sky)) = &self.sky {
            if let Some(age) = fresh(*t0) {
                let mut g = from_sky(sky, age, &self.cfg);
                g.reported_hdop = reported_hdop;
                g.hdop_report_mismatch = match (g.hdop, reported_hdop) {
                    (Some(d), Some(r)) => (d - r).abs() > self.cfg.hdop_report_tol,
                    _ => false,
                };
                return g;
            }
        }
        if let Some((t0, r)) = &self.reported {
            if let Some(age) = fresh(*t0) {
                let mut g = from_reported(r, age, &self.cfg);
                g.reported_hdop = r.hdop;
                return g;
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
    /// Where each default comes from.
    pub provenance: std::collections::BTreeMap<&'static str, &'static str>,
    /// The monitor the geometry can explain and the condition, in words.
    pub explains: &'static str,
}

/// What [`attribute`] can explain, in words, for the record of a run.
pub const EXPLAINS: &str = "unless the reported HDOP and the HDOP derived from the reported \
sky differ by more than hdop_report_tol (then nothing is explained and the epoch counts as \
inconsistency): when the tracked satellites leave an azimuth gap of \
azimuth_gap_deg or more (sky-blocked) and no signal-power monitor (cn0-drop, agc, jam-ind, \
cn0-spread, cn0-rise) is at or above its alarm threshold, loss-of-lock and any power monitor \
below its threshold are attributed to geometry; every other active monitor is attack-like \
inconsistency whatever the geometry. Geometry never changes the score.";

impl GeometryModel {
    /// The record of `cfg` held for `hold_s`.
    pub fn new(cfg: &GeometryCfg, hold_s: f64) -> Self {
        Self {
            cfg: cfg.clone(),
            hold_s,
            provenance: PROVENANCE.iter().copied().collect(),
            explains: EXPLAINS,
        }
    }
}

/// Epoch counts by geometry status and by attribution: the `geometry_summary` of a result.
#[derive(Clone, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct GeometrySummary {
    /// Epochs with good geometry.
    pub good: usize,
    /// Epochs with degraded geometry.
    pub degraded: usize,
    /// Epochs whose geometry is unknown.
    pub unknown: usize,
    /// Epochs attributed to geometry alone.
    pub attributed_geometry: usize,
    /// Epochs with attack-like inconsistency and good or unknown geometry.
    pub attributed_inconsistency: usize,
    /// Epochs with both.
    pub attributed_both: usize,
    /// Time of the first epoch with degraded geometry, s.
    pub first_degraded_t_s: Option<f64>,
}

impl GeometrySummary {
    /// Count one epoch.
    pub fn add(&mut self, t_s: f64, g: &EpochGeometry, d: Degradation) {
        match g.status {
            GeometryStatus::Good => self.good += 1,
            GeometryStatus::Degraded => {
                self.degraded += 1;
                self.first_degraded_t_s.get_or_insert(t_s);
            }
            GeometryStatus::Unknown => self.unknown += 1,
        }
        match d {
            Degradation::None => {}
            Degradation::Geometry => self.attributed_geometry += 1,
            Degradation::Inconsistency => self.attributed_inconsistency += 1,
            Degradation::GeometryAndInconsistency => self.attributed_both += 1,
        }
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
        // Wrap-around: 350 to 20 is 30 degrees, 20 to 350 the other way is 330.
        assert_eq!(max_azimuth_gap_deg(&[350.0, 20.0]), Some(330.0));
        assert_eq!(
            max_azimuth_gap_deg(&[10.0, 60.0, 100.0, 170.0]),
            Some(200.0)
        );
    }

    #[test]
    fn the_dop_is_the_validated_kernel_on_the_same_directions() {
        // Zenith plus three at elevation 0 spaced 120 deg: the regular-tetrahedron family.
        // Hand-derived: H rows (-e, 1); with u = cos(0) the horizontal block of H^T H is
        // diag(1.5, 1.5); vertical and clock couple: [[1, -1], [-1, 4]] for (up, clock)
        // (sum of sin^2 = 1, sum of sin = 1, n = 4), whose inverse has (1,1) = 4/3.
        // HDOP = sqrt(2/1.5) = 1.1547, VDOP = sqrt(4/3) = 1.1547.
        let d = dop_from_sky(&[(90.0, 0.0), (0.0, 0.0), (0.0, 120.0), (0.0, 240.0)]).unwrap();
        assert!((d.hdop - (2.0_f64 / 1.5).sqrt()).abs() < 1e-9, "{d:?}");
        assert!((d.vdop - (4.0_f64 / 3.0).sqrt()).abs() < 1e-9, "{d:?}");
        assert!(dop_from_sky(&[(10.0, 0.0), (20.0, 90.0), (30.0, 180.0)]).is_none());
    }

    #[test]
    fn an_open_sky_is_good_and_a_half_sky_is_blocked() {
        let cfg = GeometryCfg::default();
        let mut tr = GeometryTracker::new(&cfg, 10.0);
        let g = tr.push(&epoch(0.0, open_sky()));
        assert_eq!(g.status, GeometryStatus::Good, "{g:?}");
        assert_eq!(g.basis, GeometryBasis::Sky);
        assert_eq!(g.n_sats, Some(8));
        assert!(g.pdop.unwrap() < 3.0);
        // Only the satellites between azimuth 40 and 205 are left: a wall to the west.
        let east: Vec<SatSky> = open_sky()
            .into_iter()
            .filter(|s| s.azim_deg <= 205.0)
            .collect();
        let g = tr.push(&epoch(1.0, east));
        assert!(g.reasons.contains(&GeometryReason::SkyBlocked), "{g:?}");
        assert_eq!(g.max_azimuth_gap_deg, Some(195.0));
        assert_eq!(g.status, GeometryStatus::Degraded);
    }

    #[test]
    fn untracked_satellites_do_not_count() {
        let mut sky = open_sky();
        for s in sky.iter_mut().skip(4) {
            s.tracked = false;
        }
        let g = GeometryTracker::new(&GeometryCfg::default(), 10.0).push(&epoch(0.0, sky));
        assert_eq!(g.n_sats, Some(4));
        assert!(g.reasons.contains(&GeometryReason::FewSatellites));
    }

    #[test]
    fn a_held_sky_expires_and_then_the_geometry_is_unknown() {
        let mut tr = GeometryTracker::new(&GeometryCfg::default(), 10.0);
        tr.push(&epoch(0.0, open_sky()));
        let g = tr.push(&epoch(10.0, Vec::new()));
        assert_eq!(g.status, GeometryStatus::Good);
        assert_eq!(g.age_s, Some(10.0));
        let g = tr.push(&epoch(10.5, Vec::new()));
        assert_eq!(g, EpochGeometry::unknown());
    }

    #[test]
    fn a_log_without_geometry_is_unknown_not_guessed() {
        let g = GeometryTracker::new(&GeometryCfg::default(), 10.0).push(&LogEpoch::default());
        assert_eq!(g.status, GeometryStatus::Unknown);
        assert_eq!(g.basis, GeometryBasis::None);
        assert!(g.reasons.is_empty() && g.pdop.is_none());
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
        assert_eq!(g.basis, GeometryBasis::Reported);
        assert_eq!(g.reasons, vec![GeometryReason::HighPdop]);
        assert_eq!(g.max_azimuth_gap_deg, None);
    }

    #[test]
    fn attribution_separates_a_masked_sky_from_attack_like_evidence() {
        let mut blocked = EpochGeometry::unknown();
        blocked.status = GeometryStatus::Degraded;
        blocked.reasons = vec![GeometryReason::SkyBlocked];
        let mut good = EpochGeometry::unknown();
        good.status = GeometryStatus::Good;
        // Satellites lost behind a wall, power steady: geometry.
        assert_eq!(
            attribute(&blocked, &[(Monitor::LossOfLock, true)]),
            (Degradation::Geometry, vec![Monitor::LossOfLock])
        );
        // The C/N0 spread moved by the lost side, still below its threshold: geometry too.
        assert_eq!(
            attribute(
                &blocked,
                &[(Monitor::LossOfLock, true), (Monitor::Cn0Spread, false)]
            ),
            (
                Degradation::Geometry,
                vec![Monitor::LossOfLock, Monitor::Cn0Spread]
            )
        );
        // The same loss with a power drop at its threshold: a jammer is not ruled out.
        assert_eq!(
            attribute(
                &blocked,
                &[(Monitor::Cn0Drop, true), (Monitor::LossOfLock, true)]
            ),
            (Degradation::GeometryAndInconsistency, vec![])
        );
        // A kinematic contradiction is never explained by geometry.
        assert_eq!(
            attribute(&blocked, &[(Monitor::Kinematic, false)]),
            (Degradation::GeometryAndInconsistency, vec![])
        );
        // Loss of lock with an open sky is not explained.
        assert_eq!(
            attribute(&good, &[(Monitor::LossOfLock, true)]),
            (Degradation::Inconsistency, vec![])
        );
        assert_eq!(attribute(&good, &[]), (Degradation::None, vec![]));
        assert_eq!(attribute(&blocked, &[]), (Degradation::Geometry, vec![]));
        // Unknown geometry explains nothing and is not degraded.
        assert_eq!(
            attribute(&EpochGeometry::unknown(), &[(Monitor::LossOfLock, true)]),
            (Degradation::Inconsistency, vec![])
        );
    }

    #[test]
    fn a_reported_hdop_the_sky_does_not_explain_is_inconsistency() {
        // Half the open sky (a wall to the west) with GGA saying HDOP 0.9, as before the wall.
        let east: Vec<SatSky> = open_sky()
            .into_iter()
            .filter(|s| s.azim_deg <= 205.0)
            .collect();
        let mut e = epoch(0.0, east);
        e.marine = Some(super::super::MarineObs {
            hdop: Some(0.9),
            ..Default::default()
        });
        let g = GeometryTracker::new(&GeometryCfg::default(), 10.0).push(&e);
        assert!(g.reasons.contains(&GeometryReason::SkyBlocked));
        assert_eq!(g.reported_hdop, Some(0.9));
        assert!(g.hdop_report_mismatch, "{g:?}");
        assert_eq!(
            attribute(&g, &[(Monitor::LossOfLock, true)]),
            (Degradation::GeometryAndInconsistency, vec![])
        );
        // With a reported HDOP that agrees, the masked sky explains the loss.
        let mut e2 = e.clone();
        e2.marine.as_mut().unwrap().hdop = g.hdop;
        let g2 = GeometryTracker::new(&GeometryCfg::default(), 10.0).push(&e2);
        assert!(!g2.hdop_report_mismatch);
        assert_eq!(
            attribute(&g2, &[(Monitor::LossOfLock, true)]),
            (Degradation::Geometry, vec![Monitor::LossOfLock])
        );
    }

    #[test]
    fn thresholds_are_validated() {
        assert!(GeometryCfg::default().validate().is_ok());
        let bad = GeometryCfg {
            azimuth_gap_deg: 400.0,
            ..GeometryCfg::default()
        };
        assert!(bad.validate().is_err());
        let bad = GeometryCfg {
            pdop_max: 0.0,
            ..GeometryCfg::default()
        };
        assert!(bad.validate().is_err());
    }
}
