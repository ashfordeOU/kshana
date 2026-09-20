// SPDX-License-Identifier: AGPL-3.0-only
//! `cislunar-arc-recovery` — an **independent estimator** test of the cislunar
//! arc-length observability threshold, built so that it does **not** consume the
//! measurement Jacobians the threshold was measured with.
//!
//! [`crate::cislunar_observability`] reports an arc length at which a single range-only
//! inter-satellite link makes a spacecraft's CR3BP state observable. That verdict is a
//! *rank* read on the stacked observability matrix `O = stack_k[H_k Φ_k]`, assembled from
//! the **analytic** range Jacobian rows ([`crate::intersat_range::range_row`]) and the
//! **analytic variational** state-transition matrix ([`crate::cr3bp::propagate_state_stm`]).
//! Its existing square-root-information-filter cross-check folds *those same rows*, so its
//! agreement is a consistency check between two numerical machines, not corroboration —
//! the released document says so itself.
//!
//! This module supplies the missing thing: a **batch least-squares estimator that actually
//! recovers the state**, and whose measurement partials are obtained by **central finite
//! differences of the composed forward model** rather than from any analytic expression.
//!
//! ## What is NOT shared with the Gramian
//! * **The measurement Jacobian.** No `*_row` function is called. The design matrix is a
//!   central finite difference of the map `x ↦ [h(t_0; x), …, h(t_K; x)]`, taken by the
//!   crate's generic batch corrector [`crate::batch_ls::gauss_newton`].
//! * **The variational STM.** [`crate::cr3bp::propagate_state_stm`] is never called. The
//!   state is re-propagated from each perturbed initial condition through the plain RK4
//!   flow, so the linearisation is a property of the *discrete flow*, not of an
//!   independently integrated 6×6 variational system.
//! * **The rank machinery.** No singular-value decomposition, no eigen-solver, no
//!   `rel_tol` singular-value threshold enters the estimator's verdict. The verdict is a
//!   *state recovery error*, measured in kilometres and millimetres per second.
//! * **The SRIF.** [`crate::cislunar_srif`] is not used.
//!
//! ## What IS shared (named, because it must be)
//! * **The dynamics model.** The same CR3BP field and the same RK4 propagator
//!   ([`crate::cr3bp::propagate_cr3bp`]) and the same mass ratio. Two estimators of the
//!   same physical problem cannot disagree about the physics and still be comparing
//!   anything.
//! * **The initial conditions.** The same differential-corrected constellation, taken from
//!   [`crate::cislunar_observability::CislunarObservabilityScenario::seed_states_spatial`],
//!   so the geometry under test is identical.
//! * **The scalar forward model.** The same observable — inter-satellite range
//!   ([`crate::intersat_range::intersat_range_spatial`]) or range rate. Its *derivative*
//!   is not shared; the function itself necessarily is, or the two analyses would be
//!   measuring different quantities.
//! * **The epoch grid convention.** `epochs` samples spanning `[0, arc_hours]`, swept as
//!   growing prefixes — the same convention the rank-vs-arc table uses, so the two arc
//!   lengths are directly comparable.
//!
//! ## Two criteria, because "observable" means two different things
//! * **Noise-free recovery** (the analogue of the *rank* criterion). With exact
//!   measurements, is the truth recoverable at all? A seeded ensemble of initial-state
//!   displacements is handed to the corrector, and an arc *recovers* when every trial's
//!   final state error falls to at most `recovery_factor` times the displacement it
//!   started from.
//! * **Monte-Carlo estimability** (the analogue of the *estimability* criterion). With a
//!   stated measurement sigma, a seeded ensemble of noise realisations is fitted and the
//!   empirical RMS position error is compared with a stated bound.
//!
//! Both bounds are swept, so the arbitrariness of each is visible rather than buried —
//! exactly as the Gramian path sweeps its own position bound.
//!
//! ## Validated vs Modelled
//! * **Validated.** The corrector is the crate's pre-existing, unit-tested weighted
//!   Gauss–Newton batch processor; its finite-difference design matrix is checked against
//!   the analytic rows *in this module's tests only* (never in the estimator), so the
//!   independence claim above is testable rather than asserted. The recovery error is a
//!   direct comparison against a known truth state, not a covariance prediction.
//! * **Modelled.** The constellation design, the epoch grid, the single tracked link, the
//!   displacement magnitude, and the two stated bounds.

use crate::batch_ls::gauss_newton;
use crate::cislunar_observability::CislunarObservabilityScenario;
use crate::cr3bp::{
    propagate_cr3bp, Cr3bpState, EARTH_MOON_DIST_KM, EARTH_MOON_MU, SIDEREAL_MONTH_DAYS,
};
use crate::intersat_range::{intersat_range_rate_spatial, intersat_range_spatial, SpatialState};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::Deserialize;

/// Planar CR3BP state dimension `[x, y, ẋ, ẏ]`.
const N_PLANAR: usize = 4;

/// Spatial CR3BP state dimension `[x, y, z, ẋ, ẏ, ż]`.
const N_SPATIAL: usize = 6;

/// The scalar inter-satellite observable the recovery estimator fits.
///
/// The Gramian's published arc-length threshold was measured on a **range-only** single
/// link, so [`RecoveryObservable::Range`] is the one whose boundary is directly comparable
/// with it. [`RecoveryObservable::RangeRate`] is a *different observable with different
/// partials*: it carries different information, so its boundary is a separate measurement
/// and is reported as such, never as corroboration of the range-only number.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub enum RecoveryObservable {
    /// Inter-satellite range `ρ = |r_a − r_b|` — the observable the published threshold
    /// was derived on.
    #[default]
    Range,
    /// Inter-satellite range rate `ρ̇ = û·(v_a − v_b)` — the Doppler observable.
    RangeRate,
}

impl RecoveryObservable {
    /// The scenario-facing name (`"range"`, `"range-rate"`).
    pub fn as_str(self) -> &'static str {
        match self {
            RecoveryObservable::Range => "range",
            RecoveryObservable::RangeRate => "range-rate",
        }
    }

    /// Parse an observable name, case-insensitively, accepting `range-rate` or
    /// `range_rate`. An unknown name is an error rather than a silent fallback.
    pub fn parse(s: &str) -> Result<Self, String> {
        match s.trim().to_ascii_lowercase().replace('_', "-").as_str() {
            "range" => Ok(RecoveryObservable::Range),
            "range-rate" => Ok(RecoveryObservable::RangeRate),
            other => Err(format!(
                "unknown observable `{other}`: expected one of range, range-rate"
            )),
        }
    }
}

/// The coordinate set the estimator's unknown state is parameterised in.
///
/// The Gramian works entirely in rotating-frame Cartesian components.
/// [`RecoveryCoordinates::Polar`] re-parameterises the *unknown* into Moon-centred polar
/// (planar) or cylindrical (spatial) coordinates, applying the transformation **to the
/// state** and re-differencing the forward model there — never transforming the Cartesian
/// partials. A smooth invertible change of coordinates cannot move an observability
/// boundary, so agreement between the two is a genuine invariance check on the verdict.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub enum RecoveryCoordinates {
    /// Rotating-frame Cartesian `[x, y, (z,) ẋ, ẏ, (ż)]` — the Gramian's own basis.
    #[default]
    Cartesian,
    /// Moon-centred polar `[r, θ, ṙ, θ̇]` (planar) or cylindrical `[r, θ, z, ṙ, θ̇, ż]`
    /// (spatial), with the Moon at the origin of the `(r, θ)` pair.
    Polar,
}

impl RecoveryCoordinates {
    /// The scenario-facing name (`"cartesian"`, `"polar"`).
    pub fn as_str(self) -> &'static str {
        match self {
            RecoveryCoordinates::Cartesian => "cartesian",
            RecoveryCoordinates::Polar => "polar",
        }
    }

    /// Parse a coordinate-set name, case-insensitively, accepting `cylindrical` as a
    /// synonym for `polar` (they are the same parameterisation at different widths).
    pub fn parse(s: &str) -> Result<Self, String> {
        match s.trim().to_ascii_lowercase().as_str() {
            "cartesian" => Ok(RecoveryCoordinates::Cartesian),
            "polar" | "cylindrical" => Ok(RecoveryCoordinates::Polar),
            other => Err(format!(
                "unknown coordinates `{other}`: expected one of cartesian, polar"
            )),
        }
    }
}

/// Moon-centred polar / cylindrical coordinates of a rotating-frame Cartesian state.
///
/// For a planar four-state `[x, y, ẋ, ẏ]` this returns `[r, θ, ṙ, θ̇]`; for a spatial
/// six-state `[x, y, z, ẋ, ẏ, ż]` it returns `[r, θ, z, ṙ, θ̇, ż]`. `r` and `θ` are taken
/// about the Moon at `(1 − μ, 0, 0)`; `z` and `ż` pass through unchanged. Returns `None`
/// for a state of any other width, or one sitting exactly on the Moon (where `θ` is
/// undefined).
pub fn cartesian_to_polar(s: &[f64], mu: f64) -> Option<Vec<f64>> {
    let (xi, eta, z, vx, vy, vz) = match s.len() {
        N_PLANAR => (s[0] - (1.0 - mu), s[1], 0.0, s[2], s[3], 0.0),
        N_SPATIAL => (s[0] - (1.0 - mu), s[1], s[2], s[3], s[4], s[5]),
        _ => return None,
    };
    let r = (xi * xi + eta * eta).sqrt();
    if r <= 0.0 || !r.is_finite() {
        return None;
    }
    let theta = eta.atan2(xi);
    let r_dot = (xi * vx + eta * vy) / r;
    let theta_dot = (xi * vy - eta * vx) / (r * r);
    Some(if s.len() == N_PLANAR {
        vec![r, theta, r_dot, theta_dot]
    } else {
        vec![r, theta, z, r_dot, theta_dot, vz]
    })
}

