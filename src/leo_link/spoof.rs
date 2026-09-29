// SPDX-License-Identifier: AGPL-3.0-only
//! Spoofing consistency monitors for a receiver that tracks LEO (low Earth orbit) and MEO
//! (medium Earth orbit) GNSS (global navigation satellite system) signals: the building blocks
//! of the `leo-pass` kind's `[spoofer]` section, callable on their own.
//!
//! Two monitors, both with a stated false-alarm probability:
//!
//! * **Doppler and pass-geometry consistency.** The receiver predicts each satellite's range
//!   rate from the broadcast orbit and its own prior position (an independent, authenticated
//!   estimate with a stated uncertainty, for example a surveyed site or a dead-reckoned
//!   track) and tests the measured range rates against the prediction with a generalised
//!   least-squares chi-square statistic. The receiver's clock drift is common to every
//!   channel, so it is either removed as a nuisance parameter (one degree of freedom less)
//!   or given a prior. A spoofer that pushes the solution by `δx` shifts satellite `i`'s range
//!   rate by `g_i·δx`, with the gradient
//!
//!   ```text
//!     g_i = ∂ρ̇_i/∂r_user = −(Δv_i − ρ̇_i·u_i)/ρ_i,     u_i = (r_sat − r_user)/ρ_i
//!   ```
//!
//!   whose size is the satellite's transverse relative speed over its range: about
//!   7 km/s over 1000 km for a LEO satellite and 3 km/s over 22 000 km for a MEO one, a
//!   factor of about 40. The same push is therefore about 40 times more visible in LEO
//!   Doppler than in GNSS Doppler.
//! * **Cross-band consistency.** The difference of two bands' pseudoranges to one satellite
//!   (the geometry-free combination) holds only the dispersive ionospheric delay
//!   `40.3·STEC·(1/f₁² − 1/f₂²)` and noise. The monitor removes its ionospheric model from
//!   the combination and tests the epoch-to-epoch step against the code noise of the two
//!   bands and a stated bound on the unmodelled ionospheric rate. A spoofer that counterfeits
//!   one band but not another moves one pseudorange with the push and not the other; a
//!   ground-based spoofer that counterfeits every band but not the ionosphere collapses the
//!   combination to zero at its onset. A spoofer that counterfeits every band and simulates
//!   the ionosphere is not seen by this monitor.
//!
//! The frequency-lock-loop thermal jitter follows Kaplan & Hegarty, *Understanding GPS/GNSS:
//! Principles and Applications*, 2nd ed. (2006), section 5.6.2:
//! `σ_f = (1/(2πT))·√((4F·B_n/(C/N0))·(1 + 1/(T·C/N0)))` Hz, with `F = 1` at high C/N0.
//!
//! **MODELLED.** The monitors are standard constructions; their statistics are exact for the
//! stated Gaussian noise model, but the spoofer is an idealised position push and no
//! detection figure here is compared with a measured attack.

use super::geometry::{range_rate_and_accel, Kinematics, Vec3};
use super::C_M_S;
use crate::raim::{chi2_quantile, noncentral_chi2_cdf, normal_cdf, normal_quantile};

fn sub(a: Vec3, b: Vec3) -> Vec3 {
    [a[0] - b[0], a[1] - b[1], a[2] - b[2]]
}
fn dot(a: Vec3, b: Vec3) -> f64 {
    a[0] * b[0] + a[1] * b[1] + a[2] * b[2]
}

/// Frequency-lock-loop thermal-noise jitter (Hz, 1-sigma) at C/N0 `cn0_dbhz`, loop noise
/// bandwidth `bn_hz` and predetection time `t_s` (Kaplan & Hegarty 2006, section 5.6.2,
/// `F = 1`).
pub fn fll_frequency_jitter_hz(cn0_dbhz: f64, bn_hz: f64, t_s: f64) -> f64 {
    let cn0 = 10f64.powf(cn0_dbhz / 10.0);
    (4.0 * bn_hz / cn0 * (1.0 + 1.0 / (t_s * cn0))).sqrt() / (std::f64::consts::TAU * t_s)
}

