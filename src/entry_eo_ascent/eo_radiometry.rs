// SPDX-License-Identifier: AGPL-3.0-only
//! Electro-optical imager radiometry and image quality: the `eo-radiometry` scenario kind.
//!
//! **Signal.** A Lambertian scene of reflectance `ρ` under a solar spectral irradiance `E_s`
//! (W m⁻² µm⁻¹) at solar zenith angle `θ_s`, seen through a two-way atmospheric transmittance
//! `τ_a`, plus a path radiance `L_p`, gives the at-aperture spectral radiance
//! `L = ρ E_s cos θ_s τ_a / π + L_p` (W m⁻² sr⁻¹ µm⁻¹). The focal-plane irradiance follows the
//! camera equation `E_fp = π τ_o L / (1 + 4 F²)` (Slater, *Remote Sensing: Optics and Optical
//! Systems*), with optics transmittance `τ_o` and f-number `F`. Over a pixel of pitch `p`, a band
//! `Δλ` and integration time `t`, the signal in electrons is
//! `S = E_fp p² Δλ t η λ / (h c)`, with quantum efficiency `η` at the band centre `λ`.
//!
//! **Noise.** Photon shot noise `√S`, dark current `D t` (electrons), read noise `σ_r`, and
//! quantisation `q / √12` with `q` the full well over `2^bits`:
//! `SNR = S / √(S + D t + σ_r² + q²/12)`.
//!
//! **MTF at the Nyquist frequency `ν_N = 1/(2p)`.** The system MTF is the product of:
//! - diffraction for an unobscured circular aperture,
//!   `(2/π)(acos x − x √(1−x²))` with `x = ν λ F`;
//! - the detector aperture `|sinc(f p ν)|` with linear fill factor `f`;
//! - linear smear of `s` pixels during integration, `|sinc(s p ν)|`;
//! - Gaussian jitter of `σ_j` pixels rms, `exp(−2 π² (σ_j p)² ν²)`.
//!
//! **Image quality.** The edge response is
//! `ER(x) = ½ + (1/π) ∫₀^∞ OTF(ν) sin(2πνx) / ν dν`, with the signed (real) OTF whose modulus
//! is the MTF.
//! The relative edge response is `RER = ER(+½ px) − ER(−½ px)`, and the overshoot `H` is the
//! largest `ER` between 1 and 3 pixels, or `ER(1.25 px)` when the response is monotone. The
//! design parameter is `Q = λ F / p`. NIIRS comes from the General Image Quality Equation,
//! version 4 (Leachtenauer et al., *Applied Optics* 36(32), 1997), with no MTF compensation
//! (noise gain `G = 1`):
//!
//! ```text
//!   NIIRS = 10.251 − a·log10(GSD_in) + b·log10(RER) − 0.656 H − 0.344 G/SNR
//! ```
//!
//! Here `a = 3.32` and `b = 1.559` when `RER ≥ 0.9`, else `a = 3.16` and `b = 2.817`, and
//! `GSD_in` is the ground sample distance in inches.
//!
//! HONEST SCOPE (MODELLED): a single band-averaged radiance, a single pixel at nadir, no
//! stray light, no MTF compensation, no atmospheric MTF, no aliasing estimate. The GIQE is an
//! empirical regression with its own error (about ±0.3 NIIRS in its publication); the NIIRS
//! reported here is that regression evaluated on the modelled inputs, not a rated image.

use crate::portable_math::PortableFloat;
use serde::Deserialize;
use std::f64::consts::PI;

/// Planck constant (J s).
const H_PLANCK: f64 = 6.626_070_15e-34;
/// Speed of light (m/s).
const C_LIGHT: f64 = 299_792_458.0;

fn sinc(x: f64) -> f64 {
    if x.abs() < 1e-12 {
        1.0
    } else {
        (PI * x).psin() / (PI * x)
    }
}

/// The imager and its viewing geometry.
#[derive(Clone, Debug)]
pub struct Imager {
    /// Band-centre wavelength (m).
    pub wavelength_m: f64,
    /// f-number.
    pub f_number: f64,
    /// Pixel pitch (m).
    pub pitch_m: f64,
    /// Linear detector fill factor (0, 1].
    pub fill_factor: f64,
    /// Linear smear during integration (pixels).
    pub smear_px: f64,
    /// Gaussian line-of-sight jitter, rms (pixels).
    pub jitter_px: f64,
}

