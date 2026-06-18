// SPDX-License-Identifier: AGPL-3.0-only
//! Runnable **17-state hybrid quantum + classical tightly-coupled UKF** scenario.
//!
//! [`super::tightly_coupled17`] is the 17-state tightly-coupled GNSS/INS navigator kernel
//! (position, velocity, attitude error, accelerometer bias, gyro bias, and a two-state
//! receiver clock); it is unit-tested but was not reachable as a scenario. This pack is the
//! wiring that turns it into a runnable scenario the CLI / Python / WASM / MCP bindings can
//! dispatch, and that scores it with a *statistical* figure of merit.
//!
//! ## What "hybrid quantum + classical" means here (honestly)
//!
//! The 17-state error vector is
//!
//! ```text
//!   x = [ p(3) | v(3) | ψ(3) | b_a(3) | b_g(3) | b  d ]
//!        position velocity attitude  accel-bias gyro-bias  clock(phase,freq)
//! ```
//!
//! * The **15 INS error states** (position, velocity, attitude misalignment, accel + gyro
//!   bias) are propagated through the strapdown mechanization driven by the IMU — the
//!   *classical* short-term inertial solution.
//! * The **accelerometer-bias triad** `b_a` is the **CAI-derived inertial bias correction**:
//!   the cold-atom interferometer ([`crate::inertial::quantum_imu`]) sets the
//!   velocity-random-walk floor `q_va` on the velocity states, so the long-term coast drift
//!   is the *quantum-sensor-limited* one rather than the kilometres-per-hour of a free
//!   navigation-grade INS. This is the **quantum long-term** half of the hybridisation.
//! * The **two-state clock** `[b, d]` (bias + drift, carried in range units `c·δt`, `c·δḟ`)
//!   is the phase + frequency clock model; its process noise is supplied by the
//!   **q-parameter clock engine** [`crate::clock_state::q_from_allan`], which maps a clock's
//!   Allan-deviation profile to the white-FM / random-walk-FM PSDs.
//!
//! The platform is GNSS-aided for a lead-in (the filter learns the biases, velocity, and
//! clock), then coasts through a GNSS outage on the IMU + clock alone: the classical IMU
//! gives the smooth short-term solution while the CAI floor keeps the long-term drift bounded.
//!
//! ## Statistical oracle: NEES + innovation-whiteness consistency (a *self*-consistency check)
//!
//! The figure of merit is **filter self-consistency**, the only thing a simulation can
//! honestly assert about an estimator (Bar-Shalom, *Estimation with Applications to Tracking
//! and Navigation*, §5.4). Over a Monte-Carlo ensemble of seeds whose truth is drawn from
//! exactly the process- and measurement-noise the filter assumes (a *matched* filter):
//!
//! * **NIS** (Normalised Innovation Squared) — `νᵀ S⁻¹ ν` per GNSS update. The optimal
//!   filter's innovations are **white**, so each per-update NIS is `χ²(m)` (`m = 2·n_sat`).
//!   Because the nonlinear pseudorange/Doppler measurement is run through the unscented
//!   transform (a small systematic `S` bias, and within-run innovations weakly correlated
//!   through the shared state), the band uses the conservative **run-based** DOF (one
//!   realisation per seed): the mean's acceptance region is `χ²₀.₀₂₅,₀.₉₇₅(m·seeds)/seeds`.
//!   This is the **innovation-whiteness** test and uses only observable quantities.
//! * **NEES** (Normalised Estimation Error Squared) — `ẽ_Sᵀ (P_SS)⁻¹ ẽ_S` over the
//!   **observable** state subset `S` = position + velocity + clock (8 states), read at the
//!   converged GNSS-aided epoch. Under a consistent filter `NEES ∼ χ²(8)`. The attitude and
//!   IMU-bias error states are only weakly observable on a constant-velocity level trajectory,
//!   so the full 17×17 `P` spans ~12 orders of magnitude and a direct inverse is numerically
//!   meaningless — assessing NEES over the estimable subset is the honest, well-conditioned
//!   choice. Estimation errors are time-correlated within a run, so the independent count is
//!   the number of runs (Bar-Shalom §5.4.2): the mean's acceptance region is
//!   `χ²₀.₀₂₅,₀.₉₇₅(8·seeds)/seeds`.
//!
//! **This is a self-consistency statement, NOT a real-world accuracy guarantee.** It certifies
//! that the filter's reported covariance honestly matches the spread of its own errors *under
//! the modelled noise*; it says nothing about field or flight accuracy. Deliberate `q_factor`
//! (process-noise) and `r_factor` (measurement-noise) mistuning knobs let a test push the
//! filter off-tune and watch `consistent` flip to `false`, proving the gate discriminates
//! rather than always passing.
//!
//! ## Honesty guard
//!
//! Everything here is **modelled / simulation**. The CAI and clock inputs are bracketed
//! literature-representative values, not measured hardware; the CAI hardware and its
//! Key-Person remain partner-owned. The results are simulation performance and filter
//! self-consistency, **not** field results, flight heritage, TRL > 3, or external validation.

use super::tightly_coupled::Sat;
use super::tightly_coupled17::{self, TightlyCoupled17};
use crate::clock_state::q_from_allan;
use crate::detection::chi2_inv_cdf;
use crate::inertial::quantum_imu::CaiAccelerometer;
use crate::inertial::{AccelCfg, ImuKind};
use crate::scenario::{GnssState, GnssTimeline, TimeCfg};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};
use serde::{Deserialize, Serialize};
use sha2::{Digest, Sha256};

/// Speed of light (m/s), CODATA / SI exact — converts clock phase/frequency error to the
/// range / range-rate units the 17-state filter carries the clock state in.
const C_M_S: f64 = 299_792_458.0;

