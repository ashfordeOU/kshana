// SPDX-License-Identifier: AGPL-3.0-only
//! A four-dimensional ionosphere, `Ne(lat, lon, h, t)`, that serves GNSS and LF skywave
//! propagation from one electron-density field. MODELLED.
//!
//! * **F layer** (GNSS). An alpha-Chapman layer `Ne = NmF2 exp(0.5 (1 - z - e^-z))`,
//!   `z = (h - hmF2) / H`, whose height integral `NmF2 H sqrt(2 pi e)` equals the vertical TEC of a
//!   source at the same place and time: the Klobuchar broadcast model
//!   ([`crate::gnss_sim::klobuchar_delay_m`] at the zenith), a constant, or an IONEX map
//!   ([`crate::ionex::IonexFile::vtec_at`], rotated-map time interpolation). The peak height
//!   `hmF2` (350 km) and the scale height `H` (60 km) are request parameters. Slant TEC is
//!   integrated along the ray through the field (spherical Earth, 1 km steps to 2000 km height,
//!   so the plasmasphere above is left out) and reported beside the thin-shell value
//!   ([`crate::ionex::obliquity_factor`], 350 km) the receivers use.
//! * **D region** (LF). The Wait exponential profile
//!   `Ne = 1.43e13 exp(-0.15 h') exp((beta - 0.15)(h - h')) m^-3` (h, h' in km; Wait and Spies
//!   1964, NBS Technical Note 300), with `h' = 74 km`, `beta = 0.30 /km` by day and `87 km`,
//!   `0.50 /km` by night (the defaults of the US Navy Long-Wave Propagation Capability, LWPC),
//!   linear in the solar zenith angle between 90 and 99 degrees at the path midpoint, unless the
//!   request overrides them (for example to represent storm-time precipitation, which this model
//!   does not predict). LF reflects near the height where the Wait conductivity parameter
//!   `omega_r = 2.5e5 exp(beta (h - h'))` s^-1 equals the angular frequency, so
//!   `h_r = h' + ln(2 pi f / 2.5e5) / beta`. The one-hop skywave path over a spherical Earth
//!   (radius 6371 km) gives the skywave delay after the groundwave (taken at the vacuum speed of
//!   light; the groundwave secondary-factor delay is not included) and the elevation of arrival.
//!
//! What the model does not do: storm-time changes of the F layer come only from the TEC source
//! (an IONEX map of the storm day carries them; the Klobuchar coefficients do not), and the D
//! region has no storm response unless one is given.

use super::{check, cos_solar_zenith, Utc};
use crate::portable_math::PortableFloat;
use serde::{Deserialize, Serialize};

const RE_KM: f64 = 6371.0;
const C_M_S: f64 = 299_792_458.0;
const L1_HZ: f64 = crate::ionex::GPS_L1_HZ;

/// The Chapman layer's integral factor `sqrt(2 pi e)`.
fn chapman_integral() -> f64 {
    (2.0 * std::f64::consts::PI * std::f64::consts::E).sqrt()
}

/// Where the vertical TEC comes from.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(rename_all = "snake_case", deny_unknown_fields)]
pub enum VtecSource {
    /// Klobuchar broadcast coefficients.
    Klobuchar {
        /// The four alpha coefficients (s, s/semicircle, ...).
        alpha: [f64; 4],
        /// The four beta coefficients (s, s/semicircle, ...).
        beta: [f64; 4],
    },
    /// A constant vertical TEC (TECU).
    ConstantTecu(f64),
    /// The IONEX map given with `--ionex <file>`.
    Ionex,
}

impl Default for VtecSource {
    fn default() -> Self {
        let k = crate::gnss_sim::KlobucharCoeffs::default();
        VtecSource::Klobuchar {
            alpha: k.alpha,
            beta: k.beta,
        }
    }
}

/// A fixed D region.
#[derive(Clone, Copy, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct DRegion {
    /// Reference height h' (km).
    pub h_prime_km: f64,
    /// Sharpness beta (1/km).
    pub beta_per_km: f64,
}