impl Imager {
    /// The optical cutoff frequency `1/(λF)` (cycles/m in the focal plane).
    pub fn cutoff(&self) -> f64 {
        1.0 / (self.wavelength_m * self.f_number)
    }

    /// The Nyquist frequency `1/(2p)` (cycles/m in the focal plane).
    pub fn nyquist(&self) -> f64 {
        0.5 / self.pitch_m
    }

    /// The four MTF factors at spatial frequency `nu` (cycles/m): diffraction, detector, smear,
    /// jitter.
    pub fn mtf_factors(&self, nu: f64) -> [f64; 4] {
        let x = nu.abs() / self.cutoff();
        let diff = if x >= 1.0 {
            0.0
        } else {
            (2.0 / PI) * (x.pacos() - x * (1.0 - x * x).sqrt())
        };
        let det = sinc(self.fill_factor * self.pitch_m * nu).abs();
        let smear = sinc(self.smear_px * self.pitch_m * nu).abs();
        let s = self.jitter_px * self.pitch_m;
        let jit = (-2.0 * PI * PI * s * s * nu * nu).pexp();
        [diff, det, smear, jit]
    }

    /// The system MTF at `nu` (cycles/m).
    pub fn mtf(&self, nu: f64) -> f64 {
        self.mtf_factors(nu).iter().product()
    }

    /// The system optical transfer function at `nu` (cycles/m): the MTF with the sign of the
    /// detector and smear sinc lobes kept. All four factors are real and even, so the OTF is
    /// real. The edge response needs the signed OTF; its modulus is the MTF.
    pub fn otf(&self, nu: f64) -> f64 {
        let f = self.mtf_factors(nu);
        f[0] * sinc(self.fill_factor * self.pitch_m * nu)
            * sinc(self.smear_px * self.pitch_m * nu)
            * f[3]
    }

    /// The edge response at `x_px` pixels from the edge, by Simpson's rule over the MTF up to
    /// the optical cutoff (diffraction makes the MTF zero beyond it) or 200 cycles per pixel,
    /// whichever is lower, with `n` intervals. Beyond 200 cycles per pixel the detector-aperture
    /// tail changes the edge response by less than about 2e-4.
    pub fn edge_response(&self, x_px: f64, n: usize) -> f64 {
        let x = x_px * self.pitch_m;
        let nu_max = self.cutoff().min(200.0 / self.pitch_m);
        let n = n.max(2) & !1;
        let h = nu_max / n as f64;
        // Integrand MTF(ν) sin(2πνx)/ν, with its limit 2πx at ν = 0.
        let f = |nu: f64| {
            if nu == 0.0 {
                2.0 * PI * x
            } else {
                self.otf(nu) * (2.0 * PI * nu * x).psin() / nu
            }
        };
        let mut s = f(0.0) + f(nu_max);
        for i in 1..n {
            s += if i % 2 == 1 { 4.0 } else { 2.0 } * f(i as f64 * h);
        }
        0.5 + (s * h / 3.0) / PI
    }

    /// The relative edge response `ER(+½) − ER(−½)`.
    pub fn rer(&self) -> f64 {
        self.edge_response(0.5, 40_000) - self.edge_response(-0.5, 40_000)
    }

    /// GIQE 4 overshoot `H`: the largest edge response between 1 and 3 pixels, or `ER(1.25)`
    /// when the response rises monotonically over that range.
    pub fn overshoot_h(&self) -> f64 {
        let er: Vec<f64> = (0..=40)
            .map(|i| self.edge_response(1.0 + 0.05 * i as f64, 40_000))
            .collect();
        let monotone = er.windows(2).all(|w| w[1] >= w[0] - 1e-12);
        if monotone {
            self.edge_response(1.25, 40_000)
        } else {
            er.iter().cloned().fold(f64::MIN, f64::max)
        }
    }

    /// `Q = λF/p`.
    pub fn q(&self) -> f64 {
        self.wavelength_m * self.f_number / self.pitch_m
    }
}

