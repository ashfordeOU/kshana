// SPDX-License-Identifier: AGPL-3.0-only
//! The shared types of a mission thread: the carried navigation-and-timing state, the phase
//! description, what a phase returns, and the evidence label every phase carries.
//!
//! Units are SI throughout: metres, metres per second, seconds. The covariance is always the
//! full 6x6 of `[x, y, z, vx, vy, vz]` in the stated frame (a diagonal is a special case, never a
//! different type), in m^2, m^2/s and m^2/s^2. Mission time `t_s` is seconds since the thread's
//! epoch.

use serde::{Deserialize, Serialize};

/// Number of states in the carried position-velocity vector.
pub const N: usize = 6;

/// A 6x6 covariance of `[x, y, z, vx, vy, vz]`.
pub type Cov6 = [[f64; N]; N];

/// The reference frame a [`NavState`] is expressed in. Conversions between frames are done by
/// the thread at a handover ([`crate::mission_thread::ThreadCtx`]), never inside a phase.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub enum Frame {
    /// Geocentric celestial reference frame (inertial, Earth-centred).
    Gcrf,
    /// International terrestrial reference frame (Earth-fixed).
    Itrf,
    /// Moon-centred inertial.
    Mci,
    /// Moon-centred, Moon-fixed (principal-axis or mean-Earth frame as the phase states).
    Mcmf,
    /// Local-vertical local-horizontal frame of a named target, for relative motion.
    Lvlh,
}

impl Frame {
    /// The name used in documents and results.
    pub fn name(self) -> &'static str {
        match self {
            Frame::Gcrf => "gcrf",
            Frame::Itrf => "itrf",
            Frame::Mci => "mci",
            Frame::Mcmf => "mcmf",
            Frame::Lvlh => "lvlh",
        }
    }

    /// Parses a frame name from a document.
    pub fn parse(s: &str) -> Result<Self, String> {
        Ok(match s {
            "gcrf" => Frame::Gcrf,
            "itrf" => Frame::Itrf,
            "mci" => Frame::Mci,
            "mcmf" => Frame::Mcmf,
            "lvlh" => Frame::Lvlh,
            other => {
                return Err(crate::terr!(
                    "e-mission-thread-phase-unknown-frame-expected-one-of",
                    other = other
                ))
            }
        })
    }
}

/// The timescale a clock state is stated in.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub enum Timescale {
    /// Terrestrial Time.
    Tt,
    /// Barycentric Dynamical Time.
    Tdb,
    /// Coordinated Universal Time.
    Utc,
    /// Lunar Coordinate Time.
    Ltc,
}

impl Timescale {
    /// The name used in documents and results.
    pub fn name(self) -> &'static str {
        match self {
            Timescale::Tt => "tt",
            Timescale::Tdb => "tdb",
            Timescale::Utc => "utc",
            Timescale::Ltc => "ltc",
        }
    }

    /// Parses a timescale name from a document.
    pub fn parse(s: &str) -> Result<Self, String> {
        Ok(match s {
            "tt" => Timescale::Tt,
            "tdb" => Timescale::Tdb,
            "utc" => Timescale::Utc,
            "ltc" => Timescale::Ltc,
            other => {
                return Err(crate::terr!(
                    "e-mission-thread-phase-unknown-timescale-expected-one-of",
                    other = other
                ))
            }
        })
    }
}

/// Where a phase gets its position and velocity from.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub enum NavSource {
    /// GNSS in its nominal service volume.
    Gnss,
    /// GNSS in the space service volume (high orbit and beyond), main lobe and sidelobe links.
    GnssSsv,
    /// Ground-station range and range-rate tracking.
    GroundTracking,
    /// LunaNet-style lunar navigation signals.
    Lunanet,
    /// Terrain-relative navigation.
    Trn,
    /// Inertial dead reckoning.
    Inertial,
    /// Relative navigation by optical or lidar sensing of a target.
    RelativeOptical,
}

