// SPDX-License-Identifier: AGPL-3.0-only
//! Power-law ADEV **forward-synthesis round-trip**: generate synthetic power-law
//! phase noise with a *known* IEEE-1139 `h`-coefficient, run it through Kshana's
//! overlapping Allan deviation ([`kshana::allan::overlapping_adev`]), and confirm the
//! recovered `σ_y(τ)` matches the closed-form power-law forward model
//! ([`kshana::powerlaw::allan_deviation`]) — lifting the lunar clock rows from an
//! internal-consistency claim to a **Validated** round-trip.
//!
//! ## Oracle (why this is Validated, not just Modelled)
//! Two independent references agree here:
//!
//! 1. **AllanTools / Stable32 power-law generator semantics.** The canonical way to
//!    synthesise **white FM** (`α = 0`, `S_y(f) = h_0`) is: draw i.i.d. Gaussian
//!    fractional-frequency samples `y_k ~ N(0, σ_{y0}²)` at spacing `τ0`, then integrate
//!    to phase, `x_{k+1} = x_k + y_k·τ0` (AllanTools `noise.white` →
//!    `frequency2phase` = cumulative sum). The sample variance that makes the record a
//!    white-FM process with PSD level `h_0` is `σ_{y0}² = h_0 / (2 τ0)` — this is the
//!    documented white-FM ⇔ Allan-variance identity.
//! 2. **The closed-form power-law ADEV.** For white FM the Allan deviation is
//!    `σ_y(τ) = √(h_0 / (2 τ))` (IEEE Std 1139-2008; Riley, NIST SP 1065, §3), which
//!    Kshana computes analytically in `powerlaw::allan_deviation`.
//!
//! The test asserts that the *estimator* fed the *generated* record reproduces the
//! *forward model* to a few percent (finite-sample Allan-variance scatter, beaten down
//! by averaging the Allan **variance** over many seeded realisations), and that the
//! recovered curve carries the white-FM `τ^{-1/2}` slope.
//!
//! Scope (honest): white FM is the noise type the RAFS/miniRAFS lunar clock rows are
//! built from, and the one with unambiguous AllanTools generator semantics. The
//! flicker-FM **floor** used by the optical-master / PHM rows is validated separately by
//! the closed-form floor identity in `src/powerlaw.rs` (a flat `σ_y` cannot be
//! band-limited-synthesised without fractional integration, so it is not round-tripped
//! here). Everything below is seeded and deterministic.

use kshana::allan::overlapping_adev;
use kshana::powerlaw::{allan_deviation, PowerLaw};
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, Normal};

/// Synthesise a white-FM phase record `x_k` (seconds) with PSD level `h_0`, sampled at
/// `tau0`, length `n+1` (a leading zero phase). AllanTools semantics: i.i.d. Gaussian
/// fractional frequency with variance `h_0/(2 τ0)`, integrated to phase.
fn synth_white_fm_phase(h0: f64, tau0: f64, n: usize, rng: &mut ChaCha8Rng) -> Vec<f64> {
    let sigma_y0 = (h0 / (2.0 * tau0)).sqrt();
    let normal = Normal::new(0.0, sigma_y0).expect("finite, positive sigma");
    let mut x = Vec::with_capacity(n + 1);
    x.push(0.0);
    let mut acc = 0.0;
    for _ in 0..n {
        let y = normal.sample(rng);
        acc += y * tau0; // phase is the running integral of fractional frequency
        x.push(acc);
    }
    x
}

#[test]
fn white_fm_forward_synthesis_round_trips_through_overlapping_adev() {
    let h0 = 1.0e-22; // white-FM PSD level (≈ a full RAFS: σ_y(1 s) = √(h0/2) ≈ 7e-12)
    let tau0 = 1.0;
    let n = 1usize << 16; // 65 536 samples
    let seeds = 24u64;
    let ms = [1usize, 2, 4, 8, 16, 32, 64, 128, 256, 512, 1024];

    let p = PowerLaw {
        h_0: h0,
        ..Default::default()
    };

    // Average the Allan VARIANCE (unbiased) over independent seeded realisations, then take
    // the root — this drives the finite-sample scatter down without biasing the mean.
    let mut recovered = vec![0.0f64; ms.len()];
    for seed in 0..seeds {
        let mut rng = ChaCha8Rng::seed_from_u64(0xA11A_2026 + seed);
        let x = synth_white_fm_phase(h0, tau0, n, &mut rng);
        for (j, &m) in ms.iter().enumerate() {
            let adev = overlapping_adev(&x, tau0, m);
            recovered[j] += adev * adev;
        }
    }
    for r in recovered.iter_mut() {
        *r = (*r / seeds as f64).sqrt();
    }

    // Each recovered σ_y(τ) must match the closed-form forward model within a few percent.
    for (j, &m) in ms.iter().enumerate() {
        let tau = m as f64 * tau0;
        let theory = allan_deviation(&p, tau, 100.0);
        let rel = (recovered[j] - theory).abs() / theory;
        assert!(
            rel < 0.05,
            "τ={tau}: recovered σ_y={} vs forward-model {theory} (rel {rel})",
            recovered[j]
        );
    }

    // The recovered curve must carry the white-FM τ^{-1/2} log-log slope.
    let first = ms.first().map(|&m| (m as f64 * tau0).ln()).unwrap();
    let last = ms.last().map(|&m| (m as f64 * tau0).ln()).unwrap();
    let slope = (recovered.last().unwrap().ln() - recovered.first().unwrap().ln()) / (last - first);
    assert!(
        (slope + 0.5).abs() < 0.02,
        "recovered slope {slope} is not white-FM τ^{{-1/2}}"
    );
}

#[test]
fn generator_is_deterministic_for_a_fixed_seed() {
    // Determinism guard: the same seed reproduces the identical record bit-for-bit.
    let mut r1 = ChaCha8Rng::seed_from_u64(7);
    let mut r2 = ChaCha8Rng::seed_from_u64(7);
    let a = synth_white_fm_phase(1e-22, 1.0, 4096, &mut r1);
    let b = synth_white_fm_phase(1e-22, 1.0, 4096, &mut r2);
    assert_eq!(a, b);
}

#[test]
fn scaling_h0_scales_recovered_adev_by_its_square_root() {
    // Cross-check the generator↔model contract: σ_y ∝ √h_0. A 100× h_0 ⇒ 10× ADEV.
    let tau0 = 1.0;
    let n = 1usize << 15;
    let m = 16usize;
    let mut lo = 0.0f64;
    let mut hi = 0.0f64;
    let seeds = 16u64;
    for seed in 0..seeds {
        let mut r = ChaCha8Rng::seed_from_u64(0xBEEF + seed);
        let xl = synth_white_fm_phase(1e-22, tau0, n, &mut r);
        let mut r2 = ChaCha8Rng::seed_from_u64(0xBEEF + seed);
        let xh = synth_white_fm_phase(1e-20, tau0, n, &mut r2);
        let al = overlapping_adev(&xl, tau0, m);
        let ah = overlapping_adev(&xh, tau0, m);
        lo += al * al;
        hi += ah * ah;
    }
    let ratio = (hi / lo).sqrt();
    assert!((ratio - 10.0).abs() < 0.3, "σ_y ratio {ratio} ≠ 10 for 100× h_0");
}
