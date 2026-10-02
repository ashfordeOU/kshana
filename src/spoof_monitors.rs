// SPDX-License-Identifier: AGPL-3.0-only
//! RF-layer spoofing monitors: AGC received-power and signal-quality (SQM).
//!
//! [`crate::spoof`] models a *time*-spoofing attack and the clock-aided integrity
//! monitor that catches it. This module adds two independent receiver-front-end
//! monitors that catch the spoof transmitter itself, regardless of how cleanly it
//! mimics the navigation message:
//!
//! - **AGC power monitor** — a spoofer radiates extra RF power, so the total received
//!   power rises above the nominal thermal-noise-plus-signal floor. The automatic-gain-
//!   control loop reflects that rise; an excess beyond a margin (a few dB) is an alert.
//! - **Signal-quality monitor (SQM)** — a clean tracked signal has a symmetric
//!   autocorrelation peak, so the Early and Late correlator taps are balanced. Multipath,
//!   meaconing, or a replay attack distorts the peak and unbalances Early vs Late; an
//!   Early-minus-Late imbalance beyond a tolerance is an alert.
//!
//! - **RAIM-consistency parity detector** — a spoofer that biases a *subset* of the
//!   satellites (or fails to spoof them all self-consistently) makes the pseudoranges
//!   geometrically inconsistent; the weighted residual sum-of-squares (the parity-space
//!   statistic) then exceeds its χ² threshold. A *common-mode* bias on every pseudorange,
//!   by contrast, is absorbed by the receiver-clock state and is RAIM-invisible — modelled
//!   honestly here, not papered over.
//! - **Multi-layer fusion** — the parity, AGC and SQM layers are independent evidence;
//!   [`fuse_spoof_layers`] combines them into one weighted decision that records which
//!   layers fired.
//!
//! These are exact closed-form metrics plus a Monte-Carlo P_fa/P_md characterisation of the
//! parity detector. The [`CombinedSpoofDetector`] composes all three layers at the epoch level;
//! it is reproduced against the published TEXBAT scenario parameters in
//! `tests/spoof_texbat_validation.rs` and exposed as the runnable `spoof-detect` scenario in
//! [`crate::spoof_detect`]. Scope (honest): validation against the *raw* published vectors
//! (TEXBAT IQ / licensed Spirent) needs an SDR front-end / external dataset and remains a
//! documented follow-on (see `ROADMAP.md`).

use serde::Serialize;

/// Combine per-source received powers (dBm) incoherently: `10·log10(Σ 10^(pᵢ/10))`.
/// Returns `−∞` for an empty set (no received signal).
pub fn combine_power_dbm(powers_dbm: &[f64]) -> f64 {
    if powers_dbm.is_empty() {
        return f64::NEG_INFINITY;
    }
    let linear: f64 = powers_dbm.iter().map(|p| 10.0_f64.powf(p / 10.0)).sum();
    10.0 * linear.log10()
}

/// An AGC received-power anomaly monitor.
#[derive(Clone, Copy, Debug)]
pub struct AgcMonitor {
    /// Expected nominal total received power (dBm): thermal noise plus the legitimate
    /// satellite aggregate the receiver sees with no interference.
    pub expected_dbm: f64,
    /// Excess over the expected power (dB) that raises an alert (RTCA/Spirent practice
    /// uses a few dB; `3.0` is a doubling of power).
    pub alert_margin_db: f64,
}

impl AgcMonitor {
    /// A monitor with the conventional 3 dB margin.
    pub fn new(expected_dbm: f64) -> Self {
        Self {
            expected_dbm,
            alert_margin_db: 3.0,
        }
    }

    /// Power excess over the expected floor (dB); negative when below expectation.
    pub fn excess_db(&self, measured_dbm: f64) -> f64 {
        measured_dbm - self.expected_dbm
    }

    /// Raise an alert when the measured power exceeds the expected floor by more than
    /// the margin — the RF signature of an added spoofing transmitter.
    pub fn alert(&self, measured_dbm: f64) -> bool {
        self.excess_db(measured_dbm) > self.alert_margin_db
    }
}

/// Ideal BPSK code autocorrelation: the triangular `R(τ) = 1 − |τ|` for `|τ| ≤ 1`
/// chip, zero beyond (the normalised peak a clean correlator tracks).
pub fn bpsk_autocorr(tau_chips: f64) -> f64 {
    (1.0 - tau_chips.abs()).max(0.0)
}

/// The balanced Early/Late correlator taps of a cleanly tracked signal at a given
/// correlator spacing (chips): both equal `R(spacing)` by symmetry.
pub fn early_late_ideal(spacing_chips: f64) -> (f64, f64) {
    let r = bpsk_autocorr(spacing_chips);
    (r, r)
}

/// A signal-quality (Early-minus-Late) monitor.
#[derive(Clone, Copy, Debug)]
pub struct SqmMonitor {
    /// Fractional Early/Late imbalance that raises an alert (≈ 0.10 = 10 %).
    pub el_tolerance: f64,
}

impl SqmMonitor {
    /// A monitor with the conventional 10 % imbalance tolerance.
    pub fn new() -> Self {
        Self { el_tolerance: 0.10 }
    }

