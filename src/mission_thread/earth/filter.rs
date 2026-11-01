// SPDX-License-Identifier: AGPL-3.0-only
//! The small filters the Earth-side phases run: a two-state position-velocity filter per axis
//! and a two-state clock filter, in covariance form. They propagate and update covariance only
//! (the thread carries covariances, not noisy samples), so a run is deterministic.
//!
//! Model: constant velocity with white acceleration noise of power spectral density `q`
//! ((m/s^2)^2 per Hz); the clock is bias and drift with white frequency noise `q_f` (s^2 per s)
//! and drift random walk `q_d` ((s/s)^2 per s).

use crate::mission_thread::phase::{Cov6, N};

/// A position-velocity filter for one axis; the three axes are independent and identical in the
/// phases that use it.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct AxisFilter {
    /// Covariance of `[position, velocity]`: m^2, m^2/s, m^2/s^2.
    pub p: [[f64; 2]; 2],
}

impl AxisFilter {
    /// A filter with independent position and velocity sigmas.
    pub fn new(sigma_pos: f64, sigma_vel: f64) -> Self {
        AxisFilter {
            p: [[sigma_pos * sigma_pos, 0.0], [0.0, sigma_vel * sigma_vel]],
        }
    }

    /// 1-sigma position, metres.
    pub fn sigma_pos(&self) -> f64 {
        self.p[0][0].max(0.0).sqrt()
    }

    /// 1-sigma velocity, metres per second.
    pub fn sigma_vel(&self) -> f64 {
        self.p[1][1].max(0.0).sqrt()
    }

    /// Propagates over `dt` seconds: `P = F P F^T + Q` with `F = [[1, dt], [0, 1]]`.
    pub fn predict(&mut self, dt: f64, q: f64) {
        let p = self.p;
        let p00 = p[0][0] + 2.0 * dt * p[0][1] + dt * dt * p[1][1] + q * dt.powi(3) / 3.0;
        let p01 = p[0][1] + dt * p[1][1] + q * dt * dt / 2.0;
        let p11 = p[1][1] + q * dt;
        self.p = [[p00, p01], [p01, p11]];
    }

    /// A position measurement of variance `r` (m^2).
    pub fn update_pos(&mut self, r: f64) {
        let p = self.p;
        let s = p[0][0] + r;
        let k0 = p[0][0] / s;
        let k1 = p[0][1] / s;
        let p00 = (1.0 - k0) * p[0][0];
        let p01 = (1.0 - k0) * p[0][1];
        let p11 = p[1][1] - k1 * p[0][1];
        self.p = [[p00, p01], [p01, p11]];
    }

    /// A velocity measurement of variance `r` (m^2/s^2).
    pub fn update_vel(&mut self, r: f64) {
        let p = self.p;
        let s = p[1][1] + r;
        let k0 = p[0][1] / s;
        let k1 = p[1][1] / s;
        let p00 = p[0][0] - k0 * p[0][1];
        let p01 = (1.0 - k1) * p[0][1];
        let p11 = (1.0 - k1) * p[1][1];
        self.p = [[p00, p01], [p01, p11]];
    }

    /// The full 6x6 covariance of three identical, independent axes `[x, y, z, vx, vy, vz]`.
    pub fn cov6(&self) -> Cov6 {
        let mut c = [[0.0; N]; N];
        for i in 0..3 {
            c[i][i] = self.p[0][0];
            c[i][i + 3] = self.p[0][1];
            c[i + 3][i] = self.p[1][0];
            c[i + 3][i + 3] = self.p[1][1];
        }
        c
    }

    /// The per-axis filter of a 6x6 covariance, from the mean of the three axes' blocks (the
    /// phases using this treat the axes as identical).
    pub fn from_cov6(c: &Cov6) -> Self {
        let m = |a: usize, b: usize| (c[a][b] + c[a + 1][b + 1] + c[a + 2][b + 2]) / 3.0;
        let p01 = (m(0, 3) + m(3, 0)) / 2.0;
        AxisFilter {
            p: [[m(0, 0), p01], [p01, m(3, 3)]],
        }
    }
}

/// A clock filter: bias and drift.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct ClockFilter {
    /// Covariance of `[bias, drift]`: s^2, s^2/s, (s/s)^2.
    pub p: [[f64; 2]; 2],
}

