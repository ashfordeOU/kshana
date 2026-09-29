// SPDX-License-Identifier: AGPL-3.0-only
//! Tropospheric and building propagation terms from ITU-R (International Telecommunication
//! Union, Radiocommunication Sector) Recommendations, as public functions any link budget can
//! call.
//!
//! * [`p838_coefficients`] and [`rain_specific_attenuation_db_km`]: the specific attenuation of
//!   rain, ITU-R P.838-3 (03/2005), equations (1) to (5) with Tables 1 to 4.
//! * [`p618_rain_attenuation_db`]: the long-term slant-path rain attenuation exceeded for a
//!   percentage of an average year, ITU-R P.618-14 (08/2023) § 2.2.1.1, steps 2 to 10. Step 1
//!   (the rain height from the ITU-R P.839 map) and step 4 (the rain rate from the ITU-R P.837
//!   map) are inputs here, because the engine carries neither digital map.
//! * [`p618_scintillation_db`]: the tropospheric amplitude-scintillation fade depth, ITU-R
//!   P.618-14 § 2.4.1, steps 3 to 9, from the wet term of the surface refractivity (an input,
//!   or [`wet_refractivity`] from a temperature and relative humidity, steps 1 and 2).
//! * [`p676_gaseous_attenuation_db`]: oxygen and water-vapour attenuation on an Earth-space path
//!   from the approximate expressions of ITU-R P.676-10 (09/2013) Annex 2, equations (22a),
//!   (22g) to (22i), (22u), (23a) to (23d), (25a) to (25e), (26a), (26b) and (28). Recommendation
//!   P.676-13 replaced those closed forms with tabulated coefficients the engine does not carry,
//!   so this is the superseded simplified method, labelled as such.
//! * [`p2109_building_entry_loss_db`]: the building entry loss not exceeded with a probability,
//!   ITU-R P.2109-2 (08/2023) Annex 1 § 3, equations (1) to (10) and Table 1.
//!
//! Every function is pure and allocation-free. Frequencies are in GHz where the Recommendation
//! states them in GHz, angles in degrees, and losses in dB.

/// One Gaussian term `a·exp(−((log10 f − b)/c)²)` of the P.838-3 curve fits.
type Term = (f64, f64, f64);

/// ITU-R P.838-3 Table 1: coefficients for `k_H`.
const KH: [Term; 4] = [
    (-5.33980, -0.10008, 1.13098),
    (-0.35351, 1.26970, 0.45400),
    (-0.23789, 0.86036, 0.15354),
    (-0.94158, 0.64552, 0.16817),
];
const KH_M: f64 = -0.18961;
const KH_C: f64 = 0.71147;

/// ITU-R P.838-3 Table 2: coefficients for `k_V`.
const KV: [Term; 4] = [
    (-3.80595, 0.56934, 0.81061),
    (-3.44965, -0.22911, 0.51059),
    (-0.39902, 0.73042, 0.11899),
    (0.50167, 1.07319, 0.27195),
];
const KV_M: f64 = -0.16398;
const KV_C: f64 = 0.63297;

/// ITU-R P.838-3 Table 3: coefficients for `α_H`.
const AH: [Term; 5] = [
    (-0.14318, 1.82442, -0.55187),
    (0.29591, 0.77564, 0.19822),
    (0.32177, 0.63773, 0.13164),
    (-5.37610, -0.96230, 1.47828),
    (16.1721, -3.29980, 3.43990),
];
const AH_M: f64 = 0.67849;
const AH_C: f64 = -1.95537;

/// ITU-R P.838-3 Table 4: coefficients for `α_V`.
const AV: [Term; 5] = [
    (-0.07771, 2.33840, -0.76284),
    (0.56727, 0.95545, 0.54039),
    (-0.20238, 1.14520, 0.26809),
    (-48.2991, 0.791669, 0.116226),
    (48.5833, 0.791459, 0.116479),
];
const AV_M: f64 = -0.053739;
const AV_C: f64 = 0.83433;