    /// The Early-minus-Late imbalance metric `(E − L)/(E + L)` — zero for a symmetric
    /// (undistorted) correlation peak. Returns `0` if both taps are zero.
    pub fn el_metric(&self, early: f64, late: f64) -> f64 {
        let sum = early + late;
        if sum.abs() < 1e-300 {
            0.0
        } else {
            (early - late) / sum
        }
    }

    /// Raise an alert when the Early/Late imbalance exceeds the tolerance — the
    /// correlation-distortion signature of multipath, meaconing, or a replay attack.
    pub fn alert(&self, early: f64, late: f64) -> bool {
        self.el_metric(early, late).abs() > self.el_tolerance
    }
}

impl Default for SqmMonitor {
    fn default() -> Self {
        Self::new()
    }
}

// --- RAIM-consistency parity spoof detector ------------------------------------------

use crate::fusion::ukf::inverse;
use crate::raim::chi2_quantile;

/// The outcome of the RAIM consistency test on a redundant pseudorange set.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct RaimConsistency {
    /// Weighted residual sum-of-squares (the parity-space test statistic).
    pub statistic: f64,
    /// χ² detection threshold for the configured false-alert probability.
    pub threshold: f64,
    /// Redundancy `m − 4` (the χ² degrees of freedom).
    pub dof: usize,
    /// Whether the statistic exceeds the threshold (an inconsistency / likely spoof).
    pub alert: bool,
}

/// RAIM consistency test: least-squares-fit the position/clock solution to the redundant
/// pseudorange `residuals` (measured − predicted at the linearisation point) over the unit
/// line-of-sight `geometry` rows `[eₓ, e_y, e_z, 1]`, then test the leftover weighted residual
/// sum-of-squares against the χ²`(m−4)` threshold for false-alert probability `p_fa`.
///
/// Needs redundancy (`m > 4`) and a positive `sigma`; returns `None` otherwise. A common-mode
/// bias on *every* pseudorange is absorbed by the clock column and leaves the statistic
/// unchanged — RAIM cannot see it, and this test does not pretend to.
pub fn parity_raim_test(
    geometry: &[[f64; 4]],
    residuals: &[f64],
    sigma: f64,
    p_fa: f64,
) -> Option<RaimConsistency> {
    let m = geometry.len();
    if m < 5 || residuals.len() != m || sigma <= 0.0 {
        return None;
    }
    let n = 4;
    // Normal equations N = GᵀG, b = Gᵀz.
    let mut nmat = vec![vec![0.0; n]; n];
    let mut b = vec![0.0; n];
    for (g, &z) in geometry.iter().zip(residuals) {
        for a in 0..n {
            b[a] += g[a] * z;
            for (c, ncell) in nmat[a].iter_mut().enumerate() {
                *ncell += g[a] * g[c];
            }
        }
    }
    let ninv = inverse(&nmat)?;
    let x: Vec<f64> = (0..n)
        .map(|a| (0..n).map(|c| ninv[a][c] * b[c]).sum())
        .collect();
    // Leftover residual after the best fit: r = z − G x; T = Σ r² / σ².
    let t: f64 = geometry
        .iter()
        .zip(residuals)
        .map(|(g, &z)| {
            let pred: f64 = (0..n).map(|a| g[a] * x[a]).sum();
            let r = z - pred;
            r * r
        })
        .sum::<f64>()
        / (sigma * sigma);
    let dof = m - n;
    // Use the exact χ² quantile (regularised incomplete gamma + bisection) rather than
    // the Wilson–Hilferty approximation: this monitor runs at low dof (m−4, e.g. 4 for an
    // 8-SV geometry) where WH carries a ~1% error, and it keeps a single χ² threshold path
    // consistent with the ARAIM engine.
    let threshold = chi2_quantile(1.0 - p_fa, dof as f64);
    Some(RaimConsistency {
        statistic: t,
        threshold,
        dof,
        alert: t > threshold,
    })
}

// --- Multi-layer fusion --------------------------------------------------------------

/// Which independent detection layers fired.
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq, Serialize)]
pub struct SpoofLayers {
    /// The RAIM consistency parity test.
    pub raim: bool,
    /// The AGC received-power monitor.
    pub agc: bool,
    /// The signal-quality (Early-minus-Late) monitor.
    pub sqm: bool,
}

impl SpoofLayers {
    /// How many layers fired.
    pub fn count(self) -> usize {
        self.raim as usize + self.agc as usize + self.sqm as usize
    }
}

/// The fused multi-layer spoof decision.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct FusedSpoofDecision {
    /// Which layers fired.
    pub layers: SpoofLayers,
    /// Weighted evidence score (Σ wᵢ over the firing layers).
    pub score: f64,
    /// Whether the weighted score reaches the decision threshold.
    pub alert: bool,
}