/// Day D region (LWPC default).
pub const D_DAY: DRegion = DRegion {
    h_prime_km: 74.0,
    beta_per_km: 0.30,
};
/// Night D region (LWPC default).
pub const D_NIGHT: DRegion = DRegion {
    h_prime_km: 87.0,
    beta_per_km: 0.50,
};

/// A GNSS ray from a receiver.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Ray {
    /// An optional label.
    #[serde(default)]
    pub name: Option<String>,
    /// Receiver latitude (deg).
    pub lat_deg: f64,
    /// Receiver longitude (deg).
    pub lon_deg: f64,
    /// Receiver height (m).
    #[serde(default)]
    pub height_m: f64,
    /// Azimuth of the ray (deg from north).
    pub az_deg: f64,
    /// Elevation of the ray (deg).
    pub el_deg: f64,
}

/// An LF path from a transmitter to a receiver.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct LfPath {
    /// An optional label.
    #[serde(default)]
    pub name: Option<String>,
    /// Transmitter latitude (deg).
    pub tx_lat_deg: f64,
    /// Transmitter longitude (deg).
    pub tx_lon_deg: f64,
    /// Receiver latitude (deg).
    pub rx_lat_deg: f64,
    /// Receiver longitude (deg).
    pub rx_lon_deg: f64,
    /// Carrier frequency (Hz); 100 kHz (Loran-C/eLoran) when absent.
    #[serde(default)]
    pub freq_hz: Option<f64>,
}

/// A vertical profile request.
#[derive(Clone, Debug, PartialEq, Serialize, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct ProfileAt {
    /// Latitude (deg).
    pub lat_deg: f64,
    /// Longitude (deg).
    pub lon_deg: f64,
}

/// The request (`kshana space-weather iono <request.json> [--ionex <file>]`).
#[derive(Clone, Debug, Deserialize)]
#[serde(deny_unknown_fields)]
pub struct Request {
    /// The UTC epochs to evaluate.
    pub epochs_utc: Vec<String>,
    /// The vertical TEC source; the default Klobuchar set when absent.
    #[serde(default)]
    pub vtec: VtecSource,
    /// F2 peak height (km); 350 when absent.
    #[serde(default)]
    pub hmf2_km: Option<f64>,
    /// Chapman scale height (km); 60 when absent.
    #[serde(default)]
    pub scale_height_km: Option<f64>,
    /// A fixed D region instead of the day/night defaults.
    #[serde(default)]
    pub d_region: Option<DRegion>,
    /// GNSS rays to integrate.
    #[serde(default)]
    pub gnss_rays: Vec<Ray>,
    /// LF paths.
    #[serde(default)]
    pub lf_paths: Vec<LfPath>,
    /// Places for vertical profiles.
    #[serde(default)]
    pub profiles: Vec<ProfileAt>,
}

enum Vtec<'a> {
    Klobuchar(crate::gnss_sim::KlobucharCoeffs),
    Constant(f64),
    Ionex(&'a crate::ionex::IonexFile),
}

/// The model.
pub struct Iono4d<'a> {
    vtec: Vtec<'a>,
    /// F2 peak height (km).
    pub hmf2_km: f64,
    /// Chapman scale height (km).
    pub scale_height_km: f64,
    /// A D region that replaces the day/night defaults.
    pub d_override: Option<DRegion>,
}

