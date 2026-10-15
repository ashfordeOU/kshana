// SPDX-License-Identifier: AGPL-3.0-only
//! Adaptive numerical ODE integration: classical RK4 with step-doubling control, a
//! Dormand–Prince RK5(4) embedded pair, and Hairer's DOP853 8(5,3) pair with dense output.
//!
//! Kshana's orbit propagation is analytic (SGP4/SDP4); this module is the *numerical* propagator's
//! integrator core. It offers three adaptive drivers for any first-order system `y' = f(t, y)` (an
//! orbit force model supplies `f(t, [r; v]) = [v; a(t, r, v)]`):
//!
//! * **Step doubling** ([`integrate`] / [`step_doubling`]) — a generic fixed-step fourth-order
//!   Runge–Kutta step ([`rk4_step`]) with Richardson local-error control: take one step `h` and
//!   two steps `h/2`, compare, and shrink or grow `h` to hold the error near tolerance.
//! * **Dormand–Prince RK5(4)** ([`integrate_dopri`] / [`dopri54_step`]) — the standard embedded
//!   Butcher-tableau pair: seven FSAL stages give a 5th-order solution and a 4th-order error
//!   estimate from one set of evaluations (7 vs 11 function calls per step), a cheaper error
//!   estimate than step doubling.
//!
//! * **DOP853** ([`integrate_dop853`] / [`integrate_dop853_checked`] / [`integrate_dop853_dense`],
//!   one step [`dop853_step`]) — Hairer, Nørsett and Wanner's 8th-order explicit Runge–Kutta
//!   method (12 stages, FSAL) with the combined 5th/3rd-order error estimator of `dop853.f`, the
//!   standard `0.9·err^(−1/8)` step controller (factor bounds 0.2–10, no PI term), Hairer's
//!   automatic initial step ([`dop853_initial_step`]), a fail-closed step guard
//!   (`max(h_min, 10·ulp(t))`, non-finite stages rejected) and the 7th-order continuous extension
//!   (`contd8`, three extra stages per step; [`Dop853DenseStep`]). The controller and
//!   function-evaluation count follow SciPy's `solve_ivp(method="DOP853")`, against which the
//!   driver is cross-validated (`tests/dop853_scipy_oracle.rs`, `xval/dop853-scipy/`).
//!
//! Scope (honest): no RKF7(8) pair, no stiffness detection and no event location; the
//! hierarchical orbit force model that turns this into a propagator lives in [`crate::forces`] /
//! [`crate::propagator`].

use crate::portable_math::PortableFloat;
/// One classical fourth-order Runge–Kutta step of size `h` from `(t, y)` for the
/// system `y' = f(t, y)`. The state is any fixed-length vector.
pub fn rk4_step<F>(f: &F, t: f64, y: &[f64], h: f64) -> Vec<f64>
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    let n = y.len();
    let k1 = f(t, y);
    let y2: Vec<f64> = (0..n).map(|i| y[i] + 0.5 * h * k1[i]).collect();
    let k2 = f(t + 0.5 * h, &y2);
    let y3: Vec<f64> = (0..n).map(|i| y[i] + 0.5 * h * k2[i]).collect();
    let k3 = f(t + 0.5 * h, &y3);
    let y4: Vec<f64> = (0..n).map(|i| y[i] + h * k3[i]).collect();
    let k4 = f(t + h, &y4);
    (0..n)
        .map(|i| y[i] + (h / 6.0) * (k1[i] + 2.0 * k2[i] + 2.0 * k3[i] + k4[i]))
        .collect()
}

/// Tolerances and step bounds for the adaptive driver.
#[derive(Clone, Copy, Debug)]
pub struct Tolerance {
    /// Relative tolerance per component.
    pub rtol: f64,
    /// Absolute tolerance per component (guards components passing through zero).
    pub atol: f64,
    /// Smallest step the controller will take before giving up.
    pub h_min: f64,
    /// Largest step the controller will take.
    pub h_max: f64,
}

impl Default for Tolerance {
    fn default() -> Self {
        Self {
            rtol: 1e-9,
            atol: 1e-12,
            h_min: 1e-12,
            h_max: f64::INFINITY,
        }
    }
}

/// One adaptive step by step doubling. Computes a full step `h` and two half steps,
/// estimates the local error from their difference (the two-half-step result is the
/// returned, more accurate, state), and proposes the next step size. Returns
/// `(y_next, error_norm, h_next)`.
///
/// For a 4th-order method the two-half-step error is ~`1/15` of the full-vs-half
/// difference; the next step targets the tolerance with the standard `0.9·(tol/err)^(1/5)`
/// controller (5 = order + 1), clamped to a 0.2×–5× change and the `[h_min, h_max]` bounds.
pub fn step_doubling<F>(f: &F, t: f64, y: &[f64], h: f64, tol: &Tolerance) -> (Vec<f64>, f64, f64)
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    let big = rk4_step(f, t, y, h);
    let half = rk4_step(f, t, y, 0.5 * h);
    let two_half = rk4_step(f, t + 0.5 * h, &half, 0.5 * h);
    // Richardson local-error estimate: (two_half − big) / (2^p − 1), p = 4.
    let mut err = 0.0_f64;
    for i in 0..y.len() {
        let diff = (two_half[i] - big[i]) / 15.0;
        let scale = tol.atol + tol.rtol * two_half[i].abs().max(y[i].abs());
        let r = diff / scale;
        err += r * r;
    }
    err = (err / y.len() as f64).sqrt();
    // Step controller: grow when err < 1, shrink when err > 1.
    let factor = if err > 0.0 {
        0.9 * err.ppowf(-0.2)
    } else {
        5.0
    };
    let h_next = (h * factor.clamp(0.2, 5.0)).clamp(tol.h_min, tol.h_max);
    (two_half, err, h_next)
}

/// The outcome of an adaptive integration.
#[derive(Clone, Debug)]
pub struct Solution {
    /// Final time reached.
    pub t: f64,
    /// Final state.
    pub y: Vec<f64>,
    /// Number of accepted steps.
    pub accepted: usize,
    /// Number of rejected (error-too-large) steps.
    pub rejected: usize,
}

/// Shared adaptive-integration driver behind [`integrate`] and [`integrate_dopri`]: it applies
/// `step` (one embedded / step-doubling step returning `(y_next, error_norm, h_next)`) with
/// accept/reject control, clipping the final step exactly to `t_end`. The loop is bounded by the
/// finest-resolution step count; normal runs exit via `t >= t_end` — the bound only guards a
/// pathological non-advancing run.
fn integrate_with<F, S>(
    f: &F,
    t0: f64,
    y0: &[f64],
    t_end: f64,
    h0: f64,
    tol: &Tolerance,
    step: S,
) -> Solution
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
    S: Fn(&F, f64, &[f64], f64, &Tolerance) -> (Vec<f64>, f64, f64),
{
    let mut t = t0;
    let mut y = y0.to_vec();
    let mut h = h0.max(tol.h_min).min(tol.h_max);
    let (mut accepted, mut rejected) = (0, 0);
    // Adaptive step count is data-dependent (rejected steps retry without advancing t),
    // so bound the loop generously by the finest-resolution step count; normal runs exit
    // via `t >= t_end` — this only guards a pathological non-advancing run.
    let max_steps = (((t_end - t0) / tol.h_min).ceil().max(1.0) as usize)
        .saturating_mul(64)
        .saturating_add(1024);
    for _ in 0..max_steps {
        if t >= t_end {
            break;
        }
        if t + h > t_end {
            h = t_end - t;
        }
        let (y_next, err, h_next) = step(f, t, &y, h, tol);
        if err <= 1.0 || h <= tol.h_min {
            t += h;
            y = y_next;
            accepted += 1;
            h = h_next;
        } else {
            rejected += 1;
            h = h_next;
        }
    }
    Solution {
        t,
        y,
        accepted,
        rejected,
    }
}

