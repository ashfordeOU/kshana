// SPDX-License-Identifier: AGPL-3.0-only
//! Reference tests for the IQ-layer receiver: `iq::acq` (FFT acquisition) and `iq::track`
//! (tracking bank, loop filters, discriminators, lock detectors, C/N0 estimators, bit
//! synchronisation and replay).
//!
//! Every numerical claim is checked against an independent reference named in the test:
//! a direct DFT, the analytic square-law / Marcum-Q detector of `kshana::acquisition`,
//! Kaplan & Hegarty's loop design table and thermal-noise jitter closed forms, the
//! second-order loop's steady-state error to a frequency ramp, and the injected truth of
//! seeded synthetic IQ. The IQ is generated here by a small local helper (point-sampled
//! GPS L1 C/A, complex white Gaussian noise of unit power, optional 50 bit/s data); the
//! full scene generator is a separate stream.

use kshana::acquisition::{fft_forward, pd_square_law, threshold_for_pfa};
use kshana::iq::acq::{acquire, acquire_source, AcqConfig};
use kshana::iq::track::cn0::{beaulieu_cn0_dbhz, nwpr_cn0_dbhz};
use kshana::iq::track::discrim::{DllDiscriminator, FllDiscriminator, PllDiscriminator};
use kshana::iq::track::filter::LoopFilter;
use kshana::iq::track::{
    replay, CarrierLoop, ChannelInit, EpochOutput, LoopConfig, LoopCore, TrackingBank,
};
use kshana::iq::{Cf64, SampleSpec, SpreadingCode, VecSource};
use kshana::sdr::CaCode;
use rand::{Rng, SeedableRng};
use rand_chacha::ChaCha8Rng;
use rand_distr::StandardNormal;
use std::f64::consts::{PI, TAU};
use std::sync::Arc;

const L1: f64 = 1_575_420_000.0;
const CHIP: f64 = 1_023_000.0;
const FS: f64 = 2_048_000.0;

/// GPS L1 C/A through the contract trait, local to these tests.
struct Ca(CaCode);

impl SpreadingCode for Ca {
    fn name(&self) -> String {
        format!("GPS L1 C/A PRN {}", self.0.prn)
    }
    fn chip_rate_hz(&self) -> f64 {
        CHIP
    }
    fn len_chips(&self) -> usize {
        1023
    }
    fn carrier_hz(&self) -> f64 {
        L1
    }
    fn value_at(&self, code_phase_chips: f64) -> f64 {
        self.0.bipolar[(code_phase_chips.floor() as i64).rem_euclid(1023) as usize]
    }
}

fn ca(prn: u8) -> Arc<Ca> {
    Arc::new(Ca(CaCode::new(prn).expect("prn")))
}

fn spec() -> SampleSpec {
    SampleSpec {
        fs_hz: FS,
        center_hz: L1,
        if_hz: 0.0,
    }
}

fn gauss(rng: &mut ChaCha8Rng) -> f64 {
    rng.sample::<f64, _>(StandardNormal)
}

/// The injected truth of one synthetic signal.
#[derive(Clone, Copy)]
struct Truth {
    cn0_dbhz: f64,
    /// Code phase at sample 0 (chips, in [0, 1023)).
    phase0: f64,
    doppler_hz: f64,
    carrier_phase0: f64,
    /// `Some((periods_per_bit, offset))`: the bit of absolute code period `j` is
    /// `bits[(j + offset) / periods_per_bit]`.
    data: Option<(usize, usize)>,
}

impl Truth {
    fn code_rate(&self) -> f64 {
        CHIP * (1.0 + self.doppler_hz / L1)
    }
    fn code_phase(&self, n: f64) -> f64 {
        self.phase0 + n * self.code_rate() / FS
    }
    fn bit_index(&self, n: f64) -> usize {
        let (ppb, off) = self.data.unwrap_or((1, 0));
        let j = (self.code_phase(n) / 1023.0).floor() as usize;
        (j + off) / ppb
    }
}

/// Seeded IQ: `truth` (C/A PRN `prn`) plus complex white noise of unit power per sample.
fn synth(prn: u8, truth: &Truth, n: usize, seed: u64) -> (Vec<Cf64>, Vec<f64>) {
    let code = CaCode::new(prn).expect("prn");
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let a = (10f64.powf(truth.cn0_dbhz / 10.0) / FS).sqrt();
    let nb = truth.bit_index(n as f64) + 2;
    let bits: Vec<f64> = (0..nb)
        .map(|_| if rng.gen::<bool>() { 1.0 } else { -1.0 })
        .collect();
    let s = (0.5f64).sqrt();
    let iq = (0..n)
        .map(|i| {
            let x = i as f64;
            let chip = (truth.code_phase(x).floor() as i64).rem_euclid(1023) as usize;
            let d = if truth.data.is_some() {
                bits[truth.bit_index(x)]
            } else {
                1.0
            };
            let ph = TAU * truth.doppler_hz * x / FS + truth.carrier_phase0;
            let c = a * code.bipolar[chip] * d;
            Cf64::new(
                c * ph.cos() + s * gauss(&mut rng),
                c * ph.sin() + s * gauss(&mut rng),
            )
        })
        .collect();
    (iq, bits)
}