/// Rotating-frame Cartesian state of Moon-centred polar / cylindrical coordinates — the
/// exact inverse of [`cartesian_to_polar`]. Returns `None` for a vector of any width other
/// than four (planar `[r, θ, ṙ, θ̇]`) or six (spatial `[r, θ, z, ṙ, θ̇, ż]`).
pub fn polar_to_cartesian(q: &[f64], mu: f64) -> Option<Vec<f64>> {
    let (r, theta, z, r_dot, theta_dot, vz) = match q.len() {
        N_PLANAR => (q[0], q[1], 0.0, q[2], q[3], 0.0),
        N_SPATIAL => (q[0], q[1], q[2], q[3], q[4], q[5]),
        _ => return None,
    };
    let (c, s) = (theta.cos(), theta.sin());
    let x = r * c + (1.0 - mu);
    let y = r * s;
    let vx = r_dot * c - r * theta_dot * s;
    let vy = r_dot * s + r * theta_dot * c;
    Some(if q.len() == N_PLANAR {
        vec![x, y, vx, vy]
    } else {
        vec![x, y, z, vx, vy, vz]
    })
}

/// Rotating-frame time units per hour (`2π` time units = one sidereal month).
fn tu_per_hour() -> f64 {
    (1.0 / 24.0) / (SIDEREAL_MONTH_DAYS / (2.0 * std::f64::consts::PI))
}

/// Seconds in one rotating-frame time unit — the de-normaliser for a velocity.
fn tu_seconds() -> f64 {
    SIDEREAL_MONTH_DAYS * 86_400.0 / (2.0 * std::f64::consts::PI)
}

/// Millimetres per second in one nondimensional rotating-frame velocity unit.
fn mm_s_per_nd() -> f64 {
    EARTH_MOON_DIST_KM * 1.0e6 / tu_seconds()
}

/// March a six-state through the epoch grid with the plain RK4 CR3BP flow, returning the
/// state at every epoch.
///
/// This is the whole of the estimator's dynamics: no variational equations are integrated
/// and no state-transition matrix is formed. `steps` RK4 sub-steps are taken across each
/// inter-epoch interval, so the discretisation is uniform in time rather than growing with
/// the checkpoint index.
fn march(s0: &SpatialState, mu: f64, times: &[f64], steps: usize) -> Vec<SpatialState> {
    let mut st = Cr3bpState {
        r: [s0[0], s0[1], s0[2]],
        v: [s0[3], s0[4], s0[5]],
    };
    let mut out = Vec::with_capacity(times.len());
    let mut prev = 0.0;
    for &t in times {
        if t > prev {
            st = propagate_cr3bp(st, mu, t - prev, steps);
            prev = t;
        }
        out.push([st.r[0], st.r[1], st.r[2], st.v[0], st.v[1], st.v[2]]);
    }
    out
}

/// One arc prefix's recovery verdict — the estimator's analogue of a rank-vs-arc row.
#[derive(Clone, Debug)]
pub struct RecoveryArcPoint {
    /// Index of the last epoch in this growing prefix.
    pub epoch_index: usize,
    /// Elapsed arc time (rotating-frame time units).
    pub arc_time: f64,
    /// Number of scalar measurements in the prefix (one per epoch, single link).
    pub n_measurements: usize,
    /// `true` when the prefix carries fewer measurements than the state dimension, so no
    /// estimator of any kind can be run and the row carries no verdict.
    pub underdetermined: bool,
    /// Worst (over trials) final state error divided by the displacement the trial started
    /// from, for the **noise-free** leg. `None` when underdetermined or when a trial's
    /// normal matrix was singular.
    pub noise_free_worst_ratio: Option<f64>,
    /// `true` when every noise-free trial's ratio met the stated `recovery_factor`.
    pub noise_free_recovered: bool,
    /// Monte-Carlo RMS position recovery error over the noise realisations (km). `None`
    /// when underdetermined or when any trial failed to produce a finite estimate.
    pub mc_rms_position_km: Option<f64>,
    /// Monte-Carlo RMS velocity recovery error over the noise realisations (mm/s).
    pub mc_rms_velocity_mm_s: Option<f64>,
    /// Worst single-trial position recovery error over the noise realisations (km).
    pub mc_worst_position_km: Option<f64>,
    /// Number of trials (out of `trials`, counted over the Monte-Carlo leg) whose normal
    /// matrix was solvable and whose estimate came back finite.
    pub trials_solved: usize,
}

/// The computed recovery analysis.
struct Computed {
    mu: f64,
    arc_hours: f64,
    epochs: usize,
    steps: usize,
    spatial: bool,
    family: String,
    n_spacecraft: usize,
    state_dim: usize,
    observable: RecoveryObservable,
    coordinates: RecoveryCoordinates,
    trials: usize,
    seed: u64,
    displacement_nd: f64,
    recovery_factor: f64,
    sigma_nd: f64,
    sigma_range_m: f64,
    sigma_range_rate_mm_s: f64,
    error_bound_km: f64,
    max_iterations: usize,
    rel_tol: f64,
    grid_hours: f64,
    chief: SpatialState,
    reference: SpatialState,
    arc: Vec<RecoveryArcPoint>,
    claim: ClaimUnderTest,
}

/// The Gramian-side claim this run is tested against, quoted for comparison.
///
/// **It does not enter the estimator.** It is read back from a
/// [`CislunarObservabilityScenario`] configured on the identical grid, purely so the two
/// numbers appear side by side with their ratio, instead of the reader having to run two
/// scenarios and divide.
#[derive(Clone, Debug)]
pub struct ClaimUnderTest {
    /// The Gramian's rank-criterion arc-length threshold (hours), or `None` when that
    /// geometry never reaches full rank.
    pub rank_threshold_hours: Option<f64>,
    /// The Gramian's estimability-criterion arc-length threshold (hours) at the same
    /// position bound this run uses, or `None` when it is never met.
    pub estimability_threshold_hours: Option<f64>,
    /// `true` when the quoted rank threshold is measured on the same observable this run
    /// fits (range-only). For the range-rate observable it is `false` and the quoted
    /// number is context, not a claim under test.
    pub comparable: bool,
}

/// The honesty label carried on the result document.
const LABEL: &str = "MODELLED cislunar arc-length recovery test (independent-estimator \
corroboration of the P6 observability threshold). VALIDATED core: the estimator is the \
crate's pre-existing weighted Gauss-Newton batch corrector (crate::batch_ls), whose design \
matrix is a CENTRAL FINITE DIFFERENCE of the composed forward model - it calls no analytic \
measurement Jacobian row, no variational state-transition matrix, no singular-value or \
eigen decomposition, no rank tolerance and no square-root information filter, so its \
verdict does not restate the observability Gramian's; the verdict itself is a direct state \
RECOVERY ERROR against a known truth, in km and mm/s, not a predicted covariance; the \
initial conditions are the same differential-corrected periodic orbits the Gramian path \
uses, and the dynamics are the same RK4 CR3BP flow - both shared deliberately and named \
here, because two analyses of one physical problem must share the physics to be comparable \
at all. MODELLED: the constellation design, the epoch grid, the single tracked link, the \
displacement magnitude of the a-priori error, the measurement sigma, and the two stated \
bounds (recovery_factor and error_bound_km), each of which is swept so its arbitrariness \
is visible. Not a certified navigation-performance product.";

/// The `cislunar-arc-recovery` scenario. Every field is optional; with no fields the
/// analysis runs the released planar-DRO geometry on the published six-hour, 24-epoch grid.
#[derive(Clone, Debug, Default, Deserialize)]
pub struct CislunarArcRecoveryScenario {
    /// Earth–Moon mass ratio (default [`EARTH_MOON_MU`]).
    pub mu: Option<f64>,
    /// Tracking-arc length in hours (default 6.0 — the published grid).
    pub arc_hours: Option<f64>,
    /// Number of epochs sampled along the arc (default 24 — the published grid).
    pub epochs: Option<usize>,
    /// RK4 sub-steps per inter-epoch propagation (default 16).
    pub steps: Option<usize>,
    /// Estimate the full spatial six-state instead of the planar four-state (default
    /// `false`).
    pub spatial: Option<bool>,
    /// Orbit family the constellation rides: `"dro"` (default), `"halo"` or `"nrho"`.
    pub family: Option<String>,
    /// Number of spacecraft the constellation is built with, chief first (default 4). Only
    /// the chief and the first reference form the tracked link, exactly as in the
    /// Gramian's single-link arc; the count is carried so the two runs build identical
    /// constellations.
    pub n_spacecraft: Option<usize>,
    /// Which scalar observable to fit: `"range"` (default) or `"range-rate"`.
    pub observable: Option<String>,
    /// Coordinate set the unknown state is parameterised in: `"cartesian"` (default) or
    /// `"polar"`.
    pub coordinates: Option<String>,
    /// Monte-Carlo trials per arc prefix (default 32).
    pub trials: Option<usize>,
    /// Seed of the deterministic ChaCha8 stream that draws the displacements and the
    /// measurement noise (default 20_260_920).
    pub seed: Option<u64>,
    /// Magnitude of the a-priori state displacement each trial starts from, in
    /// nondimensional rotating-frame units (default 1e-5, i.e. ~3.84 km of position).
    pub displacement_nd: Option<f64>,
    /// Noise-free recovery bound: an arc recovers when every trial's final state error is
    /// at most this fraction of the displacement it started from (default 1e-2 — 99 % of
    /// the displacement removed).
    pub recovery_factor: Option<f64>,
    /// One-sigma range measurement noise for the Monte-Carlo leg, metres (default 1.0).
    /// Used only when `observable = "range"`.
    pub sigma_range_m: Option<f64>,
    /// One-sigma range-rate measurement noise for the Monte-Carlo leg, mm/s (default 1.0).
    /// Used only when `observable = "range-rate"`.
    pub sigma_range_rate_mm_s: Option<f64>,
    /// Monte-Carlo estimability bound: the RMS position recovery error the arc must drive
    /// below, km (default 1.0).
    pub error_bound_km: Option<f64>,
    /// Maximum Gauss–Newton iterations per trial (default 5).
    pub max_iterations: Option<usize>,
    /// Relative singular-value tolerance passed to the **quoted** Gramian comparison
    /// (default 1e-6, the published convention). It has no effect on the estimator.
    pub rel_tol: Option<f64>,
}