/// The range-rate jitter (m/s, 1-sigma) of a carrier at `f_hz` tracked by that loop.
pub fn range_rate_jitter_m_s(f_hz: f64, cn0_dbhz: f64, bn_hz: f64, t_s: f64) -> f64 {
    fll_frequency_jitter_hz(cn0_dbhz, bn_hz, t_s) * C_M_S / f_hz
}

/// Range rate (m/s, positive receding) of a satellite seen by a user, both in one inertial
/// frame.
pub fn range_rate(sat: &Kinematics, user: &Kinematics) -> f64 {
    range_rate_and_accel(sat, user).1
}

/// Unit line of sight from the user toward the satellite.
pub fn line_of_sight(sat: &Kinematics, user: &Kinematics) -> Vec3 {
    let d = sub(sat.r, user.r);
    let rho = dot(d, d).sqrt();
    [d[0] / rho, d[1] / rho, d[2] / rho]
}

/// Gradient of the range rate with respect to the user's position (1/s):
/// `−(Δv − ρ̇·u)/ρ`, with `Δv = v_sat − v_user` and `u` the unit vector toward the satellite.
pub fn range_rate_position_gradient(sat: &Kinematics, user: &Kinematics) -> Vec3 {
    let d = sub(sat.r, user.r);
    let rho = dot(d, d).sqrt();
    let u = [d[0] / rho, d[1] / rho, d[2] / rho];
    let dv = sub(sat.v, user.v);
    let rdot = dot(u, dv);
    [
        -(dv[0] - rdot * u[0]) / rho,
        -(dv[1] - rdot * u[1]) / rho,
        -(dv[2] - rdot * u[2]) / rho,
    ]
}

/// Solve `A·x = b` for a symmetric positive-definite `A` (row-major, `n×n`) by Cholesky;
/// `None` when `A` is not positive definite.
fn spd_solve(a: &[f64], n: usize, b: &[f64]) -> Option<Vec<f64>> {
    let mut l = vec![0.0; n * n];
    for i in 0..n {
        for j in 0..=i {
            let mut s = a[i * n + j];
            for k in 0..j {
                s -= l[i * n + k] * l[j * n + k];
            }
            if i == j {
                if s.is_nan() || s <= 0.0 {
                    return None;
                }
                l[i * n + i] = s.sqrt();
            } else {
                l[i * n + j] = s / l[j * n + j];
            }
        }
    }
    let mut y = vec![0.0; n];
    for i in 0..n {
        let mut s = b[i];
        for k in 0..i {
            s -= l[i * n + k] * y[k];
        }
        y[i] = s / l[i * n + i];
    }
    let mut x = vec![0.0; n];
    for i in (0..n).rev() {
        let mut s = y[i];
        for k in i + 1..n {
            s -= l[k * n + i] * x[k];
        }
        x[i] = s / l[i * n + i];
    }
    Some(x)
}

/// One channel of the Doppler consistency test.
#[derive(Clone, Copy, Debug)]
pub struct DopplerChannel {
    /// Measured minus predicted range rate (m/s): the mean residual, zero when authentic.
    pub residual_m_s: f64,
    /// Measurement noise (m/s, 1-sigma).
    pub sigma_m_s: f64,
    /// Range-rate gradient with respect to the user position (1/s).
    pub gradient: Vec3,
    /// Unit line of sight toward the satellite; the range-rate gradient with respect to the
    /// user velocity is its negative.
    pub los: Vec3,
}

/// What the receiver knows independently of the signals it tests.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Prior {
    /// 1-sigma position uncertainty per axis (m).
    pub position_sigma_m: f64,
    /// 1-sigma velocity uncertainty per axis (m/s).
    pub velocity_sigma_m_s: f64,
    /// 1-sigma clock-drift prior (m/s); `None` removes the drift as a nuisance parameter.
    pub drift_sigma_m_s: Option<f64>,
}

/// The Doppler consistency test at one epoch.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ConsistencyTest {
    /// Channels in the test.
    pub n: usize,
    /// Degrees of freedom of the chi-square statistic.
    pub dof: usize,
    /// Non-centrality: the expected excess of the statistic over its degrees of freedom
    /// that the mean residuals cause (zero when every channel is authentic).
    pub noncentrality: f64,
    /// Detection threshold on the statistic, the chi-square quantile at `1 − p_fa`.
    pub threshold: f64,
    /// Probability that the statistic exceeds the threshold (the false-alarm probability
    /// when the non-centrality is zero).
    pub p_detect: f64,
}

