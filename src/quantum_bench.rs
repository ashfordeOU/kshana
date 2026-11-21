// SPDX-License-Identifier: AGPL-3.0-only
//! **Quantum inertial-sensor benchmark: a vendor-neutral test protocol, a simulator-ready
//! cold-atom accelerometer output model, and a scorer for recorded sensor output.**
//! Evaluation only: nothing here navigates.
//!
//! * [`protocol`] is the pre-registered protocol (`quantum-bench/v1`): seven tests (static
//!   noise and bias stability, scale factor and linearity, dynamic range and fringe ambiguity,
//!   dead time and aliasing, temperature sensitivity, start-up and availability, rotation and
//!   contrast), each with the conditions to record, the data to supply and the metrics
//!   [`score`] computes. It sets no pass mark: thresholds are the user's, stated before the
//!   test.
//! * [`simulate`] writes the output a cold-atom (Mach–Zehnder, Kasevich–Chu) accelerometer
//!   would give, one sample per measurement cycle, for a stated acceleration profile, so a
//!   simulator or a test harness can be driven with it. Each sample is the interferometer's
//!   response to the true acceleration: the acceleration weighted by the triangular
//!   sensitivity function over the `2T` interrogation (`Φ = k_eff·∫ g_a(t)·a(t) dt`, `g_a`
//!   rising linearly to `T` and falling to zero at `2T`, area `T²`), so the sensor is blind
//!   during the rest of the cycle (dead time) and aliases vibration; projection noise
//!   `1/(C·√N)` with the contrast decaying over the interrogation
//!   ([`crate::inertial::quantum_imu`]); a white platform-vibration term `S_a·T³/3` in phase;
//!   a constant bias, a bias random walk and a scale-factor error; and the fringe readout
//!   wrapped into `[−π, π)`, so an acceleration beyond `π/(k_eff·T²)` aliases by whole
//!   fringes, which the output flags.
//! * [`score`] reads a recorded series (time, measured acceleration, optional reference) and
//!   computes the protocol metrics: sample interval and availability, the overlapping Allan
//!   deviation of the error ([`crate::allan`]), velocity random walk from the white part,
//!   bias instability (the Allan floor over 0.664, IEEE Std 952 convention), a rate random
//!   walk from a rising branch after the Allan minimum, bias, scale factor and linearity against
//!   the reference, and fringe-jump events (errors near a whole number of fringe periods).
//!
//! **Labels.** The simulator is MODELLED (the physics of `quantum_imu` with stated inputs). The
//! scorer computes statistics of the data it is given; applied to simulator output it is a
//! self-consistency check, and no real quantum sensor's data has been scored here. The
//! protocol is a document, not a certification of anything.

use crate::inertial::quantum_imu::{CaiAccelerometer, RB87_D2_WAVELENGTH_M};
use crate::portable_math::PortableFloat;
use rand::SeedableRng;
use rand_chacha::ChaCha8Rng;
use serde::{Deserialize, Serialize};
use std::f64::consts::PI;
use std::fmt::Write as _;

/// Schema ids.
pub const PROTOCOL_SCHEMA: &str = "kshana.quantum-bench-protocol/1";
pub const SCORE_SCHEMA: &str = "kshana.quantum-bench-score/1";
/// The protocol version the scorer implements.
pub const PROTOCOL_ID: &str = "quantum-bench/v1";
/// Standard gravity (m/s²), for µg units.
const G0: f64 = 9.806_65;

// ─────────────────────────────── protocol ───────────────────────────────

