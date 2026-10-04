// SPDX-License-Identifier: AGPL-3.0-only
//! Front-end and mitigation DSP stages (`kshana::iq::frontend`): each stage against its
//! design specification, a closed form or a published value, and chunked processing
//! against one-shot processing. Inputs are generic test signals (tones, seeded Gaussian
//! noise, hand-built threshold vectors), not models of any device.

use kshana::iq::frontend::agc::Agc;
use kshana::iq::frontend::blank::PulseBlanker;
use kshana::iq::frontend::fdaf::FreqExcision;
use kshana::iq::frontend::fir::{self, Fir};
use kshana::iq::frontend::iir::{Biquad, BiquadCascade};
use kshana::iq::frontend::notch::AdaptiveNotch;
use kshana::iq::frontend::quant::{correlation_loss_db, optimum_step_sigma, Quantiser};
use kshana::iq::frontend::{Chain, Stage};
use kshana::iq::Cf64;
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use rand_distr::{Distribution, StandardNormal};
use std::f64::consts::PI;

/// Circular complex Gaussian noise with `sigma` per component.
fn noise(n: usize, sigma: f64, seed: u64) -> Vec<Cf64> {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    (0..n)
        .map(|_| {
            let re: f64 = StandardNormal.sample(&mut rng);
            let im: f64 = StandardNormal.sample(&mut rng);
            Cf64::new(sigma * re, sigma * im)
        })
        .collect()
}

fn tone(n: usize, amp: f64, f_norm: f64) -> Vec<Cf64> {
    (0..n)
        .map(|k| {
            let ph = 2.0 * PI * f_norm * k as f64;
            Cf64::new(amp * ph.cos(), amp * ph.sin())
        })
        .collect()
}

fn add(a: &[Cf64], b: &[Cf64]) -> Vec<Cf64> {
    a.iter().zip(b).map(|(&x, &y)| x + y).collect()
}

fn power(x: &[Cf64]) -> f64 {
    x.iter().map(|z| z.re * z.re + z.im * z.im).sum::<f64>() / x.len() as f64
}

fn db(x: f64) -> f64 {
    10.0 * x.log10()
}

/// Run `make()` once over `x` in one call and once over seeded random chunk sizes;
/// assert bit-identical output.
fn assert_chunked_equals_one_shot<S: Stage>(make: impl Fn() -> S, x: &[Cf64], seed: u64) {
    let mut one = x.to_vec();
    make().process(&mut one);
    let mut chunked = x.to_vec();
    let mut s = make();
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let mut i = 0;
    while i < chunked.len() {
        let len = rng.gen_range(0..=300).min(chunked.len() - i);
        s.process(&mut chunked[i..i + len]);
        i += len;
    }
    assert_eq!(one, chunked, "chunked output differs from one-shot output");
}

// ───────────────────────────── FIR ─────────────────────────────

/// Worst passband deviation `max | |H| − 1 |` and worst stopband gain `max |H|` over a
/// fine frequency grid of the designed taps.
fn sweep(taps: &[Cf64], fs: f64, pass: &[(f64, f64)], stop: &[(f64, f64)]) -> (f64, f64) {
    let grid = |(a, b): (f64, f64)| (0..=2000).map(move |k| a + (b - a) * k as f64 / 2000.0);
    let dev = pass
        .iter()
        .flat_map(|&r| grid(r))
        .map(|f| (fir::freq_response(taps, f, fs).abs() - 1.0).abs())
        .fold(0.0, f64::max);
    let leak = stop
        .iter()
        .flat_map(|&r| grid(r))
        .map(|f| fir::freq_response(taps, f, fs).abs())
        .fold(0.0, f64::max);
    (dev, leak)
}

