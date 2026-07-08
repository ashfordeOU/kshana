// SPDX-License-Identifier: AGPL-3.0-only
//! Real-time lunar frame/ephemeris **prediction error** — derived endogenously.
//!
//! A lunar navigation service that publishes positions *in real time* cannot use a
//! post-processed (converged, batch-smoothed) orbit + frame solution: the definitive
//! product lags the epoch of use by a prediction latency (the reference-frame /
//! ephemeris product is only finalised after the fact — see [`crate::eop`] for the
//! terrestrial analogue, IERS Bulletin A *predicted* vs Bulletin B *final*). Over that
//! latency the orbit-determination (OD) state uncertainty grows, because the along-track
//! position error inherits the velocity (semi-major-axis) uncertainty times the elapsed
//! prediction time. This module composes an OD state covariance, propagates it forward
//! through the real-time latency with the linear state-transition
//! `Φ = [[1, Δt], [0, 1]]`, and reports the predicted vs post-processed position 1σ, each
//! mapped through the exact `Δt = Δr / c` light-time relation to a timing error.
//!
//! This is the endogenous replacement for P3's imported "~50 ns real-time frame"
//! constant: instead of asserting 15 m, the 15 m falls out of propagating a
//! representative OD covariance through a representative latency.
//!
//! ## Validated vs Modelled
//!
//! * **Validated (exact closed form):** the range→time mapping `t = Δr / c` (with the
//!   CODATA speed of light [`crate::holdover::C_LIGHT_M_PER_S`]). The oracle values
//!   15 m → 50.035 ns and 0.27 m → 0.901 ns are reproduced to < 0.01 ns
//!   (see `mapping_matches_light_time_oracle`). The covariance propagation
//!   `P' = Φ P Φᵀ` is exact linear algebra for the given linear transition.
//! * **Modelled / representative:** the *magnitudes* of the input covariance — the
//!   ~0.27 m post-processed position 1σ, the ~4.17 mm/s velocity 1σ and the ~3600 s
//!   real-time latency that together yield ~15 m predicted — are representative of a
//!   lunar-relay OD, not tied here to a specific real covariance file. A caller that
//!   holds a validated OD covariance (e.g. from [`crate::lunar_od`] /
//!   [`crate::batch_ls`]) can pass it to [`predict_frame_error`] and then the predicted
//!   magnitude is as validated as that input; the [`OdCovariance::representative`]
//!   constructor is explicitly the Modelled stand-in.
//!
//! Deterministic: no wall-clock, no RNG.

use crate::holdover::C_LIGHT_M_PER_S;

/// A per-axis orbit-determination state covariance, reduced to the dominant
/// (position, velocity) pair whose along-track growth drives real-time prediction error.
///
/// The full 6×6 OD covariance's along-track block is well approximated by this 2×2:
/// position variance `σ_r²`, velocity variance `σ_v²` and their correlation `ρ`. This is
/// the object P4 reuses — construct one, propagate it with [`predict_frame_error`], and
/// read the propagated 2×2 back out of [`FramePredictError::propagated_cov`].
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct OdCovariance {
    /// Post-processed (converged) position 1σ (m) — the along-track position uncertainty
    /// of the definitive, batch-smoothed solution.
    pub pos_sigma_m: f64,
    /// Velocity 1σ (m/s) — the semi-major-axis / along-track rate uncertainty that makes
    /// the predicted position error grow with latency.
    pub vel_sigma_mps: f64,
    /// Position–velocity correlation coefficient (dimensionless, clamped to [-1, 1]).
    pub pos_vel_corr: f64,
}

impl OdCovariance {
    /// Build an OD covariance from explicit 1σ values and a correlation.
    ///
    /// `pos_sigma_m` and `vel_sigma_mps` are clamped to be non-negative; `pos_vel_corr`
    /// is clamped to `[-1, 1]`.
    pub fn new(pos_sigma_m: f64, vel_sigma_mps: f64, pos_vel_corr: f64) -> Self {
        Self {
            pos_sigma_m: pos_sigma_m.max(0.0),
            vel_sigma_mps: vel_sigma_mps.max(0.0),
            pos_vel_corr: pos_vel_corr.clamp(-1.0, 1.0),
        }
    }