/// The protocol document.
pub fn protocol() -> serde_json::Value {
    let t = |id: &str, name: &str, conditions: &str, data: &str, metrics: &[&str]| serde_json::json!({"id": id, "name": name, "conditions": conditions, "data": data, "metrics": metrics});
    serde_json::json!({
        "schema": PROTOCOL_SCHEMA,
        "protocol": PROTOCOL_ID,
        "scope": "quantum (cold-atom) and classical inertial accelerometers on a test bench; evaluation only, no navigation",
        "rules": [
            "state every threshold before the test (pre-registration); the protocol sets none",
            "record raw sensor output at its native rate with timestamps from a stated clock",
            "a reference (calibrated table, tilt, gravimeter or reference accelerometer) is stated with its own uncertainty",
            "report every run, including failed or aborted ones, with the scorer version",
            "the same protocol and thresholds apply to the quantum sensor and to the classical baseline it is compared with",
        ],
        "tests": [
            t("T1", "static noise and bias stability", "static, levelled, temperature-stable bench; at least 10x the longest averaging time of interest", "t_s, measured_m_s2", &["sample_interval_s", "availability", "allan_deviation", "vrw_m_s_per_sqrt_h", "bias_instability_ug", "rate_random_walk"]),
            t("T2", "scale factor and linearity", "steps or tilts over the stated range, each held long enough to average below the bias instability", "t_s, measured_m_s2, reference_m_s2", &["scale_factor_ppm", "linearity_residual_rms_ug", "bias_ug"]),
            t("T3", "dynamic range and fringe ambiguity", "accelerations up to and beyond the stated range, ramps and steps", "t_s, measured_m_s2, reference_m_s2", &["fringe_jumps", "largest_error_ug"]),
            t("T4", "dead time and aliasing", "sinusoidal vibration at stated frequencies, including near the cycle rate and its multiples", "t_s, measured_m_s2, reference_m_s2", &["error_rms_ug", "allan_deviation"]),
            t("T5", "temperature sensitivity", "stated temperature steps or ramp, static otherwise", "t_s, measured_m_s2 (and the temperature log alongside)", &["bias_ug", "allan_deviation"]),
            t("T6", "start-up and availability", "cold start, warm start, and a long run", "t_s, measured_m_s2", &["availability", "gaps", "time_to_first_sample_s"]),
            t("T7", "rotation and contrast", "stated rotation rates on a rate table", "t_s, measured_m_s2, reference_m_s2", &["availability", "error_rms_ug", "fringe_jumps"]),
        ],
        "scorer": "kshana quantum-bench score",
        "label": "a document; it certifies nothing",
    })
}

// ─────────────────────────────── simulator ───────────────────────────────

/// Simulation inputs (TOML).
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SimSpec {
    pub sensor: SensorCfg,
    #[serde(default)]
    pub errors: ErrorCfg,
    pub profile: ProfileCfg,
    pub run: RunCfg,
}

/// The interferometer.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct SensorCfg {
    #[serde(default = "default_lambda")]
    pub wavelength_m: f64,
    /// Pulse separation `T` (s).
    pub pulse_sep_t_s: f64,
    /// Detected atoms per shot.
    pub atom_number: f64,
    /// Initial contrast.
    pub contrast: f64,
    /// Cycle time (s), at least `2T`.
    pub cycle_time_s: f64,
    /// Contrast decay time (s); zero for none.
    #[serde(default)]
    pub contrast_decay_s: f64,
}

fn default_lambda() -> f64 {
    RB87_D2_WAVELENGTH_M
}

/// Sensor errors beyond projection noise.
#[derive(Clone, Debug, Deserialize, Serialize, Default)]
#[serde(deny_unknown_fields)]
pub struct ErrorCfg {
    /// White platform-vibration acceleration PSD along the axis ((m/s²)²/Hz).
    #[serde(default)]
    pub vibration_psd: f64,
    /// Constant bias (m/s²).
    #[serde(default)]
    pub bias_m_s2: f64,
    /// Bias random walk (m/s² per √s).
    #[serde(default)]
    pub bias_rw_m_s2_per_sqrt_s: f64,
    /// Scale-factor error (ppm).
    #[serde(default)]
    pub scale_factor_ppm: f64,
}

/// The true acceleration along the axis: a constant, a sine, and steps.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct ProfileCfg {
    #[serde(default)]
    pub constant_m_s2: f64,
    #[serde(default)]
    pub sine_amplitude_m_s2: f64,
    #[serde(default)]
    pub sine_hz: f64,
    /// Steps `[time s, added acceleration m/s²]`.
    #[serde(default)]
    pub steps: Vec<[f64; 2]>,
}