/// Fuse the three independent layers into one weighted decision. `weights` are `[raim, agc,
/// sqm]` (the geometric RAIM layer is the hardest to fool, so it is usually weighted highest);
/// the fused alert fires when the summed weight of the firing layers reaches `threshold`.
pub fn fuse_spoof_layers(
    raim: bool,
    agc: bool,
    sqm: bool,
    weights: [f64; 3],
    threshold: f64,
) -> FusedSpoofDecision {
    let layers = SpoofLayers { raim, agc, sqm };
    let score = raim as u8 as f64 * weights[0]
        + agc as u8 as f64 * weights[1]
        + sqm as u8 as f64 * weights[2];
    FusedSpoofDecision {
        layers,
        score,
        alert: score >= threshold,
    }
}

// --- Combined detector (integrated per-epoch orchestration) --------------------------

/// One epoch of receiver observables the combined detector ingests: the redundant
/// pseudorange geometry + residuals (for the RAIM layer), the AGC received power, and the
/// Early/Late correlator taps (for the SQM layer).
#[derive(Clone, Debug)]
pub struct SpoofEpoch {
    /// Unit line-of-sight geometry rows `[eₓ, e_y, e_z, 1]` (the trailing 1 is the clock column).
    pub geometry: Vec<[f64; 4]>,
    /// Pseudorange residuals (measured − predicted at the linearisation point), metres.
    pub residuals: Vec<f64>,
    /// Pseudorange measurement standard deviation, metres.
    pub sigma_m: f64,
    /// Measured total received power from the AGC, dBm.
    pub measured_dbm: f64,
    /// Early correlator tap (normalised).
    pub early: f64,
    /// Late correlator tap (normalised).
    pub late: f64,
}

/// A configured combined spoof detector: the three independent monitors plus the fusion rule
/// that turns their boolean outputs into one weighted decision. Each layer catches a
/// different class of attack — RAIM the geometric inconsistency of a biased *subset*, AGC the
/// excess power of *any* transmitter, SQM the correlation distortion of a meaconer/replay — so
/// fusing them covers attacks no single layer can (e.g. a RAIM-invisible common-mode meaconer
/// the AGC + SQM still catch).
#[derive(Clone, Copy, Debug)]
pub struct CombinedSpoofDetector {
    /// The AGC received-power monitor.
    pub agc: AgcMonitor,
    /// The signal-quality (Early-minus-Late) monitor.
    pub sqm: SqmMonitor,
    /// RAIM consistency false-alert probability (the χ² tail).
    pub raim_p_fa: f64,
    /// Fusion weights `[raim, agc, sqm]`.
    pub weights: [f64; 3],
    /// Fused decision threshold (Σ of the firing layers' weights ≥ threshold ⇒ alert).
    pub fusion_threshold: f64,
}

impl CombinedSpoofDetector {
    /// A detector with conventional defaults: a 3 dB AGC margin over `expected_dbm`, a 10 %
    /// SQM tolerance, a 1e-3 RAIM false-alert budget, and a fusion rule `[0.5, 0.3, 0.2]` at
    /// threshold `0.5` — so the geometric RAIM layer trips on its own, or any two RF layers do.
    pub fn new(expected_dbm: f64) -> Self {
        Self {
            agc: AgcMonitor::new(expected_dbm),
            sqm: SqmMonitor::new(),
            raim_p_fa: 1.0e-3,
            weights: [0.5, 0.3, 0.2],
            fusion_threshold: 0.5,
        }
    }

    /// Evaluate one epoch through all three layers and fuse the result. The RAIM layer is
    /// `None` when the geometry lacks redundancy (`m ≤ 4`); it then contributes no alert.
    pub fn evaluate(&self, epoch: &SpoofEpoch) -> CombinedSpoofDecision {
        let raim = parity_raim_test(
            &epoch.geometry,
            &epoch.residuals,
            epoch.sigma_m,
            self.raim_p_fa,
        );
        let raim_alert = raim.map(|r| r.alert).unwrap_or(false);

        let agc_excess_db = self.agc.excess_db(epoch.measured_dbm);
        let agc_alert = self.agc.alert(epoch.measured_dbm);

        let sqm_el_metric = self.sqm.el_metric(epoch.early, epoch.late);
        let sqm_alert = self.sqm.alert(epoch.early, epoch.late);

        let fused = fuse_spoof_layers(
            raim_alert,
            agc_alert,
            sqm_alert,
            self.weights,
            self.fusion_threshold,
        );

        CombinedSpoofDecision {
            raim,
            agc_excess_db,
            sqm_el_metric,
            fused,
        }
    }
}

/// The full diagnostic outcome of one epoch: the per-layer evidence plus the fused decision —
/// what an operator needs to triage an alert, not just a boolean.
#[derive(Clone, Copy, Debug, Serialize)]
pub struct CombinedSpoofDecision {
    /// The RAIM consistency result (`None` if the geometry lacked redundancy, `m ≤ 4`).
    pub raim: Option<RaimConsistency>,
    /// AGC power excess over the expected floor, dB (negative when below expectation).
    pub agc_excess_db: f64,
    /// SQM Early-minus-Late imbalance metric (0 for a symmetric peak).
    pub sqm_el_metric: f64,
    /// The fused multi-layer decision (which layers fired, the weighted score, the alert).
    pub fused: FusedSpoofDecision,
}

// --- Clock-aided monitor with drift states (Hadamard-calibrated, non-latching) --------