fn noise(n: usize, seed: u64) -> Vec<Cf64> {
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let s = (0.5f64).sqrt();
    (0..n)
        .map(|_| Cf64::new(s * gauss(&mut rng), s * gauss(&mut rng)))
        .collect()
}

fn circ_diff(a: f64, b: f64, len: f64) -> f64 {
    let d = (a - b).rem_euclid(len);
    d.min(len - d)
}

fn wrap_pi(x: f64) -> f64 {
    (x + PI).rem_euclid(TAU) - PI
}

fn wrap_half_pi(x: f64) -> f64 {
    (x + PI / 2.0).rem_euclid(PI) - PI / 2.0
}

fn std_dev(v: &[f64]) -> f64 {
    let m = v.iter().sum::<f64>() / v.len() as f64;
    (v.iter().map(|x| (x - m) * (x - m)).sum::<f64>() / v.len() as f64).sqrt()
}

// ── FFT and acquisition ─────────────────────────────────────────────────────────────────

/// The crate's FFT (reused by `iq::acq`) against the defining sum
/// `X[k] = Σ x[n]·exp(−2πi·nk/N)`, to 1e-9 absolute on unit-scale inputs, for radix-2,
/// mixed-radix and prime-factor lengths.
#[test]
fn fft_matches_a_direct_dft_to_1e_9() {
    let mut rng = ChaCha8Rng::seed_from_u64(11);
    for n in [1usize, 2, 7, 64, 1000, 1023, 2046, 2048] {
        let x: Vec<Cf64> = (0..n)
            .map(|_| Cf64::new(gauss(&mut rng), gauss(&mut rng)))
            .collect();
        let fast = fft_forward(&x);
        for (k, f) in fast.iter().enumerate() {
            let mut acc = Cf64::default();
            for (j, v) in x.iter().enumerate() {
                let ang = -TAU * ((j * k) % n) as f64 / n as f64;
                acc = acc + *v * Cf64::new(ang.cos(), ang.sin());
            }
            let err = (f.re - acc.re).hypot(f.im - acc.im);
            assert!(err < 1e-9, "n={n} k={k} err={err:e}");
        }
    }
}

fn acq_cfg() -> AcqConfig {
    AcqConfig {
        coherent_periods: 1,
        noncoherent: 4,
        doppler_max_hz: 5000.0,
        doppler_step_hz: 250.0,
        pfa: 1e-3,
    }
}

/// The search finds the injected code phase (to half a sample) and Doppler (nearest bin)
/// of a 42 dB-Hz signal, on bin and off bin, from an `IqSource`.
#[test]
fn acquisition_finds_the_injected_code_phase_and_doppler() {
    let code = ca(7);
    for (doppler, seed) in [(2250.0, 1u64), (-3310.0, 2)] {
        let truth = Truth {
            cn0_dbhz: 42.0,
            phase0: 345.678,
            doppler_hz: doppler,
            carrier_phase0: 0.7,
            data: None,
        };
        let (iq, _) = synth(7, &truth, 4 * 2048, seed);
        let mut src = VecSource::new(spec(), iq);
        let g = acquire_source(&mut src, code.as_ref(), &acq_cfg()).expect("search");
        let r = &g.result;
        assert!(r.acquired, "{r:?}");
        assert!(
            (r.doppler_hz - doppler).abs() <= 125.0 + 1e-9,
            "doppler {} vs {doppler}",
            r.doppler_hz
        );
        let err = circ_diff(r.code_phase_chips, truth.phase0, 1023.0);
        assert!(
            err <= 0.5 * CHIP / FS + 1e-9,
            "code phase error {err} chips"
        );
        assert!(r.peak_ratio > 2.0, "peak ratio {}", r.peak_ratio);
        assert_eq!(r.samples_per_period, 2048);
        assert_eq!(r.n_doppler_bins, 41);
    }
}

/// Noise alone stays under the whole-grid threshold.
#[test]
fn acquisition_rejects_noise_alone() {
    let code = ca(7);
    let iq = noise(4 * 2048, 99);
    let g = acquire(&iq, &spec(), code.as_ref(), &acq_cfg()).expect("search");
    assert!(!g.result.acquired, "{:?}", g.result);
    // The noise-only cells average 2M (chi-square with 2M degrees of freedom).
    let n = (g.grid.len() * g.grid[0].len()) as f64;
    let mean = g.grid.iter().flatten().sum::<f64>() / n;
    assert!((mean - 8.0).abs() < 0.1, "mean cell {mean}");
}