/// Integrate `y' = f(t, y)` from `t0` to `t_end` with adaptive step-doubling control,
/// starting from step `h0`. Steps that exceed the tolerance are rejected and retried
/// with the smaller proposed step; the final step is clipped exactly to `t_end`.
pub fn integrate<F>(f: &F, t0: f64, y0: &[f64], t_end: f64, h0: f64, tol: &Tolerance) -> Solution
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    integrate_with(f, t0, y0, t_end, h0, tol, step_doubling)
}

/// One **Dormand–Prince RK5(4)** embedded step of size `h` from `(t, y)`. Seven stages (FSAL)
/// produce a 5th-order solution `y_next` (the propagated value, local extrapolation) and an
/// embedded 4th-order solution; their difference `y₅ − y₄ = h·Σ eᵢ kᵢ` is the local-error
/// estimate — **one set of stage evaluations gives both orders**, far cheaper than step
/// doubling's three RK4 steps (7 vs 11 function evaluations per step). Returns
/// `(y_next, error_norm, h_next)` with the same RMS-error and `0.9·(1/err)^(1/5)` step controller
/// as [`step_doubling`], so it is a drop-in alternative. Coefficients are the standard
/// Dormand–Prince (1980) tableau.
pub fn dopri54_step<F>(f: &F, t: f64, y: &[f64], h: f64, tol: &Tolerance) -> (Vec<f64>, f64, f64)
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    let n = y.len();
    let k1 = f(t, y);
    let y2: Vec<f64> = (0..n).map(|i| y[i] + h * (k1[i] / 5.0)).collect();
    let k2 = f(t + h / 5.0, &y2);
    let y3: Vec<f64> = (0..n)
        .map(|i| y[i] + h * (3.0 / 40.0 * k1[i] + 9.0 / 40.0 * k2[i]))
        .collect();
    let k3 = f(t + 3.0 * h / 10.0, &y3);
    let y4: Vec<f64> = (0..n)
        .map(|i| y[i] + h * (44.0 / 45.0 * k1[i] - 56.0 / 15.0 * k2[i] + 32.0 / 9.0 * k3[i]))
        .collect();
    let k4 = f(t + 4.0 * h / 5.0, &y4);
    let y5: Vec<f64> = (0..n)
        .map(|i| {
            y[i] + h
                * (19372.0 / 6561.0 * k1[i] - 25360.0 / 2187.0 * k2[i] + 64448.0 / 6561.0 * k3[i]
                    - 212.0 / 729.0 * k4[i])
        })
        .collect();
    let k5 = f(t + 8.0 * h / 9.0, &y5);
    let y6: Vec<f64> = (0..n)
        .map(|i| {
            y[i] + h
                * (9017.0 / 3168.0 * k1[i] - 355.0 / 33.0 * k2[i]
                    + 46732.0 / 5247.0 * k3[i]
                    + 49.0 / 176.0 * k4[i]
                    - 5103.0 / 18656.0 * k5[i])
        })
        .collect();
    let k6 = f(t + h, &y6);
    // 5th-order solution (b₂ = b₇ = 0); the a₇ row equals these weights, so k₇ = f(t+h, y_next).
    let y_next: Vec<f64> = (0..n)
        .map(|i| {
            y[i] + h
                * (35.0 / 384.0 * k1[i] + 500.0 / 1113.0 * k3[i] + 125.0 / 192.0 * k4[i]
                    - 2187.0 / 6784.0 * k5[i]
                    + 11.0 / 84.0 * k6[i])
        })
        .collect();
    let k7 = f(t + h, &y_next);
    // Embedded error y₅ − y₄ = h·Σ eᵢ kᵢ, e = b − b* (the standard Dormand–Prince differences).
    let mut err = 0.0_f64;
    for i in 0..n {
        let ei = h
            * (71.0 / 57600.0 * k1[i] - 71.0 / 16695.0 * k3[i] + 71.0 / 1920.0 * k4[i]
                - 17253.0 / 339200.0 * k5[i]
                + 22.0 / 525.0 * k6[i]
                - 1.0 / 40.0 * k7[i]);
        let scale = tol.atol + tol.rtol * y_next[i].abs().max(y[i].abs());
        let r = ei / scale;
        err += r * r;
    }
    err = (err / n as f64).sqrt();
    let factor = if err > 0.0 {
        0.9 * err.ppowf(-0.2)
    } else {
        5.0
    };
    let h_next = (h * factor.clamp(0.2, 5.0)).clamp(tol.h_min, tol.h_max);
    (y_next, err, h_next)
}

/// Integrate `y' = f(t, y)` from `t0` to `t_end` with the adaptive **Dormand–Prince RK5(4)**
/// driver ([`dopri54_step`]) — the embedded-pair counterpart of [`integrate`] (which uses step
/// doubling). Same accept/reject logic and exact final-step clipping; returns the same
/// [`Solution`]. For the same tolerance this reaches the endpoint in fewer function evaluations
/// than the step-doubling driver (embedded error estimate vs three RK4 sub-steps).
pub fn integrate_dopri<F>(
    f: &F,
    t0: f64,
    y0: &[f64],
    t_end: f64,
    h0: f64,
    tol: &Tolerance,
) -> Solution
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    integrate_with(f, t0, y0, t_end, h0, tol, dopri54_step)
}

// ─────────────────────────────────────────────────────────────────────────────────────────────
// DOP853: the Hairer–Nørsett–Wanner explicit Runge–Kutta 8(5,3) pair with 7th-order dense output.
// ─────────────────────────────────────────────────────────────────────────────────────────────

/// Number of stages of one DOP853 step (the 13th, FSAL, stage is `f(t+h, y_new)`).
const DOP853_STAGES: usize = 12;
/// Stages including the three extra ones the dense output needs.
const DOP853_STAGES_EXTENDED: usize = 16;
/// Number of coefficient rows of the dense-output polynomial (degree 7).
const DOP853_DENSE_ROWS: usize = 7;
/// Step-size controller safety factor (Hairer; SciPy `SAFETY`).
const DOP853_SAFETY: f64 = 0.9;
/// Largest step decrease per attempt (SciPy `MIN_FACTOR`).
const DOP853_MIN_FACTOR: f64 = 0.2;
/// Largest step increase per accepted step (SciPy `MAX_FACTOR`).
const DOP853_MAX_FACTOR: f64 = 10.0;
/// Error exponent `−1/(q+1)` with the error estimator order `q = 7`.
const DOP853_ERROR_EXPONENT: f64 = -1.0 / 8.0;

/// The DOP853 Butcher tableau, the embedded 5th- and 3rd-order error weights and the dense-output
/// coefficients. The numbers are those of Hairer's `dop853.f` (E. Hairer, S. P. Nørsett,
/// G. Wanner, *Solving Ordinary Differential Equations I*, 2nd ed., Springer 1993, §II.10), in the
/// row layout of SciPy's `scipy/integrate/_ivp/dop853_coefficients.py` (BSD-3-Clause), which
/// stores the weights `b` as row 12 of `a` and the three dense-output stages as rows 13–15.
struct Dop853Tableau {
    c: [f64; DOP853_STAGES_EXTENDED],
    a: [[f64; DOP853_STAGES_EXTENDED]; DOP853_STAGES_EXTENDED],
    b: [f64; DOP853_STAGES],
    e3: [f64; DOP853_STAGES + 1],
    e5: [f64; DOP853_STAGES + 1],
    d: [[f64; DOP853_STAGES_EXTENDED]; 4],
}

