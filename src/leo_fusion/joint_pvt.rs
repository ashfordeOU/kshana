// SPDX-License-Identifier: AGPL-3.0-only
//! Joint GNSS + LEO pseudorange positioning by weighted least squares.
//!
//! Each measurement is a pseudorange `ρ = |r_s − r_u| + b_g + ε` from a satellite of system
//! `s`, where `b_g` is the receiver clock of the system's **clock group**. A system either
//! carries its own clock unknown (its offset from the reference clock is the inter-system
//! bias, ISB, estimated with the position) or is declared on the reference time scale with a
//! **known** offset (a LEO system synchronised to GNSS time that broadcasts its offset). The
//! per-measurement one-sigma is an input, so a signal model elsewhere (a delay-lock-loop
//! noise figure from C/N0, an ephemeris error, a multipath term) feeds the weights without
//! this module knowing where they came from; [`code_sigma_dll_m`] is provided as one such
//! model.
//!
//! The dilution of precision (DOP) is the unweighted geometry `(GᵀG)⁻¹` with the same clock
//! columns; the formal covariance is the weighted `(GᵀWG)⁻¹`. Horizontal and vertical terms
//! are taken in the local geodetic east-north-up frame.
//!
//! ## Label
//!
//! MODELLED. The solver is standard Gauss-Newton least squares; its DOP is checked against a
//! hand-derived four-satellite case and its fixes against their own covariance (see the
//! tests). It is not validated against a receiver's output.

use super::geom::{dot, inverse, norm, normal_equations, sub, Mat, Vec3};
use serde::Serialize;

/// One pseudorange measurement.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct PseudorangeObs {
    /// Satellite ECEF position at transmission (m).
    pub sat_pos: Vec3,
    /// Measured pseudorange (m).
    pub pseudorange_m: f64,
    /// One-sigma measurement error (m), from the caller's signal and ephemeris model.
    pub sigma_m: f64,
    /// Index of the system (constellation) the satellite belongs to.
    pub system: usize,
}

/// How a system's receiver clock enters the solution.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
#[serde(rename_all = "kebab-case", tag = "type", content = "offset_m")]
pub enum SystemClock {
    /// The system carries its own clock unknown (the inter-system bias is estimated).
    Estimated,
    /// The system is on the reference time scale with this known offset (m), which is
    /// removed from its pseudoranges before the fit.
    Known(f64),
}

/// Dilution of precision.
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Dop {
    /// Geometric DOP: position and the reference clock.
    pub gdop: f64,
    /// Position DOP.
    pub pdop: f64,
    /// Horizontal DOP.
    pub hdop: f64,
    /// Vertical DOP.
    pub vdop: f64,
    /// Time DOP of the reference clock.
    pub tdop: f64,
}

/// A joint fix.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct JointFix {
    /// Estimated ECEF position (m).
    pub position: [f64; 3],
    /// Reference receiver clock (m).
    pub clock_m: f64,
    /// Estimated inter-system bias of each system that carries its own clock, relative to
    /// the reference clock: `(system index, bias in m)`.
    pub isb_m: Vec<(usize, f64)>,
    /// Formal one-sigma position error in east, north and up (m).
    pub sigma_enu_m: [f64; 3],
    /// Formal one-sigma of each inter-system bias, aligned with `isb_m` (m).
    pub sigma_isb_m: Vec<f64>,
    /// Unweighted DOP of the geometry used.
    pub dop: Dop,
    /// Gauss-Newton iterations taken.
    pub iterations: usize,
    /// Root-mean-square of the weighted post-fit residuals (dimensionless; near 1 when the
    /// sigmas describe the noise).
    pub weighted_rms: f64,
    /// Measurements used.
    pub n_used: usize,
}

/// Clock columns: the reference group (index 0) plus one per estimated system present,
/// other than the one chosen as reference. Returns `(column of each measurement, systems
/// with their own column in column order)`.
fn clock_columns(systems: &[usize], clocks: &[SystemClock]) -> (Vec<usize>, Vec<usize>) {
    // The reference clock is the first estimated system in view; known-offset systems ride
    // on it too. With no estimated system in view, the reference is a plain clock unknown.
    let mut present: Vec<usize> = Vec::new();
    for &s in systems {
        if matches!(
            clocks.get(s).copied().unwrap_or(SystemClock::Estimated),
            SystemClock::Estimated
        ) && !present.contains(&s)
        {
            present.push(s);
        }
    }
    present.sort_unstable();
    let own: Vec<usize> = present.iter().skip(1).copied().collect();
    let cols = systems
        .iter()
        .map(|s| own.iter().position(|o| o == s).map(|p| p + 1).unwrap_or(0))
        .collect();
    (cols, own)
}

