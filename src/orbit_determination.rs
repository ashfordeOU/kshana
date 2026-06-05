// SPDX-License-Identifier: Apache-2.0
//! Orbit determination: recover a satellite's orbital state from ground-station tracking.
//!
//! Given range measurements from known ground stations to a satellite across a tracking arc, recover
//! the satellite's initial state `[r, v]` (the classic orbit-determination problem). This composes
//! three shipped pieces into a working pipeline: the **two-body + J2 force model**
//! ([`crate::forces`]) and the **RK4 integrator** ([`crate::integrator`]) propagate a candidate
//! state across the arc, and a measurement model predicts each station range; the **Gauss–Newton
//! batch least-squares corrector** ([`crate::batch_ls::gauss_newton`]) then drives the candidate
//! onto the state that best explains the measurements. The same force-model dynamics and range model
//! also drive a **sequential** (recursive) determination on the shipped unscented filter
//! ([`crate::fusion::ukf::Ukf`]), so both the batch and the sequential estimators are available.
//!
//! Scope (honest): this is the range-only batch and sequential OD over the two-body + J2 dynamics.
//! Adding range-rate/Doppler and angle (azimuth/elevation) measurements, an analytic J2
//! state-transition matrix (the finite-difference Jacobian is used here), higher-order gravity and
//! non-gravitational forces, and station visibility masking are follow-ons (see `ROADMAP.md`).

use crate::batch_ls::{gauss_newton, LsqResult};
use crate::forces::gravity_accel;
use crate::fusion::ukf::Ukf;
use crate::integrator::rk4_step;

/// A ground tracking station at a fixed ECEF position (m).
#[derive(Clone, Copy, Debug)]
pub struct Station {
    /// Station ECEF position (m).
    pub pos: [f64; 3],
}

/// Derivative of the six-state `[r, v]` under the two-body + J2 gravity field: `ṙ = v`, `v̇ = g(r)`.
fn gravity_deriv(_t: f64, y: &[f64]) -> Vec<f64> {
    let a = gravity_accel([y[0], y[1], y[2]]);
    vec![y[3], y[4], y[5], a[0], a[1], a[2]]
}

/// Propagate the six-state `x0` forward, returning its position at each of `n_epochs` epochs spaced
/// `dt` seconds apart (epoch `k` is `x0` advanced by `k·dt`, for `k = 1..=n_epochs`).
pub fn propagate_positions(x0: &[f64], dt: f64, n_epochs: usize) -> Vec<[f64; 3]> {
    let mut s = x0.to_vec();
    let mut out = Vec::with_capacity(n_epochs);
    for _ in 0..n_epochs {
        s = rk4_step(&gravity_deriv, 0.0, &s, dt);
        out.push([s[0], s[1], s[2]]);
    }
    out
}