impl ProfileCfg {
    pub fn at(&self, t: f64) -> f64 {
        let mut a =
            self.constant_m_s2 + self.sine_amplitude_m_s2 * (2.0 * PI * self.sine_hz * t).psin();
        for s in &self.steps {
            if t >= s[0] {
                a += s[1];
            }
        }
        a
    }
}

/// Run length and seed.
#[derive(Clone, Debug, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct RunCfg {
    pub duration_s: f64,
    #[serde(default)]
    pub seed: u64,
}

/// One simulated sample.
#[derive(Clone, Copy, Debug, Serialize, PartialEq)]
pub struct Sample {
    /// Start of the interrogation (s).
    pub t_s: f64,
    /// Sensor output (m/s²): the wrapped phase over `k_eff·T²`.
    pub measured_m_s2: f64,
    /// The true acceleration weighted by the sensitivity function (m/s²).
    pub reference_m_s2: f64,
    /// The true acceleration at the middle of the interrogation (m/s²).
    pub instantaneous_m_s2: f64,
    /// The fringe phase was wrapped (the true phase was outside `[−π, π)`).
    pub wrapped: bool,
}

/// Errors of the spec-driven tools.
#[derive(Clone, Debug, PartialEq)]
pub enum BenchError {
    /// Sensor values out of range (positive `T`, atoms, contrast in (0, 1], cycle ≥ 2T).
    Sensor,
    /// Run length not positive or more than ten million cycles.
    Run,
    /// Fewer than 16 usable samples in a scored series.
    TooShort,
    /// A CSV without `t_s` and `measured_m_s2` columns, or a non-numeric cell.
    Csv(String),
}

impl SensorCfg {
    pub fn cai(&self) -> CaiAccelerometer {
        CaiAccelerometer {
            wavelength_m: self.wavelength_m,
            pulse_sep_t: self.pulse_sep_t_s,
            atom_number: self.atom_number,
            contrast: self.contrast,
            cycle_time_s: self.cycle_time_s,
        }
    }
}

/// Simulate the sensor output (see the module documentation).
pub fn simulate(spec: &SimSpec) -> Result<Vec<Sample>, BenchError> {
    let s = &spec.sensor;
    let ok = s.pulse_sep_t_s > 0.0
        && s.atom_number >= 1.0
        && s.contrast > 0.0
        && s.contrast <= 1.0
        && s.cycle_time_s >= 2.0 * s.pulse_sep_t_s
        && s.wavelength_m > 0.0
        && s.contrast_decay_s >= 0.0
        && [
            s.pulse_sep_t_s,
            s.atom_number,
            s.cycle_time_s,
            s.wavelength_m,
            s.contrast_decay_s,
        ]
        .iter()
        .all(|v| v.is_finite());
    if !ok {
        return Err(BenchError::Sensor);
    }
    let n = (spec.run.duration_s / s.cycle_time_s).floor();
    if !(spec.run.duration_s.is_finite() && (1.0..=1e7).contains(&n)) {
        return Err(BenchError::Run);
    }
    let n = n as usize;
    let cai = s.cai();
    let k = cai.k_eff();
    let t = s.pulse_sep_t_s;
    let scale = k * t * t;
    let contrast = cai.contrast_at(2.0 * t, s.contrast_decay_s).max(1e-6);
    let qpn = 1.0 / (contrast * s.atom_number.sqrt());
    let vib = (k * k * spec.errors.vibration_psd.max(0.0) * t.powi(3) / 3.0).sqrt();
    let sigma_phi = (qpn * qpn + vib * vib).sqrt();
    let mut rng = ChaCha8Rng::seed_from_u64(spec.run.seed);
    let mut bias_rw = 0.0;
    let rw_step = spec.errors.bias_rw_m_s2_per_sqrt_s * s.cycle_time_s.sqrt();
    // The sensitivity-weighted mean over [0, 2T]: ∫ g_a(τ) a(t0+τ) dτ / T², by Simpson's rule.
    let m = 64usize;
    let weighted = |t0: f64| {
        let h = 2.0 * t / m as f64;
        let mut acc = 0.0;
        for i in 0..=m {
            let tau = i as f64 * h;
            let g = if tau <= t { tau } else { 2.0 * t - tau };
            let w = if i == 0 || i == m {
                1.0
            } else if i % 2 == 1 {
                4.0
            } else {
                2.0
            };
            acc += w * g * spec.profile.at(t0 + tau);
        }
        acc * h / 3.0 / (t * t)
    };
    let mut out = Vec::with_capacity(n);
    for i in 0..n {
        let t0 = i as f64 * s.cycle_time_s;
        let truth = weighted(t0);
        bias_rw += rw_step * crate::portable_math::standard_normal(&mut rng);
        let sensed =
            truth * (1.0 + spec.errors.scale_factor_ppm * 1e-6) + spec.errors.bias_m_s2 + bias_rw;
        let phase = scale * sensed + sigma_phi * crate::portable_math::standard_normal(&mut rng);
        let wrapped_phase = crate::inertial::quantum_imu::wrap_phase(phase);
        out.push(Sample {
            t_s: t0,
            measured_m_s2: wrapped_phase / scale,
            reference_m_s2: truth,
            instantaneous_m_s2: spec.profile.at(t0 + t),
            wrapped: (phase - wrapped_phase).abs() > 1e-9,
        });
    }
    Ok(out)
}