    /// The **representative / Modelled** lunar-relay OD covariance: a 0.27 m
    /// post-processed position 1σ and a 4.166 mm/s velocity 1σ, uncorrelated. Propagated
    /// through the representative [`REALTIME_LATENCY_S`] (1 h) this yields ~15 m predicted
    /// position 1σ — the endogenous origin of P3's "~50 ns real-time frame".
    ///
    /// The numbers are representative of a lunar navigation-relay OD, not read from a
    /// specific covariance file; hence Modelled. The velocity 1σ is chosen so that
    /// `σ_v · Δt = √(15² − 0.27²) m`, placing the propagated position 1σ on 15 m.
    pub fn representative() -> Self {
        Self::new(POSTPROC_POS_SIGMA_M, REPRESENTATIVE_VEL_SIGMA_MPS, 0.0)
    }

    /// Seed a covariance from a realised-frame post-fit residual (m) — see
    /// [`crate::lunar_frame_realise::RealisedFrame::rms_residual_m`] — as the
    /// post-processed position 1σ, combined with a caller-supplied velocity 1σ and
    /// correlation. This ties the post-processed magnitude to an actual frame realisation
    /// rather than a bare constant.
    pub fn from_frame_residual(rms_residual_m: f64, vel_sigma_mps: f64, pos_vel_corr: f64) -> Self {
        Self::new(rms_residual_m, vel_sigma_mps, pos_vel_corr)
    }

    /// The post-processed position variance `σ_r²` (m²).
    fn p_rr(&self) -> f64 {
        self.pos_sigma_m * self.pos_sigma_m
    }
    /// The position–velocity covariance `ρ σ_r σ_v` (m²/s).
    fn p_rv(&self) -> f64 {
        self.pos_vel_corr * self.pos_sigma_m * self.vel_sigma_mps
    }
    /// The velocity variance `σ_v²` (m²/s²).
    fn p_vv(&self) -> f64 {
        self.vel_sigma_mps * self.vel_sigma_mps
    }
}

/// A propagated 2×2 (position, velocity) covariance, in SI (m², m²/s, m²/s²).
///
/// This is the exact image of an [`OdCovariance`] under `P' = Φ P Φᵀ` with
/// `Φ = [[1, Δt], [0, 1]]`. P4 can reuse the full propagated block (not just the position
/// scalar) — e.g. to chain a further prediction step or to form a combined budget.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct PropagatedCovariance {
    /// Propagated position variance `P'₀₀` (m²).
    pub p_rr: f64,
    /// Propagated position–velocity covariance `P'₀₁` (m²/s).
    pub p_rv: f64,
    /// Velocity variance `P'₁₁` (m²/s²) — unchanged by a constant-velocity transition.
    pub p_vv: f64,
}

impl PropagatedCovariance {
    /// The propagated position 1σ (m) = `√P'₀₀`.
    pub fn pos_sigma_m(&self) -> f64 {
        self.p_rr.max(0.0).sqrt()
    }
}

/// The predicted vs post-processed frame/ephemeris error report.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct FramePredictError {
    /// Real-time **predicted** position 1σ (m) after propagating through the latency.
    pub predicted_pos_sigma_m: f64,
    /// **Post-processed** (definitive, zero-latency) position 1σ (m).
    pub postproc_pos_sigma_m: f64,
    /// Predicted timing error (ns) = `predicted_pos_sigma_m / c`.
    pub predicted_time_ns: f64,
    /// Post-processed timing error (ns) = `postproc_pos_sigma_m / c`.
    pub postproc_time_ns: f64,
    /// The full propagated 2×2 covariance, exposed for P4 reuse.
    pub propagated_cov: PropagatedCovariance,
}

/// Representative real-time reference-frame / ephemeris prediction latency (s): 1 hour.
///
/// Modelled: the lag between an epoch of use and the finalisation of the definitive
/// frame/ephemeris product for a lunar navigation service.
pub const REALTIME_LATENCY_S: f64 = 3600.0;

/// Representative post-processed position 1σ (m) — the definitive-solution along-track
/// uncertainty. Modelled.
pub const POSTPROC_POS_SIGMA_M: f64 = 0.27;