fn single_bin(m: usize) -> AcqConfig {
    AcqConfig {
        coherent_periods: 1,
        noncoherent: m,
        doppler_max_hz: 0.0,
        doppler_step_hz: 500.0,
        pfa: 0.5,
    }
}

/// Empirical per-cell false-alarm rate over seeded noise-only trials against the analytic
/// `P_fa` of `kshana::acquisition` at the threshold `threshold_for_pfa(0.05, M)`, within
/// four binomial standard deviations. Sixteen cells 128 lags apart are read per trial.
#[test]
fn empirical_pfa_agrees_with_the_square_law_detector() {
    let code = ca(3);
    let m = 2;
    let pfa = 0.05;
    let gamma = threshold_for_pfa(pfa, m as f64);
    let (trials, per) = (300usize, 16usize);
    let mut hits = 0usize;
    for t in 0..trials {
        let iq = noise(m * 2048, 1000 + t as u64);
        let g = acquire(&iq, &spec(), code.as_ref(), &single_bin(m)).expect("search");
        hits += (0..per).filter(|j| g.grid[0][j * 128] > gamma).count();
    }
    let n = (trials * per) as f64;
    let p_hat = hits as f64 / n;
    let sigma = (pfa * (1.0 - pfa) / n).sqrt();
    assert!(
        (p_hat - pfa).abs() < 4.0 * sigma,
        "empirical Pfa {p_hat} vs {pfa} (σ {sigma})"
    );
}

/// Empirical detection probability of the correctly aligned cell over seeded trials at
/// 36 dB-Hz (1 ms coherent, M = 2) against the analytic Marcum-Q `P_d` of
/// `kshana::acquisition::pd_square_law`, within four binomial standard deviations.
#[test]
fn empirical_pd_agrees_with_the_marcum_q_detector() {
    let code = ca(3);
    let m = 2;
    let cn0 = 36.0;
    let gamma = threshold_for_pfa(1e-3, m as f64);
    let rho = 10f64.powf(cn0 / 10.0) * 1e-3;
    let pd = pd_square_law(gamma, m as f64, rho);
    let predicted = kshana::iq::acq::predicted_pd(&single_bin(m), 1e-3, cn0, 1e-3);
    assert!((pd - predicted).abs() < 1e-12);
    assert!(
        pd > 0.2 && pd < 0.9,
        "pick a sensitive operating point: {pd}"
    );
    let trials = 300usize;
    let mut hits = 0usize;
    for t in 0..trials {
        // A whole number of samples of delay, zero Doppler: the cell is exactly aligned.
        let delay = (t * 37) % 2048;
        let truth = Truth {
            cn0_dbhz: cn0,
            phase0: (-(delay as f64) * CHIP / FS).rem_euclid(1023.0),
            doppler_hz: 0.0,
            carrier_phase0: t as f64 * 0.37,
            data: None,
        };
        let (iq, _) = synth(3, &truth, m * 2048, 5000 + t as u64);
        let g = acquire(&iq, &spec(), code.as_ref(), &single_bin(m)).expect("search");
        if g.grid[0][delay] > gamma {
            hits += 1;
        }
    }
    let p_hat = hits as f64 / trials as f64;
    let sigma = (pd * (1.0 - pd) / trials as f64).sqrt();
    assert!(
        (p_hat - pd).abs() < 4.0 * sigma,
        "empirical Pd {p_hat} vs analytic {pd} (σ {sigma})"
    );
}

// ── Loop design ─────────────────────────────────────────────────────────────────────────

/// Effective one-sided noise bandwidth of the discrete closed loop around `f` (with the
/// channel's one-update NCO delay and mid-integration phase), from its impulse response:
/// `Bn = Σh² / (2T·(Σh)²)` (Parseval).
fn impulse_bandwidth(mut f: LoopFilter, t: f64) -> f64 {
    let (mut phi, mut w) = (0.0_f64, 0.0_f64);
    let (mut s1, mut s2) = (0.0, 0.0);
    for n in 0..200_000 {
        let theta = if n == 0 { 1.0 } else { 0.0 };
        let mid = phi + 0.5 * w * t;
        s1 += mid;
        s2 += mid * mid;
        let e = theta - mid;
        let next = f.update(e, 0.0, t);
        phi += w * t;
        w = next;
    }
    s2 / (2.0 * t * s1 * s1)
}