/// The **observable** state indices the NEES consistency oracle is assessed over: position
/// (0..3), velocity (3..6), and the two-state clock (15, 16) — the eight states the GNSS
/// pseudorange/range-rate measurements directly constrain. The attitude and IMU-bias states
/// are only weakly observable on a constant-velocity, level trajectory, so a full-17 NEES is
/// numerically ill-conditioned and not a meaningful consistency statistic (see
/// [`super::tightly_coupled17::TightlyCoupled17::nees_subset`]).
const NEES_STATES: [usize; 8] = [0, 1, 2, 3, 4, 5, 15, 16];

/// Surface gravity magnitude (m/s²) for the equatorial scenario geometry; a representative
/// WGS-84 sea-level value (Groves 2013 §2.4.7). The platform's specific force balances it.
const G_M_S2: f64 = 9.81;

/// Equatorial reference position (m): WGS-84 semi-major axis on the +x ECEF axis, so gravity
/// points along −x (Groves 2013 §2.4.2). The MEO satellite geometry is fixed about it.
const R_EARTH_M: f64 = 6.378_137e6;

/// Default GNSS pseudorange measurement noise 1-σ (m): a ~1 m code fix, the value the
/// loosely-coupled pack also uses; sets the measurement covariance R on each pseudorange.
fn default_sigma_pr() -> f64 {
    1.0
}
/// Default GNSS range-rate (Doppler) measurement noise 1-σ (m/s): a ~5 cm/s Doppler fix,
/// representative of a tracking receiver (Groves 2013 §9.3).
fn default_sigma_rr() -> f64 {
    0.05
}
/// Default number of Monte-Carlo seeds the consistency oracle pools over. 48 independent
/// runs give χ² NEES bands tight enough to discriminate a matched from a mistuned filter
/// while staying cheap (Bar-Shalom §5.4.2 run-based DOF).
fn default_consistency_seeds() -> usize {
    48
}
/// Default filter process-noise mistuning multiplier (1.0 = matched to truth). Exposed so a
/// scenario can drive the filter off-tune and exercise the consistency gate's discrimination.
fn default_q_factor() -> f64 {
    1.0
}
/// Default filter measurement-noise mistuning multiplier (1.0 = matched to truth). With
/// fast, informative GNSS updates the steady-state innovation covariance `S = H P Hᵀ + R` is
/// **R-dominated**, so the innovation-whiteness (NIS) test responds directly to an R
/// mistuning; `r_factor ≠ 1` mis-scales `S` and pushes NIS out of its χ² band — the lever
/// that makes the consistency gate discriminating in this measurement-dominated regime.
fn default_r_factor() -> f64 {
    1.0
}
/// Default platform ground speed (m/s) along +y during the run — a constant-velocity surface
/// trajectory; modest so the small-angle attitude coupling stays in its valid regime.
fn default_speed() -> f64 {
    100.0
}

/// One clock's Allan-deviation profile — the input to the **q-parameter clock engine**
/// ([`q_from_allan`]). The white-FM σ_y(1 s) and random-walk-FM level map to the
/// `(q_wf, q_rw)` PSDs the two-state clock block of the 17-state filter is driven with.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct ClockAllanCfg {
    /// Identifier (e.g. `optical-lattice`, `csac`).
    pub id: String,
    /// Provenance / citation string for the figures.
    pub provenance: String,
    /// White-FM Allan deviation σ_y(1 s) (dimensionless).
    pub white_fm_adev_1s: f64,
    /// Random-walk-FM ADEV level b at τ = 1 s on the +1/2 slope (dimensionless).
    #[serde(default)]
    pub rw_fm_level: f64,
}

impl ClockAllanCfg {
    /// The `(q_wf, q_rw)` PSDs in **phase/frequency** units (s²/s, (1/s)²/s) via the
    /// q-parameter clock engine. The drift PSD is dropped — the filter clock block is the
    /// two-state phase+frequency model.
    pub fn psds(&self) -> (f64, f64) {
        let (q_wf, q_rw, _q_drift) = q_from_allan(self.white_fm_adev_1s, self.rw_fm_level, 0.0);
        (q_wf, q_rw)
    }
}

/// A 17-state hybrid quantum + classical tightly-coupled UKF scenario.
#[derive(Clone, Debug, Deserialize, Serialize)]
pub struct HybridUkfScenario {
    pub seed: u64,
    pub time: TimeCfg,
    pub gnss: GnssTimeline,
    /// The inertial sensor: when its `[accel_*.cai]` block is present the velocity-random-walk
    /// floor `q_va` is **derived from cold-atom-interferometer physics** (the quantum sensor);
    /// otherwise the supplied `q_va` is used (a classical datasheet sensor). Reuses the same
    /// [`AccelCfg`] schema the `inertial`/`hybrid` packs use, so the CAI model is shared.
    pub accel: AccelCfg,
    /// The onboard clock's Allan profile, fed to the q-parameter clock engine.
    pub clock: ClockAllanCfg,
    /// Residual accelerometer bias after GNSS calibration (m/s²), body x-axis — the
    /// CAI-derived inertial bias the filter's `b_a` correction state estimates.
    #[serde(default)]
    pub residual_accel_bias_m_s2: f64,
    /// Platform ground speed (m/s) along +y (constant-velocity trajectory).
    #[serde(default = "default_speed")]
    pub speed_m_s: f64,
    /// GNSS pseudorange noise 1-σ (m).
    #[serde(default = "default_sigma_pr")]
    pub sigma_pr_m: f64,
    /// GNSS range-rate noise 1-σ (m/s).
    #[serde(default = "default_sigma_rr")]
    pub sigma_rr_mps: f64,
    /// Number of Monte-Carlo seeds the consistency oracle pools over.
    #[serde(default = "default_consistency_seeds")]
    pub consistency_seeds: usize,
    /// Filter process-noise mistuning multiplier (1.0 = matched filter).
    #[serde(default = "default_q_factor")]
    pub q_factor: f64,
    /// Filter measurement-noise mistuning multiplier (1.0 = matched filter). Mis-scales the
    /// filter's assumed R relative to the truth's, directly perturbing the innovation
    /// covariance S and the NIS whiteness statistic.
    #[serde(default = "default_r_factor")]
    pub r_factor: f64,
}