/// Clock noise levels estimated from a short phase record: the white phase-measurement
/// variance `r` (s^2) and the three power-law PSDs of [`crate::clock_state::ClockState3`]
/// (`q_wf` white frequency modulation, `q_rw` random-walk frequency modulation, `q_drift`
/// random-run frequency modulation, the driving noise of the drift state).
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct ClockNoiseEstimate {
    /// White phase-measurement variance (s^2).
    pub r: f64,
    /// White-FM PSD (s^2/s).
    pub q_wf: f64,
    /// Random-walk-FM PSD (1/s).
    pub q_rw: f64,
    /// Random-run-FM PSD (1/s^3).
    pub q_drift: f64,
}

impl ClockNoiseEstimate {
    /// Raise each PSD to at least the floor of a clock class
    /// ([`crate::clock_state::ClockClass::psds`]): a short calibration cannot see the long-tau
    /// red noise, so the class floor stands in where the measurement is lower. `r` is kept.
    pub fn with_class_floor(self, class: crate::clock_state::ClockClass) -> Self {
        let (wf, rw, dr) = class.psds();
        Self {
            r: self.r,
            q_wf: self.q_wf.max(wf),
            q_rw: self.q_rw.max(rw),
            q_drift: self.q_drift.max(dr),
        }
    }
}

/// Hadamard variance of the four noise types this estimator separates, per unit level, at
/// averaging time `tau` (s): white phase `10 / (3 tau^2)` per unit `r` (the third difference of
/// white phase has variance `20 r`), white FM `1 / tau`, random-walk FM `tau / 6` and random-run
/// FM `11 tau^3 / 120`. The white-FM and random-walk-FM coefficients are the NIST SP 1065
/// (Riley 2008) Hadamard responses in the `q` convention of [`crate::clock_state::q_from_allan`];
/// the random-run coefficient is the same integral for a drift state driven by white noise.
fn hadamard_basis(tau: f64) -> [f64; 4] {
    [
        10.0 / (3.0 * tau * tau),
        1.0 / tau,
        tau / 6.0,
        11.0 * tau * tau * tau / 120.0,
    ]
}

/// Estimate `(r, q_wf, q_rw, q_drift)` from a phase record `phase` (s) sampled every `tau0`
/// seconds, from its Hadamard variance, which rejects a constant frequency offset and a
/// linear frequency drift exactly (the reason it is used here and not the Allan variance:
/// a receiver crystal's drift biases the Allan variance of a short record upward and makes the
/// random-walk level unidentifiable). The overlapping Hadamard variance is taken at
/// `tau = tau0 * 2^j` for every `j` with more than `3 * 2^j + 3` samples, and the four levels
/// are the non-negative weighted least-squares fit of [`hadamard_basis`] to those values, each
/// equation divided by its measured value (a relative fit, so every averaging time counts
/// alike). Returns `None` with fewer than 8 samples.
pub fn hadamard_noise_fit(phase: &[f64], tau0: f64) -> Option<ClockNoiseEstimate> {
    let n = phase.len();
    if n < 8 || tau0 <= 0.0 {
        return None;
    }
    let mut rows: Vec<([f64; 4], f64)> = Vec::new();
    let mut m = 1usize;
    while n > 3 * m + 3 {
        let h = crate::allan::hadamard_adev(phase, tau0, m);
        let hv = h * h;
        if hv > 0.0 && hv.is_finite() {
            let b = hadamard_basis(m as f64 * tau0);
            rows.push(([b[0] / hv, b[1] / hv, b[2] / hv, b[3] / hv], 1.0));
        }
        m *= 2;
    }
    if rows.is_empty() {
        return None;
    }
    // Non-negative least squares by enumerating the active sets (four unknowns).
    let mut best: Option<([f64; 4], f64)> = None;
    for mask in 1u32..16 {
        let idx: Vec<usize> = (0..4).filter(|j| mask & (1 << j) != 0).collect();
        if idx.len() > rows.len() {
            continue;
        }
        let k = idx.len();
        let mut ata = vec![vec![0.0; k]; k];
        let mut atb = vec![0.0; k];
        for (a, y) in &rows {
            for (p, &ip) in idx.iter().enumerate() {
                atb[p] += a[ip] * y;
                for (q, &iq) in idx.iter().enumerate() {
                    ata[p][q] += a[ip] * a[iq];
                }
            }
        }
        let Some(inv) = crate::fusion::ukf::inverse(&ata) else {
            continue;
        };
        let sol: Vec<f64> = (0..k)
            .map(|p| (0..k).map(|q| inv[p][q] * atb[q]).sum())
            .collect();
        if sol.iter().any(|v| !(v.is_finite() && *v >= 0.0)) {
            continue;
        }
        let mut x = [0.0; 4];
        for (p, &ip) in idx.iter().enumerate() {
            x[ip] = sol[p];
        }
        let cost: f64 = rows
            .iter()
            .map(|(a, y)| {
                let f: f64 = (0..4).map(|j| a[j] * x[j]).sum();
                (f - y) * (f - y)
            })
            .sum();
        if best.as_ref().is_none_or(|(_, c)| cost < *c) {
            best = Some((x, cost));
        }
    }
    let (x, _) = best?;
    Some(ClockNoiseEstimate {
        r: x[0],
        q_wf: x[1],
        q_rw: x[2],
        q_drift: x[3],
    })
}

