// SPDX-License-Identifier: AGPL-3.0-only
//! External-oracle validation of the batch-LS estimator under the lunar joint
//! multi-technique OD + clock capability (`lunar_combination`), against an
//! **independent third-party authority**: Orekit 12.2 / Hipparchus 3.1
//! (CS GROUP + the Hipparchus project, Apache-2.0).
//!
//! ## What is validated
//!
//! `kshana::batch_ls::gauss_newton` is the estimation core the `lunar_combination`
//! joint OD + clock solve is built on: it forms and solves the WEIGHTED normal
//! equations of a multilateration + clock-offset network and iterates to
//! convergence. This test runs that exact public function on a representative
//! joint geometry of the SAME structure `lunar_combination` builds — a surface
//! station's 3-D position, a small constellation's per-satellite 3-D positions,
//! and every asset's clock offset (`c·dt`, range-metres), observed by an absolute
//! station-clock anchor, anchor→station ranges, anchor→satellite ranges,
//! station↔satellite ranges, and inter-satellite ranges (each range carrying the
//! differenced clock term) — on **byte-identical** synthetic observations and
//! `1/σ²` weights, from a common a-priori.
//!
//! The oracle is Orekit's `BatchLSEstimator` solver
//! (`LevenbergMarquardtOptimizer`, the canonical default): an INDEPENDENT
//! implementation that minimises the SAME weighted-least-squares cost via a
//! trust-region QR path — a different algorithm and different linear algebra from
//! kshana's Gauss–Newton normal-equation inverse. On a well-conditioned full-rank
//! network two correct weighted-LS solvers reach the same uniquely-defined
//! optimum and the same formal covariance, so agreement to a tight tolerance is a
//! genuine cross-implementation check of the estimator primitive.
//!
//! Compared quantities, per case:
//!   * the converged estimated state — station 3-D position (m), satellite
//!     positions (m), and clock offsets (`c·dt`, m) — to **< 1e-3 m** per
//!     position component and **< 1e-12 s** per clock; and
//!   * the diagonal of the formal covariance (per-parameter formal 1-σ) to
//!     **within 5 %** per parameter. kshana's covariance is `(HᵀWH)⁻¹` built from
//!     a central-difference Jacobian and kshana's own matrix inverse
//!     (`fusion::ukf::inverse`) — the same recipe `lunar_combination`'s
//!     `formal_covariance_nees` uses — versus Hipparchus's QR-based
//!     `Evaluation.getCovariances`.
//!
//! ## Honest scope (gate accordingly)
//!
//! This validates the **batch-LS estimator PRIMITIVE** — that kshana's solver
//! reaches the same WLS optimum and the same formal covariance as an independent
//! solver on byte-identical inputs. It does **NOT** validate the lunar frame
//! realisation, the VLBI near-field delay model, real VLBI/ranging data, or any
//! force model; the geometry uses plain Cartesian ranges from well-spread
//! anchors (no frame plumbing) precisely so the comparison isolates the solver.
//! It gates `lunar_combination` AT THE SOLVER LEVEL ONLY; the lunar self-check
//! (truth recovery + NEES) remains an internal-consistency oracle.
//!
//! Inputs, the committed Orekit/Hipparchus reference output, provenance and the
//! generator live in `tests/fixtures/lunar_joint_multi_technique_od/`.

use kshana::batch_ls::gauss_newton;
use kshana::fusion::ukf::inverse;

const INPUTS: &str = include_str!("fixtures/lunar_joint_multi_technique_od/cases.txt");
const REF: &str = include_str!(
    "fixtures/lunar_joint_multi_technique_od/lunar_joint_multi_technique_od_reference.txt"
);

const C: f64 = 299_792_458.0; // m/s, == kshana::timegeo::C_M_PER_S

