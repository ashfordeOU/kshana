// SPDX-License-Identifier: AGPL-3.0-only
//! **Bridge from the propagation channel models to the scene generator.**
//!
//! The channel models ([`super::iono`], [`super::tropo`], [`super::scint`],
//! [`super::multipath`], [`super::land_mobile`]) are keyed on a [`LineOfSight`] and return a
//! [`ChannelSnapshot`] whose paths carry the *absolute* geometric delay and phase
//! (`range/c`, `-2π·f·range/c`). The scene's [`SceneChannel`] is keyed on a [`SatView`] and
//! wants each path's delay and phase as an *excess over the geometric direct path* (so an
//! unperturbed direct path is delay 0, phase 0; see [`crate::iq::scene::direct_path`]).
//!
//! [`SceneChannelAdapter`] closes that gap. It builds a [`LineOfSight`] from the scene's
//! [`SatView`] (turning the receiver ECEF into geodetic latitude, longitude and height with
//! [`crate::frames::ecef_to_geodetic`]), runs a chain of effects starting from the bare
//! geometric path, then subtracts that same geometric baseline from every path so the result
//! is in the scene's excess form. The chain is held as concrete effects (not trait objects)
//! so the whole adapter is [`Send`], as [`SceneChannel`] requires.
//!
//! The effect order matches [`super::Composite`]: atmospheric effects (ionosphere,
//! troposphere, scintillation) first, so reflections inherit the atmosphere, then the
//! reflection effects (ground multipath, land mobile), and finally the optional non-line-of-
//! sight block that zeroes the direct path. MODELLED: each effect is its module's model; the
//! adapter only changes coordinates, and its tests check that the excess delay and phase it
//! emits equal the closed-form channel values.

use super::iono::Ionosphere;
use super::land_mobile::LandMobile;
use super::multipath::GroundReflector;
use super::scint::Scintillation;
use super::tropo::Troposphere;
use super::{geometric_path, ChannelEffect, LineOfSight};
use crate::frames::ecef_to_geodetic;
use crate::iq::scene::{SatView, SceneChannel};
use crate::iq::ChannelSnapshot;

/// The channel effects a scene applies, in application order. Every field is optional; an
/// empty set leaves the signal on the bare geometric direct path.
#[derive(Clone, Debug, Default)]
pub(crate) struct SceneChannelAdapter {
    carrier_hz: f64,
    iono: Option<Ionosphere>,
    tropo: Option<Troposphere>,
    scint: Option<Scintillation>,
    multipath: Vec<GroundReflector>,
    land_mobile: Option<LandMobile>,
    nlos: bool,
}

impl SceneChannelAdapter {
    /// An adapter for a signal on carrier `carrier_hz`, with no effects yet.
    pub(crate) fn new(carrier_hz: f64) -> Self {
        Self {
            carrier_hz,
            ..Self::default()
        }
    }

    /// Set the ionosphere effect.
    pub(crate) fn with_iono(mut self, iono: Ionosphere) -> Self {
        self.iono = Some(iono);
        self
    }
    /// Set the troposphere effect.
    pub(crate) fn with_tropo(mut self, tropo: Troposphere) -> Self {
        self.tropo = Some(tropo);
        self
    }
    /// Set the scintillation effect.
    pub(crate) fn with_scint(mut self, scint: Scintillation) -> Self {
        self.scint = Some(scint);
        self
    }
    /// Append a ground-reflection multipath effect.
    pub(crate) fn with_multipath(mut self, r: GroundReflector) -> Self {
        self.multipath.push(r);
        self
    }
    /// Set the land-mobile statistical channel.
    pub(crate) fn with_land_mobile(mut self, lm: LandMobile) -> Self {
        self.land_mobile = Some(lm);
        self
    }
    /// Block the direct path (non-line-of-sight): the direct amplitude is zeroed after every
    /// other effect, so only reflected or diffuse paths arrive. Only meaningful with a
    /// multipath or land-mobile effect present.
    pub(crate) fn with_nlos(mut self, nlos: bool) -> Self {
        self.nlos = nlos;
        self
    }
}

/// A [`LineOfSight`] built from the scene's [`SatView`].
fn line_of_sight(view: &SatView) -> LineOfSight {
    let g = ecef_to_geodetic(view.receiver_ecef);
    LineOfSight {
        el_rad: view.elevation_deg.to_radians(),
        az_rad: view.azimuth_deg.to_radians(),
        range_m: view.pseudorange_m,
        range_rate_mps: view.pseudorange_rate_mps,
        lat_rad: g.lat_rad,
        lon_rad: g.lon_rad,
        height_m: g.alt_m,
    }
}