fn dop853_tableau() -> &'static Dop853Tableau {
    static TABLEAU: std::sync::OnceLock<Dop853Tableau> = std::sync::OnceLock::new();
    TABLEAU.get_or_init(build_dop853_tableau)
}

#[allow(clippy::excessive_precision)]
fn build_dop853_tableau() -> Dop853Tableau {
    let c = [
        0.0,
        0.526001519587677318785587544488e-01,
        0.789002279381515978178381316732e-01,
        0.118350341907227396726757197510,
        0.281649658092772603273242802490,
        0.333333333333333333333333333333,
        0.25,
        0.307692307692307692307692307692,
        0.651282051282051282051282051282,
        0.6,
        0.857142857142857142857142857142,
        1.0,
        1.0,
        0.1,
        0.2,
        0.777777777777777777777777777778,
    ];
    let mut a = [[0.0_f64; DOP853_STAGES_EXTENDED]; DOP853_STAGES_EXTENDED];
    a[1][0] = 5.26001519587677318785587544488e-2;

    a[2][0] = 1.97250569845378994544595329183e-2;
    a[2][1] = 5.91751709536136983633785987549e-2;

    a[3][0] = 2.95875854768068491816892993775e-2;
    a[3][2] = 8.87627564304205475450678981324e-2;

    a[4][0] = 2.41365134159266685502369798665e-1;
    a[4][2] = -8.84549479328286085344864962717e-1;
    a[4][3] = 9.24834003261792003115737966543e-1;

    a[5][0] = 3.7037037037037037037037037037e-2;
    a[5][3] = 1.70828608729473871279604482173e-1;
    a[5][4] = 1.25467687566822425016691814123e-1;

    a[6][0] = 3.7109375e-2;
    a[6][3] = 1.70252211019544039314978060272e-1;
    a[6][4] = 6.02165389804559606850219397283e-2;
    a[6][5] = -1.7578125e-2;

    a[7][0] = 3.70920001185047927108779319836e-2;
    a[7][3] = 1.70383925712239993810214054705e-1;
    a[7][4] = 1.07262030446373284651809199168e-1;
    a[7][5] = -1.53194377486244017527936158236e-2;
    a[7][6] = 8.27378916381402288758473766002e-3;

    a[8][0] = 6.24110958716075717114429577812e-1;
    a[8][3] = -3.36089262944694129406857109825;
    a[8][4] = -8.68219346841726006818189891453e-1;
    a[8][5] = 2.75920996994467083049415600797e1;
    a[8][6] = 2.01540675504778934086186788979e1;
    a[8][7] = -4.34898841810699588477366255144e1;

    a[9][0] = 4.77662536438264365890433908527e-1;
    a[9][3] = -2.48811461997166764192642586468;
    a[9][4] = -5.90290826836842996371446475743e-1;
    a[9][5] = 2.12300514481811942347288949897e1;
    a[9][6] = 1.52792336328824235832596922938e1;
    a[9][7] = -3.32882109689848629194453265587e1;
    a[9][8] = -2.03312017085086261358222928593e-2;

    a[10][0] = -9.3714243008598732571704021658e-1;
    a[10][3] = 5.18637242884406370830023853209;
    a[10][4] = 1.09143734899672957818500254654;
    a[10][5] = -8.14978701074692612513997267357;
    a[10][6] = -1.85200656599969598641566180701e1;
    a[10][7] = 2.27394870993505042818970056734e1;
    a[10][8] = 2.49360555267965238987089396762;
    a[10][9] = -3.0467644718982195003823669022;

    a[11][0] = 2.27331014751653820792359768449;
    a[11][3] = -1.05344954667372501984066689879e1;
    a[11][4] = -2.00087205822486249909675718444;
    a[11][5] = -1.79589318631187989172765950534e1;
    a[11][6] = 2.79488845294199600508499808837e1;
    a[11][7] = -2.85899827713502369474065508674;
    a[11][8] = -8.87285693353062954433549289258;
    a[11][9] = 1.23605671757943030647266201528e1;
    a[11][10] = 6.43392746015763530355970484046e-1;

    a[12][0] = 5.42937341165687622380535766363e-2;
    a[12][5] = 4.45031289275240888144113950566;
    a[12][6] = 1.89151789931450038304281599044;
    a[12][7] = -5.8012039600105847814672114227;
    a[12][8] = 3.1116436695781989440891606237e-1;
    a[12][9] = -1.52160949662516078556178806805e-1;
    a[12][10] = 2.01365400804030348374776537501e-1;
    a[12][11] = 4.47106157277725905176885569043e-2;

    a[13][0] = 5.61675022830479523392909219681e-2;
    a[13][6] = 2.53500210216624811088794765333e-1;
    a[13][7] = -2.46239037470802489917441475441e-1;
    a[13][8] = -1.24191423263816360469010140626e-1;
    a[13][9] = 1.5329179827876569731206322685e-1;
    a[13][10] = 8.20105229563468988491666602057e-3;
    a[13][11] = 7.56789766054569976138603589584e-3;
    a[13][12] = -8.298e-3;

    a[14][0] = 3.18346481635021405060768473261e-2;
    a[14][5] = 2.83009096723667755288322961402e-2;
    a[14][6] = 5.35419883074385676223797384372e-2;
    a[14][7] = -5.49237485713909884646569340306e-2;
    a[14][10] = -1.08347328697249322858509316994e-4;
    a[14][11] = 3.82571090835658412954920192323e-4;
    a[14][12] = -3.40465008687404560802977114492e-4;
    a[14][13] = 1.41312443674632500278074618366e-1;

    a[15][0] = -4.28896301583791923408573538692e-1;
    a[15][5] = -4.69762141536116384314449447206;
    a[15][6] = 7.68342119606259904184240953878;
    a[15][7] = 4.06898981839711007970213554331;
    a[15][8] = 3.56727187455281109270669543021e-1;
    a[15][12] = -1.39902416515901462129418009734e-3;
    a[15][13] = 2.9475147891527723389556272149;
    a[15][14] = -9.15095847217987001081870187138;

    let mut b = [0.0_f64; DOP853_STAGES];
    b.copy_from_slice(&a[DOP853_STAGES][..DOP853_STAGES]);

    // 3rd-order error weights: b − b̂ with Hairer's bhh₁, bhh₂, bhh₃ (stages 0, 8, 11).
    let mut e3 = [0.0_f64; DOP853_STAGES + 1];
    e3[..DOP853_STAGES].copy_from_slice(&b);
    e3[0] -= 0.244094488188976377952755905512;
    e3[8] -= 0.733846688281611857341361741547;
    e3[11] -= 0.220588235294117647058823529412e-1;

    // 5th-order error weights (Hairer's er1 … er12).
    let mut e5 = [0.0_f64; DOP853_STAGES + 1];
    e5[0] = 0.1312004499419488073250102996e-1;
    e5[5] = -0.1225156446376204440720569753e+1;
    e5[6] = -0.4957589496572501915214079952;
    e5[7] = 0.1664377182454986536961530415e+1;
    e5[8] = -0.3503288487499736816886487290;
    e5[9] = 0.3341791187130174790297318841;
    e5[10] = 0.8192320648511571246570742613e-1;
    e5[11] = -0.2235530786388629525884427845e-1;

    // Dense-output coefficients (Hairer's d4xx … d7xx): rows 3–6 of the interpolant.
    let mut d = [[0.0_f64; DOP853_STAGES_EXTENDED]; 4];
    d[0][0] = -0.84289382761090128651353491142e+1;
    d[0][5] = 0.56671495351937776962531783590;
    d[0][6] = -0.30689499459498916912797304727e+1;
    d[0][7] = 0.23846676565120698287728149680e+1;
    d[0][8] = 0.21170345824450282767155149946e+1;
    d[0][9] = -0.87139158377797299206789907490;
    d[0][10] = 0.22404374302607882758541771650e+1;
    d[0][11] = 0.63157877876946881815570249290;
    d[0][12] = -0.88990336451333310820698117400e-1;
    d[0][13] = 0.18148505520854727256656404962e+2;
    d[0][14] = -0.91946323924783554000451984436e+1;
    d[0][15] = -0.44360363875948939664310572000e+1;

    d[1][0] = 0.10427508642579134603413151009e+2;
    d[1][5] = 0.24228349177525818288430175319e+3;
    d[1][6] = 0.16520045171727028198505394887e+3;
    d[1][7] = -0.37454675472269020279518312152e+3;
    d[1][8] = -0.22113666853125306036270938578e+2;
    d[1][9] = 0.77334326684722638389603898808e+1;
    d[1][10] = -0.30674084731089398182061213626e+2;
    d[1][11] = -0.93321305264302278729567221706e+1;
    d[1][12] = 0.15697238121770843886131091075e+2;
    d[1][13] = -0.31139403219565177677282850411e+2;
    d[1][14] = -0.93529243588444783865713862664e+1;
    d[1][15] = 0.35816841486394083752465898540e+2;

    d[2][0] = 0.19985053242002433820987653617e+2;
    d[2][5] = -0.38703730874935176555105901742e+3;
    d[2][6] = -0.18917813819516756882830838328e+3;
    d[2][7] = 0.52780815920542364900561016686e+3;
    d[2][8] = -0.11573902539959630126141871134e+2;
    d[2][9] = 0.68812326946963000169666922661e+1;
    d[2][10] = -0.10006050966910838403183860980e+1;
    d[2][11] = 0.77771377980534432092869265740;
    d[2][12] = -0.27782057523535084065932004339e+1;
    d[2][13] = -0.60196695231264120758267380846e+2;
    d[2][14] = 0.84320405506677161018159903784e+2;
    d[2][15] = 0.11992291136182789328035130030e+2;

    d[3][0] = -0.25693933462703749003312586129e+2;
    d[3][5] = -0.15418974869023643374053993627e+3;
    d[3][6] = -0.23152937917604549567536039109e+3;
    d[3][7] = 0.35763911791061412378285349910e+3;
    d[3][8] = 0.93405324183624310003907691704e+2;
    d[3][9] = -0.37458323136451633156875139351e+2;
    d[3][10] = 0.10409964950896230045147246184e+3;
    d[3][11] = 0.29840293426660503123344363579e+2;
    d[3][12] = -0.43533456590011143754432175058e+2;
    d[3][13] = 0.96324553959188282948394950600e+2;
    d[3][14] = -0.39177261675615439165231486172e+2;
    d[3][15] = -0.14972683625798562581422125276e+3;

    Dop853Tableau { c, a, b, e3, e5, d }
}

