// SPDX-License-Identifier: AGPL-3.0-only
//! `lunar-orbit-rendezvous`: relative navigation for an Orion-lander style docking in low lunar orbit or an
//! elliptical polar orbit, with a lunar gravity field and LunaNet-style signals.
//!
//! **What is modelled.** Two vehicles, a chaser and a target, fly the same lunar orbit with a stated initial
//! separation. Over the arc a batch weighted-least-squares estimate (Gauss-Newton, iterated to convergence,
//! with the prior as a regulariser) recovers both initial states from three kinds of measurement:
//!
//! 1. an absolute position fix for each vehicle from the relay constellation of [`crate::lunar_service`] (an
//!    ILLUSTRATIVE LCNS-class set, not a real ephemeris). Relays hidden behind the Moon are dropped and the fix
//!    needs at least four. Its white part is `sigma_th^2 * Q`, with `sigma_th` the code-tracking bound on the
//!    AFS pilot (BPSK(5), 5.115 Mchip/s) at the stated carrier-to-noise density and `Q` the position block of
//!    the DOP cofactor ([`crate::orbit::dop_cofactor`]);
//! 2. a persistent signal-in-space error on every fix: relay orbit and clock errors do not average away over
//!    an arc of hours. It is carried as three constant position-bias vectors, one common to both vehicles
//!    (`common_mode_fraction` of the signal-in-space variance) and one independent per vehicle (the rest), each
//!    with a prior `sigma_sis^2 * Q_mean`, `Q_mean` the mean cofactor over the arc. A constant bias gives no
//!    averaging benefit, which is the conservative reading of "persistent". The common part cancels in the
//!    relative state and is not observable in the absolute one;
//! 3. a crosslink range between the vehicles from the same signal at its own carrier-to-noise density.
//!
//! The truth is propagated with the crate's lunar force model ([`crate::lunar_od::LunarForceModel`]: a lunar
//! gravity field, Earth and Sun third bodies). The estimate uses the same model by default
//! (`filter_model = "same"`) or a point-mass Moon (`"point-mass"`), so what ignoring the harmonics costs is
//! shown, not assumed; the point-mass estimate has no model-error term and is not expected to be consistent.
//!
//! **Why batch and not a sequential filter.** A first version was an extended Kalman filter. A crosslink range
//! good to a fraction of a metre meets a relative position known to tens of metres, and the range shell curves
//! away from its tangent plane by metres: iterated and second-order-corrected updates reduced, but did not
//! remove, the overconfidence (see `xval/mission-thread-lunar/RESULTS.md` for the numbers). The batch estimate
//! relinearises about its own converged solution, which removes the sequential-linearisation error.
//!
//! The core is [`LunarRendezvousScenario::run_phase`], a function of `(config, entry state, thread context)`;
//! a standalone run calls it with [`default_entry`] amended by the scenario's own prior. The phase flies its
//! own nominal orbit (the `orbit` fields), so the entry's position and velocity vector is not used, only its
//! covariance, its frame and its clock; the result says so in an event.
//!
//! **Honesty.** MODELLED. The relay set, the signal-in-space error, the common-mode fraction and every prior
//! are ILLUSTRATIVE inputs to be varied, not measurements. Consistency of the estimate with its own model is
//! checked (mean normalised estimation error squared of the relative state); agreement with any real vehicle
//! is not claimed. With signals alone the relative position across the line of sight is limited by the
//! independent signal-in-space error and by the dynamics, not by the range; docking needs a relative sensor,
//! and the report shows how large that gap is. The lunar field is built-in low degree (central term, J2, C22)
//! unless a PDS SHADR table is named. Advisory software, not certified navigation equipment.

// Small dense-matrix and per-axis loops read as the maths they implement when indexed; iterator chains would
// hide which index is which.
#![allow(clippy::needless_range_loop)]

use crate::cw_dynamics;
use crate::gravity_sh::SphericalHarmonicField;
use crate::lunar::{LUNAR_SIGMA_URE_M, MOON_GM_M3_S2, R_MOON_M};
use crate::lunar_od::LunarForceModel;
use crate::lunar_perturbed::elements_to_state;
use crate::lunar_phase::{
    age_clock, cov_is_valid, default_ctx, default_entry, epoch_jd, kind_seed, Cov6, Dm, Frame,
    NavState,
};
use crate::lunar_service::LunarConstellation;
use crate::mission_thread::sensors::{sensor_sigma, RelNavSensor, SensorParams};
use crate::mission_thread::ThreadCtx;
use crate::orbit::dop_cofactor;
use crate::portable_distr::{Distribution, Normal};
use crate::precise_od::ForceModel;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use serde::Deserialize;
use serde_json::{json, Value};

type Vec3 = [f64; 3];

const LABEL: &str = "MODELLED";
/// The registered kind name, standalone and as a thread phase.
pub const KIND: &str = "lunar-orbit-rendezvous";
const C_LIGHT: f64 = 299_792_458.0;
/// AFS-Q pilot chip rate (chips per second), BPSK(5): LSIS-AFS, see docs/LUNANET-AFS.md.
const AFS_Q_CHIP_RATE: f64 = 5.115e6;
/// Parameters: two 6-state vehicles and three 3-vector position biases.
const NP: usize = 21;

/// The `lunar-orbit-rendezvous` scenario. Every field is optional.
#[derive(Clone, Debug, Default, Deserialize)]
pub struct LunarRendezvousScenario {
    /// Orbit preset: `llo` (100 km circular polar, default) or `elfo` (100 km by 3000 km polar, periapsis over
    /// the south pole). The element fields below override the preset.
    pub orbit: Option<String>,
    /// Semi-major axis (km).
    pub sma_km: Option<f64>,
    /// Eccentricity.
    pub eccentricity: Option<f64>,
    /// Inclination (deg).
    pub inc_deg: Option<f64>,
    /// Argument of periapsis (deg).
    pub argp_deg: Option<f64>,
    /// Target mean anomaly at the start of the arc (deg).
    pub mean_anomaly_deg: Option<f64>,
    /// Initial along-track separation, chaser behind target (m). Default 2000.
    pub separation_m: Option<f64>,
    /// Arc length (s). Default 7200.
    pub arc_s: Option<f64>,
    /// Integration and measurement step (s). Default 20.
    pub step_s: Option<f64>,
    /// Number of relays in the illustrative constellation (4 to 24). Default 8.
    pub n_relays: Option<usize>,
    /// AFS carrier-to-noise density for the absolute fixes (dB-Hz). Default 35.
    pub afs_cn0_dbhz: Option<f64>,
    /// Carrier-to-noise density of the crosslink range (dB-Hz). Default 35.
    pub isl_cn0_dbhz: Option<f64>,
    /// Coherent integration time of the code tracker (s). Default 1.
    pub integration_s: Option<f64>,
    /// Signal-in-space user range error, 1-sigma (m). Default the LNIS nominal 30 m.
    pub sis_ure_m: Option<f64>,
    /// Fraction of the signal-in-space variance common to both vehicles, in [0, 1). ILLUSTRATIVE default 0.9.
    pub common_mode_fraction: Option<f64>,
    /// Target absolute position 1-sigma at the start (m). Default 50.
    pub target_pos_sigma_m: Option<f64>,
    /// Target absolute velocity 1-sigma at the start (m/s). Default 0.05.
    pub target_vel_sigma_m_s: Option<f64>,
    /// Chaser prior position 1-sigma (m) when run standalone. Default 100.
    pub carried_pos_sigma_m: Option<f64>,
    /// Chaser prior velocity 1-sigma (m/s) when run standalone. Default 0.1.
    pub carried_vel_sigma_m_s: Option<f64>,
    /// Estimator dynamics: `same` (default) or `point-mass`.
    pub filter_model: Option<String>,
    /// Monte Carlo trials. Default 50.
    pub n_trials: Option<usize>,
    /// Seed. Default 20261024.
    pub seed: Option<u64>,
    /// Formal relative-position 1-sigma (3-D, m) at which the estimate counts as converged. Default 1.
    pub conv_threshold_m: Option<f64>,
    /// Optional path of a PDS SHADR lunar gravity table (e.g. GRAIL GL0660B). Absent: built-in J2 and C22.
    pub gravity_table_path: Option<String>,
    /// Degree and order to use from `gravity_table_path`. Default 150.
    pub gravity_degree: Option<usize>,
}

