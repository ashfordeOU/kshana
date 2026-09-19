// SPDX-License-Identifier: AGPL-3.0-only
//! INS/TRN **coasting error model** — position error against coast duration, and the
//! coast durations at which it crosses stated position thresholds.
//!
//! ## Why this module exists
//!
//! A GNSS-denied (or aperture-duty-cycled) study that *sweeps* a dead-reckoning drift
//! rate over, say, 0.001–0.050 m/s has assumed its answer: the drift rate is the thing
//! the inertial sensors decide, not a free parameter. This module computes it. It grows
//! a position-error budget from IMU coefficients and reports the coast durations at
//! which the error reaches caller-supplied thresholds (10 m and 50 m by default) as
//! **engine outputs**, located by bisection, with a per-contribution breakdown at each
//! crossing saying which error source put it there.
//!
//! ## The model
//!
//! Every contribution is an exact monomial in the coast duration `t`, `σ(t) = c·t^p`.
//! The coefficients come from the standard IMU coefficient set (Groves 2013 §4.4.1 /
//! Table 4.1 for the class bands; IEEE Std 952-1997 for the Allan-region naming):
//!
//! | contribution | `c` | `p` | class |
//! |---|---|---|---|
//! | `accel_bias`            | `b_a / 2`            | 2.0 | deterministic |
//! | `gyro_bias_tilt`        | `g·b_g / 6`          | 3.0 | deterministic |
//! | `scale_factor_cruise`   | `s·v`                | 1.0 | deterministic |
//! | `scale_factor_accel`    | `s·a / 2`            | 2.0 | deterministic |
//! | `velocity_random_walk`  | `σ_vrw / √3`         | 1.5 | stochastic |
//! | `angle_random_walk`     | `g·σ_arw / √20`      | 2.5 | stochastic |
//! | `trn_fix_residual`      | `r`                  | 0.0 | stochastic (TRN modes only) |
//!
//! *Accelerometer bias* `b_a` integrates twice: `½ b_a t²`. *Gyro bias* `b_g` tilts the
//! platform by `b_g t`, which couples gravity into a horizontal specific-force error
//! `g·b_g·t` and integrates twice more: `⅙ g b_g t³`. *Scale factor* `s` mis-scales the
//! **travelled distance** `d(t) = v·t + ½ a t²` — so at constant cruise speed it grows
//! linearly and under a sustained specific force it grows quadratically, and a static
//! platform has no scale-factor contribution at all. *Velocity random walk* makes the
//! velocity error a Wiener process of diffusion `σ_vrw²`; its time integral has variance
//! `σ_vrw² t³/3`. *Angle random walk* makes the tilt a Wiener process of diffusion
//! `σ_arw²`; the doubly integrated gravity coupling has variance `g² σ_arw² t⁵/20`.
//!
//! Each of those closed forms is exact **for this model**, so each contribution's own
//! crossing is reported twice — the analytic inversion `t = (threshold/c)^(1/p)` and a
//! bisection on the same curve through the engine's existing
//! [`crate::quantum_trade::PositionDrift::inertial_holdover_s`] — with their relative
//! difference, per rule: where a closed form is exact, report both and their agreement.
//! The **total** has no such inversion (it mixes five different powers), so the headline
//! crossings are bisection only.
//!
//! ## The combination is a modelling choice, and it is stated
//!
//! How the contributions combine into one number is not settled by physics; the choice
//! is an input and is echoed in the result as `combination`:
//!
//! * `rss` (default) — root-sum-square. Reads every coefficient as a 1σ spec over a
//!   population of turn-ons, which is what an IMU datasheet's bias *repeatability* is.
//! * `linear-sum` — worst-case coherent addition. Every bias takes its worst sign at once.
//! * `det-sum-stoch-rss` — the deterministic terms add coherently, the (independently
//!   driven) random walks root-sum-square, and the two groups then add.
//!
//! All three are computed for the 10 m/50 m crossings in `combination_sensitivity`, so
//! the sensitivity of the headline to the choice is visible rather than argued.
//!
//! ## What TRN does here
//!
//! Terrain-referenced navigation in this engine ([`crate::altpnt::terrain`],
//! [`crate::altpnt::sequential`]) recovers a position offset by matching measured ground
//! elevation against a stored DEM. It therefore **bounds** the coast: it supplies a
//! position fix with a residual, it does not slow the growth between fixes. Two honest
//! fix semantics are offered, because they differ by a lot and the engine supports both
//! readings:
//!
//! * `position-only` — the fix corrects position and nothing else. Velocity error and
//!   tilt keep integrating across the fix, so the per-interval excursion grows from one
//!   fix to the next. This is what a bare position fix does.
//! * `full-reset` — the whole error state is re-zeroed at each fix, mirroring
//!   [`crate::inertial::AccelModel::reset`], which is what a filter that also observes
//!   velocity and tilt approaches. Every inter-fix excursion is then identical.
//!
//! In both, the matcher residual enters as a constant (`p = 0`) contribution. The result
//! reports the mission-peak error and the **largest fix interval** that holds the peak
//! under each threshold, located by bisection over a stated bracket.
//!
//! ## Validated vs Modelled
//!
//! The *growth laws* are Validated: each is checked against an independent route — a
//! Monte-Carlo ensemble of the engine's existing stochastic dead-reckoner
//! [`crate::inertial::AccelModel`] for the bias, VRW, gyro-bias and ARW channels, and a
//! double integration of [`crate::inertial::imu_errors::ImuErrorModel`]'s own distorted
//! specific force for the scale-factor channel. The *class coefficients* are MODELLED
//! representative figures for each IMU grade, not a datasheet for a specific part, and
//! the TRN fix residual is a documented input, not a measurement.

use crate::inertial::imu_errors::ImuErrorModel;
use crate::inertial::G_M_PER_S2;
use crate::quantum_trade::PositionDrift;
use serde::Deserialize;

/// The honesty label carried on the result document.
const LABEL: &str = "MODELLED INS/TRN coasting error budget. The per-contribution growth \
laws (bias t^2, gyro-bias tilt t^3, velocity random walk t^1.5, angle random walk t^2.5, \
scale factor x travelled distance) are exact for this model and cross-checked against the \
engine's own stochastic dead-reckoner and IMU error model; the IMU grade coefficients are \
representative CLASS figures (Groves 2013 Table 4.1 bands), not a datasheet for a part, and \
the TRN fix residual is a documented input. The crossings are located by bisection on the \
model, never by manuscript arithmetic. Not certified for operational navigation.";

/// Seconds per hour — the divisor turning the per-root-hour random-walk coefficients an
/// IMU datasheet quotes into the per-root-second SI form the model integrates.
const SQRT_SECONDS_PER_HOUR: f64 = 60.0;

/// Degrees per hour to radians per second.
const DEG_PER_HR_TO_RAD_S: f64 = std::f64::consts::PI / 180.0 / 3600.0;

/// Micro-g to m/s².
const UG_TO_M_S2: f64 = 1.0e-6 * G_M_PER_S2;

/// Parts per million to a dimensionless fraction.
const PPM: f64 = 1.0e-6;

// ---------------------------------------------------------------------------
// IMU grades
// ---------------------------------------------------------------------------

/// A representative IMU class. The coefficients are **class bands**, not a datasheet for
/// any specific part: they place a grade on the standard navigation/tactical/industrial/
/// consumer ladder (Groves 2013 §4.4.1, Table 4.1) so a coast result can be read as
/// "what a navigation-grade unit does", which is the question a duty-cycle study asks.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ImuGrade {
    /// Aviation / navigation grade (strategic-adjacent): µg biases, milli-deg/hr gyros.
    Navigation,
    /// Tactical grade: hundreds of µg, ~1 deg/hr gyros.
    Tactical,
    /// Industrial MEMS: milli-g biases, tens of deg/hr gyros.
    Industrial,
    /// Consumer MEMS: tens of milli-g, hundreds of deg/hr.
    Consumer,
}

impl ImuGrade {
    /// Every grade, coarsest last — the default order of the comparison table.
    pub fn all() -> &'static [ImuGrade] {
        &[
            ImuGrade::Navigation,
            ImuGrade::Tactical,
            ImuGrade::Industrial,
            ImuGrade::Consumer,
        ]
    }

    /// The scenario-facing name.
    pub fn as_str(self) -> &'static str {
        match self {
            ImuGrade::Navigation => "navigation",
            ImuGrade::Tactical => "tactical",
            ImuGrade::Industrial => "industrial",
            ImuGrade::Consumer => "consumer",
        }
    }

    /// Resolve a scenario grade name. An unknown name is an error naming the accepted set
    /// — never a silent fallback to a default grade, which would publish a coast for a
    /// unit the caller did not ask for.
    pub fn parse(name: &str) -> Result<ImuGrade, String> {
        match name {
            "navigation" => Ok(ImuGrade::Navigation),
            "tactical" => Ok(ImuGrade::Tactical),
            "industrial" => Ok(ImuGrade::Industrial),
            "consumer" => Ok(ImuGrade::Consumer),
            other => Err(format!(
                "unknown imu_grade {other:?}; expected one of navigation, tactical, \
                 industrial, consumer"
            )),
        }
    }

    /// The representative coefficient set for this grade, in the units an IMU datasheet
    /// quotes them in.
    pub fn params(self) -> ImuParams {
        match self {
            ImuGrade::Navigation => ImuParams {
                grade: "navigation",
                accel_bias_ug: 25.0,
                accel_vrw_m_s_per_sqrt_hr: 0.007,
                accel_scale_factor_ppm: 100.0,
                gyro_bias_deg_per_hr: 0.01,
                gyro_arw_deg_per_sqrt_hr: 0.002,
            },
            ImuGrade::Tactical => ImuParams {
                grade: "tactical",
                accel_bias_ug: 300.0,
                accel_vrw_m_s_per_sqrt_hr: 0.06,
                accel_scale_factor_ppm: 300.0,
                gyro_bias_deg_per_hr: 1.0,
                gyro_arw_deg_per_sqrt_hr: 0.05,
            },
            ImuGrade::Industrial => ImuParams {
                grade: "industrial",
                accel_bias_ug: 3000.0,
                accel_vrw_m_s_per_sqrt_hr: 0.3,
                accel_scale_factor_ppm: 2000.0,
                gyro_bias_deg_per_hr: 20.0,
                gyro_arw_deg_per_sqrt_hr: 0.3,
            },
            ImuGrade::Consumer => ImuParams {
                grade: "consumer",
                accel_bias_ug: 25000.0,
                accel_vrw_m_s_per_sqrt_hr: 1.5,
                accel_scale_factor_ppm: 10000.0,
                gyro_bias_deg_per_hr: 200.0,
                gyro_arw_deg_per_sqrt_hr: 2.0,
            },
        }
    }
}

/// One IMU's coefficient set, in datasheet units. Converted to SI by [`ImuParams::si`].
#[derive(Clone, Copy, Debug)]
pub struct ImuParams {
    /// The grade these coefficients came from (or `"custom"` after an override).
    pub grade: &'static str,
    /// Residual accelerometer bias, 1σ (µg).
    pub accel_bias_ug: f64,
    /// Accelerometer velocity random walk (m/s per √hour).
    pub accel_vrw_m_s_per_sqrt_hr: f64,
    /// Accelerometer scale-factor error, 1σ (ppm).
    pub accel_scale_factor_ppm: f64,
    /// Residual gyro bias, 1σ (deg/hour).
    pub gyro_bias_deg_per_hr: f64,
    /// Gyro angle random walk (deg per √hour).
    pub gyro_arw_deg_per_sqrt_hr: f64,
}

/// The same coefficient set in SI, as the model integrates it.
#[derive(Clone, Copy, Debug)]
pub struct ImuParamsSi {
    /// Accelerometer bias (m/s²).
    pub accel_bias_m_s2: f64,
    /// Velocity random walk ((m/s)/√s), i.e. √(white acceleration PSD).
    pub accel_vrw_m_s_per_sqrt_s: f64,
    /// Accelerometer scale-factor error (dimensionless fraction).
    pub accel_scale_factor: f64,
    /// Gyro bias (rad/s).
    pub gyro_bias_rad_s: f64,
    /// Angle random walk (rad/√s), i.e. √(white angular-rate PSD).
    pub gyro_arw_rad_per_sqrt_s: f64,
}

