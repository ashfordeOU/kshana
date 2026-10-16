// SPDX-License-Identifier: AGPL-3.0-only
//! Position error ≈ σ_UERE × DOP on four hand-chosen skies, with chi-square confidence
//! intervals: the first of the two checks of the ledger row (the second, the 0.36 design note's
//! pre-registered set on the 8 gnss_lib_py geometries, is [`crate::dop_error_mc`]).
//!
//! The relation every "accuracy = DOP × σ" figure in the engine leans on (Kaplan and Hegarty
//! (eds.), *Understanding GPS: Principles and Applications*, 2nd ed., Artech House, 2006,
//! ch. 7; Misra and Enge, *Global Positioning System*, ch. 6) is that, for independent
//! zero-mean ranging errors of equal variance σ², the unweighted least-squares
//! estimate of position and clock has covariance σ²·Q with `Q = (HᵀH)⁻¹`, so
//! the RMS error along each axis is σ times the matching DOP: `σ·HDOP` horizontally, `σ·VDOP`
//! vertically, `σ·PDOP` in 3-D, `σ·TDOP` for the clock (as a range) and `σ·GDOP` for all four.
//!
//! [`run`] checks that relation on the engine's own solver: for each of four fixed geometries
//! (an open sky, a clustered sky, an urban-canyon-like street and a sky blocked on one side)
//! it draws seeded Gaussian ranging errors, forms pseudoranges from a known position and clock,
//! solves them with [`crate::pvt::solve_spp`] (iterated Gauss-Newton, unit weights) and
//! compares the mean squared error of each quantity with σ² times the square of the DOP that
//! [`crate::orbit::dop`] gives for the same geometry. The DOP kernel is the one VALIDATED
//! against gnss_lib_py (`tests/dop_reference.rs`); this check does not re-derive it.
//!
//! ## The tolerance
//!
//! Each check is a confidence interval at a stated false-failure probability, not a tuned
//! margin. With `N` trials and the linear Gaussian model:
//!
//! * a single axis (vertical, clock) has `Σ e²/(σ²·DOP²) ~ χ²_N` exactly, so the ratio
//!   `mean(e²)/(σ²·DOP²)` must lie in `[χ²_N(α/2), χ²_N(1-α/2)] / N` (quantiles from
//!   [`crate::raim::chi2_quantile`], checked against SciPy in `tests/raim_reference.rs`);
//! * a sum over `k` axes (horizontal 2, position 3, all four) is `Σ λ_i χ²_1` with
//!   `Σ λ_i = DOP²` (the `λ_i` are the eigenvalues of the matching block of Q), whose
//!   variance `2Σλ_i²` is at most `2(Σλ_i)²`; so the ratio has mean 1 and standard deviation
//!   at most `√(2/N)`, and must lie within `z(1-α/2)·√(2/N)` of 1 (normal approximation, `N`
//!   large; the bound makes the interval conservative, so it errs towards passing a ratio
//!   slightly further from 1, never towards failing a correct one).
//!
//! `α` is the total false-failure probability divided by the number of checks (Bonferroni),
//! so the whole report fails a correct implementation with probability at most the total.
//! With the defaults (20,000 trials, total 1e-6, 20 checks) the single-axis interval is about
//! ±5.6 % on the variance (±2.8 % on the RMS) and the multi-axis one ±5.4 %.
//!
//! The estimator is nonlinear (ranges, not their linearisation); with satellites 22,000 km
//! away and errors of metres the second-order term is of order `e²/ρ`, about 1e-6 m, far
//! below what the intervals can see.
//!
//! **Status: a consistency check, MODELLED.** It shows the engine's fix realises σ·DOP under
//! the textbook error model. It does not show that real ranging errors are Gaussian,
//! independent or of equal variance, nor what σ_UERE is for any receiver: σ is an input.

use crate::portable_distr::{Distribution, StandardNormal};
use crate::portable_math::PortableFloat;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use serde::Serialize;

use crate::frames::{geodetic_to_ecef, Geodetic};
use crate::orbit::{dop, enu_basis, Dop};
use crate::pvt::{solve_spp, SppMeasurement};
use crate::raim::{chi2_quantile, normal_quantile};