/// A phase's result: the state it hands on, the report document and a one-line summary.
#[derive(Clone, Debug)]
pub struct RendezvousOut {
    /// The state handed on: the chaser's nominal MCI state and absolute covariance at the end of the arc, the
    /// clock aged across it.
    pub exit: NavState,
    /// The chaser's absolute 1-sigmas over the arc, `(t_s, position m, velocity m/s)`, for the thread's series.
    pub abs_series: Vec<(f64, f64, f64)>,
    /// The result document.
    pub report: Value,
    /// One line for the terminal.
    pub summary: String,
}

/// Which measurement families the estimate uses; only tests turn one off, to isolate a consistency problem.
#[derive(Clone, Copy)]
struct Toggles {
    position: bool,
    range: bool,
}

struct Resolved {
    sma_m: f64,
    ecc: f64,
    inc_deg: f64,
    argp_deg: f64,
    m0_deg: f64,
    sep_m: f64,
    arc_s: f64,
    dt: f64,
    n_relays: usize,
    sigma_afs_th_m: f64,
    sigma_isl_m: f64,
    sis_m: f64,
    kappa: f64,
    tgt_pos: f64,
    tgt_vel: f64,
    same_model: bool,
    trials: usize,
    seed: u64,
    conv_m: f64,
}

fn norm(a: Vec3) -> f64 {
    (a[0] * a[0] + a[1] * a[1] + a[2] * a[2]).sqrt()
}
fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}
fn cross(a: Vec3, b: Vec3) -> Vec3 {
    [
        a[1] * b[2] - a[2] * b[1],
        a[2] * b[0] - a[0] * b[2],
        a[0] * b[1] - a[1] * b[0],
    ]
}
fn scl(a: Vec3, s: f64) -> Vec3 {
    [a[0] * s, a[1] * s, a[2] * s]
}

/// Code-tracking ranging 1-sigma (m): the Gabor-bandwidth bound `c / (beta sqrt(2 C/N0 T))` with
/// `beta = pi f_chip / sqrt(3)`, the RMS bandwidth of a BPSK(n) spectrum truncated to its main lobe.
pub fn code_ranging_sigma_m(chip_rate: f64, cn0_dbhz: f64, integration_s: f64) -> f64 {
    let cn0 = 10f64.powf(cn0_dbhz / 10.0);
    let beta = std::f64::consts::PI * chip_rate / 3f64.sqrt();
    C_LIGHT / (beta * (2.0 * cn0 * integration_s).sqrt())
}

fn lunar_field(path: Option<&str>, degree: usize) -> Result<SphericalHarmonicField, String> {
    if let Some(p) = path {
        let text =
            std::fs::read_to_string(p).map_err(|e| format!("gravity_table_path {p}: {e}"))?;
        return SphericalHarmonicField::from_shadr(&text, degree);
    }
    // Central term, the Moon's J2 and C22 (GRGM660PRIM normalised values).
    let mut f = SphericalHarmonicField::zeros(MOON_GM_M3_S2, R_MOON_M, 2);
    f.set(0, 0, 1.0, 0.0);
    f.set(2, 0, -9.088_292_365e-5, 0.0);
    f.set(2, 2, 3.467_094_427e-5, -2.406_424_452e-10);
    Ok(f)
}

fn point_mass_field() -> SphericalHarmonicField {
    let mut f = SphericalHarmonicField::zeros(MOON_GM_M3_S2, R_MOON_M, 2);
    f.set(0, 0, 1.0, 0.0);
    f
}

fn rk4(model: &LunarForceModel, t: f64, s: [f64; 6], h: f64) -> [f64; 6] {
    let ad = |s: &[f64; 6], k: &[f64; 6], c: f64| -> [f64; 6] {
        std::array::from_fn(|i| s[i] + c * k[i])
    };
    let k1 = deriv(model, t, &s);
    let k2 = deriv(model, t + 0.5 * h, &ad(&s, &k1, 0.5 * h));
    let k3 = deriv(model, t + 0.5 * h, &ad(&s, &k2, 0.5 * h));
    let k4 = deriv(model, t + h, &ad(&s, &k3, h));
    std::array::from_fn(|i| s[i] + h / 6.0 * (k1[i] + 2.0 * k2[i] + 2.0 * k3[i] + k4[i]))
}

/// Jacobian `A = d(rdot, vdot)/d(r, v)` of the model at `(t, s)`: `[[0, I], [G, 0]]` with `G = da/dr` by
/// central differences (velocity dependence neglected; only the optional relativistic term has any).
fn jacobian(model: &LunarForceModel, t: f64, s: &[f64; 6]) -> Dm {
    let r = [s[0], s[1], s[2]];
    let v = [s[3], s[4], s[5]];
    let h = 10.0;
    let mut a = Dm::zeros(6, 6);
    for i in 0..3 {
        a.set(i, 3 + i, 1.0);
        let mut rp = r;
        let mut rm = r;
        rp[i] += h;
        rm[i] -= h;
        let ap = model.accel_rv(t, rp, v);
        let am = model.accel_rv(t, rm, v);
        for k in 0..3 {
            a.set(3 + k, i, (ap[k] - am[k]) / (2.0 * h));
        }
    }
    a
}

fn deriv(model: &LunarForceModel, t: f64, s: &[f64; 6]) -> [f64; 6] {
    let a = model.accel_rv(t, [s[0], s[1], s[2]], [s[3], s[4], s[5]]);
    [s[3], s[4], s[5], a[0], a[1], a[2]]
}

/// One RK4 step of the state and, with the same stages, of the variational equations `dPhi/dt = A Phi`, so
/// the returned state-transition matrix is the one consistent with the propagated state to the integrator's
/// own order. (A series about a Jacobian frozen at the start of the step is only first-order in the change of
/// `A` across the step; the relative position and velocity covariances are nearly singular in one direction,
/// and that error inflates the normalised estimation error there.)
fn rk4_with_stm(model: &LunarForceModel, t: f64, s: [f64; 6], h: f64) -> ([f64; 6], Dm) {
    let eye = Dm::eye(6);
    let st = |s: &[f64; 6], k: &[f64; 6], c: f64| -> [f64; 6] {
        std::array::from_fn(|i| s[i] + c * k[i])
    };
    let k1 = deriv(model, t, &s);
    let q1 = jacobian(model, t, &s).mul(&eye);
    let s2 = st(&s, &k1, 0.5 * h);
    let k2 = deriv(model, t + 0.5 * h, &s2);
    let q2 = jacobian(model, t + 0.5 * h, &s2).mul(&eye.plus(&q1.scale(0.5 * h)));
    let s3 = st(&s, &k2, 0.5 * h);
    let k3 = deriv(model, t + 0.5 * h, &s3);
    let q3 = jacobian(model, t + 0.5 * h, &s3).mul(&eye.plus(&q2.scale(0.5 * h)));
    let s4 = st(&s, &k3, h);
    let k4 = deriv(model, t + h, &s4);
    let q4 = jacobian(model, t + h, &s4).mul(&eye.plus(&q3.scale(h)));
    let next =
        std::array::from_fn(|i| s[i] + h / 6.0 * (k1[i] + 2.0 * k2[i] + 2.0 * k3[i] + k4[i]));
    let phi = eye.plus(
        &q1.plus(&q2.scale(2.0))
            .plus(&q3.scale(2.0))
            .plus(&q4)
            .scale(h / 6.0),
    );
    (next, phi)
}

/// Nominal chaser and target MCI states at the start of the arc: the target from elements, the chaser offset
/// behind it along track in the target's LVLH frame and frozen in that frame (relative rate zero there).
fn nominal_states(cfg: &Resolved) -> ([f64; 6], [f64; 6]) {
    let tgt = elements_to_state(
        cfg.sma_m,
        cfg.ecc,
        cfg.inc_deg,
        0.0,
        cfg.argp_deg,
        cfg.m0_deg,
    );
    let basis = lvlh_basis(tgt.r, tgt.v);
    let rn = norm(tgt.r);
    let omega = norm(cross(tgt.r, tgt.v)) / (rn * rn);
    let rho = [0.0, -cfg.sep_m, 0.0];
    let d_r: Vec3 =
        std::array::from_fn(|i| basis[0][i] * rho[0] + basis[1][i] * rho[1] + basis[2][i] * rho[2]);
    let d_v = scl(cross(basis[2], d_r), omega);
    let t0: [f64; 6] = [tgt.r[0], tgt.r[1], tgt.r[2], tgt.v[0], tgt.v[1], tgt.v[2]];
    let c0: [f64; 6] = std::array::from_fn(|i| {
        if i < 3 {
            tgt.r[i] + d_r[i]
        } else {
            tgt.v[i - 3] + d_v[i - 3]
        }
    });
    (c0, t0)
}