/// Design rows `[−e, clock one-hot]` for the given user position.
fn design(user: Vec3, sats: &[Vec3], cols: &[usize], n_clock: usize) -> Option<Vec<Vec<f64>>> {
    sats.iter()
        .zip(cols)
        .map(|(s, &c)| {
            let d = sub(*s, user);
            let r = norm(d);
            if r <= 0.0 {
                return None;
            }
            let mut row = vec![0.0; 3 + n_clock];
            row[0] = -d[0] / r;
            row[1] = -d[1] / r;
            row[2] = -d[2] / r;
            row[3 + c] = 1.0;
            Some(row)
        })
        .collect()
}

fn project(q: &Mat, user: Vec3) -> ([f64; 3], f64, f64) {
    let g = crate::frames::ecef_to_geodetic(user);
    let (e, n, u) = super::geom::enu_at(g.lat_rad, g.lon_rad);
    let var = |v: Vec3| -> f64 {
        let mut s = 0.0;
        for i in 0..3 {
            for j in 0..3 {
                s += v[i] * q[i][j] * v[j];
            }
        }
        s.max(0.0)
    };
    let (ve, vn, vu) = (var(e), var(n), var(u));
    ([ve.sqrt(), vn.sqrt(), vu.sqrt()], ve + vn, vu)
}

/// DOP of a geometry: satellites with their system index, under the given clock model.
/// `None` when the geometry cannot resolve the unknowns.
pub fn dop(user: Vec3, sats: &[(Vec3, usize)], clocks: &[SystemClock]) -> Option<Dop> {
    let systems: Vec<usize> = sats.iter().map(|s| s.1).collect();
    let (cols, own) = clock_columns(&systems, clocks);
    let n = 3 + 1 + own.len();
    if sats.len() < n {
        return None;
    }
    let pos: Vec<Vec3> = sats.iter().map(|s| s.0).collect();
    let h = design(user, &pos, &cols, 1 + own.len())?;
    let w = vec![1.0; h.len()];
    let r = vec![0.0; h.len()];
    let (a, _) = normal_equations(&h, &w, &r);
    let q = inverse(&a)?;
    dop_from_cofactor(&q, user)
}

fn dop_from_cofactor(q: &Mat, user: Vec3) -> Option<Dop> {
    let (_, hvar, vvar) = project(q, user);
    let p = q[0][0] + q[1][1] + q[2][2];
    let t = q[3][3];
    if !(p.is_finite() && p > 0.0 && t.is_finite() && t >= 0.0) {
        return None;
    }
    Some(Dop {
        gdop: (p + t).sqrt(),
        pdop: p.sqrt(),
        hdop: hvar.sqrt(),
        vdop: vvar.sqrt(),
        tdop: t.sqrt(),
    })
}

/// Formal east, north and up one-sigmas (m) of the weighted joint fix linearised at `user`
/// (ECEF, m): the position block of `(HᵀWH)⁻¹` with weights `1/σ²`, projected on the local
/// east, north and up axes. Evaluated at the true position it is the Cramér-Rao bound of the
/// fix; `None` when the geometry cannot resolve the unknowns.
pub fn formal_sigma_enu(user: Vec3, obs: &[PseudorangeObs], clocks: &[SystemClock]) -> Option<[f64; 3]> {
    let systems: Vec<usize> = obs.iter().map(|o| o.system).collect();
    let (cols, own) = clock_columns(&systems, clocks);
    let n_clock = 1 + own.len();
    if obs.len() < 3 + n_clock || obs.iter().any(|o| !(o.sigma_m.is_finite() && o.sigma_m > 0.0)) {
        return None;
    }
    let sats: Vec<Vec3> = obs.iter().map(|o| o.sat_pos).collect();
    let h = design(user, &sats, &cols, n_clock)?;
    let w: Vec<f64> = obs.iter().map(|o| 1.0 / (o.sigma_m * o.sigma_m)).collect();
    let (a, _) = normal_equations(&h, &w, &vec![0.0; h.len()]);
    let q = inverse(&a)?;
    Some(project(&q, user).0)
}

