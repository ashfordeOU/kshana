// SPDX-License-Identifier: AGPL-3.0-only
//! First-order ionospheric group delay per band, the slant total electron content (TEC) seen
//! on a link to a LEO satellite, and the dual-frequency ionosphere-free combination.
//!
//! * [`group_delay_m`]: the first-order group delay `I = 40.3·STEC/f²` (m), STEC the slant TEC
//!   in electrons/m² (Misra & Enge, *Global Positioning System: Signals, Measurements, and Performance*; the same constant
//!   underlies the IS-GPS-200 group-delay ratio `γ = (f_L1/f_L2)²`).
//! * [`stec_from_klobuchar`]: slant TEC from the engine's Klobuchar model
//!   ([`crate::gnss_sim::klobuchar_delay_m`], IS-GPS-200 § 20.3.3.5.2.5), which describes a
//!   path through the whole ionosphere.
//! * [`fraction_below`]: the fraction of the vertical electron content that lies below a
//!   satellite at height `h`, for a Chapman layer of peak height `h_m` and scale height `H`:
//!   `erfc(√(½·exp(−(h − h_m)/H)))`. A LEO satellite near 500 km sits in the topside, so part
//!   of the electron content is above it and does not delay its signal. This is a modelled
//!   scaling (a single Chapman layer has no plasmasphere); it can be overridden by a stated
//!   fraction.
//! * [`iono_free_coefficients`] and [`iono_free_noise_amplification`]: the combination
//!   `P_IF = a₁P₁ + a₂P₂`, `a₁ = f₁²/(f₁² − f₂²)`, `a₂ = −f₂²/(f₁² − f₂²)`, which removes the
//!   first-order delay and amplifies independent noise by `√(a₁²σ₁² + a₂²σ₂²)`.
//! * [`dll_code_noise_m`]: the thermal code-tracking noise of a non-coherent early-minus-late
//!   power delay-locked loop for a BPSK (binary phase-shift keying) signal,
//!   `σ = T_c·c·√(B_L·d/(2·C/N0)·(1 + 2/(T·C/N0·(2 − d))))` (Kaplan & Hegarty, *Understanding
//!   GPS/GNSS: Principles and Applications*, 3rd ed., the code-tracking thermal-noise
//!   expression for an infinite front-end bandwidth).

use super::C_M_S;

/// First-order ionospheric constant (m³/s²): `I = K·STEC/f²`.
pub const K_IONO: f64 = 40.3;
/// One TEC unit (electrons/m²).
pub const TECU: f64 = 1.0e16;

/// First-order group delay (m) at `f_hz` for slant TEC `stec_el_m2` (electrons/m²).
pub fn group_delay_m(stec_el_m2: f64, f_hz: f64) -> f64 {
    K_IONO * stec_el_m2 / (f_hz * f_hz)
}

/// Slant TEC (electrons/m²) that produces the Klobuchar L1 delay for the given geometry.
pub fn stec_from_klobuchar(
    coeffs: &crate::gnss_sim::KlobucharCoeffs,
    lat_rad: f64,
    lon_rad: f64,
    el_rad: f64,
    az_rad: f64,
    gps_sod: f64,
) -> f64 {
    let d = crate::gnss_sim::klobuchar_delay_m(coeffs, lat_rad, lon_rad, el_rad, az_rad, gps_sod);
    d * crate::gnss_sim::L1_HZ * crate::gnss_sim::L1_HZ / K_IONO
}

/// Single-layer mapping function at elevation `el_rad` for a shell at `shell_m` above a sphere
/// of radius `re_m`: `1/√(1 − (re·cos el/(re + h))²)`.
pub fn single_layer_mapping(el_rad: f64, re_m: f64, shell_m: f64) -> f64 {
    let x = re_m * el_rad.cos() / (re_m + shell_m);
    1.0 / (1.0 - x * x).max(1e-9).sqrt()
}

/// Complementary error function, via the engine's error function.
fn erfc(x: f64) -> f64 {
    1.0 - crate::detection::erf(x)
}

/// Fraction of the vertical electron content below height `h_m` for a Chapman layer with peak
/// at `peak_m` and scale height `scale_m`.
pub fn fraction_below(h_m: f64, peak_m: f64, scale_m: f64) -> f64 {
    let z = (h_m - peak_m) / scale_m.max(1.0);
    let x = 0.5 * (-z).exp();
    erfc(x.sqrt()).clamp(0.0, 1.0)
}

/// Ionosphere-free combination coefficients `(a₁, a₂)` for carriers `f1_hz`, `f2_hz`.
pub fn iono_free_coefficients(f1_hz: f64, f2_hz: f64) -> (f64, f64) {
    let (a, b) = (f1_hz * f1_hz, f2_hz * f2_hz);
    (a / (a - b), -b / (a - b))
}