impl ImuParams {
    /// Convert the datasheet units to SI.
    pub fn si(&self) -> ImuParamsSi {
        ImuParamsSi {
            accel_bias_m_s2: self.accel_bias_ug * UG_TO_M_S2,
            accel_vrw_m_s_per_sqrt_s: self.accel_vrw_m_s_per_sqrt_hr / SQRT_SECONDS_PER_HOUR,
            accel_scale_factor: self.accel_scale_factor_ppm * PPM,
            gyro_bias_rad_s: self.gyro_bias_deg_per_hr * DEG_PER_HR_TO_RAD_S,
            gyro_arw_rad_per_sqrt_s: self.gyro_arw_deg_per_sqrt_hr * (std::f64::consts::PI / 180.0)
                / SQRT_SECONDS_PER_HOUR,
        }
    }
}

// ---------------------------------------------------------------------------
// Contributions
// ---------------------------------------------------------------------------

/// Whether a contribution is a repeatable systematic error or a zero-mean random process.
/// The distinction is what the `det-sum-stoch-rss` combination acts on.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum ContributionClass {
    /// A systematic error whose sign is fixed within a run (bias, scale factor).
    Deterministic,
    /// A zero-mean random process; independent of the other stochastic terms.
    Stochastic,
}

impl ContributionClass {
    /// The result-document spelling.
    pub fn as_str(self) -> &'static str {
        match self {
            ContributionClass::Deterministic => "deterministic",
            ContributionClass::Stochastic => "stochastic",
        }
    }
}

/// One error contribution: an exact monomial `σ(t) = coefficient · t^exponent` (metres).
#[derive(Clone, Debug)]
pub struct Contribution {
    /// Stable machine name, e.g. `accel_bias`.
    pub name: &'static str,
    /// Systematic or random.
    pub class: ContributionClass,
    /// The power of the coast duration this contribution grows with.
    pub exponent: f64,
    /// The monomial coefficient, in m/s^exponent.
    pub coefficient: f64,
    /// The algebraic law, for a reader of the result document.
    pub law: &'static str,
}

impl Contribution {
    /// Position error (m) from this contribution alone after coasting `t` s.
    pub fn error_m(&self, t: f64) -> f64 {
        if t <= 0.0 {
            // t^0 is 1 even at t = 0: a constant contribution (the TRN fix residual) is
            // present the instant the coast starts, the growing ones are not.
            return if self.exponent == 0.0 {
                self.coefficient
            } else {
                0.0
            };
        }
        self.coefficient * t.powf(self.exponent)
    }

    /// The coast duration (s) at which this contribution ALONE reaches `threshold_m`,
    /// by exact algebraic inversion of its monomial. `None` when the coefficient is zero
    /// (it never reaches any positive threshold) or the exponent is zero (it is either
    /// already past the threshold or never reaches it — neither is a crossing time).
    pub fn closed_form_crossing_s(&self, threshold_m: f64) -> Option<f64> {
        if threshold_m <= 0.0 || self.coefficient <= 0.0 || self.exponent <= 0.0 {
            return None;
        }
        Some((threshold_m / self.coefficient).powf(1.0 / self.exponent))
    }
}

/// A single contribution wrapped as a drift curve, so the engine's own bisection
/// ([`PositionDrift::inertial_holdover_s`]) can locate its crossing on exactly the same
/// expression the closed form inverts. The two answers are reported together.
struct MonomialDrift {
    coefficient: f64,
    exponent: f64,
}

impl PositionDrift for MonomialDrift {
    fn drift_m(&self, t: f64) -> f64 {
        if t <= 0.0 {
            return 0.0;
        }
        self.coefficient * t.powf(self.exponent)
    }
}

// ---------------------------------------------------------------------------
// Combination rule
// ---------------------------------------------------------------------------

/// How the contributions are combined into one position error. A modelling choice, not a
/// derivation — which is why it is an input and is echoed in the result.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Combination {
    /// Root-sum-square of every contribution (reads each coefficient as a 1σ spec).
    Rss,
    /// Coherent worst case: every contribution at its worst sign simultaneously.
    LinearSum,
    /// Deterministic terms add; the independently driven random walks root-sum-square;
    /// the two groups then add.
    DetSumStochRss,
}

impl Combination {
    /// Every rule, in the order the sensitivity table reports them.
    pub fn all() -> &'static [Combination] {
        &[
            Combination::Rss,
            Combination::LinearSum,
            Combination::DetSumStochRss,
        ]
    }

    /// The scenario-facing name.
    pub fn as_str(self) -> &'static str {
        match self {
            Combination::Rss => "rss",
            Combination::LinearSum => "linear-sum",
            Combination::DetSumStochRss => "det-sum-stoch-rss",
        }
    }

    /// Resolve a scenario combination name; an unknown name is an error naming the set.
    pub fn parse(name: &str) -> Result<Combination, String> {
        match name {
            "rss" => Ok(Combination::Rss),
            "linear-sum" => Ok(Combination::LinearSum),
            "det-sum-stoch-rss" => Ok(Combination::DetSumStochRss),
            other => Err(format!(
                "unknown combination {other:?}; expected one of rss, linear-sum, \
                 det-sum-stoch-rss"
            )),
        }
    }

    /// Combine per-contribution magnitudes (m) into one total (m). `classes` is parallel
    /// to `parts`.
    pub fn combine(self, parts: &[f64], classes: &[ContributionClass]) -> f64 {
        match self {
            Combination::Rss => parts.iter().map(|p| p * p).sum::<f64>().sqrt(),
            Combination::LinearSum => parts.iter().sum(),
            Combination::DetSumStochRss => {
                let mut det = 0.0;
                let mut stoch2 = 0.0;
                for (p, c) in parts.iter().zip(classes.iter()) {
                    match c {
                        ContributionClass::Deterministic => det += *p,
                        ContributionClass::Stochastic => stoch2 += p * p,
                    }
                }
                det + stoch2.sqrt()
            }
        }
    }
}

// ---------------------------------------------------------------------------
// TRN fix semantics
// ---------------------------------------------------------------------------

/// What a terrain-referenced fix does to the coasting error state.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum TrnFixMode {
    /// No aiding: the free-inertial coast runs for the whole mission.
    None,
    /// The fix corrects POSITION only. Velocity error and tilt keep integrating across
    /// it, so each inter-fix excursion is larger than the last.
    PositionOnly,
    /// The fix re-zeroes the whole error state, as [`crate::inertial::AccelModel::reset`]
    /// does for a GNSS re-alignment. Every inter-fix excursion is identical.
    FullReset,
}

impl TrnFixMode {
    /// The scenario-facing name.
    pub fn as_str(self) -> &'static str {
        match self {
            TrnFixMode::None => "none",
            TrnFixMode::PositionOnly => "position-only",
            TrnFixMode::FullReset => "full-reset",
        }
    }

    /// Resolve a scenario fix-mode name; an unknown name is an error naming the set.
    pub fn parse(name: &str) -> Result<TrnFixMode, String> {
        match name {
            "none" => Ok(TrnFixMode::None),
            "position-only" => Ok(TrnFixMode::PositionOnly),
            "full-reset" => Ok(TrnFixMode::FullReset),
            other => Err(format!(
                "unknown trn_fix_mode {other:?}; expected one of none, position-only, \
                 full-reset"
            )),
        }
    }
}

// ---------------------------------------------------------------------------
// The model
// ---------------------------------------------------------------------------

/// The coasting error model: a resolved IMU, a motion profile, and a combination rule.
#[derive(Clone, Debug)]
pub struct CoastModel {
    /// IMU coefficients in SI.
    pub imu: ImuParamsSi,
    /// Cruise ground speed (m/s). Sets the travelled distance the scale factor mis-scales.
    pub speed_m_s: f64,
    /// Sustained specific force (m/s²) over the coast, adding `½at²` to the distance.
    pub ref_accel_m_s2: f64,
    /// How the contributions are combined.
    pub combination: Combination,
    /// A constant position error present from the first sample (m) — the TRN matcher
    /// residual when a fix mode is active, zero otherwise.
    pub fix_residual_m: f64,
    /// The resolved contributions, in report order.
    contributions: Vec<Contribution>,
}

impl CoastModel {
    /// Build the model from an IMU coefficient set, a motion profile and a combination.
    pub fn new(
        imu: ImuParamsSi,
        speed_m_s: f64,
        ref_accel_m_s2: f64,
        combination: Combination,
        fix_residual_m: f64,
    ) -> Self {
        let mut contributions = vec![
            Contribution {
                name: "accel_bias",
                class: ContributionClass::Deterministic,
                exponent: 2.0,
                coefficient: 0.5 * imu.accel_bias_m_s2,
                law: "0.5 * b_a * t^2",
            },
            Contribution {
                name: "gyro_bias_tilt",
                class: ContributionClass::Deterministic,
                exponent: 3.0,
                coefficient: G_M_PER_S2 * imu.gyro_bias_rad_s / 6.0,
                law: "g * b_g * t^3 / 6",
            },
            Contribution {
                name: "scale_factor_cruise",
                class: ContributionClass::Deterministic,
                exponent: 1.0,
                coefficient: imu.accel_scale_factor * speed_m_s,
                law: "s * v * t",
            },
            Contribution {
                name: "scale_factor_accel",
                class: ContributionClass::Deterministic,
                exponent: 2.0,
                coefficient: 0.5 * imu.accel_scale_factor * ref_accel_m_s2,
                law: "0.5 * s * a * t^2",
            },
            Contribution {
                name: "velocity_random_walk",
                class: ContributionClass::Stochastic,
                exponent: 1.5,
                coefficient: imu.accel_vrw_m_s_per_sqrt_s / 3.0f64.sqrt(),
                law: "sigma_vrw * t^1.5 / sqrt(3)",
            },
            Contribution {
                name: "angle_random_walk",
                class: ContributionClass::Stochastic,
                exponent: 2.5,
                coefficient: G_M_PER_S2 * imu.gyro_arw_rad_per_sqrt_s / 20.0f64.sqrt(),
                law: "g * sigma_arw * t^2.5 / sqrt(20)",
            },
        ];
        if fix_residual_m > 0.0 {
            contributions.push(Contribution {
                name: "trn_fix_residual",
                class: ContributionClass::Stochastic,
                exponent: 0.0,
                coefficient: fix_residual_m,
                law: "r (constant)",
            });
        }
        Self {
            imu,
            speed_m_s,
            ref_accel_m_s2,
            combination,
            fix_residual_m,
            contributions,
        }
    }

    /// The resolved contributions, in report order.
    pub fn contributions(&self) -> &[Contribution] {
        &self.contributions
    }

    /// Per-contribution position error (m) after coasting `t` s, in report order.
    pub fn breakdown_m(&self, t: f64) -> Vec<f64> {
        self.contributions.iter().map(|c| c.error_m(t)).collect()
    }

    /// The contribution classes, parallel to [`Self::breakdown_m`].
    fn classes(&self) -> Vec<ContributionClass> {
        self.contributions.iter().map(|c| c.class).collect()
    }

    /// The travelled distance (m) after `t` s of the configured motion profile.
    pub fn travelled_distance_m(&self, t: f64) -> f64 {
        self.speed_m_s * t + 0.5 * self.ref_accel_m_s2 * t * t
    }