/// Kaiser-window low-pass: the coefficients' own response meets the stated stopband
/// attenuation and the equal-ripple passband bound `δ = 10^(−A/20)` (Kaiser 1974; Oppenheim
/// & Schafer §7.6). Kaiser's order formula is empirical, so the check allows the ripple to
/// reach 1.5δ (0.5 dB below the stated attenuation in the stopband) and no more.
#[test]
fn fir_lowpass_meets_its_kaiser_specification() {
    for &(atten, pass, stop) in &[
        (60.0, 1.0e6, 1.25e6),
        (40.0, 0.5e6, 0.9e6),
        (80.0, 1.5e6, 1.7e6),
    ] {
        let fs = 4.0e6;
        let d = fir::lowpass(fs, pass, stop, atten);
        assert_eq!(d.taps.len() % 2, 1);
        assert!(d.taps.iter().all(|h| h.im == 0.0));
        let delta = d.ripple();
        let (dev, leak) = sweep(
            &d.taps,
            fs,
            &[(-pass, pass)],
            &[(stop, fs / 2.0), (-fs / 2.0, -stop)],
        );
        assert!(
            dev <= 1.5 * delta,
            "A={atten}: passband deviation {dev:e} vs δ={delta:e}"
        );
        assert!(
            -20.0 * leak.log10() >= atten - 20.0 * 1.5f64.log10(),
            "A={atten}: stopband {:.2} dB",
            20.0 * leak.log10()
        );
        // Passband ripple in dB is within ±20·log10(1 + 1.5δ).
        let ripple_db = 20.0 * (1.0 + dev).log10();
        assert!(ripple_db <= 20.0 * (1.0 + 1.5 * delta).log10());
    }
}

/// Kaiser's β formula at its published breakpoints and the I0 series against tabulated
/// values (Abramowitz & Stegun table 9.8: I0(1) = 1.266065878, I0(5) = 27.23987182).
#[test]
fn kaiser_beta_and_bessel_i0_match_published_values() {
    assert!((fir::bessel_i0(0.0) - 1.0).abs() < 1e-15);
    assert!((fir::bessel_i0(1.0) - 1.266_065_878).abs() < 1e-9);
    assert!((fir::bessel_i0(5.0) - 27.239_871_82).abs() < 1e-7);
    assert_eq!(fir::kaiser_beta(20.0), 0.0);
    assert!((fir::kaiser_beta(60.0) - 0.1102 * 51.3).abs() < 1e-12);
    assert!((fir::kaiser_beta(50.0) - (0.5842 * 29f64.powf(0.4) + 0.07886 * 29.0)).abs() < 1e-12);
    let w = fir::kaiser_window(21, 6.0);
    assert!((w[10] - 1.0).abs() < 1e-15);
    assert!((w[0] - 1.0 / fir::bessel_i0(6.0)).abs() < 1e-15);
    assert!((w[3] - w[17]).abs() < 1e-15);
}

/// Complex band-pass: passes the stated (asymmetric) band and rejects both its mirror image
/// and the rest of the band, to the same Kaiser bound.
#[test]
fn fir_complex_bandpass_passes_only_its_band() {
    let fs = 8.0e6;
    let (lo, hi, tw, atten) = (0.5e6, 2.5e6, 0.4e6, 60.0);
    let d = fir::bandpass(fs, lo, hi, tw, atten);
    let delta = d.ripple();
    let (dev, leak) = sweep(
        &d.taps,
        fs,
        &[(lo, hi)],
        &[(-fs / 2.0, lo - tw), (hi + tw, fs / 2.0)],
    );
    assert!(dev <= 1.5 * delta, "passband deviation {dev:e}");
    assert!(20.0 * leak.log10() <= -(atten - 20.0 * 1.5f64.log10()));
    // The mirror of the band centre is deep in the stopband.
    assert!(fir::freq_response(&d.taps, -1.5e6, fs).abs() < 1.5 * delta);
}