/// Loop noise bandwidth derived from the designed coefficients (through the closed loop's
/// impulse response) matches the design `Bn` of Kaplan & Hegarty Table 5.6 for first-,
/// second- and third-order loops, within 6% at `Bn·T ≤ 0.015`. The natural frequencies
/// read back from the gains match the table's `ω0 = Bn/0.25, Bn/0.53, Bn/0.7845`.
#[test]
fn loop_bandwidth_from_coefficients_matches_the_design() {
    let t = 1e-3;
    for order in [1u8, 2, 3] {
        for bn in [2.0, 5.0, 15.0] {
            let f = LoopFilter::pll(order, bn).expect("filter");
            let w0 = f.phase_natural_frequency().expect("w0");
            let k = [0.25, 0.53, 0.7845][order as usize - 1];
            assert!((w0 * k - bn).abs() < 1e-12);
            let (k1, k2, k3) = f.phase_gains();
            match order {
                1 => assert!((k1 - 4.0 * bn).abs() < 1e-12),
                2 => {
                    // ω0 = √K2 and ζ = K1/(2ω0) give the closed form Bn = ω0(1+4ζ²)/(8ζ).
                    let w = k2.sqrt();
                    let zeta = k1 / (2.0 * w);
                    let b = kshana::iq::track::filter::second_order_noise_bandwidth(w, zeta);
                    assert!((b - bn).abs() / bn < 1e-3, "closed form {b} vs {bn}");
                }
                _ => assert!((k3.cbrt() - w0).abs() < 1e-9),
            }
            let got = impulse_bandwidth(f, t);
            let rel = (got - bn).abs() / bn;
            assert!(
                rel < 0.06,
                "order {order} Bn {bn}: effective {got} ({rel:.3})"
            );
        }
    }
}

struct PllRun {
    errors: Vec<f64>,
}

/// Correlator-level carrier loop simulation: the true phase is `theta(t)`; each epoch's
/// prompt is `A·d·exp(j·(θ̄ − φ̄)) + n` with the epoch-mean phases, `A = √(2·C/N0·T)` and
/// unit-variance noise per component (so `C/N0·T = A²/2`).
fn run_carrier_loop(
    cfg: &LoopConfig,
    theta_mean: &dyn Fn(f64, f64) -> f64,
    cn0_dbhz: Option<f64>,
    data: bool,
    secs: f64,
    seed: u64,
) -> PllRun {
    let t = 1e-3;
    let mut core = LoopCore::new(cfg, CHIP, L1, 0.0).expect("core");
    let mut rng = ChaCha8Rng::seed_from_u64(seed);
    let a = cn0_dbhz.map_or(1.0, |c| (2.0 * 10f64.powf(c / 10.0) * t).sqrt());
    let mut phi = 0.0;
    let mut d = 1.0;
    let n = (secs / t) as usize;
    let mut errors = Vec::with_capacity(n);
    for k in 0..n {
        if data && k % 20 == 0 {
            d = if rng.gen::<bool>() { 1.0 } else { -1.0 };
        }
        let f = core.doppler_hz();
        let t0 = k as f64 * t;
        let err = theta_mean(t0, t) - (phi + PI * f * t);
        let mut p = Cf64::new(err.cos(), err.sin()) * (a * d);
        if cn0_dbhz.is_some() {
            p = p + Cf64::new(gauss(&mut rng), gauss(&mut rng));
        }
        core.update(p, p, p, t);
        phi += TAU * f * t;
        errors.push(err);
    }
    PllRun { errors }
}

fn pll_cfg(order: u8, bn: f64, disc: PllDiscriminator) -> LoopConfig {
    LoopConfig {
        carrier: CarrierLoop::Pll { order, bn_hz: bn },
        pll_discriminator: disc,
        ..LoopConfig::default()
    }
}

/// Steady-state phase jitter of a second-order Costas PLL against the thermal-noise
/// closed form of Kaplan & Hegarty, `σ² = (Bn/(C/N0))·(1 + 1/(2T·C/N0))` rad², at 35 and
/// 40 dB-Hz, Bn = 10 Hz, T = 1 ms, within 12% in σ.
#[test]
fn pll_jitter_matches_the_thermal_noise_closed_form() {
    for (cn0, seed) in [(35.0, 21u64), (40.0, 22)] {
        let cfg = pll_cfg(2, 10.0, PllDiscriminator::CostasAtan);
        let run = run_carrier_loop(
            &cfg,
            &|t0, t| 0.4 + TAU * 3.0 * (t0 + 0.5 * t),
            Some(cn0),
            true,
            40.0,
            seed,
        );
        let e: Vec<f64> = run.errors[2000..]
            .iter()
            .map(|&x| wrap_half_pi(x))
            .collect();
        let c = 10f64.powf(cn0 / 10.0);
        let want = (10.0 / c * (1.0 + 1.0 / (2.0 * 1e-3 * c))).sqrt();
        let got = std_dev(&e);
        assert!(
            (got / want - 1.0).abs() < 0.12,
            "{cn0} dB-Hz: σ {got:.5} rad vs closed form {want:.5}"
        );
    }
}