    /// The name and magnitude of the largest single contribution at `t`. `None` when
    /// every contribution is zero (there is no dominant source of an absent error).
    pub fn dominant_at(&self, t: f64) -> Option<(&'static str, f64)> {
        let mut best: Option<(&'static str, f64)> = None;
        for c in &self.contributions {
            let e = c.error_m(t);
            if e > 0.0 && best.map_or(true, |(_, b)| e > b) {
                best = Some((c.name, e));
            }
        }
        best
    }
}

impl PositionDrift for CoastModel {
    fn drift_m(&self, t: f64) -> f64 {
        let parts = self.breakdown_m(t);
        self.combination.combine(&parts, &self.classes())
    }
}

// ---------------------------------------------------------------------------
// Crossing search
// ---------------------------------------------------------------------------

/// A located threshold crossing, or a stated reason there is none.
#[derive(Clone, Debug)]
pub struct Crossing {
    /// The position-error threshold searched for (m).
    pub threshold_m: f64,
    /// The coast duration at which the modelled error first reaches it (s), or `None`.
    pub coast_s: Option<f64>,
    /// Why `coast_s` is absent, or `"reached"` when it is present. Never a silent zero.
    pub status: &'static str,
}

/// Locate the coast duration at which `model` first reaches `threshold_m`, using the
/// engine's existing bisection over a doubling bracket. Non-finite answers (a model that
/// never reaches the threshold within the bracket) become an explicit status, never a
/// number a reader could mistake for a crossing.
pub fn locate_crossing<D: PositionDrift>(model: &D, threshold_m: f64) -> Crossing {
    if threshold_m.is_nan() || threshold_m <= 0.0 {
        return Crossing {
            threshold_m,
            coast_s: None,
            status: "threshold-not-positive",
        };
    }
    // A constant contribution (the TRN fix residual) can already exceed the threshold at
    // t = 0. The bisection would then converge on a denormal that reads like a duration;
    // say what actually happened instead.
    if model.drift_m(0.0) >= threshold_m {
        return Crossing {
            threshold_m,
            coast_s: Some(0.0),
            status: "already-exceeded-at-zero",
        };
    }
    let t = model.inertial_holdover_s(threshold_m);
    if t.is_finite() && t > 0.0 {
        Crossing {
            threshold_m,
            coast_s: Some(t),
            status: "reached",
        }
    } else if t == 0.0 {
        Crossing {
            threshold_m,
            coast_s: Some(0.0),
            status: "already-exceeded-at-zero",
        }
    } else {
        Crossing {
            threshold_m,
            coast_s: None,
            status: "never-reached",
        }
    }
}

/// Bisect a monotone-increasing scalar function for the argument at which it reaches
/// `target`, over the stated bracket. Returns `None` unless the bracket actually brackets
/// the crossing — a bisection outside its bracket returns an endpoint that looks like an
/// answer, and this refuses to produce one.
fn bisect_in_bracket<F: Fn(f64) -> f64>(f: F, target: f64, lo: f64, hi: f64) -> Option<f64> {
    if lo.is_nan() || hi.is_nan() || lo >= hi || !target.is_finite() {
        return None;
    }
    let (flo, fhi) = (f(lo), f(hi));
    if !flo.is_finite() || !fhi.is_finite() || flo > target || fhi < target {
        return None;
    }
    let (mut a, mut b) = (lo, hi);
    for _ in 0..80 {
        let mid = 0.5 * (a + b);
        if f(mid) < target {
            a = mid;
        } else {
            b = mid;
        }
    }
    Some(0.5 * (a + b))
}

// ---------------------------------------------------------------------------
// TRN-bounded coast
// ---------------------------------------------------------------------------

/// The peak position error (m) over a mission flown with TRN fixes every
/// `fix_interval_s`, together with how many complete inter-fix intervals were evaluated.
///
/// The peak is found by evaluating EVERY inter-fix interval's end-of-interval error and
/// taking the maximum, not by assuming the last interval is the worst. `interval_errors`
/// is that sequence, so a caller (and the test suite) can check the assumption instead of
/// inheriting it.
#[derive(Clone, Debug)]
pub struct TrnCoast {
    /// Fix interval used (s).
    pub fix_interval_s: f64,
    /// Number of complete inter-fix intervals inside the mission.
    pub intervals: usize,
    /// End-of-interval total error for each interval (m).
    pub interval_errors_m: Vec<f64>,
    /// The largest of them (m); the free-inertial mission error when the mode is `none`.
    pub peak_error_m: f64,
}

/// The largest number of inter-fix intervals the peak scan will evaluate. It also fixes
/// the lower end of the `max_fix_interval` bisection bracket (`mission / this`), so the
/// search can never ask for an unbounded scan.
pub const MAX_TRN_INTERVALS: usize = 4096;

impl CoastModel {
    /// Error (m) accumulated during ONE inter-fix interval of length `tau`, when the
    /// interval starts at mission time `t0` and the preceding fix corrected position only.
    ///
    /// Deterministic contributions keep their velocity error across the fix, so their
    /// position increment is `c[(t0+τ)^p − t0^p]`. The random walks keep the variance they
    /// had at the fix, which re-enters as the (independent) `σ_v(t0)·τ` and
    /// `g·σ_θ(t0)·τ²/2` terms alongside the freshly accumulated `τ³/3` and `τ⁵/20` ones.
    fn position_only_interval_parts(&self, t0: f64, tau: f64) -> Vec<f64> {
        self.contributions
            .iter()
            .map(|c| match c.name {
                "velocity_random_walk" => {
                    // sigma_vrw * sqrt(t0*tau^2 + tau^3/3); the sqrt(3) is inside.
                    let s = self.imu.accel_vrw_m_s_per_sqrt_s;
                    s * (t0 * tau * tau + tau * tau * tau / 3.0).max(0.0).sqrt()
                }
                "angle_random_walk" => {
                    // g * sigma_arw * sqrt(t0*tau^4/4 + tau^5/20).
                    let s = self.imu.gyro_arw_rad_per_sqrt_s;
                    G_M_PER_S2
                        * s
                        * (t0 * tau.powi(4) / 4.0 + tau.powi(5) / 20.0)
                            .max(0.0)
                            .sqrt()
                }
                "trn_fix_residual" => c.coefficient,
                _ => {
                    if c.exponent == 0.0 {
                        c.coefficient
                    } else {
                        c.coefficient * ((t0 + tau).powf(c.exponent) - t0.powf(c.exponent))
                    }
                }
            })
            .collect()
    }

    /// Run the TRN-bounded coast over `mission_s` with fixes every `fix_interval_s`.
    ///
    /// `TrnFixMode::None` ignores the interval and returns the single free-inertial
    /// mission error. The other two scan every complete interval; a mission that would
    /// need more than [`MAX_TRN_INTERVALS`] of them is evaluated over the first
    /// [`MAX_TRN_INTERVALS`] and says so through the `intervals` count.
    pub fn trn_coast(&self, mode: TrnFixMode, fix_interval_s: f64, mission_s: f64) -> TrnCoast {
        if mode == TrnFixMode::None || fix_interval_s <= 0.0 || mission_s <= 0.0 {
            let e = self.drift_m(mission_s.max(0.0));
            return TrnCoast {
                fix_interval_s,
                intervals: 0,
                interval_errors_m: vec![e],
                peak_error_m: e,
            };
        }
        let classes = self.classes();
        let n = ((mission_s / fix_interval_s).floor() as usize).clamp(1, MAX_TRN_INTERVALS);
        let mut errs = Vec::with_capacity(n);
        for k in 0..n {
            let t0 = k as f64 * fix_interval_s;
            let parts = match mode {
                TrnFixMode::FullReset => self.breakdown_m(fix_interval_s),
                TrnFixMode::PositionOnly => self.position_only_interval_parts(t0, fix_interval_s),
                TrnFixMode::None => unreachable!("the none mode returned above"),
            };
            errs.push(self.combination.combine(&parts, &classes));
        }
        let peak = errs.iter().copied().fold(0.0f64, f64::max);
        TrnCoast {
            fix_interval_s,
            intervals: n,
            interval_errors_m: errs,
            peak_error_m: peak,
        }
    }

    /// The largest TRN fix interval (s) whose mission peak error stays at or below
    /// `threshold_m`, by bisection over `[mission/MAX_TRN_INTERVALS, mission]`.
    ///
    /// Returns the interval and the status. `"holds-at-every-interval"` means even fixing
    /// once at the mission end holds the threshold; `"never-holds"` means the tightest
    /// interval in the bracket already breaches it (the fix residual alone can do that).
    pub fn max_fix_interval_s(
        &self,
        mode: TrnFixMode,
        mission_s: f64,
        threshold_m: f64,
    ) -> (Option<f64>, &'static str) {
        if mode == TrnFixMode::None || mission_s <= 0.0 || threshold_m <= 0.0 {
            return (None, "not-applicable");
        }
        let lo = mission_s / MAX_TRN_INTERVALS as f64;
        let peak = |tau: f64| self.trn_coast(mode, tau, mission_s).peak_error_m;
        if peak(mission_s) <= threshold_m {
            return (Some(mission_s), "holds-at-every-interval");
        }
        if peak(lo) > threshold_m {
            return (None, "never-holds");
        }
        match bisect_in_bracket(peak, threshold_m, lo, mission_s) {
            Some(t) => (Some(t), "bisected"),
            None => (None, "not-bracketed"),
        }
    }
}

// ---------------------------------------------------------------------------
// Scenario
// ---------------------------------------------------------------------------

/// Default position-error thresholds the crossings are reported at (m).
pub const DEFAULT_CROSSING_THRESHOLDS_M: [f64; 2] = [10.0, 50.0];

/// Default cruise ground speed (m/s) — a representative airborne platform, and the speed
/// the scale-factor contribution mis-scales. Zero it for a static or hovering platform.
pub const DEFAULT_SPEED_M_S: f64 = 250.0;

/// Default TRN matcher residual (m). This is the matching σ of the shipped
/// `scenarios/terrain-nav.toml` configuration — `hypot(altimeter 8 m, DEM 15 m)` — i.e.
/// the measurement noise floor a terrain fix is taken against. It is NOT the achieved
/// batch-matcher residual on that scenario's 60-waypoint track, which is larger; a caller
/// who wants that should run `terrain-nav` and pass its `matched_error_m` here.
pub const DEFAULT_TRN_FIX_RESIDUAL_M: f64 = 17.0;

/// Default TRN fix interval (s).
pub const DEFAULT_TRN_FIX_INTERVAL_S: f64 = 300.0;

/// Default mission duration for the TRN-bounded coast (s).
pub const DEFAULT_MISSION_DURATION_S: f64 = 3600.0;

/// Default lower edge of the drift-rate band a duty-cycle study sweeps (m/s).
pub const DEFAULT_DRIFT_BAND_LO_M_PER_S: f64 = 0.001;

/// Default upper edge of that band (m/s).
pub const DEFAULT_DRIFT_BAND_HI_M_PER_S: f64 = 0.050;

/// The `ins-trn-coast` scenario. Every field is optional: with no fields at all the model
/// runs a navigation-grade IMU cruising at 250 m/s, root-sum-square combination, free
/// inertial (no TRN aiding), and reports the 10 m and 50 m crossings.
#[derive(Clone, Debug, Default, Deserialize)]
pub struct InsTrnCoastScenario {
    /// IMU class driving the headline coast: `navigation` (default), `tactical`,
    /// `industrial`, `consumer`.
    pub imu_grade: Option<String>,
    /// Override: residual accelerometer bias, 1σ (µg).
    pub accel_bias_ug: Option<f64>,
    /// Override: accelerometer velocity random walk (m/s per √hour).
    pub accel_vrw_m_s_per_sqrt_hr: Option<f64>,
    /// Override: accelerometer scale-factor error, 1σ (ppm).
    pub accel_scale_factor_ppm: Option<f64>,
    /// Override: residual gyro bias, 1σ (deg/hour).
    pub gyro_bias_deg_per_hr: Option<f64>,
    /// Override: gyro angle random walk (deg per √hour).
    pub gyro_arw_deg_per_sqrt_hr: Option<f64>,
    /// Cruise ground speed (m/s). Default [`DEFAULT_SPEED_M_S`].
    pub speed_m_s: Option<f64>,
    /// Sustained specific force over the coast (m/s²). Default 0.
    pub ref_accel_m_s2: Option<f64>,
    /// Combination rule: `rss` (default), `linear-sum`, `det-sum-stoch-rss`.
    pub combination: Option<String>,
    /// Position-error thresholds the crossings are reported at (m). Default
    /// [`DEFAULT_CROSSING_THRESHOLDS_M`] — the 10 m and 50 m the acceptance names.
    pub crossing_thresholds_m: Option<Vec<f64>>,
    /// IMU classes in the comparison table. Default: all four, finest first.
    pub grades: Option<Vec<String>>,
    /// Lower edge of the swept drift-rate band to check against (m/s).
    pub drift_band_lo_m_per_s: Option<f64>,
    /// Upper edge of that band (m/s).
    pub drift_band_hi_m_per_s: Option<f64>,
    /// TRN fix semantics: `none` (default), `position-only`, `full-reset`.
    pub trn_fix_mode: Option<String>,
    /// TRN fix interval (s). Default [`DEFAULT_TRN_FIX_INTERVAL_S`].
    pub trn_fix_interval_s: Option<f64>,
    /// TRN matcher residual at each fix (m). Default [`DEFAULT_TRN_FIX_RESIDUAL_M`].
    pub trn_fix_residual_m: Option<f64>,
    /// Mission duration the TRN-bounded coast is evaluated over (s). Default
    /// [`DEFAULT_MISSION_DURATION_S`].
    pub mission_duration_s: Option<f64>,
}

impl InsTrnCoastScenario {
    /// Resolve the IMU coefficient set: a grade, then any per-coefficient override.
    fn resolve_imu(&self) -> Result<ImuParams, String> {
        let grade = ImuGrade::parse(self.imu_grade.as_deref().unwrap_or("navigation"))?;
        let mut p = grade.params();
        let overridden = self.accel_bias_ug.is_some()
            || self.accel_vrw_m_s_per_sqrt_hr.is_some()
            || self.accel_scale_factor_ppm.is_some()
            || self.gyro_bias_deg_per_hr.is_some()
            || self.gyro_arw_deg_per_sqrt_hr.is_some();
        if let Some(v) = self.accel_bias_ug {
            p.accel_bias_ug = v;
        }
        if let Some(v) = self.accel_vrw_m_s_per_sqrt_hr {
            p.accel_vrw_m_s_per_sqrt_hr = v;
        }
        if let Some(v) = self.accel_scale_factor_ppm {
            p.accel_scale_factor_ppm = v;
        }
        if let Some(v) = self.gyro_bias_deg_per_hr {
            p.gyro_bias_deg_per_hr = v;
        }
        if let Some(v) = self.gyro_arw_deg_per_sqrt_hr {
            p.gyro_arw_deg_per_sqrt_hr = v;
        }
        if overridden {
            p.grade = "custom";
        }
        for (name, v) in [
            ("accel_bias_ug", p.accel_bias_ug),
            ("accel_vrw_m_s_per_sqrt_hr", p.accel_vrw_m_s_per_sqrt_hr),
            ("accel_scale_factor_ppm", p.accel_scale_factor_ppm),
            ("gyro_bias_deg_per_hr", p.gyro_bias_deg_per_hr),
            ("gyro_arw_deg_per_sqrt_hr", p.gyro_arw_deg_per_sqrt_hr),
        ] {
            if !v.is_finite() || v < 0.0 {
                return Err(format!("{name} must be finite and non-negative (got {v})"));
            }
        }
        Ok(p)
    }