/// GIQE version 4 NIIRS from the geometric-mean GSD (m), RER, overshoot `H`, noise gain `G` and
/// SNR.
pub fn giqe4_niirs(gsd_m: f64, rer: f64, h: f64, g: f64, snr: f64) -> f64 {
    let gsd_in = gsd_m / 0.0254;
    let (a, b) = if rer >= 0.9 {
        (3.32, 1.559)
    } else {
        (3.16, 2.817)
    };
    10.251 - a * gsd_in.plog10() + b * rer.plog10() - 0.656 * h - 0.344 * g / snr
}

/// The scene, the detector and the result of the signal-to-noise budget.
#[derive(Clone, Debug)]
pub struct SnrBudget {
    /// At-aperture spectral radiance (W m⁻² sr⁻¹ µm⁻¹).
    pub radiance: f64,
    /// Focal-plane spectral irradiance (W m⁻² µm⁻¹).
    pub focal_plane_irradiance: f64,
    /// Signal (electrons).
    pub signal_e: f64,
    /// Total noise (electrons rms).
    pub noise_e: f64,
    /// Signal-to-noise ratio.
    pub snr: f64,
    /// Signal over the full well.
    pub well_fill: f64,
}

/// Scene and detector inputs of the budget.
#[derive(Clone, Copy, Debug)]
pub struct Radiometry {
    pub reflectance: f64,
    pub solar_irradiance_w_m2_um: f64,
    pub sun_zenith_rad: f64,
    pub atmospheric_transmittance: f64,
    pub path_radiance: f64,
    pub optics_transmittance: f64,
    pub bandwidth_um: f64,
    pub integration_s: f64,
    pub quantum_efficiency: f64,
    pub dark_e_s: f64,
    pub read_noise_e: f64,
    pub full_well_e: f64,
    pub adc_bits: u32,
}

/// The signal-to-noise budget for `r` through `im`.
pub fn snr_budget(r: &Radiometry, im: &Imager) -> SnrBudget {
    let l = r.reflectance
        * r.solar_irradiance_w_m2_um
        * r.sun_zenith_rad.pcos()
        * r.atmospheric_transmittance
        / PI
        + r.path_radiance;
    let e_fp = PI * r.optics_transmittance * l / (1.0 + 4.0 * im.f_number * im.f_number);
    let photon_energy = H_PLANCK * C_LIGHT / im.wavelength_m;
    let power = e_fp * im.pitch_m * im.pitch_m * r.bandwidth_um;
    let s = power * r.integration_s * r.quantum_efficiency / photon_energy;
    let q = r.full_well_e / 2f64.ppowi(r.adc_bits as i32);
    let var = s + r.dark_e_s * r.integration_s + r.read_noise_e.ppowi(2) + q * q / 12.0;
    let noise = var.sqrt();
    SnrBudget {
        radiance: l,
        focal_plane_irradiance: e_fp,
        signal_e: s,
        noise_e: noise,
        snr: s / noise,
        well_fill: s / r.full_well_e,
    }
}

fn d_alt() -> f64 {
    500_000.0
}
fn d_focal() -> f64 {
    3.6
}
fn d_ap() -> f64 {
    0.40
}
fn d_pitch() -> f64 {
    5.5
}
fn d_wl() -> f64 {
    0.65
}
fn d_bw() -> f64 {
    0.2
}
fn d_fill() -> f64 {
    1.0
}
fn d_smear() -> f64 {
    0.2
}
fn d_jitter() -> f64 {
    0.1
}
fn d_refl() -> f64 {
    0.15
}
fn d_esun() -> f64 {
    1550.0
}
fn d_sza() -> f64 {
    40.0
}
fn d_tau_a() -> f64 {
    0.7
}
fn d_tau_o() -> f64 {
    0.8
}
fn d_tint() -> f64 {
    0.5e-3
}
fn d_qe() -> f64 {
    0.6
}
fn d_dark() -> f64 {
    50.0
}
fn d_read() -> f64 {
    20.0
}
fn d_well() -> f64 {
    30_000.0
}
fn d_bits() -> u32 {
    12
}