/// The simulator output as CSV (header, then one row per sample).
pub fn samples_csv(samples: &[Sample]) -> String {
    let mut s = String::from("t_s,measured_m_s2,reference_m_s2,instantaneous_m_s2,wrapped\n");
    for x in samples {
        let _ = writeln!(
            s,
            "{},{},{},{},{}",
            x.t_s, x.measured_m_s2, x.reference_m_s2, x.instantaneous_m_s2, x.wrapped as u8
        );
    }
    s
}

/// The predictions a simulated sensor should meet: per-shot noise, the white-noise ASD and
/// the fringe-ambiguity limit.
pub fn predictions(spec: &SimSpec) -> serde_json::Value {
    let s = &spec.sensor;
    let cai = s.cai();
    let k = cai.k_eff();
    let t = s.pulse_sep_t_s;
    let contrast = cai.contrast_at(2.0 * t, s.contrast_decay_s).max(1e-6);
    let qpn = 1.0 / (contrast * s.atom_number.sqrt());
    let vib2 = k * k * spec.errors.vibration_psd.max(0.0) * t.powi(3) / 3.0;
    let sigma_a = (qpn * qpn + vib2).sqrt() / (k * t * t);
    let asd = sigma_a * s.cycle_time_s.sqrt();
    serde_json::json!({
        "per_shot_m_s2": sigma_a,
        "white_asd_m_s2_per_sqrt_hz": asd,
        "vrw_m_s_per_sqrt_h": asd * 60.0,
        "max_unambiguous_m_s2": PI / (k * t * t),
        "dead_time_fraction": 1.0 - 2.0 * t / s.cycle_time_s,
    })
}

// ─────────────────────────────── scorer ───────────────────────────────

/// A recorded series.
#[derive(Clone, Debug, Default)]
pub struct Series {
    pub t: Vec<f64>,
    pub y: Vec<f64>,
    pub reference: Option<Vec<f64>>,
}

/// Read a CSV with a header naming `t_s` and `measured_m_s2` (and optionally
/// `reference_m_s2`); other columns are ignored, blank lines skipped.
pub fn read_csv(text: &str) -> Result<Series, BenchError> {
    let mut lines = text
        .lines()
        .filter(|l| !l.trim().is_empty() && !l.starts_with('#'));
    let head: Vec<&str> = lines
        .next()
        .unwrap_or("")
        .split(',')
        .map(str::trim)
        .collect();
    let col = |n: &str| head.iter().position(|h| *h == n);
    let (Some(ti), Some(yi)) = (col("t_s"), col("measured_m_s2")) else {
        return Err(BenchError::Csv(head.join(",")));
    };
    let ri = col("reference_m_s2");
    let mut s = Series {
        reference: ri.map(|_| Vec::new()),
        ..Default::default()
    };
    for l in lines {
        let c: Vec<&str> = l.split(',').map(str::trim).collect();
        let num = |i: usize| -> Result<f64, BenchError> {
            c.get(i)
                .and_then(|v| v.parse::<f64>().ok())
                .filter(|v| v.is_finite())
                .ok_or_else(|| BenchError::Csv(l.chars().take(80).collect()))
        };
        s.t.push(num(ti)?);
        s.y.push(num(yi)?);
        if let (Some(r), Some(v)) = (ri, s.reference.as_mut()) {
            v.push(num(r)?);
        }
    }
    Ok(s)
}