/// Noise-free recovery bounds the recovery criterion is swept over (fraction of the
/// initial displacement that must be removed).
const RECOVERY_FACTOR_SWEEP: [f64; 5] = [1e-1, 1e-2, 1e-3, 1e-4, 1e-5];

/// Position-error bounds the Monte-Carlo estimability criterion is swept over (km).
const ERROR_BOUND_SWEEP_KM: [f64; 5] = [1000.0, 100.0, 10.0, 1.0, 0.1];

impl CislunarArcRecoveryScenario {
    /// Run the scenario, returning `(json, summary, svg)`.
    pub fn run_output(&self) -> Result<(String, String, String), String> {
        let c = self.compute()?;
        Ok((json(&c)?, summary(&c), svg(&c)))
    }

    fn compute(&self) -> Result<Computed, String> {
        let mu = self.mu.unwrap_or(EARTH_MOON_MU);
        let arc_hours = self.arc_hours.unwrap_or(6.0);
        let epochs = self.epochs.unwrap_or(24);
        let steps = self.steps.unwrap_or(16);
        let spatial = self.spatial.unwrap_or(false);
        let family = self.family.clone().unwrap_or_else(|| "dro".to_string());
        let n_spacecraft = self.n_spacecraft.unwrap_or(4);
        let observable = match &self.observable {
            Some(s) => RecoveryObservable::parse(s)?,
            None => RecoveryObservable::default(),
        };
        let coordinates = match &self.coordinates {
            Some(s) => RecoveryCoordinates::parse(s)?,
            None => RecoveryCoordinates::default(),
        };
        let trials = self.trials.unwrap_or(32);
        let seed = self.seed.unwrap_or(20_260_920);
        let displacement_nd = self.displacement_nd.unwrap_or(1e-5);
        let recovery_factor = self.recovery_factor.unwrap_or(1e-2);
        let sigma_range_m = self.sigma_range_m.unwrap_or(1.0);
        let sigma_range_rate_mm_s = self.sigma_range_rate_mm_s.unwrap_or(1.0);
        let error_bound_km = self.error_bound_km.unwrap_or(1.0);
        let max_iterations = self.max_iterations.unwrap_or(5);
        let rel_tol = self.rel_tol.unwrap_or(1e-6);

        if !(arc_hours.is_finite() && arc_hours > 0.0) {
            return Err(format!(
                "arc_hours must be finite and positive, got {arc_hours}"
            ));
        }
        if epochs < 2 {
            return Err(format!("epochs must be ≥ 2, got {epochs}"));
        }
        if steps == 0 {
            return Err("steps must be ≥ 1".into());
        }
        if trials == 0 {
            return Err("trials must be ≥ 1".into());
        }
        if max_iterations == 0 {
            return Err("max_iterations must be ≥ 1".into());
        }
        if !(displacement_nd.is_finite() && displacement_nd > 0.0) {
            return Err(format!(
                "displacement_nd must be finite and positive, got {displacement_nd}"
            ));
        }
        if !(recovery_factor.is_finite() && recovery_factor > 0.0) {
            return Err(format!(
                "recovery_factor must be finite and positive, got {recovery_factor}"
            ));
        }
        if !(error_bound_km.is_finite() && error_bound_km > 0.0) {
            return Err(format!(
                "error_bound_km must be finite and positive, got {error_bound_km}"
            ));
        }
        let sigma_nd = match observable {
            RecoveryObservable::Range => {
                if !(sigma_range_m.is_finite() && sigma_range_m > 0.0) {
                    return Err(format!(
                        "sigma_range_m must be finite and positive, got {sigma_range_m}"
                    ));
                }
                sigma_range_m / (EARTH_MOON_DIST_KM * 1000.0)
            }
            RecoveryObservable::RangeRate => {
                if !(sigma_range_rate_mm_s.is_finite() && sigma_range_rate_mm_s > 0.0) {
                    return Err(format!(
                        "sigma_range_rate_mm_s must be finite and positive, got \
                         {sigma_range_rate_mm_s}"
                    ));
                }
                sigma_range_rate_mm_s / mm_s_per_nd()
            }
        };
        let state_dim = if spatial { N_SPATIAL } else { N_PLANAR };

        // The constellation is the Gramian path's own — deliberately shared, so the two
        // analyses look at one geometry. `seed_states_spatial` validates the family /
        // spacecraft-count combination and surfaces the same errors.
        let seeder = CislunarObservabilityScenario {
            spatial: Some(true),
            family: Some(family.clone()),
            n_spacecraft: Some(n_spacecraft),
            ..Default::default()
        };
        let members = seeder.seed_states_spatial()?;
        if members.len() < 2 {
            return Err("the constellation must carry at least a chief and one reference".into());
        }
        if !spatial {
            let planar = members
                .iter()
                .all(|m| m[2].abs() < 1e-12 && m[5].abs() < 1e-12);
            if !planar {
                return Err(format!(
                    "family `{family}` is an out-of-plane family and has no planar \
                     four-state representation: set spatial = true to sweep it"
                ));
            }
        }
        let chief = members[0];
        let reference = members[1];

        let arc_tu = arc_hours * tu_per_hour();
        let times: Vec<f64> = (0..epochs)
            .map(|k| arc_tu * (k as f64) / ((epochs - 1) as f64))
            .collect();
        let grid_hours = arc_hours / ((epochs - 1) as f64);

        // The reference spacecraft is not estimated, so its arc is propagated once.
        let ref_states = march(&reference, mu, &times, steps);

        // The composed forward model: unknown → (embed) → RK4 flow → scalar observable.
        // This closure is the ONLY thing the corrector sees; it finite-differences it.
        let embed = |x: &[f64]| -> Option<SpatialState> {
            let cart = match coordinates {
                RecoveryCoordinates::Cartesian => x.to_vec(),
                RecoveryCoordinates::Polar => polar_to_cartesian(x, mu)?,
            };
            Some(if spatial {
                [cart[0], cart[1], cart[2], cart[3], cart[4], cart[5]]
            } else {
                [cart[0], cart[1], 0.0, cart[2], cart[3], 0.0]
            })
        };
        let model = |x: &[f64], m: usize| -> Vec<f64> {
            let Some(s0) = embed(x) else {
                return vec![f64::NAN; m];
            };
            let cs = march(&s0, mu, &times[..m], steps);
            (0..m)
                .map(|k| match observable {
                    RecoveryObservable::Range => intersat_range_spatial(&cs[k], &ref_states[k]),
                    RecoveryObservable::RangeRate => {
                        intersat_range_rate_spatial(&cs[k], &ref_states[k])
                    }
                })
                .collect()
        };

        // The truth, in the estimation parameterisation.
        let truth_cart: Vec<f64> = if spatial {
            chief.to_vec()
        } else {
            vec![chief[0], chief[1], chief[3], chief[4]]
        };
        let truth_est = match coordinates {
            RecoveryCoordinates::Cartesian => truth_cart.clone(),
            RecoveryCoordinates::Polar => cartesian_to_polar(&truth_cart, mu).ok_or_else(|| {
                "the chief sits on the Moon: polar coordinates are singular".to_string()
            })?,
        };
        let z_clean = model(&truth_est, epochs);
        if z_clean.iter().any(|v| !v.is_finite()) {
            return Err("the forward model produced a non-finite truth measurement".into());
        }

        // One deterministic ChaCha8 stream draws every displacement direction and every
        // noise sample up front, so the whole sweep is reproducible and every arc prefix
        // sees the same ensemble.
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let normal = Normal::new(0.0, 1.0).map_err(|e| e.to_string())?;
        let mut directions: Vec<Vec<f64>> = Vec::with_capacity(trials);
        let mut noise: Vec<Vec<f64>> = Vec::with_capacity(trials);
        for _ in 0..trials {
            let mut d: Vec<f64> = (0..state_dim).map(|_| normal.sample(&mut rng)).collect();
            let nrm = d.iter().map(|v| v * v).sum::<f64>().sqrt();
            if nrm > 0.0 {
                for v in d.iter_mut() {
                    *v /= nrm;
                }
            }
            directions.push(d);
            noise.push(
                (0..epochs)
                    .map(|_| normal.sample(&mut rng) * sigma_nd)
                    .collect(),
            );
        }

        let km_per_nd = EARTH_MOON_DIST_KM;
        let vel_scale = mm_s_per_nd();
        let n_pos = state_dim / 2;
        let w_free = vec![1.0; epochs];
        let w_noisy = vec![1.0 / (sigma_nd * sigma_nd); epochs];

        let mut arc: Vec<RecoveryArcPoint> = Vec::with_capacity(epochs);
        for (k, &epoch_time) in times.iter().enumerate() {
            let m = k + 1;
            if m < state_dim {
                arc.push(RecoveryArcPoint {
                    epoch_index: k,
                    arc_time: epoch_time,
                    n_measurements: m,
                    underdetermined: true,
                    noise_free_worst_ratio: None,
                    noise_free_recovered: false,
                    mc_rms_position_km: None,
                    mc_rms_velocity_mm_s: None,
                    mc_worst_position_km: None,
                    trials_solved: 0,
                });
                continue;
            }
            let mut worst_ratio: Option<f64> = Some(0.0);
            let mut sum_pos2 = 0.0;
            let mut sum_vel2 = 0.0;
            let mut worst_pos: f64 = 0.0;
            let mut solved = 0usize;
            let mut mc_ok = true;
            for t in 0..trials {
                let start_cart: Vec<f64> = (0..state_dim)
                    .map(|j| truth_cart[j] + displacement_nd * directions[t][j])
                    .collect();
                let start = match coordinates {
                    RecoveryCoordinates::Cartesian => start_cart.clone(),
                    RecoveryCoordinates::Polar => match cartesian_to_polar(&start_cart, mu) {
                        Some(q) => q,
                        None => {
                            worst_ratio = None;
                            mc_ok = false;
                            continue;
                        }
                    },
                };

                // Leg 1 — noise-free: is the truth recoverable at all on this arc?
                match gauss_newton(
                    |x: &[f64]| model(x, m),
                    &z_clean[..m],
                    &w_free[..m],
                    &start,
                    max_iterations,
                    0.0,
                ) {
                    Some(r) => match to_cartesian_estimate(&r.x, coordinates, mu) {
                        Some(est) => {
                            let e = state_error(&est, &truth_cart);
                            match (worst_ratio, e.is_finite()) {
                                (Some(w), true) => worst_ratio = Some(w.max(e / displacement_nd)),
                                _ => worst_ratio = None,
                            }
                        }
                        None => worst_ratio = None,
                    },
                    None => worst_ratio = None,
                }

                // Leg 2 — Monte-Carlo: how well is it recovered at the stated sigma?
                let z_noisy: Vec<f64> = (0..m).map(|i| z_clean[i] + noise[t][i]).collect();
                match gauss_newton(
                    |x: &[f64]| model(x, m),
                    &z_noisy,
                    &w_noisy[..m],
                    &start,
                    max_iterations,
                    0.0,
                ) {
                    Some(r) => match to_cartesian_estimate(&r.x, coordinates, mu) {
                        Some(est) => {
                            let dp = (0..n_pos)
                                .map(|j| (est[j] - truth_cart[j]).powi(2))
                                .sum::<f64>()
                                .sqrt()
                                * km_per_nd;
                            let dv = (n_pos..state_dim)
                                .map(|j| (est[j] - truth_cart[j]).powi(2))
                                .sum::<f64>()
                                .sqrt()
                                * vel_scale;
                            if dp.is_finite() && dv.is_finite() {
                                solved += 1;
                                sum_pos2 += dp * dp;
                                sum_vel2 += dv * dv;
                                worst_pos = worst_pos.max(dp);
                            } else {
                                mc_ok = false;
                            }
                        }
                        None => mc_ok = false,
                    },
                    None => mc_ok = false,
                }
            }
            let denom = trials as f64;
            let recovered = worst_ratio.is_some_and(|w| w <= recovery_factor);
            arc.push(RecoveryArcPoint {
                epoch_index: k,
                arc_time: epoch_time,
                n_measurements: m,
                underdetermined: false,
                noise_free_worst_ratio: worst_ratio,
                noise_free_recovered: recovered,
                mc_rms_position_km: mc_ok.then(|| (sum_pos2 / denom).sqrt()),
                mc_rms_velocity_mm_s: mc_ok.then(|| (sum_vel2 / denom).sqrt()),
                mc_worst_position_km: mc_ok.then_some(worst_pos),
                trials_solved: solved,
            });
        }

        let claim = quote_claim(
            self,
            mu,
            arc_hours,
            epochs,
            spatial,
            &family,
            n_spacecraft,
            sigma_range_m,
            error_bound_km,
            rel_tol,
            observable,
        )?;

        Ok(Computed {
            mu,
            arc_hours,
            epochs,
            steps,
            spatial,
            family,
            n_spacecraft,
            state_dim,
            observable,
            coordinates,
            trials,
            seed,
            displacement_nd,
            recovery_factor,
            sigma_nd,
            sigma_range_m,
            sigma_range_rate_mm_s,
            error_bound_km,
            max_iterations,
            rel_tol,
            grid_hours,
            chief,
            reference,
            arc,
            claim,
        })
    }
}