fn lvlh_basis(r: Vec3, v: Vec3) -> [Vec3; 3] {
    let x = scl(r, 1.0 / norm(r));
    let h = cross(r, v);
    let z = scl(h, 1.0 / norm(h));
    let y = cross(z, x);
    [x, y, z]
}

fn rot(b: &[Vec3; 3], a: Vec3) -> Vec3 {
    [dot(b[0], a), dot(b[1], a), dot(b[2], a)]
}

fn visible_relays(user: Vec3, relays: &[Vec3]) -> Vec<Vec3> {
    relays
        .iter()
        .copied()
        .filter(|&s| {
            let d = sub(s, user);
            let dd = dot(d, d);
            let t = (-dot(user, d) / dd).clamp(0.0, 1.0);
            let p = [user[0] + t * d[0], user[1] + t * d[1], user[2] + t * d[2]];
            norm(p) > R_MOON_M
        })
        .collect()
}

/// Position block (3x3) of the DOP cofactor for `user`, `None` below four visible relays or if singular.
fn position_cofactor(user: Vec3, relays: &[Vec3]) -> Option<Dm> {
    let vis = visible_relays(user, relays);
    if vis.len() < 4 {
        return None;
    }
    let q = dop_cofactor(user, &vis)?;
    let mut m = Dm::zeros(3, 3);
    for i in 0..3 {
        for j in 0..3 {
            m.set(i, j, q[i][j]);
        }
    }
    Some(m)
}

fn set_block(m: &mut Dm, r0: usize, c0: usize, b: &Dm) {
    for i in 0..b.r {
        for j in 0..b.c {
            m.set(r0 + i, c0 + j, b.at(i, j));
        }
    }
}

fn block(m: &Dm, r0: usize, c0: usize, n: usize) -> Dm {
    let mut b = Dm::zeros(n, n);
    for i in 0..n {
        for j in 0..n {
            b.set(i, j, m.at(r0 + i, c0 + j));
        }
    }
    b
}

fn cov_to_dm(c: &Cov6) -> Dm {
    let mut m = Dm::zeros(6, 6);
    for i in 0..6 {
        for j in 0..6 {
            m.set(i, j, c[i][j]);
        }
    }
    m
}

fn dm_to_cov(m: &Dm) -> Cov6 {
    let mut c = [[0.0; 6]; 6];
    for (i, row) in c.iter_mut().enumerate() {
        for (j, x) in row.iter_mut().enumerate() {
            *x = m.at(i, j);
        }
    }
    c
}

/// The nominal pass: for every epoch, whether each vehicle has a fix and the cofactor of that fix.
struct Geometry {
    qc: Vec<Option<Dm>>,
    qt: Vec<Option<Dm>>,
    q_mean: Dm,
    both_availability: f64,
}

fn nominal_geometry(
    cfg: &Resolved,
    model: &LunarForceModel,
    constellation: &LunarConstellation,
    n_steps: usize,
    c0: [f64; 6],
    t0: [f64; 6],
) -> Geometry {
    let (mut sc, mut st) = (c0, t0);
    let (mut qc, mut qt) = (Vec::new(), Vec::new());
    let mut sum = Dm::zeros(3, 3);
    let mut count = 0usize;
    let mut both = 0usize;
    let mut t = 0.0;
    for _ in 0..n_steps {
        sc = rk4(model, t, sc, cfg.dt);
        st = rk4(model, t, st, cfg.dt);
        t += cfg.dt;
        let relays = constellation.positions_mci(t);
        let a = position_cofactor([sc[0], sc[1], sc[2]], &relays);
        let b = position_cofactor([st[0], st[1], st[2]], &relays);
        for q in [&a, &b].into_iter().flatten() {
            sum = sum.plus(q);
            count += 1;
        }
        if a.is_some() && b.is_some() {
            both += 1;
        }
        qc.push(a);
        qt.push(b);
    }
    let q_mean = if count > 0 {
        sum.scale(1.0 / count as f64)
    } else {
        Dm::eye(3)
    };
    Geometry {
        qc,
        qt,
        q_mean,
        both_availability: both as f64 / n_steps as f64,
    }
}

/// One propagation of both vehicles over the arc from `theta`, keeping the state and the state-transition
/// matrix from the start at every epoch.
struct Pass {
    sc: Vec<[f64; 6]>,
    st: Vec<[f64; 6]>,
    pc: Vec<Dm>,
    pt: Vec<Dm>,
}

fn propagate_pass(model: &LunarForceModel, theta: &[f64], n_steps: usize, dt: f64) -> Pass {
    let mut c: [f64; 6] = std::array::from_fn(|i| theta[i]);
    let mut t: [f64; 6] = std::array::from_fn(|i| theta[6 + i]);
    let (mut phic, mut phit) = (Dm::eye(6), Dm::eye(6));
    let mut out = Pass {
        sc: Vec::with_capacity(n_steps),
        st: Vec::with_capacity(n_steps),
        pc: Vec::with_capacity(n_steps),
        pt: Vec::with_capacity(n_steps),
    };
    let mut time = 0.0;
    for _ in 0..n_steps {
        let (nc, sc) = rk4_with_stm(model, time, c, dt);
        let (nt, stt) = rk4_with_stm(model, time, t, dt);
        phic = sc.mul(&phic);
        phit = stt.mul(&phit);
        c = nc;
        t = nt;
        time += dt;
        out.sc.push(c);
        out.st.push(t);
        out.pc.push(phic.clone());
        out.pt.push(phit.clone());
    }
    out
}

/// The truth pass, states only.
fn truth_pass(
    model: &LunarForceModel,
    theta: &[f64],
    n_steps: usize,
    dt: f64,
) -> (Vec<[f64; 6]>, Vec<[f64; 6]>) {
    let mut c: [f64; 6] = std::array::from_fn(|i| theta[i]);
    let mut t: [f64; 6] = std::array::from_fn(|i| theta[6 + i]);
    let (mut vc, mut vt) = (Vec::new(), Vec::new());
    let mut time = 0.0;
    for _ in 0..n_steps {
        c = rk4(model, time, c, dt);
        t = rk4(model, time, t, dt);
        time += dt;
        vc.push(c);
        vt.push(t);
    }
    (vc, vt)
}

/// Draw `theta = mean + L xi` with `L L' = p` (Cholesky of the prior).
fn draw_prior(l: &Dm, mean: &[f64], g: &mut dyn FnMut() -> f64) -> Vec<f64> {
    let xi: Vec<f64> = (0..NP).map(|_| g()).collect();
    (0..NP)
        .map(|i| mean[i] + (0..NP).map(|j| l.at(i, j) * xi[j]).sum::<f64>())
        .collect()
}

/// A measurement of the batch problem, the same list used to generate the truth data and to estimate.
enum Meas {
    /// Position fix of vehicle `v` (0 chaser, 1 target) at epoch `k`: the measured value and the weight
    /// (inverse white covariance, 3x3).
    Fix { k: usize, v: usize, z: Vec3, w: Dm },
    /// Crosslink range at epoch `k`: the measured value and its weight.
    Range { k: usize, z: f64, w: f64 },
}

fn meas_epoch(m: &Meas) -> usize {
    match m {
        Meas::Fix { k, .. } | Meas::Range { k, .. } => *k,
    }
}