/// Generalised least-squares Doppler consistency test over a window of epochs.
///
/// Model of the stacked mean residuals `r`: `r = J·x + B·c + e`, with `x` the receiver's
/// position and velocity error (six states shared by the window, prior covariance
/// `diag(σ_p²·I, σ_v²·I)`; a zero sigma fixes those states at zero), `c` one clock drift per
/// epoch (flat, or with the prior `σ_d²`) and `e` the channel noise `diag(σ²)`. The position
/// rows of `J` are the range-rate gradients, the velocity rows the negated lines of sight,
/// and `B` maps each channel to its epoch's drift. The statistic is the generalised
/// least-squares residual
///
/// ```text
///   λ = rᵀD⁻¹r − bᵀA⁻¹b,   A = HᵀD⁻¹H + Λ,   b = HᵀD⁻¹r,   H = [J B]
/// ```
///
/// (`Λ` the prior information), which is `rᵀC⁻¹r` with `C = D + J·P·Jᵀ` after projecting out
/// the flat drifts. It is chi-square with `N − K` degrees of freedom (`N` channels, `K`
/// epochs with a flat drift; `N` with a drift prior), non-central with non-centrality `λ`
/// when the residual means are those given. A single epoch is the snapshot test. `None`
/// when there are no degrees of freedom.
pub fn doppler_consistency_window(
    epochs: &[&[DopplerChannel]],
    prior: &Prior,
    p_fa: f64,
) -> Option<ConsistencyTest> {
    let epochs: Vec<&[DopplerChannel]> = epochs.iter().copied().filter(|e| !e.is_empty()).collect();
    let n: usize = epochs.iter().map(|e| e.len()).sum();
    let k = epochs.len();
    let dof = if prior.drift_sigma_m_s.is_some() {
        n
    } else {
        n.checked_sub(k)?
    };
    if dof == 0 {
        return None;
    }
    let use_p = prior.position_sigma_m > 0.0;
    let use_v = prior.velocity_sigma_m_s > 0.0;
    let nx = 3 * (use_p as usize) + 3 * (use_v as usize);
    let m = nx + k;
    let mut a = vec![0.0; m * m];
    let mut bvec = vec![0.0; m];
    let mut rdr = 0.0;
    for (ei, e) in epochs.iter().enumerate() {
        for ch in e.iter() {
            let w = 1.0 / (ch.sigma_m_s * ch.sigma_m_s);
            let mut h = vec![0.0; m];
            let mut col = 0;
            if use_p {
                h[..3].copy_from_slice(&ch.gradient);
                col = 3;
            }
            if use_v {
                h[col] = -ch.los[0];
                h[col + 1] = -ch.los[1];
                h[col + 2] = -ch.los[2];
            }
            h[nx + ei] = 1.0;
            for i in 0..m {
                if h[i] == 0.0 {
                    continue;
                }
                bvec[i] += w * h[i] * ch.residual_m_s;
                for j in 0..m {
                    a[i * m + j] += w * h[i] * h[j];
                }
            }
            rdr += w * ch.residual_m_s * ch.residual_m_s;
        }
    }
    let mut col = 0;
    if use_p {
        let ip = 1.0 / (prior.position_sigma_m * prior.position_sigma_m);
        for i in 0..3 {
            a[i * m + i] += ip;
        }
        col = 3;
    }
    if use_v {
        let iv = 1.0 / (prior.velocity_sigma_m_s * prior.velocity_sigma_m_s);
        for i in col..col + 3 {
            a[i * m + i] += iv;
        }
    }
    if let Some(sd) = prior.drift_sigma_m_s {
        let id = 1.0 / (sd * sd);
        for i in nx..m {
            a[i * m + i] += id;
        }
    }
    let sol = spd_solve(&a, m, &bvec)?;
    let lambda = (rdr - bvec.iter().zip(&sol).map(|(x, y)| x * y).sum::<f64>()).max(0.0);
    let threshold = chi2_quantile(1.0 - p_fa, dof as f64);
    Some(ConsistencyTest {
        n,
        dof,
        noncentrality: lambda,
        threshold,
        p_detect: 1.0 - noncentral_chi2_cdf(threshold, dof as f64, lambda),
    })
}

