// SPDX-License-Identifier: AGPL-3.0-only
//! **Troposphere: non-dispersive slant delay.** MODELLED.
//!
//! Reuses the engine's tropospheric model unchanged: the Saastamoinen zenith hydrostatic
//! and wet delays (Davis et al. 1985) projected with the Niell (1996) mapping functions,
//! [`crate::gnss_sim::tropo_delay_m`]. The troposphere is non-dispersive at L-band, so the
//! slant delay `T` is applied as an equal group delay `+T/c` and carrier phase delay
//! `-2π·f·T/c` on every path.
//!
//! Limits: the engine model's (standard meteorology, no gradients, no turbulence).

use super::{add_delay_m, ChannelEffect, LineOfSight};
use crate::gnss_sim::{tropo_delay_m, Meteo};
use crate::iq::ChannelSnapshot;

/// The tropospheric delay effect.
#[derive(Clone, Copy, Debug)]
pub struct Troposphere {
    /// Surface meteorology at the receiver.
    pub meteo: Meteo,
    /// Day of year (1..=366) used by the Niell hydrostatic mapping's seasonal term.
    pub doy: f64,
}

impl Troposphere {
    /// A troposphere with meteorology `meteo` on day of year `doy`.
    pub fn new(meteo: Meteo, doy: f64) -> Self {
        Self { meteo, doy }
    }

    /// Slant tropospheric delay (m) for geometry `geom`.
    pub fn delay_m(&self, geom: &LineOfSight) -> f64 {
        tropo_delay_m(
            &self.meteo,
            geom.lat_rad,
            geom.height_m,
            geom.el_rad,
            self.doy,
        )
    }
}

impl Default for Troposphere {
    /// Standard sea-level meteorology ([`Meteo::default`]) on day 180.
    fn default() -> Self {
        Self::new(Meteo::default(), 180.0)
    }
}

impl ChannelEffect for Troposphere {
    fn apply(
        &mut self,
        _sat: u32,
        _t_s: f64,
        geom: &LineOfSight,
        carrier_hz: f64,
        snap: &mut ChannelSnapshot,
    ) {
        add_delay_m(snap, self.delay_m(geom), carrier_hz);
    }
}

#[cfg(test)]
mod tests {
    use super::super::{test_geom, ChannelModel, Composite};
    use super::*;
    use crate::gnss_sim::L1_HZ;
    use crate::iq::C_M_PER_S;
    use std::f64::consts::PI;

    #[test]
    fn group_and_phase_delay_are_equal_and_match_the_engine_model() {
        let g = test_geom(15.0);
        let tropo = Troposphere::default();
        let t = tropo.delay_m(&g);
        assert_eq!(
            t,
            tropo_delay_m(&Meteo::default(), g.lat_rad, g.height_m, g.el_rad, 180.0)
        );
        assert!(t > 2.0 && t < 20.0, "{t}");
        let p0 = Composite::new(L1_HZ).snapshot(1, 0.0, &g).paths[0];
        let p1 = Composite::new(L1_HZ).with(tropo).snapshot(1, 0.0, &g).paths[0];
        let code_m = (p1.group_delay_s - p0.group_delay_s) * C_M_PER_S;
        let carrier_m =
            -(p1.carrier_phase_rad - p0.carrier_phase_rad) * (C_M_PER_S / L1_HZ) / (2.0 * PI);
        assert!((code_m - t).abs() < 1e-6);
        assert!((carrier_m - t).abs() < 1e-6);
    }
}