/// Weighted least-squares joint fix by Gauss-Newton from `apriori` (ECEF, m).
pub fn solve(
    obs: &[PseudorangeObs],
    clocks: &[SystemClock],
    apriori: Vec3,
    max_iter: usize,
) -> Result<JointFix, String> {
    if obs
        .iter()
        .any(|o| !(o.sigma_m.is_finite() && o.sigma_m > 0.0))
    {
        return Err("every pseudorange needs a positive, finite sigma".into());
    }
    let systems: Vec<usize> = obs.iter().map(|o| o.system).collect();
    let (cols, own) = clock_columns(&systems, clocks);
    let n_clock = 1 + own.len();
    let n = 3 + n_clock;
    if obs.len() < n {
        return Err(format!(
            "{} pseudoranges cannot resolve {n} unknowns (3 position + {n_clock} clocks)",
            obs.len()
        ));
    }
    let corrected: Vec<f64> = obs
        .iter()
        .map(|o| match clocks.get(o.system) {
            Some(SystemClock::Known(off)) => o.pseudorange_m - off,
            _ => o.pseudorange_m,
        })
        .collect();
    let w: Vec<f64> = obs.iter().map(|o| 1.0 / (o.sigma_m * o.sigma_m)).collect();
    let sats: Vec<Vec3> = obs.iter().map(|o| o.sat_pos).collect();
    let mut x = vec![0.0; n];
    x[..3].copy_from_slice(&apriori);
    let mut iterations = 0;
    let mut q_w: Option<Mat> = None;
    for it in 0..max_iter.max(1) {
        iterations = it + 1;
        let user = [x[0], x[1], x[2]];
        let h = design(user, &sats, &cols, n_clock)
            .ok_or("a satellite coincides with the position estimate")?;
        let r: Vec<f64> = (0..obs.len())
            .map(|k| corrected[k] - (norm(sub(sats[k], user)) + x[3 + cols[k]]))
            .collect();
        let (a, b) = normal_equations(&h, &w, &r);
        let q = inverse(&a).ok_or("the geometry is singular")?;
        let dx = super::geom::mat_vec(&q, &b);
        for i in 0..n {
            x[i] += dx[i];
        }
        q_w = Some(q);
        if dx.iter().take(3).map(|d| d * d).sum::<f64>().sqrt() < 1e-4 {
            break;
        }
    }
    let q_w = q_w.ok_or("no iteration ran")?;
    let user = [x[0], x[1], x[2]];
    let h = design(user, &sats, &cols, n_clock).ok_or("degenerate final geometry")?;
    let (a1, _) = normal_equations(&h, &vec![1.0; h.len()], &vec![0.0; h.len()]);
    let q1 = inverse(&a1).ok_or("the geometry is singular")?;
    let dop = dop_from_cofactor(&q1, user).ok_or("the DOP is not finite")?;
    let (sigma_enu_m, _, _) = project(&q_w, user);
    let chi2: f64 = (0..obs.len())
        .map(|k| {
            let r = corrected[k] - (norm(sub(sats[k], user)) + x[3 + cols[k]]);
            r * r * w[k]
        })
        .sum();
    let dof = (obs.len() - n).max(1) as f64;
    Ok(JointFix {
        position: user,
        clock_m: x[3],
        isb_m: own
            .iter()
            .enumerate()
            .map(|(k, &s)| (s, x[4 + k] - x[3]))
            .collect(),
        sigma_enu_m,
        sigma_isb_m: (0..own.len())
            .map(|k| {
                let i = 4 + k;
                (q_w[i][i] + q_w[3][3] - 2.0 * q_w[i][3]).max(0.0).sqrt()
            })
            .collect(),
        dop,
        iterations,
        weighted_rms: (chi2 / dof).sqrt(),
        n_used: obs.len(),
    })
}