/// Steady-state error of a second-order PLL to a frequency ramp `R` (Hz/s) against the
/// closed form `θe = 2πR/ω0²` (Kaplan & Hegarty), with `ω0 = Bn/0.53`, within 1%.
#[test]
fn second_order_pll_ramp_error_matches_the_closed_form() {
    for (bn, r) in [(10.0, 5.0), (18.0, 20.0)] {
        let cfg = pll_cfg(2, bn, PllDiscriminator::Atan2);
        // θ(t) = πRt²; its mean over [t0, t0 + T] is πR(t0² + t0·T + T²/3).
        let theta = move |t0: f64, t: f64| PI * r * (t0 * t0 + t0 * t + t * t / 3.0);
        let run = run_carrier_loop(&cfg, &theta, None, false, 4.0, 0);
        let w0 = bn / 0.53;
        let want = TAU * r / (w0 * w0);
        let got = *run.errors.last().expect("ran");
        assert!(
            (got / want - 1.0).abs() < 0.01,
            "Bn {bn} R {r}: {got:.5} rad vs {want:.5}"
        );
    }
    // A third-order loop tracks the same ramp with no steady-state error.
    let cfg = pll_cfg(3, 18.0, PllDiscriminator::Atan2);
    let theta = |t0: f64, t: f64| PI * 20.0 * (t0 * t0 + t0 * t + t * t / 3.0);
    let run = run_carrier_loop(&cfg, &theta, None, false, 4.0, 0);
    assert!(run.errors.last().expect("ran").abs() < 1e-4);
}

/// With 180° data-bit transitions every 20 ms (random bits) at 45 dB-Hz, a Costas loop
/// keeps the phase error (modulo π) small throughout, while the pure-PLL `atan2`
/// discriminator is thrown into a transient at every transition.
#[test]
fn costas_tolerates_bit_flips_and_atan2_does_not() {
    let theta = |t0: f64, t: f64| 1.0 + TAU * 2.0 * (t0 + 0.5 * t);
    let frac_good = |disc| {
        let run = run_carrier_loop(&pll_cfg(2, 15.0, disc), &theta, Some(45.0), true, 5.0, 31);
        let e = &run.errors[500..];
        e.iter().filter(|&&x| wrap_half_pi(x).abs() < 0.2).count() as f64 / e.len() as f64
    };
    let costas = frac_good(PllDiscriminator::CostasAtan);
    let dd = frac_good(PllDiscriminator::CostasDecisionDirected);
    let atan2 = frac_good(PllDiscriminator::Atan2);
    assert!(costas > 0.995, "Costas atan {costas}");
    assert!(dd > 0.995, "Costas decision-directed {dd}");
    assert!(atan2 < 0.9, "atan2 on data {atan2}");
}

/// An FLL-assisted PLL pulls in a 60 Hz initial frequency error that a 10 Hz PLL alone
/// cannot, at 45 dB-Hz on a data-free signal.
#[test]
fn fll_assist_pulls_in_a_large_frequency_error() {
    let theta = |t0: f64, t: f64| TAU * 60.0 * (t0 + 0.5 * t);
    let assisted = LoopConfig {
        carrier: CarrierLoop::FllAssistedPll {
            pll_order: 2,
            pll_bn_hz: 10.0,
            fll_order: 1,
            fll_bn_hz: 10.0,
        },
        pll_discriminator: PllDiscriminator::Atan2,
        fll_discriminator: FllDiscriminator::Atan2Pilot,
        ..LoopConfig::default()
    };
    let run = run_carrier_loop(&assisted, &theta, Some(45.0), false, 2.0, 41);
    let tail: Vec<f64> = run.errors[1500..].iter().map(|&x| wrap_pi(x)).collect();
    assert!(
        std_dev(&tail) < 0.1,
        "assisted loop jitter {}",
        std_dev(&tail)
    );
    let fll_only = LoopConfig {
        carrier: CarrierLoop::Fll {
            order: 2,
            bn_hz: 5.0,
        },
        fll_discriminator: FllDiscriminator::CrossProduct,
        ..LoopConfig::default()
    };
    let mut core = LoopCore::new(&fll_only, CHIP, L1, 0.0).expect("core");
    let mut phi = 0.0;
    for k in 0..3000 {
        let t = 1e-3;
        let f = core.doppler_hz();
        let err = theta(k as f64 * t, t) - (phi + PI * f * t);
        let p = Cf64::new(err.cos(), err.sin());
        core.update(p, p, p, t);
        phi += TAU * f * t;
    }
    assert!(
        (core.doppler_hz() - 60.0).abs() < 0.05,
        "FLL {}",
        core.doppler_hz()
    );
}