/// The streaming filter realises the designed response: a tone's steady-state output is
/// the input times `H(f)` evaluated from the taps.
#[test]
fn fir_streaming_output_matches_the_coefficient_response() {
    let fs = 4.0e6;
    let d = fir::bandpass(fs, -0.2e6, 1.0e6, 0.3e6, 50.0);
    for &f in &[0.4e6, 1.05e6, -0.6e6, 1.6e6] {
        let x = tone(4000, 1.0, f / fs);
        let mut y = x.clone();
        Fir::from_design(&d).process(&mut y);
        let h = fir::freq_response(&d.taps, f, fs);
        for k in d.taps.len()..x.len() {
            let want = x[k] * h;
            assert!((y[k].re - want.re).abs() < 1e-12 && (y[k].im - want.im).abs() < 1e-12);
        }
    }
}

#[test]
fn fir_chunked_equals_one_shot() {
    let d = fir::lowpass(2.0e6, 0.3e6, 0.5e6, 60.0);
    let x = noise(5000, 1.0, 11);
    assert_chunked_equals_one_shot(|| Fir::from_design(&d), &x, 12);
}

// ───────────────────────────── IIR ─────────────────────────────

/// The Q = 1/√2 low-pass is the bilinear second-order Butterworth: its coefficient
/// response equals `1/√(1 + (tan(ω/2)/tan(ω₀/2))⁴)` (closed form) at every frequency.
#[test]
fn biquad_lowpass_is_the_bilinear_butterworth() {
    let (fs, f0) = (1.0e6, 0.12e6);
    let b = Biquad::lowpass(fs, f0, std::f64::consts::FRAC_1_SQRT_2);
    assert!(b.is_stable());
    let t0 = (PI * f0 / fs).tan();
    for k in 0..400 {
        let f = (k as f64 + 0.5) / 400.0 * 0.499 * fs;
        let r = (PI * f / fs).tan() / t0;
        let want = 1.0 / (1.0 + r.powi(4)).sqrt();
        assert!((b.response(f, fs).abs() - want).abs() < 1e-12, "f={f}");
    }
    assert!((20.0 * b.response(f0, fs).abs().log10() + 3.0103).abs() < 1e-3);
}

/// Notch, high-pass and band-pass sections: zeros and unit gains where the designs put
/// them.
#[test]
fn biquad_notch_highpass_bandpass_meet_their_design() {
    let fs = 1.0e6;
    let n = Biquad::notch(fs, 0.2e6, 5.0);
    assert!(n.response(0.2e6, fs).abs() < 1e-12);
    assert!((n.response(0.0, fs).abs() - 1.0).abs() < 1e-12);
    assert!((n.response(0.5e6, fs).abs() - 1.0).abs() < 1e-12);
    let h = Biquad::highpass(fs, 0.1e6, 0.8);
    assert!(h.response(0.0, fs).abs() < 1e-12);
    assert!((h.response(0.5e6, fs).abs() - 1.0).abs() < 1e-12);
    let p = Biquad::bandpass(fs, 0.15e6, 3.0);
    assert!((p.response(0.15e6, fs).abs() - 1.0).abs() < 1e-12);
    assert!(p.response(0.0, fs).abs() < 1e-12);
    for s in [n, h, p] {
        assert!(s.is_stable());
    }
}

/// A tone through the streaming cascade settles to the input times the product of the
/// sections' responses; chunked processing equals one-shot.
#[test]
fn biquad_cascade_streaming_matches_response_and_is_chunk_invariant() {
    let fs = 1.0e6;
    let c = BiquadCascade::new(vec![
        Biquad::lowpass(fs, 0.2e6, 0.54),
        Biquad::lowpass(fs, 0.2e6, 1.31),
        Biquad::notch(fs, 0.05e6, 4.0),
    ]);
    let f = 0.13e6;
    let x = tone(6000, 1.0, f / fs);
    let mut y = x.clone();
    c.clone().process(&mut y);
    let h = c.response(f, fs);
    for k in 5000..6000 {
        let want = x[k] * h;
        assert!((y[k].re - want.re).abs() < 1e-9 && (y[k].im - want.im).abs() < 1e-9);
    }
    assert_chunked_equals_one_shot(|| c.clone(), &noise(4000, 1.0, 21), 22);
}