impl<'a> Iono4d<'a> {
    /// A model on a Klobuchar source.
    pub fn klobuchar(alpha: [f64; 4], beta: [f64; 4]) -> Iono4d<'static> {
        Iono4d {
            vtec: Vtec::Klobuchar(crate::gnss_sim::KlobucharCoeffs { alpha, beta }),
            hmf2_km: 350.0,
            scale_height_km: 60.0,
            d_override: None,
        }
    }

    /// A model on a constant vertical TEC.
    pub fn constant(tecu: f64) -> Iono4d<'static> {
        Iono4d {
            vtec: Vtec::Constant(tecu),
            hmf2_km: 350.0,
            scale_height_km: 60.0,
            d_override: None,
        }
    }

    /// A model on an IONEX file.
    pub fn ionex(file: &'a crate::ionex::IonexFile) -> Iono4d<'a> {
        Iono4d {
            vtec: Vtec::Ionex(file),
            hmf2_km: 350.0,
            scale_height_km: 60.0,
            d_override: None,
        }
    }

    /// Vertical TEC (TECU) at a place and UTC time.
    pub fn vtec_tecu(&self, lat_deg: f64, lon_deg: f64, t: &Utc) -> Result<f64, String> {
        match &self.vtec {
            Vtec::Constant(v) => Ok(*v),
            Vtec::Klobuchar(k) => {
                // The zenith delay, without the model's own obliquity factor at E = 0.5.
                let d = crate::gnss_sim::klobuchar_delay_m(
                    k,
                    lat_deg.to_radians(),
                    lon_deg.to_radians(),
                    std::f64::consts::FRAC_PI_2,
                    0.0,
                    t.seconds_of_day(),
                );
                let f = 1.0 + 16.0 * (0.53f64 - 0.5).ppowi(3);
                Ok(d / f * L1_HZ * L1_HZ / 40.3 / crate::ionex::TECU)
            }
            Vtec::Ionex(file) => {
                let e = crate::ionex::IonexEpoch {
                    year: t.year,
                    month: t.month,
                    day: t.day,
                    hour: t.hour,
                    minute: t.minute,
                    second: t.second,
                };
                let ts = e.seconds_since_day_of(&file.header.first_epoch);
                file.vtec_at(
                    ts,
                    lat_deg,
                    lon_deg,
                    crate::ionex::IonexTimeInterp::RotatedConsecutive,
                )
                .filter(|v| v.is_finite())
                .ok_or_else(|| crate::terr!("e-space-weather-pnt-ionex-span", t = t.iso()))
            }
        }
    }

    /// F2 peak density NmF2 (m^-3) for a vertical TEC (TECU).
    pub fn nmf2(&self, vtec_tecu: f64) -> f64 {
        vtec_tecu * crate::ionex::TECU / (self.scale_height_km * 1e3 * chapman_integral())
    }

    /// F-layer electron density (m^-3) at height `h_km` for a vertical TEC (TECU).
    pub fn ne_f(&self, vtec_tecu: f64, h_km: f64) -> f64 {
        let z = (h_km - self.hmf2_km) / self.scale_height_km;
        self.nmf2(vtec_tecu) * (0.5 * (1.0 - z - (-z).pexp())).pexp()
    }

    /// The D region at a place and time: the override, or the day/night defaults by solar zenith
    /// angle, and that angle (deg).
    pub fn d_region(&self, lat_deg: f64, lon_deg: f64, t: &Utc) -> (DRegion, f64) {
        let chi = cos_solar_zenith(lat_deg, lon_deg, t.mjd())
            .clamp(-1.0, 1.0)
            .pacos()
            .to_degrees();
        if let Some(d) = self.d_override {
            return (d, chi);
        }
        let w = ((chi - 90.0) / 9.0).clamp(0.0, 1.0);
        let d = DRegion {
            h_prime_km: D_DAY.h_prime_km + w * (D_NIGHT.h_prime_km - D_DAY.h_prime_km),
            beta_per_km: D_DAY.beta_per_km + w * (D_NIGHT.beta_per_km - D_DAY.beta_per_km),
        };
        (d, chi)
    }

    /// Electron density (m^-3) at a point: the F layer plus, at and below 100 km, the D region.
    pub fn ne(&self, lat_deg: f64, lon_deg: f64, h_km: f64, t: &Utc) -> Result<f64, String> {
        let mut n = self.ne_f(self.vtec_tecu(lat_deg, lon_deg, t)?, h_km);
        if (50.0..=100.0).contains(&h_km) {
            n += wait_ne(self.d_region(lat_deg, lon_deg, t).0, h_km);
        }
        Ok(n)
    }
}