/// One fixed sky: line-of-sight directions as `(elevation, azimuth)` in degrees.
#[derive(Clone, Copy, Debug)]
pub struct McGeometry {
    /// Short name.
    pub name: &'static str,
    /// What it stands for.
    pub description: &'static str,
    /// Satellite directions, degrees.
    pub dirs: &'static [(f64, f64)],
}

/// The four geometries of the check, from well to badly conditioned.
pub const GEOMETRIES: [McGeometry; 4] = [
    McGeometry {
        name: "open-sky",
        description: "eight satellites spread in azimuth from 15 to 75 deg elevation",
        dirs: &[
            (75.0, 30.0),
            (50.0, 120.0),
            (45.0, 210.0),
            (40.0, 300.0),
            (25.0, 0.0),
            (20.0, 90.0),
            (15.0, 180.0),
            (15.0, 270.0),
        ],
    },
    McGeometry {
        name: "clustered",
        description: "six satellites inside a cone of about 20 deg around elevation 60, azimuth 40",
        dirs: &[
            (60.0, 45.0),
            (70.0, 40.0),
            (55.0, 30.0),
            (65.0, 60.0),
            (50.0, 50.0),
            (62.0, 20.0),
        ],
    },
    McGeometry {
        name: "canyon",
        description: "a north-south street: six satellites within 20 deg of the street's axis",
        dirs: &[
            (80.0, 0.0),
            (60.0, 10.0),
            (40.0, 350.0),
            (65.0, 180.0),
            (45.0, 190.0),
            (30.0, 170.0),
        ],
    },
    McGeometry {
        name: "half-sky",
        description: "six satellites all between azimuth 10 and 150 deg: a sky blocked to the west",
        dirs: &[
            (70.0, 20.0),
            (45.0, 60.0),
            (30.0, 100.0),
            (20.0, 150.0),
            (55.0, 130.0),
            (15.0, 10.0),
        ],
    },
];

/// What to run.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct McConfig {
    /// Trials per geometry.
    pub trials: usize,
    /// Ranging error standard deviation σ_UERE, m (an input; the check is of the relation,
    /// not of any value of σ).
    pub sigma_m: f64,
    /// Seed of the error draws; geometry `i` uses `seed + i`.
    pub seed: u64,
    /// Probability that the whole report fails a correct implementation (split evenly over
    /// the checks).
    pub alpha_total: f64,
    /// Negative control: draw each satellite's error with standard deviation
    /// `sigma_m / sin(elevation)` instead of `sigma_m`, which breaks the equal-variance model
    /// the unweighted `Q` assumes. The checks must then fail; off by default.
    pub elevation_dependent_errors: bool,
}

impl Default for McConfig {
    fn default() -> Self {
        Self {
            trials: 20_000,
            sigma_m: crate::orbit::DEFAULT_UERE_M,
            seed: 0x0D0B_5EED,
            alpha_total: 1e-6,
            elevation_dependent_errors: false,
        }
    }
}

/// One quantity of one geometry checked against σ × DOP.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct AxisCheck {
    /// `hdop`, `vdop`, `pdop`, `tdop` or `gdop`.
    pub quantity: &'static str,
    /// The DOP from [`crate::orbit::dop`].
    pub dop: f64,
    /// σ × DOP, m.
    pub predicted_rms_m: f64,
    /// RMS of the solver's errors over the trials, m.
    pub empirical_rms_m: f64,
    /// `mean(e²) / (σ²·DOP²)`: 1 when the relation holds.
    pub variance_ratio: f64,
    /// Lower end of the acceptance interval of the ratio.
    pub lo: f64,
    /// Upper end.
    pub hi: f64,
    /// `exact chi-square` (one axis) or `normal, variance bound` (several).
    pub method: &'static str,
    /// The ratio is inside the interval.
    pub pass: bool,
}

/// The check of one geometry.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct GeometryCheck {
    /// The geometry's name.
    pub name: &'static str,
    /// What it stands for.
    pub description: &'static str,
    /// Satellites.
    pub n_sats: usize,
    /// One check per quantity.
    pub checks: Vec<AxisCheck>,
    /// Largest relative difference between the solver's own PDOP and GDOP (from its normal
    /// matrix, on a noise-free solve that converges to the true position within 1e-4 m) and
    /// the kernel's. The two are the same arithmetic on directions that differ by about
    /// 1e-4 m / 22,000 km, so they must agree to 1e-9.
    pub solver_dop_rel_diff: f64,
    /// Most Gauss-Newton iterations any trial took.
    pub max_iterations: usize,
}