/// The `eo-radiometry` scenario. Every field has an illustrative default.
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct EoRadiometryScenario {
    /// `eo-radiometry` when given.
    #[serde(default)]
    pub kind: Option<String>,
    /// Orbit altitude (m); nadir viewing.
    #[serde(default = "d_alt")]
    pub altitude_m: f64,
    /// Focal length (m).
    #[serde(default = "d_focal")]
    pub focal_length_m: f64,
    /// Aperture diameter (m).
    #[serde(default = "d_ap")]
    pub aperture_m: f64,
    /// Pixel pitch (µm).
    #[serde(default = "d_pitch")]
    pub pixel_pitch_um: f64,
    /// Band-centre wavelength (µm).
    #[serde(default = "d_wl")]
    pub wavelength_um: f64,
    /// Bandwidth (µm).
    #[serde(default = "d_bw")]
    pub bandwidth_um: f64,
    /// Linear detector fill factor.
    #[serde(default = "d_fill")]
    pub fill_factor: f64,
    /// Smear during integration (pixels).
    #[serde(default = "d_smear")]
    pub smear_px: f64,
    /// Line-of-sight jitter, rms (pixels).
    #[serde(default = "d_jitter")]
    pub jitter_px_rms: f64,
    /// Scene reflectance.
    #[serde(default = "d_refl")]
    pub reflectance: f64,
    /// Band-averaged exo-atmospheric solar spectral irradiance (W m⁻² µm⁻¹).
    #[serde(default = "d_esun")]
    pub solar_irradiance_w_m2_um: f64,
    /// Solar zenith angle (deg).
    #[serde(default = "d_sza")]
    pub sun_zenith_deg: f64,
    /// Two-way atmospheric transmittance.
    #[serde(default = "d_tau_a")]
    pub atmospheric_transmittance: f64,
    /// Path radiance (W m⁻² sr⁻¹ µm⁻¹).
    #[serde(default)]
    pub path_radiance_w_m2_sr_um: f64,
    /// Optics transmittance.
    #[serde(default = "d_tau_o")]
    pub optics_transmittance: f64,
    /// Integration time (s).
    #[serde(default = "d_tint")]
    pub integration_s: f64,
    /// Quantum efficiency at the band centre.
    #[serde(default = "d_qe")]
    pub quantum_efficiency: f64,
    /// Dark current (electrons/s).
    #[serde(default = "d_dark")]
    pub dark_current_e_s: f64,
    /// Read noise (electrons rms).
    #[serde(default = "d_read")]
    pub read_noise_e: f64,
    /// Full well (electrons).
    #[serde(default = "d_well")]
    pub full_well_e: f64,
    /// ADC bits.
    #[serde(default = "d_bits")]
    pub adc_bits: u32,
}

impl Default for EoRadiometryScenario {
    fn default() -> Self {
        toml::from_str("").expect("all fields defaulted")
    }
}

