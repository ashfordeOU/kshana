// SPDX-License-Identifier: AGPL-3.0-only
//! Space-weather environment model: solar (F10.7) and geomagnetic (Kp/ap) activity
//! indices and their effect on thermospheric neutral density — the activity
//! dependence the static piecewise-exponential atmosphere
//! ([`crate::forces::atmospheric_density`]) deliberately omits.
//!
//! Real thermospheric density at LEO altitudes (200–1000 km) swings by roughly an
//! order of magnitude over the 11-year solar cycle, driven by extreme-UV heating
//! (tracked by the 10.7 cm radio flux F10.7) and geomagnetic storms (tracked by
//! Kp/ap). The static model has no such dependence, so a drag or orbit-lifetime
//! estimate at one altitude is the same at solar minimum and maximum — physically
//! wrong by ~5–10×. This module supplies the missing driver.
//!
//! What is rigorous here:
//!   * the **Kp↔ap** quasi-logarithmic conversion is the definitional IAGA/GFZ
//!     28-step table (exact at every grid point);
//!   * the **exospheric temperature** is the Jacchia-1971 nighttime global
//!     minimum `T_c = 379 + 3.24·F̄ + 1.3·(F − F̄)` plus the geomagnetic increment
//!     `ΔT = 28·Kp + 0.03·e^Kp`, validated against the published solar-min/mean/max
//!     magnitudes;
//!   * the **density** is the Jacchia 1971 thermosphere (Jacchia, SAO Special
//!     Report 332, 1971) implemented from the report's equations: static diffusion
//!     profiles from the 90 km boundary ([`jacchia71_static_density`], reproducing
//!     the report's printed Table 7 to its 0.001 printed digits in log10 density),
//!     and at a point ([`jacchia71_density`]) the diurnal temperature distribution,
//!     the geomagnetic increment and the semiannual, seasonal-latitudinal and helium
//!     variations. No constant is fitted to any measurement here.
//!
//! [`space_weather_density`] is the position-free form: the static profile at the
//! diurnal-mean exospheric temperature (`T_c (1 + R/2)` plus the geomagnetic
//! increment, the report's equation 26). [`density_activity_factor`] reports the
//! J71 density relative to the static piecewise-exponential profile
//! ([`crate::forces::atmospheric_density`]) that carries no activity dependence.

use serde::Deserialize;

/// The IAGA/GFZ planetary `Kp → ap` quasi-logarithmic conversion: the `ap`
/// equivalents (in units of 2 nT) of the 28 standard Kp steps
/// (`0o, 0+, 1−, 1o, …, 9−, 9o`), indexed by `Kp·3` (so entry `i` is `Kp = i/3`).
/// This is a definitional lookup, exact at every grid point.
const AP_TABLE: [f64; 28] = [
    0.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 9.0, 12.0, 15.0, 18.0, 22.0, 27.0, 32.0, 39.0, 48.0, 56.0,
    67.0, 80.0, 94.0, 111.0, 132.0, 154.0, 179.0, 207.0, 236.0, 300.0, 400.0,
];

/// Convert a planetary `Kp` index (0–9) to its `ap` equivalent via the
/// definitional table, snapping `Kp` to the nearest one-third step. Clamped to
/// `[0, 9]`.
pub fn ap_from_kp(kp: f64) -> f64 {
    let kp = kp.clamp(0.0, 9.0);
    let idx = (kp * 3.0).round() as usize;
    AP_TABLE[idx.min(AP_TABLE.len() - 1)]
}

/// Convert an `ap` value to the planetary `Kp` index whose table entry is closest,
/// the inverse of [`ap_from_kp`] (exact at the tabulated `ap` values).
pub fn kp_from_ap(ap: f64) -> f64 {
    let mut best_idx = 0usize;
    let mut best_d = (ap - AP_TABLE[0]).abs();
    for (i, &a) in AP_TABLE.iter().enumerate().skip(1) {
        let d = (ap - a).abs();
        if d < best_d {
            best_idx = i;
            best_d = d;
        }
    }
    best_idx as f64 / 3.0
}

/// Daily `Ap` from the eight three-hourly `ap` values: their arithmetic mean (the
/// definitional relationship).
pub fn daily_ap(ap_3hourly: &[f64; 8]) -> f64 {
    ap_3hourly.iter().sum::<f64>() / 8.0
}

/// Centred 81-day average of an F10.7 daily series at index `i` — the standard
/// `F10.7a` solar-flux smoothing (window clipped at the series ends).
pub fn f107a_centered(series: &[f64], i: usize) -> f64 {
    if series.is_empty() {
        return 0.0;
    }
    let half = 40usize;
    let lo = i.saturating_sub(half);
    let hi = (i + half + 1).min(series.len());
    let w = &series[lo..hi];
    w.iter().sum::<f64>() / w.len() as f64
}

/// Jacchia-1971 global exospheric temperature `T∞` (K) for daily solar flux
/// `f107` (sfu), 81-day average `f107a` (sfu) and planetary `kp` (0–9):
/// the nighttime global minimum `T_c = 379 + 3.24·F̄ + 1.3·(F − F̄)` plus the
/// geomagnetic increment `ΔT = 28·Kp + 0.03·e^Kp`.
pub fn exospheric_temperature(f107: f64, f107a: f64, kp: f64) -> f64 {
    let kp = kp.clamp(0.0, 9.0);
    let t_c = 379.0 + 3.24 * f107a + 1.3 * (f107 - f107a);
    let dt_geo = 28.0 * kp + 0.03 * kp.exp();
    t_c + dt_geo
}

