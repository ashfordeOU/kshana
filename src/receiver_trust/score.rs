// SPDX-License-Identifier: AGPL-3.0-only
//! The trust score: a number from 0 to 100 for every epoch of a moving platform, with the
//! reasons it is not 100.
//!
//! The mapping is deterministic and fixed before any log is scored: no learning, no fit to
//! events. Every monitor reduces its evidence to a ratio `statistic / threshold` (an alarm
//! at 1 or more, see [`super::maritime`] and [`super::monitors`]). Each ratio costs the
//! score a number of points,
//!
//! ```text
//! points(monitor) = weight(monitor) * clamp((ratio - onset_ratio) / (full_ratio - onset_ratio), 0, 1)
//! score           = round_1dp( clamp(100 - sum of points, 0, 100) )
//! ```
//!
//! so a monitor costs nothing while its statistic is below `onset_ratio` of its threshold
//! (default 0.5, above the wander of a healthy log), costs half its weight when it reaches
//! its threshold, and its whole weight at `full_ratio` times the threshold (default 1.5).
//! The score is therefore non-increasing in every alarm statistic, and the per-monitor
//! points are reported with each epoch.
//!
//! The score maps onto the existing [`TrustState`] by two band edges: `nominal` at or above
//! `nominal_min` (default 90), `degraded` at or above `degraded_min` (default 55),
//! `untrusted` below. Both edges and every weight are in the `[score]` table of a scenario.
//!
//! The weights follow what a monitor can show. A counterfeit position has to contradict a
//! ship's physics or its other sensors, so the monitors that find such a contradiction
//! weigh most (a single clear violation, 60 points, is enough to leave the degraded band; a
//! single clear disagreement of one independent sensor, 40 points, is not, but two are).
//! The receiver's own security reports and a failed authentication weigh as much or more.
//! The signal-environment monitors (power drop, jamming indications, C/N0 shape) weigh
//! less, because on their own they say the environment is hostile, not that the fix is
//! wrong: no one of them can leave the degraded band alone (several together can).

use std::collections::BTreeMap;

use serde::{Deserialize, Serialize};

use super::monitors::{Monitor, TrustState};

/// Default weight of a monitor, points of the 100 it can remove. See the module docs for the
/// reasoning; every value is stated in the result of every run.
pub fn default_weight(m: Monitor) -> f64 {
    match m {
        Monitor::Kinematic => 60.0,
        Monitor::HeadingCourse => 40.0,
        Monitor::SpeedLog => 40.0,
        Monitor::SeaLevel => 30.0,
        Monitor::TimeConsistency => 40.0,
        Monitor::SecSpoof => 60.0,
        Monitor::Osnma => 70.0,
        Monitor::Raim => 60.0,
        Monitor::Clock => 60.0,
        Monitor::SolveFailure => 40.0,
        Monitor::PositionJump => 60.0,
        Monitor::Cn0Spread => 30.0,
        Monitor::Cn0Rise => 30.0,
        Monitor::Cn0Drop => 30.0,
        Monitor::LossOfLock => 25.0,
        Monitor::Agc => 25.0,
        Monitor::JamInd => 25.0,
        Monitor::SecJam => 30.0,
    }
}

/// Every monitor, for listing the effective weights.
pub const ALL_MONITORS: [Monitor; 18] = [
    Monitor::Cn0Drop,
    Monitor::Agc,
    Monitor::JamInd,
    Monitor::LossOfLock,
    Monitor::PositionJump,
    Monitor::Raim,
    Monitor::Clock,
    Monitor::SolveFailure,
    Monitor::Kinematic,
    Monitor::HeadingCourse,
    Monitor::SpeedLog,
    Monitor::SeaLevel,
    Monitor::Cn0Spread,
    Monitor::Cn0Rise,
    Monitor::TimeConsistency,
    Monitor::SecJam,
    Monitor::SecSpoof,
    Monitor::Osnma,
];

