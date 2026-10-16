// SPDX-License-Identifier: AGPL-3.0-only
//! **Optical atmosphere for slant-path free-space links** — clear-air extinction, cloud
//! optical depth and optical turbulence (Hufnagel–Valley `Cn²`, Rytov variance, scintillation
//! index, gamma-gamma parameters). It replaces the single lumped `atmospheric_loss_db` of
//! [`crate::optical_linkbudget`] with a wavelength- and geometry-dependent account; the lumped
//! path stays available and unchanged when no atmosphere is supplied.
//!
//! ## Models
//!
//! * **Turbulence profile** — Hufnagel–Valley,
//!   `Cn²(h) = 0.00594 (v/27)² (10⁻⁵h)¹⁰ e^{−h/1000} + 2.7×10⁻¹⁶ e^{−h/1500} + A e^{−h/100}`
//!   (h in m, `Cn²` in m^{−2/3}); HV 5/7 is `A = 1.7×10⁻¹⁴`, `v = 21 m/s`.
//! * **Rytov variance** along a slant path of zenith angle `ζ` from the station height `h₀` to
//!   the top of the profile `H` (Andrews & Phillips, *Laser Beam Propagation through Random
//!   Media*, 2nd ed., ch. 12): plane wave
//!   `σ² = 2.25 k^{7/6} sec^{11/6}ζ ∫ Cn²(h) w(h) dh` with `w = (h−h₀)^{5/6}` for a downlink and
//!   `w = (H−h)^{5/6}` for an uplink; spherical wave `w = ((h−h₀)(H−h)/(H−h₀))^{5/6}`, the same
//!   in both directions. The integral is a fixed-step Simpson rule after the substitution that
//!   removes the `x^{5/6}` end-point singularity, so it is deterministic and portable.
//! * **Scintillation index** (Andrews & Phillips, no aperture averaging): the large- and
//!   small-scale log-irradiance variances `σ²_lnx = 0.49σ²/(1+1.11σ^{12/5})^{7/6}` and
//!   `σ²_lny = 0.51σ²/(1+0.69σ^{12/5})^{5/6}` (plane; `0.56` replaces `1.11` for the spherical
//!   large-scale term), `σ_I² = exp(σ²_lnx + σ²_lny) − 1`, and the gamma-gamma shape parameters
//!   `α = 1/(e^{σ²_lnx}−1)`, `β = 1/(e^{σ²_lny}−1)`.
//! * **Clear-air extinction** — aerosol: Kim, McArthur & Korevaar (2001) visibility law
//!   `(3.91/V)(λ/550 nm)^{−q}` with the stated `q(V)`, exponential in height (scale height
//!   `aerosol_scale_height_m`); molecular: Rayleigh `λ⁻⁴` scaling of the sea-level value over the
//!   standard scale height. Gas absorption lines are a stated input, not computed.
//! * **Cloud** — geometric-optics optical depth of a liquid column `L` (kg/m²) of effective
//!   radius `r_e`: `τ = 3L/(2 ρ_w r_e)` (extinction efficiency 2 for droplets ≫ λ).
//!
//! ## Validated vs Modelled
//!
//! The numerics (quadrature, closed forms) are checked against an independent program in
//! `xval/optical-atmosphere/` (pre-registered bars A1–A3); that validates the *implementation of
//! the stated formulas*, not the atmosphere. `Cn²` profile level, visibility, cloud water and
//! effective radius are **Modelled** inputs.

use crate::portable_math::PortableFloat;

/// Liquid-water density (kg/m³) used for the cloud optical depth.
pub const WATER_DENSITY_KG_M3: f64 = 1000.0;
/// Number of Simpson intervals of the Rytov-variance quadrature (even).
pub const RYTOV_SIMPSON_INTERVALS: usize = 20_000;

/// Hufnagel–Valley turbulence profile.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct HvProfile {
    /// Ground-level `Cn²` term `A` (m^{−2/3}); `1.7e-14` for HV 5/7.
    pub ground_cn2: f64,
    /// RMS upper-atmosphere wind `v` (m/s); `21` for HV 5/7.
    pub wind_rms_ms: f64,
}

impl HvProfile {
    /// The standard HV 5/7 profile (`A = 1.7e-14`, `v = 21 m/s`).
    pub fn hv57() -> Self {
        HvProfile {
            ground_cn2: 1.7e-14,
            wind_rms_ms: 21.0,
        }
    }