/// Normal equations at `theta`: `(information, gradient)` over the measurements, without the prior. Also
/// returns the information accumulated up to each epoch when `cumulative` is set (the formal series).
fn normal_equations(
    theta: &[f64],
    pass: &Pass,
    meas: &[Meas],
    n_steps: usize,
    cumulative: bool,
) -> (Dm, Vec<f64>, Vec<Dm>) {
    let mut lam = Dm::zeros(NP, NP);
    let mut g = vec![0.0; NP];
    let mut snaps: Vec<Dm> = Vec::new();
    let mut mi = 0usize;
    for k in 0..n_steps {
        while mi < meas.len() && meas_epoch(&meas[mi]) == k {
            match &meas[mi] {
                Meas::Fix { v, z, w, .. } => {
                    let (state, phi, col0, bcol) = if *v == 0 {
                        (&pass.sc[k], &pass.pc[k], 0usize, 15usize)
                    } else {
                        (&pass.st[k], &pass.pt[k], 6usize, 18usize)
                    };
                    // y = z - (r + b_common + b_v)
                    let y: Vec<f64> = (0..3)
                        .map(|i| z[i] - (state[i] + theta[12 + i] + theta[bcol + i]))
                        .collect();
                    let mut h = Dm::zeros(3, NP);
                    for i in 0..3 {
                        for j in 0..6 {
                            h.set(i, col0 + j, phi.at(i, j));
                        }
                        h.set(i, 12 + i, 1.0);
                        h.set(i, bcol + i, 1.0);
                    }
                    let wh = w.mul(&h);
                    lam = lam.plus(&h.t().mul(&wh));
                    let wy: Vec<f64> = (0..3)
                        .map(|i| (0..3).map(|j| w.at(i, j) * y[j]).sum())
                        .collect();
                    for p in 0..NP {
                        g[p] += (0..3).map(|i| h.at(i, p) * wy[i]).sum::<f64>();
                    }
                }
                Meas::Range { z, w, .. } => {
                    let d = sub(
                        [pass.sc[k][0], pass.sc[k][1], pass.sc[k][2]],
                        [pass.st[k][0], pass.st[k][1], pass.st[k][2]],
                    );
                    let rho = norm(d);
                    let u = scl(d, 1.0 / rho);
                    let mut h = [0.0; NP];
                    for j in 0..6 {
                        h[j] = (0..3).map(|i| u[i] * pass.pc[k].at(i, j)).sum();
                        h[6 + j] = -(0..3).map(|i| u[i] * pass.pt[k].at(i, j)).sum::<f64>();
                    }
                    let y = z - rho;
                    for a in 0..NP {
                        if h[a] == 0.0 {
                            continue;
                        }
                        for b in 0..NP {
                            lam.add_at(a, b, h[a] * w * h[b]);
                        }
                        g[a] += h[a] * w * y;
                    }
                }
            }
            mi += 1;
        }
        if cumulative {
            snaps.push(lam.clone());
        }
    }
    (lam, g, snaps)
}

/// Covariance of the `[chaser(t); target(t)]` position-velocity pair at an epoch from the parameter
/// covariance and the state-transition matrices to that epoch.
fn pair_cov(p_theta: &Dm, phic: &Dm, phit: &Dm) -> Dm {
    let mut m = Dm::zeros(12, NP);
    for i in 0..6 {
        for j in 0..6 {
            m.set(i, j, phic.at(i, j));
            m.set(6 + i, 6 + j, phit.at(i, j));
        }
    }
    let mut c = m.mul(p_theta).mul(&m.t());
    c.symmetrise();
    c
}

/// Relative-state covariance `[I -I]` block: chaser minus target, 6x6, from the pair covariance.
fn rel_cov(p12: &Dm) -> Dm {
    let mut t = Dm::zeros(6, 12);
    for i in 0..6 {
        t.set(i, i, 1.0);
        t.set(i, 6 + i, -1.0);
    }
    let mut m = t.mul(p12).mul(&t.t());
    m.symmetrise();
    m
}

impl LunarRendezvousScenario {
    fn resolve(&self) -> Result<Resolved, String> {
        let preset = self.orbit.as_deref().unwrap_or("llo");
        let (sma0, e0) = match preset {
            "llo" => (R_MOON_M + 100_000.0, 0.0),
            "elfo" => {
                let rp = R_MOON_M + 100_000.0;
                let ra = R_MOON_M + 3_000_000.0;
                ((ra + rp) / 2.0, (ra - rp) / (ra + rp))
            }
            o => return Err(format!("orbit must be `llo` or `elfo`, got `{o}`")),
        };
        let argp0 = if preset == "elfo" { 270.0 } else { 0.0 };
        let sma_m = self.sma_km.map_or(sma0, |k| k * 1000.0);
        let ecc = self.eccentricity.unwrap_or(e0);
        if !(sma_m > R_MOON_M && (0.0..0.9).contains(&ecc)) {
            return Err(
                "sma_km must exceed the lunar radius and eccentricity be in [0, 0.9)".into(),
            );
        }
        if sma_m * (1.0 - ecc) <= R_MOON_M + 20_000.0 {
            return Err("periapsis must be at least 20 km above the surface".into());
        }
        let sep_m = self.separation_m.unwrap_or(2000.0);
        let arc_s = self.arc_s.unwrap_or(7200.0);
        let dt = self.step_s.unwrap_or(20.0);
        if !(sep_m > 0.0 && sep_m < 50_000.0) {
            return Err("separation_m must be in (0, 50000)".into());
        }
        if !(dt > 0.0 && dt <= 60.0 && arc_s >= dt) {
            return Err("step_s must be in (0, 60] and arc_s at least one step".into());
        }
        let n_relays = self.n_relays.unwrap_or(8);
        if !(4..=24).contains(&n_relays) {
            return Err("n_relays must be in 4..=24".into());
        }
        let int_s = self.integration_s.unwrap_or(1.0);
        if int_s.is_nan() || int_s <= 0.0 {
            return Err("integration_s must be positive".into());
        }
        let cn0 = self.afs_cn0_dbhz.unwrap_or(35.0);
        let cn0_isl = self.isl_cn0_dbhz.unwrap_or(35.0);
        let kappa = self.common_mode_fraction.unwrap_or(0.9);
        if !(0.0..1.0).contains(&kappa) {
            return Err("common_mode_fraction must be in [0, 1)".into());
        }
        let same_model = match self.filter_model.as_deref().unwrap_or("same") {
            "same" => true,
            "point-mass" => false,
            o => {
                return Err(format!(
                    "filter_model must be `same` or `point-mass`, got `{o}`"
                ))
            }
        };
        Ok(Resolved {
            sma_m,
            ecc,
            inc_deg: self.inc_deg.unwrap_or(90.0),
            argp_deg: self.argp_deg.unwrap_or(argp0),
            m0_deg: self.mean_anomaly_deg.unwrap_or(0.0),
            sep_m,
            arc_s,
            dt,
            n_relays,
            sigma_afs_th_m: code_ranging_sigma_m(AFS_Q_CHIP_RATE, cn0, int_s),
            sigma_isl_m: code_ranging_sigma_m(AFS_Q_CHIP_RATE, cn0_isl, int_s),
            sis_m: self.sis_ure_m.unwrap_or(LUNAR_SIGMA_URE_M),
            kappa,
            tgt_pos: self.target_pos_sigma_m.unwrap_or(50.0),
            tgt_vel: self.target_vel_sigma_m_s.unwrap_or(0.05),
            same_model,
            trials: self.n_trials.unwrap_or(50),
            seed: self.seed.unwrap_or(20_261_024),
            conv_m: self.conv_threshold_m.unwrap_or(1.0),
        })
    }

    /// The entry state a standalone run starts from: the default amended by the scenario's own prior.
    pub fn standalone_entry(&self) -> NavState {
        let mut c = default_entry();
        c.p = crate::lunar_phase::diag6(
            self.carried_pos_sigma_m.unwrap_or(100.0),
            self.carried_vel_sigma_m_s.unwrap_or(0.1),
        );
        c
    }

    /// The phase core: run the arc from `entry` (the chaser's absolute MCI covariance at its start).
    pub fn run_phase(&self, entry: &NavState, ctx: &ThreadCtx) -> Result<RendezvousOut, String> {
        self.run_inner(
            entry,
            ctx,
            Toggles {
                position: true,
                range: true,
            },
        )
    }

