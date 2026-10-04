// SPDX-License-Identifier: AGPL-3.0-only
//! Derivative-free minimisation: Nelder-Mead (unbounded and box-bounded) and a starting
//! grid. The crate had no Nelder-Mead, so it is written here.
//!
//! Nelder-Mead uses the standard coefficients (reflection 1, expansion 2, contraction
//! ½, shrink ½; Nelder & Mead, *Comput. J.* 7 (1965) 308; Lagarias et al., *SIAM J.
//! Optim.* 9 (1998) 112 for the accept rules). It stops when both the spread of the
//! simplex values and the largest vertex distance from the best vertex fall below their
//! tolerances, or when the evaluation budget runs out, and then restarts from the best
//! vertex with a fresh simplex until a restart no longer improves the value (the usual
//! guard against a collapsed simplex). The bounded form maps the box smoothly onto
//! unbounded coordinates (the sine transform). Non-finite objective values count as
//! `+∞`.

/// Nelder-Mead settings.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct NmOptions {
    /// Objective evaluations allowed per pass.
    pub max_evals: usize,
    /// Stop when `max f − min f` over the simplex is at most this times `1 + |min f|`.
    pub ftol: f64,
    /// … and every vertex is within this (max-norm) of the best one.
    pub xtol: f64,
    /// Edge of the initial simplex (in the coordinates being searched).
    pub initial_step: f64,
    /// Restarts from the best vertex after convergence.
    pub max_restarts: usize,
}

impl Default for NmOptions {
    fn default() -> Self {
        Self {
            max_evals: 4000,
            ftol: 1e-14,
            xtol: 1e-10,
            initial_step: 0.1,
            max_restarts: 4,
        }
    }
}

/// Result of a minimisation.
#[derive(Clone, Debug, PartialEq)]
pub struct NmResult {
    /// The best point found.
    pub x: Vec<f64>,
    /// The objective there.
    pub f: f64,
    /// Objective evaluations used.
    pub evals: usize,
    /// Whether the last pass met the tolerances (rather than running out of budget).
    pub converged: bool,
}

fn finite_or_inf(v: f64) -> f64 {
    if v.is_finite() {
        v
    } else {
        f64::INFINITY
    }
}

/// One Nelder-Mead pass from `x0`; `proj` maps any trial point into the domain.
fn nm_pass<F: FnMut(&[f64]) -> f64, P: Fn(&mut [f64])>(
    f: &mut F,
    proj: &P,
    x0: &[f64],
    opts: &NmOptions,
) -> NmResult {
    let n = x0.len();
    // A zero-dimensional problem has a single point and nothing to search: evaluate it
    // once and return, rather than indexing `fv[n - 1]` (a usize underflow) below.
    if n == 0 {
        let x = x0.to_vec();
        let f0 = finite_or_inf(f(&x));
        return NmResult {
            x,
            f: f0,
            evals: 1,
            converged: true,
        };
    }
    let mut evals = 0usize;
    let mut eval = |x: &[f64], evals: &mut usize| {
        *evals += 1;
        finite_or_inf(f(x))
    };
    let mut simplex: Vec<Vec<f64>> = Vec::with_capacity(n + 1);
    let mut start = x0.to_vec();
    proj(&mut start);
    simplex.push(start.clone());
    for i in 0..n {
        let mut v = start.clone();
        v[i] += opts.initial_step;
        proj(&mut v);
        if v[i] == start[i] {
            v[i] -= opts.initial_step;
            proj(&mut v);
        }
        simplex.push(v);
    }
    let mut fv: Vec<f64> = simplex.iter().map(|x| eval(x, &mut evals)).collect();
    let mut converged = false;
    while evals < opts.max_evals {
        let mut idx: Vec<usize> = (0..=n).collect();
        idx.sort_by(|&a, &b| fv[a].total_cmp(&fv[b]));
        simplex = idx.iter().map(|&i| simplex[i].clone()).collect();
        fv = idx.iter().map(|&i| fv[i]).collect();
        let size = simplex[1..]
            .iter()
            .map(|v| {
                v.iter()
                    .zip(&simplex[0])
                    .map(|(a, b)| (a - b).abs())
                    .fold(0.0, f64::max)
            })
            .fold(0.0, f64::max);
        if (fv[n] - fv[0]).abs() <= opts.ftol * (1.0 + fv[0].abs()) && size <= opts.xtol {
            converged = true;
            break;
        }
        let mut c = vec![0.0; n];
        for v in &simplex[..n] {
            for (ci, vi) in c.iter_mut().zip(v) {
                *ci += vi / n as f64;
            }
        }
        let along = |t: f64| -> Vec<f64> {
            let mut p: Vec<f64> = c
                .iter()
                .zip(&simplex[n])
                .map(|(ci, wi)| ci + t * (ci - wi))
                .collect();
            proj(&mut p);
            p
        };
        let xr = along(1.0);
        let fr = eval(&xr, &mut evals);
        if fr < fv[0] {
            let xe = along(2.0);
            let fe = eval(&xe, &mut evals);
            if fe < fr {
                simplex[n] = xe;
                fv[n] = fe;
            } else {
                simplex[n] = xr;
                fv[n] = fr;
            }
            continue;
        }
        if fr < fv[n - 1] {
            simplex[n] = xr;
            fv[n] = fr;
            continue;
        }
        let (xc, fc) = if fr < fv[n] {
            let xc = along(0.5);
            let fc = eval(&xc, &mut evals);
            (xc, fc)
        } else {
            let xc = along(-0.5);
            let fc = eval(&xc, &mut evals);
            (xc, fc)
        };
        if fc < fv[n].min(fr) {
            simplex[n] = xc;
            fv[n] = fc;
            continue;
        }
        // Shrink towards the best vertex.
        for i in 1..=n {
            let mut v: Vec<f64> = simplex[i]
                .iter()
                .zip(&simplex[0])
                .map(|(vi, bi)| bi + 0.5 * (vi - bi))
                .collect();
            proj(&mut v);
            fv[i] = eval(&v, &mut evals);
            simplex[i] = v;
        }
    }
    let best = (0..=n)
        .min_by(|&a, &b| fv[a].total_cmp(&fv[b]))
        .unwrap_or(0);
    NmResult {
        x: simplex[best].clone(),
        f: fv[best],
        evals,
        converged,
    }
}