/// `Σⱼ wⱼ·kⱼ[i]` over the given stage rows, summed in stage order.
fn stage_combination(k: &[Vec<f64>], w: &[f64], i: usize) -> f64 {
    let mut s = 0.0;
    for (kj, wj) in k.iter().zip(w) {
        s += wj * kj[i];
    }
    s
}

/// The result of one DOP853 step attempt ([`dop853_step`]).
#[derive(Clone, Debug)]
pub struct Dop853StepResult {
    /// The 8th-order solution at `t + h`.
    pub y_new: Vec<f64>,
    /// `f(t + h, y_new)`: the FSAL derivative, the first stage of the next step.
    pub f_new: Vec<f64>,
    /// The scaled error norm of Hairer's combined 5th/3rd-order estimator (accept when `< 1`).
    pub error_norm: f64,
    /// The 13 stage derivatives `k₀ … k₁₂` (`k₀ = f(t, y)`, `k₁₂ = f_new`).
    pub stages: Vec<Vec<f64>>,
}

/// One **DOP853** step of size `h` from `(t, y)` with the known derivative `f0 = f(t, y)`
/// (11 new stage evaluations plus the FSAL `f(t+h, y_new)`: 12 function calls).
///
/// The error norm is Hairer's (`dop853.f`, as in SciPy's `DOP853._estimate_error_norm`):
/// with `sᵢ = atol + rtol·max(|yᵢ|, |y_newᵢ|)`, `err5ᵢ = Σ E5ⱼ kⱼᵢ / sᵢ`, `err3ᵢ = Σ E3ⱼ kⱼᵢ / sᵢ`,
/// `‖err‖ = |h|·Σerr5² / √((Σerr5² + 0.01·Σerr3²)·n)`: the 5th-order estimate, damped by the
/// 3rd-order one where the 5th is unreliably small.
pub fn dop853_step<F>(
    f: &F,
    t: f64,
    y: &[f64],
    f0: &[f64],
    h: f64,
    tol: &Tolerance,
) -> Dop853StepResult
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    let tab = dop853_tableau();
    let n = y.len();
    let mut k: Vec<Vec<f64>> = Vec::with_capacity(DOP853_STAGES + 1);
    k.push(f0.to_vec());
    let mut ys = vec![0.0; n];
    for s in 1..DOP853_STAGES {
        for (i, ysi) in ys.iter_mut().enumerate() {
            *ysi = y[i] + stage_combination(&k, &tab.a[s][..s], i) * h;
        }
        let ks = f(t + tab.c[s] * h, &ys);
        k.push(ks);
    }
    let y_new: Vec<f64> = (0..n)
        .map(|i| y[i] + h * stage_combination(&k, &tab.b, i))
        .collect();
    let f_new = f(t + h, &y_new);
    k.push(f_new.clone());
    let (mut e5n2, mut e3n2) = (0.0_f64, 0.0_f64);
    for i in 0..n {
        let scale = tol.atol + y[i].abs().max(y_new[i].abs()) * tol.rtol;
        let e5 = stage_combination(&k, &tab.e5, i) / scale;
        let e3 = stage_combination(&k, &tab.e3, i) / scale;
        e5n2 += e5 * e5;
        e3n2 += e3 * e3;
    }
    let error_norm = if e5n2 == 0.0 && e3n2 == 0.0 {
        0.0
    } else {
        let denom = e5n2 + 0.01 * e3n2;
        h.abs() * e5n2 / (denom * n as f64).sqrt()
    };
    Dop853StepResult {
        y_new,
        f_new,
        error_norm,
        stages: k,
    }
}

/// One accepted DOP853 step's **7th-order continuous extension** (Hairer's `contd8`): a degree-7
/// polynomial in `θ = (t − t_old)/h` through `y_old` and `y_new`, built from the step's 13 stages
/// plus three extra stage evaluations. Evaluate with [`eval`](Self::eval).
#[derive(Clone, Debug)]
pub struct Dop853DenseStep {
    /// Start of the step.
    pub t_old: f64,
    /// End of the step.
    pub t_new: f64,
    /// State at `t_old`.
    pub y_old: Vec<f64>,
    /// The seven coefficient rows `F₀ … F₆` (Hairer's `rcont2 … rcont8`).
    pub coeffs: Vec<Vec<f64>>,
}

impl Dop853DenseStep {
    /// The interpolated state at `t` (meaningful for `t` within the step; it reproduces `y_old`
    /// at `t_old` and the step's solution at `t_new`). The nested evaluation is Hairer's
    /// `contd8` (and SciPy's `Dop853DenseOutput`): alternate factors `θ` and `1 − θ`.
    pub fn eval(&self, t: f64) -> Vec<f64> {
        let h = self.t_new - self.t_old;
        let x = (t - self.t_old) / h;
        let n = self.y_old.len();
        let mut y = vec![0.0; n];
        for (idx, row) in self.coeffs.iter().rev().enumerate() {
            let factor = if idx % 2 == 0 { x } else { 1.0 - x };
            for (yi, ri) in y.iter_mut().zip(row) {
                *yi = (*yi + ri) * factor;
            }
        }
        for (yi, y0) in y.iter_mut().zip(&self.y_old) {
            *yi += y0;
        }
        y
    }
}