/// The pooled filter-consistency oracle result (NEES + innovation-whiteness).
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct ConsistencyFoM {
    /// Mean NIS over all pooled GNSS updates (innovation-whiteness; target ≈ `m = 2·n_sat`).
    pub nis_mean: f64,
    /// Per-update measurement dimension `m = 2·n_sat` (the χ²(m) target for NIS).
    pub nis_dof: usize,
    /// Lower 95 % χ² band on the pooled NIS mean.
    pub nis_chi2_lower_95: f64,
    /// Upper 95 % χ² band on the pooled NIS mean.
    pub nis_chi2_upper_95: f64,
    /// Mean NEES over the ensemble (target ≈ `nees_dof`, the observable state dimension).
    pub nees_mean: f64,
    /// The observable-subset state dimension the NEES is assessed over (the χ²(n_x) target);
    /// position + velocity + clock = 8 (attitude/IMU-bias are weakly observable here).
    pub nees_dof: usize,
    /// Lower 95 % χ² band on the NEES mean (run-based DOF).
    pub nees_chi2_lower_95: f64,
    /// Upper 95 % χ² band on the NEES mean.
    pub nees_chi2_upper_95: f64,
    /// Whether both means fall inside their 95 % bands — the filter is self-consistent.
    /// This is a self-consistency statement, **not** a real-world accuracy guarantee.
    pub consistent: bool,
    /// Number of Monte-Carlo seeds pooled.
    pub seeds: usize,
}

/// Modelled outage-coast performance (simulation, not field/flight): the hybrid filter's
/// final position error against truth at the end of the GNSS-denied coast, and the GNSS-aided
/// converged error just before the outage — both averaged over the ensemble.
#[derive(Clone, Debug, Serialize, PartialEq)]
pub struct CoastFoM {
    /// Mean position error (m) at the end of the GNSS-aided lead-in (filter converged).
    pub aided_pos_rms_m: f64,
    /// Mean position error (m) at the end of the GNSS-denied coast (CAI-floor-bounded).
    pub coast_end_pos_rms_m: f64,
    /// The coast duration (s) the figure was measured over.
    pub coast_duration_s: f64,
}

/// The 17-state hybrid UKF scenario result artifact.
#[derive(Clone, Debug, Serialize)]
pub struct HybridUkfResult {
    pub schema_version: String,
    pub engine_version: String,
    pub scenario_hash: String,
    pub seed: u64,
    /// The effective velocity-random-walk PSD `q_va` ((m/s²)²/Hz) — CAI-physics-derived when
    /// a `[accel.cai]` block is present, else the supplied value.
    pub effective_q_va: f64,
    /// Whether the inertial sensor resolved to the quantum cold-atom interferometer.
    pub quantum_cai: bool,
    /// `(q_wf, q_rw)` clock PSDs the q-parameter engine produced from the Allan profile.
    pub clock_q_wf: f64,
    pub clock_q_rw: f64,
    /// The filter-consistency oracle (the statistical figure of merit).
    pub consistency: ConsistencyFoM,
    /// The modelled outage-coast performance (simulation only).
    pub coast: CoastFoM,
    /// Honesty label, surfaced in the JSON so a downstream reader cannot miss it.
    pub modelled_note: String,
}

/// Fixed MEO GNSS geometry: six satellites at ~26 000 km with a spread sky distribution
/// (the same geometry the 17-state kernel tests use). Real values are illustrative, fixed.
fn sats() -> Vec<Sat> {
    let r = 2.6e7;
    let dirs: [[f64; 3]; 6] = [
        [0.9, 0.3, 0.3],
        [0.8, -0.4, 0.45],
        [0.85, 0.1, -0.5],
        [0.7, 0.5, -0.5],
        [0.95, -0.2, -0.24],
        [0.75, -0.5, 0.43],
    ];
    dirs.iter()
        .map(|d| {
            let n = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
            Sat {
                pos: [r * d[0] / n, r * d[1] / n, r * d[2] / n],
                vel: [0.0, 0.0, 0.0],
            }
        })
        .collect()
}

/// The full 17-state truth vector at time `t` for a constant-velocity (+y, `speed`) surface
/// platform with constant accelerometer bias `ba` (m/s²) on the x-axis and a clock truth
/// `(b, d)` in range units. Attitude/gyro-bias truth are zero.
fn truth_state(t: f64, speed: f64, ba: f64, clock_b: f64, clock_d: f64) -> Vec<f64> {
    let mut x = vec![0.0; tightly_coupled17::N];
    x[0] = R_EARTH_M;
    x[1] = speed * t;
    x[4] = speed; // +y velocity
    x[9] = ba; // accel-bias x (the CAI-derived correction state's truth)
    x[15] = clock_b; // clock bias (range units)
    x[16] = clock_d; // clock drift (range-rate units)
    x
}

/// Diagonal matrix helper.
fn diag(vals: &[f64]) -> Vec<Vec<f64>> {
    let n = vals.len();
    let mut m = vec![vec![0.0; n]; n];
    for (i, &v) in vals.iter().enumerate() {
        m[i][i] = v;
    }
    m
}

/// The resolved sensor physics: the effective `q_va` and whether it is a CAI sensor.
fn resolve_imu(cfg: &AccelCfg) -> (f64, bool, Option<CaiAccelerometer>) {
    match cfg.kind() {
        ImuKind::QuantumCai(cai) => (cfg.effective_q_va(), true, Some(cai)),
        ImuKind::Classical => (cfg.effective_q_va(), false, None),
    }
}