fn mean(v: &[f64]) -> f64 {
    v.iter().sum::<f64>() / v.len().max(1) as f64
}

/// Score a series (see the module documentation). `fringe_m_s2` is the fringe period in
/// acceleration (`2π/(k_eff·T²)`) when known, for the fringe-jump count.
pub fn score(s: &Series, fringe_m_s2: Option<f64>) -> Result<serde_json::Value, BenchError> {
    let n = s.t.len();
    if n < 16 {
        return Err(BenchError::TooShort);
    }
    let mut dts: Vec<f64> =
        s.t.windows(2)
            .map(|w| w[1] - w[0])
            .filter(|d| *d > 0.0)
            .collect();
    if dts.len() < 8 {
        return Err(BenchError::TooShort);
    }
    dts.sort_by(f64::total_cmp);
    let tau0 = dts[dts.len() / 2];
    let span = s.t[n - 1] - s.t[0];
    let expected = (span / tau0).round() as usize + 1;
    let gaps = s.t.windows(2).filter(|w| w[1] - w[0] > 1.5 * tau0).count();
    let availability = (n as f64 / expected.max(1) as f64).min(1.0);

    // Error series: against the reference, else about the mean (a static test).
    let err: Vec<f64> = match &s.reference {
        Some(r) => s.y.iter().zip(r).map(|(y, r)| y - r).collect(),
        None => {
            let m = mean(&s.y);
            s.y.iter().map(|y| y - m).collect()
        }
    };
    // Fringe jumps: errors within a quarter fringe of a non-zero whole number of fringes.
    let fringe_jumps = fringe_m_s2.filter(|f| *f > 0.0).map(|f| {
        err.iter()
            .filter(|e| {
                let k = (*e / f).round();
                k != 0.0 && (*e - k * f).abs() < 0.25 * f
            })
            .count()
    });
    // Allan deviation of the error (rate data → phase by cumulative sum).
    let mut phase = Vec::with_capacity(n + 1);
    phase.push(0.0);
    let mut acc = 0.0;
    for e in &err {
        acc += e * tau0;
        phase.push(acc);
    }
    let mut curve = Vec::new();
    let mut m = 1usize;
    while 2 * m < phase.len() && (phase.len() - 2 * m) >= 8 {
        let ad = crate::allan::overlapping_adev(&phase, tau0, m);
        curve.push((m as f64 * tau0, ad));
        m *= 2;
    }
    // White part: σ(τ)·√τ at the shortest τ.
    let (tau1, ad1) = curve[0];
    let asd = ad1 * tau1.sqrt();
    let (tau_min, ad_min) = curve
        .iter()
        .copied()
        .min_by(|a, b| a.1.total_cmp(&b.1))
        .unwrap_or((tau1, ad1));
    // Rate random walk: a rising (+½) branch after the Allan minimum, found by a log-log
    // least-squares slope over the points from the minimum on (at least three); its
    // coefficient K = σ(τ)·sqrt(3/τ) on the fitted line at the longest τ.
    let imin = curve
        .iter()
        .enumerate()
        .min_by(|a, b| a.1 .1.total_cmp(&b.1 .1))
        .map(|(i, _)| i)
        .unwrap_or(0);
    let tail = &curve[imin..];
    let rrw = if tail.len() >= 3 {
        let xs: Vec<f64> = tail.iter().map(|p| p.0.plog10()).collect();
        let ys: Vec<f64> = tail.iter().map(|p| p.1.plog10()).collect();
        let (mx, my) = (mean(&xs), mean(&ys));
        let sxx: f64 = xs.iter().map(|x| (x - mx).powi(2)).sum();
        let sxy: f64 = xs.iter().zip(&ys).map(|(x, y)| (x - mx) * (y - my)).sum();
        let slope = if sxx > 0.0 { sxy / sxx } else { 0.0 };
        if slope > 0.25 {
            let tl = tail[tail.len() - 1].0;
            let fitted = 10f64.ppowf(my + slope * (tl.plog10() - mx));
            Some(fitted * (3.0 / tl).sqrt())
        } else {
            None
        }
    } else {
        None
    };
    // Scale factor, linearity and bias against the reference (least squares y = a + b·r).
    let lin = s.reference.as_ref().and_then(|r| {
        let mr = mean(r);
        let my = mean(&s.y);
        let sxx: f64 = r.iter().map(|x| (x - mr).powi(2)).sum();
        if sxx <= 0.0 || (sxx / n as f64).sqrt() < 1e-6 {
            return None;
        }
        let sxy: f64 = r.iter().zip(&s.y).map(|(x, y)| (x - mr) * (y - my)).sum();
        let b = sxy / sxx;
        let a = my - b * mr;
        let res = (r.iter().zip(&s.y).map(|(x, y)| (y - a - b * x).powi(2)).sum::<f64>() / n as f64).sqrt();
        Some(serde_json::json!({"scale_factor_ppm": (b - 1.0) * 1e6, "intercept_ug": a / G0 * 1e6, "linearity_residual_rms_ug": res / G0 * 1e6}))
    });
    let err_rms = (err.iter().map(|e| e * e).sum::<f64>() / n as f64).sqrt();
    let largest = err.iter().fold(0.0f64, |m, e| m.max(e.abs()));
    Ok(serde_json::json!({
        "schema": SCORE_SCHEMA,
        "protocol": PROTOCOL_ID,
        "note": "statistics of the series given; no pass mark is set here",
        "samples": n,
        "sample_interval_s": tau0,
        "time_to_first_sample_s": s.t[0],
        "availability": availability,
        "gaps": gaps,
        "has_reference": s.reference.is_some(),
        "bias_ug": if s.reference.is_some() { serde_json::json!(mean(&err) / G0 * 1e6) } else { serde_json::Value::Null },
        "error_rms_ug": err_rms / G0 * 1e6,
        "largest_error_ug": largest / G0 * 1e6,
        "white_asd_m_s2_per_sqrt_hz": asd,
        "vrw_m_s_per_sqrt_h": asd * 60.0,
        "bias_instability_ug": ad_min / 0.664 / G0 * 1e6,
        "bias_instability_tau_s": tau_min,
        "rate_random_walk_m_s2_per_sqrt_s": rrw,
        "allan_deviation": curve.iter().map(|(t, a)| serde_json::json!({"tau_s": t, "adev_m_s2": a})).collect::<Vec<_>>(),
        "linearity": lin,
        "fringe_jumps": fringe_jumps,
    }))
}