/// The Jacchia 1971 static density at geometric altitude `altitude_m` and exospheric
/// temperature `t_inf_k`, divided by the activity-free static piecewise-exponential profile
/// ([`crate::forces::atmospheric_density`]) at the same altitude: how far the space-weather
/// state moves density away from the static model. Below the 90 km J71 boundary it is 1.
pub fn density_activity_factor(altitude_m: f64, t_inf_k: f64) -> f64 {
    let h_km = altitude_m / 1000.0;
    if h_km <= J71_Z0_KM || t_inf_k <= 0.0 {
        return 1.0;
    }
    jacchia71_static_density(h_km, t_inf_k) / crate::forces::atmospheric_density(altitude_m)
}

/// Activity-dependent neutral density (kg/m³) at geometric altitude `altitude_m`, without a
/// position: the Jacchia 1971 static profile at the diurnal-mean exospheric temperature
/// [`mean_exospheric_temperature`]. Below the 90 km J71 boundary it returns the static
/// piecewise-exponential profile. For a density at a point (latitude, local time, date) use
/// [`jacchia71_density`].
pub fn space_weather_density(altitude_m: f64, sw: &SpaceWeather) -> f64 {
    let h_km = altitude_m / 1000.0;
    if h_km <= J71_Z0_KM {
        return crate::forces::atmospheric_density(altitude_m);
    }
    jacchia71_static_density(h_km, mean_exospheric_temperature(sw))
}

// ── Jacchia 1971 thermosphere (Jacchia, SAO Special Report 332, 1971) ──
//
// Every constant below is printed in the report; equation numbers refer to it. Nothing is
// fitted to any measurement in this crate.

/// Lower boundary height (km), temperature (K) and mass density (g/cm³) of the J71 models.
const J71_Z0_KM: f64 = 90.0;
const J71_T0_K: f64 = 183.0;
const J71_RHO0_G_CM3: f64 = 3.46e-9;
/// Height of the temperature-profile inflection point (km).
const J71_ZX_KM: f64 = 125.0;
/// Sea-level mean molecular mass (g/mol) of the J71 composition.
const J71_M0: f64 = 28.960;
/// Equation (1): mean molecular mass polynomial between 90 and 100 km.
const J71_MBAR: [f64; 7] = [
    28.82678,
    -7.40066e-2,
    -1.19407e-2,
    4.51103e-4,
    -8.21895e-6,
    1.07561e-5,
    -6.97444e-7,
];
/// Avogadro's number and the universal gas constant as the report uses them.
const J71_AVOGADRO: f64 = 6.02257e23;
const J71_R_GAS: f64 = 8.31432;
/// Equation (8): gravity 9.80665 (1 + z/R_e)^-2 m/s², R_e = 6356.766 km.
const J71_G0: f64 = 9.80665;
const J71_RE_KM: f64 = 6356.766;
/// Sea-level volume fractions and molecular masses (g/mol): N2, O2, Ar, He.
const J71_Q_N2: f64 = 0.78110;
const J71_Q_O2: f64 = 0.20955;
const J71_Q_AR: f64 = 0.0093432;
const J71_Q_HE: f64 = 0.0000061471;
const J71_M_N2: f64 = 28.0134;
const J71_M_O2: f64 = 31.9988;
const J71_M_AR: f64 = 39.948;
const J71_M_HE: f64 = 4.0026;
const J71_M_O: f64 = 15.9994;
const J71_M_H: f64 = 1.00797;
/// Thermal diffusion coefficient of helium (0 for the other constituents).
const J71_ALPHA_HE: f64 = -0.38;
/// Equation (17) diurnal-variation parameters.
const J71_R: f64 = 0.3;
const J71_M_EXP: f64 = 2.2;
const J71_N_EXP: f64 = 3.0;
const J71_BETA_DEG: f64 = -37.0;
const J71_P_DEG: f64 = 6.0;
const J71_GAMMA_DEG: f64 = 43.0;
/// Obliquity of the ecliptic used by equation (25).
const J71_EPS_DEG: f64 = 23.44;

/// Equation (9): temperature at the inflection point for exospheric temperature `t_inf`.
fn j71_tx(t_inf: f64) -> f64 {
    371.6678 + 0.0518806 * t_inf - 294.3505 * (-0.00216222 * t_inf).exp()
}

/// Equations (9)-(13): the J71 temperature (K) at height `z_km` for exospheric temperature
/// `t_inf` (K).
pub fn jacchia71_temperature(z_km: f64, t_inf: f64) -> f64 {
    let tx = j71_tx(t_inf);
    let gx = 1.90 * (tx - J71_T0_K) / (J71_ZX_KM - J71_Z0_KM);
    if z_km <= J71_ZX_KM {
        // Fourth-degree polynomial with T(z0) = T0, T'(z0) = 0, T'(zx) = Gx, T''(zx) = 0.
        let d0 = J71_Z0_KM - J71_ZX_KM;
        let c4 = -3.0 * (J71_T0_K - tx - 2.0 / 3.0 * gx * d0) / d0.powi(4);
        let c3 = -(gx + 4.0 * c4 * d0.powi(3)) / (3.0 * d0 * d0);
        let d = z_km - J71_ZX_KM;
        tx + gx * d + c3 * d.powi(3) + c4 * d.powi(4)
    } else {
        let a = 2.0 / std::f64::consts::PI * (t_inf - tx);
        let d = z_km - J71_ZX_KM;
        tx + a * (gx / a * d * (1.0 + 4.5e-6 * d.powf(2.5))).atan()
    }
}