/// Convert an estimate back to rotating-frame Cartesian components, whatever
/// parameterisation it was estimated in.
fn to_cartesian_estimate(x: &[f64], coordinates: RecoveryCoordinates, mu: f64) -> Option<Vec<f64>> {
    match coordinates {
        RecoveryCoordinates::Cartesian => Some(x.to_vec()),
        RecoveryCoordinates::Polar => polar_to_cartesian(x, mu),
    }
}

/// Euclidean norm of the difference of two equal-width states.
fn state_error(a: &[f64], b: &[f64]) -> f64 {
    a.iter()
        .zip(b)
        .map(|(&x, &y)| (x - y) * (x - y))
        .sum::<f64>()
        .sqrt()
}

/// Read the Gramian-side thresholds back from a [`CislunarObservabilityScenario`] on the
/// identical grid, purely for side-by-side reporting.
///
/// This is called **after** the estimator has finished and its result is never fed back
/// into it. It is the claim under test, quoted; not an input.
#[allow(clippy::too_many_arguments)]
fn quote_claim(
    _scn: &CislunarArcRecoveryScenario,
    mu: f64,
    arc_hours: f64,
    epochs: usize,
    spatial: bool,
    family: &str,
    n_spacecraft: usize,
    sigma_range_m: f64,
    error_bound_km: f64,
    rel_tol: f64,
    observable: RecoveryObservable,
) -> Result<ClaimUnderTest, String> {
    let gram = CislunarObservabilityScenario {
        mu: Some(mu),
        arc_hours: Some(arc_hours),
        epochs: Some(epochs),
        rel_tol: Some(rel_tol),
        spatial: Some(spatial),
        sigma_range_m: Some(sigma_range_m.max(f64::MIN_POSITIVE)),
        family: Some(family.to_string()),
        n_spacecraft: Some(n_spacecraft),
        sigma_pos_threshold_km: Some(error_bound_km),
        ..Default::default()
    };
    let (json, _summary, _svg) = gram.run_output()?;
    let doc: serde_json::Value = serde_json::from_str(&json).map_err(|e| e.to_string())?;
    let pick = |path: &str| -> Option<f64> {
        doc.get("arc_threshold")
            .and_then(|t| t.get(path))
            .and_then(|c| c.get("arc_hours"))
            .and_then(|v| v.as_f64())
    };
    Ok(ClaimUnderTest {
        rank_threshold_hours: pick("rank_criterion"),
        estimability_threshold_hours: pick("estimability_criterion"),
        comparable: observable == RecoveryObservable::Range,
    })
}

/// The first arc index at which every noise-free trial met the bound `factor`.
fn first_noise_free(arc: &[RecoveryArcPoint], factor: f64) -> Option<usize> {
    arc.iter()
        .position(|p| p.noise_free_worst_ratio.is_some_and(|w| w <= factor))
}

/// The first arc index at which the Monte-Carlo RMS position error met the bound `km`.
fn first_estimability(arc: &[RecoveryArcPoint], km: f64) -> Option<usize> {
    arc.iter()
        .position(|p| p.mc_rms_position_km.is_some_and(|e| e <= km))
}

/// A threshold report: the epoch a criterion is first met at, the arc length there, and the
/// bracket the epoch grid leaves it in — the true crossing lies in
/// `(bracket_low_hours, bracket_high_hours]`, never at a sharper resolution than the grid.
fn threshold_json(
    hit: Option<usize>,
    arc: &[RecoveryArcPoint],
    criterion: &str,
) -> serde_json::Value {
    let hours = |i: usize| arc[i].arc_time / tu_per_hour();
    match hit {
        Some(i) => serde_json::json!({
            "criterion": criterion,
            "reached": true,
            "epoch_index": i,
            "n_measurements": arc[i].n_measurements,
            "arc_hours": hours(i),
            "arc_time_tu": arc[i].arc_time,
            "bracket_low_hours": if i == 0 { 0.0 } else { hours(i - 1) },
            "bracket_high_hours": hours(i),
        }),
        None => serde_json::json!({
            "criterion": criterion,
            "reached": false,
            "epoch_index": serde_json::Value::Null,
            "n_measurements": serde_json::Value::Null,
            "arc_hours": serde_json::Value::Null,
            "arc_time_tu": serde_json::Value::Null,
            "note": "the criterion is not met anywhere on this arc — no boundary exists \
                     here, and none is extrapolated",
        }),
    }
}

