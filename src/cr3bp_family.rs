// SPDX-License-Identifier: AGPL-3.0-only
//! Family continuation of symmetric periodic orbits of the Earth–Moon CR3BP: halo
//! (L1/L2, northern/southern), the L2 southern near-rectilinear (NRHO) segment and planar
//! distant retrograde orbits (DROs), each member carrying its period, Jacobi constant and
//! stability index from the monodromy eigenvalues.
//!
//! [`crate::cr3bp::differential_correct_halo`] and [`crate::dro::dro_from_crossing`]
//! correct one member at a time with `x₀` held fixed and a fixed-step RK4 flow. This
//! module adds what a *family* needs:
//!
//! * an adaptive Dormand–Prince RK5(4) flow of the state and the 6×6 state-transition
//!   matrix (the tableau of [`crate::integrator::dopri54_step`], on fixed-size arrays),
//!   with the half-period `y = 0` crossing found by Newton refinement on `y(t)`;
//! * a symmetric-orbit corrector with a choice of the held parameter ([`Hold`]: `x₀` or
//!   `z₀`), so a member can be corrected on either side of a fold in `x₀`;
//! * **pseudo-arclength continuation** ([`continue_pseudo_arclength`]): the free
//!   variables `X = [x₀, z₀, ẏ₀]` (planar: `[x₀, ẏ₀]`) satisfy the symmetry
//!   constraints `F(X) = [ẋ_f, ż_f] = 0` at the half-period crossing (planar: `ẋ_f = 0`);
//!   the family tangent is the null vector of `DF`, and each new member solves
//!   `F(X) = 0`, `(X − X_k)·τ_k = Δs` by Newton. This passes folds in any single
//!   coordinate, which natural-parameter continuation cannot;
//! * **natural-parameter continuation** ([`continue_natural`]) for a monotone stretch;
//! * the **monodromy matrix** `M = Φ(T)` and its six eigenvalues (Hessenberg reduction and
//!   the shifted-QR algorithm of the EISPACK `hqr` routine), and the **stability index**
//!   `ν = max_i ½|λ_i + 1/λ_i|` over the eigenvalues. Because the trivial pair `λ = 1`
//!   is always present, `ν ≥ 1`; `ν = 1` (to numerical precision) means linearly stable.
//!   This is the definition used by the NASA/JPL Three-Body Periodic Orbits API, whose
//!   stable members carry `ν = 1`.
//!
//! **Convention.** Members are parametrised at a perpendicular crossing of the `x`–`z`
//! plane, `[x₀, 0, z₀, 0, ẏ₀, 0]`; the half-period is the time to the next `y = 0`
//! crossing. The northern and southern branches of a halo family are mirror images
//! under `z → −z` ([`mirror_z`]).
//!
//! **Evidence.** Closure, Jacobi conservation and the symplectic pairing of the
//! eigenvalues are internal checks. The external comparison against the NASA/JPL Three-Body
//! Periodic Orbits API is pre-registered in
//! `docs/design/evidence/cr3bp-families/PREREGISTRATION.md` and run by
//! `tests/cr3bp_families_jpl_oracle.rs`.
//!
//! **References.** Howell, *Three-dimensional periodic halo orbits* (1984), for the
//! symmetric single-shooting scheme; Keller (1977) / Doedel et al. for pseudo-arclength
//! continuation; Wilkinson & Reinsch, *Handbook for Automatic Computation* vol. II (1971),
//! for the Hessenberg-QR eigenvalue algorithm.

use crate::cr3bp::{cr3bp_accel, cr3bp_jacobian, jacobi_constant, Cr3bpState};

/// Which coordinate of the crossing state is held fixed while correcting a member.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Hold {
    /// Hold the crossing abscissa `x₀`; vary `z₀` and `ẏ₀` (planar: `ẏ₀`).
    X0,
    /// Hold the out-of-plane amplitude `z₀`; vary `x₀` and `ẏ₀` (spatial orbits only).
    Z0,
}

/// Integration tolerances for the adaptive flow (nondimensional units).
#[derive(Clone, Copy, Debug)]
pub struct FlowTolerance {
    /// Relative tolerance per component (state and STM).
    pub rtol: f64,
    /// Absolute tolerance per component.
    pub atol: f64,
    /// Largest step (nondimensional time).
    pub h_max: f64,
}

impl Default for FlowTolerance {
    fn default() -> Self {
        Self {
            rtol: 1e-12,
            atol: 1e-13,
            h_max: 0.05,
        }
    }
}

/// A corrected symmetric periodic orbit with its monodromy-derived stability.
#[derive(Clone, Copy, Debug)]
pub struct FamilyMember {
    /// Initial condition at the perpendicular `x`–`z` plane crossing,
    /// `[x₀, 0, z₀, 0, ẏ₀, 0]`.
    pub ic: Cr3bpState,
    /// Full period (nondimensional time; `2π` is one sidereal month).
    pub period: f64,
    /// Jacobi constant `C = 2U − v²`.
    pub jacobi: f64,
    /// The six eigenvalues `(re, im)` of the monodromy matrix `Φ(T)`.
    pub eigenvalues: [(f64, f64); 6],
    /// Stability index `ν = max_i ½|λ_i + 1/λ_i|` (`≥ 1`; `1` means linearly stable).
    pub stability_index: f64,
    /// Full-state return error `|x(T) − x(0)|` (nondimensional).
    pub closure: f64,
    /// Final symmetry residual `|[ẋ_f, ż_f]|` at the half-period crossing.
    pub residual: f64,
}

