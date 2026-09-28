// SPDX-License-Identifier: AGPL-3.0-only
//! LEO-PNT link physics: the public building blocks of the `leo-pass` scenario kind
//! ([`crate::leo_pass`]), callable on their own by any other module.
//!
//! LEO-PNT is positioning, navigation and timing from satellites in low Earth orbit. The
//! engine treats it as a generic problem: any constellation (Walker, TLE, explicit elements or
//! a designed single pass), any signal design and any band. Named systems are optional data in
//! [`presets`], each with its source.
//!
//! * [`geometry`]: satellite and user kinematics, look angles, range rate, Doppler and Doppler
//!   rate (closed form, with a numerical check), pass design and the static-user Doppler
//!   envelope of a circular orbit.
//! * [`antenna`]: satellite transmit patterns (isoflux, Gaussian beam, flat), the user patch
//!   pattern and polarisation mismatch.
//! * [`itu`]: ITU-R P.676 gaseous attenuation, P.838 and P.618 rain attenuation, P.618
//!   tropospheric scintillation and P.2109 building entry loss.
//! * [`iono`]: first-order ionospheric group delay per band, slant TEC (total electron content)
//!   below a LEO satellite, the ionosphere-free combination and its noise amplification.
//! * [`energy`]: time to first fix, energy per fix and battery life for a low-power receiver.
//! * [`presets`]: named systems (generic multi-band, generic C band, Xona Pulsar, Iridium STL,
//!   Starlink as a signal of opportunity, CentiSpace, Celeste IOD) and the MEO GNSS comparison
//!   signals.

pub mod antenna;
pub mod energy;
pub mod geometry;
pub mod iono;
pub mod itu;
pub mod presets;

/// Speed of light (m/s).
pub const C_M_S: f64 = 299_792_458.0;
/// Earth gravitational parameter (m³/s²), [`crate::forces::MU_EARTH`].
pub const MU_EARTH: f64 = crate::forces::MU_EARTH;
/// Earth equatorial radius (m), [`crate::forces::RE_EARTH`].
pub const RE_EARTH: f64 = crate::forces::RE_EARTH;
/// Earth rotation rate (rad/s), [`crate::forces::EARTH_ROTATION_RATE`].
pub const OMEGA_EARTH: f64 = crate::forces::EARTH_ROTATION_RATE;
/// Earth second zonal harmonic, the first entry of [`crate::forces::EARTH_ZONALS_J2_J6`].
pub const J2_EARTH: f64 = crate::forces::EARTH_ZONALS_J2_J6[0];
/// Boltzmann's constant in decibel form (dBW/K/Hz), [`crate::linkbudget::BOLTZMANN_DBW_PER_K_PER_HZ`].
pub const BOLTZMANN_DB: f64 = crate::linkbudget::BOLTZMANN_DBW_PER_K_PER_HZ;

/// Free-space path loss (dB) at range `range_m` and carrier `f_hz`: the Friis loss
/// `20·log10(4πR/λ)` of [`crate::linkbudget::free_space_loss_db`], equal to
/// `32.45 + 20·log10(R/km) + 20·log10(f/MHz)`.
pub fn fspl_db(range_m: f64, f_hz: f64) -> f64 {
    crate::linkbudget::free_space_loss_db(range_m, f_hz)
}

/// System noise temperature (K) of a receiver: antenna temperature plus the receiver's
/// `290·(10^(NF/10) − 1)`. The antenna temperature is a ground-and-sky floor `t_floor_k`
/// plus the emission of an absorbing atmosphere of attenuation `atm_db` at mean radiating
/// temperature `t_mr_k` (ITU-R P.618-14 § 3: `T_mr·(1 − 10^(−A/10))`), plus the cosmic
/// background of 2.7 K attenuated by the same path.
pub fn system_noise_temperature_k(t_floor_k: f64, atm_db: f64, t_mr_k: f64, nf_db: f64) -> f64 {
    let tr = 10f64.powf(-atm_db.max(0.0) / 10.0);
    t_floor_k + 2.7 * tr + t_mr_k * (1.0 - tr) + 290.0 * (10f64.powf(nf_db / 10.0) - 1.0)
}

/// Carrier-to-noise density (dB-Hz) from received power `c_dbw`, system temperature `tsys_k`
/// and implementation loss `impl_db`: `C − 10·log10(k·T) − L`.
pub fn cn0_dbhz(c_dbw: f64, tsys_k: f64, impl_db: f64) -> f64 {
    c_dbw - (BOLTZMANN_DB + 10.0 * tsys_k.log10()) - impl_db
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn noise_temperature_of_a_clear_sky_patch_receiver() {
        // 2 dB noise figure is 169.6 K; a 100 K floor and a clear sky give about 272 K.
        let t = system_noise_temperature_k(100.0, 0.03, 275.0, 2.0);
        assert!(
            (t - (100.0 + 2.7 * 10f64.powf(-0.003) + 275.0 * (1.0 - 10f64.powf(-0.003)) + 169.62))
                .abs()
                < 0.1
        );
        assert!((cn0_dbhz(-130.0, 290.0, 0.0) - (-130.0 + 228.599_1 - 24.624)).abs() < 1e-3);
    }
}