// ───────────────────────────── Quantiser ─────────────────────────────

/// Closed-form correlation loss against the published values (Van Vleck & Middleton 1966;
/// Chang 1982; Hegarty 2011): one bit `10·log10(π/2)` = 1.96 dB; two bits 0.55 dB at a
/// threshold of about 1.0σ; three bits 0.17 dB; 8 and 14 bits negligible.
#[test]
fn quantiser_loss_matches_published_values() {
    let one = correlation_loss_db(1, 1.0);
    assert!((one - 10.0 * (PI / 2.0).log10()).abs() < 1e-12);
    assert!((one - 1.96).abs() < 0.005);
    let (t2, l2) = optimum_step_sigma(2);
    assert!((l2 - 0.55).abs() < 0.01, "2-bit loss {l2}");
    assert!((t2 - 1.0).abs() < 0.02, "2-bit threshold {t2}σ");
    let (_, l3) = optimum_step_sigma(3);
    assert!((l3 - 0.17).abs() < 0.01, "3-bit loss {l3}");
    assert!(optimum_step_sigma(8).1 < 0.01);
    assert!(optimum_step_sigma(14).1 < 1e-4);
}

/// Monte Carlo through the streaming quantiser, on seeded unit Gaussian noise `n`: the
/// weak-signal SNR ratio is `((E[Q(n + a)] − E[Q(n − a)])/2a)² / E[Q(n)²]` (the unquantised
/// correlator scores 1), estimated with the same noise for `+a` and `−a` so only samples
/// near a threshold contribute to the difference. It agrees with the closed form within
/// 0.05 dB, so the published 1.96 / 0.55 / 0.17 dB values hold for the implementation, not
/// just the formula; a mistuned 2-bit step is checked too.
#[test]
fn quantiser_measured_snr_loss_matches_the_closed_form() {
    let n = 2_000_000;
    let a = 0.05;
    let x = noise(n, 1.0, 31);
    let shift = |d: f64| -> Vec<Cf64> { x.iter().map(|z| Cf64::new(z.re + d, z.im + d)).collect() };
    for (bits, step) in [
        (1, 1.0),
        (2, optimum_step_sigma(2).0),
        (3, optimum_step_sigma(3).0),
        (2, 0.6),
    ] {
        let mut q = Quantiser::new(bits, step);
        let (mut up, mut down, mut zero) = (shift(a), shift(-a), x.clone());
        q.process(&mut up);
        q.process(&mut down);
        q.process(&mut zero);
        let slope = up
            .iter()
            .zip(&down)
            .map(|(u, d)| (u.re - d.re) + (u.im - d.im))
            .sum::<f64>()
            / (2.0 * n as f64 * 2.0 * a);
        let pw = zero.iter().map(|z| z.re * z.re + z.im * z.im).sum::<f64>() / (2.0 * n as f64);
        let loss = -db(slope * slope / pw);
        let want = correlation_loss_db(bits, step);
        assert!(
            (loss - want).abs() < 0.05,
            "{bits}-bit step {step}: measured {loss:.3} dB, closed form {want:.3} dB"
        );
    }
}