/// The Wait exponential D-region electron density (m^-3) at `h_km`.
pub fn wait_ne(d: DRegion, h_km: f64) -> f64 {
    1.43e13
        * (-0.15 * d.h_prime_km).pexp()
        * ((d.beta_per_km - 0.15) * (h_km - d.h_prime_km)).pexp()
}

/// The LF reflection height (km) for a D region and a frequency: where the Wait conductivity
/// parameter `2.5e5 exp(beta (h - h'))` equals `2 pi f`.
pub fn lf_reflection_height_km(d: DRegion, freq_hz: f64) -> f64 {
    d.h_prime_km + (2.0 * std::f64::consts::PI * freq_hz / 2.5e5).pln() / d.beta_per_km
}

/// One-hop skywave geometry over a spherical Earth for ground range `d_km` and reflection height
/// `h_km`: (path length km, delay after the groundwave in microseconds, elevation of arrival deg).
pub fn one_hop(d_km: f64, h_km: f64) -> (f64, f64, f64) {
    let half = d_km / RE_KM / 2.0;
    let rh = RE_KM + h_km;
    let leg = (RE_KM * RE_KM + rh * rh - 2.0 * RE_KM * rh * half.pcos()).sqrt();
    let path = 2.0 * leg;
    let el = (rh * half.pcos() - RE_KM)
        .patan2(rh * half.psin())
        .to_degrees();
    (path, (path - d_km) * 1e3 / C_M_S * 1e6, el)
}

fn unit(lat_deg: f64, lon_deg: f64) -> [f64; 3] {
    let (sa, ca) = lat_deg.to_radians().psin_cos();
    let (so, co) = lon_deg.to_radians().psin_cos();
    [ca * co, ca * so, sa]
}

fn latlon(p: [f64; 3]) -> (f64, f64, f64) {
    let r = (p[0] * p[0] + p[1] * p[1] + p[2] * p[2]).sqrt();
    (
        (p[2] / r).clamp(-1.0, 1.0).pasin().to_degrees(),
        p[1].patan2(p[0]).to_degrees(),
        r,
    )
}

/// The great-circle distance (km) and midpoint of two places on the sphere.
pub fn great_circle(lat1: f64, lon1: f64, lat2: f64, lon2: f64) -> (f64, f64, f64) {
    let (a, b) = (unit(lat1, lon1), unit(lat2, lon2));
    let dot = (a[0] * b[0] + a[1] * b[1] + a[2] * b[2]).clamp(-1.0, 1.0);
    let m = [a[0] + b[0], a[1] + b[1], a[2] + b[2]];
    let (mlat, mlon, _) = latlon(m);
    (dot.pacos() * RE_KM, mlat, mlon)
}

/// Slant TEC along a ray.
#[derive(Clone, Debug, Serialize)]
pub struct RayResult {
    /// The ray's label.
    pub name: Option<String>,
    /// Vertical TEC at the receiver (TECU).
    pub vtec_at_receiver_tecu: f64,
    /// Pierce-point latitude at 350 km (deg).
    pub ipp_lat_deg: f64,
    /// Pierce-point longitude at 350 km (deg).
    pub ipp_lon_deg: f64,
    /// Vertical TEC at the pierce point (TECU).
    pub vtec_at_ipp_tecu: f64,
    /// Slant TEC integrated through the field (TECU).
    pub slant_tec_integrated_tecu: f64,
    /// Thin-shell slant TEC (TECU).
    pub slant_tec_thin_shell_tecu: f64,
    /// L1 group delay of the integrated slant TEC (m).
    pub l1_delay_integrated_m: f64,
    /// L1 group delay of the thin-shell slant TEC (m).
    pub l1_delay_thin_shell_m: f64,
}