fn j71_gravity(z_km: f64) -> f64 {
    J71_G0 / (1.0 + z_km / J71_RE_KM).powi(2)
}

fn j71_mbar(z_km: f64) -> f64 {
    let d = z_km - J71_Z0_KM;
    J71_MBAR.iter().rev().fold(0.0, |acc, &c| acc * d + c)
}

/// Eight-point Gauss-Legendre nodes and weights on [-1, 1].
const GL8: [(f64, f64); 8] = [
    (-0.960_289_856_497_536_3, 0.101_228_536_290_376_26),
    (-0.796_666_477_413_626_7, 0.222_381_034_453_374_47),
    (-0.525_532_409_916_329, 0.313_706_645_877_887_3),
    (-0.183_434_642_495_649_8, 0.362_683_783_378_362),
    (0.183_434_642_495_649_8, 0.362_683_783_378_362),
    (0.525_532_409_916_329, 0.313_706_645_877_887_3),
    (0.796_666_477_413_626_7, 0.222_381_034_453_374_47),
    (0.960_289_856_497_536_3, 0.101_228_536_290_376_26),
];

/// ∫ f over [a, b] by eight-point Gauss-Legendre on pieces no longer than `h` (km).
fn j71_integrate(a: f64, b: f64, h: f64, f: &dyn Fn(f64) -> f64) -> f64 {
    if b == a {
        return 0.0;
    }
    let n = ((b - a).abs() / h).ceil().max(1.0) as usize;
    let step = (b - a) / n as f64;
    let mut sum = 0.0;
    for k in 0..n {
        let lo = a + k as f64 * step;
        let mid = lo + 0.5 * step;
        for &(x, w) in &GL8 {
            sum += w * f(mid + 0.5 * step * x);
        }
    }
    sum * 0.5 * step
}

/// Number densities (cm⁻³) of the J71 static model at height `z_km` (≥ 90 km) for exospheric
/// temperature `t_inf`: `[N2, O2, O, Ar, He, H]`. Hydrogen is zero at and below 100 km.
pub fn jacchia71_number_densities(z_km: f64, t_inf: f64) -> [f64; 6] {
    let z_km = z_km.max(J71_Z0_KM);
    let temp = |z: f64| jacchia71_temperature(z, t_inf);
    // Equation (5) from 90 km to min(z, 100 km): barometric with the mean molecular mass.
    let z_mix = z_km.min(100.0);
    let int_mix = j71_integrate(J71_Z0_KM, z_mix, 2.0, &|z| {
        j71_mbar(z) * j71_gravity(z) / (J71_R_GAS * temp(z))
    });
    let rho_mix = J71_RHO0_G_CM3 * (j71_mbar(z_mix) / temp(z_mix)) / (j71_mbar(J71_Z0_KM) / J71_T0_K)
        * (-int_mix).exp();
    // Equations (2)-(4): species at the top of the mixing region.
    let mbar = j71_mbar(z_mix);
    let n_tot = J71_AVOGADRO * rho_mix / mbar;
    let ratio = mbar / J71_M0;
    let base = [
        J71_Q_N2 * ratio * n_tot,
        n_tot * (ratio * (1.0 + J71_Q_O2) - 1.0),
        2.0 * n_tot * (1.0 - ratio),
        J71_Q_AR * ratio * n_tot,
        J71_Q_HE * ratio * n_tot,
    ];
    if z_km <= 100.0 {
        return [base[0], base[1], base[2], base[3], base[4], 0.0];
    }
    // Equation (6): diffusion above 100 km.
    let t100 = temp(100.0);
    let tz = temp(z_km);
    let g_over_rt = |z: f64| j71_gravity(z) / (J71_R_GAS * temp(z));
    let mut int_diff = j71_integrate(100.0, z_km.min(J71_ZX_KM), 5.0, &g_over_rt);
    if z_km > J71_ZX_KM {
        int_diff += j71_integrate(J71_ZX_KM, z_km, 12.5, &g_over_rt);
    }
    let masses = [J71_M_N2, J71_M_O2, J71_M_O, J71_M_AR, J71_M_HE];
    let mut out = [0.0; 6];
    for i in 0..5 {
        let alpha = if i == 4 { J71_ALPHA_HE } else { 0.0 };
        out[i] = base[i] * (t100 / tz).powf(1.0 + alpha) * (-masses[i] * int_diff).exp();
    }
    // Equation (7): hydrogen at 500 km, in diffusion equilibrium from there.
    let t500 = temp(500.0);
    let lt = t500.log10();
    let n_h500 = 10f64.powf(73.13 - 39.40 * lt + 5.5 * lt * lt);
    let int_h = j71_integrate(500.0, z_km, 12.5, &g_over_rt);
    out[5] = n_h500 * (t500 / tz) * (-J71_M_H * int_h).exp();
    out
}

