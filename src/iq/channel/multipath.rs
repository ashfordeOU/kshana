// SPDX-License-Identifier: AGPL-3.0-only
//! **Geometric specular multipath: a flat ground plane below the antenna.** MODELLED.
//!
//! An antenna at height `h` above a flat, infinite ground sees one specular reflection.
//! Image geometry gives the reflected path's excess length over the direct path,
//! `Δ = 2h·sin(el)` (Misra & Enge §6.2; Braasch, "Multipath effects", in *GPS: Theory and
//! Applications* vol. I, 1996), so the excess delay is `2h·sin(el)/c`.
//!
//! The reflection coefficient comes from the Fresnel equations for a ground of relative
//! permittivity `εr` and conductivity `σ` (S/m), with complex permittivity
//! `εc = εr − j·60·λ·σ` and grazing angle `θ = el` (ITU-R P.527 for the form; Beckmann &
//! Spizzichino 1963):
//!
//! ```text
//!   Γh = (sin θ − √(εc − cos²θ)) / (sin θ + √(εc − cos²θ))
//!   Γv = (εc·sin θ − √(εc − cos²θ)) / (εc·sin θ + √(εc − cos²θ))
//! ```
//!
//! A right-hand circularly polarised (RHCP) GNSS signal reflects into a co-polarised part
//! `(Γv + Γh)/2` (RHCP) and a cross-polarised part `(Γv − Γh)/2` (LHCP); [`Polarisation`]
//! picks which the antenna receives, and [`GroundReflector::antenna_gain`] scales it for
//! the antenna's gain toward the reflection.
//!
//! The reflected path is appended after the direct path as it stands when this effect runs:
//! delay `τ_direct + Δ/c`, carrier phase `φ_direct − 2π·f·Δ/c + arg Γ`, amplitude
//! `A_direct·|Γ|·gain`. Its extra Doppler is the rate of change of the excess phase,
//! estimated from successive updates of the same satellite (0 on the first update).
//!
//! The ground presets ([`Ground::DRY`], [`Ground::WET`], [`Ground::SEA`]) are representative
//! L-band values of the kind tabulated in ITU-R P.527; they are illustrative, not a site
//! measurement. Limits: one flat specular reflector, no surface roughness, no
//! diffraction, no antenna pattern beyond a scalar gain.

use super::{ChannelEffect, LineOfSight};
use crate::iq::{ChannelSnapshot, PathState, C_M_PER_S};
use std::collections::BTreeMap;
use std::f64::consts::PI;

/// Electrical properties of the reflecting ground.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Ground {
    /// Relative permittivity εr.
    pub eps_r: f64,
    /// Conductivity σ (S/m).
    pub sigma_s_per_m: f64,
}

impl Ground {
    /// Dry ground, representative L-band values: εr = 4, σ = 0.001 S/m.
    pub const DRY: Ground = Ground {
        eps_r: 4.0,
        sigma_s_per_m: 0.001,
    };
    /// Wet ground, representative L-band values: εr = 30, σ = 0.15 S/m.
    pub const WET: Ground = Ground {
        eps_r: 30.0,
        sigma_s_per_m: 0.15,
    };
    /// Sea water, representative L-band values: εr = 70, σ = 5 S/m.
    pub const SEA: Ground = Ground {
        eps_r: 70.0,
        sigma_s_per_m: 5.0,
    };
}

/// Which polarisation component of the reflection the antenna receives.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum Polarisation {
    /// Horizontal (perpendicular) linear polarisation, `Γh`.
    Horizontal,
    /// Vertical (parallel) linear polarisation, `Γv`.
    Vertical,
    /// RHCP in, RHCP out (co-polarised), `(Γv + Γh)/2`.
    RhcpCo,
    /// RHCP in, LHCP out (cross-polarised), `(Γv − Γh)/2`.
    RhcpCross,
}

/// A minimal complex number for the Fresnel arithmetic.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Complex {
    /// Real part.
    pub re: f64,
    /// Imaginary part.
    pub im: f64,
}

impl Complex {
    fn new(re: f64, im: f64) -> Self {
        Self { re, im }
    }
    /// Magnitude.
    pub fn abs(self) -> f64 {
        self.re.hypot(self.im)
    }
    /// Argument (rad).
    pub fn arg(self) -> f64 {
        self.im.atan2(self.re)
    }
    fn add(self, o: Self) -> Self {
        Self::new(self.re + o.re, self.im + o.im)
    }
    fn sub(self, o: Self) -> Self {
        Self::new(self.re - o.re, self.im - o.im)
    }
    fn scale(self, s: f64) -> Self {
        Self::new(self.re * s, self.im * s)
    }
    fn div(self, o: Self) -> Self {
        let d = o.re * o.re + o.im * o.im;
        Self::new(
            (self.re * o.re + self.im * o.im) / d,
            (self.im * o.re - self.re * o.im) / d,
        )
    }
    /// Principal square root (non-negative real part).
    fn sqrt(self) -> Self {
        let r = self.abs();
        let re = ((r + self.re) / 2.0).max(0.0).sqrt();
        let im = ((r - self.re) / 2.0).max(0.0).sqrt();
        Self::new(re, if self.im < 0.0 { -im } else { im })
    }
}