    /// Resolve the crossing thresholds; every one must be finite and positive.
    fn resolve_thresholds(&self) -> Result<Vec<f64>, String> {
        let ts = match &self.crossing_thresholds_m {
            None => DEFAULT_CROSSING_THRESHOLDS_M.to_vec(),
            Some(v) if v.is_empty() => {
                return Err("crossing_thresholds_m must name at least one threshold".into())
            }
            Some(v) => v.clone(),
        };
        for t in &ts {
            if !t.is_finite() || *t <= 0.0 {
                return Err(format!(
                    "crossing_thresholds_m entries must be finite and positive (got {t})"
                ));
            }
        }
        Ok(ts)
    }

    /// Resolve the comparison-table grades.
    fn resolve_grades(&self) -> Result<Vec<ImuGrade>, String> {
        match &self.grades {
            None => Ok(ImuGrade::all().to_vec()),
            Some(v) if v.is_empty() => Err("grades must name at least one IMU class".into()),
            Some(v) => v.iter().map(|g| ImuGrade::parse(g)).collect(),
        }
    }

    /// Resolve the motion profile, validating it is finite.
    fn resolve_motion(&self) -> Result<(f64, f64), String> {
        let v = self.speed_m_s.unwrap_or(DEFAULT_SPEED_M_S);
        let a = self.ref_accel_m_s2.unwrap_or(0.0);
        if !v.is_finite() || v < 0.0 {
            return Err(format!(
                "speed_m_s must be finite and non-negative (got {v})"
            ));
        }
        if !a.is_finite() || a < 0.0 {
            return Err(format!(
                "ref_accel_m_s2 must be finite and non-negative (got {a})"
            ));
        }
        Ok((v, a))
    }

    /// Resolve the TRN configuration.
    fn resolve_trn(&self) -> Result<(TrnFixMode, f64, f64, f64), String> {
        let mode = TrnFixMode::parse(self.trn_fix_mode.as_deref().unwrap_or("none"))?;
        let interval = self
            .trn_fix_interval_s
            .unwrap_or(DEFAULT_TRN_FIX_INTERVAL_S);
        let residual = self
            .trn_fix_residual_m
            .unwrap_or(DEFAULT_TRN_FIX_RESIDUAL_M);
        let mission = self
            .mission_duration_s
            .unwrap_or(DEFAULT_MISSION_DURATION_S);
        for (name, v) in [
            ("trn_fix_interval_s", interval),
            ("trn_fix_residual_m", residual),
            ("mission_duration_s", mission),
        ] {
            if !v.is_finite() || v < 0.0 {
                return Err(format!("{name} must be finite and non-negative (got {v})"));
            }
        }
        if mission <= 0.0 {
            return Err("mission_duration_s must be positive".into());
        }
        Ok((mode, interval, residual, mission))
    }

    /// Resolve the drift-rate band the study sweeps.
    fn resolve_band(&self) -> Result<(f64, f64), String> {
        let lo = self
            .drift_band_lo_m_per_s
            .unwrap_or(DEFAULT_DRIFT_BAND_LO_M_PER_S);
        let hi = self
            .drift_band_hi_m_per_s
            .unwrap_or(DEFAULT_DRIFT_BAND_HI_M_PER_S);
        if !lo.is_finite() || !hi.is_finite() || lo <= 0.0 || hi <= lo {
            return Err(format!(
                "drift band must satisfy 0 < lo < hi (got lo={lo}, hi={hi})"
            ));
        }
        Ok((lo, hi))
    }

    /// The headline model: the resolved grade, motion and combination, coasting FREE
    /// INERTIAL. It carries no fix residual — the reported 10 m / 50 m crossings are
    /// durations of an unaided coast, which is the quantity a duty-cycle study needs;
    /// folding an aiding residual into them would answer a different question.
    pub fn model(&self) -> Result<CoastModel, String> {
        let imu = self.resolve_imu()?.si();
        let (v, a) = self.resolve_motion()?;
        let comb = Combination::parse(self.combination.as_deref().unwrap_or("rss"))?;
        Ok(CoastModel::new(imu, v, a, comb, 0.0))
    }

    /// The same model with the TRN matcher residual attached, used only for the
    /// TRN-bounded block. With `trn_fix_mode = "none"` it is [`Self::model`] exactly.
    pub fn trn_model(&self) -> Result<CoastModel, String> {
        let imu = self.resolve_imu()?.si();
        let (v, a) = self.resolve_motion()?;
        let comb = Combination::parse(self.combination.as_deref().unwrap_or("rss"))?;
        let (mode, _, residual, _) = self.resolve_trn()?;
        let r = if mode == TrnFixMode::None {
            0.0
        } else {
            residual
        };
        Ok(CoastModel::new(imu, v, a, comb, r))
    }

    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let doc = self.compute()?;
        let summary = doc.summary.clone();
        let json = serde_json::to_string_pretty(&doc.json)
            .map_err(|e| format!("serializing ins-trn-coast result: {e}"))?;
        Ok((json, summary))
    }