/// Representative velocity 1σ (m/s) chosen so that, at [`REALTIME_LATENCY_S`], the
/// propagated position 1σ lands on ~15 m: `σ_v = √(15² − 0.27²) / 3600`. Modelled.
pub const REPRESENTATIVE_VEL_SIGMA_MPS: f64 = 4.166_099_16e-3;

/// Map a position error (m) to the one-way light-time timing error it causes, in
/// nanoseconds: `t = Δr / c · 1e9`. This is the exact inverse of
/// [`crate::holdover::phase_to_range_m`] (which maps time→range as `c · Δt`), scaled to ns.
pub fn range_to_time_ns(range_m: f64) -> f64 {
    range_m / C_LIGHT_M_PER_S * 1.0e9
}

/// Propagate an [`OdCovariance`] forward through a prediction `latency_s` with the
/// constant-velocity transition `Φ = [[1, Δt], [0, 1]]`, giving `P' = Φ P Φᵀ`:
///
/// * `P'₀₀ = σ_r² + 2 Δt ρ σ_r σ_v + Δt² σ_v²`
/// * `P'₀₁ = ρ σ_r σ_v + Δt σ_v²`
/// * `P'₁₁ = σ_v²`
///
/// `latency_s` is clamped to be non-negative.
pub fn propagate_covariance(cov: &OdCovariance, latency_s: f64) -> PropagatedCovariance {
    let dt = latency_s.max(0.0);
    let (p_rr, p_rv, p_vv) = (cov.p_rr(), cov.p_rv(), cov.p_vv());
    PropagatedCovariance {
        p_rr: p_rr + 2.0 * dt * p_rv + dt * dt * p_vv,
        p_rv: p_rv + dt * p_vv,
        p_vv,
    }
}

/// Compose the full report: propagate `cov` through `latency_s`, then map both the
/// predicted (propagated) and post-processed (input, zero-latency) position 1σ through the
/// exact `Δr / c` light-time relation.
///
/// The predicted magnitude is as validated as the input covariance; with
/// [`OdCovariance::representative`] it reproduces P3's ~15 m → ~50.035 ns and the
/// post-processed ~0.27 m → ~0.901 ns.
pub fn predict_frame_error(cov: OdCovariance, latency_s: f64) -> FramePredictError {
    let propagated_cov = propagate_covariance(&cov, latency_s);
    let predicted_pos_sigma_m = propagated_cov.pos_sigma_m();
    let postproc_pos_sigma_m = cov.pos_sigma_m;
    FramePredictError {
        predicted_pos_sigma_m,
        postproc_pos_sigma_m,
        predicted_time_ns: range_to_time_ns(predicted_pos_sigma_m),
        postproc_time_ns: range_to_time_ns(postproc_pos_sigma_m),
        propagated_cov,
    }
}

/// Convenience: the representative report — [`OdCovariance::representative`] propagated
/// through [`REALTIME_LATENCY_S`].
pub fn representative_report() -> FramePredictError {
    predict_frame_error(OdCovariance::representative(), REALTIME_LATENCY_S)
}

#[cfg(test)]
mod tests {
    use super::*;

    /// ORACLE: exact light-time closed form `t = Δr / c`. Published P3 magnitudes
    /// 15 m → 50.035 ns and 0.27 m → 0.901 ns, reproduced to < 0.01 ns. With
    /// c = 299_792_458 m/s: 15 / c · 1e9 = 50.0347 ns; 0.27 / c · 1e9 = 0.9006 ns.
    #[test]
    fn mapping_matches_light_time_oracle() {
        assert!((range_to_time_ns(15.0) - 50.035).abs() < 0.01);
        assert!((range_to_time_ns(0.27) - 0.901).abs() < 0.01);
    }

    /// ORACLE: manual `t = Δr / c` cross-check and internal consistency with the
    /// time→range map [`crate::holdover::phase_to_range_m`] — round-tripping a range
    /// through both must return the original range (exact).
    #[test]
    fn range_to_time_inverts_holdover_range_map() {
        let r = 15.0_f64;
        let t_s = range_to_time_ns(r) * 1.0e-9;
        let back = crate::holdover::phase_to_range_m(t_s);
        assert!((back - r).abs() < 1e-9);
    }