#[test]
fn quantiser_levels_and_saturation() {
    let q = Quantiser::new(2, 1.0);
    assert_eq!(q.levels(), 4);
    assert_eq!(
        [-5.0, -1.5, -0.2, 0.0, 0.7, 1.0, 9.0].map(|x| q.quantise(x)),
        [-1.5, -1.5, -0.5, 0.5, 0.5, 1.5, 1.5]
    );
    let q1 = Quantiser::new(1, 2.0);
    assert_eq!([-0.1, 0.1].map(|x| q1.quantise(x)), [-1.0, 1.0]);
    let q14 = Quantiser::new(14, 1e-3);
    assert_eq!(q14.code(1e9), 8191);
    assert_eq!(q14.code(-1e9), -8192);
    assert!((q14.quantise(0.123_456) - 0.123_456).abs() <= 0.5e-3);
    let q8 = Quantiser::new(8, 0.25);
    let mut v = vec![Cf64::new(0.3, -0.3), Cf64::new(100.0, -100.0)];
    q8.clone().process(&mut v);
    assert_eq!(
        v,
        vec![Cf64::new(0.375, -0.375), Cf64::new(31.875, -31.875)]
    );
}

// ───────────────────────────── AGC ─────────────────────────────

/// After a 10 dB step in input level the AGC gain error decays as `exp(−t/τ)` (in dB), so
/// it is inside 1 dB after `τ·ln 10` (closed form for the first-order loop); the settled
/// output power is the target within 0.1 dB.
#[test]
fn agc_settles_with_its_time_constant_to_the_target_level() {
    let fs = 1.0e6;
    let tau = 2.0e-3;
    let target = 0.5;
    let n0 = 20_000;
    let n1 = 60_000;
    let mut x = noise(n0, 1.0, 41);
    x.extend(noise(n1, 10f64.sqrt(), 42));
    let mut agc = Agc::new(fs, tau, target, 0.5);
    let mut gain_db = Vec::with_capacity(x.len());
    let mut y = x.clone();
    for s in y.chunks_mut(1) {
        agc.process(s);
        gain_db.push(agc.gain_db());
    }
    // Settled before the step: gain² · 2 = target.
    let want0 = 10.0 * (target / 2.0).log10();
    let want1 = want0 - 10.0;
    assert!((gain_db[n0 - 1] - want0).abs() < 0.5);
    // Settling time to within 1 dB of the new level, from a smoothed gain trace.
    let smooth = |k: usize| gain_db[k - 50..k + 50].iter().sum::<f64>() / 100.0;
    let k1 = (n0 + 50..x.len() - 50)
        .find(|&k| smooth(k) - want1 < 1.0)
        .unwrap();
    let t_settle = (k1 - n0) as f64 / fs;
    let t_want = tau * 10f64.ln();
    assert!(
        (t_settle / t_want - 1.0).abs() < 0.15,
        "settled in {t_settle:e} s, closed form {t_want:e} s"
    );
    // Settled output power.
    let p = power(&y[n0 + 40_000..]);
    assert!(db(p / target).abs() < 0.1, "output power {p}");
    assert_chunked_equals_one_shot(|| Agc::new(fs, tau, target, 0.5), &x[..20_000], 43);
}

/// AGC ahead of a 2-bit quantiser holds the loss at the published 0.55 dB optimum for an
/// arbitrary input level.
#[test]
fn agc_driven_two_bit_quantiser_sits_at_the_optimum_loss() {
    let q = Quantiser::new(2, 1.0);
    let fs = 1.0e6;
    let n = 1_500_000;
    let a = 0.05 * 37.0;
    let x = noise(n, 37.0, 51);
    let mut rng = ChaCha8Rng::seed_from_u64(52);
    let chips: Vec<f64> = (0..n)
        .map(|_| if rng.gen::<bool>() { 1.0 } else { -1.0 })
        .collect();
    let rx: Vec<Cf64> = x
        .iter()
        .zip(&chips)
        .map(|(z, &c)| Cf64::new(z.re + a * c, z.im))
        .collect();
    let mut y = rx.clone();
    Chain::new()
        .push(Agc::for_quantiser(&q, fs, 1.0e-3))
        .push(q)
        .process(&mut y);
    let skip = 20_000;
    let snr = |y: &[Cf64]| {
        let v: Vec<f64> = y[skip..]
            .iter()
            .zip(&chips[skip..])
            .map(|(z, &c)| z.re * c)
            .collect();
        let m = v.iter().sum::<f64>() / v.len() as f64;
        let var = v.iter().map(|u| (u - m) * (u - m)).sum::<f64>() / v.len() as f64;
        m * m / var
    };
    let loss = db(snr(&rx) / snr(&y));
    assert!((loss - 0.55).abs() < 0.12, "loss {loss:.3} dB");
}

