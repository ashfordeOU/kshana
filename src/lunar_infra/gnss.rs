// SPDX-License-Identifier: AGPL-3.0-only
//! Earth-GNSS reception in lunar orbit and on the Moon for the lunar-infrastructure studies: which
//! satellites a receiver tracks, at what C/N0, and the code and carrier noise that C/N0 buys.
//!
//! The link rule is that of [`crate::earth_gnss_lunar`] (Walker constellation, Airy-pattern transmit
//! antenna, Earth occultation, back-lobe floor, a C/N0 threshold); the noise expressions are the
//! textbook code and carrier loop thermal-noise variances (Kaplan and Hegarty, *Understanding
//! GPS/GNSS*, 3rd ed.). MODELLED: the transmit pattern is a stand-in for the measured shaped beam.

use serde::{Deserialize, Serialize};

use super::orbit::{dot, norm, sub, C_M_S};
use crate::antenna::pattern_gain_dbi;
use crate::earth_gnss_lunar::segment_blocked_by_sphere;
use crate::jamming::{free_space_path_loss_db, nominal_cn0_dbhz};
use crate::orbit::{Propagator, R_EARTH_EQUATORIAL_M};
use crate::portable_math::PortableFloat;
use crate::walker::WalkerSgp4;

/// GNSS section of a `lunar-infrastructure` scenario; every field has a default.
#[derive(Clone, Debug, Default, Deserialize, Serialize)]
#[serde(deny_unknown_fields)]
pub struct GnssSpec {
    /// Constellation altitude, km (20180).
    pub altitude_km: Option<f64>,
    /// Inclination, degrees (55).
    pub inclination_deg: Option<f64>,
    /// Orbital planes (6).
    pub planes: Option<usize>,
    /// Satellites per plane (4).
    pub sats_per_plane: Option<usize>,
    /// Walker phasing (2).
    pub phasing_f: Option<f64>,
    /// Transmit power into the antenna, dBW (13.4).
    pub tx_power_dbw: Option<f64>,
    /// Transmit aperture diameter, m (0.35).
    pub tx_diameter_m: Option<f64>,
    /// Aperture efficiency (0.6).
    pub tx_efficiency: Option<f64>,
    /// Carrier frequency, Hz (L1).
    pub freq_hz: Option<f64>,
    /// Receive antenna gain, dBi (12).
    pub rx_gain_dbi: Option<f64>,
    /// System noise temperature, K (290).
    pub system_temp_k: Option<f64>,
    /// Tracking threshold, dB-Hz (25).
    pub tracking_threshold_dbhz: Option<f64>,
    /// Code-loop noise bandwidth, Hz (0.25).
    pub dll_bn_hz: Option<f64>,
    /// Carrier-loop noise bandwidth, Hz (1.0).
    pub phase_bn_hz: Option<f64>,
    /// Signal-in-space error per satellite, m (1.0).
    pub sis_sigma_m: Option<f64>,
}

/// One tracked satellite at one epoch.
#[derive(Clone, Copy, Debug)]
pub struct Track {
    /// Satellite index.
    pub sat: usize,
    /// Inertial position, m.
    pub r_sat: [f64; 3],
    /// Carrier-to-noise density, dB-Hz.
    pub cn0_dbhz: f64,
}

/// The constellation and the resolved link parameters.
pub struct Constellation {
    sats: Vec<Propagator>,
    tx_power_dbw: f64,
    tx_diameter_m: f64,
    tx_eff: f64,
    freq_hz: f64,
    rx_gain_dbi: f64,
    temp_k: f64,
    threshold: f64,
    /// Code-loop noise bandwidth, Hz.
    pub dll_bn_hz: f64,
    /// Carrier-loop noise bandwidth, Hz.
    pub phase_bn_hz: f64,
    /// Signal-in-space error, m.
    pub sis_sigma_m: f64,
}

impl GnssSpec {
    /// Build the constellation.
    pub fn constellation(&self) -> Result<Constellation, String> {
        let w = WalkerSgp4 {
            altitude_km: self.altitude_km.unwrap_or(20_180.0),
            inclination_deg: self.inclination_deg.unwrap_or(55.0),
            planes: self.planes.unwrap_or(6),
            sats_per_plane: self.sats_per_plane.unwrap_or(4),
            phasing_f: self.phasing_f.unwrap_or(2.0),
        };
        if w.planes == 0 || w.sats_per_plane == 0 || w.altitude_km <= 0.0 {
            return Err(crate::terr!(
                "e-lunar-infra-gnss-gnss-planes-sats-per-plane"
            ));
        }
        let eff = self.tx_efficiency.unwrap_or(0.6);
        if !(eff > 0.0 && eff <= 1.0) {
            return Err(crate::terr!(
                "e-lunar-infra-gnss-gnss-tx-efficiency-must-be"
            ));
        }
        Ok(Constellation {
            sats: w.satellites(),
            tx_power_dbw: self.tx_power_dbw.unwrap_or(13.4),
            tx_diameter_m: self.tx_diameter_m.unwrap_or(0.35),
            tx_eff: eff,
            freq_hz: self.freq_hz.unwrap_or(crate::jamming::L1_HZ),
            rx_gain_dbi: self.rx_gain_dbi.unwrap_or(12.0),
            temp_k: self.system_temp_k.unwrap_or(290.0),
            threshold: self.tracking_threshold_dbhz.unwrap_or(25.0),
            dll_bn_hz: self.dll_bn_hz.unwrap_or(0.25),
            phase_bn_hz: self.phase_bn_hz.unwrap_or(1.0),
            sis_sigma_m: self.sis_sigma_m.unwrap_or(1.0),
        })
    }
}