    /// Representative propagation reproduces P3's ~15 m real-time and ~0.27 m
    /// post-processed magnitudes, mapping to ~50.035 ns and ~0.901 ns. Magnitudes are
    /// Modelled (representative covariance); the mapping is Validated.
    #[test]
    fn representative_reproduces_p3_magnitudes() {
        let r = representative_report();
        assert!(
            (r.predicted_pos_sigma_m - 15.0).abs() < 0.02,
            "predicted {}",
            r.predicted_pos_sigma_m
        );
        assert!((r.postproc_pos_sigma_m - 0.27).abs() < 1e-12);
        assert!(
            (r.predicted_time_ns - 50.035).abs() < 0.1,
            "predicted_ns {}",
            r.predicted_time_ns
        );
        assert!(
            (r.postproc_time_ns - 0.901).abs() < 0.01,
            "postproc_ns {}",
            r.postproc_time_ns
        );
    }

    /// Zero latency is the definitive case: predicted == post-processed exactly.
    #[test]
    fn zero_latency_predicted_equals_postproc() {
        let r = predict_frame_error(OdCovariance::representative(), 0.0);
        assert_eq!(r.predicted_pos_sigma_m, r.postproc_pos_sigma_m);
        assert_eq!(r.predicted_time_ns, r.postproc_time_ns);
    }

    /// Prediction error grows monotonically with latency (a longer prediction is never
    /// more certain) — a structural property of `Φ P Φᵀ` with non-negative variances.
    #[test]
    fn error_grows_with_latency() {
        let cov = OdCovariance::representative();
        let a = predict_frame_error(cov, 600.0).predicted_pos_sigma_m;
        let b = predict_frame_error(cov, 1800.0).predicted_pos_sigma_m;
        let c = predict_frame_error(cov, 3600.0).predicted_pos_sigma_m;
        assert!(a < b && b < c, "{a} {b} {c}");
        assert!(a >= cov.pos_sigma_m);
    }

    /// Deterministic: identical inputs give bit-identical outputs.
    #[test]
    fn deterministic() {
        let cov = OdCovariance::new(0.3, 5e-3, 0.1);
        let r1 = predict_frame_error(cov, 1234.0);
        let r2 = predict_frame_error(cov, 1234.0);
        assert_eq!(r1, r2);
    }

    /// The propagated covariance is exposed for P4: velocity variance is unchanged by a
    /// constant-velocity transition, and `√P'₀₀` equals the reported predicted 1σ.
    #[test]
    fn propagated_covariance_exposed_for_reuse() {
        let cov = OdCovariance::new(0.27, 4e-3, 0.2);
        let r = predict_frame_error(cov, 3600.0);
        assert!((r.propagated_cov.p_vv - 4e-3 * 4e-3).abs() < 1e-18);
        assert!((r.propagated_cov.pos_sigma_m() - r.predicted_pos_sigma_m).abs() < 1e-12);
    }

    /// Positive position–velocity correlation adds along-track error over the prediction,
    /// so a correlated covariance predicts a larger 1σ than the uncorrelated one.
    #[test]
    fn positive_correlation_increases_predicted_error() {
        let uncorr = OdCovariance::new(0.27, 4e-3, 0.0);
        let corr = OdCovariance::new(0.27, 4e-3, 0.5);
        let u = predict_frame_error(uncorr, 3600.0).predicted_pos_sigma_m;
        let c = predict_frame_error(corr, 3600.0).predicted_pos_sigma_m;
        assert!(c > u, "{c} !> {u}");
    }

    /// `from_frame_residual` seeds the post-processed 1σ from a realised-frame residual.
    #[test]
    fn from_frame_residual_seeds_postproc_sigma() {
        let cov = OdCovariance::from_frame_residual(0.27, 4.166_099_16e-3, 0.0);
        assert_eq!(cov.pos_sigma_m, 0.27);
        let r = predict_frame_error(cov, REALTIME_LATENCY_S);
        assert!((r.predicted_pos_sigma_m - 15.0).abs() < 0.02);
    }
}