impl ClockFilter {
    /// 1-sigma bias, seconds.
    pub fn sigma_bias(&self) -> f64 {
        self.p[0][0].max(0.0).sqrt()
    }

    /// Propagates over `dt`: bias integrates drift; `q_f` is the white frequency noise (s^2 per
    /// s) and `q_d` the drift random walk ((s/s)^2 per s).
    pub fn predict(&mut self, dt: f64, q_f: f64, q_d: f64) {
        let p = self.p;
        let p00 =
            p[0][0] + 2.0 * dt * p[0][1] + dt * dt * p[1][1] + q_f * dt + q_d * dt.powi(3) / 3.0;
        let p01 = p[0][1] + dt * p[1][1] + q_d * dt * dt / 2.0;
        let p11 = p[1][1] + q_d * dt;
        self.p = [[p00, p01], [p01, p11]];
    }

    /// A bias measurement of variance `r` (s^2).
    pub fn update_bias(&mut self, r: f64) {
        let p = self.p;
        let s = p[0][0] + r;
        let k0 = p[0][0] / s;
        let k1 = p[0][1] / s;
        let p00 = (1.0 - k0) * p[0][0];
        let p01 = (1.0 - k0) * p[0][1];
        let p11 = p[1][1] - k1 * p[0][1];
        self.p = [[p00, p01], [p01, p11]];
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn prediction_matches_the_hand_calculation_and_never_shrinks_a_sigma() {
        let mut f = AxisFilter::new(10.0, 0.1);
        f.predict(60.0, 1.0e-6);
        let want = 100.0 + 3600.0 * 0.01 + 1.0e-6 * 216_000.0 / 3.0;
        assert!((f.p[0][0] - want).abs() < 1e-9);
        assert!((f.p[1][1] - (0.01 + 1.0e-6 * 60.0)).abs() < 1e-15);
        assert!(f.sigma_pos() > 10.0 && f.sigma_vel() > 0.1);
    }

    #[test]
    fn an_update_never_increases_a_sigma_and_a_huge_r_changes_nothing() {
        let mut f = AxisFilter::new(10.0, 0.1);
        f.predict(5.0, 1e-5);
        let before = f;
        f.update_pos(4.0);
        assert!(f.sigma_pos() < before.sigma_pos() && f.sigma_vel() <= before.sigma_vel());
        let mut g = before;
        g.update_pos(1e30);
        assert!((g.p[0][0] - before.p[0][0]).abs() / before.p[0][0] < 1e-12);
        let mut h = before;
        h.update_vel(1e-4);
        assert!(h.sigma_vel() < before.sigma_vel());
    }

    #[test]
    fn repeated_updates_reach_the_riccati_steady_state() {
        // Independent computation: iterate the same Riccati recursion to a fixed point and
        // compare with a filter run for a long time; also the steady state is at most the
        // measurement sigma.
        let (dt, q, r) = (1.0, 1.0e-4, 25.0);
        let mut f = AxisFilter::new(100.0, 1.0);
        for _ in 0..2000 {
            f.predict(dt, q);
            f.update_pos(r);
        }
        let mut g = f;
        g.predict(dt, q);
        g.update_pos(r);
        assert!(
            (g.p[0][0] - f.p[0][0]).abs() < 1e-9 * f.p[0][0],
            "not a fixed point"
        );
        assert!(f.sigma_pos() < 5.0, "{}", f.sigma_pos());
        // Position and velocity are correlated in the steady state: the 6x6 carries that.
        let c = f.cov6();
        assert!((c[0][3] - f.p[0][1]).abs() < 1e-18 && c[1][1] == c[0][0] && c[4][4] == c[3][3]);
        let back = AxisFilter::from_cov6(&c);
        assert!((back.p[0][0] - f.p[0][0]).abs() < 1e-12);
    }

    #[test]
    fn the_clock_holdover_grows_with_drift_and_noise_and_an_update_pulls_it_in() {
        let mut c = ClockFilter {
            p: [[1e-14, 0.0], [0.0, 1e-24]],
        };
        c.predict(100.0, 1e-22, 1e-30);
        let want = 1e-14 + 1e4 * 1e-24 + 1e-22 * 100.0 + 1e-30 * 1e6 / 3.0;
        assert!((c.p[0][0] - want).abs() < 1e-24, "{} vs {want}", c.p[0][0]);
        let before = c.sigma_bias();
        c.update_bias(1e-16);
        assert!(c.sigma_bias() < before);
    }
}