/// Fresnel reflection coefficients `(Γh, Γv)` for grazing angle `grazing_rad` off `ground`
/// at carrier `carrier_hz`.
pub fn fresnel(ground: Ground, grazing_rad: f64, carrier_hz: f64) -> (Complex, Complex) {
    let lambda = C_M_PER_S / carrier_hz;
    let eps = Complex::new(ground.eps_r, -60.0 * lambda * ground.sigma_s_per_m);
    let (s, c) = grazing_rad.sin_cos();
    let root = eps.sub(Complex::new(c * c, 0.0)).sqrt();
    let sn = Complex::new(s, 0.0);
    let gh = sn.sub(root).div(sn.add(root));
    let es = eps.scale(s);
    let gv = es.sub(root).div(es.add(root));
    (gh, gv)
}

/// The reflection coefficient for `pol` (see [`Polarisation`]).
pub fn reflection_coefficient(
    ground: Ground,
    pol: Polarisation,
    grazing_rad: f64,
    carrier_hz: f64,
) -> Complex {
    let (gh, gv) = fresnel(ground, grazing_rad, carrier_hz);
    match pol {
        Polarisation::Horizontal => gh,
        Polarisation::Vertical => gv,
        Polarisation::RhcpCo => gv.add(gh).scale(0.5),
        Polarisation::RhcpCross => gv.sub(gh).scale(0.5),
    }
}

/// Excess path length (m) of the ground reflection for an antenna `h_m` above the plane at
/// elevation `el_rad`: `2h·sin(el)`.
pub fn excess_path_m(h_m: f64, el_rad: f64) -> f64 {
    2.0 * h_m * el_rad.sin()
}

/// One specular reflection off a flat ground plane below the antenna.
#[derive(Clone, Debug)]
pub struct GroundReflector {
    /// Antenna height above the reflecting plane (m).
    pub antenna_height_m: f64,
    /// Ground electrical properties.
    pub ground: Ground,
    /// Polarisation component received.
    pub polarisation: Polarisation,
    /// Antenna amplitude gain toward the reflection relative to the direct signal (linear).
    pub antenna_gain: f64,
    last: BTreeMap<u32, (f64, f64)>,
}

impl GroundReflector {
    /// A reflector with antenna height `antenna_height_m` over `ground`, receiving the
    /// co-polarised (RHCP) reflection with unit antenna gain.
    pub fn new(antenna_height_m: f64, ground: Ground) -> Self {
        Self {
            antenna_height_m,
            ground,
            polarisation: Polarisation::RhcpCo,
            antenna_gain: 1.0,
            last: BTreeMap::new(),
        }
    }

    /// The same reflector receiving polarisation `pol` with antenna gain `gain` (builder).
    pub fn with_polarisation(mut self, pol: Polarisation, gain: f64) -> Self {
        self.polarisation = pol;
        self.antenna_gain = gain;
        self
    }
}

impl ChannelEffect for GroundReflector {
    fn apply(
        &mut self,
        sat: u32,
        t_s: f64,
        geom: &LineOfSight,
        carrier_hz: f64,
        snap: &mut ChannelSnapshot,
    ) {
        if geom.el_rad <= 0.0 {
            return;
        }
        let Some(direct) = snap.paths.first().copied() else {
            return;
        };
        let ex = excess_path_m(self.antenna_height_m, geom.el_rad);
        let ex_phase = -2.0 * PI * carrier_hz * ex / C_M_PER_S;
        let extra_doppler_hz = match self.last.get(&sat) {
            Some(&(t0, ph0)) if t_s > t0 => (ex_phase - ph0) / (2.0 * PI * (t_s - t0)),
            _ => 0.0,
        };
        self.last.insert(sat, (t_s, ex_phase));
        let g = reflection_coefficient(self.ground, self.polarisation, geom.el_rad, carrier_hz);
        snap.paths.push(PathState {
            group_delay_s: direct.group_delay_s + ex / C_M_PER_S,
            carrier_phase_rad: direct.carrier_phase_rad + ex_phase + g.arg(),
            amplitude: direct.amplitude * g.abs() * self.antenna_gain,
            extra_doppler_hz: direct.extra_doppler_hz + extra_doppler_hz,
        });
    }
}

#[cfg(test)]
mod tests {
    use super::super::{test_geom, ChannelModel, Composite};
    use super::*;
    use crate::gnss_sim::L1_HZ;

    const LOSSLESS4: Ground = Ground {
        eps_r: 4.0,
        sigma_s_per_m: 0.0,
    };