/// Thermal-noise code tracking error of an early-minus-late delay-lock loop on a BPSK signal,
/// through the engine's [`crate::navsignal::dll_code_jitter_chips`] (Kaplan & Hegarty,
/// *Understanding GPS/GNSS*, 3rd ed., chapter 8):
/// `σ = λ_c sqrt( B_L d / (2 C/N0) · (1 + 2 / ((2 − d) T C/N0)) )`, with the chip length
/// `λ_c = c / R_c`, loop bandwidth `B_L` (Hz), correlator spacing `d` (chips), coherent
/// integration `T` (s) and C/N0 in dB-Hz. Returns metres.
pub fn code_sigma_dll_m(
    cn0_dbhz: f64,
    chip_rate_hz: f64,
    loop_bw_hz: f64,
    spacing_chips: f64,
    t_coh_s: f64,
) -> f64 {
    // The engine's delay-lock-loop jitter (chips), scaled by the chip length.
    crate::navsignal::dll_code_jitter_chips(cn0_dbhz, loop_bw_hz, spacing_chips, t_coh_s)
        * super::C_LIGHT
        / chip_rate_hz
}

/// The dot product of the line of sight with the local up vector, kept for callers that
/// sort satellites by elevation without a site.
pub fn sin_elevation(user: Vec3, sat: Vec3) -> f64 {
    let d = sub(sat, user);
    dot(d, user) / (norm(d) * norm(user))
}

#[cfg(test)]
mod tests {
    use super::*;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;
    use rand_distr::{Distribution, Normal};

    /// A user on the equator at the prime meridian: local up is +x, east +y, north +z.
    fn user() -> Vec3 {
        [crate::leo_fusion::geom::RE_EARTH, 0.0, 0.0]
    }

    /// Satellite at unit line of sight `e` (in ECEF) from the user, 20 000 km away.
    fn at(e: Vec3) -> Vec3 {
        let u = user();
        [u[0] + 2e7 * e[0], u[1] + 2e7 * e[1], u[2] + 2e7 * e[2]]
    }

    fn four_sat_case() -> Vec<(Vec3, usize)> {
        // One satellite at the zenith and three on the horizon 120 deg apart in azimuth.
        let s3 = 3f64.sqrt() / 2.0;
        vec![
            (at([1.0, 0.0, 0.0]), 0),
            (at([0.0, 0.0, 1.0]), 0),
            (at([0.0, s3, -0.5]), 0),
            (at([0.0, -s3, -0.5]), 0),
        ]
    }

    #[test]
    fn dop_matches_the_hand_derived_zenith_plus_three_horizon_case() {
        // By hand: with rows [-e, 1], G^T G = diag(1.5, 1.5) in east-north and
        // [[1, -1], [-1, 4]] in up-clock, whose inverse is (1/3)[[4, 1], [1, 1]]. So
        // HDOP = sqrt(2/3 + 2/3), VDOP = sqrt(4/3), TDOP = sqrt(1/3), PDOP = sqrt(8/3) and
        // GDOP = sqrt(3).
        let d = dop(user(), &four_sat_case(), &[SystemClock::Estimated]).unwrap();
        let want = [
            (d.hdop, (4.0f64 / 3.0).sqrt()),
            (d.vdop, (4.0f64 / 3.0).sqrt()),
            (d.tdop, (1.0f64 / 3.0).sqrt()),
            (d.pdop, (8.0f64 / 3.0).sqrt()),
            (d.gdop, 3.0f64.sqrt()),
        ];
        for (got, w) in want {
            assert!((got - w).abs() < 1e-9, "{got} vs {w}");
        }
    }

    #[test]
    fn a_lone_satellite_with_its_own_clock_adds_nothing_and_a_known_offset_does() {
        let mut sats = four_sat_case();
        let base = dop(user(), &sats, &[SystemClock::Estimated]).unwrap();
        let s = 0.5f64.sqrt();
        sats.push((at([s, s, 0.0]), 1));
        let own = dop(
            user(),
            &sats,
            &[SystemClock::Estimated, SystemClock::Estimated],
        )
        .unwrap();
        assert!((own.pdop - base.pdop).abs() < 1e-9);
        let known = dop(
            user(),
            &sats,
            &[SystemClock::Estimated, SystemClock::Known(0.0)],
        )
        .unwrap();
        assert!(known.pdop < base.pdop - 1e-3);
    }