/// The whole report.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct McReport {
    /// What was run.
    pub config: McConfig,
    /// False-failure probability of each check.
    pub alpha_per_check: f64,
    /// One entry per geometry.
    pub geometries: Vec<GeometryCheck>,
    /// Every check passed and every trial solved.
    pub all_pass: bool,
}

/// Where the user is: Tallinn harbour, 30 m above the ellipsoid. Any point would do; the
/// directions are set in its local frame.
fn user_ecef() -> [f64; 3] {
    geodetic_to_ecef(Geodetic {
        lat_rad: 59.444_f64.to_radians(),
        lon_rad: 24.765_f64.to_radians(),
        alt_m: 30.0,
    })
}

/// Satellite positions 22,000 km from the user along each direction, in the local frame of
/// [`crate::orbit::enu_basis`] (the frame the DOP kernel splits H and V in).
fn sat_positions(user: [f64; 3], dirs: &[(f64, f64)]) -> Option<Vec<[f64; 3]>> {
    const RHO: f64 = 22_000_000.0;
    let (e, n, u) = enu_basis(user)?;
    Some(
        dirs.iter()
            .map(|&(el, az)| {
                let (el, az) = (el.to_radians(), az.to_radians());
                let (de, dn, du) = (el.pcos() * az.psin(), el.pcos() * az.pcos(), el.psin());
                [
                    user[0] + RHO * (de * e[0] + dn * n[0] + du * u[0]),
                    user[1] + RHO * (de * e[1] + dn * n[1] + du * u[1]),
                    user[2] + RHO * (de * e[2] + dn * n[2] + du * u[2]),
                ]
            })
            .collect(),
    )
}

fn dot(a: [f64; 3], b: [f64; 3]) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

/// Accumulated squared errors of one geometry.
#[derive(Default)]
struct Sums {
    e: f64,
    n: f64,
    u: f64,
    t: f64,
}