impl NavSource {
    /// The name used in documents and results.
    pub fn name(self) -> &'static str {
        match self {
            NavSource::Gnss => "gnss",
            NavSource::GnssSsv => "gnss-ssv",
            NavSource::GroundTracking => "ground-tracking",
            NavSource::Lunanet => "lunanet",
            NavSource::Trn => "trn",
            NavSource::Inertial => "inertial",
            NavSource::RelativeOptical => "relative-optical",
        }
    }

    /// Parses a source name from a document.
    pub fn parse(s: &str) -> Result<Self, String> {
        Ok(match s {
            "gnss" => NavSource::Gnss,
            "gnss-ssv" => NavSource::GnssSsv,
            "ground-tracking" => NavSource::GroundTracking,
            "lunanet" => NavSource::Lunanet,
            "trn" => NavSource::Trn,
            "inertial" => NavSource::Inertial,
            "relative-optical" => NavSource::RelativeOptical,
            other => {
                return Err(crate::terr!(
                    "e-mission-thread-phase-unknown-navigation-source-expected-one",
                    other = other
                ))
            }
        })
    }
}

/// Where a phase gets its time from.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub enum TimeSource {
    /// A GNSS-disciplined clock.
    Gnss,
    /// A ground-station clock reached over a two-way link.
    GroundClock,
    /// A lunar-time service.
    LunarTime,
    /// The onboard oscillator free-running (holdover).
    OnboardHoldover,
}

impl TimeSource {
    /// The name used in documents and results.
    pub fn name(self) -> &'static str {
        match self {
            TimeSource::Gnss => "gnss",
            TimeSource::GroundClock => "ground-clock",
            TimeSource::LunarTime => "lunar-time",
            TimeSource::OnboardHoldover => "onboard-holdover",
        }
    }

    /// Parses a time-source name from a document.
    pub fn parse(s: &str) -> Result<Self, String> {
        Ok(match s {
            "gnss" => TimeSource::Gnss,
            "ground-clock" => TimeSource::GroundClock,
            "lunar-time" => TimeSource::LunarTime,
            "onboard-holdover" => TimeSource::OnboardHoldover,
            other => {
                return Err(crate::terr!(
                    "e-mission-thread-phase-unknown-time-source-expected-one",
                    other = other
                ))
            }
        })
    }
}

/// The onboard clock: bias and drift against the stated timescale, with their 2x2 covariance.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct ClockState {
    /// The timescale the bias is measured against.
    pub timescale: Timescale,
    /// Clock bias, seconds.
    pub bias_s: f64,
    /// Clock drift (fractional frequency offset), seconds per second.
    pub drift_s_per_s: f64,
    /// Covariance of `[bias, drift]`: s^2, s^2/s, (s/s)^2.
    pub cov: [[f64; 2]; 2],
}

impl ClockState {
    /// 1-sigma of the clock bias, seconds.
    pub fn sigma_bias_s(&self) -> f64 {
        self.cov[0][0].max(0.0).sqrt()
    }
}

/// The navigation-and-timing state carried from one phase to the next.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct NavState {
    /// Mission elapsed time, seconds since the thread's epoch.
    pub t_s: f64,
    /// The frame `x` and `p` are expressed in.
    pub frame: Frame,
    /// Position (m) and velocity (m/s): `[x, y, z, vx, vy, vz]`.
    pub x: [f64; N],
    /// The 6x6 covariance of `x`: m^2, m^2/s, m^2/s^2.
    pub p: Cov6,
    /// The onboard clock.
    pub clock: ClockState,
    /// The evidence label of everything upstream of this state.
    pub upstream: EvidenceLabel,
}

impl NavState {
    /// 1-sigma position, metres: the square root of the trace of the position block.
    pub fn sigma_pos_m(&self) -> f64 {
        (self.p[0][0] + self.p[1][1] + self.p[2][2]).max(0.0).sqrt()
    }

    /// 1-sigma velocity, metres per second: the square root of the trace of the velocity block.
    pub fn sigma_vel_mps(&self) -> f64 {
        (self.p[3][3] + self.p[4][4] + self.p[5][5]).max(0.0).sqrt()
    }

    /// 1-sigma clock bias, seconds.
    pub fn sigma_time_s(&self) -> f64 {
        self.clock.sigma_bias_s()
    }