/// Build the dense-output record of an accepted step from its 13 stages (three extra function
/// evaluations: Hairer's stages 14–16).
fn dop853_dense_step<F>(
    f: &F,
    t_old: f64,
    t_new: f64,
    y_old: &[f64],
    h: f64,
    step: &Dop853StepResult,
) -> Dop853DenseStep
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    let tab = dop853_tableau();
    let n = y_old.len();
    let mut k = step.stages.clone();
    let mut ys = vec![0.0; n];
    for s in (DOP853_STAGES + 1)..DOP853_STAGES_EXTENDED {
        for (i, ysi) in ys.iter_mut().enumerate() {
            *ysi = y_old[i] + stage_combination(&k, &tab.a[s][..s], i) * h;
        }
        let ks = f(t_old + tab.c[s] * h, &ys);
        k.push(ks);
    }
    let f_old = &k[0];
    let mut coeffs = vec![vec![0.0; n]; DOP853_DENSE_ROWS];
    for i in 0..n {
        let dy = step.y_new[i] - y_old[i];
        coeffs[0][i] = dy;
        coeffs[1][i] = h * f_old[i] - dy;
        coeffs[2][i] = 2.0 * dy - h * (step.f_new[i] + f_old[i]);
        for (r, dr) in tab.d.iter().enumerate() {
            coeffs[3 + r][i] = h * stage_combination(&k, dr, i);
        }
    }
    Dop853DenseStep {
        t_old,
        t_new,
        y_old: y_old.to_vec(),
        coeffs,
    }
}

/// RMS norm `√(Σ(xᵢ/sᵢ)²/n)`.
fn rms_scaled(x: &[f64], scale: &[f64]) -> f64 {
    let s: f64 = x.iter().zip(scale).map(|(a, b)| (a / b) * (a / b)).sum();
    (s / x.len() as f64).sqrt()
}

/// Hairer's automatic **initial step** (`hinit` of `dop853.f`; SciPy's `select_initial_step`) for
/// DOP853 (error-estimator order 7): an explicit-Euler probe that sizes the first step from the
/// scaled norms of `y0`, `f0` and the derivative's change. Costs one function evaluation.
pub fn dop853_initial_step<F>(
    f: &F,
    t0: f64,
    y0: &[f64],
    f0: &[f64],
    t_end: f64,
    tol: &Tolerance,
) -> f64
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    if y0.is_empty() {
        return f64::INFINITY;
    }
    let interval = (t_end - t0).abs();
    if interval == 0.0 {
        return 0.0;
    }
    let direction = if t_end >= t0 { 1.0 } else { -1.0 };
    let scale: Vec<f64> = y0.iter().map(|y| tol.atol + y.abs() * tol.rtol).collect();
    let d0 = rms_scaled(y0, &scale);
    let d1 = rms_scaled(f0, &scale);
    let mut h0 = if d0 < 1e-5 || d1 < 1e-5 {
        1e-6
    } else {
        0.01 * d0 / d1
    };
    h0 = h0.min(interval);
    let y1: Vec<f64> = y0
        .iter()
        .zip(f0)
        .map(|(y, fy)| y + h0 * direction * fy)
        .collect();
    let f1 = f(t0 + h0 * direction, &y1);
    let df: Vec<f64> = f1.iter().zip(f0).map(|(a, b)| a - b).collect();
    let d2 = rms_scaled(&df, &scale) / h0;
    let h1 = if d1 <= 1e-15 && d2 <= 1e-15 {
        (h0 * 1e-3).max(1e-6)
    } else {
        (0.01 / d1.max(d2)).ppowf(1.0 / 8.0)
    };
    (100.0 * h0).min(h1).min(interval).min(tol.h_max)
}

/// Why a DOP853 integration stopped short of `t_end`.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Dop853Failure {
    /// The initial time, end time, first step or state, or `f(t0, y0)`, is not finite.
    NonFiniteInput,
    /// The step size fell below the guard `max(h_min, 10·ulp(t))` because the tolerance could
    /// not be met.
    StepSizeTooSmall,
    /// As `StepSizeTooSmall`, the last attempt having produced a non-finite stage or state.
    NonFiniteState,
    /// The attempt budget was exhausted (a guard; a normal run never reaches it).
    MaxStepsExceeded,
}

/// A failed DOP853 run: the reason, and the last accepted point (never a non-finite state).
#[derive(Clone, Debug)]
pub struct Dop853Error {
    /// Why it stopped.
    pub failure: Dop853Failure,
    /// Time of the last accepted step (`t0` if none).
    pub t: f64,
    /// State at `t`.
    pub y: Vec<f64>,
    /// Accepted steps before stopping.
    pub accepted: usize,
    /// Rejected attempts before stopping.
    pub rejected: usize,
    /// Function evaluations spent.
    pub nfev: usize,
}

impl core::fmt::Display for Dop853Error {
    fn fmt(&self, f: &mut core::fmt::Formatter<'_>) -> core::fmt::Result {
        write!(
            f,
            "DOP853 stopped at t = {} ({:?}) after {} accepted steps",
            self.t, self.failure, self.accepted
        )
    }
}

impl std::error::Error for Dop853Error {}

/// A completed DOP853 run.
#[derive(Clone, Debug)]
pub struct Dop853Run {
    /// Final time (exactly `t_end`).
    pub t: f64,
    /// Final state.
    pub y: Vec<f64>,
    /// Accepted steps.
    pub accepted: usize,
    /// Rejected attempts.
    pub rejected: usize,
    /// Function evaluations, counted as SciPy's `solve_ivp` counts `nfev`: one for `f(t0, y0)`,
    /// one for the automatic initial step (when `h0` was not given), 12 per attempt and, with
    /// dense output, 3 per accepted step.
    pub nfev: usize,
    /// One dense-output record per accepted step (empty unless requested).
    pub dense: Vec<Dop853DenseStep>,
}

impl Dop853Run {
    /// The dense-output interpolant at `t` (`None` without dense output or outside the
    /// integrated span). At an interior step boundary the later step is used.
    pub fn eval(&self, t: f64) -> Option<Vec<f64>> {
        let first = self.dense.first()?;
        let last = self.dense.last()?;
        let forward = last.t_new >= first.t_old;
        let (lo, hi) = if forward {
            (first.t_old, last.t_new)
        } else {
            (last.t_new, first.t_old)
        };
        if !(t >= lo && t <= hi) {
            return None;
        }
        // Steps are ordered along the direction of integration: the first whose end is past `t`.
        let idx = self
            .dense
            .partition_point(|s| if forward { s.t_new <= t } else { s.t_new >= t });
        let idx = idx.min(self.dense.len() - 1);
        Some(self.dense[idx].eval(t))
    }
}

fn all_finite(v: &[f64]) -> bool {
    v.iter().all(|x| x.is_finite())
}

/// The next representable `f64` after the finite `x` in the direction of `direction` (±1).
fn next_toward(x: f64, direction: f64) -> f64 {
    if x == 0.0 {
        let tiny = f64::from_bits(1);
        return if direction > 0.0 { tiny } else { -tiny };
    }
    let bits = x.to_bits();
    let away_from_zero = (direction > 0.0) == (x > 0.0);
    f64::from_bits(if away_from_zero { bits + 1 } else { bits - 1 })
}