/// The outcome of one epoch of the [`ClockAidedMonitor`].
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct ClockMonitorStep {
    /// Measured minus predicted phase (s).
    pub innovation_s: f64,
    /// Innovation 1-sigma `sqrt(P_phase + r)` (s) the decision used.
    pub sigma_s: f64,
    /// Whether `|innovation| > k sigma`.
    pub alarm: bool,
}

/// A clock-aided spoofing monitor on a three-state clock model (phase, frequency, drift;
/// [`crate::clock_state::ClockState3`]): each epoch the clock is predicted forward, the
/// receiver's GNSS clock estimate is compared with the prediction, and an alarm is raised when
/// the innovation exceeds `k` times its own predicted 1-sigma `sqrt(P_phase + r)`.
///
/// Two properties distinguish it from a fixed bound on a trailing straight line:
/// * **drift states**: the frequency and the drift are estimated, and the bound grows with the
///   clock's random-walk and random-run noise, so a crystal's frequency wander is followed
///   rather than flagged;
/// * **no latching**: an alarmed epoch is not used to update the clock, but the prediction's
///   covariance keeps growing through it, so after a false alarm the bound widens and the
///   monitor recovers instead of freezing a stale prediction.
#[derive(Clone, Debug)]
pub struct ClockAidedMonitor {
    filter: crate::clock_state::ClockState3,
    noise: ClockNoiseEstimate,
    k: f64,
    t_last: Option<f64>,
}

impl ClockAidedMonitor {
    /// A monitor for the clock noise `noise` and alarm multiplier `k` (sigmas). The state starts
    /// unknown (phase, frequency and drift variances `1 s^2`, `1e-10` and `1e-16`), so the
    /// first epochs pass through [`calibrate`](Self::calibrate) unchecked.
    pub fn new(noise: ClockNoiseEstimate, k: f64) -> Self {
        let filter = crate::clock_state::ClockState3::new(noise.q_wf, noise.q_rw, noise.q_drift)
            .with_initial_cov(1.0, 1e-10, 1e-16);
        Self {
            filter,
            noise,
            k,
            t_last: None,
        }
    }

    fn predict_to(&mut self, t: f64) {
        match self.t_last {
            Some(t0) => self.filter.predict(t - t0),
            None => self.filter.x[0] = 0.0,
        }
        self.t_last = Some(t);
    }

    /// Feed a calibration sample `(t, phase)` (s, s): predict and update without a decision.
    pub fn calibrate(&mut self, t: f64, phase_s: f64) {
        let first = self.t_last.is_none();
        self.predict_to(t);
        if first {
            self.filter.x[0] = phase_s;
        }
        self.filter.update_phase(phase_s, self.noise.r);
    }

    /// Monitor one epoch: predict to `t`, test `phase_s` against the prediction, and update the
    /// clock only when the epoch is not alarmed (`exclude` also skips the update, for an epoch
    /// another monitor has alarmed).
    pub fn step(&mut self, t: f64, phase_s: f64, exclude: bool) -> ClockMonitorStep {
        self.predict_to(t);
        let innovation_s = phase_s - self.filter.phase_est();
        let sigma_s = (self.filter.covariance()[0][0] + self.noise.r)
            .max(0.0)
            .sqrt();
        let alarm = innovation_s.abs() > self.k * sigma_s;
        if !alarm && !exclude {
            self.filter.update_phase(phase_s, self.noise.r);
        }
        ClockMonitorStep {
            innovation_s,
            sigma_s,
            alarm,
        }
    }

    /// Advance the prediction to `t` without a measurement (an epoch with no clock estimate).
    pub fn coast(&mut self, t: f64) {
        self.predict_to(t);
    }