/// Code loop jitter at 45 dB-Hz (first-order DLL, Bn = 1 Hz, T = 1 ms, d = 0.5 chip)
/// against Kaplan & Hegarty's thermal-noise closed forms, within 15% in σ:
/// early-minus-late power `σ² = (Bn·d/(2C/N0))·(1 + 2/((2 − d)·T·C/N0))` chips², dot
/// product `σ² = (Bn·d/(2C/N0))·(1 + 1/(T·C/N0))`. The correlators carry the ideal
/// triangle and the correlated noise of an infinite-bandwidth front end (covariance
/// `1 − |Δ|` between taps `Δ` chips apart).
#[test]
fn dll_jitter_matches_the_thermal_noise_closed_form() {
    let (t, d, bn, cn0) = (1e-3, 0.5, 1.0, 45.0);
    let c = 10f64.powf(cn0 / 10.0);
    let a = (2.0 * c * t).sqrt();
    // Cholesky factor of the E/P/L noise covariance.
    let r = [
        [1.0, 1.0 - d / 2.0, 1.0 - d],
        [1.0 - d / 2.0, 1.0, 1.0 - d / 2.0],
        [1.0 - d, 1.0 - d / 2.0, 1.0],
    ];
    let mut lch = [[0.0; 3]; 3];
    for i in 0..3 {
        for j in 0..=i {
            let s: f64 = (0..j).map(|k| lch[i][k] * lch[j][k]).sum();
            lch[i][j] = if i == j {
                (r[i][i] - s).sqrt()
            } else {
                (r[i][j] - s) / lch[j][j]
            };
        }
    }
    let tri = |x: f64| (1.0 - x.abs()).max(0.0);
    for (disc, want_factor, seed) in [
        (
            DllDiscriminator::EarlyMinusLatePower,
            1.0 + 2.0 / ((2.0 - d) * t * c),
            51u64,
        ),
        (DllDiscriminator::DotProduct, 1.0 + 1.0 / (t * c), 52),
    ] {
        let cfg = LoopConfig {
            carrier_aiding: false,
            dll: disc,
            dll_order: 1,
            dll_bn_hz: bn,
            spacing_chips: d,
            carrier: CarrierLoop::Pll {
                order: 2,
                bn_hz: 10.0,
            },
            pll_discriminator: PllDiscriminator::Atan2,
            ..LoopConfig::default()
        };
        let mut core = LoopCore::new(&cfg, CHIP, L1, 0.0).expect("core");
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let mut eps = 0.0_f64;
        let mut errs = Vec::new();
        for k in 0..60_000 {
            let draw = |rng: &mut ChaCha8Rng| {
                let z = [gauss(rng), gauss(rng), gauss(rng)];
                [0, 1, 2].map(|i| (0..3).map(|j| lch[i][j] * z[j]).sum::<f64>())
            };
            let ni = draw(&mut rng);
            let nq = draw(&mut rng);
            let sig = [tri(eps - d / 2.0), tri(eps), tri(eps + d / 2.0)].map(|v| a * v);
            let tap = |i: usize| Cf64::new(sig[i] + ni[i], nq[i]);
            core.update(tap(0), tap(1), tap(2), t);
            eps += (CHIP - core.code_rate_hz()) * t;
            if k >= 5000 {
                errs.push(eps);
            }
        }
        let want = (bn * d / (2.0 * c) * want_factor).sqrt();
        let got = std_dev(&errs);
        assert!(
            (got / want - 1.0).abs() < 0.15,
            "{disc:?}: σ {got:.5} chips vs closed form {want:.5}"
        );
    }
}

// ── C/N0 estimators ─────────────────────────────────────────────────────────────────────