    fn run_inner(
        &self,
        entry: &NavState,
        ctx: &ThreadCtx,
        tog: Toggles,
    ) -> Result<RendezvousOut, String> {
        let mut cfg = self.resolve()?;
        if self.seed.is_none() {
            cfg.seed = kind_seed(ctx, KIND);
        }
        if entry.frame != Frame::Mci {
            return Err("lunar-orbit-rendezvous expects the entry covariance in MCI; the thread converts frames".into());
        }
        if !cov_is_valid(&entry.p) {
            return Err("entry covariance is not symmetric with a non-negative diagonal".into());
        }
        let epoch_jd_tdb = epoch_jd(ctx, entry.t_s)?;
        let field = lunar_field(
            self.gravity_table_path.as_deref(),
            self.gravity_degree.unwrap_or(150),
        )?;
        let truth_model = LunarForceModel::new(field, epoch_jd_tdb);
        let est_model = if cfg.same_model {
            truth_model.clone()
        } else {
            LunarForceModel::new(point_mass_field(), epoch_jd_tdb)
        };
        let constellation = LunarConstellation::illustrative_lcns(cfg.n_relays);
        let n_steps = (cfg.arc_s / cfg.dt).round() as usize;
        let (c0, t0) = nominal_states(&cfg);
        let geo = nominal_geometry(&cfg, &truth_model, &constellation, n_steps, c0, t0);

        // Prior over theta = [chaser(6), target(6), b_common(3), b_chaser(3), b_target(3)].
        let sis2 = cfg.sis_m * cfg.sis_m;
        let mut p0 = Dm::zeros(NP, NP);
        set_block(&mut p0, 0, 0, &cov_to_dm(&entry.p));
        set_block(
            &mut p0,
            6,
            6,
            &cov_to_dm(&crate::lunar_phase::diag6(cfg.tgt_pos, cfg.tgt_vel)),
        );
        set_block(&mut p0, 12, 12, &geo.q_mean.scale(cfg.kappa * sis2));
        set_block(&mut p0, 15, 15, &geo.q_mean.scale((1.0 - cfg.kappa) * sis2));
        set_block(&mut p0, 18, 18, &geo.q_mean.scale((1.0 - cfg.kappa) * sis2));
        let l0 = p0
            .cholesky()
            .ok_or("prior covariance is not positive definite")?;
        let p0_inv = p0
            .solve_spd(&Dm::eye(NP))
            .ok_or("prior covariance is not positive definite")?;
        let mut theta_bar = vec![0.0; NP];
        theta_bar[..6].copy_from_slice(&c0);
        theta_bar[6..12].copy_from_slice(&t0);

        let th2 = cfg.sigma_afs_th_m * cfg.sigma_afs_th_m;
        // Whitening of each fix: W = (th2 Q)^-1, and the factor to draw its noise.
        let w_of = |q: &Dm| -> Option<(Dm, Dm)> {
            let r = q.scale(th2).plus(&Dm::eye(3).scale(1e-12 * th2));
            let w = r.solve_spd(&Dm::eye(3))?;
            let l = r.cholesky()?;
            Some((w, l))
        };
        let wl_c: Vec<Option<(Dm, Dm)>> =
            geo.qc.iter().map(|q| q.as_ref().and_then(&w_of)).collect();
        let wl_t: Vec<Option<(Dm, Dm)>> =
            geo.qt.iter().map(|q| q.as_ref().and_then(&w_of)).collect();

        let mut series: Vec<Value> = Vec::new();
        let mut conv_time: Option<f64> = None;
        let mut abs_series: Vec<(f64, f64, f64)> = Vec::new();
        let mut final_pair: Option<Dm> = None;
        let mut err_lvlh: Vec<[f64; 6]> = Vec::new();
        let mut nees: Vec<f64> = Vec::new();
        let mut nees_pos: Vec<f64> = Vec::new();
        let mut nees_vel: Vec<f64> = Vec::new();
        let mut iters: Vec<usize> = Vec::new();
        let unit = Normal::new(0.0, 1.0).map_err(|e| e.to_string())?;
        let step_report = (n_steps / 24).max(1);

        for trial in 0..cfg.trials.max(1) {
            let mut rng = ChaCha8Rng::seed_from_u64(cfg.seed.wrapping_add(trial as u64));
            let mut g = || unit.sample(&mut rng);
            let theta_true = draw_prior(&l0, &theta_bar, &mut g);
            let (tc, tt) = truth_pass(&truth_model, &theta_true, n_steps, cfg.dt);
            // Data: thermal noise only; the persistent bias is part of the truth parameters.
            let mut meas: Vec<Meas> = Vec::new();
            for k in 0..n_steps {
                if tog.position {
                    for (v, (wl, st)) in [(&wl_c, &tc), (&wl_t, &tt)].into_iter().enumerate() {
                        if let Some((w, l)) = &wl[k] {
                            let gn: Vec<f64> = (0..3).map(|_| g()).collect();
                            let bcol = if v == 0 { 15 } else { 18 };
                            let z: Vec3 = std::array::from_fn(|i| {
                                st[k][i]
                                    + theta_true[12 + i]
                                    + theta_true[bcol + i]
                                    + (0..3).map(|j| l.at(i, j) * gn[j]).sum::<f64>()
                            });
                            meas.push(Meas::Fix {
                                k,
                                v,
                                z,
                                w: w.clone(),
                            });
                        }
                    }
                }
                if tog.range {
                    let rho = norm(sub(
                        [tc[k][0], tc[k][1], tc[k][2]],
                        [tt[k][0], tt[k][1], tt[k][2]],
                    ));
                    meas.push(Meas::Range {
                        k,
                        z: rho + cfg.sigma_isl_m * g(),
                        w: 1.0 / (cfg.sigma_isl_m * cfg.sigma_isl_m),
                    });
                }
            }

            // Gauss-Newton from the prior mean.
            let mut theta = theta_bar.clone();
            let mut n_it = 0usize;
            let mut last_lam = Dm::zeros(NP, NP);
            for it in 0..20 {
                n_it = it + 1;
                let pass = propagate_pass(&est_model, &theta, n_steps, cfg.dt);
                let (lam_m, grad_m, _) = normal_equations(&theta, &pass, &meas, n_steps, false);
                let mut lam = lam_m.plus(&p0_inv);
                lam.symmetrise();
                let prior_g: Vec<f64> = (0..NP)
                    .map(|i| {
                        (0..NP)
                            .map(|j| p0_inv.at(i, j) * (theta_bar[j] - theta[j]))
                            .sum()
                    })
                    .collect();
                let rhs = Dm {
                    r: NP,
                    c: 1,
                    d: (0..NP).map(|i| grad_m[i] + prior_g[i]).collect(),
                };
                let delta = lam
                    .solve_spd(&rhs)
                    .ok_or("normal equations are not positive definite")?;
                // Converged when the step is small against the formal sigma of every parameter.
                let converged = (0..NP).all(|i| {
                    let sig = (1.0 / lam.at(i, i)).sqrt();
                    delta.d[i].abs() <= 1e-3 * sig.max(1e-12)
                });
                for i in 0..NP {
                    theta[i] += delta.d[i];
                }
                last_lam = lam;
                if converged {
                    break;
                }
            }
            iters.push(n_it);
            let p_theta = last_lam
                .solve_spd(&Dm::eye(NP))
                .ok_or("posterior information is not positive definite")?;
            let pass = propagate_pass(&est_model, &theta, n_steps, cfg.dt);
            let k_end = n_steps - 1;
            let pair = pair_cov(&p_theta, &pass.pc[k_end], &pass.pt[k_end]);
            let prel = rel_cov(&pair);
            let rel_true: [f64; 6] = std::array::from_fn(|i| tc[k_end][i] - tt[k_end][i]);
            let rel_est: [f64; 6] = std::array::from_fn(|i| pass.sc[k_end][i] - pass.st[k_end][i]);
            let e: Vec<f64> = (0..6).map(|i| rel_true[i] - rel_est[i]).collect();
            let eb = Dm {
                r: 6,
                c: 1,
                d: e.clone(),
            };
            if let Some(sol) = prel.solve_spd(&eb) {
                nees.push(e.iter().zip(&sol.d).map(|(a, b)| a * b).sum());
            }
            for (range, sink) in [(0usize, &mut nees_pos), (3usize, &mut nees_vel)] {
                let sub_e = Dm {
                    r: 3,
                    c: 1,
                    d: e[range..range + 3].to_vec(),
                };
                if let Some(sol) = block(&prel, range, range, 3).solve_spd(&sub_e) {
                    sink.push(sub_e.d.iter().zip(&sol.d).map(|(a, b)| a * b).sum());
                }
            }
            let bs = lvlh_basis(
                [tt[k_end][0], tt[k_end][1], tt[k_end][2]],
                [tt[k_end][3], tt[k_end][4], tt[k_end][5]],
            );
            let ep = rot(&bs, [e[0], e[1], e[2]]);
            let ev = rot(&bs, [e[3], e[4], e[5]]);
            err_lvlh.push([ep[0], ep[1], ep[2], ev[0], ev[1], ev[2]]);

            if trial == 0 {
                final_pair = Some(pair);
                // Formal series: information accumulated up to each epoch, at this trial's solution.
                let (_, _, snaps) = normal_equations(&theta, &pass, &meas, n_steps, true);
                for (k, lam_k) in snaps.iter().enumerate() {
                    let mut lam = lam_k.plus(&p0_inv);
                    lam.symmetrise();
                    let Some(pk) = lam.solve_spd(&Dm::eye(NP)) else {
                        continue;
                    };
                    let rk = rel_cov(&pair_cov(&pk, &pass.pc[k], &pass.pt[k]));
                    let s3 = (rk.at(0, 0) + rk.at(1, 1) + rk.at(2, 2)).sqrt();
                    let t = (k + 1) as f64 * cfg.dt;
                    if conv_time.is_none() && s3 <= cfg.conv_m {
                        conv_time = Some(t);
                    }
                    {
                        let pk_pair = pair_cov(&pk, &pass.pc[k], &pass.pt[k]);
                        let ap = (pk_pair.at(0, 0) + pk_pair.at(1, 1) + pk_pair.at(2, 2)).sqrt();
                        let av = (pk_pair.at(3, 3) + pk_pair.at(4, 4) + pk_pair.at(5, 5)).sqrt();
                        abs_series.push((t, ap, av));
                    }
                    if (k + 1) % step_report == 0 || k + 1 == n_steps {
                        let sv = (rk.at(3, 3) + rk.at(4, 4) + rk.at(5, 5)).sqrt();
                        series.push(json!({
                            "t_s": t,
                            "rel_pos_sigma_m": s3,
                            "rel_vel_sigma_mm_s": sv * 1e3,
                        }));
                    }
                }
            }
        }

        // Formal relative covariance at the end, in the target's LVLH axes at the end of the nominal arc.
        let (cn, tn) = truth_pass(&truth_model, &theta_bar, n_steps, cfg.dt);
        let tn_end = tn[n_steps - 1];
        let cn_end = cn[n_steps - 1];
        let bs_end = lvlh_basis(
            [tn_end[0], tn_end[1], tn_end[2]],
            [tn_end[3], tn_end[4], tn_end[5]],
        );
        let pair_end = final_pair.ok_or("no trial ran")?;
        let prel_end = rel_cov(&pair_end);
        let sig_lvlh: Vec<f64> = (0..3)
            .map(|a| {
                let mut s = 0.0;
                for i in 0..3 {
                    for j in 0..3 {
                        s += bs_end[a][i] * prel_end.at(i, j) * bs_end[a][j];
                    }
                }
                s.sqrt()
            })
            .collect();
        let n_tr = err_lvlh.len() as f64;
        let rms = |k: usize| (err_lvlh.iter().map(|e| e[k] * e[k]).sum::<f64>() / n_tr).sqrt();
        let mean = |v: &[f64]| v.iter().sum::<f64>() / v.len().max(1) as f64;
        let nees_mean = mean(&nees);
        let (nees_pos_mean, nees_vel_mean) = (mean(&nees_pos), mean(&nees_vel));
        let avail = geo.both_availability;

        // What ignoring the field costs with no measurements at all: the relative drift over the arc.
        let grav_sens = {
            let pm = LunarForceModel::new(point_mass_field(), epoch_jd_tdb);
            let (mut a_c, mut a_t, mut b_c, mut b_t) = (c0, t0, c0, t0);
            let mut tt = 0.0;
            for _ in 0..n_steps {
                a_c = rk4(&truth_model, tt, a_c, cfg.dt);
                a_t = rk4(&truth_model, tt, a_t, cfg.dt);
                b_c = rk4(&pm, tt, b_c, cfg.dt);
                b_t = rk4(&pm, tt, b_t, cfg.dt);
                tt += cfg.dt;
            }
            let ra: Vec3 = std::array::from_fn(|i| a_c[i] - a_t[i]);
            let rb: Vec3 = std::array::from_fn(|i| b_c[i] - b_t[i]);
            norm(sub(ra, rb))
        };

        // Closed-form Hill/Clohessy-Wiltshire check, circular orbit only.
        let cw_check = if cfg.ecc < 1e-9 {
            Some(cw_vs_numerical(&cfg, epoch_jd_tdb))
        } else {
            None
        };

        let chaser_p_end = block(&pair_end, 0, 0, 6);
        // The chaser's nominal state and absolute covariance at the end, the clock aged across the arc. The phase
        // flies its own nominal orbit, so the entry's state vector is not used (an event in the thread says so).
        let mut exit = entry.clone();
        exit.t_s += cfg.arc_s;
        exit.x = cn_end;
        exit.p = dm_to_cov(&chaser_p_end);
        exit.clock = age_clock(&entry.clock, cfg.arc_s);
        let observability_lost = avail < 0.05;
        let pos_sig3 = (sig_lvlh[0].powi(2) + sig_lvlh[1].powi(2) + sig_lvlh[2].powi(2)).sqrt();
        let t_end = n_steps as f64 * cfg.dt;
        // The terminal relative sensors of the thread's shared models (ILLUSTRATIVE parameters) against what the
        // signals alone give: at which ranges a sensor's 1-sigma relative position beats the formal figure.
        let mut relative_sensors: Vec<Value> = Vec::new();
        for sensor in [
            RelNavSensor::OpticalCamera,
            RelNavSensor::Lidar,
            RelNavSensor::RfRanging,
        ] {
            let params = SensorParams::illustrative(sensor);
            for range_m in [1000.0, 300.0, 100.0, 30.0, 10.0] {
                if let Ok(sg) = sensor_sigma(&params, range_m) {
                    relative_sensors.push(json!({
                        "sensor": sensor.name(),
                        "range_m": range_m,
                        "pos_sigma_m": sg.pos_sigma_m,
                        "vel_sigma_m_s": sg.vel_sigma_mps,
                        "beats_signals_alone": sg.pos_sigma_m < pos_sig3,
                    }));
                }
            }
        }
        let mean_iters = iters.iter().sum::<usize>() as f64 / iters.len().max(1) as f64;

        let mut report = json!({
            "kind": KIND,
            "label": LABEL,
            "advisory": "Advisory software, not certified navigation equipment. MODELLED: an illustrative relay set and error budget, not a real ephemeris or vehicle.",
            "orbit": {
                "sma_km": cfg.sma_m / 1000.0,
                "eccentricity": cfg.ecc,
                "inc_deg": cfg.inc_deg,
                "argp_deg": cfg.argp_deg,
                "mean_anomaly_deg": cfg.m0_deg,
                "period_s": 2.0 * std::f64::consts::PI * (cfg.sma_m.powi(3) / MOON_GM_M3_S2).sqrt(),
            },
            "arc_s": t_end,
            "separation_m": cfg.sep_m,
            "n_relays": cfg.n_relays,
            "estimator": "batch Gauss-Newton over the arc",
            "filter_model": if cfg.same_model { "same" } else { "point-mass" },
            "gravity_field": self.gravity_table_path.as_deref().map_or("builtin-J2-C22".to_string(), |p| format!("shadr:{p}")),
            "sigma_afs_thermal_m": cfg.sigma_afs_th_m,
            "sigma_isl_m": cfg.sigma_isl_m,
            "sigma_sis_m": cfg.sis_m,
            "common_mode_fraction": cfg.kappa,
            "fix_availability": avail,
            "observability_lost": observability_lost,
        });
        let part2 = json!({
            "final_rel_pos_sigma_lvlh_m": { "radial": sig_lvlh[0], "along": sig_lvlh[1], "cross": sig_lvlh[2], "total": pos_sig3 },
            "converged_at_s": conv_time,
            "monte_carlo": {
                "trials": err_lvlh.len(),
                "rms_rel_pos_error_lvlh_m": { "radial": rms(0), "along": rms(1), "cross": rms(2) },
                "rms_rel_vel_error_lvlh_mm_s": { "radial": rms(3) * 1e3, "along": rms(4) * 1e3, "cross": rms(5) * 1e3 },
                "mean_nees": nees_mean,
                "nees_dof": 6,
                "mean_nees_position": nees_pos_mean,
                "mean_nees_velocity": nees_vel_mean,
                "mean_gauss_newton_iterations": mean_iters,
            },
            "relative_sensors": relative_sensors,
            "unmodelled_gravity_relative_drift_m": grav_sens,
            "cw_check": cw_check,
            "series": series,
        });
        let part3 = json!({
            "exit_state": {
                "frame": "mci",
                "pos_sigma_m": [chaser_p_end.at(0, 0).sqrt(), chaser_p_end.at(1, 1).sqrt(), chaser_p_end.at(2, 2).sqrt()],
                "vel_sigma_m_s": [chaser_p_end.at(3, 3).sqrt(), chaser_p_end.at(4, 4).sqrt(), chaser_p_end.at(5, 5).sqrt()],
                "evidence": "MODELLED",
            },
            "budget_rows": [
                { "source": "AFS pilot code tracking (thermal)", "sigma_m": cfg.sigma_afs_th_m, "label": LABEL },
                { "source": "signal-in-space user range error (common-mode part cancels in the relative state)", "sigma_m": cfg.sis_m, "label": LABEL },
                { "source": "crosslink range", "sigma_m": cfg.sigma_isl_m, "label": LABEL },
                { "source": "final relative position (formal, 3-D)", "sigma_m": pos_sig3, "label": LABEL },
            ],
            "units": units(),
        });
        if let (Some(base), Value::Object(p2), Value::Object(p3)) =
            (report.as_object_mut(), part2, part3)
        {
            base.extend(p2);
            base.extend(p3);
        }
        let summary = format!(
            "lunar-orbit-rendezvous | {} {:.0}x{:.0} km | sep {:.0} m | fixes {:.0}% | rel pos 1-sigma R/A/C {:.2}/{:.2}/{:.2} m | mean NEES {:.2} (6 expected) | converged {} (MODELLED)",
            self.orbit.as_deref().unwrap_or("llo"),
            (cfg.sma_m * (1.0 - cfg.ecc) - R_MOON_M) / 1000.0,
            (cfg.sma_m * (1.0 + cfg.ecc) - R_MOON_M) / 1000.0,
            cfg.sep_m,
            100.0 * avail,
            sig_lvlh[0],
            sig_lvlh[1],
            sig_lvlh[2],
            nees_mean,
            conv_time.map_or("never".to_string(), |s| format!("at {s:.0} s")),
        );
        Ok(RendezvousOut {
            exit,
            abs_series,
            report,
            summary,
        })
    }

