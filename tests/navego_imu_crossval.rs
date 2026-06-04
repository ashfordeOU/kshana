// SPDX-License-Identifier: Apache-2.0
//! Cross-validation of the Allan-variance IMU-noise pipeline against NaveGo.
//!
//! NaveGo (R. Gonzalez et al., an open-source MATLAB/Octave INS/GNSS toolbox,
//! `github.com/rodralez/NaveGo`, LGPL-3) ships an Allan-variance example
//! (`examples/allan-variance/navego_example_allan.m`) that characterises an IMU's
//! random-walk and bias-instability coefficients. Its recorded dataset is a 40 MB
//! MATLAB `.mat` file (a two-hour STIM300 static log), which is not ingested here;
//! instead this test reproduces NaveGo's *synthetic round-trip* — the second half
//! of the same example — against the **published reference noise profile of a
//! Microstrain 3DM-GX3-35** that the script hard-codes.
//!
//! The check is a convention/units cross-validation: NaveGo defines the velocity-
//! and angle-random-walk coefficients (VRW/ARW) as the white-noise root-PSD of the
//! sensor output, which equals the overlapping Allan deviation read at τ = 1 s on
//! the τ^(−1/2) slope. Driving our (NBS14/Stable32-validated) overlapping-ADEV
//! estimator with white sensor noise at NaveGo's published 1-σ levels must recover
//! those coefficients — i.e. `ADEV(1 s) = σ_white · √dt`. Agreement confirms our
//! Allan pipeline and NaveGo's noise-coefficient definitions are consistent.

use kshana::allan::overlapping_adev;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};

// Published reference profile of a Microstrain 3DM-GX3-35, copied from NaveGo's
// `navego_example_allan.m` (the `ustrain` struct). 1-σ white-noise levels:
const USTRAIN_A_STD: f64 = 0.006_431_879_322_535_99; // accel, m/s^2 (X axis)
const USTRAIN_G_STD: f64 = 0.002_723_917_383_107_47; // gyro, rad/s (X axis)
const FREQ_HZ: f64 = 100.0; // the example's IMU sampling frequency
const SEEDS: [u64; 6] = [1, 2, 3, 4, 5, 6];

/// Overlapping ADEV at τ = 1 s of a white-noise sensor output of 1-σ `sigma`,
/// sampled at `FREQ_HZ`, seed-averaged to cut the estimator's own scatter. The
/// white sensor output is integrated to "phase" so the rate-domain Allan deviation
/// follows the white-FM `coeff/√τ` law.
fn recovered_random_walk(sigma: f64) -> f64 {
    let dt = 1.0 / FREQ_HZ;
    let n = 360_000usize; // one hour at 100 Hz
    let m = (1.0 / dt).round() as usize; // τ = 1 s
    let mut var_sum = 0.0;
    for &seed in &SEEDS {
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let dist = Normal::new(0.0, sigma).unwrap();
        let mut phase = Vec::with_capacity(n + 1);
        let mut x = 0.0;
        phase.push(0.0);
        for _ in 0..n {
            x += dist.sample(&mut rng) * dt; // integrate rate → phase
            phase.push(x);
        }
        let a = overlapping_adev(&phase, dt, m);
        var_sum += a * a;
    }
    (var_sum / SEEDS.len() as f64).sqrt()
}

#[test]
fn allan_recovers_navego_microstrain_velocity_random_walk() {
    // NaveGo's VRW is the accelerometer white-noise root-PSD, σ_a·√dt.
    let expected = USTRAIN_A_STD * (1.0 / FREQ_HZ).sqrt();
    let got = recovered_random_walk(USTRAIN_A_STD);
    let rel = (got - expected).abs() / expected;
    assert!(
        rel < 0.05,
        "VRW recovered {got:.6e} vs NaveGo reference {expected:.6e} (rel {rel:.3})"
    );
}

#[test]
fn allan_recovers_navego_microstrain_angle_random_walk() {
    // NaveGo's ARW is the gyro white-noise root-PSD, σ_g·√dt.
    let expected = USTRAIN_G_STD * (1.0 / FREQ_HZ).sqrt();
    let got = recovered_random_walk(USTRAIN_G_STD);
    let rel = (got - expected).abs() / expected;
    assert!(
        rel < 0.05,
        "ARW recovered {got:.6e} vs NaveGo reference {expected:.6e} (rel {rel:.3})"
    );
}

#[test]
fn white_noise_region_has_the_minus_half_allan_slope() {
    // The coefficient is only meaningful if read on the white-noise (τ^−1/2)
    // branch; confirm the slope there is −1/2, matching NaveGo's identification.
    let dt = 1.0 / FREQ_HZ;
    let n = 360_000usize;
    let mut rng = ChaCha8Rng::seed_from_u64(42);
    let dist = Normal::new(0.0, USTRAIN_A_STD).unwrap();
    let mut phase = Vec::with_capacity(n + 1);
    let mut x = 0.0;
    phase.push(0.0);
    for _ in 0..n {
        x += dist.sample(&mut rng) * dt;
        phase.push(x);
    }
    // Octave-spaced τ in the white region (well below any bias-instability knee).
    let ms = [10usize, 20, 40, 80, 160];
    let pts: Vec<(f64, f64)> = ms
        .iter()
        .map(|&m| {
            (
                (m as f64 * dt).log10(),
                overlapping_adev(&phase, dt, m).log10(),
            )
        })
        .collect();
    let k = pts.len() as f64;
    let sx: f64 = pts.iter().map(|p| p.0).sum();
    let sy: f64 = pts.iter().map(|p| p.1).sum();
    let sxx: f64 = pts.iter().map(|p| p.0 * p.0).sum();
    let sxy: f64 = pts.iter().map(|p| p.0 * p.1).sum();
    let slope = (k * sxy - sx * sy) / (k * sxx - sx * sx);
    assert!(
        (slope + 0.5).abs() < 0.05,
        "white-noise Allan slope {slope:.3}, expected −0.5"
    );
}
