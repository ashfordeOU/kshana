// SPDX-License-Identifier: AGPL-3.0-only
//! **Ionosphere: first-order group delay and carrier phase advance.** MODELLED.
//!
//! The ionosphere is dispersive. To first order a signal on carrier `f` crossing a slant
//! total electron content `TEC` sees a group delay `I = 40.3·TEC/f²` (m, TEC in el/m²) on
//! its code and an equal phase *advance* `-I` on its carrier (code-carrier divergence;
//! Misra & Enge, *Global Positioning System*, 2nd ed., §5.3.2). This effect adds `+I/c` to
//! the group delay of every path and advances the carrier phase by `2π·f·I/c`.
//!
//! The delay comes from one of:
//!
//! * the engine's broadcast Klobuchar model ([`crate::gnss_sim::klobuchar_delay_m`],
//!   IS-GPS-200 §20.3.3.5.2.5, checked there against an RTKLIB reference), which gives the
//!   L1 delay; other carriers are scaled by `(f_L1/f)²`;
//! * a vertical TEC mapped to slant with the thin-shell obliquity factor
//!   ([`crate::ionex::slant_tec`]);
//! * a fixed slant TEC.
//!
//! The TEC-to-delay conversion is [`crate::timetransfer_adv::iono_delay_m`]. Because every
//! source is reduced to a delay that scales as `1/f²`, one [`Ionosphere`] used in
//! [`super::Composite`] chains on different carriers gives multi-frequency signals a
//! consistent ionosphere.
//!
//! Limits: first-order term only (no higher-order `1/f³` terms, no ray bending); the
//! ionospheric rate is carried by the delay changing between updates, not by
//! `extra_doppler_hz`.

use super::{ChannelEffect, LineOfSight};
use crate::gnss_sim::{klobuchar_delay_m, KlobucharCoeffs, L1_HZ};
use crate::iq::{ChannelSnapshot, C_M_PER_S};
use std::f64::consts::PI;

/// Where the ionospheric delay comes from.
#[derive(Clone, Copy, Debug)]
pub enum IonoSource {
    /// Broadcast Klobuchar coefficients. `gps_sod_at_t0` is the GPS seconds of day at scene
    /// time 0; the scene time `t_s` is added to it.
    Klobuchar {
        /// The eight broadcast coefficients.
        coeffs: KlobucharCoeffs,
        /// GPS seconds of day at scene time 0 (s).
        gps_sod_at_t0: f64,
    },
    /// A vertical TEC (TECU) mapped to slant with a thin shell at `shell_height_km`.
    VerticalTec {
        /// Vertical total electron content (TECU, 1 TECU = 10¹⁶ el/m²).
        vtec_tecu: f64,
        /// Height of the single-layer shell (km), typically 350.
        shell_height_km: f64,
    },
    /// A fixed slant TEC (TECU), the same for every satellite.
    SlantTec {
        /// Slant total electron content (TECU).
        stec_tecu: f64,
    },
}

/// The first-order ionosphere effect. See the module documentation.
#[derive(Clone, Copy, Debug)]
pub struct Ionosphere {
    /// Source of the delay.
    pub source: IonoSource,
}

impl Ionosphere {
    /// An ionosphere driven by `source`.
    pub fn new(source: IonoSource) -> Self {
        Self { source }
    }

    /// Slant first-order ionospheric group delay (m) on carrier `carrier_hz` at scene time
    /// `t_s` for geometry `geom`. The carrier phase advance has the same size.
    pub fn delay_m(&self, t_s: f64, geom: &LineOfSight, carrier_hz: f64) -> f64 {
        match self.source {
            IonoSource::Klobuchar {
                coeffs,
                gps_sod_at_t0,
            } => {
                let i_l1 = klobuchar_delay_m(
                    &coeffs,
                    geom.lat_rad,
                    geom.lon_rad,
                    geom.el_rad,
                    geom.az_rad,
                    (gps_sod_at_t0 + t_s).rem_euclid(86_400.0),
                );
                let r = L1_HZ / carrier_hz;
                i_l1 * r * r
            }
            IonoSource::VerticalTec {
                vtec_tecu,
                shell_height_km,
            } => {
                let zenith_deg = 90.0 - geom.el_rad.to_degrees();
                let stec = crate::ionex::slant_tec(vtec_tecu, zenith_deg, shell_height_km);
                crate::timetransfer_adv::iono_delay_m(stec, carrier_hz)
            }
            IonoSource::SlantTec { stec_tecu } => {
                crate::timetransfer_adv::iono_delay_m(stec_tecu, carrier_hz)
            }
        }
    }
}