    /// The result's chart: formal relative-position 1-sigma against time.
    pub fn chart_svg(&self, json: &str) -> String {
        use crate::lunar_phase::{line_chart_svg, ChartSeries};
        let v: Value = serde_json::from_str(json).unwrap_or(Value::Null);
        let col = |k: &str| -> Vec<(f64, f64)> {
            v["series"]
                .as_array()
                .map(|a| {
                    a.iter()
                        .filter_map(|r| Some((r["t_s"].as_f64()? / 60.0, r[k].as_f64()?)))
                        .collect()
                })
                .unwrap_or_default()
        };
        let sub = format!(
            "{} | fixes {:.0}% | mean NEES {:.2} (6 expected) | MODELLED, advisory only",
            v["filter_model"].as_str().unwrap_or("?"),
            100.0 * v["fix_availability"].as_f64().unwrap_or(0.0),
            v["monte_carlo"]["mean_nees"].as_f64().unwrap_or(f64::NAN)
        );
        line_chart_svg(
            "Lunar rendezvous: formal relative position 1-sigma (3-D, m)",
            &sub,
            "minutes since the start of the arc",
            "metres",
            &[ChartSeries {
                name: "relative position 1-sigma",
                points: col("rel_pos_sigma_m"),
            }],
        )
    }