type Aug = [f64; 42];

fn aug_deriv(y: &Aug, mu: f64) -> Aug {
    let mut d = [0.0; 42];
    let r = [y[0], y[1], y[2]];
    let v = [y[3], y[4], y[5]];
    let a = cr3bp_accel(r, v, mu);
    d[..3].copy_from_slice(&v);
    d[3..6].copy_from_slice(&a);
    let jac = cr3bp_jacobian(r, mu);
    // Φ is stored row-major in y[6..42]; Φ̇ = A·Φ with A = [[0, I], [Ω, 2J]].
    let phi = |i: usize, j: usize| y[6 + 6 * i + j];
    for j in 0..6 {
        for i in 0..3 {
            d[6 + 6 * i + j] = phi(3 + i, j);
        }
        for i in 0..3 {
            let mut s = 0.0;
            for k in 0..3 {
                s += jac[3 + i][k] * phi(k, j);
            }
            d[6 + 6 * (3 + i) + j] = s;
        }
        d[6 + 6 * 3 + j] += 2.0 * phi(4, j);
        d[6 + 6 * 4 + j] -= 2.0 * phi(3, j);
    }
    d
}

fn lin(y: &Aug, h: f64, terms: &[(f64, &Aug)]) -> Aug {
    let mut o = *y;
    for (c, k) in terms {
        let hc = h * c;
        for i in 0..42 {
            o[i] += hc * k[i];
        }
    }
    o
}

/// One Dormand–Prince RK5(4) step on the augmented (state + STM) vector. Returns the
/// 5th-order result and the RMS scaled error.
fn dp_step(y: &Aug, h: f64, mu: f64, tol: &FlowTolerance) -> (Aug, f64) {
    let k1 = aug_deriv(y, mu);
    let k2 = aug_deriv(&lin(y, h, &[(1.0 / 5.0, &k1)]), mu);
    let k3 = aug_deriv(&lin(y, h, &[(3.0 / 40.0, &k1), (9.0 / 40.0, &k2)]), mu);
    let k4 = aug_deriv(
        &lin(
            y,
            h,
            &[(44.0 / 45.0, &k1), (-56.0 / 15.0, &k2), (32.0 / 9.0, &k3)],
        ),
        mu,
    );
    let k5 = aug_deriv(
        &lin(
            y,
            h,
            &[
                (19372.0 / 6561.0, &k1),
                (-25360.0 / 2187.0, &k2),
                (64448.0 / 6561.0, &k3),
                (-212.0 / 729.0, &k4),
            ],
        ),
        mu,
    );
    let k6 = aug_deriv(
        &lin(
            y,
            h,
            &[
                (9017.0 / 3168.0, &k1),
                (-355.0 / 33.0, &k2),
                (46732.0 / 5247.0, &k3),
                (49.0 / 176.0, &k4),
                (-5103.0 / 18656.0, &k5),
            ],
        ),
        mu,
    );
    let yn = lin(
        y,
        h,
        &[
            (35.0 / 384.0, &k1),
            (500.0 / 1113.0, &k3),
            (125.0 / 192.0, &k4),
            (-2187.0 / 6784.0, &k5),
            (11.0 / 84.0, &k6),
        ],
    );
    let k7 = aug_deriv(&yn, mu);
    let mut err = 0.0;
    for i in 0..42 {
        let e = h
            * (71.0 / 57600.0 * k1[i] - 71.0 / 16695.0 * k3[i] + 71.0 / 1920.0 * k4[i]
                - 17253.0 / 339200.0 * k5[i]
                + 22.0 / 525.0 * k6[i]
                - 1.0 / 40.0 * k7[i]);
        let sc = tol.atol + tol.rtol * yn[i].abs().max(y[i].abs());
        err += (e / sc).powi(2);
    }
    (yn, (err / 42.0).sqrt())
}

fn aug_init(s: &Cr3bpState) -> Aug {
    let mut y = [0.0; 42];
    y[..3].copy_from_slice(&s.r);
    y[3..6].copy_from_slice(&s.v);
    for i in 0..6 {
        y[6 + 7 * i] = 1.0;
    }
    y
}

fn aug_split(y: &Aug) -> (Cr3bpState, [[f64; 6]; 6]) {
    let mut phi = [[0.0; 6]; 6];
    for (i, row) in phi.iter_mut().enumerate() {
        row.copy_from_slice(&y[6 + 6 * i..12 + 6 * i]);
    }
    (
        Cr3bpState {
            r: [y[0], y[1], y[2]],
            v: [y[3], y[4], y[5]],
        },
        phi,
    )
}