fn j71_mass_density_g_cm3(n: &[f64; 6]) -> f64 {
    let m = [J71_M_N2, J71_M_O2, J71_M_O, J71_M_AR, J71_M_HE, J71_M_H];
    n.iter().zip(m.iter()).map(|(a, b)| a * b).sum::<f64>() / J71_AVOGADRO
}

/// Mass density (kg/m³) of the J71 static model at height `z_km` for exospheric temperature
/// `t_inf` (the report's Tables 6 and 7, before the semiannual, seasonal-latitudinal and helium
/// corrections).
pub fn jacchia71_static_density(z_km: f64, t_inf: f64) -> f64 {
    j71_mass_density_g_cm3(&jacchia71_number_densities(z_km, t_inf)) * 1000.0
}

/// Equation (17): the local exospheric temperature divided by the global nighttime minimum
/// `T_c`, at geographic latitude `lat_rad`, solar declination `decl_rad` and solar hour angle
/// `hour_angle_rad` (local solar time counted from upper culmination).
pub fn jacchia71_diurnal_ratio(lat_rad: f64, decl_rad: f64, hour_angle_rad: f64) -> f64 {
    let deg = std::f64::consts::PI / 180.0;
    let eta = 0.5 * (lat_rad - decl_rad).abs();
    let theta = 0.5 * (lat_rad + decl_rad).abs();
    let mut tau = hour_angle_rad
        + J71_BETA_DEG * deg
        + J71_P_DEG * deg * (hour_angle_rad + J71_GAMMA_DEG * deg).sin();
    let two_pi = 2.0 * std::f64::consts::PI;
    tau = (tau + std::f64::consts::PI).rem_euclid(two_pi) - std::f64::consts::PI;
    let sm = theta.sin().powf(J71_M_EXP);
    let cm = eta.cos().powf(J71_M_EXP);
    (1.0 + J71_R * sm) * (1.0 + J71_R * (cm - sm) / (1.0 + J71_R * sm) * (0.5 * tau).cos().powf(J71_N_EXP))
}

/// Equations (21)-(23): semiannual variation Δlog10 ρ at height `z_km` and Modified Julian
/// Date `mjd`.
fn j71_semiannual(z_km: f64, mjd: f64) -> f64 {
    let two_pi = 2.0 * std::f64::consts::PI;
    let phi = (mjd - 36204.0) / 365.2422;
    let tau = phi + 0.09544 * ((0.5 + 0.5 * (two_pi * phi + 6.035).sin()).powf(1.650) - 0.5);
    let f = (5.876e-7 * z_km.powf(2.331) + 0.06328) * (-2.868e-3 * z_km).exp();
    let g = 0.02835
        + 0.3817 * (1.0 + 0.4671 * (two_pi * tau + 4.137).sin()) * (2.0 * two_pi * tau + 4.259).sin();
    f * g
}

/// Equation (24): seasonal-latitudinal variation of the lower thermosphere, Δlog10 ρ.
fn j71_seasonal_latitudinal(z_km: f64, lat_rad: f64, mjd: f64) -> f64 {
    let phi = (mjd - 36204.0) / 365.2422;
    let dz = z_km - 90.0;
    let s = 0.014 * dz * (-0.0013 * dz * dz).exp();
    let p = (2.0 * std::f64::consts::PI * phi + 1.72).sin();
    s * lat_rad.signum() * p * lat_rad.sin().powi(2)
}

/// Equation (25): seasonal-latitudinal variation of helium, Δlog10 n(He).
fn j71_helium(lat_rad: f64, decl_rad: f64) -> f64 {
    if decl_rad == 0.0 {
        return 0.0;
    }
    let eps = J71_EPS_DEG.to_radians();
    let q = std::f64::consts::FRAC_PI_4;
    0.65 * (decl_rad / eps).abs()
        * ((q - 0.5 * lat_rad * decl_rad.signum()).sin().powi(3) - q.sin().powi(3))
}

/// Geocentric declination of the Sun (rad) at Modified Julian Date `mjd` (low-precision series,
/// [`crate::ephem::sun_position`]).
pub fn sun_declination_rad(mjd: f64) -> f64 {
    let t = (mjd + 2_400_000.5 - 2_451_545.0) / 36_525.0;
    let r = crate::ephem::sun_position(t);
    (r[2] / (r[0] * r[0] + r[1] * r[1] + r[2] * r[2]).sqrt()).asin()
}