/// The `[score]` table: band edges, the ramp of the mapping and weight overrides.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct ScoreCfg {
    /// Score at or above which the epoch is `nominal`. Default 90: a single monitor at its
    /// threshold removes at least 12.5 points (the lightest weight is 25), so any alarm
    /// leaves the nominal band.
    pub nominal_min: f64,
    /// Score at or above which the epoch is `degraded`; below it `untrusted`. Default 55:
    /// one fix-contradiction monitor at full strength (60 points) crosses it, and so do two
    /// independent sensors at full strength (40 + 40), while any single sensor or any
    /// environment monitor alone does not.
    pub degraded_min: f64,
    /// Ratio below which a monitor costs nothing. Default 0.5: half the alarm threshold,
    /// above the wander of a healthy log.
    pub onset_ratio: f64,
    /// Ratio at which a monitor costs its whole weight. Default 1.5.
    pub full_ratio: f64,
    /// How long a monitor's last statistic stands when its input does not arrive at an
    /// epoch, s. Default 10: two cycles of the slowest sentence a ship's bus commonly
    /// carries (satellite C/N0 in GSV, often every 5 s while the fix is every second); a
    /// source silent for longer than this stops counting as evidence either way. The held
    /// statistic counts as an alarm and as a deduction alike, so the two never disagree.
    pub evidence_hold_s: f64,
    /// Weight overrides by monitor name (kebab-case); a monitor not listed keeps its
    /// default.
    pub weights: BTreeMap<Monitor, f64>,
}

impl Default for ScoreCfg {
    fn default() -> Self {
        Self {
            nominal_min: 90.0,
            degraded_min: 55.0,
            onset_ratio: 0.5,
            full_ratio: 1.5,
            evidence_hold_s: 10.0,
            weights: BTreeMap::new(),
        }
    }
}

impl ScoreCfg {
    /// True for the defaults; used to leave the table out of serialised static scenarios.
    pub fn is_default(&self) -> bool {
        *self == ScoreCfg::default()
    }

    /// The weight in force for `m`.
    pub fn weight(&self, m: Monitor) -> f64 {
        self.weights
            .get(&m)
            .copied()
            .unwrap_or_else(|| default_weight(m))
    }

    /// Every monitor's weight in force, for the record of a run.
    pub fn effective_weights(&self) -> BTreeMap<Monitor, f64> {
        ALL_MONITORS.iter().map(|m| (*m, self.weight(*m))).collect()
    }

    /// Reject a mapping that is not monotone or a band that cannot be reached.
    pub fn validate(&self) -> Result<(), String> {
        for (name, v) in [
            ("nominal_min", self.nominal_min),
            ("degraded_min", self.degraded_min),
            ("onset_ratio", self.onset_ratio),
            ("full_ratio", self.full_ratio),
        ] {
            if !v.is_finite() {
                return Err(format!("score: {name} must be finite (got {v})"));
            }
        }
        if !(0.0 < self.degraded_min
            && self.degraded_min < self.nominal_min
            && self.nominal_min <= 100.0)
        {
            return Err(format!(
                "score: need 0 < degraded_min < nominal_min <= 100 (got {} and {})",
                self.degraded_min, self.nominal_min
            ));
        }
        if !(self.evidence_hold_s.is_finite() && self.evidence_hold_s >= 0.0) {
            return Err(format!(
                "score: evidence_hold_s must be finite and >= 0 (got {})",
                self.evidence_hold_s
            ));
        }
        if !(self.onset_ratio >= 0.0 && self.onset_ratio < self.full_ratio) {
            return Err(format!(
                "score: need 0 <= onset_ratio < full_ratio (got {} and {})",
                self.onset_ratio, self.full_ratio
            ));
        }
        for (m, w) in &self.weights {
            if !(w.is_finite() && (0.0..=100.0).contains(w)) {
                return Err(format!(
                    "score: weight of {m:?} must be in [0, 100] (got {w})"
                ));
            }
        }
        Ok(())
    }

    /// The band of a score.
    pub fn band(&self, score: f64) -> TrustState {
        if score >= self.nominal_min {
            TrustState::Nominal
        } else if score >= self.degraded_min {
            TrustState::Degraded
        } else {
            TrustState::Untrusted
        }
    }
}

/// One monitor's cost to the score at one epoch.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
pub struct Deduction {
    /// The monitor.
    pub monitor: Monitor,
    /// Its alarm statistic, `statistic / threshold`.
    pub ratio: f64,
    /// Points removed from the score.
    pub points: f64,
}

/// The trust score of one epoch.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
pub struct TrustScore {
    /// 0 (do not trust) to 100 (nothing found), rounded to 0.1.
    pub score: f64,
    /// The band the score falls in.
    pub band: TrustState,
    /// Which monitors deducted and by how much, largest first (monitor order on ties).
    pub deductions: Vec<Deduction>,
}