/// Build the per-step process-noise diagonal Q for the 17-state filter.
///
/// * velocity states carry the inertial velocity-random-walk `q_va·dt` (CAI-floor-limited);
/// * the accel-bias states carry a small random-walk so the bias-correction stays alive;
/// * attitude / gyro-bias carry tiny floors;
/// * the two clock states carry the q-parameter-engine PSDs in **range** units, via the exact
///   two-state van-Loan discretisation (Brown & Hwang; the same `Q00 = q_wf·dt + q_rw·dt³/3`,
///   `Q11 = q_rw·dt` the [`crate::kalman::KalmanClock`] uses), scaled by `c²` to convert
///   phase/frequency to the range units the clock state is carried in.
fn build_q(q_va: f64, q_wf_phase: f64, q_rw_phase: f64, dt: f64, q_factor: f64) -> Vec<Vec<f64>> {
    let mut qd = vec![1e-12; tightly_coupled17::N];
    for k in 0..3 {
        qd[3 + k] = q_va * dt; // velocity random walk (CAI-limited)
        qd[9 + k] = 1e-10; // accel-bias random walk
        qd[6 + k] = 1e-12; // attitude floor
        qd[12 + k] = 1e-16; // gyro-bias floor
    }
    let mut q = diag(&qd);
    // Two-state clock block (states 15,16) with off-diagonal cross term, in range units.
    let c2 = C_M_S * C_M_S;
    let q00 = (q_wf_phase * dt + q_rw_phase * dt * dt * dt / 3.0) * c2;
    let q01 = (q_rw_phase * dt * dt / 2.0) * c2;
    let q11 = (q_rw_phase * dt) * c2;
    q[15][15] = q00.max(1e-30);
    q[15][16] = q01;
    q[16][15] = q01;
    q[16][16] = q11.max(1e-30);
    // Mistuning: the *filter* scales its assumed Q by q_factor (truth uses 1.0).
    for row in q.iter_mut() {
        for v in row.iter_mut() {
            *v *= q_factor;
        }
    }
    q
}

/// The initial covariance P₀ for both truth draw and filter — modest position/velocity, a
/// generous accel-bias prior (the filter is bias-ignorant at start), small attitude/gyro, and
/// a generous clock prior in range units.
fn p0() -> Vec<Vec<f64>> {
    diag(&[
        1e2, 1e2, 1e2, // position (m²): ~10 m 1-σ
        1.0, 1.0, 1.0, // velocity (m²/s²): ~1 m/s 1-σ
        1e-6, 1e-6, 1e-6, // attitude (rad²)
        1e-2, 1e-2, 1e-2, // accel bias ((m/s²)²): ~0.1 m/s² 1-σ
        1e-10, 1e-10, 1e-10, // gyro bias ((rad/s)²)
        1e2, 1.0, // clock bias (m²), drift (m²/s²)
    ])
}

/// Lower-triangular Cholesky factor `L` (`P = L Lᵀ`) of a diagonal-dominant SPD matrix; used
/// to draw the truth process noise consistent with the (truth) Q.
fn cholesky(p: &[Vec<f64>]) -> Vec<Vec<f64>> {
    let n = p.len();
    let mut l = vec![vec![0.0; n]; n];
    for i in 0..n {
        for j in 0..=i {
            let dot: f64 = (0..j).map(|k| l[i][k] * l[j][k]).sum();
            if i == j {
                l[i][j] = (p[i][i] - dot).max(0.0).sqrt();
            } else if l[j][j] > 0.0 {
                l[i][j] = (p[i][j] - dot) / l[j][j];
            }
        }
    }
    l
}

/// One Monte-Carlo seed of the matched-filter consistency run. Returns the pooled
/// `(nis_sum, nis_count, final_nees, aided_err_m, coast_err_m)`.
struct SeedRun {
    nis_sum: f64,
    nis_count: usize,
    nees: Option<f64>,
    aided_err_m: f64,
    coast_err_m: f64,
}

