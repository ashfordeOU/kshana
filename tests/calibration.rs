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
    assert!(
        rel < 0.2,
        "CSAC ADEV(1s)={adev1} vs target {target}, rel={rel}"
    );
}

#[test]
fn optical_white_fm_adev_matches_soc_goal() {
    // ESA SOC Sr optical lattice clock, space goal (arXiv:1503.08457): sigma_y(1 s) = 1.0e-15.
    let target = 1.0e-15;
    let phase = simulate_phase(target * target, 8192, 7);
    let adev1 = overlapping_adev(&phase, 1.0, 1);
    let rel = (adev1 - target).abs() / target;
    assert!(
        rel < 0.2,
        "optical ADEV(1s)={adev1} vs target {target}, rel={rel}"
    );
}

#[test]
fn csac_white_fm_adev_curve() {
    // White FM: sigma_y(tau) = sigma_y(1s)/sqrt(tau). Validate across the
    // CSAC datasheet curve (1, 10, 100 s) — datasheet: 3e-10, 1e-10, 3e-11.
    let s1 = 3.0e-10;
    let phase = simulate_phase(s1 * s1, 40000, 7);
    for &m in &[1usize, 10, 100] {
        let adev = overlapping_adev(&phase, 1.0, m);
        let target = s1 / (m as f64).sqrt();
        let rel = (adev - target).abs() / target;
        assert!(rel < 0.25, "tau={m}s adev={adev} target={target} rel={rel}");
    }
}

#[test]
fn random_walk_fm_adev_matches_tau_over_3() {
    // RWFM: sigma_y^2(tau) = q_rw * tau / 3. Average AVAR over seeds to cut scatter.
    use kshana::models::{ClockModel, ErrorModel};
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;
    let q_rw = 1.0e-24;
    let m = 50usize;
    let tau = m as f64;
    let n = 20000usize;
    let seeds = [1u64, 2, 3, 4, 5, 6, 7, 8];
    let mut var_sum = 0.0;
    for &seed in &seeds {
        let mut c = ClockModel::new("rw", "unit", 0.0, 0.0, q_rw);
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let mut phase = vec![0.0];
        for _ in 1..n {
            c.step(1.0, &mut rng);
            phase.push(c.phase());
        }
        let adev = overlapping_adev(&phase, 1.0, m);
        var_sum += adev * adev;
    }
    let avar_mean = var_sum / seeds.len() as f64;
    let adev_mean = avar_mean.sqrt();
    let expected = (q_rw * tau / 3.0).sqrt();
    let rel = (adev_mean - expected).abs() / expected;
    assert!(
        rel < 0.2,
        "RWFM adev_mean={adev_mean} expected={expected} rel={rel}"
    );
}

#[test]
fn flicker_fm_floor_is_flat_at_the_configured_level() {
    // Flicker (1/f) FM has a flat Allan-deviation floor: sigma_y(tau) is constant
    // across averaging time. The model's `with_flicker(sigma_floor)` is calibrated
    // to place that floor exactly at sigma_floor. Validate both the magnitude and
    // the flatness (the defining signature of flicker FM, distinct from white FM's
    // -1/2 slope and RWFM's +1/2 slope). Flicker is the noisiest to estimate, so
    // average the variance over seeds and across the flat band.
    use kshana::models::{ClockModel, ErrorModel};
    use rand::SeedableRng;
    use rand_chacha::ChaCha8Rng;

    let floor = 1.0e-13;
    let n = 30000usize;
    let seeds = [1u64, 2, 3, 4, 5, 6, 7, 8, 9, 10];
    // Sample the floor at three octave-separated taus well inside the band.
    let taus = [10usize, 40, 160];
    let mut band_var = [0.0f64; 3];
    for &seed in &seeds {
        let mut c = ClockModel::new("fl", "unit", 0.0, 0.0, 0.0).with_flicker(floor);
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let mut phase = vec![0.0];
        for _ in 1..n {
            c.step(1.0, &mut rng);
            phase.push(c.phase());
        }
        for (k, &m) in taus.iter().enumerate() {
            let a = overlapping_adev(&phase, 1.0, m);
            band_var[k] += a * a;
        }
    }
    let adev: Vec<f64> = band_var
        .iter()
        .map(|v| (v / seeds.len() as f64).sqrt())
        .collect();
    // Magnitude: each band point sits near the configured floor.
    for (k, &a) in adev.iter().enumerate() {
        let rel = (a - floor).abs() / floor;
        assert!(
            rel < 0.35,
            "flicker floor at tau={}s: adev={a} vs {floor}, rel={rel}",
            taus[k]
        );
    }
    // Flatness: the floor does not slope like white FM (-1/2) or RWFM (+1/2). Over
    // a 16x span in tau either of those would move ADEV by 4x; require well under.
    let ratio = adev[2] / adev[0];
    assert!(
        (0.6..1.6).contains(&ratio),
        "flicker floor not flat: adev ratio over 16x tau = {ratio}"
    );
}