fn gauss_sum(terms: &[Term], lf: f64) -> f64 {
    terms
        .iter()
        .map(|(a, b, c)| a * (-((lf - b) / c).powi(2)).exp())
        .sum()
}

/// The four P.838-3 power-law coefficients at one frequency.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct RainCoefficients {
    /// `k_H`, horizontal polarisation (dB/km per (mm/h)^α).
    pub k_h: f64,
    /// `α_H`, horizontal polarisation.
    pub alpha_h: f64,
    /// `k_V`, vertical polarisation.
    pub k_v: f64,
    /// `α_V`, vertical polarisation.
    pub alpha_v: f64,
}

/// ITU-R P.838-3 equations (2) and (3): `k_H`, `α_H`, `k_V` and `α_V` at `f_ghz` (valid
/// 1 GHz to 1000 GHz).
pub fn p838_coefficients(f_ghz: f64) -> RainCoefficients {
    let lf = f_ghz.log10();
    RainCoefficients {
        k_h: 10f64.powf(gauss_sum(&KH, lf) + KH_M * lf + KH_C),
        alpha_h: gauss_sum(&AH, lf) + AH_M * lf + AH_C,
        k_v: 10f64.powf(gauss_sum(&KV, lf) + KV_M * lf + KV_C),
        alpha_v: gauss_sum(&AV, lf) + AV_M * lf + AV_C,
    }
}

/// ITU-R P.838-3 equations (4) and (5): the `(k, α)` pair for a path at elevation `el_deg` and
/// polarisation tilt `tau_deg` from the horizontal (45° for circular polarisation).
pub fn p838_k_alpha(f_ghz: f64, el_deg: f64, tau_deg: f64) -> (f64, f64) {
    let c = p838_coefficients(f_ghz);
    let cos2el = el_deg.to_radians().cos().powi(2);
    let cos2tau = (2.0 * tau_deg.to_radians()).cos();
    let k = (c.k_h + c.k_v + (c.k_h - c.k_v) * cos2el * cos2tau) / 2.0;
    let alpha = (c.k_h * c.alpha_h
        + c.k_v * c.alpha_v
        + (c.k_h * c.alpha_h - c.k_v * c.alpha_v) * cos2el * cos2tau)
        / (2.0 * k);
    (k, alpha)
}

/// ITU-R P.838-3 equation (1): specific attenuation `γ_R = k·R^α` (dB/km) for a rain rate
/// `rain_mm_h`.
pub fn rain_specific_attenuation_db_km(
    f_ghz: f64,
    rain_mm_h: f64,
    el_deg: f64,
    tau_deg: f64,
) -> f64 {
    if rain_mm_h <= 0.0 {
        return 0.0;
    }
    let (k, a) = p838_k_alpha(f_ghz, el_deg, tau_deg);
    k * rain_mm_h.powf(a)
}

/// Inputs of the ITU-R P.618-14 § 2.2.1.1 rain-attenuation procedure.
#[derive(Clone, Copy, Debug)]
pub struct RainPath {
    /// Frequency (GHz), 1 to 55.
    pub f_ghz: f64,
    /// Free-space elevation angle (deg).
    pub el_deg: f64,
    /// Earth-station latitude (deg).
    pub lat_deg: f64,
    /// Earth-station height above mean sea level (km).
    pub hs_km: f64,
    /// Rain height `h_R` (km), step 1 (ITU-R P.839: the 0 °C isotherm height plus 0.36 km).
    pub rain_height_km: f64,
    /// Point rain rate exceeded for 0.01 % of an average year, `R0.01` (mm/h), step 4.
    pub r001_mm_h: f64,
    /// Polarisation tilt from the horizontal (deg); 45 for circular polarisation.
    pub tau_deg: f64,
}

/// Effective Earth radius of ITU-R P.618-14 § 2.2.1.1 (km).
const RE_EFF_KM: f64 = 8500.0;