    #[test]
    fn excess_delay_is_2h_sin_el_over_c() {
        let h = 1.5;
        let mut ch = Composite::new(L1_HZ).with(GroundReflector::new(h, Ground::DRY));
        for el in [5.0, 30.0, 60.0, 89.0] {
            let s = ch.snapshot(4, 0.0, &test_geom(el));
            assert_eq!(s.paths.len(), 2);
            let want = 2.0 * h * f64::to_radians(el).sin() / C_M_PER_S;
            let got = s.paths[1].group_delay_s - s.paths[0].group_delay_s;
            assert!((got - want).abs() < 1e-15, "{got} vs {want}");
            assert!(!s.is_nlos());
        }
    }

    #[test]
    fn lossless_normal_incidence_matches_closed_form() {
        // Normal incidence (θ = 90°), lossless εr = 4: Γh = (1−2)/(1+2), Γv = (4−2)/(4+2).
        let (gh, gv) = fresnel(LOSSLESS4, PI / 2.0, L1_HZ);
        assert!((gh.re + 1.0 / 3.0).abs() < 1e-12 && gh.im.abs() < 1e-12);
        assert!((gv.re - 1.0 / 3.0).abs() < 1e-12 && gv.im.abs() < 1e-12);
    }

    #[test]
    fn grazing_incidence_tends_to_minus_one() {
        let (gh, gv) = fresnel(Ground::WET, 1e-6, L1_HZ);
        assert!((gh.re + 1.0).abs() < 1e-4 && gh.im.abs() < 1e-4);
        assert!((gv.re + 1.0).abs() < 1e-3 && gv.im.abs() < 1e-3);
    }

    #[test]
    fn vertical_vanishes_at_the_brewster_angle() {
        // Lossless Brewster grazing angle: tan θB = 1/√εr.
        let tb = (1.0 / LOSSLESS4.eps_r.sqrt()).atan();
        let (_, gv) = fresnel(LOSSLESS4, tb, L1_HZ);
        assert!(gv.abs() < 1e-12, "{}", gv.abs());
    }

    #[test]
    fn matches_snell_form_of_the_fresnel_equations() {
        // Independent route for a lossless dielectric: incidence angle from the normal
        // θi = 90° − el, Snell n2 sin θt = sin θi, and the textbook s/p coefficients.
        let n2 = LOSSLESS4.eps_r.sqrt();
        for el in [10.0f64, 25.0, 40.0, 70.0] {
            let ti = (90.0 - el).to_radians();
            let tt = (ti.sin() / n2).asin();
            let rs = (ti.cos() - n2 * tt.cos()) / (ti.cos() + n2 * tt.cos());
            let rp = (n2 * ti.cos() - tt.cos()) / (n2 * ti.cos() + tt.cos());
            let (gh, gv) = fresnel(LOSSLESS4, el.to_radians(), L1_HZ);
            assert!((gh.re - rs).abs() < 1e-12, "el {el}: {} vs {rs}", gh.re);
            assert!((gv.re - rp).abs() < 1e-12, "el {el}: {} vs {rp}", gv.re);
        }
    }

    #[test]
    fn reflected_phase_and_amplitude_follow_gamma() {
        let mut ch = Composite::new(L1_HZ).with(
            GroundReflector::new(2.0, Ground::SEA).with_polarisation(Polarisation::RhcpCross, 0.5),
        );
        let g = test_geom(35.0);
        let s = ch.snapshot(1, 0.0, &g);
        let gam = reflection_coefficient(Ground::SEA, Polarisation::RhcpCross, g.el_rad, L1_HZ);
        assert!((s.paths[1].amplitude - 0.5 * gam.abs()).abs() < 1e-15);
        let ex = excess_path_m(2.0, g.el_rad);
        let want = s.paths[0].carrier_phase_rad - 2.0 * PI * L1_HZ * ex / C_M_PER_S + gam.arg();
        assert!((s.paths[1].carrier_phase_rad - want).abs() < 1e-6);
    }

    #[test]
    fn extra_doppler_is_the_excess_phase_rate() {
        let h = 2.0;
        let mut r = GroundReflector::new(h, Ground::DRY);
        let mut ch = Composite::new(L1_HZ);
        let mut snap0 = ch.snapshot(1, 0.0, &test_geom(30.0));
        r.apply(1, 0.0, &test_geom(30.0), L1_HZ, &mut snap0);
        assert_eq!(snap0.paths[1].extra_doppler_hz, 0.0);
        let mut snap1 = ch.snapshot(1, 1.0, &test_geom(30.01));
        r.apply(1, 1.0, &test_geom(30.01), L1_HZ, &mut snap1);
        let d_ex = excess_path_m(h, 30.01f64.to_radians()) - excess_path_m(h, 30f64.to_radians());
        let want = -L1_HZ * d_ex / C_M_PER_S;
        assert!((snap1.paths[1].extra_doppler_hz - want).abs() < 1e-9);
    }
}
