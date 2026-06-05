// SPDX-License-Identifier: Apache-2.0
//! Tightly-coupled GNSS/INS navigator on the unscented Kalman core.
//!
//! Where a *loosely*-coupled filter consumes a ready-made position/velocity fix (and so
//! needs four-plus satellites to even form one), the **tightly-coupled** filter ingests the
//! raw satellite measurements — pseudorange and Doppler (range-rate) — directly. Each
//! satellite contributes its own equations, so the navigator keeps correcting with **fewer
//! than four satellites in view** and rides through partial or total GNSS outages on its
//! propagated dynamics. The pseudorange/Doppler model is nonlinear in the state (a Euclidean
//! range and a range-rate projection), so the estimator is the scaled unscented Kalman filter
//! ([`crate::fusion::ukf::Ukf`]) rather than a Jacobian-linearised EKF.
//!
//! The state is the eight-vector `[px, py, pz, vx, vy, vz, b, d]`: ECEF position (m), velocity
//! (m/s), and the receiver clock bias `b` and drift `d` carried in range units (m and m/s, i.e.
//! `c·δt` and `c·δḟ`). The process model is constant-velocity position with a random-walk clock;
//! the measurement model maps the state to each satellite's pseudorange `ρ = |p − sᵢ| + b` and
//! range-rate `ρ̇ = (p − sᵢ)·(v − ṡᵢ)/|p − sᵢ| + d`.
//!
//! Scope (honest): this is the position/velocity/clock tightly-coupled core and its
//! outage-validation scenario. Folding it into the full 15-state INS error state (attitude and
//! IMU biases of [`crate::fusion::gnss_ins_ekf`]) and driving the satellite geometry from a live
//! SGP4 constellation with broadcast iono/tropo corrections in the loop are follow-ons (see
//! `ROADMAP.md`).

use crate::fusion::ukf::Ukf;

/// A GNSS satellite as seen by the navigator: ECEF position and velocity (m, m/s).
#[derive(Clone, Copy, Debug)]
pub struct Sat {
    /// Satellite ECEF position (m).
    pub pos: [f64; 3],
    /// Satellite ECEF velocity (m/s).
    pub vel: [f64; 3],
}