/// Slant total electron content (TEC units, 1e16 electrons/m²) from the geometry-free code
/// combination of two pseudoranges (or two first-order group delays) `p1_m` on `f1_hz` and
/// `p2_m` on `f2_hz`: `((p2 − p1) + dcb) f1² f2² / (40.3 (f1² − f2²)) / 1e16`. The geometry,
/// clocks and troposphere cancel in `p2 − p1`; `dcb_p1_minus_p2_m` is the receiver plus
/// satellite differential code bias of `P1 − P2` in metres (zero for modelled delays), which the
/// measured difference carries with the opposite sign and is added back here.
pub fn geometry_free_stec_tecu(p1_m: f64, p2_m: f64, f1_hz: f64, f2_hz: f64, dcb_p1_minus_p2_m: f64) -> f64 {
    let (a, b) = (f1_hz * f1_hz, f2_hz * f2_hz);
    ((p2_m - p1_m) + dcb_p1_minus_p2_m) * a * b / (40.3 * (a - b)) / TECU
}

/// Noise amplification of the ionosphere-free combination for per-band noise `sigma1`,
/// `sigma2`: `√(a₁²σ₁² + a₂²σ₂²)`. With `sigma1 = sigma2 = 1` it is the familiar factor
/// (2.98 for GPS L1/L2, 2.59 for L1/L5).
pub fn iono_free_noise_amplification(f1_hz: f64, f2_hz: f64, sigma1: f64, sigma2: f64) -> f64 {
    let (a1, a2) = iono_free_coefficients(f1_hz, f2_hz);
    (a1 * a1 * sigma1 * sigma1 + a2 * a2 * sigma2 * sigma2).sqrt()
}

/// Thermal code-tracking noise (m, one sigma) of a non-coherent early-minus-late power DLL on a
/// BPSK signal: chip rate `chip_rate_hz`, carrier-to-noise density `cn0_dbhz`, loop bandwidth
/// `bl_hz`, early-late spacing `d_chips`, coherent integration `t_s`.
pub fn dll_code_noise_m(
    chip_rate_hz: f64,
    cn0_dbhz: f64,
    bl_hz: f64,
    d_chips: f64,
    t_s: f64,
) -> f64 {
    let cn0 = 10f64.powf(cn0_dbhz / 10.0);
    let var_chips = bl_hz * d_chips / (2.0 * cn0) * (1.0 + 2.0 / (t_s * cn0 * (2.0 - d_chips)));
    var_chips.sqrt() * C_M_S / chip_rate_hz
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn delay_scales_as_one_over_f_squared() {
        let stec = 50.0 * TECU;
        let d1 = group_delay_m(stec, 1.2e9);
        let d2 = group_delay_m(stec, 2.4e9);
        assert!((d1 / d2 - 4.0).abs() < 1e-12);
        // 1 TECU at L1 is 0.1624 m.
        assert!((group_delay_m(TECU, crate::gnss_sim::L1_HZ) - 0.162_376).abs() < 1e-5);
    }

    #[test]
    fn chapman_fraction_is_half_at_about_the_peak_and_tends_to_one_high_up() {
        let f_peak = fraction_below(350e3, 350e3, 100e3);
        assert!((f_peak - erfc(0.5f64.sqrt())).abs() < 1e-6);
        assert!(fraction_below(20_000e3, 350e3, 100e3) > 0.999);
        assert!(fraction_below(0.0, 350e3, 100e3) < 1e-6);
        let leo = fraction_below(510e3, 350e3, 100e3);
        assert!((0.5..0.8).contains(&leo), "{leo}");
    }

    #[test]
    fn iono_free_combination_removes_the_first_order_delay() {
        let (f1, f2) = (1575.42e6, 1176.45e6);
        let (a1, a2) = iono_free_coefficients(f1, f2);
        assert!((a1 + a2 - 1.0).abs() < 1e-12);
        let stec = 30.0 * TECU;
        let resid = a1 * group_delay_m(stec, f1) + a2 * group_delay_m(stec, f2);
        assert!(resid.abs() < 1e-9);
    }

    #[test]
    fn code_noise_falls_with_cn0_and_chip_rate() {
        let a = dll_code_noise_m(1.023e6, 45.0, 1.0, 0.5, 0.02);
        let b = dll_code_noise_m(1.023e6, 55.0, 1.0, 0.5, 0.02);
        let c = dll_code_noise_m(10.23e6, 45.0, 1.0, 0.5, 0.02);
        assert!(b < a && c < a);
        assert!((a / c - 10.0).abs() < 1e-9);
        assert!((0.3..2.0).contains(&a), "{a}");
    }
}