    /// `Cn²(h)` (m^{−2/3}) at height `h` (m above sea level).
    pub fn cn2(&self, h_m: f64) -> f64 {
        let w = self.wind_rms_ms / 27.0;
        0.00594 * w * w * (1.0e-5 * h_m).ppowi(10) * (-h_m / 1000.0).pexp()
            + 2.7e-16 * (-h_m / 1500.0).pexp()
            + self.ground_cn2 * (-h_m / 100.0).pexp()
    }
}

/// Wavefront model for the Rytov variance.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Wave {
    /// Plane wave (a large, collimated beam).
    Plane,
    /// Spherical wave (a point-like source); identical for up- and downlink.
    Spherical,
}

/// Propagation direction relative to the ground station.
#[derive(Debug, Clone, Copy, PartialEq, Eq)]
pub enum Direction {
    /// Space to ground.
    Downlink,
    /// Ground to space.
    Uplink,
}

/// **Rytov variance** `σ²` of a slant path (zenith angle `zenith_rad`) from station height
/// `h0_m` to the top of the profile `top_m`, at wavelength `wavelength_m`.
pub fn rytov_variance(
    wavelength_m: f64,
    zenith_rad: f64,
    h0_m: f64,
    top_m: f64,
    profile: &HvProfile,
    wave: Wave,
    direction: Direction,
) -> f64 {
    let k = 2.0 * std::f64::consts::PI / wavelength_m;
    let span = top_m - h0_m;
    let sec = 1.0 / zenith_rad.pcos();
    let n = RYTOV_SIMPSON_INTERVALS;
    // Substitution u = (distance from the singular end)^{1/6}: the weight x^{5/6} becomes u^5
    // and dx = 6u^5 du, so the integrand is smooth.
    let u_max = span.ppowf(1.0 / 6.0);
    let from_ground = matches!(
        (wave, direction),
        (Wave::Plane, Direction::Downlink) | (Wave::Spherical, _)
    );
    let f = |u: f64| -> f64 {
        let x = u.ppowi(6);
        let h = if from_ground { h0_m + x } else { top_m - x };
        let w = match wave {
            Wave::Plane => u.ppowi(5),
            Wave::Spherical => {
                let a = h - h0_m;
                let b = top_m - h;
                (a.max(0.0) * b.max(0.0) / span).ppowf(5.0 / 6.0)
            }
        };
        profile.cn2(h) * w * 6.0 * u.ppowi(5)
    };
    let hstep = u_max / n as f64;
    let mut s = f(0.0) + f(u_max);
    for i in 1..n {
        let c = if i % 2 == 1 { 4.0 } else { 2.0 };
        s += c * f(hstep * i as f64);
    }
    let integral = s * hstep / 3.0;
    2.25 * k.ppowf(7.0 / 6.0) * sec.ppowf(11.0 / 6.0) * integral
}

/// Log-irradiance variance components and gamma-gamma parameters for a Rytov variance.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct Scintillation {
    /// Large-scale log-irradiance variance `σ²_lnx`.
    pub sigma2_lnx: f64,
    /// Small-scale log-irradiance variance `σ²_lny`.
    pub sigma2_lny: f64,
    /// Scintillation index `σ_I² = exp(σ²_lnx + σ²_lny) − 1`.
    pub scintillation_index: f64,
    /// Gamma-gamma large-scale parameter `α`.
    pub alpha: f64,
    /// Gamma-gamma small-scale parameter `β`.
    pub beta: f64,
}

/// Scintillation statistics (no aperture averaging) for Rytov variance `sigma2_rytov`.
pub fn scintillation(sigma2_rytov: f64, wave: Wave) -> Scintillation {
    let s = sigma2_rytov.max(0.0);
    let s125 = s.ppowf(12.0 / 5.0);
    let c_large = match wave {
        Wave::Plane => 1.11,
        Wave::Spherical => 0.56,
    };
    let sigma2_lnx = 0.49 * s / (1.0 + c_large * s125).ppowf(7.0 / 6.0);
    let sigma2_lny = 0.51 * s / (1.0 + 0.69 * s125).ppowf(5.0 / 6.0);
    Scintillation {
        sigma2_lnx,
        sigma2_lny,
        scintillation_index: (sigma2_lnx + sigma2_lny).pexp_m1(),
        alpha: 1.0 / sigma2_lnx.pexp_m1(),
        beta: 1.0 / sigma2_lny.pexp_m1(),
    }
}

/// **Cloud optical depth** `τ = 3L/(2 ρ_w r_e)` for a liquid-water column `lwp_kg_m2` and
/// effective droplet radius `r_eff_m` (geometric-optics limit, extinction efficiency 2). Zenith
/// value; multiply by `sec ζ` for a slant path.
pub fn cloud_optical_depth(lwp_kg_m2: f64, r_eff_m: f64) -> f64 {
    3.0 * lwp_kg_m2 / (2.0 * WATER_DENSITY_KG_M3 * r_eff_m)
}