impl SceneChannel for SceneChannelAdapter {
    fn snapshot(&mut self, sat_id: u32, t_s: f64, view: &SatView) -> ChannelSnapshot {
        let geom = line_of_sight(view);
        let carrier = self.carrier_hz;
        let mut snap = ChannelSnapshot {
            t_s,
            paths: vec![geometric_path(&geom, carrier)],
        };
        // Atmospheric effects first, then reflections (so reflections inherit the atmosphere),
        // matching `Composite`'s convention.
        if let Some(e) = self.iono.as_mut() {
            e.apply(sat_id, t_s, &geom, carrier, &mut snap);
        }
        if let Some(e) = self.tropo.as_mut() {
            e.apply(sat_id, t_s, &geom, carrier, &mut snap);
        }
        if let Some(e) = self.scint.as_mut() {
            e.apply(sat_id, t_s, &geom, carrier, &mut snap);
        }
        for e in &mut self.multipath {
            e.apply(sat_id, t_s, &geom, carrier, &mut snap);
        }
        if let Some(e) = self.land_mobile.as_mut() {
            e.apply(sat_id, t_s, &geom, carrier, &mut snap);
        }
        if self.nlos {
            if let Some(direct) = snap.paths.first_mut() {
                direct.amplitude = 0.0;
            }
        }
        // Convert absolute paths to the scene's excess-over-geometry form.
        let base = geometric_path(&geom, carrier);
        for p in &mut snap.paths {
            p.group_delay_s -= base.group_delay_s;
            p.carrier_phase_rad -= base.carrier_phase_rad;
        }
        snap
    }
}

#[cfg(test)]
mod tests {
    use super::super::iono::IonoSource;
    use super::super::multipath::{excess_path_m, Ground};
    use super::*;
    use crate::frames::{geodetic_to_ecef, Geodetic};
    use crate::iq::C_M_PER_S;
    use std::f64::consts::PI;

    const L1_HZ: f64 = 1_575_420_000.0;

    fn view(el_deg: f64) -> SatView {
        let rx = geodetic_to_ecef(Geodetic {
            lat_rad: 40f64.to_radians(),
            lon_rad: (-105f64).to_radians(),
            alt_m: 1600.0,
        });
        SatView {
            pseudorange_m: 21_000_000.0,
            pseudorange_rate_mps: -300.0,
            elevation_deg: el_deg,
            azimuth_deg: 40.0,
            receiver_ecef: rx,
        }
    }

    #[test]
    fn empty_adapter_yields_the_unperturbed_direct_path() {
        let mut a = SceneChannelAdapter::new(L1_HZ);
        let s = a.snapshot(3, 0.5, &view(30.0));
        assert_eq!(s.paths.len(), 1);
        let p = s.paths[0];
        assert!(p.group_delay_s.abs() < 1e-15);
        assert!(p.carrier_phase_rad.abs() < 1e-6);
        assert_eq!(p.amplitude, 1.0);
        assert_eq!(s.t_s, 0.5);
    }

    #[test]
    fn ionosphere_excess_matches_the_closed_form() {
        let stec = 40.0;
        let mut a = SceneChannelAdapter::new(L1_HZ)
            .with_iono(Ionosphere::new(IonoSource::SlantTec { stec_tecu: stec }));
        let s = a.snapshot(1, 0.0, &view(25.0));
        // I = 40.3e16·TEC/f² metres of code delay; carrier advances by the same.
        let i_m = 40.3e16 * stec / (L1_HZ * L1_HZ);
        let code_m = s.paths[0].group_delay_s * C_M_PER_S;
        let carrier_m = -s.paths[0].carrier_phase_rad * (C_M_PER_S / L1_HZ) / (2.0 * PI);
        assert!((code_m - i_m).abs() < 1e-6, "{code_m} vs {i_m}");
        assert!((carrier_m + i_m).abs() < 1e-6, "{carrier_m} vs {}", -i_m);
    }

    #[test]
    fn multipath_adds_a_reflected_path_with_the_fresnel_excess_delay() {
        let h = 2.5;
        let mut a =
            SceneChannelAdapter::new(L1_HZ).with_multipath(GroundReflector::new(h, Ground::DRY));
        let v = view(35.0);
        let s = a.snapshot(7, 0.0, &v);
        assert_eq!(s.paths.len(), 2);
        // Direct path is unperturbed; reflected excess delay is 2h·sin(el)/c.
        assert!(s.paths[0].group_delay_s.abs() < 1e-15);
        let want = excess_path_m(h, v.elevation_deg.to_radians()) / C_M_PER_S;
        assert!((s.paths[1].group_delay_s - want).abs() < 1e-15);
    }