// ─────────────────────────────── CLI ───────────────────────────────

/// `kshana quantum-bench <protocol|simulate|score> ...`; returns the exit code.
pub fn run_cli(args: &[String]) -> i32 {
    match run_inner(args) {
        Ok(()) => 0,
        Err(e) => {
            eprintln!("{e}");
            2
        }
    }
}

fn bench_err(e: BenchError) -> String {
    match e {
        BenchError::Sensor => crate::terr!("e-quantum-bench-bad-sensor"),
        BenchError::Run => crate::terr!("e-quantum-bench-bad-run"),
        BenchError::TooShort => crate::terr!("e-quantum-bench-too-short"),
        BenchError::Csv(row) => crate::terr!("e-quantum-bench-bad-csv", row = row),
    }
}

fn run_inner(args: &[String]) -> Result<(), String> {
    let usage = || crate::t!("quantum-bench-usage");
    let Some(sub) = args.first() else {
        return Err(usage());
    };
    if args.iter().any(|a| a == "--help" || a == "-h") {
        println!("{}", usage());
        return Ok(());
    }
    let (mut out, mut fringe, mut pos) = (None, None, Vec::new());
    let mut i = 1;
    while i < args.len() {
        let a = args[i].as_str();
        let mut val = || {
            i += 1;
            args.get(i)
                .cloned()
                .ok_or_else(|| crate::terr!("e-quantum-bench-missing-value", option = a))
        };
        match a {
            "--out" => out = Some(val()?),
            "--fringe-m-s2" => {
                let v = val()?;
                fringe = Some(
                    v.parse::<f64>()
                        .ok()
                        .filter(|x| x.is_finite() && *x > 0.0)
                        .ok_or_else(|| {
                            crate::terr!(
                                "e-quantum-bench-bad-number",
                                option = "--fringe-m-s2",
                                value = v
                            )
                        })?,
                );
            }
            s if s.starts_with('-') => {
                return Err(crate::terr!("e-quantum-bench-unknown-option", option = s))
            }
            s => pos.push(s.to_string()),
        }
        i += 1;
    }
    let read = |p: &str| {
        std::fs::read_to_string(p)
            .map_err(|e| crate::terr!("e-quantum-bench-cannot-read", path = p, e = e))
    };
    let write = |p: &str, body: &str| {
        std::fs::write(p, body)
            .map_err(|e| crate::terr!("e-quantum-bench-cannot-write", path = p, e = e))
    };
    match sub.as_str() {
        "protocol" => {
            let s = serde_json::to_string_pretty(&protocol()).unwrap_or_default() + "\n";
            match out {
                Some(p) => write(&p, &s),
                None => {
                    print!("{s}");
                    Ok(())
                }
            }
        }
        "simulate" => {
            let [p] = pos.as_slice() else {
                return Err(usage());
            };
            let Some(o) = out else { return Err(usage()) };
            let spec: SimSpec = toml::from_str(&read(p)?)
                .map_err(|e| crate::terr!("e-quantum-bench-bad-spec", path = p.as_str(), e = e))?;
            let samples = simulate(&spec).map_err(bench_err)?;
            let mut body = format!(
                "# MODELLED cold-atom accelerometer output, kshana quantum-bench simulate ({PROTOCOL_ID}); predictions: {}\n",
                predictions(&spec)
            );
            body.push_str(&samples_csv(&samples));
            write(&o, &body)?;
            eprintln!(
                "{}",
                crate::t!(
                    "quantum-bench-simulated",
                    n = samples.len(),
                    n_wrapped = samples.iter().filter(|s| s.wrapped).count(),
                    path = o.as_str()
                )
            );
            Ok(())
        }
        "score" => {
            let [p] = pos.as_slice() else {
                return Err(usage());
            };
            let series = read_csv(&read(p)?).map_err(bench_err)?;
            let mut doc = score(&series, fringe).map_err(bench_err)?;
            doc["input"] = serde_json::json!(p);
            let s = serde_json::to_string_pretty(&doc).unwrap_or_default() + "\n";
            match out {
                Some(o) => write(&o, &s),
                None => {
                    print!("{s}");
                    Ok(())
                }
            }
        }
        _ => Err(usage()),
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_sensitivity_weighted_mean_of_a_constant_is_the_constant() {
        // ∫ g_a = T² for the triangle, so a constant passes unchanged; a sine at the
        // interferometer's first null f = 1/T averages to zero over [0, 2T].
        let spec: SimSpec = toml::from_str(
            "[sensor]\npulse_sep_t_s = 0.1\natom_number = 1e6\ncontrast = 0.5\ncycle_time_s = 0.5\n\
             [errors]\n[profile]\nconstant_m_s2 = 1e-4\n[run]\nduration_s = 5.0\n",
        )
        .unwrap();
        for s in simulate(&spec).unwrap() {
            assert!((s.reference_m_s2 - 1e-4).abs() < 1e-12);
        }
        let mut sine = spec.clone();
        sine.profile = ProfileCfg {
            constant_m_s2: 0.0,
            sine_amplitude_m_s2: 1e-3,
            sine_hz: 10.0,
            steps: vec![],
        };
        for s in simulate(&sine).unwrap() {
            assert!(s.reference_m_s2.abs() < 1e-7, "{}", s.reference_m_s2);
        }
    }
}