/// Run the check on every geometry of [`GEOMETRIES`].
pub fn run(cfg: &McConfig) -> Result<McReport, String> {
    if cfg.trials < 2 || !(cfg.sigma_m.is_finite() && cfg.sigma_m > 0.0) {
        return Err("need at least 2 trials and a finite sigma_m > 0".into());
    }
    if !(cfg.alpha_total > 0.0 && cfg.alpha_total < 1.0) {
        return Err("alpha_total must be in (0, 1)".into());
    }
    const QUANTITIES: usize = 5;
    let alpha = cfg.alpha_total / (GEOMETRIES.len() * QUANTITIES) as f64;
    let n = cfg.trials as f64;
    let chi_lo = chi2_quantile(alpha / 2.0, n) / n;
    let chi_hi = chi2_quantile(1.0 - alpha / 2.0, n) / n;
    let z = normal_quantile(1.0 - alpha / 2.0);
    let bound = z * (2.0 / n).sqrt();
    let user = user_ecef();
    let (east, north, up) = enu_basis(user).ok_or("no local frame at the user")?;
    // A clock offset of 30 km (100 µs) so the clock state is exercised, not left at zero.
    let clock_m = 30_000.0;
    let mut out = Vec::new();
    let mut all_pass = true;
    for (gi, g) in GEOMETRIES.iter().enumerate() {
        let sats = sat_positions(user, g.dirs).ok_or("no local frame at the user")?;
        let d: Dop = dop(user, &sats).ok_or_else(|| format!("{}: singular geometry", g.name))?;
        let mut rng = ChaCha8Rng::seed_from_u64(cfg.seed.wrapping_add(gi as u64));
        let mut sums = Sums::default();
        let mut max_it = 0;
        let ranges: Vec<f64> = sats
            .iter()
            .map(|s| {
                ((s[0] - user[0]).ppowi(2) + (s[1] - user[1]).ppowi(2) + (s[2] - user[2]).ppowi(2))
                    .sqrt()
            })
            .collect();
        let scale: Vec<f64> = g
            .dirs
            .iter()
            .map(|(el, _)| {
                if cfg.elevation_dependent_errors {
                    1.0 / el.to_radians().psin().max(0.05)
                } else {
                    1.0
                }
            })
            .collect();
        let measure = |eps: &[f64]| -> Vec<SppMeasurement> {
            sats.iter()
                .zip(&ranges)
                .zip(eps.iter().zip(&scale))
                .map(|((s, r), (e, k))| SppMeasurement {
                    sat_ecef: *s,
                    pseudorange_m: r + clock_m + cfg.sigma_m * k * e,
                    sat_clock_m: 0.0,
                    iono_m: 0.0,
                    tropo_m: 0.0,
                    weight: 1.0,
                })
                .collect()
        };
        // Start 1 km off in each axis, as a receiver's a-priori would be.
        let apriori = [user[0] + 1000.0, user[1] - 1000.0, user[2] + 1000.0];
        let clean = solve_spp(&measure(&vec![0.0; sats.len()]), apriori)
            .ok_or_else(|| format!("{}: no noise-free fix", g.name))?;
        let solver_diff = ((clean.pdop - d.pdop) / d.pdop)
            .abs()
            .max(((clean.gdop - d.gdop) / d.gdop).abs());
        for _ in 0..cfg.trials {
            let eps: Vec<f64> = (0..sats.len())
                .map(|_| StandardNormal.sample(&mut rng))
                .collect();
            let fix =
                solve_spp(&measure(&eps), apriori).ok_or_else(|| format!("{}: no fix", g.name))?;
            max_it = max_it.max(fix.iterations);
            let dx = [
                fix.ecef[0] - user[0],
                fix.ecef[1] - user[1],
                fix.ecef[2] - user[2],
            ];
            sums.e += dot(dx, east).ppowi(2);
            sums.n += dot(dx, north).ppowi(2);
            sums.u += dot(dx, up).ppowi(2);
            sums.t += (fix.clock_bias_m - clock_m).ppowi(2);
        }
        let s2 = cfg.sigma_m * cfg.sigma_m;
        let mk = |quantity: &'static str, dop: f64, sum: f64, one_axis: bool| {
            let ratio = sum / n / (s2 * dop * dop);
            let (lo, hi, method) = if one_axis {
                (chi_lo, chi_hi, "exact chi-square")
            } else {
                (1.0 - bound, 1.0 + bound, "normal, variance bound")
            };
            AxisCheck {
                quantity,
                dop,
                predicted_rms_m: cfg.sigma_m * dop,
                empirical_rms_m: (sum / n).sqrt(),
                variance_ratio: ratio,
                lo,
                hi,
                method,
                pass: (lo..=hi).contains(&ratio),
            }
        };
        let checks = vec![
            mk("hdop", d.hdop, sums.e + sums.n, false),
            mk("vdop", d.vdop, sums.u, true),
            mk("pdop", d.pdop, sums.e + sums.n + sums.u, false),
            mk("tdop", d.tdop, sums.t, true),
            mk("gdop", d.gdop, sums.e + sums.n + sums.u + sums.t, false),
        ];
        all_pass &= checks.iter().all(|c| c.pass) && solver_diff < 1e-9;
        out.push(GeometryCheck {
            name: g.name,
            description: g.description,
            n_sats: g.dirs.len(),
            checks,
            solver_dop_rel_diff: solver_diff,
            max_iterations: max_it,
        });
    }
    Ok(McReport {
        config: *cfg,
        alpha_per_check: alpha,
        geometries: out,
        all_pass,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_chi_square_interval_is_the_wilson_hilferty_one_at_large_n() {
        // At N = 20,000 Wilson-Hilferty is accurate to well under 1e-4 relative: an
        // independent check that the bisection quantile is sound this far out.
        let n = 20_000.0_f64;
        let p = 2.5e-8;
        let z = normal_quantile(p);
        let wh = n * (1.0 - 2.0 / (9.0 * n) + z * (2.0 / (9.0 * n)).sqrt()).ppowi(3);
        let q = chi2_quantile(p, n);
        assert!(((q - wh) / wh).abs() < 1e-4, "{q} vs {wh}");
    }

    #[test]
    fn a_short_run_is_deterministic_and_rejects_bad_input() {
        let cfg = McConfig {
            trials: 200,
            ..McConfig::default()
        };
        let a = run(&cfg).unwrap();
        let b = run(&cfg).unwrap();
        assert_eq!(a, b);
        assert!(run(&McConfig {
            trials: 1,
            ..McConfig::default()
        })
        .is_err());
        assert!(run(&McConfig {
            sigma_m: 0.0,
            ..McConfig::default()
        })
        .is_err());
    }
}