/// ITU-R P.618-14 § 2.2.1.1: slant-path rain attenuation (dB) exceeded for `p_percent` of an
/// average year (0.001 % to 5 %). Returns 0 when the rain height is at or below the station, or
/// when `R0.01` is zero, as the Recommendation states.
pub fn p618_rain_attenuation_db(path: &RainPath, p_percent: f64) -> f64 {
    let RainPath {
        f_ghz: f,
        el_deg,
        lat_deg,
        hs_km,
        rain_height_km: hr,
        r001_mm_h: r001,
        tau_deg,
    } = *path;
    let dh = hr - hs_km;
    if dh <= 0.0 || r001 <= 0.0 || el_deg <= 0.0 {
        return 0.0;
    }
    let th = el_deg.to_radians();
    let (s, c) = th.sin_cos();
    // Step 2: slant-path length below the rain height, equations (1) and (2).
    let ls = if el_deg >= 5.0 {
        dh / s
    } else {
        2.0 * dh / ((s * s + 2.0 * dh / RE_EFF_KM).sqrt() + s)
    };
    // Step 3: horizontal projection, equation (3).
    let lg = ls * c;
    // Step 5: specific attenuation, equation (4).
    let gamma = rain_specific_attenuation_db_km(f, r001, el_deg, tau_deg);
    // Step 6: horizontal reduction factor, equation (5).
    let r = 1.0 / (1.0 + 0.78 * (lg * gamma / f).sqrt() - 0.38 * (1.0 - (-2.0 * lg).exp()));
    // Step 7: vertical adjustment factor.
    let zeta = (dh / (lg * r)).atan().to_degrees();
    let lr = if zeta > el_deg { lg * r / c } else { dh / s };
    let chi = if lat_deg.abs() < 36.0 {
        36.0 - lat_deg.abs()
    } else {
        0.0
    };
    let v = 1.0
        / (1.0
            + s.sqrt()
                * (31.0 * (1.0 - (-(el_deg / (1.0 + chi))).exp()) * (lr * gamma).sqrt() / (f * f)
                    - 0.45));
    // Steps 8 and 9: effective path length and A0.01, equations (6) and (7).
    let a001 = gamma * lr * v;
    if a001 <= 0.0 {
        return 0.0;
    }
    // Step 10: other percentages, equation (8).
    let p = p_percent;
    let beta = if p >= 1.0 || lat_deg.abs() >= 36.0 {
        0.0
    } else if el_deg >= 25.0 {
        -0.005 * (lat_deg.abs() - 36.0)
    } else {
        -0.005 * (lat_deg.abs() - 36.0) + 1.8 - 4.25 * s
    };
    let expo = -(0.655 + 0.033 * p.ln() - 0.045 * a001.ln() - beta * (1.0 - p) * s);
    a001 * (p / 0.01).powf(expo)
}

/// Wet term of the surface refractivity `N_wet` (N-units) from temperature `t_c` (°C),
/// relative humidity `h_percent` (%) and pressure `p_hpa`, as P.618-14 § 2.4.1 steps 1 and 2
/// direct, with the ITU-R P.453-14 expressions over water: the enhancement factor
/// `EF = 1 + 1e-4·(7.2 + P·(0.0320 + 5.9e-6·t²))`, the saturation pressure
/// `e_s = EF·6.1121·exp((18.678 − t/234.5)·t/(t + 257.14))`, `e = H·e_s/100`, and
/// `N_wet = 72·e/T + 3.75e5·e/T²` with `T = t + 273.15`.
pub fn wet_refractivity(t_c: f64, h_percent: f64, p_hpa: f64) -> f64 {
    let ef = 1.0 + 1e-4 * (7.2 + p_hpa * (0.0320 + 5.9e-6 * t_c * t_c));
    let es = ef * 6.1121 * ((18.678 - t_c / 234.5) * t_c / (t_c + 257.14)).exp();
    let e = h_percent * es / 100.0;
    let tk = t_c + 273.15;
    72.0 * e / tk + 3.75e5 * e / (tk * tk)
}