    /// Standalone entry: run the phase from the scenario's own prior and return `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let out = self.run_phase(&self.standalone_entry(), &default_ctx())?;
        let json = serde_json::to_string_pretty(&out.report).map_err(|e| e.to_string())?;
        Ok((json, out.summary))
    }
}

/// Compare the closed-form CW propagation with the numerical point-mass two-body relative orbit over one
/// orbit, for the scenario's separation. Returns the maximum relative-position difference and its ratio to
/// the separation.
fn cw_vs_numerical(cfg: &Resolved, epoch_jd: f64) -> Value {
    let pm = LunarForceModel {
        earth: false,
        sun: false,
        ..LunarForceModel::new(point_mass_field(), epoch_jd)
    };
    let tgt = elements_to_state(cfg.sma_m, 0.0, cfg.inc_deg, 0.0, cfg.argp_deg, cfg.m0_deg);
    let basis = lvlh_basis(tgt.r, tgt.v);
    let n = cw_dynamics::mean_motion(MOON_GM_M3_S2, cfg.sma_m);
    let rho = [0.0, -cfg.sep_m, 0.0];
    let d_r: Vec3 =
        std::array::from_fn(|i| basis[0][i] * rho[0] + basis[1][i] * rho[1] + basis[2][i] * rho[2]);
    let d_v = scl(cross(basis[2], d_r), n);
    let mut s_t: [f64; 6] = [tgt.r[0], tgt.r[1], tgt.r[2], tgt.v[0], tgt.v[1], tgt.v[2]];
    let mut s_c: [f64; 6] = std::array::from_fn(|i| {
        if i < 3 {
            tgt.r[i] + d_r[i]
        } else {
            tgt.v[i - 3] + d_v[i - 3]
        }
    });
    let period = 2.0 * std::f64::consts::PI / n;
    let h = 5.0;
    let steps = (period / h).round() as usize;
    let hh = period / steps as f64;
    let s0 = [rho[0], rho[1], rho[2], 0.0, 0.0, 0.0];
    let mut worst = 0.0f64;
    let mut t = 0.0;
    for _ in 0..steps {
        s_t = rk4(&pm, t, s_t, hh);
        s_c = rk4(&pm, t, s_c, hh);
        t += hh;
        let b = lvlh_basis([s_t[0], s_t[1], s_t[2]], [s_t[3], s_t[4], s_t[5]]);
        let d = sub([s_c[0], s_c[1], s_c[2]], [s_t[0], s_t[1], s_t[2]]);
        let num = rot(&b, d);
        let cw = cw_dynamics::propagate(n, t, &s0);
        worst = worst.max(norm(sub(num, [cw[0], cw[1], cw[2]])));
    }
    json!({
        "max_position_difference_m": worst,
        "ratio_to_separation": worst / cfg.sep_m,
        "separation_m": cfg.sep_m,
    })
}

fn units() -> Value {
    const ROWS: &[(&str, &str, &str, &str)] = &[
        ("orbit.sma_km", "km", "input", "target semi-major axis"),
        ("orbit.eccentricity", "1", "input", "target eccentricity"),
        ("orbit.inc_deg", "deg", "input", "target inclination"),
        ("orbit.argp_deg", "deg", "input", "argument of periapsis"),
        ("orbit.mean_anomaly_deg", "deg", "input", "target mean anomaly at the start of the arc"),
        ("orbit.period_s", "s", "closed-form", "Keplerian period of the target"),
        ("arc_s", "s", "computed", "arc length actually run (whole steps)"),
        ("separation_m", "m", "input", "initial along-track separation"),
        ("n_relays", "1", "input", "relays in the illustrative constellation"),
        ("sigma_afs_thermal_m", "m", "closed-form", "code-tracking bound on the AFS pilot at the stated C/N0"),
        ("sigma_isl_m", "m", "closed-form", "code-tracking bound on the crosslink at its C/N0"),
        ("sigma_sis_m", "m", "modelled-input", "signal-in-space user range error, LNIS nominal"),
        ("common_mode_fraction", "1", "modelled-input", "share of the signal-in-space variance common to both vehicles"),
        ("fix_availability", "1", "computed", "fraction of epochs with at least four unobstructed relays for both vehicles"),
        ("final_rel_pos_sigma_lvlh_m.radial", "m", "computed", "formal 1-sigma, target LVLH axis"),
        ("final_rel_pos_sigma_lvlh_m.along", "m", "computed", "formal 1-sigma, target LVLH axis"),
        ("final_rel_pos_sigma_lvlh_m.cross", "m", "computed", "formal 1-sigma, target LVLH axis"),
        ("final_rel_pos_sigma_lvlh_m.total", "m", "computed", "root sum square of the three axes"),
        ("converged_at_s", "s", "computed", "first time the formal 3-D relative position 1-sigma is at or below the threshold"),
        ("monte_carlo.trials", "1", "input", "Monte Carlo trials"),
        ("monte_carlo.rms_rel_pos_error_lvlh_m.radial", "m", "computed", "RMS error over trials"),
        ("monte_carlo.rms_rel_pos_error_lvlh_m.along", "m", "computed", "RMS error over trials"),
        ("monte_carlo.rms_rel_pos_error_lvlh_m.cross", "m", "computed", "RMS error over trials"),
        ("monte_carlo.rms_rel_vel_error_lvlh_mm_s.radial", "mm/s", "computed", "RMS error over trials"),
        ("monte_carlo.rms_rel_vel_error_lvlh_mm_s.along", "mm/s", "computed", "RMS error over trials"),
        ("monte_carlo.rms_rel_vel_error_lvlh_mm_s.cross", "mm/s", "computed", "RMS error over trials"),
        ("monte_carlo.mean_nees", "1", "computed", "mean normalised estimation error squared of the relative state; 6 expected for a consistent estimate"),
        ("monte_carlo.mean_nees_position", "1", "computed", "mean NEES of the relative position alone; 3 expected"),
        ("monte_carlo.mean_nees_velocity", "1", "computed", "mean NEES of the relative velocity alone; 3 expected"),
        ("monte_carlo.nees_dof", "1", "closed-form", "degrees of freedom of the relative state"),
        ("monte_carlo.mean_gauss_newton_iterations", "1", "computed", "mean Gauss-Newton iterations to converge"),
        ("unmodelled_gravity_relative_drift_m", "m", "computed", "relative-position drift over the arc from ignoring the harmonics, no measurements"),
        ("cw_check.max_position_difference_m", "m", "computed", "closed-form Hill propagation against the numerical two-body relative orbit, one orbit"),
        ("cw_check.ratio_to_separation", "1", "computed", "that difference over the separation"),
        ("cw_check.separation_m", "m", "input", "separation used for the check"),
        ("relative_sensors.range_m", "m", "input", "range at which the sensor model is evaluated"),
        ("relative_sensors.pos_sigma_m", "m", "computed", "the sensor's 3-D relative position 1-sigma at that range (ILLUSTRATIVE parameters)"),
        ("relative_sensors.vel_sigma_m_s", "m/s", "computed", "the sensor's relative velocity 1-sigma per axis at that range"),
        ("series.t_s", "s", "computed", "time since the start of the arc"),
        ("series.rel_pos_sigma_m", "m", "computed", "formal 3-D relative position 1-sigma from the data to that time"),
        ("series.rel_vel_sigma_mm_s", "mm/s", "computed", "formal 3-D relative velocity 1-sigma from the data to that time"),
        ("exit_state.pos_sigma_m", "m", "computed", "chaser absolute position 1-sigma per MCI axis at the end"),
        ("exit_state.vel_sigma_m_s", "m/s", "computed", "chaser absolute velocity 1-sigma per MCI axis at the end"),
        ("budget_rows.sigma_m", "m", "computed", "per-source 1-sigma in the budget table"),
    ];
    let mut m = serde_json::Map::new();
    for (path, unit, prov, note) in ROWS {
        m.insert(
            (*path).to_string(),
            json!({ "unit": unit, "provenance": prov, "note": note }),
        );
    }
    Value::Object(m)
}