// ───────────────────────────── Mitigation ─────────────────────────────

/// A pure sinusoid in Gaussian noise: the notch's zero converges to the tone frequency
/// (the injected truth) and the tone is removed from the output, leaving the noise.
#[test]
fn adaptive_notch_converges_on_a_tone_in_noise() {
    let fs = 1.0e6;
    for &(f, z0) in &[
        (123_400.0, Cf64::default()),
        (-301_000.0, Cf64::new(0.0, 0.5)),
    ] {
        let n = 40_000;
        let sigma = 0.1f64.sqrt() / 2f64.sqrt(); // noise power 0.1
        let nz = noise(n, sigma, 61);
        let x = add(&tone(n, 3.0, f / fs), &nz);
        let mut notch = AdaptiveNotch::new(0.9, 0.01, z0);
        let mut y = x.clone();
        notch.process(&mut y);
        let f_est = notch.frequency_hz(fs);
        assert!((f_est - f).abs() < 1e-3 * fs, "f={f}: estimate {f_est}");
        assert!(
            notch.gain_at(f, fs) < 0.05,
            "depth at the tone {}",
            notch.gain_at(f, fs)
        );
        let p_out = power(&y[n - 8192..]);
        let p_noise = power(&nz[n - 8192..]);
        // Tone power is 9; the output keeps the noise and at most a little of the tone.
        assert!(p_out < 1.5 * p_noise, "out {p_out}, noise {p_noise}");
        assert!(db(9.0 / p_out) > 17.0);
        assert_chunked_equals_one_shot(|| AdaptiveNotch::new(0.9, 0.01, z0), &x[..8000], 62);
    }
}

/// A hand-built threshold test vector: exactly the samples above the threshold and the
/// `hold` after each are zeroed, the hold restarts on a new exceedance and carries across
/// block boundaries.
#[test]
fn pulse_blanker_zeroes_exceedances_and_their_hold() {
    let mags = [
        0.1, 0.2, 5.0, 0.1, 0.1, 0.1, 0.1, 0.3, 2.0, 0.1, 3.0, 0.1, 0.1, 0.1, 1.0, 0.1,
    ];
    // Threshold 1.0 (strict), hold 2.
    let blanked = [0, 0, 1, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0];
    let x: Vec<Cf64> = mags
        .iter()
        .enumerate()
        .map(|(k, &m)| Cf64::new(0.0, m) * if k % 2 == 0 { 1.0 } else { -1.0 })
        .collect();
    for chunk in [1, 3, 16] {
        let mut b = PulseBlanker::new(1.0, 2);
        let mut y = x.clone();
        for c in y.chunks_mut(chunk) {
            b.process(c);
        }
        for k in 0..x.len() {
            let want = if blanked[k] == 1 {
                Cf64::default()
            } else {
                x[k]
            };
            assert_eq!(y[k], want, "sample {k}, chunk {chunk}");
        }
        assert_eq!(b.blanked(), 8);
        assert!((b.blanking_duty() - 0.5).abs() < 1e-15);
    }
}