    /// The noise levels the monitor runs on.
    pub fn noise(&self) -> ClockNoiseEstimate {
        self.noise
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn power_combines_incoherently() {
        // Two equal powers add 3.01 dB (a doubling); N equal add 10·log10(N).
        let two = combine_power_dbm(&[-130.0, -130.0]);
        assert!((two - (-126.9897)).abs() < 1e-3, "two = {two}");
        let eight = combine_power_dbm(&[-130.0; 8]);
        assert!(
            (eight - (-130.0 + 10.0 * 8.0_f64.log10())).abs() < 1e-9,
            "eight = {eight}"
        );
        // No signal at all is −∞.
        assert_eq!(combine_power_dbm(&[]), f64::NEG_INFINITY);
    }

    #[test]
    fn agc_flags_only_a_real_power_excess() {
        // Nominal floor = 8 SVs at −130 dBm ⇒ −130 + 9.03 ≈ −120.97 dBm.
        let nominal: Vec<f64> = vec![-130.0; 8];
        let floor = combine_power_dbm(&nominal);
        let mon = AgcMonitor::new(floor);
        // Exactly nominal: no excess, no alert.
        assert!((mon.excess_db(floor)).abs() < 1e-9);
        assert!(!mon.alert(floor));
        // +2 dB stays under the 3 dB margin; +4 dB trips it.
        assert!(!mon.alert(floor + 2.0));
        assert!(mon.alert(floor + 4.0));
        // A −115 dBm spoofer added to the aggregate raises power well past the margin.
        let mut spoofed = nominal.clone();
        spoofed.push(-115.0);
        let measured = combine_power_dbm(&spoofed);
        assert!(mon.alert(measured), "excess {} dB", mon.excess_db(measured));
    }

    #[test]
    fn bpsk_autocorr_is_the_triangle() {
        assert!((bpsk_autocorr(0.0) - 1.0).abs() < 1e-12);
        assert!((bpsk_autocorr(0.1) - 0.9).abs() < 1e-12);
        assert!((bpsk_autocorr(-0.5) - 0.5).abs() < 1e-12);
        assert_eq!(bpsk_autocorr(1.0), 0.0);
        assert_eq!(bpsk_autocorr(2.0), 0.0);
    }

    #[test]
    fn sqm_flags_only_real_correlation_asymmetry() {
        let mon = SqmMonitor::new();
        // A clean, symmetric peak: Early = Late ⇒ metric 0, no alert.
        let (e, l) = early_late_ideal(0.1);
        assert!((mon.el_metric(e, l)).abs() < 1e-12);
        assert!(!mon.alert(e, l));
        // 0.1/1.8 ≈ 5.6 % imbalance stays under 10 %.
        assert!(!mon.alert(0.95, 0.85));
        // 0.2/1.8 ≈ 11.1 % imbalance trips the alert.
        assert!(mon.alert(1.0, 0.8));
        // Zero taps do not divide by zero.
        assert_eq!(mon.el_metric(0.0, 0.0), 0.0);
    }

    // Eight unit line-of-sight rows over the sky, each `[eₓ, e_y, e_z, 1]` (the trailing 1 is the
    // receiver-clock column), spread for a well-conditioned geometry.
    fn geometry8() -> Vec<[f64; 4]> {
        let azels = [
            (0.0, 80.0),
            (45.0, 30.0),
            (100.0, 55.0),
            (150.0, 20.0),
            (200.0, 60.0),
            (255.0, 25.0),
            (300.0, 45.0),
            (340.0, 15.0),
        ];
        azels
            .iter()
            .map(|&(az, el): &(f64, f64)| {
                let (a, e) = (az.to_radians(), el.to_radians());
                [e.cos() * a.sin(), e.cos() * a.cos(), e.sin(), 1.0]
            })
            .collect()
    }

    #[test]
    fn parity_raim_flags_an_inconsistent_satellite() {
        let g = geometry8();
        // Perfectly consistent residuals: z = G·x_true for a chosen state ⇒ zero leftover ⇒ no
        // alert (statistic ≈ 0).
        let x_true = [12.0, -8.0, 5.0, 30.0]; // [pos error (m), clock (m)]
        let consistent: Vec<f64> = g
            .iter()
            .map(|row| (0..4).map(|a| row[a] * x_true[a]).sum())
            .collect();
        let clean = parity_raim_test(&g, &consistent, 5.0, 0.001).expect("redundant");
        assert!(clean.statistic < 1e-9 && !clean.alert, "{clean:?}");
        // Bias one satellite by 60 m (12σ): geometrically inconsistent ⇒ a large statistic ⇒ alert.
        let mut spoofed = consistent.clone();
        spoofed[3] += 60.0;
        let attacked = parity_raim_test(&g, &spoofed, 5.0, 0.001).expect("redundant");
        assert!(attacked.alert, "single-SV bias not flagged: {attacked:?}");
    }

    #[test]
    fn common_mode_bias_is_raim_invisible() {
        // A bias applied to EVERY pseudorange equally is absorbed by the clock column, so the
        // parity statistic is unchanged — the honest limitation of any RAIM detector.
        let g = geometry8();
        let base: Vec<f64> = (0..8).map(|i| (i as f64 - 3.5) * 1.3).collect();
        let s0 = parity_raim_test(&g, &base, 5.0, 0.001).expect("redundant");
        let ramped: Vec<f64> = base.iter().map(|&z| z + 250.0).collect();
        let s1 = parity_raim_test(&g, &ramped, 5.0, 0.001).expect("redundant");
        assert!(
            (s0.statistic - s1.statistic).abs() < 1e-6,
            "common-mode bias changed the statistic: {} vs {}",
            s0.statistic,
            s1.statistic
        );
    }

    #[test]
    fn fusion_combines_independent_layers() {
        // RAIM weighted highest; a lone weak SQM hit stays under threshold, but RAIM + AGC trips it,
        // and the firing layers are recorded.
        let w = [0.5, 0.3, 0.2];
        let lone_sqm = fuse_spoof_layers(false, false, true, w, 0.5);
        assert!(!lone_sqm.alert && lone_sqm.layers.count() == 1);
        let raim_agc = fuse_spoof_layers(true, true, false, w, 0.5);
        assert!(raim_agc.alert && raim_agc.layers.count() == 2);
        assert!(raim_agc.layers.raim && raim_agc.layers.agc && !raim_agc.layers.sqm);
    }

    #[test]
    fn parity_raim_false_alert_and_missed_detection_are_characterized() {
        use rand::SeedableRng;
        use rand_chacha::ChaCha8Rng;
        use rand_distr::{Distribution, Normal};

        let g = geometry8();
        let sigma = 5.0;
        let p_fa = 0.05;
        let noise = Normal::new(0.0, sigma).unwrap();
        let trials = 400;
        let mut rng = ChaCha8Rng::seed_from_u64(0x5F00_F123);

        // Helper: fraction of `trials` that alert, with a per-satellite bias added to SV 3.
        let run = |bias: f64, rng: &mut ChaCha8Rng| {
            let mut alerts = 0;
            for _ in 0..trials {
                let mut z: Vec<f64> = (0..8).map(|_| noise.sample(rng)).collect();
                z[3] += bias;
                if parity_raim_test(&g, &z, sigma, p_fa).unwrap().alert {
                    alerts += 1;
                }
            }
            alerts as f64 / trials as f64
        };

        // Under H0 (no spoof) the empirical false-alert rate sits near the 5 % design point.
        let pfa = run(0.0, &mut rng);
        assert!((0.02..0.10).contains(&pfa), "empirical P_fa = {pfa}");
        // Under H1 the missed-detection rate falls as the spoof bias grows.
        let pmd_small = 1.0 - run(2.0 * sigma, &mut rng);
        let pmd_large = 1.0 - run(8.0 * sigma, &mut rng);
        assert!(
            pmd_large < pmd_small,
            "P_md did not fall with bias: {pmd_large} vs {pmd_small}"
        );
        assert!(pmd_large < 0.2, "P_md at 8σ still high: {pmd_large}");
    }

    // --- Combined detector (integrated per-epoch RAIM + AGC + SQM + fusion) --------------

    /// Build a consistent (well-fit) residual set for `geometry8` from a chosen true state, so the
    /// RAIM parity statistic is ~0 unless we deliberately perturb it.
    fn consistent_residuals(g: &[[f64; 4]]) -> Vec<f64> {
        let x_true = [9.0, -4.0, 6.0, 25.0];
        g.iter()
            .map(|row| (0..4).map(|a| row[a] * x_true[a]).sum())
            .collect()
    }

    #[test]
    fn combined_detector_passes_a_clean_epoch() {
        let g = geometry8();
        let residuals = consistent_residuals(&g);
        let floor = combine_power_dbm(&[-130.0; 8]);
        let det = CombinedSpoofDetector::new(floor);
        let (early, late) = early_late_ideal(0.1);
        let epoch = SpoofEpoch {
            geometry: g,
            residuals,
            sigma_m: 5.0,
            measured_dbm: floor,
            early,
            late,
        };
        let d = det.evaluate(&epoch);
        assert!(!d.fused.alert, "clean epoch raised a spoof alert: {d:?}");
        assert_eq!(d.fused.layers.count(), 0, "no layer should fire: {d:?}");
    }

    #[test]
    fn combined_detector_catches_a_single_sv_bias_via_raim() {
        let g = geometry8();
        let mut residuals = consistent_residuals(&g);
        residuals[3] += 60.0; // a 12σ bias on one satellite — geometrically inconsistent
        let floor = combine_power_dbm(&[-130.0; 8]);
        let det = CombinedSpoofDetector::new(floor);
        let (early, late) = early_late_ideal(0.1);
        let epoch = SpoofEpoch {
            geometry: g,
            residuals,
            sigma_m: 5.0,
            measured_dbm: floor,
            early,
            late,
        };
        let d = det.evaluate(&epoch);
        assert!(
            d.raim.map(|r| r.alert).unwrap_or(false),
            "RAIM did not fire on a single-SV bias: {d:?}"
        );
        assert!(
            d.fused.layers.raim && !d.fused.layers.agc && !d.fused.layers.sqm,
            "only RAIM should fire: {d:?}"
        );
        assert!(
            d.fused.alert,
            "single-SV bias not flagged by the fused detector"
        );
    }

    /// The case that justifies fusion: an over-powered meaconer applies a *common-mode* delay RAIM
    /// cannot see (absorbed by the clock state), but it radiates excess power and distorts the
    /// correlation peak — so the AGC and SQM layers together trip the fused decision.
    #[test]
    fn combined_detector_catches_a_raim_invisible_meaconer_via_agc_and_sqm() {
        let g = geometry8();
        let base: Vec<f64> = (0..8).map(|i| (i as f64 - 3.5) * 1.1).collect();
        let residuals: Vec<f64> = base.iter().map(|&z| z + 300.0).collect(); // common-mode +300 m
        let floor = combine_power_dbm(&[-130.0; 8]);
        let det = CombinedSpoofDetector::new(floor);
        let epoch = SpoofEpoch {
            geometry: g,
            residuals,
            sigma_m: 5.0,
            measured_dbm: floor + 6.0, // +6 dB over the nominal floor
            early: 1.0,
            late: 0.72, // ~18 % Early/Late imbalance from the replayed correlation
        };
        let d = det.evaluate(&epoch);
        assert!(
            !d.raim.map(|r| r.alert).unwrap_or(false),
            "RAIM must be blind to a common-mode bias: {d:?}"
        );
        assert!(
            d.fused.layers.agc && d.fused.layers.sqm,
            "AGC + SQM should both fire on the over-powered meaconer: {d:?}"
        );
        assert!(
            d.fused.alert,
            "RAIM-invisible meaconer escaped the fused detector: {d:?}"
        );
    }

    #[test]
    fn combined_detector_reports_per_layer_diagnostics() {
        let g = geometry8();
        let residuals = consistent_residuals(&g);
        let floor = combine_power_dbm(&[-130.0; 8]);
        let det = CombinedSpoofDetector::new(floor);
        let epoch = SpoofEpoch {
            geometry: g,
            residuals,
            sigma_m: 5.0,
            measured_dbm: floor + 1.5,
            early: 1.0,
            late: 0.95,
        };
        let d = det.evaluate(&epoch);
        assert!(
            d.raim.is_some(),
            "redundant geometry should yield a RAIM statistic"
        );
        assert!(
            (d.agc_excess_db - 1.5).abs() < 1e-9,
            "AGC excess should be +1.5 dB, got {}",
            d.agc_excess_db
        );
        assert!(
            d.sqm_el_metric > 0.0,
            "Early > Late should give a positive imbalance, got {}",
            d.sqm_el_metric
        );
    }
    /// A seeded clock: white phase noise `sx` (s), white FM `a` (ADEV at 1 s), a constant
    /// frequency drift `d` (1/s^2), sampled every second.
    fn synthetic_clock(n: usize, sx: f64, a: f64, d: f64, seed: u64) -> Vec<f64> {
        use rand::SeedableRng;
        use rand_distr::{Distribution, Normal};
        let mut rng = rand_chacha::ChaCha8Rng::seed_from_u64(seed);
        let g = Normal::new(0.0, 1.0).unwrap();
        let mut x = 0.0;
        (0..n)
            .map(|i| {
                x += a * g.sample(&mut rng);
                let t = i as f64;
                x + 0.5 * d * t * t + sx * g.sample(&mut rng)
            })
            .collect()
    }

    #[test]
    fn hadamard_fit_recovers_white_phase_and_white_frequency_through_a_drift() {
        let phase = synthetic_clock(4096, 3e-9, 2e-10, 1e-11, 7);
        let est = hadamard_noise_fit(&phase, 1.0).unwrap();
        // Within 25 % of the truth on 4096 samples; the drift does not leak into the levels.
        assert!((est.r.sqrt() / 3e-9 - 1.0).abs() < 0.25, "{est:?}");
        assert!((est.q_wf.sqrt() / 2e-10 - 1.0).abs() < 0.25, "{est:?}");
    }

    #[test]
    fn clock_aided_monitor_follows_a_drifting_clock_and_flags_a_step() {
        let phase = synthetic_clock(600, 3e-9, 2e-10, 1e-11, 11);
        let noise = hadamard_noise_fit(&phase[..60], 1.0).unwrap();
        let mut m = ClockAidedMonitor::new(noise, 5.0);
        for (i, &x) in phase[..60].iter().enumerate() {
            m.calibrate(i as f64, x);
        }
        let mut alarms = 0;
        for (i, &x) in phase.iter().enumerate().skip(60) {
            let st = m.step(i as f64, x, false);
            alarms += st.alarm as usize;
        }
        assert!(
            alarms <= 2,
            "a drifting clock is not a spoof: {alarms} alarms"
        );
        // A 1 microsecond step is flagged at once.
        let st = m.step(600.0, phase[599] + 1e-6, false);
        assert!(st.alarm);
    }

    #[test]
    fn an_alarm_does_not_latch_the_monitor() {
        let phase = synthetic_clock(300, 3e-9, 2e-10, 0.0, 3);
        let noise = ClockNoiseEstimate {
            r: 9e-18,
            q_wf: 4e-20,
            q_rw: 1e-22,
            q_drift: 0.0,
        };
        let mut m = ClockAidedMonitor::new(noise, 5.0);
        for (i, &x) in phase[..60].iter().enumerate() {
            m.calibrate(i as f64, x);
        }
        // One outlier epoch alarms and is not used ...
        assert!(m.step(60.0, phase[60] + 1e-6, false).alarm);
        // ... and the following clean epochs pass: the prediction did not freeze.
        let later: usize = (61..120)
            .map(|i| m.step(i as f64, phase[i], false).alarm as usize)
            .sum();
        assert_eq!(later, 0);
    }

    #[test]
    fn class_floor_only_raises_the_psds() {
        let low = ClockNoiseEstimate {
            r: 1e-18,
            q_wf: 0.0,
            q_rw: 0.0,
            q_drift: 0.0,
        };
        let f = low.with_class_floor(crate::clock_state::ClockClass::Tcxo);
        let (wf, rw, dr) = crate::clock_state::ClockClass::Tcxo.psds();
        assert_eq!((f.r, f.q_wf, f.q_rw, f.q_drift), (1e-18, wf, rw, dr));
        let high = ClockNoiseEstimate { q_wf: 1.0, ..low };
        assert_eq!(
            high.with_class_floor(crate::clock_state::ClockClass::Tcxo)
                .q_wf,
            1.0
        );
    }
}
