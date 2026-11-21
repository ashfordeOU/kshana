// SPDX-License-Identifier: AGPL-3.0-only
//! Cascaded integer ambiguity resolution for any set of carriers: how likely a short-baseline RTK
//! user is to fix every ambiguity in one go, for example with L-band GNSS carriers alone or with a
//! C-band LEO carrier added.
//!
//! Each stage fixes the ambiguity of one carrier-phase combination: a "wide lane" of two carriers
//! `a`, `b` (`Φ = (f_a Φ_a − f_b Φ_b)/(f_a − f_b)`, wavelength `c/|f_a − f_b|`) or one carrier. The
//! first stage is fixed against the narrow-lane code combination of its own carriers (the
//! Melbourne-Wübbena approach: geometry-free and, for a wide lane, free of first-order ionosphere);
//! every later stage against the phase combination fixed before it (the cascade of three-carrier
//! ambiguity resolution, TCAR/CIR). A stage's float ambiguity has the one-sigma
//! `σ_N = d · sqrt(σ_Φ² + σ_R²) / (λ sqrt(n_epochs))` (with `d = 2` for double differences) and the
//! bias `b = ΔI / λ` from the residual first-order ionosphere the two sides do not share. The success
//! rate of rounding one ambiguity is the bias-affected bootstrapping rate (Teunissen 2001)
//! `P = Φ((1 − 2b)/(2σ_N)) + Φ((1 + 2b)/(2σ_N)) − 1`, raised to the number of double-difference
//! ambiguities (satellites − 1) and multiplied over the stages.
//!
//! MODELLED: white code and phase noise, no multipath, no geometry (the geometry-free form), and the
//! ionosphere only through the stated residual. A real receiver with a geometry-based float solution
//! does better than this bound on the first stages.

use super::{field_err, list_len, positive, within};
use crate::portable_math::PortableFloat;
use crate::raim::normal_cdf;
use serde::{Deserialize, Serialize};

/// Speed of light (m/s).
pub const C: f64 = 299_792_458.0;

/// One carrier.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Carrier {
    /// A short name the stages use.
    pub id: String,
    /// Frequency (MHz).
    pub f_mhz: f64,
    /// Undifferenced code one-sigma (m).
    pub code_sigma_m: f64,
    /// Undifferenced phase one-sigma (m).
    pub phase_sigma_m: f64,
}

/// One case to evaluate.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ArCase {
    /// A short name.
    pub id: String,
    /// The carriers.
    pub carriers: Vec<Carrier>,
    /// The cascade: each stage one carrier id or two (a wide lane), widest first.
    pub stages: Vec<Vec<String>>,
}

fn d_true() -> bool {
    true
}
fn d_one() -> usize {
    1
}
fn d_sats() -> usize {
    8
}
fn d_ref() -> f64 {
    1575.42
}

/// Input of `kshana leo-verify rtk-ar`.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ArInput {
    /// The cases.
    pub cases: Vec<ArCase>,
    /// Double-differenced measurements (the noise doubles in one-sigma).
    #[serde(default = "d_true")]
    pub double_difference: bool,
    /// Epochs averaged (white noise falls with their square root; the bias does not).
    #[serde(default = "d_one")]
    pub epochs: usize,
    /// Satellites in common view (the double-difference ambiguities are one fewer).
    #[serde(default = "d_sats")]
    pub satellites: usize,
    /// Residual double-difference first-order ionospheric delay at `iono_ref_mhz` (m).
    #[serde(default)]
    pub dd_iono_m: f64,
    /// Frequency the ionospheric delay is stated at (MHz).
    #[serde(default = "d_ref")]
    pub iono_ref_mhz: f64,
}

/// One stage of one case.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct StageRow {
    /// The carriers of the combination.
    pub combination: Vec<String>,
    /// Wavelength (m).
    pub wavelength_m: f64,
    /// Phase-combination noise, undifferenced (m).
    pub phase_noise_m: f64,
    /// Float-ambiguity one-sigma (cycles).
    pub sigma_cycles: f64,
    /// Ionospheric bias (cycles).
    pub bias_cycles: f64,
    /// Success rate of one ambiguity.
    pub success_one: f64,
    /// Success rate of all the double-difference ambiguities of the stage.
    pub success_all: f64,
}

