// SPDX-License-Identifier: AGPL-3.0-only
//! Limb rays: the ionosphere, the plasmasphere and the neutral atmosphere on the links of a spacecraft that sees GNSS
//! signals grazing the Earth.
//!
//! A high-altitude user hears the satellites on the far side of the Earth only through rays that pass the limb. Such a ray
//! picks up, by tangent height `h_t`:
//!
//! * **ionosphere and plasmasphere**: the slant total electron content (TEC), a delay `40.3 TEC / f^2` and, as a dual-frequency
//!   observable, the geometry-free difference between the bands. Above ~1,000 km the plasmasphere dominates what a GEO or
//!   HEO user crosses; the *plasmaspheric TEC* is reported on its own;
//! * **neutral atmosphere**: excess path, a bending angle (about 1.3 degrees at the surface), the oxygen absorption along
//!   the path, and the *defocusing* of the bundle of rays that the bending causes, which is the dominant loss for a ray
//!   that grazes the lower atmosphere.
//!
//! # What this model is
//!
//! MODELLED, with every part a stand-in stated here:
//!
//! * ionosphere: a Chapman layer (peak electron density `nmf2`, peak height `hmf2`, scale height `h_scale`);
//! * plasmasphere: the equatorial density of Gallagher, Craven and Comfort (1988), `n = 1390 (3/L)^4.83` cm^-3 for
//!   `2 <= L <= L_pp`, held along a dipole field line (the dipole axis is taken as the Earth's rotation axis: the ~10 degree
//!   magnetic tilt is neglected), with a floor beyond the plasmapause `L_pp` (default 4.5) and a taper into the ionosphere below
//!   1,500 km;
//! * neutral atmosphere: refractivity `N = 315 exp(-h / 7.35 km)` (the shape of ITU-R P.453's reference atmosphere), a
//!   Gaussian-profile bending angle `alpha = N_t 1e-6 sqrt(2 pi R_t / H)`, oxygen absorption of `0.0072 dB/km` at sea level at
//!   L-band (the order ITU-R P.676 gives) with a 5.3 km scale height, and the defocusing factor `1 / (1 + D |d alpha / d h|)`
//!   with `D = d1 d2 / (d1 + d2)`;
//! * straight rays: the integrals follow the geometric line of sight; the 1.3 degree bending shifts the tangent height by
//!   a few kilometres, which this does not iterate.
//!
//! There is no water-vapour term, no ionospheric scintillation, no magnetic-field dependence beyond the dipole and no
//! storm-time variability. The results order the effects and give their size; they are not a replacement for a measured
//! occultation climatology.

use super::constellations::RE_BOOKLET_M;
use super::geom::{self, V3};
use super::sweep::{LinkEffects, LinkEffectsOut};
use crate::portable_math::PortableFloat;

/// The environment parameters.
#[derive(Clone, Copy, Debug, PartialEq, serde::Serialize, serde::Deserialize)]
#[serde(deny_unknown_fields, default)]
pub struct LimbModel {
    /// Chapman-layer peak electron density, m^-3.
    pub nmf2: f64,
    /// Peak height, km.
    pub hmf2_km: f64,
    /// Chapman scale height, km.
    pub h_scale_km: f64,
    /// Plasmapause L shell.
    pub plasmapause_l: f64,
    /// Electron density outside the plasmapause, m^-3.
    pub trough_density: f64,
    /// Scale of the plasmasphere density (1 = Gallagher et al.), a what-if multiplier.
    pub plasmasphere_scale: f64,
    /// Sea-level refractivity, N-units.
    pub n0: f64,
    /// Refractivity scale height, km.
    pub n_scale_km: f64,
    /// Sea-level oxygen absorption at the carrier, dB per km.
    pub gamma0_db_per_km: f64,
    /// Absorption scale height, km.
    pub gamma_scale_km: f64,
}

impl Default for LimbModel {
    fn default() -> Self {
        Self {
            nmf2: 1.0e12,
            hmf2_km: 300.0,
            h_scale_km: 60.0,
            plasmapause_l: 4.5,
            trough_density: 5.0e6,
            plasmasphere_scale: 1.0,
            n0: 315.0,
            n_scale_km: 7.35,
            gamma0_db_per_km: 0.0072,
            gamma_scale_km: 5.3,
        }
    }
}