const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit { path: "inputs.altitude_m", unit: "m", provenance: Input, definition: "orbit altitude, nadir viewing" },
        FieldUnit { path: "inputs.focal_length_m", unit: "m", provenance: Input, definition: "focal length" },
        FieldUnit { path: "inputs.aperture_m", unit: "m", provenance: Input, definition: "aperture diameter" },
        FieldUnit { path: "inputs.pixel_pitch_um", unit: "um", provenance: Input, definition: "pixel pitch" },
        FieldUnit { path: "inputs.wavelength_um", unit: "um", provenance: Input, definition: "band-centre wavelength" },
        FieldUnit { path: "inputs.bandwidth_um", unit: "um", provenance: Input, definition: "spectral bandwidth" },
        FieldUnit { path: "inputs.fill_factor", unit: "1", provenance: Input, definition: "linear detector fill factor" },
        FieldUnit { path: "inputs.smear_px", unit: "px", provenance: ModelledInput, definition: "linear image motion during the integration time" },
        FieldUnit { path: "inputs.jitter_px_rms", unit: "px", provenance: ModelledInput, definition: "Gaussian line-of-sight jitter, rms" },
        FieldUnit { path: "inputs.reflectance", unit: "1", provenance: ModelledInput, definition: "Lambertian scene reflectance" },
        FieldUnit { path: "inputs.solar_irradiance_w_m2_um", unit: "W/m^2/um", provenance: ModelledInput, definition: "band-averaged exo-atmospheric solar spectral irradiance" },
        FieldUnit { path: "inputs.sun_zenith_deg", unit: "deg", provenance: Input, definition: "solar zenith angle at the scene" },
        FieldUnit { path: "inputs.atmospheric_transmittance", unit: "1", provenance: ModelledInput, definition: "two-way atmospheric transmittance" },
        FieldUnit { path: "inputs.path_radiance_w_m2_sr_um", unit: "W/m^2/sr/um", provenance: ModelledInput, definition: "atmospheric path radiance added at the aperture" },
        FieldUnit { path: "inputs.optics_transmittance", unit: "1", provenance: ModelledInput, definition: "optics transmittance" },
        FieldUnit { path: "inputs.integration_s", unit: "s", provenance: Input, definition: "integration time" },
        FieldUnit { path: "inputs.quantum_efficiency", unit: "1", provenance: ModelledInput, definition: "detector quantum efficiency at the band centre" },
        FieldUnit { path: "inputs.dark_current_e_s", unit: "e/s", provenance: ModelledInput, definition: "dark current" },
        FieldUnit { path: "inputs.read_noise_e", unit: "e", provenance: ModelledInput, definition: "read noise, rms" },
        FieldUnit { path: "inputs.full_well_e", unit: "e", provenance: ModelledInput, definition: "full-well capacity" },
        FieldUnit { path: "inputs.adc_bits", unit: "count", provenance: Input, definition: "analogue-to-digital converter bits" },
        FieldUnit { path: "f_number", unit: "1", provenance: Computed, definition: "focal length over aperture diameter" },
        FieldUnit { path: "gsd_m", unit: "m", provenance: Computed, definition: "nadir ground sample distance, altitude times pitch over focal length" },
        FieldUnit { path: "q", unit: "1", provenance: Computed, definition: "lambda F / p" },
        FieldUnit { path: "radiance_w_m2_sr_um", unit: "W/m^2/sr/um", provenance: Computed, definition: "at-aperture spectral radiance" },
        FieldUnit { path: "focal_plane_irradiance_w_m2_um", unit: "W/m^2/um", provenance: Computed, definition: "camera-equation focal-plane spectral irradiance" },
        FieldUnit { path: "signal_e", unit: "e", provenance: Computed, definition: "signal electrons per pixel" },
        FieldUnit { path: "noise_e", unit: "e", provenance: Computed, definition: "total noise electrons, rms" },
        FieldUnit { path: "snr", unit: "1", provenance: Computed, definition: "signal-to-noise ratio" },
        FieldUnit { path: "well_fill", unit: "1", provenance: Computed, definition: "signal over the full well" },
        FieldUnit { path: "nyquist_cy_mm", unit: "cycles/mm", provenance: Computed, definition: "detector Nyquist frequency in the focal plane" },
        FieldUnit { path: "cutoff_cy_mm", unit: "cycles/mm", provenance: Computed, definition: "optical cutoff frequency 1/(lambda F)" },
        FieldUnit { path: "mtf_nyquist.diffraction", unit: "1", provenance: ClosedForm, definition: "unobscured circular-aperture diffraction MTF at Nyquist" },
        FieldUnit { path: "mtf_nyquist.detector", unit: "1", provenance: ClosedForm, definition: "detector-aperture MTF at Nyquist" },
        FieldUnit { path: "mtf_nyquist.smear", unit: "1", provenance: ClosedForm, definition: "linear-smear MTF at Nyquist" },
        FieldUnit { path: "mtf_nyquist.jitter", unit: "1", provenance: ClosedForm, definition: "Gaussian-jitter MTF at Nyquist" },
        FieldUnit { path: "mtf_nyquist.system", unit: "1", provenance: Computed, definition: "product of the four factors at Nyquist" },
        FieldUnit { path: "rer", unit: "1", provenance: Computed, definition: "relative edge response, ER(+0.5 px) - ER(-0.5 px), from the system MTF" },
        FieldUnit { path: "overshoot_h", unit: "1", provenance: Computed, definition: "GIQE 4 edge overshoot H" },
        FieldUnit { path: "niirs_giqe4", unit: "1", provenance: Computed, definition: "GIQE version 4 NIIRS with no MTF compensation (noise gain 1); an empirical regression evaluated on modelled inputs" },
    ]
};