impl Iono4d<'_> {
    /// Integrate the field along a ray to 2000 km height (1 km steps, midpoint rule).
    pub fn ray(&self, r: &Ray, t: &Utc) -> Result<RayResult, String> {
        let u = unit(r.lat_deg, r.lon_deg);
        let (so, co) = r.lon_deg.to_radians().psin_cos();
        let (sa, ca) = r.lat_deg.to_radians().psin_cos();
        let east = [-so, co, 0.0];
        let north = [-sa * co, -sa * so, ca];
        let (se, ce) = r.el_deg.to_radians().psin_cos();
        let (sz, cz) = r.az_deg.to_radians().psin_cos();
        let dir: [f64; 3] =
            std::array::from_fn(|k| ce * sz * east[k] + ce * cz * north[k] + se * u[k]);
        let r0 = RE_KM + r.height_m / 1000.0;
        let p0: [f64; 3] = std::array::from_fn(|k| r0 * u[k]);
        let at = |s: f64| -> [f64; 3] { std::array::from_fn(|k| p0[k] + s * dir[k]) };
        let mut stec = 0.0;
        let mut s = 0.5;
        let mut ipp = None;
        loop {
            let (lat, lon, rr) = latlon(at(s));
            let h = rr - RE_KM;
            if h > 2000.0 {
                break;
            }
            if ipp.is_none() && h >= crate::space_weather_pnt::dgnss::SHELL_KM {
                ipp = Some((lat, lon));
            }
            stec += self.ne(lat, lon, h, t)? * 1e3;
            s += 1.0;
        }
        let (ilat, ilon) = ipp.unwrap_or((r.lat_deg, r.lon_deg));
        let v_ipp = self.vtec_tecu(ilat, ilon, t)?;
        let thin = crate::ionex::slant_tec(
            v_ipp,
            90.0 - r.el_deg,
            crate::space_weather_pnt::dgnss::SHELL_KM,
        );
        let stec = stec / crate::ionex::TECU;
        Ok(RayResult {
            name: r.name.clone(),
            vtec_at_receiver_tecu: self.vtec_tecu(r.lat_deg, r.lon_deg, t)?,
            ipp_lat_deg: ilat,
            ipp_lon_deg: ilon,
            vtec_at_ipp_tecu: v_ipp,
            slant_tec_integrated_tecu: stec,
            slant_tec_thin_shell_tecu: thin,
            l1_delay_integrated_m: crate::ionex::vtec_to_delay_m(stec, L1_HZ),
            l1_delay_thin_shell_m: crate::ionex::vtec_to_delay_m(thin, L1_HZ),
        })
    }
}

/// An LF skywave result.
#[derive(Clone, Debug, Serialize)]
pub struct LfResult {
    /// The path's label.
    pub name: Option<String>,
    /// Carrier frequency (Hz).
    pub freq_hz: f64,
    /// Great-circle distance (km).
    pub distance_km: f64,
    /// Path midpoint latitude (deg).
    pub midpoint_lat_deg: f64,
    /// Path midpoint longitude (deg).
    pub midpoint_lon_deg: f64,
    /// Solar zenith angle at the midpoint (deg).
    pub solar_zenith_deg: f64,
    /// `day`, `night`, `transition` or `given`.
    pub regime: &'static str,
    /// D-region reference height h' (km).
    pub h_prime_km: f64,
    /// D-region sharpness beta (1/km).
    pub beta_per_km: f64,
    /// LF reflection height (km).
    pub reflection_height_km: f64,
    /// Wait electron density at the reflection height (m^-3).
    pub electron_density_at_reflection_m3: f64,
    /// Elevation of arrival of the one-hop skywave (deg).
    pub hop_elevation_deg: f64,
    /// One-hop skywave delay after the groundwave (microseconds).
    pub skywave_delay_us: f64,
}