/// The DOP853 driver behind [`integrate_dop853`], [`integrate_dop853_checked`] and
/// [`integrate_dop853_dense`].
///
/// The step-size controller is the standard one of Hairer and SciPy (no PI term): after an
/// attempt with error norm `err`, the next step is `h·min(10, 0.9·err^(−1/8))` when accepted
/// (`10` when `err = 0`; capped at `1` right after a rejection) and `h·max(0.2, 0.9·err^(−1/8))`
/// when rejected; the step is clipped to `h_max` and to land exactly on `t_end`. A step below
/// `max(h_min, 10·ulp(t))` stops the run with an error; a non-finite stage is treated as a
/// rejection (step × 0.2), so a run that keeps producing them also stops at that guard (fail
/// closed: the state carried by the error is always the last finite accepted one).
fn dop853_drive<F>(
    f: &F,
    t0: f64,
    y0: &[f64],
    t_end: f64,
    h0: f64,
    tol: &Tolerance,
    dense: bool,
) -> Result<Dop853Run, Dop853Error>
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    let mut t = t0;
    let mut y = y0.to_vec();
    let (mut accepted, mut rejected, mut nfev) = (0usize, 0usize, 0usize);
    let fail = |failure, t: f64, y: &[f64], accepted, rejected, nfev| Dop853Error {
        failure,
        t,
        y: y.to_vec(),
        accepted,
        rejected,
        nfev,
    };
    if !(t0.is_finite() && t_end.is_finite() && all_finite(y0)) || h0.is_nan() {
        return Err(fail(Dop853Failure::NonFiniteInput, t, &y, 0, 0, 0));
    }
    let mut steps = Vec::new();
    if t_end == t0 {
        return Ok(Dop853Run {
            t,
            y,
            accepted,
            rejected,
            nfev,
            dense: steps,
        });
    }
    let direction = if t_end > t0 { 1.0 } else { -1.0 };
    let mut fy = f(t, &y);
    nfev += 1;
    if !all_finite(&fy) {
        return Err(fail(Dop853Failure::NonFiniteInput, t, &y, 0, 0, nfev));
    }
    let mut h_abs = if h0 > 0.0 && h0.is_finite() {
        h0
    } else {
        nfev += 1;
        dop853_initial_step(f, t0, &y, &fy, t_end, tol)
    };
    let max_attempts = (((t_end - t0).abs() / tol.h_min.max(f64::MIN_POSITIVE)).ceil() as usize)
        .saturating_mul(64)
        .saturating_add(1024);
    let mut attempts = 0usize;
    while direction * (t_end - t) > 0.0 {
        let min_step = (10.0 * (next_toward(t, direction) - t).abs()).max(tol.h_min);
        if h_abs > tol.h_max {
            h_abs = tol.h_max;
        } else if h_abs < min_step {
            h_abs = min_step;
        }
        let mut step_rejected = false;
        let mut last_nonfinite = false;
        loop {
            if h_abs < min_step {
                let why = if last_nonfinite {
                    Dop853Failure::NonFiniteState
                } else {
                    Dop853Failure::StepSizeTooSmall
                };
                return Err(fail(why, t, &y, accepted, rejected, nfev));
            }
            attempts += 1;
            if attempts > max_attempts {
                return Err(fail(
                    Dop853Failure::MaxStepsExceeded,
                    t,
                    &y,
                    accepted,
                    rejected,
                    nfev,
                ));
            }
            let mut t_new = t + h_abs * direction;
            if direction * (t_new - t_end) > 0.0 {
                t_new = t_end;
            }
            let h = t_new - t;
            h_abs = h.abs();
            let step = dop853_step(f, t, &y, &fy, h, tol);
            nfev += DOP853_STAGES;
            let finite =
                step.error_norm.is_finite() && all_finite(&step.y_new) && all_finite(&step.f_new);
            if finite && step.error_norm < 1.0 {
                let mut factor = if step.error_norm == 0.0 {
                    DOP853_MAX_FACTOR
                } else {
                    DOP853_MAX_FACTOR
                        .min(DOP853_SAFETY * step.error_norm.ppowf(DOP853_ERROR_EXPONENT))
                };
                if step_rejected {
                    factor = factor.min(1.0);
                }
                h_abs *= factor;
                if dense {
                    let rec = dop853_dense_step(f, t, t_new, &y, h, &step);
                    nfev += DOP853_STAGES_EXTENDED - DOP853_STAGES - 1;
                    if !rec.coeffs.iter().all(|r| all_finite(r)) {
                        return Err(fail(
                            Dop853Failure::NonFiniteState,
                            t,
                            &y,
                            accepted,
                            rejected,
                            nfev,
                        ));
                    }
                    steps.push(rec);
                }
                t = t_new;
                y = step.y_new;
                fy = step.f_new;
                accepted += 1;
                break;
            }
            last_nonfinite = !finite;
            h_abs *= if finite {
                DOP853_MIN_FACTOR.max(DOP853_SAFETY * step.error_norm.ppowf(DOP853_ERROR_EXPONENT))
            } else {
                DOP853_MIN_FACTOR
            };
            step_rejected = true;
            rejected += 1;
        }
    }
    Ok(Dop853Run {
        t,
        y,
        accepted,
        rejected,
        nfev,
        dense: steps,
    })
}

/// Integrate `y' = f(t, y)` from `t0` to `t_end` (either direction) with the adaptive **DOP853**
/// driver: Hairer's 8th-order explicit Runge–Kutta method with the combined 5th/3rd-order error
/// estimate and the standard step controller (see [`dop853_step`]). `h0 > 0` is the first step;
/// `h0 ≤ 0` (or infinite) selects it automatically ([`dop853_initial_step`]). Returns the same
/// [`Solution`] as [`integrate_dopri`]. **Fails closed:** if the run stops early (non-finite input
/// or stages, step below the `h_min` guard) the returned `t` is the last accepted time, short of
/// `t_end`, and `y` the finite state there; [`integrate_dop853_checked`] gives the reason.
pub fn integrate_dop853<F>(
    f: &F,
    t0: f64,
    y0: &[f64],
    t_end: f64,
    h0: f64,
    tol: &Tolerance,
) -> Solution
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    match dop853_drive(f, t0, y0, t_end, h0, tol, false) {
        Ok(run) => Solution {
            t: run.t,
            y: run.y,
            accepted: run.accepted,
            rejected: run.rejected,
        },
        Err(e) => Solution {
            t: e.t,
            y: e.y,
            accepted: e.accepted,
            rejected: e.rejected,
        },
    }
}

/// [`integrate_dop853`] returning the full run record (function-evaluation count included) or
/// the reason it stopped short of `t_end`.
pub fn integrate_dop853_checked<F>(
    f: &F,
    t0: f64,
    y0: &[f64],
    t_end: f64,
    h0: f64,
    tol: &Tolerance,
) -> Result<Dop853Run, Dop853Error>
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    dop853_drive(f, t0, y0, t_end, h0, tol, false)
}