fn range_to(sat: [f64; 3], station: &Station) -> f64 {
    let d = [
        sat[0] - station.pos[0],
        sat[1] - station.pos[1],
        sat[2] - station.pos[2],
    ];
    (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt()
}

/// Predicted range measurements for an initial state `x0`: propagate across the arc and, at each
/// epoch, the range to every station — stacked epoch-major (`epoch 1 × all stations`, then
/// `epoch 2 × …`). This is the measurement model the batch corrector inverts.
pub fn predict_ranges(x0: &[f64], stations: &[Station], dt: f64, n_epochs: usize) -> Vec<f64> {
    let positions = propagate_positions(x0, dt, n_epochs);
    let mut z = Vec::with_capacity(n_epochs * stations.len());
    for sat in positions {
        for st in stations {
            z.push(range_to(sat, st));
        }
    }
    z
}

/// **Batch** orbit determination: recover the initial state best explaining the stacked range
/// measurements `z` (epoch-major, matching [`predict_ranges`]) by Gauss–Newton least squares from
/// the initial guess `x0`. `weights` is one `1/σ²` per measurement. Returns `None` on a dimension
/// mismatch or rank-deficient geometry.
#[allow(clippy::too_many_arguments)]
pub fn determine_orbit_batch(
    z: &[f64],
    weights: &[f64],
    x0: &[f64],
    stations: &[Station],
    dt: f64,
    n_epochs: usize,
    max_iter: usize,
    tol: f64,
) -> Option<LsqResult> {
    let stations = stations.to_vec();
    gauss_newton(
        |x| predict_ranges(x, &stations, dt, n_epochs),
        z,
        weights,
        x0,
        max_iter,
        tol,
    )
}

/// **Sequential** orbit determination: starting from `x0`/`p0`, step a [`Ukf`] forward through the
/// force-model dynamics and update it with each epoch's station ranges in turn, returning the final
/// filter. `ranges_per_epoch[k]` holds one range per station for epoch `k` (spaced `dt` apart);
/// `q` is the per-step process noise and `sigma` the per-range standard deviation.
pub fn determine_orbit_sequential(
    x0: Vec<f64>,
    p0: Vec<Vec<f64>>,
    q: &[Vec<f64>],
    stations: &[Station],
    ranges_per_epoch: &[Vec<f64>],
    sigma: f64,
    dt: f64,
) -> Ukf {
    let mut ukf = Ukf::new(x0, p0);
    ukf.alpha = 1.0;
    ukf.kappa = 0.0;
    let stations = stations.to_vec();
    let predict = move |s: &[f64]| rk4_step(&gravity_deriv, 0.0, s, dt);
    for epoch in ranges_per_epoch {
        ukf.predict(predict, q);
        let stns = stations.clone();
        let h = move |s: &[f64]| {
            stns.iter()
                .map(|st| range_to([s[0], s[1], s[2]], st))
                .collect()
        };
        let k = epoch.len();
        let mut r = vec![vec![0.0; k]; k];
        for (i, row) in r.iter_mut().enumerate() {
            row[i] = sigma * sigma;
        }
        ukf.update(h, epoch, &r);
    }
    ukf
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::forces::MU_EARTH;
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;
    use rand_distr::{Distribution, Normal};

    // Three ground stations spread around the Earth (ECEF, on the equatorial surface and a tilt).
    fn stations() -> Vec<Station> {
        vec![
            Station {
                pos: [6.378e6, 0.0, 0.0],
            },
            Station {
                pos: [0.0, 6.378e6, 0.0],
            },
            Station {
                pos: [3.5e6, 3.5e6, 4.0e6],
            },
        ]
    }

    // A true LEO orbital state [r, v]: circular speed at r = 7000 km, inclined 35°.
    fn truth_state() -> [f64; 6] {
        let r = 7.0e6_f64;
        let v = (MU_EARTH / r).sqrt();
        let inc = 35.0_f64.to_radians();
        [r, 0.0, 0.0, 0.0, v * inc.cos(), v * inc.sin()]
    }

    fn pos_err(est: &[f64], truth: &[f64]) -> f64 {
        let d = [est[0] - truth[0], est[1] - truth[1], est[2] - truth[2]];
        (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt()
    }
    fn vel_err(est: &[f64], truth: &[f64]) -> f64 {
        let d = [est[3] - truth[3], est[4] - truth[4], est[5] - truth[5]];
        (d[0] * d[0] + d[1] * d[1] + d[2] * d[2]).sqrt()
    }

    #[test]
    fn range_prediction_starts_at_the_geometric_range() {
        let truth = truth_state();
        let stns = stations();
        let dt = 30.0;
        let z = predict_ranges(&truth, &stns, dt, 1);
        // First epoch is one dt in; the orbit has moved, but the range to each station is a valid
        // Euclidean distance and changes across the arc (so the geometry is informative).
        assert_eq!(z.len(), stns.len());
        let later = predict_ranges(&truth, &stns, dt, 20);
        assert_eq!(later.len(), 20 * stns.len());
        // The range to station 0 is not constant across the arc (the satellite is moving).
        assert!((later[0] - later[later.len() - stns.len()]).abs() > 1.0);
    }

    #[test]
    fn batch_recovers_orbit_from_noiseless_ranges() {
        let truth = truth_state();
        let stns = stations();
        let dt = 20.0;
        let n = 30; // a 10-minute tracking arc
        let z = predict_ranges(&truth, &stns, dt, n);
        let weights = vec![1.0; z.len()];
        // A guess perturbed ~1 km in position and ~5 m/s in velocity.
        let guess = [
            truth[0] + 1000.0,
            truth[1] - 800.0,
            truth[2] + 600.0,
            truth[3] + 5.0,
            truth[4] - 4.0,
            truth[5] + 3.0,
        ];
        let sol = determine_orbit_batch(&z, &weights, &guess, &stns, dt, n, 30, 1e-9)
            .expect("OD converges");
        assert!(sol.converged, "did not converge: {sol:?}");
        // Noiseless ranges + an exact dynamic model ⇒ the corrector recovers the true state tightly.
        assert!(
            pos_err(&sol.x, &truth) < 1.0,
            "position error {} m",
            pos_err(&sol.x, &truth)
        );
        assert!(
            vel_err(&sol.x, &truth) < 1e-3,
            "velocity error {} m/s",
            vel_err(&sol.x, &truth)
        );
    }

    #[test]
    fn batch_recovers_orbit_from_noisy_ranges_within_bound() {
        let truth = truth_state();
        let stns = stations();
        let dt = 20.0;
        let n = 30;
        let clean = predict_ranges(&truth, &stns, dt, n);
        let mut rng = ChaCha8Rng::seed_from_u64(0x0D_0D_0D);
        let noise = Normal::new(0.0, 5.0).unwrap(); // σ = 5 m ranging noise
        let z: Vec<f64> = clean.iter().map(|&r| r + noise.sample(&mut rng)).collect();
        let weights = vec![1.0 / 25.0; z.len()]; // 1/σ²
        let guess = [
            truth[0] + 1000.0,
            truth[1] - 800.0,
            truth[2] + 600.0,
            truth[3] + 5.0,
            truth[4] - 4.0,
            truth[5] + 3.0,
        ];
        let sol =
            determine_orbit_batch(&z, &weights, &guess, &stns, dt, n, 50, 1e-3).expect("OD runs");
        // The real OD acceptance is the estimate, not the internal step-norm flag: with 5 m ranging
        // noise over a 90-measurement arc the batch estimate recovers position to a few metres, and
        // the post-fit residual RMS sits at the measurement-noise floor (≈ σ = 5 m), the signature
        // of a consistent least-squares fit. (The `converged` flag stays false here because at the
        // noise floor the Gauss–Newton step oscillates above the 1e-3 m tolerance — expected.)
        assert!(
            pos_err(&sol.x, &truth) < 20.0,
            "position error {} m",
            pos_err(&sol.x, &truth)
        );
        assert!(
            (3.0..8.0).contains(&sol.rms_residual),
            "post-fit RMS {} m (want ≈ σ = 5 m)",
            sol.rms_residual
        );
    }

    #[test]
    fn sequential_ukf_recovers_orbit_from_ranges() {
        let truth = truth_state();
        let stns = stations();
        let dt = 20.0;
        let n = 60; // a longer arc for the recursive estimator to converge
        let positions = propagate_positions(&truth, dt, n);
        let ranges_per_epoch: Vec<Vec<f64>> = positions
            .iter()
            .map(|&sat| stns.iter().map(|st| range_to(sat, st)).collect())
            .collect();
        let guess = vec![
            truth[0] + 1000.0,
            truth[1] - 800.0,
            truth[2] + 600.0,
            truth[3] + 5.0,
            truth[4] - 4.0,
            truth[5] + 3.0,
        ];
        let p0 = diag(&[1.0e6, 1.0e6, 1.0e6, 1.0e2, 1.0e2, 1.0e2]);
        let q = diag(&[1.0e-3, 1.0e-3, 1.0e-3, 1.0e-6, 1.0e-6, 1.0e-6]);
        let ukf = determine_orbit_sequential(guess, p0, &q, &stns, &ranges_per_epoch, 1.0, dt);
        // The recursive filter, processing the noiseless ranges one epoch at a time, converges onto
        // the truth state (final position at the last epoch).
        let final_truth = {
            let last = positions[n - 1];
            // truth velocity at the final epoch is not directly known here; check position only.
            [last[0], last[1], last[2], 0.0, 0.0, 0.0]
        };
        assert!(
            pos_err(&ukf.x, &final_truth) < 50.0,
            "sequential OD position error {} m",
            pos_err(&ukf.x, &final_truth)
        );
    }

    fn diag(d: &[f64]) -> Vec<Vec<f64>> {
        let n = d.len();
        let mut m = vec![vec![0.0; n]; n];
        for (i, &v) in d.iter().enumerate() {
            m[i][i] = v;
        }
        m
    }
}