/// NWPR (K = 20 one-millisecond prompts per bit-aligned window, M = 50 windows) and
/// Beaulieu (on 20 ms bit-integrated prompts, 50 per estimate) recover the injected C/N0
/// at 35 and 45 dB-Hz: the mean of 30 one-second estimates is within 0.3 dB of the truth.
#[test]
fn cn0_estimators_are_unbiased_at_35_and_45_dbhz() {
    for (cn0, seed) in [(35.0, 61u64), (45.0, 62)] {
        let t = 1e-3;
        let a = (2.0 * 10f64.powf(cn0 / 10.0) * t).sqrt();
        let mut rng = ChaCha8Rng::seed_from_u64(seed);
        let (mut nw, mut be) = (Vec::new(), Vec::new());
        for _ in 0..30 {
            let mut prompts = Vec::with_capacity(1000);
            for _ in 0..50 {
                let d = if rng.gen::<bool>() { a } else { -a };
                for _ in 0..20 {
                    prompts.push(Cf64::new(d + gauss(&mut rng), gauss(&mut rng)));
                }
            }
            nw.push(nwpr_cn0_dbhz(&prompts, 20, t).expect("nwpr"));
            let bits: Vec<Cf64> = prompts
                .chunks(20)
                .map(|c| c.iter().fold(Cf64::default(), |s, &p| s + p))
                .collect();
            be.push(beaulieu_cn0_dbhz(&bits, 20.0 * t).expect("beaulieu"));
        }
        let mean = |v: &[f64]| v.iter().sum::<f64>() / v.len() as f64;
        assert!((mean(&nw) - cn0).abs() < 0.3, "NWPR {} at {cn0}", mean(&nw));
        assert!(
            (mean(&be) - cn0).abs() < 0.3,
            "Beaulieu {} at {cn0}",
            mean(&be)
        );
    }
}

// ── Full IQ tracking ────────────────────────────────────────────────────────────────────

fn data_truth() -> Truth {
    Truth {
        cn0_dbhz: 45.0,
        phase0: 345.678,
        doppler_hz: 1234.5,
        carrier_phase0: 1.1,
        data: Some((20, 7)),
    }
}

fn iq_cfg() -> LoopConfig {
    LoopConfig {
        label: "fll-assisted costas".into(),
        cn0_windows: 40,
        ..LoopConfig::default()
    }
}

fn acquire_init(iq: &[Cf64]) -> ChannelInit {
    let code = ca(7);
    let g = acquire(iq, &spec(), code.as_ref(), &acq_cfg()).expect("search");
    assert!(g.result.acquired);
    ChannelInit::from_acquisition(code, &g.result, &spec(), 0, Some(20))
}

/// Acquire, then track 2 s of 45 dB-Hz C/A with 50 bit/s data through the bank: phase
/// lock and code lock are declared, the Doppler converges on the truth, the code epochs
/// land on the injected code phase, the histogram finds the injected bit edge, the bits
/// decode (to the Costas sign ambiguity) and both C/N0 estimates fall within 1.5 dB.
#[test]
fn tracking_bank_locks_on_synthetic_iq_with_data() {
    let truth = data_truth();
    let n = (2.0 * FS) as usize;
    let (iq, bits) = synth(7, &truth, n, 71);
    let init = acquire_init(&iq);
    let mut bank = TrackingBank::new(spec(), &[(init, iq_cfg())]).expect("bank");
    let mut src = VecSource::new(spec(), iq);
    let out = bank.run(&mut src, None).expect("run");
    let ep = &out[0];
    assert!(ep.len() > 1000, "{} updates", ep.len());
    let last = ep.last().expect("epochs");
    assert!(last.phase_lock, "pli {}", last.pli);
    assert!(last.code_lock, "cn0 {:?}", last.cn0_nwpr_dbhz);

    let tail = &ep[ep.len() - 300..];
    let mean_dopp = tail.iter().map(|e| e.doppler_hz).sum::<f64>() / tail.len() as f64;
    assert!(
        (mean_dopp - truth.doppler_hz).abs() < 1.0,
        "Doppler {mean_dopp}"
    );

    // Code epochs: the truth's code phase at the reported time is a whole period.
    let rms = (tail
        .iter()
        .map(|e| {
            let ph = truth.code_phase(e.code_epoch_s * FS);
            let r = circ_diff(ph, 0.0, 1023.0);
            r * r
        })
        .sum::<f64>()
        / tail.len() as f64)
        .sqrt();
    assert!(rms < 0.05, "code epoch RMS error {rms} chips");

    // Absolute code period j = k + 1 for channel period k; bits start where
    // (j + 7) % 20 == 0, so k ≡ 12 (mod 20).
    assert_eq!(last.bit_edge, Some(12));

    let decoded: Vec<(i8, f64)> = ep
        .iter()
        .filter_map(|e| {
            e.bit
                .map(|b| (b, truth.bit_index(e.sample_index as f64 - 1000.0) as f64))
        })
        .collect();
    assert!(decoded.len() >= 20, "{} bits", decoded.len());
    let signs: Vec<f64> = decoded
        .iter()
        .map(|&(b, j)| b as f64 * bits[j as usize])
        .collect();
    assert!(
        signs.iter().all(|&s| s == signs[0]),
        "decoded bits disagree with the truth: {signs:?}"
    );

    // NWPR over 40 windows; Beaulieu over 40 bit pairs, whose mean term has a relative
    // standard deviation of about √(2/40) ≈ 22% (≈ 1 dB) at this SNR, hence 3 dB.
    for (name, est, tol) in [
        ("NWPR", last.cn0_nwpr_dbhz, 1.5),
        ("Beaulieu", last.cn0_beaulieu_dbhz, 3.0),
    ] {
        let c = est.unwrap_or(f64::NAN);
        assert!((c - truth.cn0_dbhz).abs() < tol, "{name} {c}");
    }
}