/// Adaptive driver. If `stop_on_crossing`, stops at the first step over which `y`
/// changes sign (returning the state at the *start* of that step and its time);
/// otherwise integrates exactly to `t_end`.
fn drive(
    y0: &Aug,
    mu: f64,
    t_end: f64,
    tol: &FlowTolerance,
    stop_on_crossing: bool,
) -> Option<(Aug, f64, bool)> {
    let mut y = *y0;
    let mut t = 0.0;
    let mut h = (t_end / 100.0).min(tol.h_max).max(1e-6);
    for _ in 0..2_000_000 {
        if t >= t_end {
            return Some((y, t, false));
        }
        if t + h > t_end {
            h = t_end - t;
        }
        let (yn, err) = dp_step(&y, h, mu, tol);
        if !err.is_finite() {
            h *= 0.2;
            if h < 1e-14 {
                return None;
            }
            continue;
        }
        if err <= 1.0 {
            if stop_on_crossing && y[1] != 0.0 && y[1] * yn[1] < 0.0 {
                return Some((y, t, true));
            }
            t += h;
            y = yn;
        }
        let f = if err > 0.0 {
            (0.9 * err.powf(-0.2)).clamp(0.2, 5.0)
        } else {
            5.0
        };
        h = (h * f).min(tol.h_max);
        if h < 1e-14 {
            return None;
        }
    }
    None
}

/// Propagate a CR3BP state for nondimensional time `t` (≥ 0) with the adaptive flow.
pub fn propagate_adaptive(s: &Cr3bpState, mu: f64, t: f64, tol: &FlowTolerance) -> Cr3bpState {
    propagate_stm_adaptive(s, mu, t, tol).0
}

/// Propagate a CR3BP state **and its STM** for time `t` (≥ 0) with the adaptive flow.
pub fn propagate_stm_adaptive(
    s: &Cr3bpState,
    mu: f64,
    t: f64,
    tol: &FlowTolerance,
) -> (Cr3bpState, [[f64; 6]; 6]) {
    if t <= 0.0 {
        return aug_split(&aug_init(s));
    }
    match drive(&aug_init(s), mu, t, tol, false) {
        Some((y, _, _)) => aug_split(&y),
        None => (
            Cr3bpState {
                r: [f64::NAN; 3],
                v: [f64::NAN; 3],
            },
            [[f64::NAN; 6]; 6],
        ),
    }
}

fn matmul6(a: &[[f64; 6]; 6], b: &[[f64; 6]; 6]) -> [[f64; 6]; 6] {
    let mut c = [[0.0; 6]; 6];
    for i in 0..6 {
        for j in 0..6 {
            c[i][j] = (0..6).map(|k| a[i][k] * b[k][j]).sum();
        }
    }
    c
}

/// Propagate from a state on `y = 0` to the next `y = 0` crossing (up to `t_max`).
/// Returns the crossing state, the STM there and the crossing time.
pub fn next_crossing(
    s0: &Cr3bpState,
    mu: f64,
    t_max: f64,
    tol: &FlowTolerance,
) -> Option<(Cr3bpState, [[f64; 6]; 6], f64)> {
    let (y_pre, t_pre, crossed) = drive(&aug_init(s0), mu, t_max, tol, true)?;
    if !crossed {
        return None;
    }
    let (s_pre, phi_pre) = aug_split(&y_pre);
    let mut dt = -s_pre.r[1] / s_pre.v[1];
    let mut best = None;
    for _ in 0..12 {
        let (sc, phi_sub) = propagate_stm_adaptive(&s_pre, mu, dt.max(0.0), tol);
        let dt_new = dt - sc.r[1] / sc.v[1];
        best = Some((sc, phi_sub, dt));
        if sc.r[1].abs() < 1e-14 || (dt_new - dt).abs() < 1e-15 {
            break;
        }
        dt = dt_new;
    }
    let (sc, phi_sub, dt) = best?;
    Some((sc, matmul6(&phi_sub, &phi_pre), t_pre + dt))
}

/// Free-variable vector X: spatial [x0, z0, vy0], planar [x0, vy0].
fn crossing_state(x: &[f64], planar: bool) -> Cr3bpState {
    if planar {
        Cr3bpState {
            r: [x[0], 0.0, 0.0],
            v: [0.0, x[1], 0.0],
        }
    } else {
        Cr3bpState {
            r: [x[0], 0.0, x[1]],
            v: [0.0, x[2], 0.0],
        }
    }
}

/// Constraint residual F(X) and its Jacobian DF (rows: constraints, cols: free vars),
/// plus the half-period. Spatial F = [ẋ_f, ż_f]; planar F = [ẋ_f].
struct Eval {
    f: Vec<f64>,
    df: Vec<Vec<f64>>,
    t_half: f64,
}

fn evaluate(x: &[f64], mu: f64, planar: bool, t_max: f64, tol: &FlowTolerance) -> Option<Eval> {
    let s0 = crossing_state(x, planar);
    let (sc, phi, t_half) = next_crossing(&s0, mu, t_max, tol)?;
    let acc = cr3bp_accel(sc.r, sc.v, mu);
    let vyf = sc.v[1];
    // Columns of Φ for the free variables.
    let cols: Vec<usize> = if planar { vec![0, 4] } else { vec![0, 2, 4] };
    let rows: Vec<usize> = if planar { vec![3] } else { vec![3, 5] };
    let mut df = Vec::new();
    let mut f = Vec::new();
    for &r in &rows {
        // d(v_r,f)/dX_j = Φ[r][j] − a_r/ẏ_f · Φ[1][j] (the y = 0 time constraint).
        df.push(
            cols.iter()
                .map(|&c| phi[r][c] - acc[r - 3] * phi[1][c] / vyf)
                .collect(),
        );
        f.push(sc.v[r - 3]);
    }
    Some(Eval { f, df, t_half })
}