/// `Some(x)` as a JSON number, `None` as JSON null — never a fabricated zero.
fn opt_json(v: Option<f64>) -> serde_json::Value {
    match v {
        Some(x) if x.is_finite() => serde_json::Value::from(x),
        _ => serde_json::Value::Null,
    }
}

fn json(c: &Computed) -> Result<String, String> {
    let hours = |t: f64| t / tu_per_hour();
    let arc: Vec<serde_json::Value> = c
        .arc
        .iter()
        .map(|p| {
            serde_json::json!({
                "epoch_index": p.epoch_index,
                "arc_time_tu": p.arc_time,
                "arc_hours": hours(p.arc_time),
                "n_measurements": p.n_measurements,
                "underdetermined": p.underdetermined,
                "noise_free_worst_ratio": opt_json(p.noise_free_worst_ratio),
                "noise_free_recovered": p.noise_free_recovered,
                "mc_rms_position_km": opt_json(p.mc_rms_position_km),
                "mc_rms_velocity_mm_s": opt_json(p.mc_rms_velocity_mm_s),
                "mc_worst_position_km": opt_json(p.mc_worst_position_km),
                "trials_solved": p.trials_solved,
            })
        })
        .collect();

    let nf_hit = first_noise_free(&c.arc, c.recovery_factor);
    let est_hit = first_estimability(&c.arc, c.error_bound_km);
    let nf_criterion = format!(
        "first arc length at which EVERY seeded trial's noise-free batch solve drives the \
         final state error to at most {:.6e} times the a-priori displacement it started \
         from. This is the recovery analogue of the rank criterion: with exact \
         measurements the question `is the state observable?` becomes `can an estimator \
         get it back?`, and no singular-value tolerance enters the answer.",
        c.recovery_factor
    );
    let est_criterion = format!(
        "first arc length at which the Monte-Carlo RMS position recovery error over {} \
         seeded noise realisations falls to or below {:.6} km. This is the recovery \
         analogue of the estimability criterion, measured rather than predicted: the error \
         is the distance from the estimate to the known truth, not the trace of a formal \
         covariance.",
        c.trials, c.error_bound_km
    );
    let nf_sweep: Vec<serde_json::Value> = RECOVERY_FACTOR_SWEEP
        .iter()
        .map(|&f| {
            let hit = first_noise_free(&c.arc, f);
            serde_json::json!({
                "recovery_factor": f,
                "reached": hit.is_some(),
                "epoch_index": hit.map(serde_json::Value::from).unwrap_or(serde_json::Value::Null),
                "arc_hours": hit.map(|i| serde_json::Value::from(hours(c.arc[i].arc_time))).unwrap_or(serde_json::Value::Null),
            })
        })
        .collect();
    let est_sweep: Vec<serde_json::Value> = ERROR_BOUND_SWEEP_KM
        .iter()
        .map(|&b| {
            let hit = first_estimability(&c.arc, b);
            serde_json::json!({
                "error_bound_km": b,
                "reached": hit.is_some(),
                "epoch_index": hit.map(serde_json::Value::from).unwrap_or(serde_json::Value::Null),
                "arc_hours": hit.map(|i| serde_json::Value::from(hours(c.arc[i].arc_time))).unwrap_or(serde_json::Value::Null),
            })
        })
        .collect();

    let nf_hours = nf_hit.map(|i| hours(c.arc[i].arc_time));
    let est_hours = est_hit.map(|i| hours(c.arc[i].arc_time));
    let ratio = |a: Option<f64>, b: Option<f64>| match (a, b) {
        (Some(x), Some(y)) if y != 0.0 => serde_json::Value::from(x / y),
        _ => serde_json::Value::Null,
    };
    let verdict = corroboration_verdict(c, nf_hours);

    let doc = serde_json::json!({
        "kind": "cislunar-arc-recovery",
        "label": LABEL,
        "mu": c.mu,
        "arc_hours": c.arc_hours,
        "epochs": c.epochs,
        "steps": c.steps,
        "epoch_grid_hours": c.grid_hours,
        "spatial": c.spatial,
        "family": c.family,
        "n_spacecraft": c.n_spacecraft,
        "state_dim": c.state_dim,
        "observable": c.observable.as_str(),
        "coordinates": c.coordinates.as_str(),
        "trials": c.trials,
        "seed": c.seed,
        "displacement_nd": c.displacement_nd,
        "displacement_km": c.displacement_nd * EARTH_MOON_DIST_KM,
        "recovery_factor": c.recovery_factor,
        "sigma_range_m": c.sigma_range_m,
        "sigma_range_rate_mm_s": c.sigma_range_rate_mm_s,
        "sigma_measurement_nd": c.sigma_nd,
        "error_bound_km": c.error_bound_km,
        "max_iterations": c.max_iterations,
        "link": {
            "chief_state": c.chief.to_vec(),
            "reference_state": c.reference.to_vec(),
            "state_order": "[x, y, z, xdot, ydot, zdot] (rotating frame, nondimensional)",
            "note": "Shared with the Gramian path by construction: these are the same \
                     differential-corrected periodic-orbit initial conditions, taken from \
                     cislunar_observability::seed_states_spatial, so both analyses look at \
                     one geometry. Only the chief is estimated; the reference arc is \
                     propagated once and held.",
        },
        "recovery_vs_arc": arc,
        "recovery_vs_arc_note": "One row per growing prefix of the same epoch grid the \
            rank-vs-arc table uses. `noise_free_worst_ratio` is the worst trial's final \
            state error divided by the displacement it started from; `mc_rms_position_km` \
            is the measured RMS distance from the estimate to the known truth over the \
            seeded noise ensemble. A prefix carrying fewer measurements than the state \
            dimension is marked `underdetermined` and left without a verdict rather than \
            being scored as a failure of the geometry.",
        "recovery_threshold": {
            "epoch_grid_hours": c.grid_hours,
            "noise_free_criterion": threshold_json(nf_hit, &c.arc, &nf_criterion),
            "estimability_criterion": threshold_json(est_hit, &c.arc, &est_criterion),
            "recovery_factor_sweep": nf_sweep,
            "error_bound_sweep": est_sweep,
            "note": "Neither boundary is resolved finer than epoch_grid_hours, so each is \
                     reported with the grid bracket it actually sits in. Both bounds are \
                     swept because both are stated engineering choices, not fitted ones.",
        },
        "claim_under_test": {
            "source": "cislunar-observability on the identical grid",
            "rel_tol": c.rel_tol,
            "comparable": c.claim.comparable,
            "gramian_rank_threshold_hours": opt_json(c.claim.rank_threshold_hours),
            "gramian_estimability_threshold_hours": opt_json(c.claim.estimability_threshold_hours),
            "estimator_noise_free_boundary_hours": opt_json(nf_hours),
            "estimator_estimability_boundary_hours": opt_json(est_hours),
            "rank_ratio_estimator_over_gramian": ratio(nf_hours, c.claim.rank_threshold_hours),
            "estimability_ratio_estimator_over_gramian": ratio(est_hours, c.claim.estimability_threshold_hours),
            "verdict": verdict,
            "note": "The Gramian numbers are QUOTED for comparison and are computed after \
                     the estimator has finished; they are never fed into it. When \
                     `comparable` is false the run fits a different observable from the one \
                     the published rank threshold was measured on, so the rank row is \
                     context, not a claim under test.",
        },
        "independence": {
            "not_shared": [
                "analytic measurement Jacobian rows (intersat_range::range_row / range_rate_row / their spatial forms)",
                "the variational state-transition matrix (cr3bp::propagate_state_stm and the observability_gramian bridges over it)",
                "the observability matrix / Gramian assembly (observability_gramian)",
                "singular-value and eigen decompositions, and the rel_tol rank convention",
                "the square-root information filter (cislunar_srif, deepspace_od::Srif)",
            ],
            "shared": [
                "the dynamics model: the CR3BP field and the RK4 propagator cr3bp::propagate_cr3bp, at the same mass ratio",
                "the initial conditions: the same differential-corrected constellation members",
                "the scalar forward model: the same range (or range-rate) function, whose DERIVATIVE is not shared",
                "the epoch-grid convention: growing prefixes of the same sampled arc",
            ],
            "partials": "central finite differences of the composed forward model, taken \
                         inside batch_ls::gauss_newton with a step of 1e-6 times the larger \
                         of |x_p| and 1 — no analytic expression is consulted",
            "note": "The dynamics and the forward model are shared deliberately. Two \
                     analyses of one physical problem must agree about the physics, or they \
                     are not comparing anything; what must not be shared, and is not, are \
                     the DERIVATIVES the observability verdict is built from.",
        },
        "units": units_json(),
    });
    serde_json::to_string_pretty(&doc).map_err(|e| e.to_string())
}