/// One case's result.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct CaseReport {
    /// The case.
    pub id: String,
    /// Its stages.
    pub stages: Vec<StageRow>,
    /// Product of the stages' success rates.
    pub success: f64,
    /// Noise of the last fixed combination, double-differenced (m).
    pub fixed_noise_m: f64,
}

/// Report of `kshana leo-verify rtk-ar`.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct ArReport {
    /// Ambiguities per stage (satellites − 1).
    pub ambiguities_per_stage: usize,
    /// Every case.
    pub cases: Vec<CaseReport>,
}

/// Bias-affected bootstrapped success rate of rounding one ambiguity with one-sigma `sigma` and bias
/// `bias` (both in cycles).
pub fn rounding_success(sigma: f64, bias: f64) -> f64 {
    if sigma <= 0.0 {
        return if bias.abs() < 0.5 { 1.0 } else { 0.0 };
    }
    (normal_cdf((1.0 - 2.0 * bias) / (2.0 * sigma))
        + normal_cdf((1.0 + 2.0 * bias) / (2.0 * sigma))
        - 1.0)
        .clamp(0.0, 1.0)
}

/// The wavelength (m) of the wide lane of two frequencies (Hz).
pub fn wide_lane_m(fa_hz: f64, fb_hz: f64) -> f64 {
    C / (fa_hz - fb_hz).abs()
}

/// A combination: coefficients per carrier on phase (m) and the wavelength.
struct Combo {
    alpha: Vec<(usize, f64)>,
    lambda: f64,
}

fn combo(idx: &[usize], f: &[f64]) -> Combo {
    if idx.len() == 1 {
        return Combo {
            alpha: vec![(idx[0], 1.0)],
            lambda: C / f[idx[0]],
        };
    }
    let (a, b) = if f[idx[0]] > f[idx[1]] {
        (idx[0], idx[1])
    } else {
        (idx[1], idx[0])
    };
    let d = f[a] - f[b];
    Combo {
        alpha: vec![(a, f[a] / d), (b, -f[b] / d)],
        lambda: C / d,
    }
}