    #[test]
    fn nlos_zeroes_the_direct_path_but_keeps_the_reflection() {
        let mut a = SceneChannelAdapter::new(L1_HZ)
            .with_multipath(GroundReflector::new(2.0, Ground::WET))
            .with_nlos(true);
        let s = a.snapshot(1, 0.0, &view(30.0));
        assert!(s.is_nlos());
        assert_eq!(s.paths[0].amplitude, 0.0);
        assert!(s.paths[1].amplitude > 0.0);
    }

    /// End-to-end: a one-satellite noise-free scene carrying scintillation has a sample
    /// envelope that *is* the scintillation amplitude (the code and carrier have unit
    /// magnitude), so the measured S4 of the sample intensity equals the model's target. The
    /// record is short (a unit test, not the channel module's 100 000·τ0 reference run), so
    /// the tolerance is loose but still well clear of zero — the same scene with no channel
    /// has a flat envelope.
    #[test]
    fn scene_scintillation_sample_envelope_has_the_target_s4() {
        use super::super::scint::{ScintParams, Scintillation};
        use crate::iq::scene::{GpsL1Ca, RangeProfile, Scene, SceneConfig, SceneSatellite};
        use crate::iq::scene::{NavData, NullTruth};
        use crate::iq::{SampleSpec, VecSink};

        let s4 = 0.5;
        let tau0 = 0.005;
        // Low sample rate (one sample per 1 kHz knot) keeps the scene cheap; the envelope
        // magnitude is independent of the rate.
        let spec = SampleSpec {
            fs_hz: 1000.0,
            center_hz: L1_HZ,
            if_hz: 0.0,
        };
        let seed = 7u64;
        let mut cfg = SceneConfig::new(spec, 40.0);
        cfg.noise.enabled = false;
        cfg.seed = seed;
        let profile = RangeProfile {
            range_m: 2.1e7,
            range_rate_mps: 0.0,
            range_accel_mps2: 0.0,
            elevation_deg: 45.0,
            azimuth_deg: 0.0,
        };
        let mut scene = Scene::new(cfg).unwrap();
        let code = GpsL1Ca::new(1).unwrap();
        scene.add_satellite(SceneSatellite {
            id: 1,
            code: Box::new(code),
            geometry: crate::iq::scene::SatGeometry::Profile(profile),
            cn0_dbhz: Some(45.0),
            nav: NavData::None,
        });
        let adapter = SceneChannelAdapter::new(L1_HZ)
            .with_scint(Scintillation::new(ScintParams::new(s4, tau0), seed));
        scene.set_channel(Box::new(adapter));
        let mut sink = VecSink::default();
        scene.generate(&mut sink, &mut NullTruth).unwrap();

        let intensity: Vec<f64> = sink
            .samples
            .iter()
            .map(|z| z.re * z.re + z.im * z.im)
            .collect();
        let n = intensity.len() as f64;
        let m1 = intensity.iter().sum::<f64>() / n;
        let m2 = intensity.iter().map(|i| i * i).sum::<f64>() / n;
        let got_s4 = (m2 - m1 * m1).sqrt() / m1;
        assert!((got_s4 - s4).abs() < 0.12, "measured S4 {got_s4} vs {s4}");

        // Same scene, no channel: the envelope is flat (S4 ≈ 0).
        let mut cfg2 = SceneConfig::new(spec, 2.0);
        cfg2.noise.enabled = false;
        let mut scene2 = Scene::new(cfg2).unwrap();
        scene2.add_satellite(
            SceneSatellite::gps_l1ca_profile(1, profile, Some(45.0), NavData::None).unwrap(),
        );
        let mut sink2 = VecSink::default();
        scene2.generate(&mut sink2, &mut NullTruth).unwrap();
        let i2: Vec<f64> = sink2
            .samples
            .iter()
            .map(|z| z.re * z.re + z.im * z.im)
            .collect();
        let n2 = i2.len() as f64;
        let a1 = i2.iter().sum::<f64>() / n2;
        let a2 = i2.iter().map(|i| i * i).sum::<f64>() / n2;
        let flat_s4 = (a2 - a1 * a1).sqrt() / a1;
        // Flat but for floating-point rounding in the carrier rotation.
        assert!(flat_s4 < 1e-5, "no-channel S4 {flat_s4}");
    }
}