// State-comparison tolerances (planned): positions to 1e-3 m, clocks to 1e-12 s
// (held as c·dt range-metres → c·1e-12 ≈ 3e-4 m). A small absolute floor covers a
// component the oracle reports as ~0.
const POS_ABS_TOL_M: f64 = 1.0e-3;
const CLK_ABS_TOL_M: f64 = C * 1.0e-12; // ≈ 3.0e-4 m
                                        // Covariance-diagonal agreement: 5 % relative per parameter, tiny absolute floor.
const COV_REL_TOL: f64 = 0.05;
const COV_ABS_TOL: f64 = 1.0e-12;

type Vec3 = [f64; 3];

/// Parameter scale (physical metres per stored unit) — the SAME device
/// `lunar_combination` uses: every estimated correction is stored as
/// `physical_metres / PARAM_SCALE`, so a ~50 m correction lives as ~5e-5 stored.
/// This keeps the Gauss–Newton finite-difference step (`1e-6·max(1,|stored|)` =
/// 1e-6 stored = 1 m physical) far above the f64 ULP of a multi-Mm range, so the
/// FD Jacobian is well-conditioned and the step shrinks cleanly to convergence.
const PARAM_SCALE: f64 = 1.0e6;

/// Static geometry + per-observable noise model shared by every case.
///
/// The solve estimates **corrections to the a-priori** `x0` (the design
/// geometry), exactly as `lunar_combination` does, so the estimated parameters
/// are O(tens of metres) rather than O(millions) — keeping the Gauss–Newton
/// step well-scaled and convergence crisp. The absolute state handed to / read
/// from the oracle is `x0 + correction`.
struct Geom {
    n_sat: usize,
    n_params: usize,
    anchors: Vec<Vec3>,
    pairs: Vec<(usize, usize)>,
    weight: Vec<f64>,
    /// A-priori absolute state for the current case (corrections are added to it).
    x0: Vec<f64>,
}

struct Case {
    seed: usize,
    x0: Vec<f64>,
    z: Vec<f64>,
}

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn norm(v: Vec3) -> f64 {
    (v[0] * v[0] + v[1] * v[1] + v[2] * v[2]).sqrt()
}

impl Geom {
    /// Absolute parameter `i` = a-priori + estimated correction (stored ×
    /// PARAM_SCALE → physical metres).
    fn abs(&self, corr: &[f64], i: usize) -> f64 {
        self.x0[i] + corr[i] * PARAM_SCALE
    }
    fn station(&self, corr: &[f64]) -> Vec3 {
        [self.abs(corr, 0), self.abs(corr, 1), self.abs(corr, 2)]
    }
    fn sat(&self, corr: &[f64], k: usize) -> Vec3 {
        let b = 3 + 3 * k;
        [
            self.abs(corr, b),
            self.abs(corr, b + 1),
            self.abs(corr, b + 2),
        ]
    }
    fn clk_st(&self, corr: &[f64]) -> f64 {
        self.abs(corr, 3 + 3 * self.n_sat)
    }
    fn clk_sat(&self, corr: &[f64], k: usize) -> f64 {
        self.abs(corr, 3 + 3 * self.n_sat + 1 + k)
    }

    /// Forward observable model h(corr), where the absolute state is
    /// `x0 + corr`. The ordering MUST match the Python generator and the Java
    /// oracle exactly.
    fn forward(&self, corr: &[f64]) -> Vec<f64> {
        let st = self.station(corr);
        let sats: Vec<Vec3> = (0..self.n_sat).map(|k| self.sat(corr, k)).collect();
        let clk_st = self.clk_st(corr);
        let clk_sat: Vec<f64> = (0..self.n_sat).map(|k| self.clk_sat(corr, k)).collect();

        let mut h = Vec::new();
        // 0. absolute station-clock anchor
        h.push(clk_st);
        // 1. anchor -> station ranges
        for &a in &self.anchors {
            h.push(norm(sub(st, a)));
        }
        // 2. anchor -> sat ranges + sat clock
        for (k, &sat) in sats.iter().enumerate() {
            for &a in &self.anchors {
                h.push(norm(sub(sat, a)) + clk_sat[k]);
            }
        }
        // 3. station -> sat ranges + differenced clock
        for (k, &sat) in sats.iter().enumerate() {
            h.push(norm(sub(sat, st)) + (clk_sat[k] - clk_st));
        }
        // 4. inter-satellite ranges + differenced clock
        for &(i, j) in &self.pairs {
            h.push(norm(sub(sats[i], sats[j])) + (clk_sat[i] - clk_sat[j]));
        }
        h
    }