fn nm_with_restarts<F: FnMut(&[f64]) -> f64, P: Fn(&mut [f64])>(
    mut f: F,
    proj: P,
    x0: &[f64],
    opts: &NmOptions,
) -> NmResult {
    let mut best = nm_pass(&mut f, &proj, x0, opts);
    let mut total = best.evals;
    for _ in 0..opts.max_restarts {
        let next = nm_pass(&mut f, &proj, &best.x, opts);
        total += next.evals;
        let improved = next.f < best.f;
        if next.f <= best.f {
            best = NmResult { evals: 0, ..next };
        }
        if !improved {
            break;
        }
    }
    best.evals = total;
    best
}

/// Minimise `f` from `x0` with Nelder-Mead, no bounds.
pub fn nelder_mead<F: FnMut(&[f64]) -> f64>(f: F, x0: &[f64], opts: &NmOptions) -> NmResult {
    nm_with_restarts(f, |_: &mut [f64]| {}, x0, opts)
}

/// Minimise `f` over the box `[lo, hi]` from `x0`. The search runs in unbounded
/// coordinates `y` with `x = lo + (hi − lo)·sin²(y)` (the MINUIT transform for
/// double-bounded parameters; James & Roos, *Comput. Phys. Commun.* 10 (1975) 343), so
/// every trial point is inside the box and the simplex never collapses onto a face, as
/// it can when trial points are projected. `opts.initial_step` and `opts.xtol` are in
/// `y` (radians). A parameter with `lo == hi` is fixed.
pub fn nelder_mead_bounded<F: FnMut(&[f64]) -> f64>(
    mut f: F,
    x0: &[f64],
    lo: &[f64],
    hi: &[f64],
    opts: &NmOptions,
) -> NmResult {
    let span: Vec<f64> = lo.iter().zip(hi).map(|(l, h)| h - l).collect();
    let to_x = |y: &[f64]| -> Vec<f64> {
        y.iter()
            .zip(lo)
            .zip(&span)
            .map(|((yi, l), s)| l + s * yi.sin().powi(2))
            .collect()
    };
    let y0: Vec<f64> = x0
        .iter()
        .zip(lo)
        .zip(&span)
        .map(|((x, l), s)| {
            if *s > 0.0 {
                ((x - l) / s).clamp(0.0, 1.0).sqrt().asin()
            } else {
                0.0
            }
        })
        .collect();
    let r = nm_with_restarts(|y: &[f64]| f(&to_x(y)), |_: &mut [f64]| {}, &y0, opts);
    let mut x = to_x(&r.x);
    for ((xi, l), h) in x.iter_mut().zip(lo).zip(hi) {
        *xi = xi.clamp(*l, *h);
    }
    NmResult { x, ..r }
}

