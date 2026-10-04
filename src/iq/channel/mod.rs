// SPDX-License-Identifier: AGPL-3.0-only
//! **Propagation channel models for the GNSS IQ layer.**
//!
//! A channel model turns the geometry of one satellite at one instant ([`LineOfSight`]) into
//! a [`ChannelSnapshot`]: the direct path first, then any reflected paths, each with its own
//! group delay, carrier phase, amplitude and extra Doppler. The scene generator
//! (`iq::scene`) consumes the snapshots; nothing here touches samples.
//!
//! The models are built from small effects chained by a [`Composite`]:
//!
//! * [`iono::Ionosphere`] - first-order ionospheric group delay `+I` and carrier phase
//!   advance `-I` (code-carrier divergence), from the engine's Klobuchar model or a TEC
//!   input, scaled `1/f²` so signals on several carriers stay consistent.
//! * [`tropo::Troposphere`] - the engine's Saastamoinen zenith delay with Niell mapping,
//!   applied as equal group and phase delay.
//! * [`scint::Scintillation`] - the Cornell scintillation model (Humphreys et al. 2009,
//!   2010): Rice amplitude and phase driven by Butterworth-filtered complex Gaussian noise.
//! * [`multipath::GroundReflector`] - one geometric specular reflection off a ground plane
//!   with Fresnel reflection coefficients.
//! * [`land_mobile::LandMobile`] - a three-state (line-of-sight / shadowed / blocked) Markov
//!   land-mobile channel with Loo-distributed amplitude (ITU-R P.681 style).
//!
//! # Convention
//!
//! The [`Composite`] starts every snapshot with the bare geometric direct path:
//! `group_delay_s = range/c`, `carrier_phase_rad = -2π·f·range/c`, amplitude 1, extra
//! Doppler 0. Each effect then edits the snapshot in order. Atmospheric effects
//! ([`iono`], [`tropo`], [`scint`]) apply to every path present; reflection effects
//! ([`multipath`], [`land_mobile`]) derive their reflected paths from the direct path as it
//! stands when they run, so put reflection effects **after** the atmospheric ones and the
//! reflections inherit the atmosphere. The carrier phase is left unwrapped so it stays
//! continuous from one update to the next.
//!
//! # Labels
//!
//! Every submodule is **MODELLED**: each implements a published model and its tests check
//! the implementation against closed forms and the model's own statistics, not against
//! measured channel data. See each submodule for its reference.

use super::{ChannelSnapshot, PathState, C_M_PER_S};
use std::f64::consts::PI;

pub mod iono;
pub mod land_mobile;
pub mod multipath;
pub mod scint;
pub mod tropo;

/// The geometry of one satellite seen from the receiver at one instant.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct LineOfSight {
    /// Elevation of the satellite above the local horizon (rad).
    pub el_rad: f64,
    /// Azimuth of the satellite, clockwise from north (rad).
    pub az_rad: f64,
    /// Geometric range from satellite to receiver antenna (m).
    pub range_m: f64,
    /// Rate of change of the geometric range (m/s; positive when receding).
    pub range_rate_mps: f64,
    /// Receiver geodetic latitude (rad).
    pub lat_rad: f64,
    /// Receiver geodetic longitude (rad).
    pub lon_rad: f64,
    /// Receiver height above the ellipsoid (m).
    pub height_m: f64,
}

/// A propagation channel: yields one [`ChannelSnapshot`] per satellite per update.
///
/// Models may keep per-satellite state (scintillation and land-mobile models do), so calls
/// for one satellite should come in non-decreasing time order.
pub trait ChannelModel {
    /// The channel state of satellite `sat` at time `t_s` (s from scene start) given the
    /// geometry `geom`.
    fn snapshot(&mut self, sat: u32, t_s: f64, geom: &LineOfSight) -> ChannelSnapshot;
}

/// One propagation effect, applied in place to a snapshot that already holds the direct
/// path (and possibly reflections added by earlier effects).
pub trait ChannelEffect {
    /// Edit `snap` for satellite `sat` at time `t_s`, for a signal on carrier `carrier_hz`.
    fn apply(
        &mut self,
        sat: u32,
        t_s: f64,
        geom: &LineOfSight,
        carrier_hz: f64,
        snap: &mut ChannelSnapshot,
    );
}

/// A channel model that starts from the geometric direct path on one carrier and applies a
/// chain of [`ChannelEffect`]s in order.
pub struct Composite {
    carrier_hz: f64,
    effects: Vec<Box<dyn ChannelEffect>>,
}