const TECU: f64 = 1.0e16;

impl LimbModel {
    /// Chapman-layer electron density at an altitude, m^-3.
    pub fn ionosphere(&self, h_km: f64) -> f64 {
        let z = (h_km - self.hmf2_km) / self.h_scale_km;
        self.nmf2 * (0.5 * (1.0 - z - (-z).pexp())).pexp()
    }

    /// Plasmasphere electron density at a point (inertial position, m), m^-3.
    pub fn plasmasphere(&self, p: V3) -> f64 {
        let r = geom::norm(p);
        let h_km = (r - RE_BOOKLET_M) / 1000.0;
        if h_km < 500.0 {
            return 0.0;
        }
        let sin_lat = (p[2] / r).clamp(-0.999999, 0.999999);
        let cos2 = 1.0 - sin_lat * sin_lat;
        let l = (r / RE_BOOKLET_M) / cos2;
        let n = if l < 2.0 {
            1.39e9 * (3.0f64 / 2.0).ppowf(4.83)
        } else if l <= self.plasmapause_l {
            1.39e9 * (3.0 / l).ppowf(4.83)
        } else {
            self.trough_density
        } * self.plasmasphere_scale;
        let taper = if h_km < 1500.0 {
            ((h_km - 500.0) / 1000.0).clamp(0.0, 1.0)
        } else {
            1.0
        };
        n * taper
    }

    /// Slant TEC (TECU) and its plasmaspheric part (TECU) along the straight segment `a`-`b` (inertial, m).
    pub fn slant_tec(&self, a: V3, b: V3) -> (f64, f64) {
        let d = geom::sub(b, a);
        let len = geom::norm(d);
        let n = ((len / 80_000.0).ceil() as usize).clamp(50, 2000);
        let ds = len / n as f64;
        let (mut tot, mut plas) = (0.0, 0.0);
        for k in 0..n {
            let t = (k as f64 + 0.5) / n as f64;
            let p = [a[0] + t * d[0], a[1] + t * d[1], a[2] + t * d[2]];
            let h_km = (geom::norm(p) - RE_BOOKLET_M) / 1000.0;
            let np = self.plasmasphere(p);
            let ni = if h_km < 2500.0 {
                self.ionosphere(h_km.max(0.0))
            } else {
                0.0
            };
            tot += (np + ni) * ds;
            plas += np * ds;
        }
        (tot / TECU, plas / TECU)
    }

    /// The neutral atmosphere on a ray with tangent height `ht_km` between two points at distances `d1` and `d2` (m) from the
    /// tangent point: `(excess path m, bending rad, absorption dB, defocusing loss dB)`.
    pub fn neutral(&self, ht_km: f64, d1: f64, d2: f64) -> (f64, f64, f64, f64) {
        let r_t = RE_BOOKLET_M + ht_km.max(0.0) * 1000.0;
        let h_m = self.n_scale_km * 1000.0;
        let n_t = self.n0 * (-ht_km.max(0.0) / self.n_scale_km).pexp() * 1e-6;
        let pi = std::f64::consts::PI;
        // Straight-ray integral of the refractivity through an exponential atmosphere: N_t sqrt(2 pi R H) per ray, both halves.
        let excess = n_t * (2.0 * pi * r_t * h_m).sqrt();
        let bend = n_t * (2.0 * pi * r_t / h_m).sqrt();
        let hg = self.gamma_scale_km * 1000.0;
        let g_t = self.gamma0_db_per_km * 1e-3 * (-ht_km.max(0.0) / self.gamma_scale_km).pexp();
        let absorb = g_t * (2.0 * pi * r_t * hg).sqrt();
        let dd = d1 * d2 / (d1 + d2);
        let dalpha_dh = bend / h_m;
        let defocus = 10.0 * (1.0 + dd * dalpha_dh).plog10();
        (excess, bend, absorb, defocus)
    }