    fn compute(&self) -> Result<Computed, String> {
        let params = self.resolve_imu()?;
        let si = params.si();
        let (speed, ref_accel) = self.resolve_motion()?;
        let comb = Combination::parse(self.combination.as_deref().unwrap_or("rss"))?;
        let thresholds = self.resolve_thresholds()?;
        let grades = self.resolve_grades()?;
        let (band_lo, band_hi) = self.resolve_band()?;
        let (mode, fix_interval, fix_residual, mission) = self.resolve_trn()?;
        let model = self.model()?;
        let trn_model = self.trn_model()?;

        // --- Headline crossings, by bisection on the combined model. ---
        let mut crossings = Vec::new();
        for &th in &thresholds {
            let c = locate_crossing(&model, th);
            let (err_at, dist, rate, dominant, dom_err, breakdown) = match c.coast_s {
                Some(t) => {
                    let parts = model.breakdown_m(t);
                    let lin: f64 = parts.iter().sum();
                    let rows: Vec<serde_json::Value> = model
                        .contributions()
                        .iter()
                        .zip(parts.iter())
                        .map(|(c, e)| {
                            serde_json::json!({
                                "name": c.name,
                                "class": c.class.as_str(),
                                "exponent": c.exponent,
                                "error_m": e,
                                "fraction_of_linear_sum": if lin > 0.0 { e / lin } else { 0.0 },
                            })
                        })
                        .collect();
                    let (dn, de) = model.dominant_at(t).unwrap_or(("none", 0.0));
                    (
                        Some(model.drift_m(t)),
                        Some(model.travelled_distance_m(t)),
                        Some(th / t),
                        dn,
                        Some(de),
                        rows,
                    )
                }
                None => (None, None, None, "none", None, Vec::new()),
            };
            crossings.push(serde_json::json!({
                "threshold_m": th,
                "coast_s": c.coast_s,
                "status": c.status,
                "method": "bisection on the combined model",
                "error_at_coast_m": err_at,
                "travelled_distance_m": dist,
                "implied_mean_drift_rate_m_per_s": rate,
                "in_swept_drift_band": rate.map(|r| r >= band_lo && r <= band_hi),
                "dominant_contribution": dominant,
                "dominant_contribution_error_m": dom_err,
                "breakdown": breakdown,
            }));
        }

        // --- Per-contribution crossings: exact closed form vs the same bisection. ---
        let mut contribution_rows = Vec::new();
        for c in model.contributions() {
            let rows: Vec<serde_json::Value> = thresholds
                .iter()
                .map(|&th| {
                    let closed = c.closed_form_crossing_s(th);
                    let bis = if c.coefficient > 0.0 && c.exponent > 0.0 {
                        locate_crossing(
                            &MonomialDrift {
                                coefficient: c.coefficient,
                                exponent: c.exponent,
                            },
                            th,
                        )
                        .coast_s
                    } else {
                        None
                    };
                    let rel = match (closed, bis) {
                        (Some(a), Some(b)) => {
                            let d = a.abs().max(b.abs());
                            if d > 0.0 {
                                Some((a - b).abs() / d)
                            } else {
                                Some(0.0)
                            }
                        }
                        _ => None,
                    };
                    serde_json::json!({
                        "threshold_m": th,
                        "closed_form_s": closed,
                        "bisection_s": bis,
                        "rel_diff": rel,
                        "status": if closed.is_some() { "both" } else { "no-crossing-for-this-contribution" },
                    })
                })
                .collect();
            contribution_rows.push(serde_json::json!({
                "name": c.name,
                "class": c.class.as_str(),
                "exponent": c.exponent,
                "coefficient_si": c.coefficient,
                "law": c.law,
                "crossings": rows,
            }));
        }

        // --- Sensitivity of the headline to the combination choice. ---
        let sensitivity: Vec<serde_json::Value> = Combination::all()
            .iter()
            .map(|&k| {
                let m = CoastModel::new(si, speed, ref_accel, k, 0.0);
                let rows: Vec<serde_json::Value> = thresholds
                    .iter()
                    .map(|&th| {
                        let c = locate_crossing(&m, th);
                        serde_json::json!({
                            "threshold_m": th,
                            "coast_s": c.coast_s,
                            "status": c.status,
                        })
                    })
                    .collect();
                serde_json::json!({ "combination": k.as_str(), "crossings": rows })
            })
            .collect();

        // --- The grade table, and the swept-band reproduction question. ---
        let mut grade_rows = Vec::new();
        let mut band_rows = Vec::new();
        for g in &grades {
            let gm = CoastModel::new(g.params().si(), speed, ref_accel, comb, 0.0);
            let rows: Vec<serde_json::Value> = thresholds
                .iter()
                .map(|&th| {
                    let c = locate_crossing(&gm, th);
                    let (dom, rate) = match c.coast_s {
                        Some(t) => (
                            gm.dominant_at(t).map(|(n, _)| n).unwrap_or("none"),
                            Some(th / t),
                        ),
                        None => ("none", None),
                    };
                    serde_json::json!({
                        "threshold_m": th,
                        "coast_s": c.coast_s,
                        "status": c.status,
                        "dominant_contribution": dom,
                        "implied_mean_drift_rate_m_per_s": rate,
                        "in_swept_drift_band": rate.map(|r| r >= band_lo && r <= band_hi),
                    })
                })
                .collect();
            grade_rows.push(serde_json::json!({
                "grade": g.as_str(),
                "accel_bias_ug": g.params().accel_bias_ug,
                "gyro_bias_deg_per_hr": g.params().gyro_bias_deg_per_hr,
                "crossings": rows,
            }));

            // The mean drift rate error(t)/t, bisected for the two band edges over a
            // bracket the model actually spans. A flat rate (only the p=1 scale-factor
            // term active) is not bracketed and says so rather than returning an endpoint.
            let rate_of = |t: f64| if t > 0.0 { gm.drift_m(t) / t } else { 0.0 };
            let (lo_b, hi_b) = (1.0e-3, 1.0e6);
            let entry = bisect_in_bracket(rate_of, band_lo, lo_b, hi_b);
            let exit = bisect_in_bracket(rate_of, band_hi, lo_b, hi_b);
            band_rows.push(serde_json::json!({
                "grade": g.as_str(),
                "band_entry_s": entry,
                "band_exit_s": exit,
                "rate_at_bracket_lo_m_per_s": rate_of(lo_b),
                "rate_at_bracket_hi_m_per_s": rate_of(hi_b),
                "status": band_status(rate_of(lo_b), rate_of(hi_b), band_lo, band_hi, entry, exit),
            }));
        }

        // --- TRN-bounded coast. ---
        let trn = trn_model.trn_coast(mode, fix_interval, mission);
        let trn_thresholds: Vec<serde_json::Value> = thresholds
            .iter()
            .map(|&th| {
                let (iv, st) = trn_model.max_fix_interval_s(mode, mission, th);
                serde_json::json!({
                    "threshold_m": th,
                    "peak_within_threshold": trn.peak_error_m <= th,
                    "max_fix_interval_s": iv,
                    "max_fix_interval_status": st,
                })
            })
            .collect();
        let monotone = trn
            .interval_errors_m
            .windows(2)
            .all(|w| w[1] >= w[0] - 1.0e-12);

        let summary = {
            let show = |i: usize| -> String {
                crossings
                    .get(i)
                    .and_then(|c| c["coast_s"].as_f64())
                    .map(|t| format!("{t:.1} s"))
                    .unwrap_or_else(|| "not reached".into())
            };
            let dom = |i: usize| -> String {
                crossings
                    .get(i)
                    .and_then(|c| c["dominant_contribution"].as_str())
                    .unwrap_or("none")
                    .to_string()
            };
            let heads: Vec<String> = (0..thresholds.len().min(2))
                .map(|i| format!("{:.0} m at {} ({})", thresholds[i], show(i), dom(i)))
                .collect();
            format!(
                "ins-trn-coast | {} IMU, {:.0} m/s, combination {} | {} | TRN {} peak {:.1} m over {:.0} s",
                params.grade,
                speed,
                comb.as_str(),
                heads.join(" | "),
                mode.as_str(),
                trn.peak_error_m,
                mission,
            )
        };

        let json = serde_json::json!({
            "kind": "ins-trn-coast",
            "label": LABEL,
            "combination": comb.as_str(),
            "combination_note": "A modelling choice, not a derivation: rss reads every \
        coefficient as a 1-sigma spec, linear-sum is the coherent worst case, det-sum-stoch-rss \
        adds the systematic terms and root-sum-squares the independently driven random walks. \
        combination_sensitivity below reports the headline crossings under all three.",
            "units": units_block(),
            "imu": {
                "grade": params.grade,
                "provenance": "representative CLASS coefficients (Groves 2013 Table 4.1 \
        bands), not a datasheet for a specific part",
                "accel_bias_ug": params.accel_bias_ug,
                "accel_bias_m_s2": si.accel_bias_m_s2,
                "accel_vrw_m_s_per_sqrt_hr": params.accel_vrw_m_s_per_sqrt_hr,
                "accel_vrw_m_s_per_sqrt_s": si.accel_vrw_m_s_per_sqrt_s,
                "accel_scale_factor_ppm": params.accel_scale_factor_ppm,
                "gyro_bias_deg_per_hr": params.gyro_bias_deg_per_hr,
                "gyro_bias_rad_s": si.gyro_bias_rad_s,
                "gyro_arw_deg_per_sqrt_hr": params.gyro_arw_deg_per_sqrt_hr,
                "gyro_arw_rad_per_sqrt_s": si.gyro_arw_rad_per_sqrt_s,
            },
            "motion": {
                "speed_m_s": speed,
                "ref_accel_m_s2": ref_accel,
                "note": "the travelled distance the scale-factor error mis-scales is \
        v*t + 0.5*a*t^2; a static platform (v = a = 0) has no scale-factor contribution",
            },
            "contributions": model.contributions().iter().map(|c| serde_json::json!({
                "name": c.name,
                "class": c.class.as_str(),
                "exponent": c.exponent,
                "coefficient_si": c.coefficient,
                "law": c.law,
            })).collect::<Vec<_>>(),
            "crossings": crossings,
            "contribution_crossings": contribution_rows,
            "combination_sensitivity": sensitivity,
            "grade_table": grade_rows,
            "swept_drift_band": {
                "lo_m_per_s": band_lo,
                "hi_m_per_s": band_hi,
                "rate_definition": "mean drift rate = modelled position error / coast duration",
                "rows": band_rows,
            },
            "trn": {
                "fix_mode": mode.as_str(),
                "fix_interval_s": fix_interval,
                "fix_residual_m": if mode == TrnFixMode::None { 0.0 } else { fix_residual },
                "fix_residual_provenance": "input; the default is the matching sigma of the \
        shipped terrain-nav configuration, hypot(altimeter 8 m, DEM 15 m), not an achieved \
        batch-matcher residual",
                "mission_duration_s": mission,
                "intervals_evaluated": trn.intervals,
                "peak_error_m": trn.peak_error_m,
                "peak_is_at_the_last_interval": monotone,
                "interval_errors_m": trn.interval_errors_m,
                "max_interval_scan": MAX_TRN_INTERVALS,
                "thresholds": trn_thresholds,
                "bounds_the_coast": "a terrain fix supplies a POSITION correction with a \
        residual; position-only leaves velocity error and tilt integrating across the fix, \
        full-reset re-zeroes the whole error state as AccelModel::reset does",
                "scope": "this block, and only this block, carries the fix residual. The \
        headline crossings above are the FREE-INERTIAL coast durations, so an aiding residual \
        cannot silently shorten them.",
            },
        });

        Ok(Computed { json, summary })
    }
}

/// Name what the mean-drift-rate curve did relative to the swept band over the search
/// bracket. An unlocated edge has several distinct causes and they are not the same
/// finding: "the rate is already past this edge when the coast starts" is a result, while
/// "the bracket does not reach it" is a search limit.
fn band_status(
    rate_lo: f64,
    rate_hi: f64,
    band_lo: f64,
    band_hi: f64,
    entry: Option<f64>,
    exit: Option<f64>,
) -> &'static str {
    match (entry, exit) {
        (Some(_), Some(_)) => "band-spanned",
        (Some(_), None) => "enters-the-band-but-the-bracket-never-reaches-the-upper-edge",
        (None, Some(_)) => "already-above-the-lower-edge-when-the-coast-starts",
        (None, None) if rate_lo > band_hi => "already-above-the-upper-edge-when-the-coast-starts",
        (None, None) if rate_hi < band_lo => "never-reaches-the-lower-edge-within-the-bracket",
        (None, None) => "band-not-bracketed-over-1e-3-to-1e6-s",
    }
}

/// The assembled result document and its one-line summary.
struct Computed {
    json: serde_json::Value,
    summary: String,
}

/// Unit and provenance class for every numeric field this scenario publishes: `(field,
/// unit, provenance class, optional note)`. A quantity whose unit a reader has to infer
/// is an interface defect, so this table is the contract and [`units_block`] only renders
/// it.
const UNITS: &[(&str, &str, &str, Option<&str>)] = &[
    ("imu.accel_bias_ug", "ug", "input", Some("1 ug = 9.80665e-6 m/s^2")),
    ("imu.accel_bias_m_s2", "m/s^2", "computed", None),
    ("imu.accel_vrw_m_s_per_sqrt_hr", "(m/s)/sqrt(hr)", "input", None),
    ("imu.accel_vrw_m_s_per_sqrt_s", "(m/s)/sqrt(s)", "computed", Some("square of this is the white acceleration PSD q_va")),
    ("imu.accel_scale_factor_ppm", "ppm", "input", None),
    ("imu.gyro_bias_deg_per_hr", "deg/hr", "input", None),
    ("imu.gyro_bias_rad_s", "rad/s", "computed", None),
    ("imu.gyro_arw_deg_per_sqrt_hr", "deg/sqrt(hr)", "input", None),
    ("imu.gyro_arw_rad_per_sqrt_s", "rad/sqrt(s)", "computed", Some("square of this is the white angular-rate PSD q_arw")),
    ("motion.speed_m_s", "m/s", "input", None),
    ("motion.ref_accel_m_s2", "m/s^2", "input", None),
    ("contributions.exponent", "1", "modelled", Some("the power of coast duration this contribution grows with")),
    ("contributions.coefficient_si", "m/s^exponent", "computed", None),
    ("crossings.threshold_m", "m", "input", None),
    ("crossings.coast_s", "s", "computed", Some("bisection on the combined model; null with a status when the model never reaches the threshold")),
    ("crossings.error_at_coast_m", "m", "computed", Some("the model re-evaluated at the located crossing; a residual check on the bisection")),
    ("crossings.travelled_distance_m", "m", "computed", None),
    ("crossings.implied_mean_drift_rate_m_per_s", "m/s", "computed", Some("threshold / crossing duration; the quantity a duty-cycle study sweeps")),
    ("crossings.breakdown.error_m", "m", "computed", None),
    ("crossings.breakdown.fraction_of_linear_sum", "1", "computed", None),
    ("contribution_crossings.closed_form_s", "s", "closed-form", Some("exact algebraic inversion of that contribution's monomial")),
    ("contribution_crossings.bisection_s", "s", "computed", Some("the engine's bisection on the same monomial")),
    ("contribution_crossings.rel_diff", "1", "internal-consistency", None),
    ("combination_sensitivity.crossings.coast_s", "s", "computed", None),
    ("grade_table.crossings.coast_s", "s", "computed", None),
    ("grade_table.crossings.implied_mean_drift_rate_m_per_s", "m/s", "computed", None),
    ("swept_drift_band.lo_m_per_s", "m/s", "input", None),
    ("swept_drift_band.hi_m_per_s", "m/s", "input", None),
    ("swept_drift_band.rows.band_entry_s", "s", "computed", Some("bisection for the coast duration whose mean drift rate equals the band's lower edge")),
    ("swept_drift_band.rows.band_exit_s", "s", "computed", None),
    ("swept_drift_band.rows.rate_at_bracket_lo_m_per_s", "m/s", "computed", None),
    ("swept_drift_band.rows.rate_at_bracket_hi_m_per_s", "m/s", "computed", None),
    ("trn.fix_interval_s", "s", "input", None),
    ("trn.fix_residual_m", "m", "input", None),
    ("trn.mission_duration_s", "s", "input", None),
    ("trn.intervals_evaluated", "count", "computed", Some("0 in fix_mode none, where the single reported error is the free-inertial value at the mission duration")),
    ("trn.peak_error_m", "m", "computed", Some("maximum over every evaluated inter-fix interval, scanned rather than assumed to be the last")),
    ("trn.interval_errors_m", "m", "computed", None),
    ("trn.thresholds.max_fix_interval_s", "s", "computed", Some("bisection over [mission/4096, mission]; null with a status when unbracketed")),
];