fn solve(a: &mut [Vec<f64>], b: &mut [f64]) -> Option<Vec<f64>> {
    let n = b.len();
    for c in 0..n {
        let p = (c..n).max_by(|&i, &j| a[i][c].abs().total_cmp(&a[j][c].abs()))?;
        if a[p][c].abs() < 1e-300 {
            return None;
        }
        a.swap(c, p);
        b.swap(c, p);
        for r in c + 1..n {
            let m = a[r][c] / a[c][c];
            for k in c..n {
                a[r][k] -= m * a[c][k];
            }
            b[r] -= m * b[c];
        }
    }
    let mut x = vec![0.0; n];
    for r in (0..n).rev() {
        let s: f64 = (r + 1..n).map(|k| a[r][k] * x[k]).sum();
        x[r] = (b[r] - s) / a[r][r];
    }
    Some(x)
}

fn norm(v: &[f64]) -> f64 {
    v.iter().map(|a| a * a).sum::<f64>().sqrt()
}

/// Unit null vector of DF (spatial 2×3: the cross product of the rows; planar 1×2).
fn null_tangent(df: &[Vec<f64>]) -> Vec<f64> {
    let t = if df[0].len() == 2 {
        vec![-df[0][1], df[0][0]]
    } else {
        let (a, b) = (&df[0], &df[1]);
        vec![
            a[1] * b[2] - a[2] * b[1],
            a[2] * b[0] - a[0] * b[2],
            a[0] * b[1] - a[1] * b[0],
        ]
    };
    let n = norm(&t);
    t.iter().map(|x| x / n).collect()
}

/// Settings shared by the corrector and the continuation drivers.
#[derive(Clone, Copy, Debug)]
pub struct CorrectorSettings {
    /// Convergence threshold on the symmetry residual `|[ẋ_f, ż_f]|`.
    pub tol: f64,
    /// Newton iteration cap per member.
    pub max_iter: usize,
    /// Upper bound on the half-period search (nondimensional time).
    pub t_max: f64,
    /// Flow tolerances.
    pub flow: FlowTolerance,
}

impl Default for CorrectorSettings {
    fn default() -> Self {
        Self {
            tol: 1e-11,
            max_iter: 25,
            t_max: 8.0,
            flow: FlowTolerance::default(),
        }
    }
}

fn free_vars(s: &Cr3bpState, planar: bool) -> Vec<f64> {
    if planar {
        vec![s.r[0], s.v[1]]
    } else {
        vec![s.r[0], s.r[2], s.v[1]]
    }
}

/// Correct a symmetric periodic orbit from a guess at a perpendicular crossing
/// `[x₀, 0, z₀, 0, ẏ₀, 0]`, holding `hold` fixed (minimum-norm-free: the held coordinate
/// is removed from the free set). `planar` corrects a planar orbit (`z₀ = ż = 0`,
/// constraint `ẋ_f = 0`; `hold` must be [`Hold::X0`]). Returns the member with its
/// monodromy and stability index, or `None` if Newton does not converge.
pub fn correct_member(
    guess: &Cr3bpState,
    mu: f64,
    hold: Hold,
    planar: bool,
    set: &CorrectorSettings,
) -> Option<FamilyMember> {
    if planar && hold == Hold::Z0 {
        return None;
    }
    let mut x = free_vars(guess, planar);
    let held_idx = match hold {
        Hold::X0 => 0,
        Hold::Z0 => 1,
    };
    for _ in 0..set.max_iter {
        let e = evaluate(&x, mu, planar, set.t_max, &set.flow)?;
        if norm(&e.f) < set.tol {
            return finish(&x, mu, planar, e.t_half, norm(&e.f), &set.flow);
        }
        // Remove the held column; square system.
        let mut a: Vec<Vec<f64>> =
            e.df.iter()
                .map(|row| {
                    row.iter()
                        .enumerate()
                        .filter(|(j, _)| *j != held_idx)
                        .map(|(_, v)| *v)
                        .collect()
                })
                .collect();
        let mut b: Vec<f64> = e.f.iter().map(|v| -v).collect();
        let dx = solve(&mut a, &mut b)?;
        let mut k = 0;
        for (j, xj) in x.iter_mut().enumerate() {
            if j != held_idx {
                *xj += dx[k];
                k += 1;
            }
        }
    }
    None
}

fn finish(
    x: &[f64],
    mu: f64,
    planar: bool,
    t_half: f64,
    residual: f64,
    tol: &FlowTolerance,
) -> Option<FamilyMember> {
    let ic = crossing_state(x, planar);
    let period = 2.0 * t_half;
    let (end, mono) = propagate_stm_adaptive(&ic, mu, period, tol);
    let closure = norm(&[
        end.r[0] - ic.r[0],
        end.r[1] - ic.r[1],
        end.r[2] - ic.r[2],
        end.v[0] - ic.v[0],
        end.v[1] - ic.v[1],
        end.v[2] - ic.v[2],
    ]);
    let eigenvalues = eigenvalues6(&mono);
    Some(FamilyMember {
        ic,
        period,
        jacobi: jacobi_constant(&ic, mu),
        eigenvalues,
        stability_index: stability_index(&eigenvalues),
        closure,
        residual,
    })
}

/// The monodromy matrix `Φ(T)` of a member (adaptive flow over one period).
pub fn monodromy(m: &FamilyMember, mu: f64, tol: &FlowTolerance) -> [[f64; 6]; 6] {
    propagate_stm_adaptive(&m.ic, mu, m.period, tol).1
}