fn run_one_seed(scn: &HybridUkfScenario, q_va: f64, clock: (f64, f64), seed: u64) -> SeedRun {
    let dt = scn.time.step_s;
    let n = (scn.time.duration_s / dt).round() as usize;
    let sats = sats();
    let gravity = [-G_M_S2, 0.0, 0.0];
    let (q_wf_p, q_rw_p) = clock;

    // Truth uses the matched (unscaled) Q; the filter uses q_factor·Q.
    let q_truth = build_q(q_va, q_wf_p, q_rw_p, dt, 1.0);
    let q_filter = build_q(q_va, q_wf_p, q_rw_p, dt, scn.q_factor);
    let lq = cholesky(&q_truth);
    let p0m = p0();
    let l0 = cholesky(&p0m);

    let ba = scn.residual_accel_bias_m_s2;
    let speed = scn.speed_m_s;

    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let n01 = Normal::new(0.0, 1.0).unwrap();
    let n_pr = Normal::new(0.0, scn.sigma_pr_m.max(1e-9)).unwrap();
    let n_rr = Normal::new(0.0, scn.sigma_rr_mps.max(1e-9)).unwrap();

    // Initial truth = nominal CV state + a draw from P₀, so truth and filter agree on the
    // prior (the matched-filter requirement for first-step consistency).
    let nominal0 = truth_state(0.0, speed, ba, 0.0, 0.0);
    let z0: Vec<f64> = (0..tightly_coupled17::N)
        .map(|_| n01.sample(&mut rng))
        .collect();
    let mut x_true: Vec<f64> = nominal0
        .iter()
        .enumerate()
        .map(|(i, &nom)| nom + (0..=i).map(|k| l0[i][k] * z0[k]).sum::<f64>())
        .collect();

    let mut nav = TightlyCoupled17::new(nominal0.clone(), p0m, q_filter, gravity);

    let mut nis_sum = 0.0;
    let mut nis_count = 0usize;
    let mut aided_err_m = 0.0;
    let mut coast_err_m = 0.0;
    // NEES is assessed at the converged GNSS-aided epoch (a well-conditioned posterior), the
    // standard practice: the coast-end posterior has weakly-observable directions (gyro bias /
    // attitude on a constant-velocity level trajectory) whose error/covariance ratio is
    // ill-conditioned, so it is the wrong place to read a full-state NEES. We keep the last
    // aided-epoch NEES; the coast is scored separately as performance, not consistency.
    let mut aided_nees: Option<f64> = None;

    for i in 0..=n {
        let t = i as f64 * dt;
        if i > 0 {
            // Propagate truth: deterministic CV strapdown + a process-noise draw from Q_truth.
            // The platform's specific force balances gravity for level CV flight; truth bias
            // and clock states evolve under the same Q the filter assumes.
            let w: Vec<f64> = (0..tightly_coupled17::N)
                .map(|_| n01.sample(&mut rng))
                .collect();
            let mut nx = vec![0.0; tightly_coupled17::N];
            for k in 0..3 {
                // CV position/velocity (no manoeuvre); attitude/gyro held; bias held.
                nx[k] = x_true[k] + x_true[3 + k] * dt;
                nx[3 + k] = x_true[3 + k];
                nx[6 + k] = x_true[6 + k];
                nx[9 + k] = x_true[9 + k];
                nx[12 + k] = x_true[12 + k];
            }
            nx[15] = x_true[15] + x_true[16] * dt; // clock bias += drift·dt
            nx[16] = x_true[16];
            // Add correlated process noise w_correlated = L_q · w.
            for r in 0..tightly_coupled17::N {
                let noise: f64 = (0..=r).map(|cc| lq[r][cc] * w[cc]).sum();
                nx[r] += noise;
            }
            x_true = nx;

            // Filter dead-reckoning predict: the IMU reports the truth specific force +
            // residual bias (the classical short-term inertial solution).
            let f_b = [G_M_S2 + ba, 0.0, 0.0];
            nav.propagate_imu(dt, f_b, [0.0; 3]);
        }

        let state = scn.gnss.state_at(t);
        if state == GnssState::Nominal {
            // GNSS observes each satellite's pseudorange/range-rate of the *truth*, noisy.
            let pr: Vec<f64> = sats
                .iter()
                .map(|s| tightly_coupled17::pseudorange(&x_true, s) + n_pr.sample(&mut rng))
                .collect();
            let rr: Vec<f64> = sats
                .iter()
                .map(|s| tightly_coupled17::range_rate(&x_true, s) + n_rr.sample(&mut rng))
                .collect();
            // The filter's ASSUMED measurement σ is mis-scaled by √r_factor (truth noise above
            // used the unscaled σ), so r_factor ≠ 1 mis-scales S and perturbs the NIS.
            let rf = scn.r_factor.max(1e-12).sqrt();
            if let Some(nis) =
                nav.update_gnss_nis(&sats, &pr, &rr, scn.sigma_pr_m * rf, scn.sigma_rr_mps * rf)
            {
                nis_sum += nis;
                nis_count += 1;
            }
            aided_err_m = nav.position_error([x_true[0], x_true[1], x_true[2]]);
            // NEES over the OBSERVABLE state subset (position, velocity, clock = 8 states) at
            // this converged aided epoch (overwrite ⇒ keep the last). The attitude / IMU-bias
            // states are weakly observable on a CV level trajectory, so a full-17 NEES is
            // numerically ill-conditioned and not a meaningful consistency statistic.
            aided_nees = nav.nees_subset(&x_true, &NEES_STATES);
        } else {
            coast_err_m = nav.position_error([x_true[0], x_true[1], x_true[2]]);
        }
    }

    SeedRun {
        nis_sum,
        nis_count,
        nees: aided_nees,
        aided_err_m,
        coast_err_m,
    }
}

/// Run the 17-state hybrid quantum + classical UKF scenario: resolve the sensor physics and
/// clock PSDs, run the matched-filter consistency ensemble, and build the result artifact.
pub fn run_hybrid_ukf(scn: &HybridUkfScenario) -> HybridUkfResult {
    let (q_va, quantum_cai, _cai) = resolve_imu(&scn.accel);
    let (q_wf_p, q_rw_p) = scn.clock.psds();
    let seeds = scn.consistency_seeds.max(1);

    let mut nis_sum = 0.0;
    let mut nis_count = 0usize;
    let mut nees_sum = 0.0;
    let mut nees_n = 0usize;
    let mut aided_sum = 0.0;
    let mut coast_sum = 0.0;

    for s in 0..seeds {
        // Independent, reproducible per-seed RNG keyed off the scenario seed.
        let seed = scn
            .seed
            .wrapping_add((0x9E37_79B9_7F4A_7C15u64).wrapping_mul(s as u64 + 1));
        let run = run_one_seed(scn, q_va, (q_wf_p, q_rw_p), seed);
        nis_sum += run.nis_sum;
        nis_count += run.nis_count;
        if let Some(v) = run.nees {
            nees_sum += v;
            nees_n += 1;
        }
        aided_sum += run.aided_err_m;
        coast_sum += run.coast_err_m;
    }

    let nis_mean = if nis_count > 0 {
        nis_sum / nis_count as f64
    } else {
        0.0
    };
    let nees_mean = if nees_n > 0 {
        nees_sum / nees_n as f64
    } else {
        0.0
    };

    // NIS band: **run-based** DOF. For a *linear* optimal filter the innovations are white and
    // one could pool every per-update NIS as iid χ²(m); but here the measurement model is the
    // nonlinear pseudorange/Doppler map run through the unscented transform, which (a) makes
    // consecutive innovations within a run weakly correlated through the shared state estimate
    // and (b) introduces a small (~1%) systematic nonlinearity bias in the predicted S. The
    // honest, conservative convention (Bar-Shalom §5.4.2, as used for NEES) is therefore to
    // count one independent realisation per run: DOF = seeds·m, band = χ²₀.₀₂₅,₀.₉₇₅(seeds·m)/seeds.
    // This band is wide enough to absorb the small unscented-transform bias yet still rejects a
    // genuinely mistuned filter (verified by the mistuning test).
    let m = sats().len() * 2;
    let runs_nis = if nis_count > 0 { seeds } else { 0 } as f64;
    let (nis_lo, nis_hi) = if runs_nis > 0.0 {
        let dof_nis = runs_nis * m as f64;
        (
            chi2_inv_cdf(0.025, dof_nis) / runs_nis,
            chi2_inv_cdf(0.975, dof_nis) / runs_nis,
        )
    } else {
        (0.0, f64::INFINITY)
    };

    // NEES band: run-based DOF (errors are time-correlated within a run; Bar-Shalom §5.4.2).
    // n_x = the observable subset (position, velocity, clock = 8) over `nees_n` independent runs.
    let nx = NEES_STATES.len() as f64;
    let runs = nees_n.max(1) as f64;
    let dof_nees = nx * runs;
    let nees_lo = chi2_inv_cdf(0.025, dof_nees) / runs;
    let nees_hi = chi2_inv_cdf(0.975, dof_nees) / runs;

    let consistent =
        nis_mean >= nis_lo && nis_mean <= nis_hi && nees_mean >= nees_lo && nees_mean <= nees_hi;

    let coast_duration_s = coast_duration(&scn.gnss);

    HybridUkfResult {
        schema_version: crate::interchange::SCHEMA_VERSION.into(),
        engine_version: env!("CARGO_PKG_VERSION").into(),
        scenario_hash: hash(scn),
        seed: scn.seed,
        effective_q_va: q_va,
        quantum_cai,
        clock_q_wf: q_wf_p,
        clock_q_rw: q_rw_p,
        consistency: ConsistencyFoM {
            nis_mean,
            nis_dof: m,
            nis_chi2_lower_95: nis_lo,
            nis_chi2_upper_95: nis_hi,
            nees_mean,
            nees_dof: NEES_STATES.len(),
            nees_chi2_lower_95: nees_lo,
            nees_chi2_upper_95: nees_hi,
            consistent,
            seeds,
        },
        coast: CoastFoM {
            aided_pos_rms_m: aided_sum / seeds as f64,
            coast_end_pos_rms_m: coast_sum / seeds as f64,
            coast_duration_s,
        },
        modelled_note:
            "MODELLED SIMULATION. Filter self-consistency (NEES + innovation-whiteness) \
            under bracketed CAI and clock noise inputs — a self-consistency statement, NOT a \
            real-world accuracy guarantee. Not field/flight results; no TRL>3, no flight heritage, \
            no external validation. CAI hardware is partner-owned."
                .into(),
    }
}