/// Jacchia 1971 neutral mass density (kg/m³) at a point: geometric height `altitude_m`,
/// geographic latitude `lat_deg`, local solar time `lst_h` (hours), UTC Modified Julian Date
/// `mjd`, for the space-weather state `sw` (F10.7 of the previous day, its 81-day centred mean,
/// and Kp taken 6.7 h earlier, as the report prescribes). The exospheric temperature is the
/// nighttime minimum `T_c` of equation (14) times the diurnal ratio of equation (17) plus the
/// geomagnetic increment of equation (18); the density is the static profile at that
/// temperature with the helium (25), semiannual (21) and seasonal-latitudinal (24) corrections.
pub fn jacchia71_density(altitude_m: f64, lat_deg: f64, lst_h: f64, mjd: f64, sw: &SpaceWeather) -> f64 {
    let z_km = altitude_m / 1000.0;
    let lat = lat_deg.to_radians();
    let decl = sun_declination_rad(mjd);
    let hour_angle = (lst_h - 12.0) * std::f64::consts::PI / 12.0;
    let t_c = exospheric_temperature(sw.f107, sw.f107a, 0.0);
    let kp = sw.kp.clamp(0.0, 9.0);
    let t_inf = t_c * jacchia71_diurnal_ratio(lat, decl, hour_angle) + 28.0 * kp + 0.03 * kp.exp();
    let mut n = jacchia71_number_densities(z_km, t_inf);
    n[4] *= 10f64.powf(j71_helium(lat, decl));
    let rho = j71_mass_density_g_cm3(&n) * 1000.0;
    rho * 10f64.powf(j71_semiannual(z_km, mjd) + j71_seasonal_latitudinal(z_km, lat, mjd))
}

/// The J71 diurnal-mean exospheric temperature (K) of a space-weather state: the nighttime
/// minimum times `1 + R/2` (the report's equation 26, the mean of `T_c` and `T_M = 1.3 T_c`)
/// plus the geomagnetic increment of equation (18).
pub fn mean_exospheric_temperature(sw: &SpaceWeather) -> f64 {
    let kp = sw.kp.clamp(0.0, 9.0);
    exospheric_temperature(sw.f107, sw.f107a, 0.0) * (1.0 + J71_R / 2.0) + 28.0 * kp + 0.03 * kp.exp()
}

/// A space-weather state: the solar (F10.7 daily + 81-day average, sfu) and
/// geomagnetic (planetary Kp, 0–9) activity indices.
#[derive(Clone, Copy, Debug)]
pub struct SpaceWeather {
    pub f107: f64,
    pub f107a: f64,
    pub kp: f64,
}

impl SpaceWeather {
    /// The `ap` equivalent of this state's `Kp`.
    pub fn ap(&self) -> f64 {
        ap_from_kp(self.kp)
    }
    /// Jacchia-1971 exospheric temperature (K) for this state.
    pub fn exospheric_temperature(&self) -> f64 {
        exospheric_temperature(self.f107, self.f107a, self.kp)
    }
    /// Activity-corrected neutral density (kg/m³) at `altitude_m`.
    pub fn density(&self, altitude_m: f64) -> f64 {
        space_weather_density(altitude_m, self)
    }
}

/// Unit and provenance class for every numeric field the `space-weather` report emits.
const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "f107",
            unit: "sfu",
            provenance: Input,
            definition: "daily 10.7 cm solar radio flux F10.7, in solar flux units \
                         (1 sfu = 1e-22 W m^-2 Hz^-1)",
        },
        FieldUnit {
            path: "f107a",
            unit: "sfu",
            provenance: Input,
            definition: "centred 81-day average of the daily F10.7 series; defaults to `f107` \
                         when the scenario does not supply it",
        },
        FieldUnit {
            path: "kp",
            unit: "1",
            provenance: Input,
            definition: "planetary geomagnetic activity index Kp, a dimensionless \
                         quasi-logarithmic index on the 0-9 scale",
        },
        FieldUnit {
            path: "ap",
            unit: "2 nT",
            provenance: Published,
            definition: "the ap equivalent of `kp` read from the definitional IAGA/GFZ 28-step \
                         Kp->ap table; ap is conventionally expressed in units of 2 nT, so the \
                         emitted number times 2 is the amplitude in nT",
        },
        FieldUnit {
            path: "exospheric_temperature_k",
            unit: "K",
            provenance: ClosedForm,
            definition: "Jacchia-1971 global nighttime-minimum exospheric temperature T_inf = \
                         379 + 3.24*f107a + 1.3*(f107 - f107a) + 28*kp + 0.03*exp(kp)",
        },
        FieldUnit {
            path: "mean_exospheric_temperature_k",
            unit: "K",
            provenance: ClosedForm,
            definition: "Jacchia-1971 diurnal-mean exospheric temperature (379 + 3.24*f107a + \
                         1.3*(f107 - f107a))*(1 + 0.3/2) + 28*kp + 0.03*exp(kp) (the report's \
                         equation 26 plus the geomagnetic increment), at which the density rows \
                         are evaluated",
        },
        FieldUnit {
            path: "altitudes[].altitude_km",
            unit: "km",
            provenance: Input,
            definition: "geometric altitude above the spherical Earth at which the density \
                         row is reported",
        },
        FieldUnit {
            path: "altitudes[].static_density_kg_m3",
            unit: "kg/m^3",
            provenance: Published,
            definition: "neutral mass density from the published static piecewise-exponential \
                         atmosphere (Vallado Table 8-4, after CIRA-72): rho0*exp(-(h-h0)/H) \
                         for the tabulated band containing the altitude; solar-activity \
                         independent, and the reference the activity-corrected value is \
                         compared against",
        },
        FieldUnit {
            path: "altitudes[].activity_density_kg_m3",
            unit: "kg/m^3",
            provenance: Modelled,
            definition: "Jacchia-1971 static-profile mass density at this altitude and the \
                         diurnal-mean exospheric temperature (no latitude, local-time or \
                         seasonal terms)",
        },
        FieldUnit {
            path: "altitudes[].activity_factor",
            unit: "1",
            provenance: Computed,
            definition: "activity_density_kg_m3 / static_density_kg_m3: how far this \
                         space-weather state moves the density away from the activity-free \
                         static profile",
        },
    ]
};