    /// A state with a diagonal covariance from per-axis 1-sigmas, for a thread's first phase and
    /// for tests. Position sigma `sp` (m) on each axis, velocity sigma `sv` (m/s) on each axis,
    /// clock bias sigma `st` (s) and a clock drift sigma of `sd` (s/s).
    #[allow(clippy::too_many_arguments)]
    pub fn diagonal(
        t_s: f64,
        frame: Frame,
        x: [f64; N],
        sp: f64,
        sv: f64,
        timescale: Timescale,
        st: f64,
        sd: f64,
    ) -> Self {
        let mut p = [[0.0; N]; N];
        for i in 0..3 {
            p[i][i] = sp * sp;
            p[i + 3][i + 3] = sv * sv;
        }
        NavState {
            t_s,
            frame,
            x,
            p,
            clock: ClockState {
                timescale,
                bias_s: 0.0,
                drift_s_per_s: 0.0,
                cov: [[st * st, 0.0], [0.0, sd * sd]],
            },
            upstream: EvidenceLabel::modelled(),
        }
    }
}

/// How well a phase's numbers are backed, mirroring the ledger's three tiers.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub enum LabelTier {
    /// Checked against an independent external oracle (a ledger row says which).
    Validated,
    /// Computed from a stated model; no external oracle.
    Modelled,
    /// Owned by a hardware partner; Kshana holds no oracle for it.
    Partner,
}

impl LabelTier {
    /// Strength, higher is better supported: Partner < Modelled < Validated.
    fn strength(self) -> u8 {
        match self {
            LabelTier::Partner => 0,
            LabelTier::Modelled => 1,
            LabelTier::Validated => 2,
        }
    }

    /// The upper-case name the ledger uses.
    pub fn name(self) -> &'static str {
        match self {
            LabelTier::Validated => "VALIDATED",
            LabelTier::Modelled => "MODELLED",
            LabelTier::Partner => "PARTNER",
        }
    }
}

/// An evidence label: a tier and the ledger row id that earns it, if any.
#[derive(Clone, Debug, PartialEq, Eq, Serialize, Deserialize)]
pub struct EvidenceLabel {
    /// The tier.
    pub tier: LabelTier,
    /// The verification-matrix row id that supports the tier; `None` for a plain MODELLED label.
    pub row_id: Option<String>,
}

impl EvidenceLabel {
    /// A MODELLED label with no row.
    pub fn modelled() -> Self {
        EvidenceLabel {
            tier: LabelTier::Modelled,
            row_id: None,
        }
    }

    /// A VALIDATED label backed by the named ledger row. A phase may only construct this with a
    /// row that the matrix process has promoted.
    pub fn validated(row_id: &str) -> Self {
        EvidenceLabel {
            tier: LabelTier::Validated,
            row_id: Some(row_id.to_string()),
        }
    }

    /// A PARTNER label for the named row.
    pub fn partner(row_id: &str) -> Self {
        EvidenceLabel {
            tier: LabelTier::Partner,
            row_id: Some(row_id.to_string()),
        }
    }

    /// The weaker of two labels (Partner < Modelled < Validated); on a tie the first is kept.
    pub fn weaker(self, other: EvidenceLabel) -> EvidenceLabel {
        if other.tier.strength() < self.tier.strength() {
            other
        } else {
            self
        }
    }
}

/// How a phase is handed on to the next.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub enum HandoverRule {
    /// The exit state and covariance enter the next phase unchanged.
    Carry,
    /// The covariance is inflated by a stated process-noise model over a stated gap.
    Inflate {
        /// Power spectral density of the white acceleration noise, (m/s^2)^2 per Hz.
        q_acc: f64,
        /// The gap the noise acts over, seconds.
        gap_s: f64,
    },
    /// The next phase's source is acquired after dead reckoning; the covariance is set to the
    /// source's floor on each axis where that is smaller than the dead-reckoned value, never
    /// below the floor.
    Reacquire {
        /// Dead reckoning before the new source is acquired, seconds.
        acquire_s: f64,
        /// Power spectral density of the dead-reckoning acceleration noise, (m/s^2)^2 per Hz.
        q_acc: f64,
        /// 1-sigma position the acquired source delivers, metres, per axis.
        floor_pos_m: f64,
        /// 1-sigma velocity the acquired source delivers, metres per second, per axis.
        floor_vel_mps: f64,
        /// 1-sigma time the acquired source delivers, seconds.
        floor_time_s: f64,
    },
}

/// A limit a phase must meet; any left out is not checked.
#[derive(Clone, Copy, Debug, Default, PartialEq, Serialize, Deserialize)]
pub struct Requirement {
    /// Largest 1-sigma position over the phase, metres.
    pub max_pos_m: Option<f64>,
    /// Largest 1-sigma velocity over the phase, metres per second.
    pub max_vel_mps: Option<f64>,
    /// Largest 1-sigma time over the phase, seconds.
    pub max_time_s: Option<f64>,
}