/// Stability index `ν = max_i ½|λ_i + 1/λ_i|` over the monodromy eigenvalues.
pub fn stability_index(eig: &[(f64, f64); 6]) -> f64 {
    eig.iter()
        .map(|&(re, im)| {
            let m2 = re * re + im * im;
            if m2 == 0.0 {
                return f64::INFINITY;
            }
            // λ + 1/λ = (re + re/m2) + i(im − im/m2)
            let s_re = re + re / m2;
            let s_im = im - im / m2;
            0.5 * s_re.hypot(s_im)
        })
        .fold(0.0, f64::max)
}

/// Mirror a state across the `x`–`y` plane (`z → −z`, `ż → −ż`): the CR3BP symmetry
/// mapping a northern halo onto its southern twin.
pub fn mirror_z(s: &Cr3bpState) -> Cr3bpState {
    Cr3bpState {
        r: [s.r[0], s.r[1], -s.r[2]],
        v: [s.v[0], s.v[1], -s.v[2]],
    }
}

/// **Pseudo-arclength continuation** from a corrected `seed`. Takes `n` steps of
/// arclength `ds` (in the free-variable space `[x₀, z₀, ẏ₀]`, planar `[x₀, ẏ₀]`); the
/// sign of `ds` picks the direction along the family relative to the initial tangent
/// orientation `orient` (the tangent is flipped so that `τ·orient ≥ 0`). The tangent is
/// carried forward with a consistent orientation, so folds in any single coordinate are
/// passed. Stops early at the first member that fails to converge. The seed is the
/// first element of the returned vector.
pub fn continue_pseudo_arclength(
    seed: &FamilyMember,
    mu: f64,
    planar: bool,
    ds: f64,
    n: usize,
    orient: &[f64],
    set: &CorrectorSettings,
) -> Vec<FamilyMember> {
    let mut out = vec![*seed];
    let mut x = free_vars(&seed.ic, planar);
    let e = match evaluate(&x, mu, planar, set.t_max, &set.flow) {
        Some(e) => e,
        None => return out,
    };
    let mut tau = null_tangent(&e.df);
    let dot: f64 = tau.iter().zip(orient).map(|(a, b)| a * b).sum();
    if dot < 0.0 {
        tau.iter_mut().for_each(|t| *t = -*t);
    }
    let mut step = ds;
    let mut k = 0;
    while k < n {
        let x_prev = x.clone();
        let mut xn: Vec<f64> = x_prev.iter().zip(&tau).map(|(a, t)| a + step * t).collect();
        let mut ok = None;
        for _ in 0..set.max_iter {
            let e = match evaluate(&xn, mu, planar, set.t_max, &set.flow) {
                Some(e) => e,
                None => break,
            };
            let arc: f64 = xn
                .iter()
                .zip(&x_prev)
                .zip(&tau)
                .map(|((a, b), t)| (a - b) * t)
                .sum::<f64>()
                - step;
            if norm(&e.f) < set.tol && arc.abs() < 1e-10 {
                ok = Some(e);
                break;
            }
            let mut a = e.df.clone();
            a.push(tau.clone());
            let mut b: Vec<f64> = e.f.iter().map(|v| -v).collect();
            b.push(-arc);
            let dx = match solve(&mut a, &mut b) {
                Some(d) => d,
                None => break,
            };
            xn.iter_mut().zip(&dx).for_each(|(a, d)| *a += d);
        }
        match ok {
            Some(e) => {
                let mut tn = null_tangent(&e.df);
                let dot: f64 = tn.iter().zip(&tau).map(|(a, b)| a * b).sum();
                if dot < 0.0 {
                    tn.iter_mut().for_each(|t| *t = -*t);
                }
                tau = tn;
                x = xn;
                match finish(&x, mu, planar, e.t_half, norm(&e.f), &set.flow) {
                    Some(m) => out.push(m),
                    None => break,
                }
                k += 1;
                step = ds;
            }
            None => {
                // Halve the step and retry, up to a floor.
                step *= 0.5;
                if step.abs() < ds.abs() / 64.0 {
                    break;
                }
            }
        }
    }
    out
}

/// **Natural-parameter continuation**: correct members at the successive values of the
/// held coordinate (`hold`), each seeded from the previous member (secant-extrapolated
/// once two members exist). Stops at the first failure.
pub fn continue_natural(
    seed: &FamilyMember,
    mu: f64,
    hold: Hold,
    planar: bool,
    values: &[f64],
    set: &CorrectorSettings,
) -> Vec<FamilyMember> {
    let mut out: Vec<FamilyMember> = Vec::new();
    let mut prev = *seed;
    let mut prev2: Option<(f64, FamilyMember)> = None;
    let param = |s: &Cr3bpState| match hold {
        Hold::X0 => s.r[0],
        Hold::Z0 => s.r[2],
    };
    for &v in values {
        let mut guess = prev.ic;
        if let Some((p2, m2)) = prev2 {
            let p1 = param(&prev.ic);
            if (p1 - p2).abs() > 0.0 {
                let w = (v - p1) / (p1 - p2);
                for i in 0..3 {
                    guess.r[i] = prev.ic.r[i] + w * (prev.ic.r[i] - m2.ic.r[i]);
                    guess.v[i] = prev.ic.v[i] + w * (prev.ic.v[i] - m2.ic.v[i]);
                }
            }
        }
        match hold {
            Hold::X0 => guess.r[0] = v,
            Hold::Z0 => guess.r[2] = v,
        }
        match correct_member(&guess, mu, hold, planar, set) {
            Some(m) => {
                prev2 = Some((param(&prev.ic), prev));
                prev = m;
                out.push(m);
            }
            None => break,
        }
    }
    out
}