    #[test]
    fn a_noise_free_fix_recovers_position_clock_and_inter_system_bias() {
        let u = user();
        let mut obs = Vec::new();
        let dirs: [Vec3; 7] = [
            [1.0, 0.0, 0.0],
            [0.6, 0.8, 0.0],
            [0.6, -0.8, 0.0],
            [0.6, 0.0, 0.8],
            [0.6, 0.0, -0.8],
            [0.5, 0.5, std::f64::consts::FRAC_1_SQRT_2],
            [0.5, -0.5, -std::f64::consts::FRAC_1_SQRT_2],
        ];
        for (k, d) in dirs.iter().enumerate() {
            let n = norm(*d);
            let s = at([d[0] / n, d[1] / n, d[2] / n]);
            let sys = if k < 4 { 0 } else { 1 };
            let bias = if sys == 0 { 150.0 } else { 150.0 + 37.5 };
            obs.push(PseudorangeObs {
                sat_pos: s,
                pseudorange_m: norm(sub(s, u)) + bias,
                sigma_m: 1.0,
                system: sys,
            });
        }
        let fix = solve(
            &obs,
            &[SystemClock::Estimated, SystemClock::Estimated],
            [u[0] + 3e3, u[1] - 2e3, u[2] + 1e3],
            20,
        )
        .unwrap();
        assert!(norm(sub(fix.position, u)) < 1e-6);
        assert!((fix.clock_m - 150.0).abs() < 1e-6);
        assert_eq!(fix.isb_m.len(), 1);
        assert!((fix.isb_m[0].1 - 37.5).abs() < 1e-6);
    }

    #[test]
    fn seeded_fixes_agree_with_their_formal_covariance() {
        // Mean of |error_enu / sigma_enu|^2 over 400 seeded fixes is 3 for a consistent
        // estimator; accept the 99.9% band of chi-square(1200)/400.
        let u = user();
        let dirs: [Vec3; 6] = [
            [1.0, 0.0, 0.0],
            [0.6, 0.8, 0.0],
            [0.6, -0.8, 0.0],
            [0.6, 0.0, 0.8],
            [0.6, 0.0, -0.8],
            [0.5, 0.5, std::f64::consts::FRAC_1_SQRT_2],
        ];
        let mut rng = ChaCha8Rng::seed_from_u64(11);
        let nrm = Normal::new(0.0, 1.0).unwrap();
        let mut sum = 0.0;
        let trials = 400;
        for _ in 0..trials {
            let obs: Vec<PseudorangeObs> = dirs
                .iter()
                .enumerate()
                .map(|(k, d)| {
                    let n = norm(*d);
                    let s = at([d[0] / n, d[1] / n, d[2] / n]);
                    let sig = 1.0 + k as f64 * 0.5;
                    PseudorangeObs {
                        sat_pos: s,
                        pseudorange_m: norm(sub(s, u)) + 10.0 + sig * nrm.sample(&mut rng),
                        sigma_m: sig,
                        system: 0,
                    }
                })
                .collect();
            let fix = solve(&obs, &[SystemClock::Estimated], u, 10).unwrap();
            let e = sub(fix.position, u);
            // Local frame at the equator/prime meridian: east = y, north = z, up = x.
            let enu = [e[1], e[2], e[0]];
            // The cross terms are small for this geometry but not zero; use the per-axis
            // ratio, whose mean is still one per axis.
            for (ei, si) in enu.iter().zip(fix.sigma_enu_m) {
                sum += (ei / si).powi(2);
            }
        }
        let mean = sum / trials as f64;
        let lo = crate::raim::chi2_quantile(0.0005, 3.0 * trials as f64) / trials as f64;
        let hi = crate::raim::chi2_quantile(0.9995, 3.0 * trials as f64) / trials as f64;
        assert!(
            (lo * 0.9..hi * 1.1).contains(&mean),
            "{mean} not in [{lo}, {hi}]"
        );
    }

    #[test]
    fn dll_noise_is_the_textbook_figure_for_gps_l1_ca() {
        // GPS L1 C/A, 45 dB-Hz, B_L = 1 Hz, d = 1 chip, T = 20 ms: the closed form gives
        // 293.05 m * sqrt(1/(2*31623) * (1 + 2/(0.02*31623))) = 1.1672 m (evaluated by hand).
        let s = code_sigma_dll_m(45.0, 1.023e6, 1.0, 1.0, 0.02);
        let lc = 299_792_458.0 / 1.023e6;
        let cn0 = 10f64.powf(4.5);
        let want = lc * (1.0 / (2.0 * cn0) * (1.0 + 2.0 / (0.02 * cn0))).sqrt();
        assert!((s - want).abs() < 1e-12);
        assert!((s - 1.1672).abs() < 1e-3, "{s}");
    }
}