/// One phase of a thread as a document states it. The common fields are parsed by the thread;
/// `model` is the phase kind's own table and is parsed by the phase kind.
#[derive(Clone, Debug, PartialEq)]
pub struct PhaseSpec {
    /// A name unique within the thread.
    pub id: String,
    /// The registered phase kind.
    pub kind: String,
    /// Phase length, seconds.
    pub duration_s: f64,
    /// Navigation sources the phase uses.
    pub nav: Vec<NavSource>,
    /// Time source the phase uses.
    pub time: TimeSource,
    /// The frame the phase needs its entry state in; the thread converts at the handover. `None`
    /// keeps the previous phase's frame.
    pub frame: Option<Frame>,
    /// The timescale the phase needs its clock in; the thread converts at the handover. `None`
    /// keeps the previous phase's timescale.
    pub timescale: Option<Timescale>,
    /// How this phase hands over to the next.
    pub handover: HandoverRule,
    /// What the phase must meet.
    pub requirement: Requirement,
    /// The phase kind's own parameters.
    pub model: toml::Table,
}

/// One value of a phase's time series, for the timeline figure.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct Sample {
    /// Mission elapsed time, seconds.
    pub t_s: f64,
    /// 1-sigma position, metres.
    pub sigma_pos_m: f64,
    /// 1-sigma velocity, metres per second.
    pub sigma_vel_mps: f64,
    /// 1-sigma time, seconds.
    pub sigma_time_s: f64,
}

/// A dated thing that happened in a phase (acquisition, loss, handover, docking window).
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct Event {
    /// Mission elapsed time, seconds.
    pub t_s: f64,
    /// What happened.
    pub what: String,
}

/// What a phase returns.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct PhaseOutcome {
    /// The state handed to the next phase, in the frame the phase ended in.
    pub exit: NavState,
    /// The phase's error budget.
    pub budget: crate::mission_thread::budget::PhaseBudget,
    /// The time series of the phase's 1-sigmas.
    pub series: Vec<Sample>,
    /// The dated events.
    pub events: Vec<Event>,
    /// The label of this phase's own numbers.
    pub label: EvidenceLabel,
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn a_diagonal_state_reports_the_sigmas_it_was_built_from() {
        let s = NavState::diagonal(
            0.0,
            Frame::Gcrf,
            [0.0; N],
            3.0,
            0.04,
            Timescale::Utc,
            1e-6,
            1e-12,
        );
        assert!((s.sigma_pos_m() - 3.0 * 3f64.sqrt()).abs() < 1e-12);
        assert!((s.sigma_vel_mps() - 0.04 * 3f64.sqrt()).abs() < 1e-15);
        assert!((s.sigma_time_s() - 1e-6).abs() < 1e-18);
    }

    #[test]
    fn the_weaker_label_is_partner_then_modelled_then_validated() {
        let v = EvidenceLabel::validated("row-a");
        let m = EvidenceLabel::modelled();
        let p = EvidenceLabel::partner("row-b");
        assert_eq!(v.clone().weaker(m.clone()).tier, LabelTier::Modelled);
        assert_eq!(m.clone().weaker(v).tier, LabelTier::Modelled);
        assert_eq!(m.weaker(p.clone()).tier, LabelTier::Partner);
        assert_eq!(p.weaker(EvidenceLabel::modelled()).tier, LabelTier::Partner);
    }

    #[test]
    fn source_and_time_names_round_trip_and_unknown_names_are_refused() {
        for s in [
            NavSource::Gnss,
            NavSource::GnssSsv,
            NavSource::GroundTracking,
            NavSource::Lunanet,
            NavSource::Trn,
            NavSource::Inertial,
            NavSource::RelativeOptical,
        ] {
            assert_eq!(NavSource::parse(s.name()).unwrap(), s);
        }
        for t in [
            TimeSource::Gnss,
            TimeSource::GroundClock,
            TimeSource::LunarTime,
            TimeSource::OnboardHoldover,
        ] {
            assert_eq!(TimeSource::parse(t.name()).unwrap(), t);
        }
        assert!(NavSource::parse("magic").is_err());
        assert!(TimeSource::parse("magic").is_err());
    }
}