fn sw_default_f107() -> f64 {
    150.0
}
fn sw_default_kp() -> f64 {
    3.0
}
fn sw_default_altitudes() -> Vec<f64> {
    vec![300.0, 400.0, 500.0, 800.0]
}

/// The `space-weather` scenario: report the activity indices, the Jacchia-1971
/// exospheric temperature, and the activity-corrected vs static neutral density at
/// a set of altitudes for a given solar/geomagnetic state.
#[derive(Deserialize)]
pub struct SpaceWeatherScenario {
    /// Daily F10.7 solar radio flux (sfu).
    #[serde(default = "sw_default_f107")]
    pub f107: f64,
    /// 81-day average F10.7 (sfu); defaults to `f107` when absent.
    #[serde(default)]
    pub f107a: Option<f64>,
    /// Planetary geomagnetic Kp index (0–9).
    #[serde(default = "sw_default_kp")]
    pub kp: f64,
    /// Altitudes (km) at which to report density.
    #[serde(default = "sw_default_altitudes")]
    pub altitudes_km: Vec<f64>,
}

impl SpaceWeatherScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        let f107a = self.f107a.unwrap_or(self.f107);
        if !self.f107.is_finite() || self.f107 <= 0.0 {
            return Err("f107 must be finite and positive".to_string());
        }
        if !f107a.is_finite() || f107a <= 0.0 {
            return Err("f107a must be finite and positive".to_string());
        }
        if !self.kp.is_finite() || !(0.0..=9.0).contains(&self.kp) {
            return Err("kp must be in [0, 9]".to_string());
        }
        if self.altitudes_km.is_empty() {
            return Err("altitudes_km must be non-empty".to_string());
        }
        for &h in &self.altitudes_km {
            if !h.is_finite() || h <= 0.0 {
                return Err(format!("altitude {h} km must be finite and positive"));
            }
        }
        let sw = SpaceWeather {
            f107: self.f107,
            f107a,
            kp: self.kp,
        };
        let t_inf = sw.exospheric_temperature();
        let t_mean = mean_exospheric_temperature(&sw);
        let rows: Vec<serde_json::Value> = self
            .altitudes_km
            .iter()
            .map(|&h| {
                let alt_m = h * 1000.0;
                let stat = crate::forces::atmospheric_density(alt_m);
                let factor = density_activity_factor(alt_m, t_mean);
                serde_json::json!({
                    "altitude_km": h,
                    "static_density_kg_m3": stat,
                    "activity_density_kg_m3": stat * factor,
                    "activity_factor": factor,
                })
            })
            .collect();
        let json = serde_json::json!({
            "kind": "space-weather",
            "label": "MODELLED — solar/geomagnetic indices, Jacchia-71 exospheric \
                      temperature and Jacchia-71 static density at the diurnal-mean \
                      temperature",
            "units": crate::field_schema::units_block(UNITS),
            "f107": self.f107,
            "f107a": f107a,
            "kp": self.kp,
            "ap": sw.ap(),
            "exospheric_temperature_k": t_inf,
            "mean_exospheric_temperature_k": t_mean,
            "altitudes": rows,
        });
        let summary = format!(
            "space-weather: F10.7={:.0} F10.7a={:.0} Kp={:.1} (ap={:.0}) -> T_inf={:.0} K; \
             density x{:.2} at {:.0} km (MODELLED)",
            self.f107,
            f107a,
            self.kp,
            sw.ap(),
            t_inf,
            density_activity_factor(self.altitudes_km[0] * 1000.0, t_mean),
            self.altitudes_km[0],
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    /// Jacchia 1971 Table 7 (SAO Special Report 332, pp. 108-111): printed log10 mass density
    /// (g/cm³) against height (km) and exospheric temperature (K).
    const J71_TABLE7: [(f64, f64, f64); 26] = [
        (100.0, 500.0, -9.254),
        (150.0, 500.0, -11.903),
        (150.0, 950.0, -11.697),
        (200.0, 500.0, -13.090),
        (200.0, 700.0, -12.782),
        (200.0, 900.0, -12.613),
        (300.0, 500.0, -14.764),
        (300.0, 700.0, -14.108),
        (300.0, 900.0, -13.745),
        (400.0, 500.0, -16.092),
        (400.0, 700.0, -15.190),
        (400.0, 900.0, -14.627),
        (460.0, 500.0, -16.555),
        (460.0, 700.0, -15.786),
        (460.0, 1000.0, -14.877),
        (500.0, 500.0, -16.712),
        (500.0, 700.0, -16.155),
        (500.0, 900.0, -15.425),
        (500.0, 1000.0, -15.162),
        (500.0, 1200.0, -14.769),
        (500.0, 1400.0, -14.491),
        (600.0, 1000.0, -15.837),
        (600.0, 1400.0, -15.001),
        (800.0, 1000.0, -16.932),
        (800.0, 1200.0, -16.388),
        (120.0, 1500.0, -10.599),
    ];

    #[test]
    fn jacchia71_static_profile_reproduces_the_printed_table_7() {
        // Tolerance fixed before the comparison (amendment 1 of the TOLEOS oracle): 0.01 in
        // log10 density.
        let mut worst: f64 = 0.0;
        for &(z, t, logrho) in &J71_TABLE7 {
            let rho_g_cm3 = jacchia71_static_density(z, t) / 1000.0;
            let d = rho_g_cm3.log10() - logrho;
            eprintln!("z {z} T {t}: {:.4} vs {logrho} ({d:+.4})", rho_g_cm3.log10());
            worst = worst.max(d.abs());
        }
        assert!(worst <= 0.01, "worst |dlog10 rho| {worst}");
    }

    #[test]
    fn jacchia71_diurnal_ratio_reproduces_the_printed_table_1() {
        // Table 1 (p. 72), solar declination -20 deg: 1000 T_l/T_c by latitude and local solar
        // time. Tolerance fixed before the comparison: within 2 printed units.
        let cases = [
            (0.0, 0.0, 1019.0),
            (0.0, 3.0, 1006.0),
            (0.0, 14.0, 1290.0),
            (-15.0, 14.0, 1299.0),
            (45.0, 14.0, 1206.0),
            (30.0, 8.0, 1068.0),
            (-60.0, 20.0, 1173.0),
            (90.0, 12.0, 1088.0),
            (-90.0, 5.0, 1193.0),
            (60.0, 23.0, 1042.0),
        ];
        for (lat, lst, want) in cases {
            let r = jacchia71_diurnal_ratio(
                f64::to_radians(lat),
                f64::to_radians(-20.0),
                (lst - 12.0) * std::f64::consts::PI / 12.0,
            );
            assert!((1000.0 * r - want).abs() <= 2.0, "lat {lat} lst {lst}: {} vs {want}", 1000.0 * r);
        }
    }

    #[test]
    fn kp_to_ap_matches_the_definitional_table_at_grid_points() {
        // Exact at the standard grid: 0o→0, 1o→4, 3o→15, 4o→27, 5o→48, 9o→400.
        assert_eq!(ap_from_kp(0.0), 0.0);
        assert_eq!(ap_from_kp(1.0), 4.0);
        assert_eq!(ap_from_kp(3.0), 15.0);
        assert_eq!(ap_from_kp(4.0), 27.0);
        assert_eq!(ap_from_kp(5.0), 48.0);
        assert_eq!(ap_from_kp(9.0), 400.0);
        // Thirds: 2+ (8/3) → 12, 5- (14/3) → 39.
        assert_eq!(ap_from_kp(8.0 / 3.0), 12.0);
        assert_eq!(ap_from_kp(14.0 / 3.0), 39.0);
    }

    #[test]
    fn kp_ap_round_trips_and_clamps() {
        for (i, &ap) in AP_TABLE.iter().enumerate() {
            let kp = i as f64 / 3.0;
            assert_eq!(ap_from_kp(kp), ap);
            assert!((kp_from_ap(ap) - kp).abs() < 1e-9, "ap {ap} -> kp");
        }
        // Out-of-range Kp clamps into the table rather than panicking.
        assert_eq!(ap_from_kp(-1.0), 0.0);
        assert_eq!(ap_from_kp(20.0), 400.0);
    }

    #[test]
    fn ap_is_monotonic_in_kp() {
        let mut prev = -1.0;
        for i in 0..=27 {
            let ap = ap_from_kp(i as f64 / 3.0);
            assert!(ap > prev, "ap not strictly increasing at step {i}");
            prev = ap;
        }
    }

    #[test]
    fn daily_ap_is_the_mean_of_eight() {
        assert_eq!(daily_ap(&[4.0; 8]), 4.0);
        assert_eq!(
            daily_ap(&[0.0, 2.0, 3.0, 4.0, 5.0, 6.0, 7.0, 9.0]),
            36.0 / 8.0
        );
    }

    #[test]
    fn f107a_is_a_centred_average() {
        let flat = vec![120.0; 200];
        assert!((f107a_centered(&flat, 100) - 120.0).abs() < 1e-9);
        // A step series: the centred mean at the step sits between the two levels.
        let mut s = vec![70.0; 100];
        s.extend(vec![230.0; 100]);
        let m = f107a_centered(&s, 100);
        assert!(
            (70.0..230.0).contains(&m),
            "centred mean {m} not between levels"
        );
    }

    #[test]
    fn exospheric_temperature_matches_published_solar_anchors() {
        // Jacchia-71 nighttime global minimum, quiet (Kp=0):
        //   solar min  F10.7=70  -> 379 + 3.24*70  = 605.8 K
        //   solar mean F10.7=150 -> 379 + 3.24*150 = 865.0 K
        //   solar max  F10.7=230 -> 379 + 3.24*230 = 1124.2 K
        let tmin = exospheric_temperature(70.0, 70.0, 0.0);
        let tmean = exospheric_temperature(150.0, 150.0, 0.0);
        let tmax = exospheric_temperature(230.0, 230.0, 0.0);
        assert!((tmin - 605.8).abs() < 1.0, "solar-min T_inf {tmin}");
        assert!((tmean - 865.0).abs() < 1.0, "solar-mean T_inf {tmean}");
        assert!((tmax - 1124.2).abs() < 1.0, "solar-max T_inf {tmax}");
        assert!(tmin < tmean && tmean < tmax, "T_inf must rise with F10.7");
    }

    #[test]
    fn geomagnetic_storm_raises_exospheric_temperature() {
        let quiet = exospheric_temperature(150.0, 150.0, 0.0);
        let storm = exospheric_temperature(150.0, 150.0, 6.0);
        let dt = storm - quiet;
        // ΔT = 28*6 + 0.03*e^6 = 168 + 12.1 ≈ 180 K.
        assert!((dt - 180.1).abs() < 1.0, "storm increment {dt}");
        assert!(storm > quiet);
    }

    #[test]
    fn density_factor_is_the_j71_to_static_ratio_and_unity_below_the_boundary() {
        let f = density_activity_factor(400_000.0, 900.0);
        let want =
            jacchia71_static_density(400.0, 900.0) / crate::forces::atmospheric_density(400_000.0);
        assert!((f - want).abs() < 1e-12 * want);
        // Below the 90 km J71 boundary, activity does not move density.
        assert_eq!(density_activity_factor(80_000.0, 1500.0), 1.0);
        assert_eq!(density_activity_factor(80_000.0, 600.0), 1.0);
    }

    #[test]
    fn density_factor_increases_with_activity_at_altitude() {
        let cold = density_activity_factor(400_000.0, 606.0); // solar min
        let hot = density_activity_factor(400_000.0, 1124.0); // solar max
        assert!(
            cold < 1.0,
            "solar-min density should fall below the static profile: {cold}"
        );
        assert!(
            hot > 1.0,
            "solar-max density should rise above the static profile: {hot}"
        );
        assert!(hot > cold);
    }

    #[test]
    fn solar_cycle_density_swing_at_400km_follows_table_7() {
        // J71 Table 7: log10 rho(400 km) = -15.608 at 600 K and -14.627 at 900 K, a factor
        // 10^0.981 = 9.6 apart.
        let swing = jacchia71_static_density(400.0, 900.0) / jacchia71_static_density(400.0, 600.0);
        assert!((swing.log10() - 0.981).abs() < 0.01, "400 km swing {swing}x");
    }

    #[test]
    fn point_density_carries_the_diurnal_bulge() {
        let sw = SpaceWeather {
            f107: 150.0,
            f107a: 150.0,
            kp: 2.0,
        };
        // Equinox 2001-03-21 (MJD 51989): afternoon equator denser than pre-dawn equator.
        let day = jacchia71_density(450_000.0, 0.0, 14.0, 51_989.0, &sw);
        let night = jacchia71_density(450_000.0, 0.0, 3.0, 51_989.0, &sw);
        assert!(day > 1.5 * night, "day {day} night {night}");
        let mean = space_weather_density(450_000.0, &sw);
        assert!(night < mean && mean < day, "night {night} mean {mean} day {day}");
    }

    #[test]
    fn space_weather_density_brackets_the_static_model() {
        // The activity-dependent density brackets the static profile and stays
        // physically bounded (never zero/negative, never absurdly large).
        let alt = 500_000.0;
        let stat = crate::forces::atmospheric_density(alt);
        let active = SpaceWeather {
            f107: 230.0,
            f107a: 230.0,
            kp: 4.0,
        }
        .density(alt);
        let quiet = SpaceWeather {
            f107: 70.0,
            f107a: 70.0,
            kp: 0.0,
        }
        .density(alt);
        assert!(
            active > stat && stat > quiet,
            "active {active} stat {stat} quiet {quiet}"
        );
        assert!(active.is_finite() && quiet > 0.0);
    }

    #[test]
    fn scenario_runs_reproducibly_and_is_modelled() {
        let scn = SpaceWeatherScenario {
            f107: 200.0,
            f107a: Some(180.0),
            kp: 5.0,
            altitudes_km: vec![300.0, 400.0, 600.0],
        };
        let (j1, _s) = scn.run_json().unwrap();
        let (j2, _s) = scn.run_json().unwrap();
        assert_eq!(j1, j2, "scenario must be reproducible");
        let v: serde_json::Value = serde_json::from_str(&j1).unwrap();
        assert_eq!(v["kind"], "space-weather");
        assert!(v["label"].as_str().unwrap().contains("MODELLED"));
        assert!(
            !j1.contains("VALIDATED"),
            "a MODELLED model must not claim VALIDATED"
        );
        // ap is the table value for Kp=5 (48), T_inf is finite and warm.
        assert_eq!(v["ap"], 48.0);
        assert!(v["exospheric_temperature_k"].as_f64().unwrap() > 800.0);
        assert_eq!(v["altitudes"].as_array().unwrap().len(), 3);
    }

    #[test]
    fn scenario_rejects_out_of_range_inputs() {
        let bad_kp = SpaceWeatherScenario {
            f107: 150.0,
            f107a: None,
            kp: 12.0,
            altitudes_km: vec![400.0],
        };
        assert!(bad_kp.run_json().is_err());
        let bad_alt = SpaceWeatherScenario {
            f107: 150.0,
            f107a: None,
            kp: 3.0,
            altitudes_km: vec![-10.0],
        };
        assert!(bad_alt.run_json().is_err());
        let bad_flux = SpaceWeatherScenario {
            f107: 0.0,
            f107a: None,
            kp: 3.0,
            altitudes_km: vec![400.0],
        };
        assert!(bad_flux.run_json().is_err());
    }
}