/// Points a monitor of `weight` costs at `ratio`: 0 up to `onset_ratio`, rising linearly to
/// `weight` at `full_ratio`, and flat beyond. Non-decreasing in `ratio`.
pub fn points(weight: f64, ratio: f64, cfg: &ScoreCfg) -> f64 {
    if !ratio.is_finite() {
        return if ratio > 0.0 { weight } else { 0.0 };
    }
    let f = ((ratio - cfg.onset_ratio) / (cfg.full_ratio - cfg.onset_ratio)).clamp(0.0, 1.0);
    weight * f
}

/// Map monitor ratios to a trust score. Monitors that did not decide are absent from
/// `ratios` and cost nothing.
pub fn score_from_ratios(ratios: &BTreeMap<Monitor, f64>, cfg: &ScoreCfg) -> TrustScore {
    let mut deductions: Vec<Deduction> = ratios
        .iter()
        .map(|(m, r)| Deduction {
            monitor: *m,
            ratio: *r,
            points: points(cfg.weight(*m), *r, cfg),
        })
        .filter(|d| d.points > 0.0)
        .collect();
    let total: f64 = deductions.iter().map(|d| d.points).sum();
    deductions.sort_by(|a, b| {
        b.points
            .total_cmp(&a.points)
            .then(a.monitor.cmp(&b.monitor))
    });
    let score = ((100.0 - total).clamp(0.0, 100.0) * 10.0).round() / 10.0;
    TrustScore {
        score,
        band: cfg.band(score),
        deductions,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn one(m: Monitor, r: f64) -> TrustScore {
        score_from_ratios(&BTreeMap::from([(m, r)]), &ScoreCfg::default())
    }

    /// A deterministic pseudo-random sequence in [0, 1).
    fn lcg(seed: &mut u64) -> f64 {
        *seed = seed
            .wrapping_mul(6_364_136_223_846_793_005)
            .wrapping_add(1_442_695_040_888_963_407);
        (*seed >> 11) as f64 / (1u64 << 53) as f64
    }

    #[test]
    fn nothing_found_is_a_hundred_and_nominal() {
        let s = score_from_ratios(&BTreeMap::new(), &ScoreCfg::default());
        assert_eq!((s.score, s.band), (100.0, TrustState::Nominal));
        assert!(s.deductions.is_empty());
    }

    #[test]
    fn the_ramp_costs_nothing_to_onset_half_at_threshold_all_at_full() {
        let c = ScoreCfg::default();
        assert_eq!(points(40.0, 0.5, &c), 0.0);
        assert_eq!(points(40.0, 1.0, &c), 20.0);
        assert_eq!(points(40.0, 1.5, &c), 40.0);
        assert_eq!(points(40.0, 9.0, &c), 40.0);
        assert_eq!(points(40.0, f64::INFINITY, &c), 40.0);
        assert_eq!(points(40.0, f64::NAN, &c), 0.0);
    }

    #[test]
    fn score_is_monotone_non_increasing_in_every_alarm_statistic() {
        let cfg = ScoreCfg::default();
        let mut seed = 7u64;
        for m in ALL_MONITORS {
            // Random background of the other monitors, then sweep this one's ratio.
            for _ in 0..40 {
                let mut bg: BTreeMap<Monitor, f64> = ALL_MONITORS
                    .iter()
                    .filter(|o| **o != m)
                    .map(|o| (*o, 3.0 * lcg(&mut seed)))
                    .collect();
                let mut prev = f64::INFINITY;
                for step in 0..=60 {
                    bg.insert(m, step as f64 * 0.05);
                    let s = score_from_ratios(&bg, &cfg).score;
                    assert!(s <= prev + 1e-12, "{m:?} step {step}: {s} > {prev}");
                    assert!((0.0..=100.0).contains(&s));
                    prev = s;
                }
            }
        }
    }

    #[test]
    fn score_never_rises_when_another_monitor_is_added() {
        let cfg = ScoreCfg::default();
        let mut seed = 11u64;
        for _ in 0..200 {
            let mut set: BTreeMap<Monitor, f64> = BTreeMap::new();
            let mut prev = 100.0;
            for m in ALL_MONITORS {
                set.insert(m, 2.0 * lcg(&mut seed));
                let s = score_from_ratios(&set, &cfg).score;
                assert!(s <= prev, "{m:?}");
                prev = s;
            }
        }
    }

    #[test]
    fn healthy_statistics_stay_in_the_top_band() {
        // Every monitor at up to the onset ratio of its threshold costs nothing.
        let cfg = ScoreCfg::default();
        let mut seed = 3u64;
        for _ in 0..200 {
            let r: BTreeMap<Monitor, f64> = ALL_MONITORS
                .iter()
                .map(|m| (*m, cfg.onset_ratio * lcg(&mut seed)))
                .collect();
            let s = score_from_ratios(&r, &cfg);
            assert_eq!((s.score, s.band), (100.0, TrustState::Nominal));
        }
    }

    #[test]
    fn any_single_monitor_at_its_threshold_leaves_the_nominal_band() {
        for m in ALL_MONITORS {
            let s = one(m, 1.0);
            assert_ne!(
                s.band,
                TrustState::Nominal,
                "{m:?} at its threshold: {}",
                s.score
            );
            assert_eq!(s.deductions.len(), 1);
            assert_eq!(s.deductions[0].monitor, m);
        }
    }

    #[test]
    fn bands_follow_the_stated_edges() {
        let c = ScoreCfg::default();
        assert_eq!(c.band(100.0), TrustState::Nominal);
        assert_eq!(c.band(90.0), TrustState::Nominal);
        assert_eq!(c.band(89.9), TrustState::Degraded);
        assert_eq!(c.band(55.0), TrustState::Degraded);
        assert_eq!(c.band(54.9), TrustState::Untrusted);
        assert_eq!(c.band(0.0), TrustState::Untrusted);
    }

    #[test]
    fn one_clear_physics_violation_or_two_clear_sensor_disagreements_are_untrusted() {
        assert_eq!(one(Monitor::Kinematic, 1.5).band, TrustState::Untrusted);
        let both = score_from_ratios(
            &BTreeMap::from([(Monitor::HeadingCourse, 1.5), (Monitor::SpeedLog, 1.5)]),
            &ScoreCfg::default(),
        );
        assert_eq!((both.score, both.band), (20.0, TrustState::Untrusted));
        // One sensor alone, or the signal environment alone, is degraded at most.
        assert_eq!(one(Monitor::HeadingCourse, 9.0).band, TrustState::Degraded);
        assert_eq!(one(Monitor::Cn0Drop, 9.0).band, TrustState::Degraded);
    }

    #[test]
    fn deductions_are_listed_largest_first_with_the_ratio_that_caused_them() {
        let s = score_from_ratios(
            &BTreeMap::from([
                (Monitor::SeaLevel, 1.0),
                (Monitor::Kinematic, 1.5),
                (Monitor::Cn0Rise, 0.4),
            ]),
            &ScoreCfg::default(),
        );
        let got: Vec<(Monitor, f64, f64)> = s
            .deductions
            .iter()
            .map(|d| (d.monitor, d.ratio, d.points))
            .collect();
        assert_eq!(
            got,
            [
                (Monitor::Kinematic, 1.5, 60.0),
                (Monitor::SeaLevel, 1.0, 15.0)
            ]
        );
        assert_eq!(s.score, 25.0);
    }

    #[test]
    fn overrides_and_validation() {
        let mut c = ScoreCfg::default();
        c.weights.insert(Monitor::SeaLevel, 10.0);
        assert_eq!(c.weight(Monitor::SeaLevel), 10.0);
        assert_eq!(c.weight(Monitor::Kinematic), 60.0);
        assert_eq!(c.effective_weights().len(), ALL_MONITORS.len());
        assert!(c.validate().is_ok());
        for bad in [
            ScoreCfg {
                nominal_min: 50.0,
                degraded_min: 60.0,
                ..Default::default()
            },
            ScoreCfg {
                onset_ratio: 1.5,
                ..Default::default()
            },
            ScoreCfg {
                degraded_min: 0.0,
                ..Default::default()
            },
            ScoreCfg {
                weights: BTreeMap::from([(Monitor::Agc, 120.0)]),
                ..Default::default()
            },
        ] {
            assert!(bad.validate().is_err(), "{bad:?}");
        }
    }
}