/// The honest one-line verdict on whether the estimator corroborates the quoted rank
/// threshold, stated as a comparison of two numbers rather than a badge.
fn corroboration_verdict(c: &Computed, nf_hours: Option<f64>) -> String {
    if !c.claim.comparable {
        return "not applicable: this run fits a different observable from the one the \
                published rank threshold was measured on, so its boundary is a separate \
                measurement, not a corroboration."
            .to_string();
    }
    match (nf_hours, c.claim.rank_threshold_hours) {
        (Some(e), Some(g)) => {
            let rel = (e - g).abs() / g;
            if rel <= 1.5 * c.grid_hours / g {
                format!(
                    "CORROBORATED within one epoch-grid step: the estimator recovers from \
                     {e:.6} h, the Gramian rank criterion turns at {g:.6} h (ratio \
                     {:.4}, grid {:.6} h).",
                    e / g,
                    c.grid_hours
                )
            } else {
                format!(
                    "NOT CORROBORATED as a recoverability boundary: the estimator recovers \
                     from {e:.6} h, {} the Gramian rank criterion's {g:.6} h (ratio \
                     {:.4}, grid {:.6} h). The rank criterion is a relative \
                     singular-value convention; the recovery boundary is a measured state \
                     error, and the two do not coincide here.",
                    if e < g { "well before" } else { "well after" },
                    e / g,
                    c.grid_hours
                )
            }
        }
        (None, Some(g)) => format!(
            "NOT CORROBORATED: the estimator never meets its recovery bound on this arc, \
             while the Gramian rank criterion turns at {g:.6} h."
        ),
        (Some(e), None) => format!(
            "the Gramian rank criterion is never met on this arc (the geometry never \
             reaches full rank), while the estimator recovers from {e:.6} h — the two \
             disagree about whether a boundary exists at all."
        ),
        (None, None) => "neither the Gramian rank criterion nor the estimator's recovery \
                         bound is met anywhere on this arc."
            .to_string(),
    }
}

/// Unit and provenance class for every numeric field the document emits (R3).
fn units_json() -> serde_json::Value {
    let mut a = serde_json::json!({
        "mu": {"unit": "fraction (dimensionless)", "provenance": "input", "note": "Earth-Moon mass ratio"},
        "arc_hours": {"unit": "h", "provenance": "input", "note": "total span of the sampled arc the prefixes are drawn from"},
        "epochs": {"unit": "count", "provenance": "input", "note": "measurement epochs on that arc, so prefix k carries k+1 measurements"},
        "steps": {"unit": "count", "provenance": "input", "note": "RK4 sub-steps per inter-epoch propagation"},
        "epoch_grid_hours": {"unit": "h", "provenance": "computed", "note": "arc_hours/(epochs-1); no boundary is resolved finer than this"},
        "n_spacecraft": {"unit": "count", "provenance": "input", "note": "constellation members; only the chief and reference 0 are linked"},
        "state_dim": {"unit": "count", "provenance": "computed", "note": "4 planar, 6 spatial"},
        "trials": {"unit": "count", "provenance": "input", "note": "seeded starts per prefix; every one must recover for the prefix to count"},
        "seed": {"unit": "count (opaque)", "provenance": "input", "note": "ChaCha8 stream seed"},
        "displacement_nd": {"unit": "nondimensional rotating-frame state units", "provenance": "input", "note": "how far the estimator is started from truth, as a fraction of the rotating-frame length unit — the a-priori error it has to remove"},
        "displacement_km": {"unit": "km", "provenance": "computed", "note": "displacement_nd x 384400 km; the position scale of the a-priori error"},
        "recovery_factor": {"unit": "fraction (dimensionless)", "provenance": "input", "note": "fraction of that displacement the final error must fall below for the prefix to count as recovered"},
        "sigma_range_m": {"unit": "m", "provenance": "input", "note": "1-sigma range measurement noise; used only when observable = range"},
        "sigma_range_rate_mm_s": {"unit": "mm/s", "provenance": "input", "note": "1-sigma range-rate measurement noise; used only when observable = range-rate"},
        "sigma_measurement_nd": {"unit": "nondimensional (length or velocity, per observable)", "provenance": "computed", "note": "the measurement sigma converted to rotating-frame units, which is what the weights actually use"},
        "error_bound_km": {"unit": "km", "provenance": "input", "note": "position-error bound the Monte-Carlo RMS must fall below for the estimability criterion"},
        "max_iterations": {"unit": "count", "provenance": "input", "note": "fixed Gauss-Newton iteration count; the tolerance is zero so the count is deterministic"},
        "link.chief_state[]": {"unit": "nondimensional rotating-frame state units", "provenance": "computed", "note": "differential-corrected periodic-orbit initial condition"},
        "link.reference_state[]": {"unit": "nondimensional rotating-frame state units", "provenance": "computed", "note": "the reference member's state at epoch zero, the other end of the single tracked link"},
    });
    let rest = serde_json::json!({
        "recovery_vs_arc[].epoch_index": {"unit": "count (index)", "provenance": "computed", "note": "which prefix this row is, counted from zero"},
        "recovery_vs_arc[].arc_time_tu": {"unit": "rotating-frame time units", "provenance": "computed", "note": "the prefix's span in rotating-frame time units"},
        "recovery_vs_arc[].arc_hours": {"unit": "h", "provenance": "computed", "note": "the prefix's span in hours"},
        "recovery_vs_arc[].n_measurements": {"unit": "count", "provenance": "computed", "note": "measurements in this prefix; below the state dimension the row is underdetermined and gets no verdict"},
        "recovery_vs_arc[].noise_free_worst_ratio": {"unit": "fraction (dimensionless)", "provenance": "computed", "note": "worst trial's final state error divided by its a-priori displacement; null when underdetermined or unsolvable"},
        "recovery_vs_arc[].mc_rms_position_km": {"unit": "km", "provenance": "computed", "note": "measured RMS distance from estimate to known truth over the noise ensemble"},
        "recovery_vs_arc[].mc_rms_velocity_mm_s": {"unit": "mm/s", "provenance": "computed", "note": "RMS velocity error over the noisy trials at this prefix"},
        "recovery_vs_arc[].mc_worst_position_km": {"unit": "km", "provenance": "computed", "note": "worst single-trial position error at this prefix, which is what a mean would hide"},
        "recovery_vs_arc[].trials_solved": {"unit": "count", "provenance": "computed", "note": "trials whose Gauss-Newton solve returned a state at all"},
        "recovery_threshold.epoch_grid_hours": {"unit": "h", "provenance": "computed", "note": "spacing of the prefix grid; no threshold is resolved finer than this, which is why each carries a bracket"},
        "recovery_threshold.noise_free_criterion.epoch_index": {"unit": "count (index)", "provenance": "computed", "note": "prefix at which noise-free recovery first holds"},
        "recovery_threshold.noise_free_criterion.n_measurements": {"unit": "count", "provenance": "computed", "note": "measurements available at that prefix"},
        "recovery_threshold.noise_free_criterion.arc_hours": {"unit": "h", "provenance": "computed", "note": "arc length at which every trial first recovers, noise-free"},
        "recovery_threshold.noise_free_criterion.arc_time_tu": {"unit": "rotating-frame time units", "provenance": "computed", "note": "the same boundary in rotating-frame time units"},
        "recovery_threshold.noise_free_criterion.bracket_low_hours": {"unit": "h", "provenance": "computed", "note": "last epoch NOT recovering; the true crossing lies above this"},
        "recovery_threshold.noise_free_criterion.bracket_high_hours": {"unit": "h", "provenance": "computed", "note": "first prefix that meets the criterion; the true crossing lies in (bracket_low, bracket_high]"},
        "recovery_threshold.estimability_criterion.epoch_index": {"unit": "count (index)", "provenance": "computed", "note": "prefix at which the measured RMS first falls below the bound"},
        "recovery_threshold.estimability_criterion.n_measurements": {"unit": "count", "provenance": "computed", "note": "measurements available at that prefix"},
        "recovery_threshold.estimability_criterion.arc_hours": {"unit": "h", "provenance": "computed", "note": "arc length at which the MEASURED Monte-Carlo RMS first meets the bound"},
        "recovery_threshold.estimability_criterion.arc_time_tu": {"unit": "rotating-frame time units", "provenance": "computed", "note": "the same boundary in rotating-frame time units"},
        "recovery_threshold.estimability_criterion.bracket_low_hours": {"unit": "h", "provenance": "computed", "note": "last prefix that failed the criterion"},
        "recovery_threshold.estimability_criterion.bracket_high_hours": {"unit": "h", "provenance": "computed", "note": "first prefix that met it; the crossing lies in between"},
        "recovery_threshold.recovery_factor_sweep[].recovery_factor": {"unit": "fraction (dimensionless)", "provenance": "input", "note": "the recovery fraction this sweep row was run at"},
        "recovery_threshold.recovery_factor_sweep[].epoch_index": {"unit": "count (index)", "provenance": "computed", "note": "prefix at which recovery first holds at that fraction"},
        "recovery_threshold.recovery_factor_sweep[].arc_hours": {"unit": "h", "provenance": "computed", "note": "the resulting boundary; flat across decades here, unlike the rank threshold's dependence on its own tolerance"},
        "recovery_threshold.error_bound_sweep[].error_bound_km": {"unit": "km", "provenance": "input", "note": "the position bound this sweep row was run at"},
        "recovery_threshold.error_bound_sweep[].epoch_index": {"unit": "count (index)", "provenance": "computed", "note": "prefix at which the measured RMS first meets that bound"},
        "recovery_threshold.error_bound_sweep[].arc_hours": {"unit": "h", "provenance": "computed", "note": "the resulting estimability boundary at that bound"},
        "claim_under_test.rel_tol": {"unit": "fraction (dimensionless)", "provenance": "input", "note": "relative singular-value tolerance of the QUOTED Gramian read; no effect on the estimator"},
        "claim_under_test.gramian_rank_threshold_hours": {"unit": "h", "provenance": "computed", "note": "the rank-criterion arc-length threshold, obtained by RUNNING cislunar-observability on the identical grid and reading its result — not transcribed. Computed by that pack, not by this one, and printed here only so the two verdicts sit side by side"},
        "claim_under_test.gramian_estimability_threshold_hours": {"unit": "h", "provenance": "computed", "note": "the estimability-criterion arc-length threshold from the same cislunar-observability run: the first arc at which the FORMAL 1-sigma position uncertainty falls below the stated bound, against which this pack's MEASURED Monte-Carlo boundary is compared"},
        "claim_under_test.estimator_noise_free_boundary_hours": {"unit": "h", "provenance": "computed", "note": "this pack's own recovery boundary, the number to set against the published rank threshold"},
        "claim_under_test.estimator_estimability_boundary_hours": {"unit": "h", "provenance": "computed", "note": "this pack's measured estimability boundary, the number to set against the formal one"},
        "claim_under_test.rank_ratio_estimator_over_gramian": {"unit": "ratio (dimensionless)", "provenance": "computed", "note": "estimator recovery boundary divided by the Gramian rank threshold; below one means the state is recoverable before the rank read says so"},
        "claim_under_test.estimability_ratio_estimator_over_gramian": {"unit": "ratio (dimensionless)", "provenance": "computed", "note": "measured boundary divided by the formal one; one means the covariance prediction is borne out"},
    });
    {
        let obj = a.as_object_mut().expect("units is an object");
        for (k, v) in rest.as_object().expect("units is an object") {
            obj.insert(k.clone(), v.clone());
        }
    }
    a
}