    /// Central finite-difference Jacobian (m×n) at `x`, using the SAME
    /// `1e-6·max(1, |x_p|)` step recipe `kshana::batch_ls` uses internally.
    fn fd_jacobian(&self, x: &[f64]) -> Vec<Vec<f64>> {
        let m = self.forward(x).len();
        let n = x.len();
        let mut jac = vec![vec![0.0; n]; m];
        for (p, &xp_val) in x.iter().enumerate() {
            let step = 1e-6 * xp_val.abs().max(1.0);
            let mut xp = x.to_vec();
            let mut xm = x.to_vec();
            xp[p] += step;
            xm[p] -= step;
            let hp = self.forward(&xp);
            let hm = self.forward(&xm);
            for (i, jr) in jac.iter_mut().enumerate() {
                jr[p] = (hp[i] - hm[i]) / (2.0 * step);
            }
        }
        jac
    }

    /// Formal covariance diagonal `diag((HᵀWH)⁻¹)` at the converged solution,
    /// built from kshana's own matrix inverse (`fusion::ukf::inverse`) — the recipe
    /// `lunar_combination::formal_covariance_nees` uses. `H` is the Jacobian wrt
    /// the SCALED stored corrections, so the resulting variance is in stored²
    /// units; it is rescaled to PHYSICAL m² (×PARAM_SCALE²) to match the oracle.
    fn covariance_diag_physical(&self, corr_hat: &[f64]) -> Vec<f64> {
        let jac = self.fd_jacobian(corr_hat);
        let n = self.n_params;
        let mut info = vec![vec![0.0; n]; n];
        for (i, ji) in jac.iter().enumerate() {
            let w = self.weight[i];
            for p in 0..n {
                for q in 0..n {
                    info[p][q] += ji[p] * w * ji[q];
                }
            }
        }
        let cov =
            inverse(&info).expect("information matrix must be invertible (full-rank network)");
        (0..n)
            .map(|p| cov[p][p] * PARAM_SCALE * PARAM_SCALE)
            .collect()
    }
}

fn floats(rest: &str) -> Vec<f64> {
    rest.split_whitespace()
        .map(|t| {
            t.parse::<f64>()
                .unwrap_or_else(|_| panic!("bad float '{t}'"))
        })
        .collect()
}