/// The snapshot (one-epoch) Doppler consistency test: [`doppler_consistency_window`] on one
/// epoch, `rᵀC⁻¹r` with `C = diag(σ²) + σ_p²·G·Gᵀ + σ_v²·U·Uᵀ` after projecting out the
/// clock drift (or with its prior added).
pub fn doppler_consistency(
    ch: &[DopplerChannel],
    prior: &Prior,
    p_fa: f64,
) -> Option<ConsistencyTest> {
    doppler_consistency_window(&[ch], prior, p_fa)
}

/// The cross-band (geometry-free) step test at one epoch for one band pair.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct CrossBandTest {
    /// Step of the model-corrected geometry-free combination since the previous epoch (m):
    /// its mean, zero when both bands are authentic.
    pub step_m: f64,
    /// Standard deviation of the step from code noise (m): `√(2(σ₁² + σ₂²))`.
    pub sigma_m: f64,
    /// Alarm threshold on `|step|` (m): `z·σ + b·Δt`, `z` the two-sided normal quantile of
    /// `p_fa` and `b` the tolerated unmodelled ionospheric rate.
    pub threshold_m: f64,
    /// Probability that `|step|` exceeds the threshold.
    pub p_detect: f64,
}

/// The cross-band step test: mean step `step_m`, code noise `sigma_1_m`, `sigma_2_m` of the
/// two bands (1-sigma, independent between epochs), tolerated unmodelled ionospheric rate
/// `iono_rate_m_s` over the epoch spacing `dt_s`, false-alarm probability `p_fa`.
pub fn cross_band_step(
    step_m: f64,
    sigma_1_m: f64,
    sigma_2_m: f64,
    iono_rate_m_s: f64,
    dt_s: f64,
    p_fa: f64,
) -> CrossBandTest {
    let sigma = (2.0 * (sigma_1_m * sigma_1_m + sigma_2_m * sigma_2_m)).sqrt();
    let z = normal_quantile(1.0 - 0.5 * p_fa);
    let thr = z * sigma + iono_rate_m_s.abs() * dt_s;
    let p = if sigma > 0.0 {
        normal_cdf((step_m - thr) / sigma) + normal_cdf((-step_m - thr) / sigma)
    } else if step_m.abs() > thr {
        1.0
    } else {
        0.0
    };
    CrossBandTest {
        step_m,
        sigma_m: sigma,
        threshold_m: thr,
        p_detect: p.clamp(0.0, 1.0),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn kin(r: Vec3, v: Vec3) -> Kinematics {
        Kinematics { r, v, a: [0.0; 3] }
    }

    #[test]
    fn the_gradient_is_the_derivative_of_the_range_rate() {
        let sat = kin([7.0e6, 1.0e6, 2.0e5], [100.0, 7400.0, 900.0]);
        let user = kin([6.37e6, 0.0, 1.0e5], [0.0, 465.0, 0.0]);
        let g = range_rate_position_gradient(&sat, &user);
        for (k, gk) in g.iter().enumerate() {
            let h = 1.0;
            let mut up = user;
            let mut dn = user;
            up.r[k] += h;
            dn.r[k] -= h;
            let num = (range_rate(&sat, &up) - range_rate(&sat, &dn)) / (2.0 * h);
            assert!((num - gk).abs() < 1e-9, "axis {k}: {num} vs {gk}");
        }
    }

    #[test]
    fn fll_jitter_matches_the_formula_by_hand() {
        // 50 dB-Hz, 2 Hz, 20 ms: 4*2/1e5 = 8e-5, (1 + 1/(0.02e5)) = 1.0005;
        // sqrt(8.004e-5) = 8.9465e-3; / (2 pi 0.02) = 0.071194 Hz.
        let s = fll_frequency_jitter_hz(50.0, 2.0, 0.02);
        assert!((s - 0.071_194).abs() < 1e-5, "{s}");
    }

    #[test]
    fn a_common_mode_residual_is_a_clock_drift_and_is_not_detected() {
        let ch: Vec<DopplerChannel> = (0..5)
            .map(|i| DopplerChannel {
                residual_m_s: 0.3,
                sigma_m_s: 0.05 + 0.01 * i as f64,
                gradient: [1e-3 * i as f64, -2e-3, 5e-4],
                los: [0.6, 0.0, 0.8],
            })
            .collect();
        let prior = Prior {
            position_sigma_m: 10.0,
            velocity_sigma_m_s: 0.1,
            drift_sigma_m_s: None,
        };
        let t = doppler_consistency(&ch, &prior, 1e-5).unwrap();
        assert_eq!(t.dof, 4);
        assert!(t.noncentrality < 1e-12, "{}", t.noncentrality);
        assert!((t.p_detect - 1e-5).abs() < 1e-6, "{}", t.p_detect);
    }

    #[test]
    fn with_no_prior_and_equal_noise_the_statistic_is_the_scatter_about_the_mean() {
        let r = [0.1, -0.2, 0.05, 0.3];
        let s = 0.1;
        let ch: Vec<DopplerChannel> = r
            .iter()
            .map(|&x| DopplerChannel {
                residual_m_s: x,
                sigma_m_s: s,
                gradient: [0.0; 3],
                los: [1.0, 0.0, 0.0],
            })
            .collect();
        let mut prior = Prior {
            position_sigma_m: 0.0,
            velocity_sigma_m_s: 0.0,
            drift_sigma_m_s: None,
        };
        let t = doppler_consistency(&ch, &prior, 1e-3).unwrap();
        let mean = r.iter().sum::<f64>() / 4.0;
        let want: f64 = r.iter().map(|x| (x - mean).powi(2)).sum::<f64>() / (s * s);
        assert!(
            (t.noncentrality - want).abs() < 1e-9,
            "{} vs {want}",
            t.noncentrality
        );
        // A drift prior of zero turns the test into r' C^-1 r on n degrees of freedom.
        prior.drift_sigma_m_s = Some(1e-9);
        let t2 = doppler_consistency(&ch, &prior, 1e-3).unwrap();
        let want2: f64 = r.iter().map(|x| x * x).sum::<f64>() / (s * s);
        assert_eq!(t2.dof, 4);
        assert!((t2.noncentrality - want2).abs() < 1e-6 * want2);
    }

    #[test]
    fn a_push_the_prior_explains_is_not_detected() {
        // Residuals exactly G.dx with dx small against the prior: lambda = |dx|^2/sigma_p^2
        // at most (no noise), so a push of a tenth of the prior sigma is invisible.
        let grads = [
            [7e-3, 0.0, 0.0],
            [0.0, 7e-3, 0.0],
            [0.0, 0.0, 7e-3],
            [-5e-3, 5e-3, 0.0],
        ];
        let dx = [1.0, 0.0, 0.0];
        let ch: Vec<DopplerChannel> = grads
            .iter()
            .map(|g| DopplerChannel {
                residual_m_s: dot(*g, dx),
                sigma_m_s: 1e-4,
                gradient: *g,
                los: [0.0, 0.0, 1.0],
            })
            .collect();
        let prior = Prior {
            position_sigma_m: 10.0,
            velocity_sigma_m_s: 0.0,
            drift_sigma_m_s: Some(1e-9),
        };
        let t = doppler_consistency(&ch, &prior, 1e-5).unwrap();
        assert!(t.noncentrality <= 0.01 + 1e-9, "{}", t.noncentrality);
        assert!(t.p_detect < 1e-4);
    }

    #[test]
    fn a_velocity_push_is_hidden_by_a_loose_velocity_prior_only() {
        // Residuals -u.dv from a 1 m/s velocity error: seen with a tight velocity prior,
        // absorbed with a loose one.
        let los = [
            [1.0, 0.0, 0.0],
            [0.0, 1.0, 0.0],
            [0.0, 0.0, 1.0],
            [0.6, 0.8, 0.0],
        ];
        let dv = [1.0, 0.0, 0.0];
        let ch: Vec<DopplerChannel> = los
            .iter()
            .map(|u| DopplerChannel {
                residual_m_s: -dot(*u, dv),
                sigma_m_s: 0.01,
                gradient: [0.0; 3],
                los: *u,
            })
            .collect();
        let mut prior = Prior {
            position_sigma_m: 0.0,
            velocity_sigma_m_s: 0.01,
            drift_sigma_m_s: None,
        };
        assert!(doppler_consistency(&ch, &prior, 1e-5).unwrap().p_detect > 0.999);
        prior.velocity_sigma_m_s = 100.0;
        assert!(doppler_consistency(&ch, &prior, 1e-5).unwrap().p_detect < 1e-4);
    }

    #[test]
    fn the_information_form_equals_the_covariance_form() {
        // One epoch, drift prior: lambda = r' (D + sp^2 G G' + sv^2 U U' + sd^2 1 1')^-1 r,
        // computed here by a direct dense solve.
        let ch: Vec<DopplerChannel> = (0..5)
            .map(|i| {
                let x = i as f64;
                let u = [0.3 * x.cos(), 0.4 * x.sin(), 0.8];
                let nu = (u[0] * u[0] + u[1] * u[1] + u[2] * u[2]).sqrt();
                DopplerChannel {
                    residual_m_s: 0.02 * (x - 1.7),
                    sigma_m_s: 0.01 + 0.002 * x,
                    gradient: [1e-3 * (x - 2.0), 2e-3 * x.sin(), -1e-3],
                    los: [u[0] / nu, u[1] / nu, u[2] / nu],
                }
            })
            .collect();
        let prior = Prior {
            position_sigma_m: 5.0,
            velocity_sigma_m_s: 0.2,
            drift_sigma_m_s: Some(0.05),
        };
        let t = doppler_consistency(&ch, &prior, 1e-3).unwrap();
        let n = ch.len();
        let mut c = vec![0.0; n * n];
        for i in 0..n {
            for j in 0..n {
                c[i * n + j] = 25.0 * dot(ch[i].gradient, ch[j].gradient)
                    + 0.04 * dot(ch[i].los, ch[j].los)
                    + 0.0025
                    + if i == j { ch[i].sigma_m_s.powi(2) } else { 0.0 };
            }
        }
        let r: Vec<f64> = ch.iter().map(|x| x.residual_m_s).collect();
        let cr = spd_solve(&c, n, &r).unwrap();
        let want: f64 = r.iter().zip(&cr).map(|(a, b)| a * b).sum();
        assert!(
            (t.noncentrality - want).abs() < 1e-9 * want.max(1.0),
            "{} vs {want}",
            t.noncentrality
        );
        // Two identical epochs of a static position error: the window sees more than the
        // snapshot.
        let jump: Vec<DopplerChannel> = ch
            .iter()
            .map(|x| DopplerChannel {
                residual_m_s: dot(x.gradient, [20.0, 0.0, 0.0]),
                ..*x
            })
            .collect();
        let one = doppler_consistency(&jump, &prior, 1e-3).unwrap();
        let two = doppler_consistency_window(&[&jump, &jump], &prior, 1e-3).unwrap();
        assert!(two.noncentrality > one.noncentrality);
        assert_eq!(two.dof, 2 * one.dof);
    }

    #[test]
    fn the_cross_band_threshold_and_power() {
        // p_fa 1e-3: z = 3.2905; sigma = sqrt(2 (0.3^2 + 0.4^2)) = 0.7071; b dt = 0.05.
        let t = cross_band_step(0.0, 0.3, 0.4, 0.01, 5.0, 1e-3);
        let sig = 0.5_f64.sqrt();
        assert!((t.sigma_m - sig).abs() < 1e-12);
        assert!((t.threshold_m - (3.290_527 * sig + 0.05)).abs() < 1e-5);
        // With no step the probability is the false-alarm probability less the rate margin.
        assert!(t.p_detect < 1e-3);
        let big = cross_band_step(10.0, 0.3, 0.4, 0.01, 5.0, 1e-3);
        assert!(big.p_detect > 0.999_999);
    }
}