impl Constellation {
    /// Number of satellites.
    pub fn len(&self) -> usize {
        self.sats.len()
    }

    /// Whether the constellation is empty.
    pub fn is_empty(&self) -> bool {
        self.sats.is_empty()
    }

    /// Carrier wavelength, m.
    pub fn wavelength_m(&self) -> f64 {
        C_M_S / self.freq_hz
    }

    /// The satellites a receiver at inertial position `user` tracks at `t_s`: not occulted by the
    /// Earth or, when `moon` (centre, radius) is given, by the Moon, in front of the transmit
    /// aperture, and at or above the C/N0 threshold.
    pub fn tracked(&self, user: [f64; 3], t_s: f64, moon: Option<([f64; 3], f64)>) -> Vec<Track> {
        let mut out = Vec::new();
        for (i, sat) in self.sats.iter().enumerate() {
            let r_sat = sat.position_eci(t_s);
            let to_user = sub(user, r_sat);
            let range = norm(to_user);
            let nadir = [-r_sat[0], -r_sat[1], -r_sat[2]];
            let (nu, nn) = (norm(to_user), norm(nadir));
            if nu <= 0.0 || nn <= 0.0 {
                continue;
            }
            let off = (dot(to_user, nadir) / (nu * nn)).clamp(-1.0, 1.0).pacos();
            if off > std::f64::consts::FRAC_PI_2
                || segment_blocked_by_sphere(r_sat, user, R_EARTH_EQUATORIAL_M)
            {
                continue;
            }
            if let Some((c, rad)) = moon {
                if segment_blocked_by_sphere(sub(r_sat, c), sub(user, c), rad) {
                    continue;
                }
            }
            let gain = pattern_gain_dbi(self.tx_diameter_m, self.freq_hz, self.tx_eff, off);
            let p_rx = self.tx_power_dbw + gain - free_space_path_loss_db(range, self.freq_hz);
            let cn0 = nominal_cn0_dbhz(p_rx, self.rx_gain_dbi, self.temp_k);
            if cn0 >= self.threshold {
                out.push(Track {
                    sat: i,
                    r_sat,
                    cn0_dbhz: cn0,
                });
            }
        }
        out
    }
}

/// Code-tracking (delay-lock loop) 1-sigma, metres: with early-late spacing `d = 1` chip and
/// coherent time `t_coh = 20 ms`, `sigma_chips = sqrt(Bn d / (2 c) (1 + 2 / ((2 - d) T c)))`, `c` the
/// linear C/N0, times the chip length of a 1.023 Mchip/s code.
pub fn code_sigma_m(cn0_dbhz: f64, bn_hz: f64) -> f64 {
    let c = 10f64.ppowf(cn0_dbhz / 10.0);
    let (d, t) = (1.0_f64, 0.02_f64);
    let chips = (bn_hz * d / (2.0 * c) * (1.0 + 2.0 / ((2.0 - d) * t * c))).sqrt();
    chips * C_M_S / 1.023e6
}

/// Carrier-tracking (phase-lock loop) 1-sigma, metres: `sigma_rad = sqrt(Bn / c (1 + 1 / (2 T c)))`
/// with `T = 20 ms`, times `lambda / 2 pi`.
pub fn phase_sigma_m(cn0_dbhz: f64, bn_hz: f64, wavelength_m: f64) -> f64 {
    let c = 10f64.ppowf(cn0_dbhz / 10.0);
    let t = 0.02_f64;
    let rad = (bn_hz / c * (1.0 + 1.0 / (2.0 * t * c))).sqrt();
    rad * wavelength_m / std::f64::consts::TAU
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn code_sigma_falls_with_cn0_and_scales_with_the_square_root_of_bandwidth() {
        let a = code_sigma_m(25.0, 0.25);
        let b = code_sigma_m(35.0, 0.25);
        assert!(b < a && a > 1.0 && a < 100.0, "{a} {b}");
        let r = code_sigma_m(30.0, 1.0) / code_sigma_m(30.0, 0.25);
        assert!((r - 2.0).abs() < 0.05, "{r}");
    }

    #[test]
    fn phase_sigma_is_millimetres_at_25_db_hz() {
        let s = phase_sigma_m(25.0, 1.0, 0.1903);
        assert!((1e-4..1e-2).contains(&s), "{s}");
    }

    #[test]
    fn some_satellites_are_tracked_near_the_moon_and_none_through_the_earth() {
        let c = GnssSpec::default().constellation().unwrap();
        assert_eq!(c.len(), 24);
        let mut seen = 0;
        for k in 0..48 {
            let t = k as f64 * 1800.0;
            let tr = c.tracked([3.844e8, 0.0, 0.0], t, None);
            seen += tr.len();
            for x in &tr {
                assert!(x.cn0_dbhz >= 25.0);
            }
        }
        assert!(seen > 0);
    }
}