fn summary(c: &Computed) -> String {
    let hours = |i: usize| c.arc[i].arc_time / tu_per_hour();
    let nf = match first_noise_free(&c.arc, c.recovery_factor) {
        Some(i) => format!("{:.6} h", hours(i)),
        None => "never".to_string(),
    };
    let est = match first_estimability(&c.arc, c.error_bound_km) {
        Some(i) => format!("{:.6} h", hours(i)),
        None => "never".to_string(),
    };
    let gram = match c.claim.rank_threshold_hours {
        Some(g) => format!("{g:.6} h"),
        None => "never".to_string(),
    };
    let gram_est = match c.claim.estimability_threshold_hours {
        Some(g) => format!("{g:.6} h"),
        None => "never".to_string(),
    };
    let last = c.arc.last();
    format!(
        "cislunar-arc-recovery | {} family, {}-state, {} s/c, {} observable, {} \
         parameterisation | {:.1} h arc, {} epochs (grid {:.6} h), {} trials, seed {} | \
         finite-difference partials, no analytic Jacobian / STM / SVD / SRIF | noise-free \
         recovery from {} (factor {:.0e}) vs Gramian rank threshold {} | Monte-Carlo \
         estimability from {} (RMS pos ≤ {:.3} km, σ {:.3} m) vs Gramian estimability {} | \
         end-of-arc RMS pos {} km",
        c.family,
        c.state_dim,
        c.n_spacecraft,
        c.observable.as_str(),
        c.coordinates.as_str(),
        c.arc_hours,
        c.epochs,
        c.grid_hours,
        c.trials,
        c.seed,
        nf,
        c.recovery_factor,
        gram,
        est,
        c.error_bound_km,
        c.sigma_range_m,
        gram_est,
        last.and_then(|p| p.mc_rms_position_km)
            .map(|v| format!("{v:.4}"))
            .unwrap_or_else(|| "n/a".to_string()),
    )
}

/// Deterministic two-panel SVG: the Monte-Carlo RMS position recovery error against arc
/// length (left, log scale) with both the estimator's and the Gramian's boundaries marked,
/// and the noise-free worst-case recovery ratio (right, log scale) against the stated
/// recovery factor. Fixed-precision formatting so no last-ULP jitter can fork the bytes.
fn svg(c: &Computed) -> String {
    let (w, h) = (900.0_f64, 420.0_f64);
    let mut s = String::new();
    s.push_str(&format!(
        "<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" \
         font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"
    ));
    s.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    s.push_str(
        "<text x=\"24\" y=\"24\" font-size=\"15\" font-weight=\"bold\">Cislunar arc-length recovery — an estimator that does not share the Jacobians</text>",
    );
    s.push_str(
        "<text x=\"24\" y=\"40\" font-size=\"11\" fill=\"#8a8172\">finite-difference batch least squares · measured state recovery error · no analytic Jacobian, no variational STM, no SVD rank tolerance</text>",
    );

    let log_panel = |s: &mut String,
                     x0: f64,
                     title: &str,
                     vals: &[(f64, Option<f64>)],
                     bound: f64,
                     marker: Option<f64>,
                     marker_label: &str| {
        let (px, py, pw, ph) = (x0, 80.0_f64, 360.0_f64, 290.0_f64);
        let axis_y = py + ph;
        s.push_str(&format!(
            "<text x=\"{px:.0}\" y=\"{:.0}\" font-size=\"12\" fill=\"#8a8172\">{title}</text>",
            py - 8.0
        ));
        s.push_str(&format!(
            "<line x1=\"{px:.0}\" y1=\"{py:.0}\" x2=\"{px:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
        ));
        s.push_str(&format!(
            "<line x1=\"{px:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
            px + pw
        ));
        let finite: Vec<(f64, f64)> = vals
            .iter()
            .filter_map(|&(t, v)| v.filter(|x| x.is_finite() && *x > 0.0).map(|x| (t, x)))
            .collect();
        let lo = finite
            .iter()
            .map(|&(_, v)| v)
            .fold(f64::INFINITY, f64::min)
            .min(bound)
            .max(1e-30);
        let hi = finite
            .iter()
            .map(|&(_, v)| v)
            .fold(f64::NEG_INFINITY, f64::max)
            .max(bound);
        let (l0, l1) = (lo.log10() - 0.2, hi.log10() + 0.2);
        let span = (l1 - l0).max(1e-9);
        let tmax = vals.last().map(|&(t, _)| t).unwrap_or(1.0).max(1e-9);
        let xof = |t: f64| px + (t / tmax) * pw;
        let yof = |v: f64| axis_y - ((v.log10() - l0) / span) * ph;
        // bound line
        let by = yof(bound);
        s.push_str(&format!(
            "<line x1=\"{px:.0}\" y1=\"{by:.1}\" x2=\"{:.0}\" y2=\"{by:.1}\" stroke=\"#6b5b34\" stroke-dasharray=\"5 4\"/>",
            px + pw
        ));
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.1}\" text-anchor=\"end\" font-size=\"10\" fill=\"#6b5b34\">bound {bound:.3e}</text>",
            px + pw,
            by - 4.0
        ));
        if let Some(mk) = marker {
            let mx = xof(mk);
            s.push_str(&format!(
                "<line x1=\"{mx:.1}\" y1=\"{py:.0}\" x2=\"{mx:.1}\" y2=\"{axis_y:.0}\" stroke=\"#8a5a3a\" stroke-dasharray=\"3 4\"/>"
            ));
            s.push_str(&format!(
                "<text x=\"{:.1}\" y=\"{:.0}\" font-size=\"10\" fill=\"#8a5a3a\">{marker_label}</text>",
                mx + 4.0,
                py + 12.0
            ));
        }
        let mut path = String::new();
        for (i, &(t, v)) in finite.iter().enumerate() {
            path.push_str(&format!(
                "{}{:.1},{:.1}",
                if i == 0 { "M" } else { " L" },
                xof(t),
                yof(v)
            ));
        }
        if !path.is_empty() {
            s.push_str(&format!(
                "<path d=\"{path}\" fill=\"none\" stroke=\"#d9a441\" stroke-width=\"1.6\"/>"
            ));
        }
        for &(t, v) in &finite {
            s.push_str(&format!(
                "<circle cx=\"{:.1}\" cy=\"{:.1}\" r=\"2.2\" fill=\"#d9a441\"/>",
                xof(t),
                yof(v)
            ));
        }
        s.push_str(&format!(
            "<text x=\"{px:.0}\" y=\"{:.0}\" font-size=\"10\" fill=\"#6b6355\">0 h</text>",
            axis_y + 16.0
        ));
        s.push_str(&format!(
            "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"end\" font-size=\"10\" fill=\"#6b6355\">{tmax:.2} h</text>",
            px + pw,
            axis_y + 16.0
        ));
    };

    let hours = |t: f64| t / tu_per_hour();
    let mc: Vec<(f64, Option<f64>)> = c
        .arc
        .iter()
        .map(|p| (hours(p.arc_time), p.mc_rms_position_km))
        .collect();
    let nf: Vec<(f64, Option<f64>)> = c
        .arc
        .iter()
        .map(|p| (hours(p.arc_time), p.noise_free_worst_ratio))
        .collect();
    log_panel(
        &mut s,
        60.0,
        "Monte-Carlo RMS position recovery error (km)",
        &mc,
        c.error_bound_km,
        c.claim.rank_threshold_hours,
        "Gramian rank threshold",
    );
    log_panel(
        &mut s,
        500.0,
        "noise-free worst recovery ratio (final error / displacement)",
        &nf,
        c.recovery_factor,
        c.claim.rank_threshold_hours,
        "Gramian rank threshold",
    );
    s.push_str("</svg>");
    s
}

#[cfg(test)]
mod tests {
    use super::*;