// ── Eigenvalues of a real 6×6 matrix: balance, Hessenberg, shifted QR (hqr) ──────

/// All eigenvalues `(re, im)` of a real 6×6 matrix, by balancing, reduction to upper
/// Hessenberg form by stabilised elementary similarity transforms, and the Francis
/// double-shift QR iteration (the EISPACK `balanc`/`elmhes`/`hqr` sequence). Sorted by
/// descending modulus.
pub fn eigenvalues6(m: &[[f64; 6]; 6]) -> [(f64, f64); 6] {
    let mut a = *m;
    balance(&mut a);
    elmhes(&mut a);
    let mut out = hqr(&mut a).unwrap_or([(f64::NAN, f64::NAN); 6]);
    out.sort_by(|p, q| q.0.hypot(q.1).total_cmp(&p.0.hypot(p.1)));
    out
}

fn balance(a: &mut [[f64; 6]; 6]) {
    const RADIX: f64 = 2.0;
    let sqrdx = RADIX * RADIX;
    let n = 6;
    let mut done = false;
    while !done {
        done = true;
        for i in 0..n {
            let (mut r, mut c) = (0.0, 0.0);
            for j in 0..n {
                if j != i {
                    c += a[j][i].abs();
                    r += a[i][j].abs();
                }
            }
            if c != 0.0 && r != 0.0 {
                let mut g = r / RADIX;
                let mut f = 1.0;
                let s = c + r;
                while c < g {
                    f *= RADIX;
                    c *= sqrdx;
                }
                g = r * RADIX;
                while c > g {
                    f /= RADIX;
                    c /= sqrdx;
                }
                if (c + r) / f < 0.95 * s {
                    done = false;
                    let g = 1.0 / f;
                    for j in 0..n {
                        a[i][j] *= g;
                    }
                    for row in a.iter_mut() {
                        row[i] *= f;
                    }
                }
            }
        }
    }
}

fn elmhes(a: &mut [[f64; 6]; 6]) {
    let n = 6;
    for m in 1..n - 1 {
        let mut x: f64 = 0.0;
        let mut i = m;
        for j in m..n {
            if a[j][m - 1].abs() > x.abs() {
                x = a[j][m - 1];
                i = j;
            }
        }
        if i != m {
            for j in m - 1..n {
                let t = a[i][j];
                a[i][j] = a[m][j];
                a[m][j] = t;
            }
            for row in a.iter_mut() {
                row.swap(i, m);
            }
        }
        if x != 0.0 {
            for i in m + 1..n {
                let mut y = a[i][m - 1];
                if y != 0.0 {
                    y /= x;
                    a[i][m - 1] = y;
                    for j in m..n {
                        a[i][j] -= y * a[m][j];
                    }
                    for row in a.iter_mut() {
                        row[m] += y * row[i];
                    }
                }
            }
        }
    }
    // Zero the multipliers stored below the subdiagonal.
    for (i, row) in a.iter_mut().enumerate() {
        for v in row.iter_mut().take(i.saturating_sub(1)) {
            *v = 0.0;
        }
    }
}