impl Iono4d<'_> {
    /// The one-hop LF skywave on a path at a time.
    pub fn lf(&self, p: &LfPath, t: &Utc) -> Result<LfResult, String> {
        let f = check("freq_hz", p.freq_hz.unwrap_or(100e3), 1e3, 3e6)?;
        let (d, mlat, mlon) = great_circle(p.tx_lat_deg, p.tx_lon_deg, p.rx_lat_deg, p.rx_lon_deg);
        let (dr, chi) = self.d_region(mlat, mlon, t);
        let h = lf_reflection_height_km(dr, f);
        let (_, delay, el) = one_hop(d, h);
        let regime = if self.d_override.is_some() {
            "given"
        } else if chi <= 90.0 {
            "day"
        } else if chi >= 99.0 {
            "night"
        } else {
            "transition"
        };
        Ok(LfResult {
            name: p.name.clone(),
            freq_hz: f,
            distance_km: d,
            midpoint_lat_deg: mlat,
            midpoint_lon_deg: mlon,
            solar_zenith_deg: chi,
            regime,
            h_prime_km: dr.h_prime_km,
            beta_per_km: dr.beta_per_km,
            reflection_height_km: h,
            electron_density_at_reflection_m3: wait_ne(dr, h),
            hop_elevation_deg: el,
            skywave_delay_us: delay,
        })
    }
}

const PROFILE_HEIGHTS_KM: [f64; 12] = [
    60.0, 70.0, 80.0, 90.0, 100.0, 150.0, 200.0, 300.0, 350.0, 400.0, 600.0, 1000.0,
];

/// `kshana space-weather iono <request.json> [--ionex <file>]`: the model's outputs as JSON.
pub fn model_json(request_json: &str, ionex_text: Option<&str>) -> Result<String, String> {
    let req: Request = serde_json::from_str(request_json)
        .map_err(|e| crate::terr!("e-space-weather-pnt-request", e = e.to_string()))?;
    let file = match (&req.vtec, ionex_text) {
        (VtecSource::Ionex, Some(t)) => Some(crate::ionex::parse_ionex_file(t)?),
        (VtecSource::Ionex, None) | (_, Some(_)) => {
            return Err(crate::terr!("e-space-weather-pnt-ionex-flag"))
        }
        _ => None,
    };
    let mut m = match (&req.vtec, &file) {
        (VtecSource::Klobuchar { alpha, beta }, _) => Iono4d::klobuchar(*alpha, *beta),
        (VtecSource::ConstantTecu(v), _) => {
            Iono4d::constant(check("vtec.constant_tecu", *v, 0.0, 1e3)?)
        }
        (VtecSource::Ionex, Some(f)) => Iono4d::ionex(f),
        (VtecSource::Ionex, None) => unreachable!("checked above"),
    };
    m.hmf2_km = check("hmf2_km", req.hmf2_km.unwrap_or(350.0), 150.0, 600.0)?;
    m.scale_height_km = check(
        "scale_height_km",
        req.scale_height_km.unwrap_or(60.0),
        10.0,
        200.0,
    )?;
    if let Some(d) = req.d_region {
        check("d_region.h_prime_km", d.h_prime_km, 50.0, 100.0)?;
        check("d_region.beta_per_km", d.beta_per_km, 0.1, 1.5)?;
        m.d_override = Some(d);
    }
    if req.epochs_utc.is_empty() {
        return Err(crate::terr!("e-space-weather-pnt-no-epochs"));
    }
    for r in &req.gnss_rays {
        check("gnss_rays.el_deg", r.el_deg, 3.0, 90.0)?;
        check("gnss_rays.lat_deg", r.lat_deg, -90.0, 90.0)?;
        check("gnss_rays.height_m", r.height_m, -500.0, 50_000.0)?;
    }
    let mut epochs = Vec::with_capacity(req.epochs_utc.len());
    for e in &req.epochs_utc {
        let t = Utc::parse(e)
            .ok_or_else(|| crate::terr!("e-space-weather-pnt-bad-time", value = e.clone()))?;
        let rays = req
            .gnss_rays
            .iter()
            .map(|r| m.ray(r, &t))
            .collect::<Result<Vec<_>, _>>()?;
        let lf = req
            .lf_paths
            .iter()
            .map(|p| m.lf(p, &t))
            .collect::<Result<Vec<_>, _>>()?;
        let mut profiles = Vec::with_capacity(req.profiles.len());
        for p in &req.profiles {
            let v = m.vtec_tecu(p.lat_deg, p.lon_deg, &t)?;
            let (d, chi) = m.d_region(p.lat_deg, p.lon_deg, &t);
            let ne: Vec<[f64; 2]> = PROFILE_HEIGHTS_KM
                .iter()
                .map(|&h| m.ne(p.lat_deg, p.lon_deg, h, &t).map(|n| [h, n]))
                .collect::<Result<_, _>>()?;
            let nm = m.nmf2(v);
            profiles.push(serde_json::json!({
                "lat_deg": p.lat_deg,
                "lon_deg": p.lon_deg,
                "vtec_tecu": v,
                "nmf2_m3": nm,
                "fof2_mhz": 8.98e-6 * nm.sqrt(),
                "hmf2_km": m.hmf2_km,
                "solar_zenith_deg": chi,
                "d_region": d,
                "ne_m3": ne,
            }));
        }
        epochs.push(serde_json::json!({
            "epoch_utc": t.iso(),
            "gnss_rays": rays,
            "lf_paths": lf,
            "profiles": profiles,
        }));
    }
    let doc = serde_json::json!({
        "format": "kshana.space-weather.iono4d/1",
        "label": "MODELLED: a Chapman F layer scaled to the vertical TEC source and the Wait \
                  exponential D region with the LWPC day/night defaults; not compared with \
                  measured slant TEC or skywave delays here",
        "vtec_source": req.vtec,
        "hmf2_km": m.hmf2_km,
        "scale_height_km": m.scale_height_km,
        "epochs": epochs,
    });
    Ok(serde_json::to_string_pretty(&doc).expect("serialise"))
}