impl Composite {
    /// An empty chain (geometric direct path only) for a signal on carrier `carrier_hz`.
    pub fn new(carrier_hz: f64) -> Self {
        Self {
            carrier_hz,
            effects: Vec::new(),
        }
    }

    /// Append `effect` to the chain (builder form).
    pub fn with<E: ChannelEffect + 'static>(mut self, effect: E) -> Self {
        self.push(effect);
        self
    }

    /// Append `effect` to the chain.
    pub fn push<E: ChannelEffect + 'static>(&mut self, effect: E) {
        self.effects.push(Box::new(effect));
    }

    /// The carrier frequency the chain is evaluated on (Hz).
    pub fn carrier_hz(&self) -> f64 {
        self.carrier_hz
    }

    /// Number of effects in the chain.
    pub fn len(&self) -> usize {
        self.effects.len()
    }

    /// True when the chain has no effects.
    pub fn is_empty(&self) -> bool {
        self.effects.is_empty()
    }
}

/// The bare geometric direct path on carrier `carrier_hz`: delay `range/c`, phase
/// `-2π·f·range/c`, amplitude 1.
pub fn geometric_path(geom: &LineOfSight, carrier_hz: f64) -> PathState {
    let tau = geom.range_m / C_M_PER_S;
    PathState {
        group_delay_s: tau,
        carrier_phase_rad: -2.0 * PI * carrier_hz * tau,
        amplitude: 1.0,
        extra_doppler_hz: 0.0,
    }
}

impl ChannelModel for Composite {
    fn snapshot(&mut self, sat: u32, t_s: f64, geom: &LineOfSight) -> ChannelSnapshot {
        let mut snap = ChannelSnapshot {
            t_s,
            paths: vec![geometric_path(geom, self.carrier_hz)],
        };
        for e in &mut self.effects {
            e.apply(sat, t_s, geom, self.carrier_hz, &mut snap);
        }
        snap
    }
}

/// Add a non-dispersive delay of `delay_m` metres (group and phase delay equal) to every
/// path of `snap` on carrier `carrier_hz`.
pub(crate) fn add_delay_m(snap: &mut ChannelSnapshot, delay_m: f64, carrier_hz: f64) {
    let dt = delay_m / C_M_PER_S;
    let dphi = -2.0 * PI * carrier_hz * dt;
    for p in &mut snap.paths {
        p.group_delay_s += dt;
        p.carrier_phase_rad += dphi;
    }
}

/// A per-satellite seed derived from a model seed: a SplitMix64 finaliser over the pair, so
/// each satellite's random stream is independent of the order satellites are queried in.
pub(crate) fn sat_seed(seed: u64, sat: u32, stream: u64) -> u64 {
    let mut z = seed
        .wrapping_add(0x9E37_79B9_7F4A_7C15u64.wrapping_mul(u64::from(sat) + 1))
        .wrapping_add(stream.wrapping_mul(0xD1B5_4A32_D192_ED03));
    z = (z ^ (z >> 30)).wrapping_mul(0xBF58_476D_1CE4_E5B9);
    z = (z ^ (z >> 27)).wrapping_mul(0x94D0_49BB_1331_11EB);
    z ^ (z >> 31)
}

#[cfg(test)]
pub(crate) fn test_geom(el_deg: f64) -> LineOfSight {
    LineOfSight {
        el_rad: el_deg.to_radians(),
        az_rad: 0.7,
        range_m: 21_000_000.0,
        range_rate_mps: -300.0,
        lat_rad: 40f64.to_radians(),
        lon_rad: -105f64.to_radians(),
        height_m: 1600.0,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn empty_composite_yields_the_geometric_direct_path() {
        let mut c = Composite::new(1_575_420_000.0);
        assert!(c.is_empty());
        let g = test_geom(30.0);
        let s = c.snapshot(3, 1.0, &g);
        assert_eq!(s.t_s, 1.0);
        assert_eq!(s.paths.len(), 1);
        let p = s.paths[0];
        assert!((p.group_delay_s - g.range_m / C_M_PER_S).abs() < 1e-18);
        // Closed form: phase = -2π f r / c.
        let want = -2.0 * PI * 1_575_420_000.0 * g.range_m / C_M_PER_S;
        assert!((p.carrier_phase_rad - want).abs() < 1e-6);
        assert_eq!(p.amplitude, 1.0);
        assert!(!s.is_nlos());
    }

    #[test]
    fn sat_seeds_differ_by_satellite_and_stream() {
        assert_ne!(sat_seed(1, 1, 0), sat_seed(1, 2, 0));
        assert_ne!(sat_seed(1, 1, 0), sat_seed(1, 1, 1));
        assert_eq!(sat_seed(7, 9, 3), sat_seed(7, 9, 3));
    }
}