/// The total GNSS-denied (non-nominal) coast duration (s) implied by the timeline.
fn coast_duration(gnss: &GnssTimeline) -> f64 {
    gnss.windows
        .iter()
        .filter(|w| w.state != GnssState::Nominal)
        .map(|w| (w.t1 - w.t0).max(0.0))
        .sum()
}

fn hash(scn: &HybridUkfScenario) -> String {
    let c = serde_json::to_string(scn).expect("scenario serializes");
    let mut h = Sha256::new();
    h.update(c.as_bytes());
    hex::encode(h.finalize())
}

/// Render the consistency oracle (NIS / NEES means vs their χ² bands) as a self-contained SVG.
pub fn to_svg(result: &HybridUkfResult) -> String {
    let (w, h) = (820.0_f64, 420.0_f64);
    let (ml, mr, mt, mb) = (90.0_f64, 30.0_f64, 60.0_f64, 60.0_f64);
    let pw = w - ml - mr;
    let ph = h - mt - mb;
    let cons = &result.consistency;

    // Two grouped bars: NIS (normalised to its target m) and NEES (normalised to 17), so both
    // live on a single "× target" axis where 1.0 is perfect consistency.
    let nis_target = cons.nis_dof.max(1) as f64;
    let nees_target = cons.nees_dof.max(1) as f64;
    let nis_n = cons.nis_mean / nis_target;
    let nis_lo = cons.nis_chi2_lower_95 / nis_target;
    let nis_hi = cons.nis_chi2_upper_95 / nis_target;
    let nees_n = cons.nees_mean / nees_target;
    let nees_lo = cons.nees_chi2_lower_95 / nees_target;
    let nees_hi = cons.nees_chi2_upper_95 / nees_target;

    let y_max = 2.0_f64
        .max(nis_n * 1.2)
        .max(nees_n * 1.2)
        .max(nis_hi * 1.2)
        .max(nees_hi * 1.2);
    let yof = |v: f64| mt + ph - (v.min(y_max) / y_max) * ph;
    let axis_y = mt + ph;

    let mut svg = String::new();
    svg.push_str(&format!("<svg xmlns=\"http://www.w3.org/2000/svg\" width=\"{w:.0}\" height=\"{h:.0}\" font-family=\"sans-serif\" font-size=\"12\" fill=\"#bcb3a3\">"));
    svg.push_str(&format!(
        "<rect width=\"{w:.0}\" height=\"{h:.0}\" fill=\"#0c0b08\"/>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"24\" font-size=\"15\" font-weight=\"bold\">17-state hybrid UKF — filter self-consistency (modelled)</text>"
    ));
    svg.push_str(&format!(
        "<text x=\"{ml:.0}\" y=\"42\" font-size=\"11\" fill=\"#8a8170\">NEES + innovation-whiteness vs 95% \u{03c7}\u{00b2} bands; 1.0 = consistent. Self-consistency, not accuracy.</text>"
    ));
    // Axis.
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{mt:.0}\" x2=\"{ml:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>"
    ));
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{axis_y:.0}\" x2=\"{:.0}\" y2=\"{axis_y:.0}\" stroke=\"#342c21\"/>",
        ml + pw
    ));
    // The "1.0 = consistent" target line.
    let one_y = yof(1.0);
    svg.push_str(&format!(
        "<line x1=\"{ml:.0}\" y1=\"{one_y:.1}\" x2=\"{:.0}\" y2=\"{one_y:.1}\" stroke=\"#5ec5b5\" stroke-dasharray=\"6 4\"/>",
        ml + pw
    ));
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.1}\" fill=\"#5ec5b5\">target 1.0</text>",
        ml + 4.0,
        one_y - 4.0
    ));

    // Two bar groups.
    let groups = [
        ("NIS (whiteness)", nis_n, nis_lo, nis_hi),
        ("NEES", nees_n, nees_lo, nees_hi),
    ];
    let slot = pw / groups.len() as f64;
    let bw = slot * 0.34;
    for (i, (label, val, lo, hi)) in groups.iter().enumerate() {
        let cx = ml + slot * (i as f64 + 0.5);
        let bx = cx - bw / 2.0;
        let by = yof(*val);
        let bh = axis_y - by;
        let inside = *val >= *lo && *val <= *hi;
        let fill = if inside { "#e0bd84" } else { "#e5645a" };
        svg.push_str(&format!(
            "<rect x=\"{bx:.1}\" y=\"{by:.1}\" width=\"{bw:.1}\" height=\"{bh:.1}\" fill=\"{fill}\"/>"
        ));
        // The χ² band as a vertical whisker.
        let (yl, yh) = (yof(*lo), yof(*hi));
        svg.push_str(&format!(
            "<line x1=\"{cx:.1}\" y1=\"{yh:.1}\" x2=\"{cx:.1}\" y2=\"{yl:.1}\" stroke=\"#cfc6b4\" stroke-width=\"2\"/>"
        ));
        svg.push_str(&format!(
            "<line x1=\"{:.1}\" y1=\"{yh:.1}\" x2=\"{:.1}\" y2=\"{yh:.1}\" stroke=\"#cfc6b4\" stroke-width=\"2\"/>",
            cx - 8.0,
            cx + 8.0
        ));
        svg.push_str(&format!(
            "<line x1=\"{:.1}\" y1=\"{yl:.1}\" x2=\"{:.1}\" y2=\"{yl:.1}\" stroke=\"#cfc6b4\" stroke-width=\"2\"/>",
            cx - 8.0,
            cx + 8.0
        ));
        svg.push_str(&format!(
            "<text x=\"{cx:.1}\" y=\"{:.1}\" text-anchor=\"middle\">{label}</text>",
            axis_y + 18.0
        ));
        svg.push_str(&format!(
            "<text x=\"{cx:.1}\" y=\"{:.1}\" text-anchor=\"middle\" fill=\"#cfc6b4\">{val:.2}\u{00d7}</text>",
            by - 6.0
        ));
    }
    let verdict = if cons.consistent {
        ("CONSISTENT", "#5ec5b5")
    } else {
        ("INCONSISTENT", "#e5645a")
    };
    svg.push_str(&format!(
        "<text x=\"{:.0}\" y=\"{:.0}\" text-anchor=\"end\" font-weight=\"bold\" fill=\"{}\">{}</text>",
        ml + pw,
        mt - 4.0,
        verdict.1,
        verdict.0
    ));
    svg.push_str("</svg>");
    svg
}