/// With nothing excised the overlapped analysis-synthesis reconstructs the input exactly,
/// delayed by `N − 1` samples (the sine-window pair satisfies `sin² + cos² = 1`).
#[test]
fn freq_excision_reconstructs_the_input_when_nothing_is_excised() {
    let n = 64;
    let x = noise(3000, 1.0, 71);
    let mut fe = FreqExcision::new(n, 1e-15);
    let mut y = x.clone();
    fe.process(&mut y);
    assert_eq!(fe.bins_excised(), 0);
    let d = fe.delay();
    assert!(y[..d].iter().all(|z| *z == Cf64::default()));
    for k in d..x.len() {
        assert!((y[k].re - x[k - d].re).abs() < 1e-12 && (y[k].im - x[k - d].im).abs() < 1e-12);
    }
    assert_chunked_equals_one_shot(|| FreqExcision::new(n, 1e-15), &x, 72);
}

/// On noise only, the fraction of bins excised is the stated `p_fa` (closed form: an
/// exponential `|X_k|²` exceeds `−ln(p_fa)` times its mean with probability `p_fa`), to
/// within 10% (the frame-median floor estimate adds a few per cent).
#[test]
fn freq_excision_noise_only_false_excision_rate_is_pfa() {
    let n = 1024;
    let pfa = 0.01;
    let mut x = noise(400 * n / 2, 2.0, 81);
    let mut fe = FreqExcision::new(n, pfa);
    fe.process(&mut x);
    let rate = fe.bins_excised() as f64 / (fe.frames() as f64 * n as f64);
    assert!((rate / pfa - 1.0).abs() < 0.1, "rate {rate}");
}

/// A strong tone in noise (on and off a bin centre) is cut by more than 30 dB while the
/// noise passes; chunked equals one-shot.
#[test]
fn freq_excision_removes_a_strong_tone() {
    let n = 256;
    let len = 60_000;
    let nz = noise(len, 0.5f64.sqrt(), 91); // noise power 1
    for &f in &[32.0 / n as f64, 0.1713, -0.3301] {
        let tn = tone(len, 10.0, f); // 20 dB above the total noise power
        let x = add(&tn, &nz);
        let mut fe = FreqExcision::new(n, 1e-4);
        let mut y = x.clone();
        fe.process(&mut y);
        let d = fe.delay();
        // Tone left in the output: project onto the (delayed) tone.
        let range = 2 * n..len;
        let proj = range.clone().fold(Cf64::default(), |acc, k| {
            acc + y[k] * Cf64::new(tn[k - d].re, -tn[k - d].im)
        });
        let a_out = proj.abs() / (range.len() as f64 * 10.0);
        assert!(
            20.0 * (a_out / 10.0).log10() < -30.0,
            "f={f}: residual {a_out}"
        );
        // The noise passes: output power close to the noise power (a few bins removed).
        let p = power(&y[range]);
        assert!(p > 0.8 && p < 1.1, "f={f}: output power {p}");
    }
    assert_chunked_equals_one_shot(
        || FreqExcision::new(n, 1e-4),
        &add(&tone(5000, 10.0, 0.1713), &nz[..5000]),
        92,
    );
}

/// The whole front end as one chain: same seed gives bit-identical output, and chunked
/// processing equals one-shot.
#[test]
fn full_chain_is_deterministic_and_chunk_invariant() {
    let fs = 4.0e6;
    let make = || {
        let q = Quantiser::new(2, 1.0);
        Chain::new()
            .push(Fir::from_design(&fir::lowpass(fs, 1.0e6, 1.4e6, 50.0)))
            .push(PulseBlanker::new(8.0, 4))
            .push(AdaptiveNotch::new(0.9, 0.005, Cf64::default()))
            .push(FreqExcision::new(128, 1e-3))
            .push(Agc::for_quantiser(&q, fs, 1e-4))
            .push(q)
    };
    let x = add(&noise(12_000, 1.0, 101), &tone(12_000, 4.0, 0.07));
    assert_eq!(make().len(), 6);
    assert_chunked_equals_one_shot(make, &x, 102);
    let mut a = x.clone();
    let mut b = add(&noise(12_000, 1.0, 101), &tone(12_000, 4.0, 0.07));
    make().process(&mut a);
    make().process(&mut b);
    assert_eq!(a, b);
}