fn bit_identical(a: &[EpochOutput], b: &[EpochOutput]) -> bool {
    a.len() == b.len()
        && a.iter().zip(b).all(|(x, y)| {
            x == y
                && x.prompt.re.to_bits() == y.prompt.re.to_bits()
                && x.doppler_hz.to_bits() == y.doppler_hz.to_bits()
                && x.code_epoch_s.to_bits() == y.code_epoch_s.to_bits()
        })
}

/// The same seed gives bit-identical IQ and bit-identical tracking output, whatever the
/// chunking of the source.
#[test]
fn tracking_is_deterministic() {
    let truth = data_truth();
    let n = (0.3 * FS) as usize;
    let (iq1, _) = synth(7, &truth, n, 81);
    let (iq2, _) = synth(7, &truth, n, 81);
    assert!(iq1
        .iter()
        .zip(&iq2)
        .all(|(a, b)| a.re.to_bits() == b.re.to_bits() && a.im.to_bits() == b.im.to_bits()));
    let init = acquire_init(&iq1);
    let mut b1 = TrackingBank::new(spec(), &[(init.clone(), iq_cfg())]).expect("bank");
    let r1 = b1.run(&mut VecSource::new(spec(), iq1), None).expect("run");
    // Feed the second copy in odd-sized pieces.
    let mut b2 = TrackingBank::new(spec(), &[(init, iq_cfg())]).expect("bank");
    let mut r2 = Vec::new();
    for c in iq2.chunks(7777) {
        b2.process(c, &mut r2);
    }
    assert!(bit_identical(&r1[0], &r2[0]));
}

/// Replaying one recording through three loop designs returns one result per design,
/// each identical to running that design alone, and the designs differ as expected (the
/// wider PLL has the larger carrier NCO frequency jitter).
#[test]
fn replay_runs_one_source_through_many_loop_designs() {
    let truth = data_truth();
    let n = (1.0 * FS) as usize;
    let (iq, _) = synth(7, &truth, n, 91);
    let init = acquire_init(&iq);
    let designs: Vec<LoopConfig> = [5.0, 15.0, 30.0]
        .iter()
        .map(|&bn| LoopConfig {
            label: format!("PLL {bn} Hz"),
            carrier: CarrierLoop::FllAssistedPll {
                pll_order: 2,
                pll_bn_hz: bn,
                fll_order: 1,
                fll_bn_hz: 10.0,
            },
            ..iq_cfg()
        })
        .collect();
    let res = replay(
        &mut VecSource::new(spec(), iq.clone()),
        std::slice::from_ref(&init),
        &designs,
        None,
    )
    .expect("replay");
    assert_eq!(res.len(), 3);
    let mut scatter = Vec::new();
    for (r, d) in res.iter().zip(&designs) {
        assert_eq!(&r.config, d);
        assert_eq!(r.channels.len(), 1);
        let alone = TrackingBank::new(spec(), &[(init.clone(), d.clone())])
            .expect("bank")
            .run(&mut VecSource::new(spec(), iq.clone()), None)
            .expect("run");
        assert!(bit_identical(&r.channels[0], &alone[0]), "{}", d.label);
        let ep = &r.channels[0];
        assert!(ep.last().expect("epochs").phase_lock, "{}", d.label);
        let tail: Vec<f64> = ep[ep.len() - 400..].iter().map(|e| e.doppler_hz).collect();
        scatter.push(std_dev(&tail));
    }
    assert!(
        scatter[0] < scatter[1] && scatter[1] < scatter[2],
        "NCO frequency jitter by bandwidth: {scatter:?}"
    );
}

/// Truncating with `max_samples` stops the replay there.
#[test]
fn replay_honours_max_samples() {
    let truth = data_truth();
    let (iq, _) = synth(7, &truth, (0.2 * FS) as usize, 92);
    let init = acquire_init(&iq);
    let res = replay(
        &mut VecSource::new(spec(), iq),
        &[init],
        &[iq_cfg()],
        Some(102_400),
    )
    .expect("replay");
    let ep = &res[0].channels[0];
    assert!(ep.last().expect("epochs").sample_index <= 102_400);
    assert!(
        ep.len() >= 48 && ep.len() <= 50,
        "{} updates in 50 ms",
        ep.len()
    );
}