/// Render [`UNITS`] as the result document's `units` object.
fn units_block() -> serde_json::Value {
    let mut m = serde_json::Map::with_capacity(UNITS.len());
    for (field, unit, provenance, note) in UNITS {
        let mut e = serde_json::Map::new();
        e.insert("unit".into(), serde_json::Value::from(*unit));
        e.insert("provenance".into(), serde_json::Value::from(*provenance));
        if let Some(n) = note {
            e.insert("note".into(), serde_json::Value::from(*n));
        }
        m.insert((*field).to_string(), serde_json::Value::Object(e));
    }
    serde_json::Value::Object(m)
}

/// Double-integrate the scale-factor error the engine's own [`ImuErrorModel`] produces,
/// over a profile that accelerates from rest at `accel` for `ramp_s` and then cruises for
/// `cruise_s`. Returns the position error (m) the distorted specific force accumulates
/// relative to the truth — the independent route the analytic `s · distance` law is
/// checked against.
///
/// Public because it is the cross-check oracle for the scale-factor contribution and a
/// caller reproducing the validation needs the same integration, not a re-derivation.
pub fn scale_factor_reference_error_m(
    scale_ppm: f64,
    accel: f64,
    ramp_s: f64,
    cruise_s: f64,
    dt: f64,
) -> f64 {
    let m = ImuErrorModel::ideal().with_scale_accel_ppm([scale_ppm, 0.0, 0.0]);
    let (mut v_err, mut p_err, mut t) = (0.0f64, 0.0f64, 0.0f64);
    let total = ramp_s + cruise_s;
    while t < total - 0.5 * dt {
        let f_true = if t < ramp_s { accel } else { 0.0 };
        let (_, f_meas) = m.distort([0.0; 3], [f_true, 0.0, 0.0], t);
        v_err += (f_meas[0] - f_true) * dt;
        p_err += v_err * dt;
        t += dt;
    }
    p_err
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::inertial::AccelModel;
    use crate::quantum_trade::ClassicalInsBudget;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;

    /// Relative difference, guarded against a zero denominator.
    fn rel(a: f64, b: f64) -> f64 {
        let d = a.abs().max(b.abs());
        if d == 0.0 {
            0.0
        } else {
            (a - b).abs() / d
        }
    }

    /// A model with exactly one contribution active, so a growth power can be pinned
    /// without another term diluting it.
    fn single(name: &str) -> CoastModel {
        let zero = ImuParamsSi {
            accel_bias_m_s2: 0.0,
            accel_vrw_m_s_per_sqrt_s: 0.0,
            accel_scale_factor: 0.0,
            gyro_bias_rad_s: 0.0,
            gyro_arw_rad_per_sqrt_s: 0.0,
        };
        let (mut imu, mut v, mut a) = (zero, 0.0, 0.0);
        match name {
            "accel_bias" => imu.accel_bias_m_s2 = 3.0e-4,
            "gyro_bias_tilt" => imu.gyro_bias_rad_s = 5.0e-8,
            "velocity_random_walk" => imu.accel_vrw_m_s_per_sqrt_s = 1.0e-4,
            "angle_random_walk" => imu.gyro_arw_rad_per_sqrt_s = 6.0e-7,
            "scale_factor_cruise" => {
                imu.accel_scale_factor = 1.0e-4;
                v = 200.0;
            }
            "scale_factor_accel" => {
                imu.accel_scale_factor = 1.0e-4;
                a = 2.0;
            }
            other => panic!("no single-contribution fixture for {other}"),
        }
        CoastModel::new(imu, v, a, Combination::Rss, 0.0)
    }

    // -----------------------------------------------------------------------
    // Growth powers — the test that catches a wrong model
    // -----------------------------------------------------------------------

    #[test]
    fn doubling_the_coast_scales_each_contribution_by_two_to_its_own_power() {
        // Every contribution is a monomial in t, so doubling t must multiply it by
        // exactly 2^p and by nothing else. A contribution wired to the wrong integral
        // (a bias integrated once, a random walk integrated twice) fails here even
        // though its magnitude at a single epoch could be tuned to look right.
        let expected: &[(&str, f64)] = &[
            ("accel_bias", 2.0),
            ("gyro_bias_tilt", 3.0),
            ("scale_factor_cruise", 1.0),
            ("scale_factor_accel", 2.0),
            ("velocity_random_walk", 1.5),
            ("angle_random_walk", 2.5),
        ];
        for (name, p) in expected {
            let m = single(name);
            for t in [10.0f64, 137.0, 900.0] {
                let ratio = m.drift_m(2.0 * t) / m.drift_m(t);
                assert!(
                    rel(ratio, 2.0f64.powf(*p)) < 1.0e-12,
                    "{name} at t={t}: doubling scaled the error by {ratio}, expected 2^{p} = {}",
                    2.0f64.powf(*p)
                );
            }
        }
    }

    #[test]
    fn a_pure_bias_error_quadruples_and_a_pure_random_walk_error_grows_by_two_to_the_three_halves()
    {
        // The two headline cases named in the acceptance, spelled out separately from
        // the table above so a regression names itself.
        let bias = single("accel_bias");
        assert!(rel(bias.drift_m(600.0) / bias.drift_m(300.0), 4.0) < 1.0e-12);
        let vrw = single("velocity_random_walk");
        assert!(rel(vrw.drift_m(600.0) / vrw.drift_m(300.0), 2.0f64.powf(1.5)) < 1.0e-12);
    }

    #[test]
    fn the_exponents_the_document_publishes_are_the_ones_the_curves_actually_follow() {
        // The reported `exponent` is not an annotation: it must be recoverable from two
        // samples of the curve it labels.
        let m = CoastModel::new(
            ImuGrade::Tactical.params().si(),
            180.0,
            1.5,
            Combination::Rss,
            0.0,
        );
        for c in m.contributions() {
            if c.coefficient <= 0.0 {
                continue;
            }
            let measured = (c.error_m(800.0) / c.error_m(400.0)).log2();
            assert!(
                rel(measured, c.exponent) < 1.0e-12,
                "{} reports exponent {} but its curve measures {measured}",
                c.name,
                c.exponent
            );
        }
    }

    // -----------------------------------------------------------------------
    // The closed forms are exact for this model, so both routes are reported
    // -----------------------------------------------------------------------

    #[test]
    fn every_contributions_closed_form_crossing_agrees_with_the_engines_bisection() {
        let m = CoastModel::new(
            ImuGrade::Navigation.params().si(),
            250.0,
            0.0,
            Combination::Rss,
            0.0,
        );
        let mut checked = 0;
        for c in m.contributions() {
            for th in [1.0, 10.0, 50.0, 500.0] {
                let Some(closed) = c.closed_form_crossing_s(th) else {
                    continue;
                };
                let bisected = locate_crossing(
                    &MonomialDrift {
                        coefficient: c.coefficient,
                        exponent: c.exponent,
                    },
                    th,
                )
                .coast_s
                .expect(
                    "a contribution with a closed-form crossing is bracketed by the \
                         doubling search, so the bisection returns a finite duration",
                );
                assert!(
                    rel(closed, bisected) < 1.0e-9,
                    "{}: closed form {closed} s vs bisection {bisected} s",
                    c.name
                );
                checked += 1;
            }
        }
        assert!(
            checked >= 16,
            "only {checked} contribution crossings checked"
        );
    }

    #[test]
    fn the_located_crossing_puts_the_model_on_the_threshold_it_searched_for() {
        // The residual check the bisection itself cannot make: re-evaluate the model.
        let m = CoastModel::new(
            ImuGrade::Tactical.params().si(),
            120.0,
            0.0,
            Combination::Rss,
            0.0,
        );
        for th in [10.0, 50.0, 200.0] {
            let t = locate_crossing(&m, th)
                .coast_s
                .expect("a tactical-grade coast reaches every threshold in this list");
            assert!(
                rel(m.drift_m(t), th) < 1.0e-9,
                "threshold {th} m located at {t} s, where the model reads {} m",
                m.drift_m(t)
            );
        }
    }

    // -----------------------------------------------------------------------
    // Cross-checks against the engine's existing, independently written models
    // -----------------------------------------------------------------------

    #[test]
    fn the_bias_law_matches_the_engines_stochastic_dead_reckoner_stepped_forward() {
        // AccelModel is a step-by-step simulator; this module is its closed-form
        // envelope. With only a bias the simulator is deterministic, so the two must
        // agree to the Euler integrator's own O(dt/t) truncation.
        let (b, dt, t_end) = (3.0e-4f64, 0.01f64, 100.0f64);
        let mut sim = AccelModel::new("bias", "test", b, 0.0);
        let mut rng = ChaCha8Rng::seed_from_u64(1);
        let n = (t_end / dt).round() as usize;
        for _ in 0..n {
            sim.step(dt, &mut rng);
        }
        let analytic = 0.5 * b * t_end * t_end;
        assert!(
            rel(sim.pos(), analytic) < 2.0e-4,
            "stepped {} m vs closed form {analytic} m",
            sim.pos()
        );
    }

    #[test]
    fn the_gyro_tilt_law_matches_the_engines_stochastic_dead_reckoner_stepped_forward() {
        let (bg, dt, t_end) = (5.0e-6f64, 0.01f64, 100.0f64);
        let mut sim = AccelModel::new("gyro", "test", 0.0, 0.0).with_gyro(bg, 0.0);
        let mut rng = ChaCha8Rng::seed_from_u64(2);
        let n = (t_end / dt).round() as usize;
        for _ in 0..n {
            sim.step(dt, &mut rng);
        }
        let analytic = G_M_PER_S2 * bg * t_end.powi(3) / 6.0;
        assert!(
            rel(sim.pos(), analytic) < 1.0e-3,
            "stepped {} m vs closed form {analytic} m",
            sim.pos()
        );
    }

    /// Sample RMS of the engine's stochastic dead-reckoner at `t_end`, over `runs` seeds.
    fn accel_model_rms_m(build: impl Fn() -> AccelModel, runs: u64, dt: f64, t_end: f64) -> f64 {
        let n = (t_end / dt).round() as usize;
        let mut sum2 = 0.0;
        for s in 0..runs {
            let mut m = build();
            let mut rng = ChaCha8Rng::seed_from_u64(0xC0A5_7000 + s);
            for _ in 0..n {
                m.step(dt, &mut rng);
            }
            sum2 += m.pos() * m.pos();
        }
        (sum2 / runs as f64).sqrt()
    }

    #[test]
    fn the_velocity_random_walk_law_matches_a_monte_carlo_of_the_engines_dead_reckoner() {
        // sigma_p = sigma_vrw * t^1.5 / sqrt(3). The simulator knows only the PSD
        // q_va = sigma_vrw^2 and a white velocity increment per step; it never sees the
        // t^1.5 law, so this is an independent route to the same number.
        let (vrw, dt, t_end, runs) = (2.0e-3f64, 0.05f64, 100.0f64, 300u64);
        let measured = accel_model_rms_m(
            || AccelModel::new("vrw", "test", 0.0, vrw * vrw),
            runs,
            dt,
            t_end,
        );
        let analytic = vrw * t_end.powf(1.5) / 3.0f64.sqrt();
        assert!(
            rel(measured, analytic) < 0.10,
            "Monte-Carlo RMS {measured} m vs closed form {analytic} m over {runs} seeds"
        );
    }

    #[test]
    fn the_angle_random_walk_law_matches_a_monte_carlo_of_the_engines_dead_reckoner() {
        // sigma_p = g * sigma_arw * t^2.5 / sqrt(20), the doubly integrated tilt Wiener
        // process. Again the simulator only ever adds a white tilt increment per step.
        let (arw, dt, t_end, runs) = (1.0e-4f64, 0.05f64, 100.0f64, 300u64);
        let measured = accel_model_rms_m(
            || AccelModel::new("arw", "test", 0.0, 0.0).with_gyro(0.0, arw * arw),
            runs,
            dt,
            t_end,
        );
        let analytic = G_M_PER_S2 * arw * t_end.powf(2.5) / 20.0f64.sqrt();
        assert!(
            rel(measured, analytic) < 0.10,
            "Monte-Carlo RMS {measured} m vs closed form {analytic} m over {runs} seeds"
        );
    }

    #[test]
    fn the_scale_factor_law_matches_a_double_integration_of_the_engines_imu_error_model() {
        // The claim under test is that a scale-factor error costs `s x travelled
        // distance`. The reference route distorts a true specific force through
        // ImuErrorModel and integrates the residual twice — it never multiplies a
        // distance by anything.
        let (ppm, accel, ramp, cruise, dt) = (500.0f64, 2.0f64, 40.0f64, 300.0f64, 1.0e-3f64);
        let reference = scale_factor_reference_error_m(ppm, accel, ramp, cruise, dt);
        let v = accel * ramp;
        let distance = 0.5 * accel * ramp * ramp + v * cruise;
        let analytic = ppm * PPM * distance;
        assert!(
            rel(reference, analytic) < 2.0e-3,
            "ImuErrorModel double integration {reference} m vs s*distance {analytic} m"
        );
    }

    #[test]
    fn the_model_reduces_to_the_engines_existing_classical_ins_budget() {
        // With the two gyro channels off and a sustained specific force instead of a
        // cruise, this model is exactly the budget `quantum_trade::ClassicalInsBudget`
        // already computes. It is the SAME expression reached from a different
        // parameterisation — a compatibility check, not an independent oracle — and it
        // is what proves this module did not fork a second, divergent error model.
        let (bias, ppm, a_ref, psd) = (2.5e-4f64, 200.0f64, 1.5f64, 4.0e-8f64);
        let existing = ClassicalInsBudget {
            bias_m_s2: bias,
            scale_factor_ppm: ppm,
            ref_accel_m_s2: a_ref,
            vrw_psd: psd,
        };
        let mine = CoastModel::new(
            ImuParamsSi {
                accel_bias_m_s2: bias,
                accel_vrw_m_s_per_sqrt_s: psd.sqrt(),
                accel_scale_factor: ppm * PPM,
                gyro_bias_rad_s: 0.0,
                gyro_arw_rad_per_sqrt_s: 0.0,
            },
            0.0,
            a_ref,
            Combination::Rss,
            0.0,
        );
        for t in [1.0, 60.0, 600.0, 3600.0] {
            assert!(
                rel(mine.drift_m(t), existing.drift_m(t)) < 1.0e-12,
                "t={t}: this model {} m vs ClassicalInsBudget {} m",
                mine.drift_m(t),
                existing.drift_m(t)
            );
        }
        for th in [10.0, 50.0] {
            let a = locate_crossing(&mine, th).coast_s.expect("reached");
            let b = existing.inertial_holdover_s(th);
            assert!(rel(a, b) < 1.0e-9, "threshold {th}: {a} s vs {b} s");
        }
    }

    // -----------------------------------------------------------------------
    // Combination: a modelling choice, and its ordering is measured
    // -----------------------------------------------------------------------

    #[test]
    fn the_three_combinations_order_the_crossings_rss_latest_and_linear_sum_earliest() {
        // Measured, not assumed: for the same model, rss <= det-sum-stoch-rss <=
        // linear-sum at every epoch, so the crossing durations run the other way.
        let si = ImuGrade::Navigation.params().si();
        let t = |k: Combination| {
            locate_crossing(&CoastModel::new(si, 250.0, 0.5, k, 0.0), 10.0)
                .coast_s
                .expect("a navigation-grade coast reaches 10 m under every combination")
        };
        let (rss, mixed, sum) = (
            t(Combination::Rss),
            t(Combination::DetSumStochRss),
            t(Combination::LinearSum),
        );
        assert!(
            rss >= mixed && mixed >= sum,
            "expected rss >= det-sum-stoch-rss >= linear-sum, got {rss} / {mixed} / {sum}"
        );
        for u in [1.0f64, 100.0, 1000.0] {
            let m = |k: Combination| CoastModel::new(si, 250.0, 0.5, k, 0.0).drift_m(u);
            assert!(m(Combination::Rss) <= m(Combination::DetSumStochRss) + 1.0e-12);
            assert!(m(Combination::DetSumStochRss) <= m(Combination::LinearSum) + 1.0e-12);
        }
    }

    // -----------------------------------------------------------------------
    // TRN bounding
    // -----------------------------------------------------------------------

    #[test]
    fn a_full_reset_fix_makes_every_inter_fix_excursion_identical() {
        let m = CoastModel::new(
            ImuGrade::Tactical.params().si(),
            200.0,
            0.0,
            Combination::Rss,
            17.0,
        );
        let c = m.trn_coast(TrnFixMode::FullReset, 120.0, 3600.0);
        assert_eq!(c.intervals, 30);
        let first = c.interval_errors_m[0];
        for e in &c.interval_errors_m {
            assert!(rel(*e, first) < 1.0e-12, "{e} vs {first}");
        }
        assert!(rel(c.peak_error_m, first) < 1.0e-12);
    }

    #[test]
    fn a_position_only_fix_lets_each_excursion_exceed_the_last_and_the_peak_is_the_final_one() {
        // Measured rather than assumed: the peak scan takes the maximum over every
        // interval, and this pins that the sequence really is the monotone one the
        // physics implies (velocity error and tilt survive a position-only fix).
        let m = CoastModel::new(
            ImuGrade::Tactical.params().si(),
            200.0,
            0.0,
            Combination::Rss,
            17.0,
        );
        let c = m.trn_coast(TrnFixMode::PositionOnly, 120.0, 3600.0);
        assert_eq!(c.intervals, 30);
        for w in c.interval_errors_m.windows(2) {
            assert!(
                w[1] >= w[0],
                "excursion sequence fell: {} -> {}",
                w[0],
                w[1]
            );
        }
        let last = *c
            .interval_errors_m
            .last()
            .expect("30 intervals were evaluated");
        assert!(rel(c.peak_error_m, last) < 1.0e-12);
        // And it is strictly worse than the full-reset reading of the same fix rate.
        let full = m.trn_coast(TrnFixMode::FullReset, 120.0, 3600.0);
        assert!(
            c.peak_error_m > full.peak_error_m,
            "position-only peak {} m should exceed full-reset peak {} m",
            c.peak_error_m,
            full.peak_error_m
        );
    }

    #[test]
    fn the_first_position_only_interval_reproduces_the_free_inertial_coast() {
        // Before the first fix there is nothing to carry over, so interval 0 must equal
        // the unaided coast of the same length (plus the residual the model carries).
        let m = CoastModel::new(
            ImuGrade::Navigation.params().si(),
            250.0,
            0.0,
            Combination::Rss,
            0.0,
        );
        let tau = 300.0;
        let c = m.trn_coast(TrnFixMode::PositionOnly, tau, tau * 4.0);
        assert!(
            rel(c.interval_errors_m[0], m.drift_m(tau)) < 1.0e-12,
            "{} vs {}",
            c.interval_errors_m[0],
            m.drift_m(tau)
        );
    }

    #[test]
    fn the_largest_fix_interval_holding_a_threshold_puts_the_peak_on_that_threshold() {
        // Two configurations that do bracket, one per fix mode. The position-only case
        // is deliberately a short mission: see the refusal test below for why a long one
        // does not bracket at all.
        let cases: &[(TrnFixMode, ImuGrade, f64)] = &[
            (TrnFixMode::FullReset, ImuGrade::Tactical, 3600.0),
            (TrnFixMode::PositionOnly, ImuGrade::Navigation, 600.0),
        ];
        for (mode, grade, mission) in cases {
            let m = CoastModel::new(grade.params().si(), 200.0, 0.0, Combination::Rss, 5.0);
            let (iv, status) = m.max_fix_interval_s(*mode, *mission, 50.0);
            assert_eq!(status, "bisected", "{} mode: {status}", mode.as_str());
            let iv = iv.expect("a bisected interval is present");
            let peak = m.trn_coast(*mode, iv, *mission).peak_error_m;
            assert!(
                rel(peak, 50.0) < 1.0e-6,
                "{} mode: interval {iv} s gives peak {peak} m, not 50 m",
                mode.as_str()
            );
        }
    }

    #[test]
    fn a_position_only_fix_cannot_bound_a_tactical_hour_at_any_fix_rate() {
        // The refusal this build would not assert away. A terrain fix that corrects
        // POSITION only leaves the velocity error and the tilt integrating, so by the end
        // of an hour a tactical-grade unit is carrying a velocity error large enough to
        // break 50 m inside the tightest inter-fix interval the scan will evaluate
        // (3600/4096 = 0.88 s). Fixing position more often does not help; only a fix that
        // also observes velocity and tilt does, which is the full-reset mode.
        let m = CoastModel::new(
            ImuGrade::Tactical.params().si(),
            200.0,
            0.0,
            Combination::Rss,
            5.0,
        );
        let (iv, status) = m.max_fix_interval_s(TrnFixMode::PositionOnly, 3600.0, 50.0);
        assert_eq!(status, "never-holds");
        assert!(iv.is_none());
        let tightest = 3600.0 / MAX_TRN_INTERVALS as f64;
        let peak = m
            .trn_coast(TrnFixMode::PositionOnly, tightest, 3600.0)
            .peak_error_m;
        assert!(
            peak > 50.0,
            "the tightest evaluated interval already had to breach 50 m, got {peak} m"
        );
        // The same hour under a full-reset fix is bounded at a far smaller interval.
        let (full_iv, full_status) = m.max_fix_interval_s(TrnFixMode::FullReset, 3600.0, 50.0);
        assert_eq!(full_status, "bisected");
        assert!(full_iv.expect("a bisected interval") > tightest);
    }

    #[test]
    fn a_fix_residual_above_the_threshold_is_reported_as_never_holding_not_as_a_zero() {
        let m = CoastModel::new(
            ImuGrade::Navigation.params().si(),
            250.0,
            0.0,
            Combination::Rss,
            30.0,
        );
        let (iv, status) = m.max_fix_interval_s(TrnFixMode::FullReset, 3600.0, 10.0);
        assert_eq!(status, "never-holds");
        assert!(iv.is_none());
        // And the headline crossing says the same thing rather than a denormal duration.
        let c = locate_crossing(&m, 10.0);
        assert_eq!(c.status, "already-exceeded-at-zero");
        assert_eq!(c.coast_s, Some(0.0));
    }

    // -----------------------------------------------------------------------
    // Scenario surface
    // -----------------------------------------------------------------------

    fn run(src: &str) -> serde_json::Value {
        let scn: InsTrnCoastScenario = toml::from_str(src).expect("scenario parses");
        let (json, _) = scn.run_json().expect("scenario runs");
        serde_json::from_str(&json).expect("result is JSON")
    }

    #[test]
    fn the_default_scenario_reports_a_ten_metre_and_a_fifty_metre_crossing() {
        let v = run("kind = \"ins-trn-coast\"\n");
        let cs = v["crossings"].as_array().expect("crossings array");
        assert_eq!(cs.len(), 2);
        assert_eq!(cs[0]["threshold_m"].as_f64(), Some(10.0));
        assert_eq!(cs[1]["threshold_m"].as_f64(), Some(50.0));
        for c in cs {
            assert_eq!(c["status"].as_str(), Some("reached"));
            let t = c["coast_s"].as_f64().expect("a located crossing");
            assert!(t > 0.0 && t.is_finite());
        }
        assert!(
            cs[1]["coast_s"].as_f64() > cs[0]["coast_s"].as_f64(),
            "the 50 m crossing must come after the 10 m one"
        );
    }

    #[test]
    fn the_crossing_thresholds_are_inputs_and_moving_them_moves_the_crossings() {
        // The acceptance's 10 m / 50 m are defaults, not constants baked into the model.
        let a = run("kind = \"ins-trn-coast\"\n");
        let b = run("kind = \"ins-trn-coast\"\ncrossing_thresholds_m = [5.0, 25.0, 100.0]\n");
        assert_eq!(b["crossings"].as_array().expect("array").len(), 3);
        assert!(
            b["crossings"][0]["coast_s"].as_f64() < a["crossings"][0]["coast_s"].as_f64(),
            "a 5 m threshold must be crossed before a 10 m one"
        );
    }

    #[test]
    fn every_published_field_carries_a_unit_and_a_provenance_class() {
        let v = run("kind = \"ins-trn-coast\"\ntrn_fix_mode = \"position-only\"\n");
        let units = v["units"].as_object().expect("a units block");
        assert!(units.len() >= 35, "only {} units declared", units.len());
        for (field, e) in units {
            assert!(
                e["unit"].is_string(),
                "{field} declares no unit in the units block"
            );
            let p = e["provenance"].as_str().unwrap_or_default();
            assert!(
                [
                    "input",
                    "computed",
                    "modelled",
                    "closed-form",
                    "internal-consistency",
                ]
                .contains(&p),
                "{field} carries an unrecognised provenance class {p:?}"
            );
        }
    }

    #[test]
    fn the_document_names_the_combination_it_used_and_reports_all_three() {
        let v = run("kind = \"ins-trn-coast\"\ncombination = \"linear-sum\"\n");
        assert_eq!(v["combination"].as_str(), Some("linear-sum"));
        let s = v["combination_sensitivity"]
            .as_array()
            .expect("sensitivity array");
        assert_eq!(s.len(), 3);
        let names: Vec<&str> = s.iter().filter_map(|r| r["combination"].as_str()).collect();
        assert_eq!(names, vec!["rss", "linear-sum", "det-sum-stoch-rss"]);
    }

    #[test]
    fn each_crossing_names_the_contribution_that_dominates_it() {
        let v = run("kind = \"ins-trn-coast\"\n");
        for c in v["crossings"].as_array().expect("array") {
            let dom = c["dominant_contribution"]
                .as_str()
                .expect("a dominant contribution");
            assert_ne!(dom, "none");
            let rows = c["breakdown"].as_array().expect("a breakdown");
            let best = rows
                .iter()
                .max_by(|a, b| {
                    a["error_m"]
                        .as_f64()
                        .unwrap_or(0.0)
                        .total_cmp(&b["error_m"].as_f64().unwrap_or(0.0))
                })
                .expect("a largest row");
            assert_eq!(
                best["name"].as_str(),
                Some(dom),
                "the named dominant contribution is not the largest row"
            );
        }
    }

    #[test]
    fn a_navigation_grade_coast_is_accelerometer_bias_limited_at_both_default_thresholds() {
        // A dominance claim, measured and pinned rather than asserted in prose. If the
        // representative coefficients or the motion profile move, this is where it shows.
        let v = run("kind = \"ins-trn-coast\"\n");
        for c in v["crossings"].as_array().expect("array") {
            assert_eq!(
                c["dominant_contribution"].as_str(),
                Some("accel_bias"),
                "threshold {:?}",
                c["threshold_m"]
            );
        }
    }

    #[test]
    fn the_gyro_tilt_term_overtakes_the_bias_term_at_the_epoch_their_coefficients_predict() {
        // t^3 beats t^2 eventually. The crossover is c_bias / c_gyro, and the curves
        // must actually cross there — the ordering is a consequence of the model, not an
        // annotation on it.
        let m = CoastModel::new(
            ImuGrade::Navigation.params().si(),
            250.0,
            0.0,
            Combination::Rss,
            0.0,
        );
        let cs = m.contributions();
        let bias = cs
            .iter()
            .find(|c| c.name == "accel_bias")
            .expect("accel_bias is always present");
        let gyro = cs
            .iter()
            .find(|c| c.name == "gyro_bias_tilt")
            .expect("gyro_bias_tilt is always present");
        let t_star = bias.coefficient / gyro.coefficient;
        assert!(
            rel(bias.error_m(t_star), gyro.error_m(t_star)) < 1.0e-12,
            "the two curves do not meet at {t_star} s"
        );
        assert!(gyro.error_m(0.5 * t_star) < bias.error_m(0.5 * t_star));
        assert!(gyro.error_m(2.0 * t_star) > bias.error_m(2.0 * t_star));
    }

    #[test]
    fn a_static_platform_has_no_scale_factor_contribution_at_all() {
        let v = run("kind = \"ins-trn-coast\"\nspeed_m_s = 0.0\n");
        for c in v["contributions"].as_array().expect("array") {
            if c["name"].as_str() == Some("scale_factor_cruise")
                || c["name"].as_str() == Some("scale_factor_accel")
            {
                assert_eq!(c["coefficient_si"].as_f64(), Some(0.0));
            }
        }
    }

    #[test]
    fn a_coarser_imu_grade_crosses_every_threshold_sooner() {
        let v = run("kind = \"ins-trn-coast\"\n");
        let rows = v["grade_table"].as_array().expect("grade table");
        assert_eq!(rows.len(), 4);
        for i in 1..rows.len() {
            for k in 0..2 {
                let prev = rows[i - 1]["crossings"][k]["coast_s"]
                    .as_f64()
                    .expect("a located crossing");
                let cur = rows[i]["crossings"][k]["coast_s"]
                    .as_f64()
                    .expect("a located crossing");
                assert!(
                    cur < prev,
                    "grade {:?} crosses later than {:?}",
                    rows[i]["grade"],
                    rows[i - 1]["grade"]
                );
            }
        }
    }

    #[test]
    fn the_swept_drift_band_question_is_answered_per_grade_with_a_status_never_a_blank() {
        let v = run("kind = \"ins-trn-coast\"\n");
        let b = &v["swept_drift_band"];
        assert_eq!(b["lo_m_per_s"].as_f64(), Some(0.001));
        assert_eq!(b["hi_m_per_s"].as_f64(), Some(0.050));
        for r in b["rows"].as_array().expect("band rows") {
            let s = r["status"].as_str().expect("a status");
            assert!(!s.is_empty());
            if r["band_entry_s"].is_null() && r["band_exit_s"].is_null() {
                assert_ne!(s, "band-spanned");
            }
        }
    }

    #[test]
    fn a_slow_platform_puts_a_navigation_grade_unit_inside_the_swept_band() {
        // The band the manuscript sweeps, 0.001-0.050 m/s, is reproducible — but the
        // platform speed decides it as much as the IMU does, because the scale-factor
        // floor is s*v and never falls below it. At 250 m/s a navigation-grade unit
        // starts at 0.025 m/s; at 5 m/s it starts three decades lower and the whole
        // band is spanned.
        let v = run("kind = \"ins-trn-coast\"\nspeed_m_s = 5.0\n");
        let row = &v["swept_drift_band"]["rows"][0];
        assert_eq!(row["grade"].as_str(), Some("navigation"));
        assert_eq!(row["status"].as_str(), Some("band-spanned"));
        let entry = row["band_entry_s"].as_f64().expect("a band entry");
        let exit = row["band_exit_s"].as_f64().expect("a band exit");
        assert!(entry < exit && entry > 0.0);
    }

    #[test]
    fn the_trn_block_reports_a_bounded_peak_and_the_largest_interval_that_holds_it() {
        let v = run("kind = \"ins-trn-coast\"\nimu_grade = \"tactical\"\n\
             trn_fix_mode = \"position-only\"\ntrn_fix_residual_m = 5.0\n\
             trn_fix_interval_s = 60.0\n");
        let t = &v["trn"];
        assert_eq!(t["fix_mode"].as_str(), Some("position-only"));
        assert_eq!(t["intervals_evaluated"].as_u64(), Some(60));
        let peak = t["peak_error_m"].as_f64().expect("a peak");
        assert!(peak.is_finite() && peak > 0.0);
        // The unaided coast over the same mission is very much worse.
        let free = run("kind = \"ins-trn-coast\"\nimu_grade = \"tactical\"\n")["trn"]
            ["peak_error_m"]
            .as_f64()
            .expect("a free-inertial peak");
        assert!(
            peak < free,
            "TRN aiding must bound the coast: {peak} m vs free-inertial {free} m"
        );
    }

    // -----------------------------------------------------------------------
    // Input handling
    // -----------------------------------------------------------------------

    #[test]
    fn an_unknown_grade_combination_or_fix_mode_is_an_error_naming_the_accepted_set() {
        for (src, needle) in [
            (
                "kind = \"ins-trn-coast\"\nimu_grade = \"military\"\n",
                "navigation",
            ),
            (
                "kind = \"ins-trn-coast\"\ncombination = \"quadrature\"\n",
                "rss",
            ),
            (
                "kind = \"ins-trn-coast\"\ntrn_fix_mode = \"tight\"\n",
                "position-only",
            ),
        ] {
            let scn: InsTrnCoastScenario = toml::from_str(src).expect("parses");
            let e = scn
                .run_json()
                .expect_err("an unknown name must be an error");
            assert!(
                e.contains(needle),
                "error {e:?} does not name the accepted set"
            );
        }
    }

    #[test]
    fn a_per_coefficient_override_relabels_the_grade_as_custom() {
        let v = run("kind = \"ins-trn-coast\"\naccel_bias_ug = 40.0\n");
        assert_eq!(v["imu"]["grade"].as_str(), Some("custom"));
        assert_eq!(v["imu"]["accel_bias_ug"].as_f64(), Some(40.0));
    }

    #[test]
    fn a_negative_or_non_finite_input_is_refused_rather_than_coasted_on() {
        for src in [
            "kind = \"ins-trn-coast\"\naccel_bias_ug = -1.0\n",
            "kind = \"ins-trn-coast\"\nspeed_m_s = -10.0\n",
            "kind = \"ins-trn-coast\"\ncrossing_thresholds_m = [0.0]\n",
            "kind = \"ins-trn-coast\"\ncrossing_thresholds_m = []\n",
            "kind = \"ins-trn-coast\"\ndrift_band_lo_m_per_s = 0.1\ndrift_band_hi_m_per_s = 0.01\n",
            "kind = \"ins-trn-coast\"\nmission_duration_s = 0.0\n",
        ] {
            let scn: InsTrnCoastScenario = toml::from_str(src).expect("parses");
            assert!(
                scn.run_json().is_err(),
                "input {src:?} should have been refused"
            );
        }
    }

    #[test]
    fn the_result_document_carries_no_non_finite_number() {
        fn walk(v: &serde_json::Value, path: &str) {
            match v {
                serde_json::Value::Number(n) => {
                    let x = n.as_f64().unwrap_or(f64::NAN);
                    assert!(x.is_finite(), "non-finite number at {path}");
                }
                serde_json::Value::Array(a) => {
                    for (i, e) in a.iter().enumerate() {
                        walk(e, &format!("{path}[{i}]"));
                    }
                }
                serde_json::Value::Object(o) => {
                    for (k, e) in o {
                        walk(e, &format!("{path}.{k}"));
                    }
                }
                _ => {}
            }
        }
        for src in [
            "kind = \"ins-trn-coast\"\n",
            "kind = \"ins-trn-coast\"\nspeed_m_s = 0.0\nimu_grade = \"consumer\"\n",
            "kind = \"ins-trn-coast\"\ntrn_fix_mode = \"full-reset\"\n",
            "kind = \"ins-trn-coast\"\ntrn_fix_mode = \"position-only\"\ntrn_fix_residual_m = 0.0\n",
            "kind = \"ins-trn-coast\"\naccel_bias_ug = 0.0\naccel_vrw_m_s_per_sqrt_hr = 0.0\n\
             accel_scale_factor_ppm = 0.0\ngyro_bias_deg_per_hr = 0.0\n\
             gyro_arw_deg_per_sqrt_hr = 0.0\n",
        ] {
            walk(&run(src), "root");
        }
    }

    #[test]
    fn an_error_free_imu_never_reaches_a_threshold_and_says_so_instead_of_reporting_zero() {
        let v = run(
            "kind = \"ins-trn-coast\"\naccel_bias_ug = 0.0\naccel_vrw_m_s_per_sqrt_hr = 0.0\n\
             accel_scale_factor_ppm = 0.0\ngyro_bias_deg_per_hr = 0.0\n\
             gyro_arw_deg_per_sqrt_hr = 0.0\n",
        );
        for c in v["crossings"].as_array().expect("array") {
            assert_eq!(c["status"].as_str(), Some("never-reached"));
            assert!(c["coast_s"].is_null());
            assert!(c["implied_mean_drift_rate_m_per_s"].is_null());
        }
    }

    #[test]
    fn the_scenario_runs_through_the_engines_public_dispatch_and_is_reproducible() {
        let src = "kind = \"ins-trn-coast\"\nimu_grade = \"tactical\"\n\
                   trn_fix_mode = \"position-only\"\n";
        let a = crate::api::run_toml(src).expect("dispatch reaches the pack");
        let b = crate::api::run_toml(src).expect("second run");
        assert_eq!(a.json, b.json, "the same source produced different JSON");
        assert!(a.summary.starts_with("ins-trn-coast |"));
        assert!(!a.svg.is_empty());
        assert_eq!(
            crate::api::ScenarioKind::classify(src).expect("classifies"),
            crate::api::ScenarioKind::InsTrnCoast
        );
    }
}