/// Clear-air extinction inputs.
#[derive(Debug, Clone, Copy, PartialEq)]
pub struct ClearAirParams {
    /// Meteorological visibility `V` (km) at 550 nm.
    pub visibility_km: f64,
    /// Aerosol scale height (m).
    pub aerosol_scale_height_m: f64,
}

impl Default for ClearAirParams {
    fn default() -> Self {
        ClearAirParams {
            visibility_km: 23.0,
            aerosol_scale_height_m: 1200.0,
        }
    }
}

/// Sea-level Rayleigh extinction at 550 nm (1/km).
const RAYLEIGH_550_PER_KM: f64 = 0.0116;
/// Molecular scale height (m).
const MOLECULAR_SCALE_HEIGHT_M: f64 = 8400.0;

/// Kim et al. size-distribution exponent `q(V)`.
fn kim_q(v_km: f64) -> f64 {
    if v_km > 50.0 {
        1.6
    } else if v_km > 6.0 {
        1.3
    } else if v_km > 1.0 {
        0.16 * v_km + 0.34
    } else if v_km > 0.5 {
        v_km - 0.5
    } else {
        0.0
    }
}

/// **Clear-air zenith optical depth** (aerosol + Rayleigh) from `h0_m` to `top_m` at
/// `wavelength_m`. Multiply by `sec ζ` for a slant path.
pub fn clear_air_optical_depth(
    wavelength_m: f64,
    h0_m: f64,
    top_m: f64,
    p: &ClearAirParams,
) -> f64 {
    let lam_nm = wavelength_m * 1.0e9;
    let ratio = lam_nm / 550.0;
    let alpha0_per_m = 3.91 / p.visibility_km * ratio.ppowf(-kim_q(p.visibility_km)) / 1000.0;
    let ha = p.aerosol_scale_height_m;
    let tau_aer = alpha0_per_m * ha * ((-h0_m / ha).pexp() - (-top_m / ha).pexp());
    let ray0_per_m = RAYLEIGH_550_PER_KM * ratio.ppowi(-4) / 1000.0;
    let hm = MOLECULAR_SCALE_HEIGHT_M;
    let tau_mol = ray0_per_m * hm * ((-h0_m / hm).pexp() - (-top_m / hm).pexp());
    tau_aer + tau_mol
}

/// Slant-path power transmittance `exp(−τ_zenith · sec ζ)`.
pub fn slant_transmittance(tau_zenith: f64, zenith_rad: f64) -> f64 {
    (-tau_zenith / zenith_rad.pcos()).pexp()
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Zero turbulence gives zero Rytov variance and zero scintillation.
    #[test]
    fn zero_rytov_gives_zero_scintillation() {
        let p = HvProfile {
            ground_cn2: 0.0,
            wind_rms_ms: 0.0,
        };
        // the 2.7e-16 background term remains in HV, so the variance is small but positive
        let s = rytov_variance(
            1.55e-6,
            0.0,
            0.0,
            30e3,
            &p,
            Wave::Plane,
            Direction::Downlink,
        );
        assert!(s > 0.0 && s < 0.05, "{s}");
        let sc = scintillation(0.0, Wave::Plane);
        assert_eq!(sc.sigma2_lnx, 0.0);
        assert_eq!(sc.scintillation_index, 0.0);
    }

    #[test]
    fn plane_uplink_exceeds_downlink_exceeds_spherical() {
        let p = HvProfile::hv57();
        let args = (1.55e-6, 0.0, 0.0, 30e3);
        let dl = rytov_variance(
            args.0,
            args.1,
            args.2,
            args.3,
            &p,
            Wave::Plane,
            Direction::Downlink,
        );
        let ul = rytov_variance(
            args.0,
            args.1,
            args.2,
            args.3,
            &p,
            Wave::Plane,
            Direction::Uplink,
        );
        let sp = rytov_variance(
            args.0,
            args.1,
            args.2,
            args.3,
            &p,
            Wave::Spherical,
            Direction::Uplink,
        );
        // ground-layer turbulence is weighted ~0 for a downlink plane wave but fully for uplink
        assert!(ul > dl && dl > sp);
    }

    #[test]
    fn cloud_depth_closed_form() {
        // 0.1 kg/m2 at 10 um: 3*0.1/(2*1000*1e-5) = 15
        assert!((cloud_optical_depth(0.1, 10e-6) - 15.0).abs() < 1e-12);
    }
}