fn parse_inputs() -> (Geom, Vec<Case>) {
    let mut n_sat = 0usize;
    let mut n_anchor = 0usize;
    let mut n_params = 0usize;
    let mut anchors: Vec<Vec3> = Vec::new();
    let mut pairs: Vec<(usize, usize)> = Vec::new();
    let mut weight: Vec<f64> = Vec::new();
    let mut cases: Vec<Case> = Vec::new();

    let mut cur_seed: Option<usize> = None;
    let mut cur_x0: Option<Vec<f64>> = None;
    let mut cur_z: Option<Vec<f64>> = None;

    let flush = |cases: &mut Vec<Case>,
                 seed: &mut Option<usize>,
                 x0: &mut Option<Vec<f64>>,
                 z: &mut Option<Vec<f64>>| {
        if let Some(s) = seed.take() {
            cases.push(Case {
                seed: s,
                x0: x0.take().expect("CASE missing X0"),
                z: z.take().expect("CASE missing Z"),
            });
        }
    };

    for line in INPUTS.lines() {
        let line = line.trim();
        if line.is_empty() || line.starts_with('#') {
            continue;
        }
        let (tag, rest) = match line.split_once(' ') {
            Some((t, r)) => (t, r.trim()),
            None => (line, ""),
        };
        match tag {
            "N_SAT" => n_sat = rest.parse().unwrap(),
            "N_ANCHOR" => n_anchor = rest.parse().unwrap(),
            "N_PARAMS" => n_params = rest.parse().unwrap(),
            "ANCHORS" => {
                let f = floats(rest);
                assert_eq!(f.len(), n_anchor * 3, "ANCHORS length");
                anchors = (0..n_anchor)
                    .map(|a| [f[a * 3], f[a * 3 + 1], f[a * 3 + 2]])
                    .collect();
            }
            "PAIRS" => {
                let toks: Vec<usize> = rest
                    .split_whitespace()
                    .map(|t| t.parse().unwrap())
                    .collect();
                pairs = toks.chunks_exact(2).map(|c| (c[0], c[1])).collect();
            }
            "SIGMA" => { /* not needed: weights drive the solve */ }
            "WEIGHT" => weight = floats(rest),
            "CASE" => {
                flush(&mut cases, &mut cur_seed, &mut cur_x0, &mut cur_z);
                cur_seed = Some(rest.parse().unwrap());
            }
            "XTRUE" => { /* truth not needed by the comparison */ }
            "X0" => cur_x0 = Some(floats(rest)),
            "Z" => cur_z = Some(floats(rest)),
            _ => {}
        }
    }
    flush(&mut cases, &mut cur_seed, &mut cur_x0, &mut cur_z);

    assert!(
        n_sat > 0 && n_params > 0 && !anchors.is_empty(),
        "header parse"
    );
    let geom = Geom {
        n_sat,
        n_params,
        anchors,
        pairs,
        weight,
        x0: vec![0.0; n_params], // set per-case in the test loop
    };
    (geom, cases)
}

/// Parse the oracle reference: STATE and COVDIAG rows keyed by seed.
fn parse_reference() -> (
    std::collections::HashMap<usize, Vec<f64>>,
    std::collections::HashMap<usize, Vec<f64>>,
) {
    let mut states = std::collections::HashMap::new();
    let mut covs = std::collections::HashMap::new();
    for line in REF.lines() {
        let line = line.trim();
        if line.starts_with("STATE ") {
            let f = floats(line.trim_start_matches("STATE "));
            let seed = f[0] as usize;
            states.insert(seed, f[1..].to_vec());
        } else if line.starts_with("COVDIAG ") {
            let f = floats(line.trim_start_matches("COVDIAG "));
            let seed = f[0] as usize;
            covs.insert(seed, f[1..].to_vec());
        }
    }
    (states, covs)
}