/// Inputs of the ITU-R P.618-14 § 2.4.1 scintillation procedure.
#[derive(Clone, Copy, Debug)]
pub struct ScintillationPath {
    /// Frequency (GHz). The Recommendation states 4 to 55 GHz; below 4 GHz the value is an
    /// extrapolation, which [`p618_scintillation_db`] reports through its second return value.
    pub f_ghz: f64,
    /// Free-space elevation angle (deg), at least 5.
    pub el_deg: f64,
    /// Wet term of the surface refractivity, `N_wet` (N-units).
    pub n_wet: f64,
    /// Physical antenna diameter (m).
    pub diameter_m: f64,
    /// Antenna efficiency (0 to 1).
    pub efficiency: f64,
}

/// ITU-R P.618-14 § 2.4.1 steps 3 to 9: the scintillation fade depth (dB) exceeded for
/// `p_percent` of the time (0.01 % to 50 %). The second value is `true` when the frequency is
/// inside the Recommendation's stated range (4 GHz to 55 GHz). Elevations below 5° are
/// evaluated at 5°, the method's lower bound.
pub fn p618_scintillation_db(path: &ScintillationPath, p_percent: f64) -> (f64, bool) {
    let in_range = (4.0..=55.0).contains(&path.f_ghz);
    let th = path.el_deg.max(5.0).to_radians();
    let s = th.sin();
    // Step 3, equation (42).
    let sigma_ref = 3.6e-3 + 1e-4 * path.n_wet;
    // Step 4, equation (43), turbulent layer height 1000 m.
    let l = 2.0 * 1000.0 / ((s * s + 2.35e-4).sqrt() + s);
    // Step 5, equation (44).
    let d_eff = path.efficiency.max(0.0).sqrt() * path.diameter_m.max(0.0);
    // Step 6, equations (45) and (46).
    let x = 1.22 * d_eff * d_eff * (path.f_ghz / l);
    let arg = if x <= 0.0 {
        // x → 0: sin(11/6 · π/2) · 3.86.
        3.86 * (11.0 / 6.0 * std::f64::consts::FRAC_PI_2).sin()
    } else {
        3.86 * (x * x + 1.0).powf(11.0 / 12.0) * (11.0 / 6.0 * (1.0 / x).atan()).sin()
            - 7.08 * x.powf(5.0 / 6.0)
    };
    if arg <= 0.0 {
        return (0.0, in_range);
    }
    let g = arg.sqrt();
    // Step 7, equation (47).
    let sigma = sigma_ref * path.f_ghz.powf(7.0 / 12.0) * g / s.powf(1.2);
    // Step 8, equation (48).
    let lp = p_percent.log10();
    let a = -0.061 * lp.powi(3) + 0.072 * lp * lp - 1.71 * lp + 3.0;
    // Step 9, equation (49).
    (a * sigma, in_range)
}

/// Surface meteorology for [`p676_gaseous_attenuation_db`].
#[derive(Clone, Copy, Debug)]
pub struct Meteo {
    /// Total barometric pressure (hPa).
    pub pressure_hpa: f64,
    /// Temperature (°C).
    pub temperature_c: f64,
    /// Water-vapour density (g/m³).
    pub water_vapour_g_m3: f64,
}

impl Default for Meteo {
    /// The reference atmosphere of ITU-R P.676-10 Figure 5: 1013 hPa, 15 °C, 7.5 g/m³.
    fn default() -> Self {
        Self {
            pressure_hpa: 1013.0,
            temperature_c: 15.0,
            water_vapour_g_m3: 7.5,
        }
    }
}

fn phi(rp: f64, rt: f64, a: f64, b: f64, c: f64, d: f64) -> f64 {
    rp.powf(a) * rt.powf(b) * (c * (1.0 - rp) + d * (1.0 - rt)).exp()
}