impl ChannelEffect for Ionosphere {
    fn apply(
        &mut self,
        _sat: u32,
        t_s: f64,
        geom: &LineOfSight,
        carrier_hz: f64,
        snap: &mut ChannelSnapshot,
    ) {
        let i_s = self.delay_m(t_s, geom, carrier_hz) / C_M_PER_S;
        // Group delay +I, carrier phase advance -I (code-carrier divergence).
        let dphi = 2.0 * PI * carrier_hz * i_s;
        for p in &mut snap.paths {
            p.group_delay_s += i_s;
            p.carrier_phase_rad += dphi;
        }
    }
}

#[cfg(test)]
mod tests {
    use super::super::{test_geom, ChannelModel, Composite};
    use super::*;

    const L5_HZ: f64 = 1_176_450_000.0;

    #[test]
    fn one_tecu_is_0_162_m_at_l1_misra_enge_value() {
        // Misra & Enge §5.3.2: 1 TECU ≈ 0.162 m of delay at L1.
        let iono = Ionosphere::new(IonoSource::SlantTec { stec_tecu: 1.0 });
        let d = iono.delay_m(0.0, &test_geom(45.0), L1_HZ);
        assert!((d - 0.1624).abs() < 0.0005, "{d}");
    }

    #[test]
    fn code_and_carrier_diverge_by_equal_and_opposite_amounts() {
        let g = test_geom(20.0);
        let stec = 50.0;
        let mut base = Composite::new(L1_HZ);
        let mut ch =
            Composite::new(L1_HZ).with(Ionosphere::new(IonoSource::SlantTec { stec_tecu: stec }));
        let p0 = base.snapshot(1, 0.0, &g).paths[0];
        let p1 = ch.snapshot(1, 0.0, &g).paths[0];
        // Closed form: I = 40.3e16·TEC/f².
        let i_m = 40.3e16 * stec / (L1_HZ * L1_HZ);
        let code_m = (p1.group_delay_s - p0.group_delay_s) * C_M_PER_S;
        let lambda = C_M_PER_S / L1_HZ;
        // Carrier range = -phase·λ/2π; the ionosphere shortens it by I.
        let carrier_m = -(p1.carrier_phase_rad - p0.carrier_phase_rad) * lambda / (2.0 * PI);
        assert!((code_m - i_m).abs() < 1e-6, "{code_m} vs {i_m}");
        assert!((carrier_m + i_m).abs() < 1e-6, "{carrier_m} vs {}", -i_m);
    }

    #[test]
    fn klobuchar_source_reuses_the_engine_model_and_scales_inverse_f_squared() {
        let g = test_geom(25.0);
        let coeffs = KlobucharCoeffs::default();
        let iono = Ionosphere::new(IonoSource::Klobuchar {
            coeffs,
            gps_sod_at_t0: 50_000.0,
        });
        let l1 = iono.delay_m(400.0, &g, L1_HZ);
        let engine = klobuchar_delay_m(&coeffs, g.lat_rad, g.lon_rad, g.el_rad, g.az_rad, 50_400.0);
        assert_eq!(l1, engine);
        let l5 = iono.delay_m(400.0, &g, L5_HZ);
        let want = (L1_HZ / L5_HZ).powi(2);
        assert!((l5 / l1 - want).abs() < 1e-12);
    }

    #[test]
    fn vertical_tec_maps_to_slant_with_the_thin_shell_factor() {
        let iono = Ionosphere::new(IonoSource::VerticalTec {
            vtec_tecu: 20.0,
            shell_height_km: 350.0,
        });
        let zen = iono.delay_m(0.0, &test_geom(90.0), L1_HZ);
        assert!((zen - 40.3e16 * 20.0 / (L1_HZ * L1_HZ)).abs() < 1e-9);
        // Closed-form thin-shell factor at 10° elevation.
        let el = 10f64.to_radians();
        let re = crate::ionex::IONO_SHELL_RE_KM;
        let sin_zp = re / (re + 350.0) * el.cos();
        let m = 1.0 / (1.0 - sin_zp * sin_zp).sqrt();
        let low = iono.delay_m(0.0, &test_geom(10.0), L1_HZ);
        assert!((low / zen - m).abs() < 1e-9);
    }
}