/// [`integrate_dop853_checked`] with **dense output**: each accepted step also records its
/// 7th-order continuous extension (three extra function evaluations per step), and
/// [`Dop853Run::eval`] interpolates the solution anywhere in the integrated span. The step
/// sequence and final state are identical to the run without dense output.
pub fn integrate_dop853_dense<F>(
    f: &F,
    t0: f64,
    y0: &[f64],
    t_end: f64,
    h0: f64,
    tol: &Tolerance,
) -> Result<Dop853Run, Dop853Error>
where
    F: Fn(f64, &[f64]) -> Vec<f64>,
{
    dop853_drive(f, t0, y0, t_end, h0, tol, true)
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn rk4_integrates_exponential_growth() {
        // y' = y, y(0) = 1 → y(1) = e. RK4 with a small fixed step is near-exact.
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let mut y = vec![1.0];
        let h = 0.001_f64;
        let mut t = 0.0;
        let n_steps = (((1.0 - 1e-9) / h).ceil().max(0.0) as usize).saturating_add(2);
        for _ in 0..n_steps {
            if t >= 1.0 - 1e-9 {
                break;
            }
            y = rk4_step(&f, t, &y, h);
            t += h;
        }
        assert!((y[0] - std::f64::consts::E).abs() < 1e-9, "y(1) = {}", y[0]);
    }

    #[test]
    fn rk4_is_fourth_order() {
        // Halving the step must cut the global error of a 4th-order method ~16×.
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let err_at = |h: f64| {
            let mut y = vec![1.0];
            let mut t = 0.0;
            let steps = (1.0 / h).round() as usize;
            for _ in 0..steps {
                y = rk4_step(&f, t, &y, h);
                t += h;
            }
            (y[0] - std::f64::consts::E).abs()
        };
        let ratio = err_at(0.05) / err_at(0.025);
        assert!((12.0..20.0).contains(&ratio), "4th-order ratio = {ratio}");
    }

    #[test]
    fn harmonic_oscillator_conserves_energy() {
        // y'' = −y as [pos, vel]' = [vel, −pos]; energy pos² + vel² is invariant.
        let f = |_t: f64, y: &[f64]| vec![y[1], -y[0]];
        let mut y = vec![1.0, 0.0]; // E = 1
                                    // Step exactly one period 2π with a step that divides it evenly, so the state
                                    // must return to the start (not stop a fraction of a step past 2π).
        let n_steps = 10_000usize;
        let h = std::f64::consts::TAU / n_steps as f64;
        let mut t = 0.0;
        for _ in 0..n_steps {
            y = rk4_step(&f, t, &y, h);
            t += h;
        }
        // After one full period the state returns to the start, energy preserved.
        let energy = y[0] * y[0] + y[1] * y[1];
        assert!((energy - 1.0).abs() < 1e-8, "energy drift {energy}");
        assert!(
            (y[0] - 1.0).abs() < 1e-6 && y[1].abs() < 1e-6,
            "state {:?}",
            y
        );
    }

    #[test]
    fn adaptive_integration_meets_tolerance_with_variable_steps() {
        // y' = y to t = 1 at a tight tolerance must land near e and take >1 step.
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let tol = Tolerance {
            rtol: 1e-10,
            atol: 1e-12,
            ..Tolerance::default()
        };
        let sol = integrate(&f, 0.0, &[1.0], 1.0, 0.1, &tol);
        assert!((sol.t - 1.0).abs() < 1e-12);
        assert!(
            (sol.y[0] - std::f64::consts::E).abs() < 1e-8,
            "y = {}",
            sol.y[0]
        );
        assert!(
            sol.accepted >= 1,
            "should take real steps: {}",
            sol.accepted
        );
    }

    #[test]
    fn adaptive_takes_larger_steps_on_an_easy_problem() {
        // A near-constant slope (y' = small) needs fewer steps than a stiff growth at
        // the same tolerance — the controller must adapt, not march at the initial h.
        let easy = integrate(
            &|_t, _y| vec![0.01],
            0.0,
            &[0.0],
            10.0,
            0.01,
            &Tolerance::default(),
        );
        let hard = integrate(
            &|_t, y: &[f64]| vec![y[0]],
            0.0,
            &[1.0],
            10.0,
            0.01,
            &Tolerance::default(),
        );
        assert!(
            easy.accepted < hard.accepted,
            "easy {} should need fewer steps than hard {}",
            easy.accepted,
            hard.accepted
        );
    }

    #[test]
    fn step_doubling_error_estimate_shrinks_with_step() {
        // The local error estimate of a 4th-order step scales ~h⁵: a 2× smaller step
        // gives a much smaller estimate.
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let tol = Tolerance::default();
        let (_, e1, _) = step_doubling(&f, 0.0, &[1.0], 0.2, &tol);
        let (_, e2, _) = step_doubling(&f, 0.0, &[1.0], 0.1, &tol);
        assert!(
            e2 < e1,
            "smaller step should have smaller error: {e2} !< {e1}"
        );
    }

    #[test]
    fn dopri54_adaptive_meets_a_tight_tolerance_on_exponential_growth() {
        // y' = y to t = 1 with the embedded DP5(4) driver lands on e to high accuracy and takes
        // real adaptive steps.
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let tol = Tolerance {
            rtol: 1e-12,
            atol: 1e-14,
            ..Tolerance::default()
        };
        let sol = integrate_dopri(&f, 0.0, &[1.0], 1.0, 0.1, &tol);
        assert!((sol.t - 1.0).abs() < 1e-12);
        assert!(
            (sol.y[0] - std::f64::consts::E).abs() < 1e-9,
            "DP5(4) y(1) = {} vs e",
            sol.y[0]
        );
        assert!(
            sol.accepted >= 1,
            "should take real steps: {}",
            sol.accepted
        );
    }

    #[test]
    fn dopri54_embedded_error_estimate_is_fifth_order() {
        // The embedded 4th-order error estimate of the DP5(4) step is O(h⁵): halving the step
        // must cut it by ~2⁵ = 32×. (The tolerance scaling is ~constant across the two steps from
        // the same start, so the normalized-error ratio tracks the raw h⁵ scaling.)
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let tol = Tolerance::default();
        let (_, e1, _) = dopri54_step(&f, 0.0, &[1.0], 0.2, &tol);
        let (_, e2, _) = dopri54_step(&f, 0.0, &[1.0], 0.1, &tol);
        let ratio = e1 / e2;
        assert!(
            (20.0..=50.0).contains(&ratio),
            "DP5(4) error should scale ~h⁵ (ratio ~32): {ratio}"
        );
    }

    #[test]
    fn dopri54_harmonic_oscillator_conserves_energy_over_many_periods() {
        // y'' = −y over 50 periods at a tight tolerance: DP5(4) keeps energy pos²+vel² ≈ 1 and
        // returns the state to its start — the orbital-motion proxy the propagator relies on.
        let f = |_t: f64, y: &[f64]| vec![y[1], -y[0]];
        let tol = Tolerance {
            rtol: 1e-11,
            atol: 1e-13,
            ..Tolerance::default()
        };
        let t_end = 50.0 * std::f64::consts::TAU;
        let sol = integrate_dopri(&f, 0.0, &[1.0, 0.0], t_end, 0.1, &tol);
        let energy = sol.y[0] * sol.y[0] + sol.y[1] * sol.y[1];
        assert!((energy - 1.0).abs() < 1e-6, "energy drift {energy}");
        assert!(
            (sol.y[0] - 1.0).abs() < 1e-4 && sol.y[1].abs() < 1e-4,
            "state should return to start: {:?}",
            sol.y
        );
    }

    #[test]
    fn dopri54_is_cheaper_than_step_doubling_at_the_same_tolerance() {
        // The whole point of the embedded pair: reach the same endpoint at the same tolerance in
        // fewer function evaluations. DP5(4) is 7 evals/step and (being 5th order) takes fewer
        // steps; step doubling is 11 evals/step. Compare total evals on y' = y to t = 10.
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let tol = Tolerance {
            rtol: 1e-10,
            atol: 1e-12,
            ..Tolerance::default()
        };
        let sd = integrate(&f, 0.0, &[1.0], 10.0, 0.1, &tol);
        let dp = integrate_dopri(&f, 0.0, &[1.0], 10.0, 0.1, &tol);
        let sd_evals = (sd.accepted + sd.rejected) * 11;
        let dp_evals = (dp.accepted + dp.rejected) * 7;
        assert!(
            dp_evals < sd_evals,
            "DP5(4) {dp_evals} evals should beat step-doubling {sd_evals}"
        );
        // Both must actually be accurate (this isn't cheaper-by-being-wrong).
        for sol in [&sd, &dp] {
            assert!(
                (sol.y[0] - 10.0_f64.pexp()).abs() / 10.0_f64.pexp() < 1e-7,
                "y(10) = {} vs e¹⁰",
                sol.y[0]
            );
        }
    }

    fn tight() -> Tolerance {
        Tolerance {
            rtol: 1e-12,
            atol: 1e-12,
            ..Tolerance::default()
        }
    }

    #[test]
    fn dop853_tableau_satisfies_its_order_conditions() {
        // Row sums of `a` equal `c` (stages 1..15), Σb = 1, Σ b·c^k = 1/(k+1) for k < 8, and
        // the error weights E3, E5 annihilate a constant (Σ = 0): checks of the transcription.
        let tab = dop853_tableau();
        for s in 1..DOP853_STAGES_EXTENDED {
            let row: f64 = tab.a[s][..s].iter().sum();
            assert!(
                (row - tab.c[s]).abs() < 1e-14,
                "stage {s}: Σa {row} vs c {}",
                tab.c[s]
            );
        }
        for k in 0..8 {
            let q: f64 = (0..DOP853_STAGES)
                .map(|j| tab.b[j] * tab.c[j].ppowi(k))
                .sum();
            assert!(
                (q - 1.0 / (k as f64 + 1.0)).abs() < 1e-14,
                "quadrature order {k}: {q}"
            );
        }
        let s3: f64 = tab.e3.iter().sum();
        let s5: f64 = tab.e5.iter().sum();
        assert!(s3.abs() < 1e-14 && s5.abs() < 1e-14, "Σe3 {s3}, Σe5 {s5}");
    }

    #[test]
    fn dop853_single_step_is_eighth_order() {
        // y' = y: the local error of one step scales as h⁹; halving h cuts it ~512×.
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let tol = Tolerance::default();
        let err = |h: f64| {
            let s = dop853_step(&f, 0.0, &[1.0], &[1.0], h, &tol);
            (s.y_new[0] - h.pexp()).abs()
        };
        let ratio = err(0.4) / err(0.2);
        assert!((300.0..800.0).contains(&ratio), "h⁹ ratio {ratio}");
    }

    #[test]
    fn dop853_two_body_eccentric_orbit_matches_kepler_over_five_periods() {
        // μ = 1, a = 1, e = 0.7 from perigee: after 5 periods the state returns to the start.
        let f = |_t: f64, y: &[f64]| {
            let r3 = (y[0] * y[0] + y[1] * y[1]).sqrt().ppowi(3);
            vec![y[2], y[3], -y[0] / r3, -y[1] / r3]
        };
        let e = 0.7_f64;
        let y0 = [1.0 - e, 0.0, 0.0, ((1.0 + e) / (1.0 - e)).sqrt()];
        let t_end = 5.0 * std::f64::consts::TAU;
        let run = integrate_dop853_checked(&f, 0.0, &y0, t_end, 0.0, &tight()).unwrap();
        assert_eq!(run.t, t_end);
        let err = (0..4).map(|i| (run.y[i] - y0[i]).abs()).fold(0.0, f64::max);
        assert!(err < 1e-8, "5-period return error {err}");
        assert_eq!(run.nfev, 2 + 12 * (run.accepted + run.rejected));
        // Fewer evaluations than DP5(4) at the same tolerance.
        let dp = integrate_dopri(&f, 0.0, &y0, t_end, 0.01, &tight());
        assert!(
            run.nfev < (dp.accepted + dp.rejected) * 7,
            "DOP853 should be cheaper"
        );
    }

    #[test]
    fn dop853_dense_output_interpolates_and_keeps_the_step_sequence() {
        let f = |_t: f64, y: &[f64]| vec![y[1], -y[0]];
        let tol = Tolerance {
            rtol: 1e-10,
            atol: 1e-10,
            ..Tolerance::default()
        };
        let plain = integrate_dop853_checked(&f, 0.0, &[1.0, 0.0], 20.0, 0.0, &tol).unwrap();
        let dense = integrate_dop853_dense(&f, 0.0, &[1.0, 0.0], 20.0, 0.0, &tol).unwrap();
        assert_eq!(plain.y, dense.y);
        assert_eq!(plain.accepted, dense.accepted);
        assert_eq!(dense.nfev, plain.nfev + 3 * dense.accepted);
        assert_eq!(dense.dense.len(), dense.accepted);
        // The interpolant hits both ends of each step and tracks cos/sin in between.
        for s in &dense.dense {
            let a = s.eval(s.t_old);
            assert!((a[0] - s.y_old[0]).abs() < 1e-15);
        }
        let last = dense.dense.last().unwrap();
        let b = last.eval(last.t_new);
        assert!((b[0] - dense.y[0]).abs() < 1e-14);
        let mut worst = 0.0_f64;
        for k in 0..=400 {
            let t = 20.0 * k as f64 / 400.0;
            let y = dense.eval(t).unwrap();
            worst = worst
                .max((y[0] - t.pcos()).abs())
                .max((y[1] + t.psin()).abs());
        }
        assert!(worst < 1e-8, "dense error {worst}");
        assert!(dense.eval(20.5).is_none() && plain.eval(1.0).is_none());
    }

    #[test]
    fn dop853_integrates_backward() {
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let sol = integrate_dop853(&f, 1.0, &[std::f64::consts::E], 0.0, 0.0, &tight());
        assert_eq!(sol.t, 0.0);
        assert!((sol.y[0] - 1.0).abs() < 1e-11, "y(0) = {}", sol.y[0]);
    }

    #[test]
    fn dop853_fails_closed_on_non_finite_input_and_blow_up() {
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let e = integrate_dop853_checked(&f, 0.0, &[f64::NAN], 1.0, 0.1, &tight()).unwrap_err();
        assert_eq!(e.failure, Dop853Failure::NonFiniteInput);
        // y' = y² from y(0) = 1 blows up at t = 1: the run must stop before, at a finite state.
        let g = |_t: f64, y: &[f64]| vec![y[0] * y[0]];
        let e = integrate_dop853_checked(&g, 0.0, &[1.0], 2.0, 0.0, &tight()).unwrap_err();
        assert!(e.t < 1.0 && e.y[0].is_finite(), "{e}");
        assert!(matches!(
            e.failure,
            Dop853Failure::StepSizeTooSmall | Dop853Failure::NonFiniteState
        ));
        let sol = integrate_dop853(&g, 0.0, &[1.0], 2.0, 0.0, &tight());
        assert!(sol.t < 1.0 && sol.y[0].is_finite());
        // A right-hand side that turns NaN beyond t = 0.5 stops with NonFiniteState.
        let h = |t: f64, y: &[f64]| vec![if t > 0.5 { f64::NAN } else { y[0] }];
        let e = integrate_dop853_checked(&h, 0.0, &[1.0], 1.0, 0.0, &tight()).unwrap_err();
        assert_eq!(e.failure, Dop853Failure::NonFiniteState);
        assert!(e.t <= 0.5 && e.y[0].is_finite());
    }

    #[test]
    fn dop853_zero_length_interval_is_a_no_op() {
        let f = |_t: f64, y: &[f64]| vec![y[0]];
        let run = integrate_dop853_checked(&f, 3.0, &[2.0], 3.0, 0.0, &tight()).unwrap();
        assert_eq!((run.t, run.y[0], run.accepted, run.nfev), (3.0, 2.0, 0, 0));
    }
}