#[cfg(test)]
mod tests {
    use super::*;

    fn quick() -> LunarRendezvousScenario {
        LunarRendezvousScenario {
            n_trials: Some(3),
            arc_s: Some(2400.0),
            step_s: Some(30.0),
            ..Default::default()
        }
    }

    #[test]
    fn default_runs_modelled_with_the_advisory_line() {
        let out = quick().run_phase(&default_entry(), &default_ctx()).unwrap();
        assert_eq!(out.report["kind"], "lunar-orbit-rendezvous");
        assert_eq!(out.report["label"], "MODELLED");
        assert!(out.report["advisory"]
            .as_str()
            .unwrap()
            .contains("not certified navigation equipment"));
    }

    #[test]
    fn same_seed_gives_identical_documents() {
        let a = quick().run_json().unwrap().0;
        let b = quick().run_json().unwrap().0;
        assert_eq!(a, b);
    }

    #[test]
    fn the_exit_state_is_a_valid_covariance_and_the_clock_only_aged() {
        let c = default_entry();
        let out = quick().run_phase(&c, &default_ctx()).unwrap();
        assert!(cov_is_valid(&out.exit.p));
        assert_eq!(out.exit.t_s, 2400.0);
        assert_eq!(out.exit.frame, Frame::Mci);
        assert!(out.exit.clock.cov[0][0] >= c.clock.cov[0][0]);
        assert_eq!(out.exit.upstream, c.upstream);
    }

    /// Pre-registered B1 matrix: both orbits at both stated C/N0 values, 200 trials, seed 20261024, default
    /// priors. The verdicts are pinned in `b1_verdicts_are_the_recorded_ones`.
    fn b1_matrix() -> Vec<(String, f64, f64)> {
        let mut rows = Vec::new();
        for orbit in ["llo", "elfo"] {
            for cn0 in [35.0, 45.0] {
                let s = LunarRendezvousScenario {
                    orbit: Some(orbit.into()),
                    n_trials: Some(200),
                    arc_s: Some(3600.0),
                    step_s: Some(30.0),
                    seed: Some(20_261_024),
                    afs_cn0_dbhz: Some(cn0),
                    isl_cn0_dbhz: Some(cn0),
                    ..Default::default()
                };
                let out = s.run_phase(&default_entry(), &default_ctx()).unwrap();
                let nees = out.report["monte_carlo"]["mean_nees"].as_f64().unwrap();
                println!(
                    "B1 {orbit} cn0 {cn0}: mean NEES {nees:.3} (pos {:.3}, vel {:.3}); iterations {:.1}; rel sigma {}",
                    out.report["monte_carlo"]["mean_nees_position"],
                    out.report["monte_carlo"]["mean_nees_velocity"],
                    out.report["monte_carlo"]["mean_gauss_newton_iterations"],
                    out.report["final_rel_pos_sigma_lvlh_m"]
                );
                rows.push((orbit.to_string(), cn0, nees));
            }
        }
        rows
    }

    /// The pre-registered B1 as recorded in xval/mission-thread-lunar/RESULTS.md: mean NEES of the relative
    /// state in [5.2, 6.8] for each configuration at both stated C/N0 values. It is MET with the batch
    /// estimator; the sequential filter it replaced missed it (the history is in RESULTS.md).
    #[test]
    fn b1_mean_nees_is_inside_the_registered_band_in_all_four_configurations() {
        for (orbit, cn0, nees) in b1_matrix() {
            assert!(
                (5.2..=6.8).contains(&nees),
                "{orbit} at {cn0} dB-Hz: mean NEES {nees}"
            );
        }
    }

    #[test]
    fn b6_handover_without_a_measurement_only_propagates() {
        let s = LunarRendezvousScenario {
            n_trials: Some(1),
            arc_s: Some(1200.0),
            step_s: Some(30.0),
            ..Default::default()
        };
        let carried = default_entry();
        let ctx = default_ctx();
        let out = s
            .run_inner(
                &carried,
                &ctx,
                Toggles {
                    position: false,
                    range: false,
                },
            )
            .unwrap();
        let cfg = s.resolve().unwrap();
        let field = lunar_field(None, 150).unwrap();
        let model = LunarForceModel::new(field, epoch_jd(&ctx, 0.0).unwrap());
        let (mut st, _) = nominal_states(&cfg);
        let mut phi = Dm::eye(6);
        let mut t = 0.0;
        for _ in 0..(cfg.arc_s / cfg.dt).round() as usize {
            let (next, step) = rk4_with_stm(&model, t, st, cfg.dt);
            phi = step.mul(&phi);
            st = next;
            t += cfg.dt;
        }
        let want = phi.mul(&cov_to_dm(&carried.p)).mul(&phi.t());
        let got = cov_to_dm(&out.exit.p);
        let scale = (0..6).map(|i| want.at(i, i).abs()).fold(0.0, f64::max);
        for i in 0..6 {
            for j in 0..6 {
                assert!(
                    (got.at(i, j) - want.at(i, j)).abs() <= 1e-12 * scale,
                    "({i},{j})"
                );
            }
        }
    }

    #[test]
    fn circular_cw_check_is_within_the_pre_registered_bar() {
        // B2: relative position difference at most 1 % of the separation plus 1 m, 1 km separation.
        let mut s = quick();
        s.separation_m = Some(1000.0);
        let out = s.run_phase(&default_entry(), &default_ctx()).unwrap();
        let d = out.report["cw_check"]["max_position_difference_m"]
            .as_f64()
            .unwrap();
        println!("B2 CW vs numerical at 1 km: {d:.3} m");
        assert!(d <= 0.01 * 1000.0 + 1.0, "CW vs numerical difference {d} m");
    }

    #[test]
    fn elliptical_orbit_runs_and_has_no_cw_check() {
        let mut s = quick();
        s.orbit = Some("elfo".into());
        let out = s.run_phase(&default_entry(), &default_ctx()).unwrap();
        assert!(out.report["cw_check"].is_null());
    }

    #[test]
    fn bad_inputs_are_rejected() {
        let mut s = quick();
        s.orbit = Some("geo".into());
        assert!(s.run_phase(&default_entry(), &default_ctx()).is_err());
        let mut s = quick();
        s.common_mode_fraction = Some(1.0);
        assert!(s.run_phase(&default_entry(), &default_ctx()).is_err());
        let mut c = default_entry();
        c.frame = Frame::Mcmf;
        assert!(quick().run_phase(&c, &default_ctx()).is_err());
    }

    #[test]
    fn code_ranging_sigma_scales_with_cn0() {
        let a = code_ranging_sigma_m(AFS_Q_CHIP_RATE, 40.0, 1.0);
        let b = code_ranging_sigma_m(AFS_Q_CHIP_RATE, 50.0, 1.0);
        assert!((a / b - 10f64.sqrt()).abs() < 1e-9);
    }
}