/// Geometric range from the state's position to `sat` (m).
fn range(state: &[f64], sat: &Sat) -> f64 {
    let d = [
        state[0] - sat.pos[0],
        state[1] - sat.pos[1],
        state[2] - sat.pos[2],
    ];
    (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt()
}

/// Modelled pseudorange `ρ = |p − sᵢ| + b` (geometric range plus the clock bias in range units).
pub fn pseudorange(state: &[f64], sat: &Sat) -> f64 {
    range(state, sat) + state[6]
}

/// Modelled range-rate (Doppler) `ρ̇ = (p − sᵢ)·(v − ṡᵢ)/|p − sᵢ| + d` — the line-of-sight
/// projection of the relative velocity plus the clock drift in range-rate units.
pub fn range_rate(state: &[f64], sat: &Sat) -> f64 {
    let d = [
        state[0] - sat.pos[0],
        state[1] - sat.pos[1],
        state[2] - sat.pos[2],
    ];
    let r = (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt();
    let vrel = [
        state[3] - sat.vel[0],
        state[4] - sat.vel[1],
        state[5] - sat.vel[2],
    ];
    (d[0] * vrel[0] + d[1] * vrel[1] + d[2] * vrel[2]) / r + state[7]
}

/// A tightly-coupled GNSS/INS navigator: the eight-state UKF plus its process-noise covariance.
pub struct TightlyCoupled {
    /// The underlying unscented Kalman filter over `[px,py,pz,vx,vy,vz,b,d]`.
    pub ukf: Ukf,
    /// Additive process-noise covariance applied each `propagate` (8×8).
    pub q: Vec<Vec<f64>>,
}

impl TightlyCoupled {
    /// A navigator with the given initial state `x0`, covariance `p0`, and process noise `q`.
    /// Uses an `α = 1` sigma-point spread (`λ = 0`, points at `±√n·Lᵢ`): the conventional
    /// `α = 1e-3` collapses the points onto the mean, which loses precision against the ~1e7-m
    /// position magnitudes of an Earth-frame navigation state.
    pub fn new(x0: Vec<f64>, p0: Vec<Vec<f64>>, q: Vec<Vec<f64>>) -> Self {
        let mut ukf = Ukf::new(x0, p0);
        ukf.alpha = 1.0;
        ukf.kappa = 0.0;
        Self { ukf, q }
    }

    /// Propagate the state forward by `dt` seconds under the constant-velocity / random-walk-clock
    /// dynamics. This is the only step taken during a GNSS outage. Returns `false` (state
    /// untouched) on a non-positive-definite covariance.
    pub fn propagate(&mut self, dt: f64) -> bool {
        let f = move |s: &[f64]| {
            vec![
                s[0] + s[3] * dt,
                s[1] + s[4] * dt,
                s[2] + s[5] * dt,
                s[3],
                s[4],
                s[5],
                s[6] + s[7] * dt,
                s[7],
            ]
        };
        self.ukf.predict(f, &self.q)
    }

    /// Update with the raw satellite measurements: pseudoranges `pr` and range-rates `rr`, one per
    /// satellite in `sats`, with per-measurement standard deviations `sigma_pr` (m) and `sigma_rr`
    /// (m/s). Works for any number of satellites — including fewer than the four a snapshot fix
    /// would need. Returns `false` on a degenerate covariance.
    pub fn update_gnss(
        &mut self,
        sats: &[Sat],
        pr: &[f64],
        rr: &[f64],
        sigma_pr: f64,
        sigma_rr: f64,
    ) -> bool {
        let k = sats.len();
        let sats_owned = sats.to_vec();
        let h = move |s: &[f64]| {
            let mut z = Vec::with_capacity(2 * sats_owned.len());
            for sat in &sats_owned {
                z.push(pseudorange(s, sat));
            }
            for sat in &sats_owned {
                z.push(range_rate(s, sat));
            }
            z
        };
        let mut z = Vec::with_capacity(2 * k);
        z.extend_from_slice(pr);
        z.extend_from_slice(rr);
        let mut r = vec![vec![0.0; 2 * k]; 2 * k];
        for i in 0..k {
            r[i][i] = sigma_pr * sigma_pr;
            r[k + i][k + i] = sigma_rr * sigma_rr;
        }
        self.ukf.update(h, &z, &r)
    }

    /// Current position error magnitude (m) against a known truth position.
    pub fn position_error(&self, truth: [f64; 3]) -> f64 {
        let x = &self.ukf.x;
        let d = [x[0] - truth[0], x[1] - truth[1], x[2] - truth[2]];
        (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt()
    }
}

#[cfg(test)]
mod tests {
    use super::*;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;
    use rand_distr::{Distribution, Normal};

    // A GPS-like satellite geometry at MEO radius, well spread for good DOP.
    fn constellation() -> Vec<Sat> {
        vec![
            Sat {
                pos: [2.00e7, 1.00e7, 1.50e7],
                vel: [-1500.0, 2200.0, 600.0],
            },
            Sat {
                pos: [1.50e7, -1.20e7, 1.80e7],
                vel: [1800.0, 1500.0, -700.0],
            },
            Sat {
                pos: [2.20e7, 0.50e7, -1.00e7],
                vel: [-900.0, -2000.0, 1200.0],
            },
            Sat {
                pos: [1.00e7, 1.80e7, -1.50e7],
                vel: [2100.0, -800.0, -1000.0],
            },
            Sat {
                pos: [2.50e7, -0.80e7, 0.60e7],
                vel: [-1200.0, 1700.0, 1400.0],
            },
        ]
    }

    // Truth state at integer second `t`: a constant-velocity LEO user with a drifting clock,
    // matching the filter's process model exactly so a noiseless filter converges to truth.
    fn truth_at(t: f64) -> [f64; 3] {
        [7.0e6, 7.5e3 * t, 0.0]
    }
    fn truth_state(t: f64) -> [f64; 8] {
        [7.0e6, 7.5e3 * t, 0.0, 0.0, 7.5e3, 0.0, 30.0 + 0.1 * t, 0.1]
    }

    fn measurements(t: f64, sats: &[Sat]) -> (Vec<f64>, Vec<f64>) {
        let s = truth_state(t);
        let pr = sats.iter().map(|sat| pseudorange(&s, sat)).collect();
        let rr = sats.iter().map(|sat| range_rate(&s, sat)).collect();
        (pr, rr)
    }

    fn init_navigator() -> TightlyCoupled {
        // Perturbed initial guess: ~150 m position, ~2 m/s velocity, ~8 m clock-bias offset.
        let x0 = vec![
            7.0e6 + 150.0,
            -120.0,
            90.0,
            2.0,
            7.5e3 - 1.5,
            1.0,
            38.0,
            0.15,
        ];
        // Generous initial covariance; small process noise (truth is exactly CV + RW clock).
        let p0diag = [1.0e4, 1.0e4, 1.0e4, 1.0e2, 1.0e2, 1.0e2, 1.0e4, 1.0e0];
        let qdiag = [
            1.0e-2, 1.0e-2, 1.0e-2, 1.0e-3, 1.0e-3, 1.0e-3, 1.0e-2, 1.0e-4,
        ];
        let p0 = diag(&p0diag);
        let q = diag(&qdiag);
        TightlyCoupled::new(x0, p0, q)
    }

    fn diag(d: &[f64]) -> Vec<Vec<f64>> {
        let n = d.len();
        let mut m = vec![vec![0.0; n]; n];
        for (i, &v) in d.iter().enumerate() {
            m[i][i] = v;
        }
        m
    }

    #[test]
    fn pseudorange_and_range_rate_match_geometry() {
        // Sat at (3,4,0) from the origin ⇒ geometric range 5.
        let sat = Sat {
            pos: [3.0, 4.0, 0.0],
            vel: [0.0, 0.0, 0.0],
        };
        // Zero clock: pseudorange = 5, range-rate = 0 (no motion).
        let still = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0];
        assert!((pseudorange(&still, &sat) - 5.0).abs() < 1e-12);
        assert!(range_rate(&still, &sat).abs() < 1e-12);
        // Clock bias 10 m and drift 2 m/s add directly.
        let clocked = [0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 10.0, 2.0];
        assert!((pseudorange(&clocked, &sat) - 15.0).abs() < 1e-12);
        assert!((range_rate(&clocked, &sat) - 2.0).abs() < 1e-12);
        // Moving +x at 1 m/s toward a sat on +x ⇒ closing ⇒ range-rate −1.
        let sat_x = Sat {
            pos: [10.0, 0.0, 0.0],
            vel: [0.0, 0.0, 0.0],
        };
        let moving = [0.0, 0.0, 0.0, 1.0, 0.0, 0.0, 0.0, 0.0];
        assert!((range_rate(&moving, &sat_x) - (-1.0)).abs() < 1e-12);
    }

    #[test]
    fn noiseless_full_geometry_converges_to_truth() {
        let sats = constellation();
        let mut nav = init_navigator();
        for step in 1..=60 {
            let t = step as f64;
            nav.propagate(1.0);
            let (pr, rr) = measurements(t, &sats);
            assert!(nav.update_gnss(&sats, &pr, &rr, 1.0, 0.05));
        }
        // Noiseless measurements + an exact process model + good geometry ⇒ the filter pulls onto
        // the truth. Well under a metre after a minute.
        let err = nav.position_error(truth_at(60.0));
        assert!(err < 1.0, "converged position error = {err} m");
    }

    #[test]
    fn tracks_with_fewer_than_four_satellites() {
        // Only THREE satellites — a snapshot PVT fix is under-determined, but the tightly-coupled
        // filter is still observable over time through its dynamics, so it converges.
        let sats = &constellation()[..3];
        let mut nav = init_navigator();
        for step in 1..=120 {
            let t = step as f64;
            nav.propagate(1.0);
            let (pr, rr) = measurements(t, sats);
            assert!(nav.update_gnss(sats, &pr, &rr, 1.0, 0.05));
        }
        // Converges from a ~212 m initial error to ~13 m on three satellites — looser than the
        // sub-metre five-satellite case (weaker geometry, fewer equations per epoch) but a real
        // fix where a four-unknown snapshot PVT cannot be formed at all.
        let err = nav.position_error(truth_at(120.0));
        assert!(err < 20.0, "sub-4-satellite position error = {err} m");
    }

    #[test]
    fn survives_120s_gnss_outage_within_50m() {
        let sats = constellation();
        let mut nav = init_navigator();
        let mut rng = ChaCha8Rng::seed_from_u64(0xC0FFEE);
        let n_pr = Normal::new(0.0, 1.0).unwrap(); // σ_ρ = 1 m
        let n_rr = Normal::new(0.0, 0.05).unwrap(); // σ_ρ̇ = 5 cm/s
                                                    // 60 s of noisy GNSS to converge the position and, crucially, the velocity.
        for step in 1..=60 {
            let t = step as f64;
            nav.propagate(1.0);
            let (mut pr, mut rr) = measurements(t, &sats);
            for v in pr.iter_mut() {
                *v += n_pr.sample(&mut rng);
            }
            for v in rr.iter_mut() {
                *v += n_rr.sample(&mut rng);
            }
            assert!(nav.update_gnss(&sats, &pr, &rr, 1.0, 0.05));
        }
        let converged = nav.position_error(truth_at(60.0));
        // Now a full 120-second outage: propagate only, no measurements.
        for step in 61..=180 {
            nav.propagate(1.0);
            let _ = step;
        }
        let after = nav.position_error(truth_at(180.0));
        // The acceptance criterion: position stays within 50 m through the 120-s coast — the
        // converged velocity carries the dead-reckoning.
        assert!(
            after < 50.0,
            "post-outage error = {after} m (converged was {converged} m)"
        );
    }
}