    /// Everything on the link from `tx` to `user`.
    pub fn link(&self, tx: V3, user: V3, f_hz: f64) -> LinkEffectsOut {
        let d = geom::sub(user, tx);
        let len = geom::norm(d);
        let t = (-geom::dot(tx, d) / (len * len)).clamp(0.0, 1.0);
        let tp = [tx[0] + t * d[0], tx[1] + t * d[1], tx[2] + t * d[2]];
        let ht_km = (geom::norm(tp) - RE_BOOKLET_M) / 1000.0;
        let (stec, ptec) = self.slant_tec(tx, user);
        let iono_delay = 40.3 * stec * TECU / (f_hz * f_hz);
        let (mut loss, mut delay, mut bend) = (0.0, iono_delay, 0.0);
        if (0.0..120.0).contains(&ht_km) && t > 0.0 && t < 1.0 {
            let (ex, b, ab, df) = self.neutral(ht_km, t * len, (1.0 - t) * len);
            loss = ab + df;
            delay += ex;
            bend = b;
        }
        LinkEffectsOut {
            loss_db: loss,
            delay_m: delay,
            stec_tecu: stec,
            plasmaspheric_tecu: ptec,
            tangent_alt_km: ht_km,
            bending_rad: bend,
        }
    }
}

/// The limb model as the sweeps' per-link effects.
pub struct Limb(pub LimbModel);

impl LinkEffects for Limb {
    fn effects(&self, tx: V3, user: V3, f_hz: f64) -> LinkEffectsOut {
        self.0.link(tx, user, f_hz)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn the_chapman_layer_peaks_at_its_height_with_its_density() {
        let m = LimbModel::default();
        assert!((m.ionosphere(300.0) - 1.0e12).abs() / 1.0e12 < 1e-12);
        assert!(m.ionosphere(100.0) < m.ionosphere(300.0));
        assert!(m.ionosphere(1500.0) < 1e-3 * m.ionosphere(300.0));
    }

    #[test]
    fn the_surface_limb_bends_about_one_and_a_third_degrees() {
        let m = LimbModel::default();
        let (_, bend, _, _) = m.neutral(0.0, 2.58e7, 4.19e7);
        assert!(
            (bend.to_degrees() - 1.33).abs() < 0.1,
            "{}",
            bend.to_degrees()
        );
        // Higher tangent heights bend less, and absorb and defocus less.
        let (e20, b20, a20, f20) = m.neutral(20.0, 2.58e7, 4.19e7);
        let (e0, b0, a0, f0) = m.neutral(0.0, 2.58e7, 4.19e7);
        assert!(b20 < b0 && a20 < a0 && f20 < f0 && e20 < e0);
        // At 100 km almost nothing is left.
        let (_, _, a100, f100) = m.neutral(100.0, 2.58e7, 4.19e7);
        assert!(a100 < 0.01 && f100 < 0.01);
    }

    #[test]
    fn a_ray_through_the_dense_ionosphere_has_a_larger_delay_than_one_through_the_plasmasphere_alone(
    ) {
        let m = LimbModel::default();
        let tx = [26.56e6, 0.0, 0.0];
        // A user far on the other side, ray grazing the limb at about 300 km (through the F layer).
        let lo = m.link(tx, [-30.0e6, 12.0e6, 0.0], 1.57542e9);
        // A ray that stays above the ionosphere (tangent far above).
        let hi = m.link(tx, [-10.0e6, 40.0e6, 0.0], 1.57542e9);
        assert!(lo.stec_tecu > hi.stec_tecu);
        assert!(hi.tangent_alt_km > 1000.0 && hi.loss_db == 0.0);
        // Delay scales as 1/f^2 between L1 and L5.
        let l5 = m.link(tx, [-30.0e6, 12.0e6, 0.0], 1.17645e9);
        let r = (l5.delay_m - 0.0) / (lo.delay_m);
        assert!((r - (1.57542f64 / 1.17645).powi(2)).abs() < 0.02, "{r}");
    }

    #[test]
    fn plasmaspheric_tec_is_a_few_tecu_for_an_equatorial_gps_to_geo_ray() {
        let m = LimbModel::default();
        // A user at GEO and a satellite at GPS radius on the far side, ray in the equatorial plane tangent at ~1,000 km.
        let (_, p) = m.slant_tec([26.56e6, 0.0, 0.0], [-2.0e6, 41.5e6, 0.0]);
        assert!(p > 0.5 && p < 60.0, "{p}");
    }
}