#[test]
fn batch_ls_matches_orekit_levenberg_marquardt() {
    let (mut geom, cases) = parse_inputs();
    let (ref_states, ref_covs) = parse_reference();

    let n_sat = geom.n_sat;
    let np = geom.n_params;
    let weights = geom.weight.clone();

    // Parameter index helpers (state layout, mirroring lunar_combination).
    let is_clock = |p: usize| p >= 3 + 3 * n_sat;

    let mut n = 0usize;
    let mut worst_pos = 0.0_f64;
    let mut worst_clk = 0.0_f64;
    let mut worst_cov_rel = 0.0_f64;

    for case in &cases {
        let z = &case.z;
        assert_eq!(case.x0.len(), np, "x0 dim");
        assert_eq!(weights.len(), z.len(), "weight/obs dim");
        assert!(z.len() >= 20, "need >=20 observations, got {}", z.len());

        // Estimate corrections to this case's a-priori (starting from zeros) — the
        // lunar_combination parameterisation that keeps the GN step well-scaled.
        geom.x0 = case.x0.clone();
        let corr0 = vec![0.0_f64; np];

        let model = {
            let g = &geom;
            move |x: &[f64]| g.forward(x)
        };
        // tol is the step norm in STORED units; 1e-9 stored = 1e-3 m physical, and
        // the well-scaled solve drives the step well below it, so convergence is
        // declared AT the optimum (not at a coarse step floor).
        let res = gauss_newton(model, z, &weights, &corr0, 100, 1.0e-9)
            .unwrap_or_else(|| panic!("seed {}: kshana gauss_newton returned None", case.seed));
        assert!(
            res.converged,
            "seed {}: kshana solve did not converge ({} iters)",
            case.seed, res.iterations
        );
        assert!(
            res.x.iter().all(|v| v.is_finite()),
            "seed {}: non-finite estimate",
            case.seed
        );
        // Reconstruct the absolute estimated state (a-priori + correction×SCALE).
        let x_hat: Vec<f64> = (0..np)
            .map(|i| case.x0[i] + res.x[i] * PARAM_SCALE)
            .collect();

        let want = ref_states
            .get(&case.seed)
            .unwrap_or_else(|| panic!("no oracle STATE for seed {}", case.seed));
        assert_eq!(want.len(), np, "oracle STATE dim");

        // 1. Converged-state comparison, component by component.
        for p in 0..np {
            let got = x_hat[p];
            let exp = want[p];
            let d = (got - exp).abs();
            if is_clock(p) {
                worst_clk = worst_clk.max(d);
                assert!(
                    d <= CLK_ABS_TOL_M,
                    "seed {} clock param {p}: kshana {got:.9e} m vs Orekit {exp:.9e} m \
                     (|Δ|={d:.3e} m > {CLK_ABS_TOL_M:.3e} m = c·1e-12 s)",
                    case.seed
                );
            } else {
                worst_pos = worst_pos.max(d);
                assert!(
                    d <= POS_ABS_TOL_M,
                    "seed {} position param {p}: kshana {got:.6e} m vs Orekit {exp:.6e} m \
                     (|Δ|={d:.3e} m > {POS_ABS_TOL_M:.3e} m)",
                    case.seed
                );
            }
        }

        // 2. Formal-covariance-diagonal comparison (per-parameter formal variance).
        //    Evaluated at the converged correction (forward() adds the a-priori),
        //    so the Jacobian is taken at the absolute solution. The covariance is
        //    invariant to the constant a-priori offset.
        let cov_kshana = geom.covariance_diag_physical(&res.x);
        let cov_oracle = ref_covs
            .get(&case.seed)
            .unwrap_or_else(|| panic!("no oracle COVDIAG for seed {}", case.seed));
        assert_eq!(cov_oracle.len(), np, "oracle COVDIAG dim");
        for p in 0..np {
            let got = cov_kshana[p];
            let exp = cov_oracle[p];
            assert!(
                got > 0.0 && exp > 0.0,
                "seed {} cov[{p}] non-positive",
                case.seed
            );
            let rel = (got - exp).abs() / (exp.abs() + COV_ABS_TOL);
            worst_cov_rel = worst_cov_rel.max(rel);
            assert!(
                (got - exp).abs() <= COV_REL_TOL * exp.abs() + COV_ABS_TOL,
                "seed {} cov-diag[{p}]: kshana {got:.6e} m² vs Orekit {exp:.6e} m² \
                 (rel Δ={rel:.3e} > {COV_REL_TOL})",
                case.seed
            );
        }

        n += 1;
    }

    assert!(
        n >= 5,
        "expected >=5 geometries/seeds, got {n} (planned minimum)"
    );
    eprintln!(
        "lunar_joint_multi_technique_od_reference: {n} cases vs Orekit 12.2 / Hipparchus 3.1 \
         LevenbergMarquardt (n_obs={}, n_params={np}); worst |Δ| position {worst_pos:.3e} m, \
         clock {worst_clk:.3e} m (={:.3e} s), worst cov-diag relΔ {worst_cov_rel:.3e}",
        cases[0].z.len(),
        worst_clk / C,
    );
}