/// ITU-R P.676-10 Annex 2 equation (22a): specific attenuation of dry air (dB/km), valid for
/// `f ≤ 54 GHz` (the bands a LEO navigation link uses).
pub fn p676_gamma_oxygen_db_km(f_ghz: f64, m: &Meteo) -> f64 {
    let rp = m.pressure_hpa / 1013.0;
    let rt = 288.0 / (273.0 + m.temperature_c);
    let f = f_ghz.min(54.0 - 1e-6);
    let xi1 = phi(rp, rt, 0.0717, -1.8132, 0.0156, -1.6515);
    let xi2 = phi(rp, rt, 0.5146, -4.6368, -0.1921, -5.7416);
    let xi3 = phi(rp, rt, 0.3414, -6.5851, 0.2130, -8.5854);
    (7.2 * rt.powf(2.8) / (f * f + 0.34 * rp * rp * rt.powf(1.6))
        + 0.62 * xi3 / ((54.0 - f).powf(1.16 * xi1) + 0.83 * xi2))
        * f
        * f
        * rp
        * rp
        * 1e-3
}

/// ITU-R P.676-10 Annex 2 equations (23a) to (23d): specific attenuation of water vapour
/// (dB/km).
pub fn p676_gamma_water_db_km(f_ghz: f64, m: &Meteo) -> f64 {
    let rp = m.pressure_hpa / 1013.0;
    let rt = 288.0 / (273.0 + m.temperature_c);
    let rho = m.water_vapour_g_m3;
    let f = f_ghz;
    let eta1 = 0.955 * rp * rt.powf(0.68) + 0.006 * rho;
    let eta2 = 0.735 * rp * rt.powf(0.5) + 0.0353 * rt.powi(4) * rho;
    let g = |fi: f64| 1.0 + ((f - fi) / (f + fi)).powi(2);
    let e1 = eta1 * eta1;
    let sum = 3.98 * eta1 * (2.23 * (1.0 - rt)).exp() / ((f - 22.235).powi(2) + 9.42 * e1)
        * g(22.0)
        + 11.96 * eta1 * (0.7 * (1.0 - rt)).exp() / ((f - 183.31).powi(2) + 11.14 * e1)
        + 0.081 * eta1 * (6.44 * (1.0 - rt)).exp() / ((f - 321.226).powi(2) + 6.29 * e1)
        + 3.66 * eta1 * (1.6 * (1.0 - rt)).exp() / ((f - 325.153).powi(2) + 9.22 * e1)
        + 25.37 * eta1 * (1.09 * (1.0 - rt)).exp() / (f - 380.0).powi(2)
        + 17.4 * eta1 * (1.46 * (1.0 - rt)).exp() / (f - 448.0).powi(2)
        + 844.6 * eta1 * (0.17 * (1.0 - rt)).exp() / (f - 557.0).powi(2) * g(557.0)
        + 290.0 * eta1 * (0.41 * (1.0 - rt)).exp() / (f - 752.0).powi(2) * g(752.0)
        + 8.3328e4 * eta2 * (0.99 * (1.0 - rt)).exp() / (f - 1780.0).powi(2) * g(1780.0);
    sum * f * f * rt.powf(2.5) * rho * 1e-4
}

/// ITU-R P.676-10 Annex 2 equations (25a) to (25e): equivalent height of dry air (km).
pub fn p676_oxygen_height_km(f_ghz: f64, m: &Meteo) -> f64 {
    let rp = m.pressure_hpa / 1013.0;
    let f = f_ghz;
    let t1 = 4.64 / (1.0 + 0.066 * rp.powf(-2.3))
        * (-((f - 59.7) / (2.87 + 12.4 * (-7.9 * rp).exp())).powi(2)).exp();
    let t2 = 0.14 * (2.12 * rp).exp() / ((f - 118.75).powi(2) + 0.031 * (2.2 * rp).exp());
    let t3 = 0.0114 / (1.0 + 0.14 * rp.powf(-2.6)) * f * (-0.0247 + 0.0001 * f + 1.61e-6 * f * f)
        / (1.0 - 0.0169 * f + 4.1e-5 * f * f + 3.2e-7 * f.powi(3));
    let ho = 6.1 / (1.0 + 0.17 * rp.powf(-1.1)) * (1.0 + t1 + t2 + t3);
    if f < 70.0 {
        ho.min(10.7 * rp.powf(0.3))
    } else {
        ho
    }
}