#[cfg(test)]
mod tests {
    use super::*;

    fn t(s: &str) -> Utc {
        Utc::parse(s).unwrap()
    }

    #[test]
    fn the_chapman_layer_integrates_to_its_vertical_tec() {
        let m = Iono4d::constant(25.0);
        let mut s = 0.0;
        let mut h = 60.5;
        while h < 3000.0 {
            s += m.ne_f(25.0, h) * 1e3;
            h += 1.0;
        }
        assert!(
            (s / crate::ionex::TECU / 25.0 - 1.0).abs() < 1e-3,
            "{}",
            s / 1e16
        );
    }

    #[test]
    fn a_zenith_ray_sees_the_vertical_tec_and_a_low_ray_agrees_with_the_thin_shell() {
        let m = Iono4d::constant(30.0);
        let e = t("2024-03-20T12:00Z");
        let ray = |el: f64| Ray {
            name: None,
            lat_deg: 45.0,
            lon_deg: 10.0,
            height_m: 0.0,
            az_deg: 180.0,
            el_deg: el,
        };
        let z = m.ray(&ray(90.0), &e).unwrap();
        // The day D region adds a few thousandths of a TECU; the truncation at 2000 km nothing.
        assert!(
            (z.slant_tec_integrated_tecu / 30.0 - 1.0).abs() < 2e-3,
            "{z:?}"
        );
        assert!((z.slant_tec_thin_shell_tecu - 30.0).abs() < 1e-9);
        for el in [10.0, 20.0, 45.0] {
            let r = m.ray(&ray(el), &e).unwrap();
            let q = r.slant_tec_integrated_tecu / r.slant_tec_thin_shell_tecu;
            // The thin shell at 350 km is the receivers' approximation of the same geometry.
            assert!((q - 1.0).abs() < 0.05, "el {el}: {q}");
            assert!(r.slant_tec_integrated_tecu > 30.0);
        }
    }