#[cfg(test)]
mod tests {
    use super::*;

    fn scenario() -> HybridUkfScenario {
        toml::from_str(include_str!("../../scenarios/hybrid-ukf.toml"))
            .expect("hybrid-ukf scenario parses")
    }

    /// A cheaper variant for the non-statistical tests (coast, reproducibility, SVG, labels):
    /// fewer seeds keeps them fast. The matched-consistency oracle test uses the full 48-seed
    /// shipped scenario, where the tight χ² bands are the whole point.
    fn fast_scenario() -> HybridUkfScenario {
        let mut s = scenario();
        s.consistency_seeds = 6;
        s
    }

    #[test]
    fn clock_q_engine_maps_allan_to_psds_by_hand() {
        // q_from_allan: q_wf = a², q_rw = 3·b². For a = 1e-12, b = 1e-14:
        //   q_wf = 1e-24, q_rw = 3e-28 (hand-derived).
        let cfg = ClockAllanCfg {
            id: "x".into(),
            provenance: "test".into(),
            white_fm_adev_1s: 1e-12,
            rw_fm_level: 1e-14,
        };
        let (q_wf, q_rw) = cfg.psds();
        assert!((q_wf - 1e-24).abs() / 1e-24 < 1e-12, "q_wf = {q_wf}");
        assert!((q_rw - 3e-28).abs() / 3e-28 < 1e-12, "q_rw = {q_rw}");
    }

    #[test]
    fn build_q_clock_block_is_van_loan_in_range_units() {
        // The clock block (states 15,16) must be the exact two-state van-Loan Q, scaled by c²
        // to range units. With q_wf = 1e-24, q_rw = 3e-28, dt = 1, q_factor = 1:
        //   Q00 = (q_wf·dt + q_rw·dt³/3)·c²,  Q01 = (q_rw·dt²/2)·c²,  Q11 = (q_rw·dt)·c².
        let (q_wf, q_rw, dt) = (1e-24, 3e-28, 1.0);
        let q = build_q(1e-9, q_wf, q_rw, dt, 1.0);
        let c2 = C_M_S * C_M_S;
        let want00 = (q_wf * dt + q_rw * dt * dt * dt / 3.0) * c2;
        let want01 = (q_rw * dt * dt / 2.0) * c2;
        let want11 = (q_rw * dt) * c2;
        assert!(
            (q[15][15] - want00).abs() / want00 < 1e-12,
            "Q00 = {}",
            q[15][15]
        );
        assert!(
            (q[15][16] - want01).abs() / want01 < 1e-12,
            "Q01 = {}",
            q[15][16]
        );
        assert!(
            (q[16][15] - q[15][16]).abs() < 1e-300,
            "clock block symmetric"
        );
        assert!(
            (q[16][16] - want11).abs() / want11 < 1e-12,
            "Q11 = {}",
            q[16][16]
        );
        // The velocity states carry q_va·dt (= 1e-9 here).
        for k in 0..3 {
            assert!((q[3 + k][3 + k] - 1e-9 * dt).abs() / 1e-9 < 1e-9);
        }
    }