fn run_case(c: &ArCase, inp: &ArInput) -> Result<CaseReport, String> {
    list_len("cases.carriers", c.carriers.len(), 10)?;
    list_len("cases.stages", c.stages.len(), 10)?;
    let mut f = Vec::with_capacity(c.carriers.len());
    for k in &c.carriers {
        within("cases.carriers.f_mhz", k.f_mhz, 1.0, 100_000.0)?;
        positive("cases.carriers.code_sigma_m", k.code_sigma_m)?;
        positive("cases.carriers.phase_sigma_m", k.phase_sigma_m)?;
        f.push(k.f_mhz * 1e6);
    }
    let fref = inp.iono_ref_mhz * 1e6;
    let iono_of = |terms: &[(usize, f64)]| -> f64 {
        // Phase: −I (f_ref/f)², so a combination carries −I f_ref² Σ α/f².
        -inp.dd_iono_m * fref * fref * terms.iter().map(|(i, a)| a / (f[*i] * f[*i])).sum::<f64>()
    };
    let noise_of = |terms: &[(usize, f64)], code: bool| -> f64 {
        terms
            .iter()
            .map(|(i, a)| {
                let s = if code {
                    c.carriers[*i].code_sigma_m
                } else {
                    c.carriers[*i].phase_sigma_m
                };
                a * a * s * s
            })
            .sum::<f64>()
            .sqrt()
    };
    let d = if inp.double_difference { 2.0 } else { 1.0 };
    let root_n = (inp.epochs as f64).sqrt();
    let n_amb = inp.satellites - 1;
    let mut rows = Vec::with_capacity(c.stages.len());
    let mut prev: Option<(f64, f64)> = None; // (noise m, iono m) of the last fixed combination
    let mut success = 1.0;
    for st in &c.stages {
        if st.is_empty() || st.len() > 2 {
            return Err(field_err("cases.stages", st.len() as f64));
        }
        let idx = st
            .iter()
            .map(|id| {
                c.carriers.iter().position(|k| &k.id == id).ok_or_else(|| {
                    crate::terr!(
                        "e-leo-verify-unknown-id",
                        field = "cases.stages",
                        id = id.as_str()
                    )
                })
            })
            .collect::<Result<Vec<_>, _>>()?;
        if idx.len() == 2 && (f[idx[0]] - f[idx[1]]).abs() < 1.0 {
            return Err(field_err("cases.stages", f[idx[0]] / 1e6));
        }
        let cb = combo(&idx, &f);
        let phase_noise = noise_of(&cb.alpha, false);
        let phase_iono = iono_of(&cb.alpha);
        let (range_noise, range_iono) = match prev {
            Some(p) => p,
            None => {
                // Narrow-lane code of the stage's own carriers: β_i = f_i / Σ f.
                let sum: f64 = idx.iter().map(|&i| f[i]).sum();
                let beta: Vec<(usize, f64)> = idx.iter().map(|&i| (i, f[i] / sum)).collect();
                // Code: +I f_ref² Σ β/f², the opposite sign of phase.
                (noise_of(&beta, true), -iono_of(&beta))
            }
        };
        let sigma = d * (phase_noise * phase_noise + range_noise * range_noise).sqrt()
            / (cb.lambda * root_n);
        let bias = (phase_iono - range_iono) / cb.lambda;
        let one = rounding_success(sigma, bias);
        let all = one.ppowi(n_amb as i32);
        success *= all;
        rows.push(StageRow {
            combination: st.clone(),
            wavelength_m: cb.lambda,
            phase_noise_m: phase_noise,
            sigma_cycles: sigma,
            bias_cycles: bias,
            success_one: one,
            success_all: all,
        });
        prev = Some((phase_noise, phase_iono));
    }
    Ok(CaseReport {
        id: c.id.clone(),
        stages: rows,
        success,
        fixed_noise_m: d * prev.map_or(0.0, |p| p.0) / root_n,
    })
}

/// Run every case.
pub fn run(inp: &ArInput) -> Result<ArReport, String> {
    list_len("cases", inp.cases.len(), 20)?;
    if inp.epochs == 0 || inp.epochs > 1_000_000 {
        return Err(field_err("epochs", inp.epochs as f64));
    }
    if inp.satellites < 2 || inp.satellites > 200 {
        return Err(field_err("satellites", inp.satellites as f64));
    }
    within("dd_iono_m", inp.dd_iono_m, -100.0, 100.0)?;
    within("iono_ref_mhz", inp.iono_ref_mhz, 1.0, 100_000.0)?;
    let cases = inp
        .cases
        .iter()
        .map(|c| run_case(c, inp))
        .collect::<Result<Vec<_>, _>>()?;
    Ok(ArReport {
        ambiguities_per_stage: inp.satellites - 1,
        cases,
    })
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn gps_wide_lane_wavelengths_are_the_textbook_ones() {
        // L1/L2 wide lane 86.19 cm; L2/L5 extra-wide lane 5.861 m.
        assert!((wide_lane_m(1575.42e6, 1227.60e6) - 0.8619).abs() < 1e-4);
        assert!((wide_lane_m(1227.60e6, 1176.45e6) - 5.861).abs() < 1e-3);
    }

    #[test]
    fn unbiased_rounding_follows_the_normal_integral() {
        // σ = 0.25 cycle: 2Φ(2) − 1 = 0.9545.
        assert!((rounding_success(0.25, 0.0) - 0.954_499_7).abs() < 1e-6);
        // A bias lowers it.
        assert!(rounding_success(0.25, 0.2) < rounding_success(0.25, 0.0));
    }
}