    #[test]
    fn the_klobuchar_source_gives_its_zenith_delay_back() {
        let k = crate::gnss_sim::KlobucharCoeffs::default();
        let m = Iono4d::klobuchar(k.alpha, k.beta);
        let e = t("2024-03-20T20:00Z");
        let v = m.vtec_tecu(40.0, -100.0, &e).unwrap();
        let d = crate::gnss_sim::klobuchar_delay_m(
            &k,
            40f64.to_radians(),
            (-100f64).to_radians(),
            std::f64::consts::FRAC_PI_2,
            0.0,
            e.seconds_of_day(),
        );
        let f = 1.0 + 16.0 * 0.03f64.powi(3);
        assert!((crate::ionex::vtec_to_delay_m(v, L1_HZ) * f - d).abs() < 1e-9);
        // Daytime (14 h local) TEC is larger than night (02 h local).
        let day = m.vtec_tecu(40.0, -100.0, &t("2024-03-20T20:40Z")).unwrap();
        let night = m.vtec_tecu(40.0, -100.0, &t("2024-03-20T08:40Z")).unwrap();
        assert!(day > night, "{day} {night}");
    }

    #[test]
    fn lf_reflects_lower_by_day_than_by_night() {
        let day = lf_reflection_height_km(D_DAY, 100e3);
        let night = lf_reflection_height_km(D_NIGHT, 100e3);
        // h' + ln(2 pi 1e5 / 2.5e5) / beta: 74 + 0.921/0.30 and 87 + 0.921/0.50.
        assert!((day - 77.07).abs() < 0.01, "{day}");
        assert!((night - 88.84).abs() < 0.01, "{night}");
        // Near the 70 km day and 90 km night reflection heights usually quoted for LF.
        let m = Iono4d::constant(10.0);
        let p = LfPath {
            name: None,
            tx_lat_deg: 50.0,
            tx_lon_deg: 0.0,
            rx_lat_deg: 50.0,
            rx_lon_deg: 10.0,
            freq_hz: None,
        };
        let noon = m.lf(&p, &t("2024-06-21T11:40Z")).unwrap();
        let midnight = m.lf(&p, &t("2024-12-21T23:40Z")).unwrap();
        assert_eq!(noon.regime, "day");
        assert_eq!(midnight.regime, "night");
        assert!(midnight.reflection_height_km > noon.reflection_height_km);
        assert!(midnight.skywave_delay_us > noon.skywave_delay_us);
    }

    #[test]
    fn the_one_hop_geometry_has_its_limits() {
        // Straight up and down at zero range: twice the height.
        let (path, delay, el) = one_hop(1e-6, 80.0);
        assert!((path - 160.0).abs() < 1e-6);
        assert!((delay - 160e3 / C_M_S * 1e6).abs() < 1e-4);
        assert!((el - 90.0).abs() < 1e-3);
        // The delay after the groundwave falls with range; the elevation reaches 0 near the
        // single-hop limit 2 acos(R / (R + h)) R.
        let (_, d500, e500) = one_hop(500.0, 80.0);
        let (_, d1500, e1500) = one_hop(1500.0, 80.0);
        assert!(d500 > d1500 && e500 > e1500);
        let limit = 2.0 * (RE_KM / (RE_KM + 80.0)).acos() * RE_KM;
        assert!(one_hop(limit, 80.0).2.abs() < 1e-6);
    }

    #[test]
    fn the_request_needs_an_ionex_file_exactly_when_it_names_one() {
        let base = r#"{"epochs_utc":["2024-03-20T12:00Z"],"vtec":"ionex"}"#;
        assert!(model_json(base, None).is_err());
        let k = r#"{"epochs_utc":["2024-03-20T12:00Z"],"profiles":[{"lat_deg":0,"lon_deg":0}]}"#;
        assert!(model_json(k, Some("x")).is_err());
        let v: serde_json::Value = serde_json::from_str(&model_json(k, None).unwrap()).unwrap();
        assert!(v["epochs"][0]["profiles"][0]["fof2_mhz"].as_f64().unwrap() > 1.0);
        assert!(model_json(r#"{"epochs_utc":[]}"#, None).is_err());
    }
}