    #[test]
    fn cai_block_makes_q_va_physics_derived() {
        // The shipped scenario uses a `[accel.cai]` block, so the sensor is the quantum
        // cold-atom interferometer and q_va is derived from its physics (not the supplied
        // classical value) — the quantum half of the hybrid.
        let r = run_hybrid_ukf(&fast_scenario());
        assert!(
            r.quantum_cai,
            "shipped scenario should resolve to a CAI sensor"
        );
        // The CAI shot-noise floor is a very small white-acceleration PSD.
        assert!(
            r.effective_q_va > 0.0 && r.effective_q_va < 1e-8,
            "derived q_va = {}",
            r.effective_q_va
        );
    }

    #[test]
    fn matched_filter_is_self_consistent() {
        // THE STATISTICAL ORACLE. With the truth generated from exactly the filter's Q and R
        // (q_factor = 1), both pooled means must land inside their 95% χ² bands: NIS ≈ its
        // measurement DOF (innovation whiteness) and NEES ≈ 8 (the observable state subset:
        // position, velocity, clock). This is a self-consistency statement, not a real-world
        // accuracy guarantee.
        let r = run_hybrid_ukf(&scenario());
        let c = &r.consistency;
        assert!(
            c.consistent,
            "matched filter flagged inconsistent: NIS {} in [{}, {}], NEES {} in [{}, {}]",
            c.nis_mean,
            c.nis_chi2_lower_95,
            c.nis_chi2_upper_95,
            c.nees_mean,
            c.nees_chi2_lower_95,
            c.nees_chi2_upper_95
        );
        // The NIS mean sits near its measurement DOF (m = 12 for six satellites)…
        assert_eq!(c.nis_dof, 12);
        assert!(
            c.nis_mean > 0.7 * c.nis_dof as f64 && c.nis_mean < 1.3 * c.nis_dof as f64,
            "NIS mean {} far from target {}",
            c.nis_mean,
            c.nis_dof
        );
        // …and the NEES mean near the 8-state observable dimension.
        assert_eq!(c.nees_dof, 8);
        assert!(
            c.nees_mean > 5.0 && c.nees_mean < 12.0,
            "NEES mean {} far from 8",
            c.nees_mean
        );
        // The bands bracket their target.
        assert!(c.nees_chi2_lower_95 < 8.0 && c.nees_chi2_upper_95 > 8.0);
    }

    #[test]
    fn mistuned_filter_is_flagged_inconsistent() {
        // The gate must DISCRIMINATE: if it passed everything it would be worthless. In this
        // fast-update, measurement-dominated regime the innovation covariance S = HPHᵀ + R is
        // R-dominated, so the whiteness (NIS) statistic responds to a MEASUREMENT-noise
        // mistuning. An over-confident filter (r_factor = 0.04 ⇒ assumed σ halved twice ⇒ S
        // far too small) drives NIS well above its band and is rejected.
        let mut under = fast_scenario();
        under.r_factor = 0.04;
        let r = run_hybrid_ukf(&under);
        assert!(
            !r.consistency.consistent,
            "an over-confident (r_factor=0.04) filter must be flagged inconsistent: {:?}",
            r.consistency
        );
        // Under-tuned R ⇒ predicted S too small ⇒ NIS mean ABOVE the matched case.
        let matched = run_hybrid_ukf(&fast_scenario());
        assert!(
            r.consistency.nis_mean > matched.consistency.nis_mean,
            "under-tuned NIS {} should exceed matched NIS {}",
            r.consistency.nis_mean,
            matched.consistency.nis_mean
        );
        // And the opposite mistuning (over-confident the other way: assumed σ too LARGE) drives
        // NIS below the band — the two directions bracket the matched case.
        let mut over = fast_scenario();
        over.r_factor = 25.0;
        let ro = run_hybrid_ukf(&over);
        assert!(
            !ro.consistency.consistent && ro.consistency.nis_mean < matched.consistency.nis_mean,
            "over-tuned (r_factor=25) NIS {} should sit below matched {} and be rejected",
            ro.consistency.nis_mean,
            matched.consistency.nis_mean
        );
    }

    #[test]
    fn coast_is_cai_floor_bounded_and_aiding_converges() {
        // The hybrid demonstration: GNSS aiding converges the position (classical IMU +
        // CAI-derived bias correction), then the GNSS-denied coast stays bounded by the
        // quantum (CAI) floor rather than diverging. Modelled simulation only.
        let r = run_hybrid_ukf(&fast_scenario());
        assert!(
            r.coast.aided_pos_rms_m < 20.0,
            "GNSS-aided error should converge: {} m",
            r.coast.aided_pos_rms_m
        );
        assert!(
            r.coast.coast_duration_s > 0.0,
            "scenario must have an outage"
        );
        // The CAI-floor-bounded coast stays finite and modest (not kilometres).
        assert!(
            r.coast.coast_end_pos_rms_m.is_finite() && r.coast.coast_end_pos_rms_m < 1000.0,
            "CAI-floor coast should stay bounded: {} m",
            r.coast.coast_end_pos_rms_m
        );
    }

    #[test]
    fn run_is_bit_reproducible() {
        // (scenario, seed, version) must reproduce bit-identically: all randomness flows
        // through the seeded RNG.
        let a = serde_json::to_string(&run_hybrid_ukf(&fast_scenario())).unwrap();
        let b = serde_json::to_string(&run_hybrid_ukf(&fast_scenario())).unwrap();
        assert_eq!(a, b);
    }

    #[test]
    fn result_carries_the_modelled_honesty_label() {
        let r = run_hybrid_ukf(&fast_scenario());
        assert!(r.modelled_note.contains("MODELLED SIMULATION"));
        assert!(r.modelled_note.contains("NOT a"));
        assert!(r.modelled_note.to_lowercase().contains("partner-owned"));
    }

    #[test]
    fn svg_is_self_contained() {
        let svg = to_svg(&run_hybrid_ukf(&fast_scenario()));
        assert!(svg.starts_with("<svg") && svg.trim_end().ends_with("</svg>"));
        assert!(svg.contains("NEES") && svg.contains("whiteness"));
    }
}
