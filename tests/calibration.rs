use kshana::allan::overlapping_adev;
use kshana::models::{ClockModel, ErrorModel};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;

/// Simulate a pure white-FM clock (q_wf only) and return the phase samples (s).
fn simulate_phase(q_wf: f64, n: usize, seed: u64) -> Vec<f64> {
    let mut c = ClockModel::new("cal", "calibration", 0.0, q_wf, 0.0);
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut v = Vec::with_capacity(n);
    v.push(0.0);
    for _ in 1..n {
        c.step(1.0, &mut rng);
        v.push(c.phase());
    }
    v
}

#[test]
fn csac_white_fm_adev_matches_datasheet() {
    // Microchip SA65 / SA.45s CSAC datasheet: sigma_y(1 s) = 3.0e-10.
    // Calibration: q_wf = sigma_y(1s)^2.
    let target = 3.0e-10;
    let phase = simulate_phase(target * target, 8192, 7);
    let adev1 = overlapping_adev(&phase, 1.0, 1);
    let rel = (adev1 - target).abs() / target;
    assert!(rel < 0.2, "CSAC ADEV(1s)={adev1} vs target {target}, rel={rel}");
}

#[test]
fn optical_white_fm_adev_matches_soc_goal() {
    // ESA SOC Sr optical lattice clock, space goal (arXiv:1503.08457): sigma_y(1 s) = 1.0e-15.
    let target = 1.0e-15;
    let phase = simulate_phase(target * target, 8192, 7);
    let adev1 = overlapping_adev(&phase, 1.0, 1);
    let rel = (adev1 - target).abs() / target;
    assert!(rel < 0.2, "optical ADEV(1s)={adev1} vs target {target}, rel={rel}");
}