/// Francis double-shift QR on an upper-Hessenberg matrix (after Wilkinson & Reinsch,
/// in the 0-based form of the classic `hqr`).
#[allow(clippy::many_single_char_names)]
fn hqr(a: &mut [[f64; 6]; 6]) -> Option<[(f64, f64); 6]> {
    let n = 6usize;
    let mut wr = [0.0; 6];
    let mut wi = [0.0; 6];
    let mut anorm = 0.0;
    for i in 0..n {
        for j in i.saturating_sub(1)..n {
            anorm += a[i][j].abs();
        }
    }
    let mut nn: isize = n as isize - 1;
    let mut t = 0.0;
    let (mut p, mut q, mut r) = (0.0f64, 0.0f64, 0.0f64);
    while nn >= 0 {
        let mut its = 0;
        loop {
            // Look for a single small subdiagonal element.
            let mut l = nn;
            while l >= 1 {
                let lu = l as usize;
                let s = a[lu - 1][lu - 1].abs() + a[lu][lu].abs();
                let s = if s == 0.0 { anorm } else { s };
                if a[lu][lu - 1].abs() + s == s {
                    a[lu][lu - 1] = 0.0;
                    break;
                }
                l -= 1;
            }
            let nnu = nn as usize;
            let x = a[nnu][nnu];
            if l == nn {
                wr[nnu] = x + t;
                wi[nnu] = 0.0;
                nn -= 1;
                break;
            }
            let y = a[nnu - 1][nnu - 1];
            let w = a[nnu][nnu - 1] * a[nnu - 1][nnu];
            if l == nn - 1 {
                p = 0.5 * (y - x);
                q = p * p + w;
                let z = q.abs().sqrt();
                let xx = x + t;
                if q >= 0.0 {
                    let z = p + z.copysign(p);
                    wr[nnu - 1] = xx + z;
                    wr[nnu] = if z != 0.0 { xx - w / z } else { xx + z };
                    wi[nnu - 1] = 0.0;
                    wi[nnu] = 0.0;
                } else {
                    wr[nnu - 1] = xx + p;
                    wr[nnu] = xx + p;
                    wi[nnu - 1] = -z;
                    wi[nnu] = z;
                }
                nn -= 2;
                break;
            }
            if its == 60 {
                return None;
            }
            let (mut x, mut y, mut w) = (x, y, w);
            if its == 10 || its == 20 {
                // Exceptional shift.
                t += x;
                for i in 0..=nnu {
                    a[i][i] -= x;
                }
                let s = a[nnu][nnu - 1].abs() + a[nnu - 1][nnu - 2].abs();
                x = 0.75 * s;
                y = x;
                w = -0.4375 * s * s;
            }
            its += 1;
            // Form the shift and look for two consecutive small subdiagonal elements.
            let mut m = nn - 2;
            while m >= l {
                let mu = m as usize;
                let z = a[mu][mu];
                let rr = x - z;
                let ss = y - z;
                p = (rr * ss - w) / a[mu + 1][mu] + a[mu][mu + 1];
                q = a[mu + 1][mu + 1] - z - rr - ss;
                r = a[mu + 2][mu + 1];
                let s = p.abs() + q.abs() + r.abs();
                p /= s;
                q /= s;
                r /= s;
                if m == l {
                    break;
                }
                let u = a[mu][mu - 1].abs() * (q.abs() + r.abs());
                let v = p.abs() * (a[mu - 1][mu - 1].abs() + z.abs() + a[mu + 1][mu + 1].abs());
                if u + v == v {
                    break;
                }
                m -= 1;
            }
            let mu = m as usize;
            for i in mu + 2..=nnu {
                a[i][i - 2] = 0.0;
                if i != mu + 2 {
                    a[i][i - 3] = 0.0;
                }
            }
            // Double QR step on rows l..nn and columns m..nn.
            let lu = l as usize;
            let mut k = mu;
            while k + 1 <= nnu {
                if k != mu {
                    p = a[k][k - 1];
                    q = a[k + 1][k - 1];
                    r = 0.0;
                    if k + 1 != nnu {
                        r = a[k + 2][k - 1];
                    }
                    x = p.abs() + q.abs() + r.abs();
                    if x != 0.0 {
                        p /= x;
                        q /= x;
                        r /= x;
                    }
                }
                let s = (p * p + q * q + r * r).sqrt().copysign(p);
                if s != 0.0 {
                    if k == mu {
                        if lu != mu {
                            a[k][k - 1] = -a[k][k - 1];
                        }
                    } else {
                        a[k][k - 1] = -s * x;
                    }
                    p += s;
                    x = p / s;
                    y = q / s;
                    let z = r / s;
                    q /= p;
                    r /= p;
                    for j in k..=nnu {
                        let mut pp = a[k][j] + q * a[k + 1][j];
                        if k + 1 != nnu {
                            pp += r * a[k + 2][j];
                            a[k + 2][j] -= pp * z;
                        }
                        a[k + 1][j] -= pp * y;
                        a[k][j] -= pp * x;
                    }
                    let mmin = if nnu < k + 3 { nnu } else { k + 3 };
                    for i in lu..=mmin {
                        let mut pp = x * a[i][k] + y * a[i][k + 1];
                        if k + 1 != nnu {
                            pp += z * a[i][k + 2];
                            a[i][k + 2] -= pp * r;
                        }
                        a[i][k + 1] -= pp * q;
                        a[i][k] -= pp;
                    }
                }
                k += 1;
            }
            if l >= nn - 1 {
                break;
            }
        }
    }
    let mut out = [(0.0, 0.0); 6];
    for i in 0..n {
        out[i] = (wr[i], wi[i]);
    }
    Some(out)
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::cr3bp::{propagate_cr3bp, EARTH_MOON_MU};

    #[test]
    fn eigenvalues_of_known_matrices() {
        // Block-diagonal: real pair 5, 1/5; rotation by 0.3 rad; diag(1, 1).
        let (c, s) = (0.3f64.cos(), 0.3f64.sin());
        let m = [
            [5.0, 0.0, 0.0, 0.0, 0.0, 0.0],
            [0.0, 0.2, 0.0, 0.0, 0.0, 0.0],
            [0.0, 0.0, c, -s, 0.0, 0.0],
            [0.0, 0.0, s, c, 0.0, 0.0],
            [0.0, 0.0, 0.0, 0.0, 1.0, 1e-3],
            [0.0, 0.0, 0.0, 0.0, 0.0, 1.0],
        ];
        // Similarity-transform it with a dense well-conditioned matrix so hqr has work.
        let mut p = [[0.0; 6]; 6];
        let mut pinv = [[0.0; 6]; 6];
        for i in 0..6 {
            p[i][i] = 1.0;
            pinv[i][i] = 1.0;
        }
        // Unit upper-triangular P with known inverse via forward substitution.
        for i in 0..6 {
            for j in i + 1..6 {
                p[i][j] = 0.1 * (i + 2 * j) as f64;
            }
        }
        for j in 0..6 {
            // Solve P·x = e_j (upper triangular).
            for i in (0..6).rev() {
                let mut s = if i == j { 1.0 } else { 0.0 };
                for k in i + 1..6 {
                    s -= p[i][k] * pinv[k][j];
                }
                pinv[i][j] = s;
            }
        }
        let a = matmul6(&matmul6(&p, &m), &pinv);
        let e = eigenvalues6(&a);
        assert!(
            (e[0].0 - 5.0).abs() < 1e-10 && e[0].1.abs() < 1e-10,
            "{e:?}"
        );
        assert!((e[5].0 - 0.2).abs() < 1e-10, "{e:?}");
        let rot: Vec<_> = e
            .iter()
            .filter(|(_, im)| im.abs() > 1e-6)
            .map(|&(re, im)| (re, im.abs()))
            .collect();
        assert_eq!(rot.len(), 2);
        for (re, im) in rot {
            assert!((re - c).abs() < 1e-10 && (im - s).abs() < 1e-10);
        }
        // Stability index: ½(5 + 1/5) = 2.6.
        assert!((stability_index(&e) - 2.6).abs() < 1e-9);
    }

    #[test]
    fn adaptive_flow_agrees_with_fine_rk4() {
        let s0 = Cr3bpState {
            r: [1.15, 0.0, -0.12],
            v: [0.02, 0.18, 0.05],
        };
        let a = propagate_adaptive(&s0, EARTH_MOON_MU, 1.5, &FlowTolerance::default());
        let b = propagate_cr3bp(s0, EARTH_MOON_MU, 1.5, 60_000);
        let d = norm(&[a.r[0] - b.r[0], a.r[1] - b.r[1], a.r[2] - b.r[2]]);
        assert!(d < 1e-11, "adaptive vs fine RK4: {d:e}");
    }

    fn l2_south_seed() -> FamilyMember {
        let guess = Cr3bpState {
            r: [1.08, 0.0, -0.10],
            v: [0.0, -0.10, 0.0],
        };
        correct_member(
            &guess,
            EARTH_MOON_MU,
            Hold::X0,
            false,
            &CorrectorSettings::default(),
        )
        .expect("L2 halo seed converges")
    }

    #[test]
    fn corrected_member_closes_and_is_symplectic() {
        let m = l2_south_seed();
        assert!(m.closure < 1e-9, "closure {:e}", m.closure);
        // Monodromy eigenvalues come in reciprocal pairs (symplectic flow), and the
        // trivial pair sits at 1.
        let e = m.eigenvalues;
        let prod_max_min = e[0].0.hypot(e[0].1) * e[5].0.hypot(e[5].1);
        assert!(
            (prod_max_min - 1.0).abs() < 1e-6,
            "λmax·λmin = {prod_max_min}"
        );
        let near_one = e
            .iter()
            .filter(|(re, im)| (re - 1.0).abs() < 1e-4 && im.abs() < 1e-4)
            .count();
        assert!(near_one >= 2, "trivial pair missing: {e:?}");
        assert!(m.stability_index > 1.0);
    }

    #[test]
    fn mirror_member_is_the_northern_twin() {
        let s = l2_south_seed();
        let n = correct_member(
            &mirror_z(&s.ic),
            EARTH_MOON_MU,
            Hold::X0,
            false,
            &CorrectorSettings::default(),
        )
        .unwrap();
        assert!((n.period - s.period).abs() < 1e-10);
        assert!((n.jacobi - s.jacobi).abs() < 1e-12);
        assert!((n.ic.r[2] + s.ic.r[2]).abs() < 1e-10);
    }

    #[test]
    fn pseudo_arclength_matches_natural_parameter_family() {
        let mu = EARTH_MOON_MU;
        let set = CorrectorSettings::default();
        let seed = l2_south_seed();
        // Step toward smaller x0 (toward the Moon, the NRHO end).
        let pac = continue_pseudo_arclength(&seed, mu, false, 0.01, 4, &[-1.0, 0.0, 0.0], &set);
        assert_eq!(pac.len(), 5);
        // Every member is periodic and the Jacobi constant changes monotonically here.
        for w in pac.windows(2) {
            assert!(w[1].closure < 1e-8);
            assert!(w[1].ic.r[0] < w[0].ic.r[0]);
        }
        // The same members from natural-parameter continuation at the PAC x0 values.
        let xs: Vec<f64> = pac[1..].iter().map(|m| m.ic.r[0]).collect();
        let nat = continue_natural(&seed, mu, Hold::X0, false, &xs, &set);
        assert_eq!(nat.len(), xs.len());
        for (a, b) in pac[1..].iter().zip(&nat) {
            assert!((a.ic.r[2] - b.ic.r[2]).abs() < 1e-8);
            assert!((a.period - b.period).abs() < 1e-8);
            assert!((a.stability_index - b.stability_index).abs() < 1e-4 * a.stability_index);
        }
    }

    #[test]
    fn planar_dro_member_is_stable() {
        // The far-side crossing of a mid-size DRO (as in crate::dro).
        let mu = EARTH_MOON_MU;
        let seed = crate::dro::dro_from_crossing((1.0 - mu) + 0.075, mu, 1e-12, 60).unwrap();
        let guess = Cr3bpState {
            r: [seed.ic[0], 0.0, 0.0],
            v: [0.0, seed.ic[3], 0.0],
        };
        let m = correct_member(&guess, mu, Hold::X0, true, &CorrectorSettings::default()).unwrap();
        assert!((m.period - seed.period).abs() < 1e-6);
        // DROs are linearly stable: ν = 1 to numerical precision.
        assert!(
            (m.stability_index - 1.0).abs() < 1e-6,
            "ν = {}",
            m.stability_index
        );
    }
}