/// ITU-R P.676-10 Annex 2 equations (26a) and (26b): equivalent height of water vapour (km).
pub fn p676_water_height_km(f_ghz: f64, m: &Meteo) -> f64 {
    let rp = m.pressure_hpa / 1013.0;
    let f = f_ghz;
    let sw = 1.013 / (1.0 + (-8.6 * (rp - 0.57)).exp());
    1.66 * (1.0
        + 1.39 * sw / ((f - 22.235).powi(2) + 2.56 * sw)
        + 3.37 * sw / ((f - 183.31).powi(2) + 4.69 * sw)
        + 1.58 * sw / ((f - 325.1).powi(2) + 2.89 * sw))
}

/// ITU-R P.676-10 Annex 2 equation (27): total zenith gaseous attenuation (dB).
pub fn p676_zenith_attenuation_db(f_ghz: f64, m: &Meteo) -> f64 {
    p676_gamma_oxygen_db_km(f_ghz, m) * p676_oxygen_height_km(f_ghz, m)
        + p676_gamma_water_db_km(f_ghz, m) * p676_water_height_km(f_ghz, m)
}

/// Slant-path gaseous attenuation (dB) at elevation `el_deg`. At 5° and above this is the
/// cosecant law of ITU-R P.676-10 Annex 2 equation (28). Below 5° the cosecant is replaced by
/// the path length through a layer of the equivalent height over a curved Earth (the same form
/// as P.618-14 equation (2)), scaled so that it meets the cosecant law at 5°: a modelled
/// extension, because the Recommendation's own low-elevation procedure needs a refractivity
/// profile the engine does not carry.
pub fn p676_gaseous_attenuation_db(f_ghz: f64, el_deg: f64, m: &Meteo) -> f64 {
    let ao = p676_gamma_oxygen_db_km(f_ghz, m) * p676_oxygen_height_km(f_ghz, m);
    let aw = p676_gamma_water_db_km(f_ghz, m) * p676_water_height_km(f_ghz, m);
    let el = el_deg.max(0.0);
    if el >= 5.0 {
        return (ao + aw) / el.to_radians().sin();
    }
    let airmass = |el_deg: f64, h_km: f64| {
        let s = el_deg.to_radians().sin();
        2.0 / ((s * s + 2.0 * h_km / 6371.0).sqrt() + s)
    };
    let s5 = 5f64.to_radians().sin();
    let ho = p676_oxygen_height_km(f_ghz, m);
    let hw = p676_water_height_km(f_ghz, m);
    ao / s5 * airmass(el, ho) / airmass(5.0, ho) + aw / s5 * airmass(el, hw) / airmass(5.0, hw)
}

/// Building class of ITU-R P.2109-2 Table 1.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum BuildingClass {
    /// "Traditional" construction.
    Traditional,
    /// "Thermally-efficient" construction (metallised glass, foil-backed panels).
    ThermallyEfficient,
}

impl BuildingClass {
    /// Parse `traditional` or `thermally-efficient`.
    pub fn parse(s: &str) -> Result<Self, String> {
        match s {
            "traditional" => Ok(Self::Traditional),
            "thermally-efficient" => Ok(Self::ThermallyEfficient),
            o => Err(format!(
                "building class must be traditional or thermally-efficient; got '{o}'"
            )),
        }
    }

    /// The wire name.
    pub fn as_str(&self) -> &'static str {
        match self {
            Self::Traditional => "traditional",
            Self::ThermallyEfficient => "thermally-efficient",
        }
    }
}