impl EoRadiometryScenario {
    fn validate(&self) -> Result<(), String> {
        let pos = |v: f64, n: &str| {
            if v.is_finite() && v > 0.0 {
                Ok(())
            } else {
                Err(format!("{n} must be finite and positive"))
            }
        };
        let unit = |v: f64, n: &str| {
            if v.is_finite() && v > 0.0 && v <= 1.0 {
                Ok(())
            } else {
                Err(format!("{n} must be in (0, 1]"))
            }
        };
        let nonneg = |v: f64, n: &str| {
            if v.is_finite() && v >= 0.0 {
                Ok(())
            } else {
                Err(format!("{n} must be finite and non-negative"))
            }
        };
        pos(self.altitude_m, "altitude_m")?;
        pos(self.focal_length_m, "focal_length_m")?;
        pos(self.aperture_m, "aperture_m")?;
        pos(self.pixel_pitch_um, "pixel_pitch_um")?;
        pos(self.wavelength_um, "wavelength_um")?;
        pos(self.bandwidth_um, "bandwidth_um")?;
        unit(self.fill_factor, "fill_factor")?;
        nonneg(self.smear_px, "smear_px")?;
        nonneg(self.jitter_px_rms, "jitter_px_rms")?;
        unit(self.reflectance, "reflectance")?;
        pos(self.solar_irradiance_w_m2_um, "solar_irradiance_w_m2_um")?;
        if !(self.sun_zenith_deg.is_finite() && (0.0..90.0).contains(&self.sun_zenith_deg)) {
            return Err("sun_zenith_deg must be in [0, 90)".into());
        }
        unit(self.atmospheric_transmittance, "atmospheric_transmittance")?;
        nonneg(self.path_radiance_w_m2_sr_um, "path_radiance_w_m2_sr_um")?;
        unit(self.optics_transmittance, "optics_transmittance")?;
        pos(self.integration_s, "integration_s")?;
        unit(self.quantum_efficiency, "quantum_efficiency")?;
        nonneg(self.dark_current_e_s, "dark_current_e_s")?;
        nonneg(self.read_noise_e, "read_noise_e")?;
        pos(self.full_well_e, "full_well_e")?;
        if !(1..=24).contains(&self.adc_bits) {
            return Err("adc_bits must be in 1..=24".into());
        }
        Ok(())
    }

    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        self.validate()?;
        let f_number = self.focal_length_m / self.aperture_m;
        let im = Imager {
            wavelength_m: self.wavelength_um * 1e-6,
            f_number,
            pitch_m: self.pixel_pitch_um * 1e-6,
            fill_factor: self.fill_factor,
            smear_px: self.smear_px,
            jitter_px: self.jitter_px_rms,
        };
        let r = Radiometry {
            reflectance: self.reflectance,
            solar_irradiance_w_m2_um: self.solar_irradiance_w_m2_um,
            sun_zenith_rad: self.sun_zenith_deg.to_radians(),
            atmospheric_transmittance: self.atmospheric_transmittance,
            path_radiance: self.path_radiance_w_m2_sr_um,
            optics_transmittance: self.optics_transmittance,
            bandwidth_um: self.bandwidth_um,
            integration_s: self.integration_s,
            quantum_efficiency: self.quantum_efficiency,
            dark_e_s: self.dark_current_e_s,
            read_noise_e: self.read_noise_e,
            full_well_e: self.full_well_e,
            adc_bits: self.adc_bits,
        };
        let b = snr_budget(&r, &im);
        let gsd = self.altitude_m * im.pitch_m / self.focal_length_m;
        let nu_n = im.nyquist();
        let fac = im.mtf_factors(nu_n);
        let rer = im.rer();
        let h = im.overshoot_h();
        let niirs = giqe4_niirs(gsd, rer, h, 1.0, b.snr);
        let json = serde_json::json!({
            "kind": "eo-radiometry",
            "label": "MODELLED — nadir imager radiometry (Lambertian scene, camera equation, shot/dark/read/quantisation noise), system MTF at Nyquist (diffraction x detector x smear x jitter), relative edge response, Q = lambda F/p and GIQE 4 NIIRS with no MTF compensation; the NIIRS is an empirical regression on modelled inputs, not a rated image",
            "units": crate::field_schema::units_block(UNITS),
            "inputs": {
                "altitude_m": self.altitude_m,
                "focal_length_m": self.focal_length_m,
                "aperture_m": self.aperture_m,
                "pixel_pitch_um": self.pixel_pitch_um,
                "wavelength_um": self.wavelength_um,
                "bandwidth_um": self.bandwidth_um,
                "fill_factor": self.fill_factor,
                "smear_px": self.smear_px,
                "jitter_px_rms": self.jitter_px_rms,
                "reflectance": self.reflectance,
                "solar_irradiance_w_m2_um": self.solar_irradiance_w_m2_um,
                "sun_zenith_deg": self.sun_zenith_deg,
                "atmospheric_transmittance": self.atmospheric_transmittance,
                "path_radiance_w_m2_sr_um": self.path_radiance_w_m2_sr_um,
                "optics_transmittance": self.optics_transmittance,
                "integration_s": self.integration_s,
                "quantum_efficiency": self.quantum_efficiency,
                "dark_current_e_s": self.dark_current_e_s,
                "read_noise_e": self.read_noise_e,
                "full_well_e": self.full_well_e,
                "adc_bits": self.adc_bits,
            },
            "f_number": f_number,
            "gsd_m": gsd,
            "q": im.q(),
            "radiance_w_m2_sr_um": b.radiance,
            "focal_plane_irradiance_w_m2_um": b.focal_plane_irradiance,
            "signal_e": b.signal_e,
            "noise_e": b.noise_e,
            "snr": b.snr,
            "well_fill": b.well_fill,
            "nyquist_cy_mm": nu_n * 1e-3,
            "cutoff_cy_mm": im.cutoff() * 1e-3,
            "mtf_nyquist": {
                "diffraction": fac[0],
                "detector": fac[1],
                "smear": fac[2],
                "jitter": fac[3],
                "system": fac.iter().product::<f64>(),
            },
            "rer": rer,
            "overshoot_h": h,
            "niirs_giqe4": niirs,
        });
        let summary = format!(
            "eo-radiometry: GSD {:.2} m, Q {:.2}, SNR {:.0} (well {:.0} %), MTF@Nyquist {:.3}, RER {:.3}, GIQE4 NIIRS {:.2} (MODELLED)",
            gsd,
            im.q(),
            b.snr,
            100.0 * b.well_fill,
            fac.iter().product::<f64>(),
            rer,
            niirs
        );
        let text = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((text, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn ideal(pitch_um: f64) -> Imager {
        Imager {
            wavelength_m: 1e-12, // a tiny wavelength: diffraction MTF ~1 over the integration band
            f_number: 1.0,
            pitch_m: pitch_um * 1e-6,
            fill_factor: 1.0,
            smear_px: 0.0,
            jitter_px: 0.0,
        }
    }

    #[test]
    fn diffraction_mtf_has_its_closed_form_values() {
        let im = Imager {
            wavelength_m: 0.5e-6,
            f_number: 8.0,
            ..ideal(5.0)
        };
        let nc = im.cutoff();
        assert!((im.mtf_factors(0.0)[0] - 1.0).abs() < 1e-15);
        assert_eq!(im.mtf_factors(nc)[0], 0.0);
        // At half cutoff: (2/π)(acos 0.5 − 0.5·√0.75) = 0.39100…
        let half = im.mtf_factors(0.5 * nc)[0];
        assert!((half - 0.391_002_218_955_4).abs() < 1e-12, "{half}");
    }

    #[test]
    fn a_pure_pixel_aperture_has_a_ramp_edge_and_rer_one() {
        // Detector-only MTF: the edge is a one-pixel ramp, so ER(±0.5 px) = 1 and 0.
        let im = ideal(5.0);
        let rer = im.rer();
        assert!((rer - 1.0).abs() < 2e-3, "{rer}");
        assert!((im.edge_response(0.0, 40_000) - 0.5).abs() < 1e-9);
    }

    #[test]
    fn a_gaussian_blur_has_the_normal_cdf_edge() {
        // Jitter dominates: fill factor tiny so the detector MTF is ~1 out to the cutoff.
        let im = Imager {
            fill_factor: 1e-6,
            jitter_px: 0.6,
            ..ideal(5.0)
        };
        // ER(x) = Φ(x/σ): RER = 2Φ(0.5/0.6) − 1 = erf(0.5/(0.6√2)).
        let want = libm_erf(0.5 / (0.6 * std::f64::consts::SQRT_2));
        let rer = im.rer();
        assert!((rer - want).abs() < 2e-3, "{rer} vs {want}");
    }

    /// erf by its Maclaurin series (converges fast for |x| < 1).
    fn libm_erf(x: f64) -> f64 {
        let mut sum = 0.0;
        let mut term = x;
        for n in 0..40 {
            sum += term / (2 * n + 1) as f64;
            term *= -x * x / (n + 1) as f64;
        }
        2.0 / PI.sqrt() * sum
    }

    #[test]
    fn snr_budget_scales_as_shot_noise_when_signal_dominates() {
        let im = Imager {
            wavelength_m: 0.65e-6,
            f_number: 9.0,
            ..ideal(5.5)
        };
        let mut r = Radiometry {
            reflectance: 0.3,
            solar_irradiance_w_m2_um: 1550.0,
            sun_zenith_rad: 0.0,
            atmospheric_transmittance: 1.0,
            path_radiance: 0.0,
            optics_transmittance: 1.0,
            bandwidth_um: 0.2,
            integration_s: 1e-3,
            quantum_efficiency: 1.0,
            dark_e_s: 0.0,
            read_noise_e: 0.0,
            full_well_e: 1e6,
            adc_bits: 24,
        };
        let a = snr_budget(&r, &im);
        assert!((a.snr - a.signal_e.sqrt()).abs() / a.snr < 1e-6);
        r.integration_s *= 4.0;
        let b = snr_budget(&r, &im);
        assert!((b.signal_e / a.signal_e - 4.0).abs() < 1e-12);
        assert!((b.snr / a.snr - 2.0).abs() < 1e-6);
    }

    #[test]
    fn giqe4_switches_coefficients_at_rer_0_9_and_falls_with_gsd() {
        let n1 = giqe4_niirs(0.5, 0.95, 1.0, 1.0, 100.0);
        let n2 = giqe4_niirs(1.0, 0.95, 1.0, 1.0, 100.0);
        assert!((n1 - n2 - 3.32 * 2f64.plog10()).abs() < 1e-12);
        let lo = giqe4_niirs(0.5, 0.89, 1.0, 1.0, 100.0);
        let gsd_in: f64 = 0.5 / 0.0254;
        let want = 10.251 - 3.16 * gsd_in.plog10() + 2.817 * 0.89f64.plog10() - 0.656 - 0.00344;
        assert!((lo - want).abs() < 1e-12);
    }

    #[test]
    fn default_scenario_runs_reproducibly_and_is_fully_unit_described() {
        let s = EoRadiometryScenario::default();
        let (a, sum) = s.run_json().unwrap();
        let (b, _) = s.run_json().unwrap();
        assert_eq!(a, b);
        assert!(sum.contains("MODELLED"));
        let v: serde_json::Value = serde_json::from_str(&a).unwrap();
        assert!(v["snr"].as_f64().unwrap() > 1.0);
        let rer = v["rer"].as_f64().unwrap();
        assert!(rer > 0.0 && rer < 1.0);
    }

    #[test]
    fn bad_inputs_are_refused() {
        let s = EoRadiometryScenario {
            fill_factor: 1.5,
            ..Default::default()
        };
        assert!(s.run_json().is_err());
        let s = EoRadiometryScenario {
            sun_zenith_deg: 95.0,
            ..Default::default()
        };
        assert!(s.run_json().is_err());
    }
}