    /// The polar / cylindrical transform round-trips to machine precision in both widths —
    /// the invertibility the alternative parameterisation rests on.
    #[test]
    fn polar_round_trips_in_both_widths() {
        let mu = EARTH_MOON_MU;
        let planar = [1.05, 0.04, 0.11, -0.47];
        let q = cartesian_to_polar(&planar, mu).expect("planar polar");
        let back = polar_to_cartesian(&q, mu).expect("planar cartesian");
        for j in 0..4 {
            assert!(
                (back[j] - planar[j]).abs() < 1e-14,
                "planar round-trip [{j}]: {} vs {}",
                back[j],
                planar[j]
            );
        }
        let spatial = [1.05, 0.04, -0.12, 0.11, -0.47, 0.06];
        let q6 = cartesian_to_polar(&spatial, mu).expect("spatial cylindrical");
        let back6 = polar_to_cartesian(&q6, mu).expect("spatial cartesian");
        for j in 0..6 {
            assert!(
                (back6[j] - spatial[j]).abs() < 1e-14,
                "spatial round-trip [{j}]: {} vs {}",
                back6[j],
                spatial[j]
            );
        }
        assert!(cartesian_to_polar(&[0.0, 0.0, 0.0], mu).is_none());
        assert!(polar_to_cartesian(&[0.0, 0.0, 0.0], mu).is_none());
    }

    /// Name parsing is strict: an unknown observable or coordinate set is an error, never a
    /// silent fallback to the default.
    #[test]
    fn unknown_names_are_errors() {
        assert!(RecoveryObservable::parse("range").is_ok());
        assert_eq!(
            RecoveryObservable::parse("range_rate"),
            Ok(RecoveryObservable::RangeRate)
        );
        assert!(RecoveryObservable::parse("doppler").is_err());
        assert_eq!(
            RecoveryCoordinates::parse("CYLINDRICAL"),
            Ok(RecoveryCoordinates::Polar)
        );
        assert!(RecoveryCoordinates::parse("keplerian").is_err());
    }

    /// The default run produces a well-formed document whose every numeric leaf carries a
    /// unit **and** a provenance class (R3). The walk is exhaustive: any new numeric field
    /// added without a `units` entry fails this test.
    #[test]
    fn every_emitted_numeric_field_has_a_unit_and_a_provenance() {
        let scn = CislunarArcRecoveryScenario {
            // A cheap configuration: the R3 contract is about the schema, not the sample
            // size, and this keeps the unit test fast.
            trials: Some(2),
            epochs: Some(6),
            ..Default::default()
        };
        let (json, _summary, _svg) = scn.run_output().expect("runs");
        let doc: serde_json::Value = serde_json::from_str(&json).expect("valid json");
        let units = doc.get("units").expect("units block").clone();
        let mut paths: Vec<String> = Vec::new();
        collect_numeric_paths(&doc, "", &mut paths);
        let mut missing: Vec<String> = Vec::new();
        for p in &paths {
            // `units` describes the other blocks; it carries no numbers of its own.
            if p.starts_with("units") {
                continue;
            }
            match units.get(p) {
                Some(entry) => {
                    let has_unit = entry.get("unit").and_then(|v| v.as_str()).is_some();
                    let has_prov = entry.get("provenance").and_then(|v| v.as_str()).is_some();
                    if !(has_unit && has_prov) {
                        missing.push(format!("{p} (unit={has_unit}, provenance={has_prov})"));
                    }
                }
                None => missing.push(format!("{p} (no units entry)")),
            }
        }
        assert!(
            missing.is_empty(),
            "emitted numeric field(s) without a unit and a provenance class:\n  {}",
            missing.join("\n  ")
        );
        assert!(!paths.is_empty(), "the walk found no numeric fields at all");
    }

    /// Collect every numeric leaf's path, with array indices collapsed to `[]` so one
    /// `units` entry covers a whole table column.
    fn collect_numeric_paths(v: &serde_json::Value, path: &str, out: &mut Vec<String>) {
        match v {
            serde_json::Value::Number(_) => {
                if !out.iter().any(|p| p == path) {
                    out.push(path.to_string());
                }
            }
            serde_json::Value::Array(a) => {
                for e in a {
                    collect_numeric_paths(e, &format!("{path}[]"), out);
                }
            }
            serde_json::Value::Object(o) => {
                for (k, e) in o {
                    let next = if path.is_empty() {
                        k.clone()
                    } else {
                        format!("{path}.{k}")
                    };
                    collect_numeric_paths(e, &next, out);
                }
            }
            _ => {}
        }
    }

    /// The estimator is deterministic: the same scenario run twice produces byte-identical
    /// output, so the Monte-Carlo verdict is reproducible rather than a lottery.
    #[test]
    fn the_run_is_deterministic() {
        let scn = CislunarArcRecoveryScenario {
            trials: Some(3),
            epochs: Some(8),
            ..Default::default()
        };
        let a = scn.run_output().expect("runs");
        let b = scn.run_output().expect("runs");
        assert_eq!(a.0, b.0, "JSON differs between two runs of one scenario");
        assert_eq!(a.1, b.1, "summary differs between two runs");
        assert_eq!(a.2, b.2, "SVG differs between two runs");
    }

    /// A prefix carrying fewer measurements than the state dimension is reported as
    /// `underdetermined` with no verdict, never as a failure of the geometry.
    #[test]
    fn underdetermined_prefixes_carry_no_verdict() {
        let scn = CislunarArcRecoveryScenario {
            trials: Some(2),
            epochs: Some(6),
            ..Default::default()
        };
        let (json, _s, _v) = scn.run_output().expect("runs");
        let doc: serde_json::Value = serde_json::from_str(&json).expect("valid json");
        let arc = doc["recovery_vs_arc"].as_array().expect("arc array");
        for (k, row) in arc.iter().enumerate() {
            let under = row["underdetermined"].as_bool().expect("flag");
            assert_eq!(under, k + 1 < 4, "row {k} underdetermined flag");
            if under {
                assert!(row["noise_free_worst_ratio"].is_null());
                assert!(row["mc_rms_position_km"].is_null());
            }
        }
    }

    /// Validation rejects out-of-range inputs by name rather than running a nonsense study.
    #[test]
    fn invalid_inputs_are_rejected() {
        let bad = |f: fn(&mut CislunarArcRecoveryScenario)| {
            let mut s = CislunarArcRecoveryScenario {
                trials: Some(1),
                epochs: Some(5),
                ..Default::default()
            };
            f(&mut s);
            s.run_output().expect_err("must be rejected")
        };
        assert!(bad(|s| s.arc_hours = Some(0.0)).contains("arc_hours"));
        assert!(bad(|s| s.epochs = Some(1)).contains("epochs"));
        assert!(bad(|s| s.trials = Some(0)).contains("trials"));
        assert!(bad(|s| s.displacement_nd = Some(-1.0)).contains("displacement_nd"));
        assert!(bad(|s| s.recovery_factor = Some(0.0)).contains("recovery_factor"));
        assert!(bad(|s| s.error_bound_km = Some(f64::NAN)).contains("error_bound_km"));
        assert!(bad(|s| s.observable = Some("doppler".into())).contains("observable"));
        assert!(bad(|s| s.coordinates = Some("keplerian".into())).contains("coordinates"));
        assert!(bad(|s| s.family = Some("halo".into())).contains("out-of-plane"));
    }

    /// INDEPENDENCE CHECK — the estimator's finite-difference design matrix agrees with the
    /// analytic rows the Gramian uses, to the accuracy a central difference can reach.
    ///
    /// This is deliberately a *test-only* comparison. It proves the two routes compute the
    /// same derivative (so the recovery verdict is not built on a broken linearisation)
    /// **and** that the analytic route is genuinely absent from the estimator: the analytic
    /// rows are imported here, in `#[cfg(test)]`, and nowhere in the module body.
    #[test]
    fn finite_difference_partials_match_the_analytic_rows_the_gramian_uses() {
        use crate::intersat_range::range_row_spatial;
        let seeder = CislunarObservabilityScenario {
            spatial: Some(true),
            ..Default::default()
        };
        let members = seeder.seed_states_spatial().expect("constellation");
        let (chief, reference) = (members[0], members[1]);
        // At t = 0 the composed forward model reduces to the bare measurement function, so
        // its finite difference must reproduce the analytic measurement row directly.
        let (_rho, analytic) = range_row_spatial(&chief, &reference);
        let eps = 1e-7;
        for j in 0..6 {
            let mut plus = chief;
            let mut minus = chief;
            plus[j] += eps;
            minus[j] -= eps;
            let fd = (intersat_range_spatial(&plus, &reference)
                - intersat_range_spatial(&minus, &reference))
                / (2.0 * eps);
            assert!(
                (fd - analytic[j]).abs() < 1e-6,
                "component {j}: finite difference {fd} vs analytic {}",
                analytic[j]
            );
        }
    }

    /// R1 — the released `cislunar-observability` default document is untouched by this
    /// module. Its summary line, which carries the rank progression, the Gramian spectrum
    /// and the SRIF transition epoch, is pinned verbatim.
    #[test]
    fn the_released_observability_default_is_unchanged() {
        let (_json, summary, _svg) = CislunarObservabilityScenario::default()
            .run_output()
            .expect("the released default runs");
        assert_eq!(
            summary,
            "cislunar-observability | 4 s/c (3 refs) | 6.0 h arc, 24 epochs | rank 1 → 4 \
             of 4 over arc | Gramian λ [2.92e-11…5.98e-2] cond 2.05e9 | instantaneous rank \
             range-only 2 → range+rate 4 (3 links) | GDOP range-only undefined range+rate \
             6.353 | DRO ICs (max periodicity residual 4.7e-9) | SRIF posterior finite at \
             rank-4 epoch 8 (Validated rank/STM/DRO-closure/SRIF, Modelled design)",
            "the released cislunar-observability default document moved — R1 is additive \
             only"
        );
    }
}