/// ITU-R P.2109-2 equation (1): building entry loss (dB) not exceeded with probability
/// `p` (0 < p < 1) at `f_ghz` (about 0.08 GHz to 100 GHz), for a path at elevation `el_deg`
/// at the building façade.
pub fn p2109_building_entry_loss_db(f_ghz: f64, p: f64, class: BuildingClass, el_deg: f64) -> f64 {
    let (r, s, t, u, v, w, x, y, z) = match class {
        BuildingClass::Traditional => (12.64, 3.72, 0.96, 9.6, 2.0, 9.1, -3.0, 4.5, -2.0),
        BuildingClass::ThermallyEfficient => (28.19, -3.00, 8.48, 13.5, 3.8, 27.8, -2.9, 9.4, -2.1),
    };
    let lf = f_ghz.log10();
    // Equations (9) and (10).
    let lh = r + s * lf + t * lf * lf;
    let le = 0.212 * el_deg.abs();
    // Equations (5) to (8).
    let mu1 = lh + le;
    let mu2 = w + x * lf;
    let sigma1 = u + v * lf;
    let sigma2 = y + z * lf;
    let finv = crate::detection::normal_inv_cdf(p);
    // Equations (2) to (4).
    let a = finv * sigma1 + mu1;
    let b = finv * sigma2 + mu2;
    let c = -3.0;
    10.0 * (10f64.powf(0.1 * a) + 10f64.powf(0.1 * b) + 10f64.powf(0.1 * c)).log10()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn rain_attenuation_is_zero_without_rain_or_above_the_rain_height() {
        let mut p = RainPath {
            f_ghz: 5.0,
            el_deg: 30.0,
            lat_deg: 45.0,
            hs_km: 0.1,
            rain_height_km: 3.0,
            r001_mm_h: 0.0,
            tau_deg: 45.0,
        };
        assert_eq!(p618_rain_attenuation_db(&p, 0.01), 0.0);
        p.r001_mm_h = 40.0;
        p.hs_km = 3.5;
        assert_eq!(p618_rain_attenuation_db(&p, 0.01), 0.0);
    }

    #[test]
    fn rain_grows_with_frequency_and_falls_with_percentage() {
        let base = RainPath {
            f_ghz: 2.5,
            el_deg: 30.0,
            lat_deg: 45.0,
            hs_km: 0.1,
            rain_height_km: 3.0,
            r001_mm_h: 40.0,
            tau_deg: 45.0,
        };
        let s = p618_rain_attenuation_db(&base, 0.01);
        let c = p618_rain_attenuation_db(&RainPath { f_ghz: 5.0, ..base }, 0.01);
        assert!(c > s && s > 0.0, "S {s} C {c}");
        assert!(p618_rain_attenuation_db(&base, 1.0) < s);
    }

    #[test]
    fn gaseous_attenuation_at_l_band_is_a_few_hundredths_of_a_db_at_zenith() {
        let m = Meteo::default();
        let z = p676_zenith_attenuation_db(1.2, &m);
        assert!((0.02..0.06).contains(&z), "{z}");
        // Cosecant law above 5 deg, continuous at 5 deg with the curved-Earth extension.
        let a5 = p676_gaseous_attenuation_db(1.2, 5.0, &m);
        let a4999 = p676_gaseous_attenuation_db(1.2, 4.999, &m);
        assert!((a5 - a4999).abs() < 0.02 * a5, "{a5} {a4999}");
        assert!(p676_gaseous_attenuation_db(1.2, 0.0, &m).is_finite());
    }

    #[test]
    fn building_entry_loss_median_rises_with_elevation_and_class() {
        let t0 = p2109_building_entry_loss_db(0.465, 0.5, BuildingClass::Traditional, 0.0);
        let t45 = p2109_building_entry_loss_db(0.465, 0.5, BuildingClass::Traditional, 45.0);
        let e0 = p2109_building_entry_loss_db(0.465, 0.5, BuildingClass::ThermallyEfficient, 0.0);
        assert!(t45 > t0 && e0 > t0, "{t0} {t45} {e0}");
    }

    #[test]
    fn scintillation_on_a_small_antenna_uses_the_unit_averaging_factor() {
        let (a, in_range) = p618_scintillation_db(
            &ScintillationPath {
                f_ghz: 5.0,
                el_deg: 30.0,
                n_wet: 60.0,
                diameter_m: 0.0,
                efficiency: 0.5,
            },
            1.0,
        );
        assert!(in_range && a > 0.0 && a < 1.0, "{a}");
        let (_, below) = p618_scintillation_db(
            &ScintillationPath {
                f_ghz: 1.2,
                el_deg: 30.0,
                n_wet: 60.0,
                diameter_m: 0.0,
                efficiency: 0.5,
            },
            1.0,
        );
        assert!(!below);
    }
}