/// Evaluate `f` on a regular grid of `points` per dimension over `[lo, hi]` and return
/// every grid point with its value, best first (ties keep grid order).
pub fn grid_search<F: FnMut(&[f64]) -> f64>(
    mut f: F,
    lo: &[f64],
    hi: &[f64],
    points: usize,
) -> Vec<(Vec<f64>, f64)> {
    let n = lo.len();
    let p = points.max(1);
    // Guard the grid-size product against usize overflow for a high-dimensional request;
    // an unrepresentable grid yields no points rather than a wrapped count or a panic.
    let Some(total) = p.checked_pow(n as u32) else {
        return Vec::new();
    };
    let mut out = Vec::with_capacity(total);
    for k in 0..total {
        let mut r = k;
        let x: Vec<f64> = (0..n)
            .map(|i| {
                let j = r % p;
                r /= p;
                if p == 1 {
                    0.5 * (lo[i] + hi[i])
                } else {
                    lo[i] + (hi[i] - lo[i]) * j as f64 / (p - 1) as f64
                }
            })
            .collect();
        let v = finite_or_inf(f(&x));
        out.push((x, v));
    }
    out.sort_by(|a, b| a.1.total_cmp(&b.1));
    out
}

#[cfg(test)]
mod tests {
    use super::*;

    fn rosenbrock(x: &[f64]) -> f64 {
        (1.0 - x[0]).powi(2) + 100.0 * (x[1] - x[0] * x[0]).powi(2)
    }

    /// Reference: the Rosenbrock function's known global minimum is 0 at (1, 1)
    /// (Rosenbrock, *Comput. J.* 3 (1960) 175), from the classic start (−1.2, 1).
    #[test]
    fn nelder_mead_reaches_the_rosenbrock_minimum_closed_form() {
        let r = nelder_mead(rosenbrock, &[-1.2, 1.0], &NmOptions::default());
        assert!(r.converged);
        assert!((r.x[0] - 1.0).abs() < 1e-6, "{:?}", r.x);
        assert!((r.x[1] - 1.0).abs() < 1e-6, "{:?}", r.x);
        assert!(r.f < 1e-12);
    }

    /// Reference: a quadratic in four variables, minimum at a known point.
    #[test]
    fn nelder_mead_minimises_a_four_dimensional_quadratic_closed_form() {
        let c = [0.3, -2.0, 5.0, 1.5];
        let f = |x: &[f64]| {
            x.iter()
                .zip(&c)
                .enumerate()
                .map(|(i, (a, b))| (i as f64 + 1.0) * (a - b).powi(2))
                .sum::<f64>()
        };
        let r = nelder_mead(f, &[0.0; 4], &NmOptions::default());
        for (x, c) in r.x.iter().zip(&c) {
            assert!((x - c).abs() < 1e-5, "{:?}", r.x);
        }
    }

    /// A minimum outside the box lands on the nearest face (closed form for a separable
    /// quadratic).
    #[test]
    fn bounded_nelder_mead_stops_on_the_active_bound() {
        let f = |x: &[f64]| (x[0] - 3.0).powi(2) + (x[1] + 0.25).powi(2);
        let r = nelder_mead_bounded(
            f,
            &[0.5, 0.5],
            &[0.0, -1.0],
            &[1.0, 1.0],
            &NmOptions::default(),
        );
        assert!((r.x[0] - 1.0).abs() < 1e-9, "{:?}", r.x);
        assert!((r.x[1] + 0.25).abs() < 1e-6, "{:?}", r.x);
    }

    #[test]
    fn rosenbrock_in_a_box_and_grid_start_reach_the_minimum() {
        let g = grid_search(rosenbrock, &[-2.0, -1.0], &[2.0, 3.0], 9);
        assert_eq!(g.len(), 81);
        let r = nelder_mead_bounded(
            rosenbrock,
            &g[0].0,
            &[-2.0, -1.0],
            &[2.0, 3.0],
            &NmOptions::default(),
        );
        assert!(
            (r.x[0] - 1.0).abs() < 1e-6 && (r.x[1] - 1.0).abs() < 1e-6,
            "{:?}",
            r.x
        );
    }

    #[test]
    fn nelder_mead_is_deterministic() {
        let a = nelder_mead(rosenbrock, &[-1.2, 1.0], &NmOptions::default());
        let b = nelder_mead(rosenbrock, &[-1.2, 1.0], &NmOptions::default());
        assert_eq!(a.x[0].to_bits(), b.x[0].to_bits());
        assert_eq!(a.evals, b.evals);
    }
}
