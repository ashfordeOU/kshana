// SPDX-License-Identifier: AGPL-3.0-only
//! The six constellations of the ICG Space Service Volume simulations: their satellites, their signals and the
//! minimum radiated transmit power each signal implies.
//!
//! The signal parameters are tables B2, B6 and B8 of the ICG booklet (UN Office for Outer Space Affairs,
//! ST/SPACE/75, 2018): the reference off-boresight angle (the beamwidth the service provider documents), the minimum
//! received power at GEO, and the worst-case apogee altitude of the constellation. The satellites' orbital states are
//! annex C ([`super::annex_c`]). Nothing here is a measurement: these are the numbers the providers published as their
//! space-service-volume characterisation, and the booklet's own conservative reading of them.

use super::annex_c;
use crate::portable_math::PortableFloat;

/// Earth's gravitational parameter of the booklet's table B1, m^3/s^2.
pub const MU_BOOKLET: f64 = 3.986004415e14;
/// Spherical Earth radius of table B1, m.
pub const RE_BOOKLET_M: f64 = 6_378_000.0;
/// Atmospheric radius added for Earth blockage, table B1, m.
pub const ATMOSPHERE_BOOKLET_M: f64 = 50_000.0;
/// Speed of light, table B7, m/s.
pub const C_LIGHT: f64 = 299_792_458.0;
/// Boltzmann's constant, table B7, J/K.
pub const K_BOLTZMANN: f64 = 1.380_648_52e-23;
/// System noise temperature, table B7, K.
pub const T_SYS_K: f64 = 290.0;

/// A GNSS constellation.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, PartialOrd, Ord, serde::Serialize, serde::Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Constellation {
    /// GPS.
    Gps,
    /// GLONASS.
    Glonass,
    /// Galileo.
    Galileo,
    /// BeiDou (MEO, IGSO and GEO satellites).
    Bds,
    /// QZSS.
    Qzss,
    /// NavIC.
    Navic,
}

impl Constellation {
    /// All six, in the booklet's order.
    pub const ALL: [Constellation; 6] = [
        Constellation::Gps,
        Constellation::Glonass,
        Constellation::Galileo,
        Constellation::Bds,
        Constellation::Qzss,
        Constellation::Navic,
    ];

    /// The name used in reports.
    pub fn name(self) -> &'static str {
        match self {
            Constellation::Gps => "gps",
            Constellation::Glonass => "glonass",
            Constellation::Galileo => "galileo",
            Constellation::Bds => "bds",
            Constellation::Qzss => "qzss",
            Constellation::Navic => "navic",
        }
    }
}

/// The two bands the booklet simulates.
#[derive(Clone, Copy, Debug, PartialEq, Eq, Hash, PartialOrd, Ord, serde::Serialize, serde::Deserialize)]
#[serde(rename_all = "kebab-case")]
pub enum Band {
    /// L1 / E1 / B1 (GLONASS L1, QZSS L1).
    L1,
    /// L5 / L3 / E5a / B2 (GLONASS L3, QZSS L5, NavIC L5).
    L5,
}

impl Band {
    /// The name used in reports.
    pub fn name(self) -> &'static str {
        match self {
            Band::L1 => "l1",
            Band::L5 => "l5",
        }
    }
}

/// Which satellites of a constellation a signal specification applies to.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum SatClass {
    /// Every satellite of the constellation.
    All,
    /// BeiDou MEO satellites.
    BdsMeo,
    /// BeiDou GEO and IGSO satellites.
    BdsGeoIgso,
}

/// One signal's service characterisation (tables B2, B6, B8).
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct SignalSpec {
    /// Constellation.
    pub constellation: Constellation,
    /// Band.
    pub band: Band,
    /// Which satellites.
    pub class: SatClass,
    /// The booklet's signal name.
    pub name: &'static str,
    /// Centre frequency, Hz.
    pub freq_hz: f64,
    /// Reference off-boresight angle (the documented beamwidth), degrees.
    pub beam_deg: f64,
    /// Minimum received civil signal power at GEO for a 0 dBi right-hand circularly polarised antenna, dBW.
    pub pmin_dbw: f64,
    /// Worst-case apogee altitude used for the minimum radiated power, km.
    pub apogee_alt_km: f64,
}

#[allow(clippy::too_many_arguments)]
const fn s(
    constellation: Constellation,
    band: Band,
    class: SatClass,
    name: &'static str,
    freq_mhz: f64,
    beam_deg: f64,
    pmin_dbw: f64,
    apogee_alt_km: f64,
) -> SignalSpec {
    SignalSpec {
        constellation,
        band,
        class,
        name,
        freq_hz: freq_mhz * 1e6,
        beam_deg,
        pmin_dbw,
        apogee_alt_km,
    }
}

use Band::{L1, L5};
use Constellation::{Bds, Galileo, Glonass, Gps, Navic, Qzss};
use SatClass::{All, BdsGeoIgso, BdsMeo};

/// Tables B2, B6 and B8 of the booklet, one row per signal (BeiDou has two rows per band).
pub const SIGNALS: [SignalSpec; 13] = [
    s(Gps, L1, All, "GPS L1 C/A", 1575.42, 23.5, -184.0, 20181.80),
    s(Galileo, L1, All, "Galileo E1 B/C", 1575.42, 20.5, -182.5, 23221.80),
    s(Glonass, L1, All, "GLONASS L1", 1605.375, 20.0, -179.0, 19140.33),
    s(Bds, L1, BdsMeo, "BDS MEO B1", 1575.42, 25.0, -184.2, 21611.86),
    s(Bds, L1, BdsGeoIgso, "BDS GEO/IGSO B1", 1575.42, 19.0, -185.9, 35912.69),
    s(Qzss, L1, All, "QZSS L1 C/A", 1575.42, 22.0, -186.1, 38948.48),
    s(Gps, L5, All, "GPS L5", 1176.45, 26.0, -182.0, 20181.80),
    s(Galileo, L5, All, "Galileo E5a", 1176.45, 23.5, -182.5, 23221.80),
    s(Glonass, L5, All, "GLONASS L3", 1201.0, 28.0, -178.0, 19140.33),
    s(Bds, L5, BdsMeo, "BDS MEO B2", 1191.795, 28.0, -182.8, 21611.86),
    s(Bds, L5, BdsGeoIgso, "BDS GEO/IGSO B2", 1191.795, 22.0, -184.4, 35912.69),
    s(Qzss, L5, All, "QZSS L5", 1176.45, 24.0, -183.4, 38948.48),
    s(Navic, L5, All, "NavIC L5", 1176.45, 16.0, -184.54, 35815.71),
];

/// The signal specification of a satellite class in a band, if the constellation transmits there.
pub fn signal_for(c: Constellation, band: Band, class: SatClass) -> Option<&'static SignalSpec> {
    SIGNALS.iter().find(|x| {
        x.constellation == c
            && x.band == band
            && (x.class == class || x.class == SatClass::All)
    })
}

/// One satellite of the booklet's simulations.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct Satellite {
    /// Its constellation.
    pub constellation: Constellation,
    /// MEO or GEO/IGSO for BeiDou; `All` elsewhere.
    pub class: SatClass,
    /// Semi-major axis, m.
    pub a_m: f64,
    /// Eccentricity.
    pub e: f64,
    /// Inclination, rad.
    pub i_rad: f64,
    /// Right ascension of the ascending node, rad.
    pub raan_rad: f64,
    /// Argument of perigee, rad.
    pub argp_rad: f64,
    /// Mean anomaly at the epoch, rad.
    pub m0_rad: f64,
}

fn sats_of(c: Constellation, rows: &[[f64; 6]]) -> Vec<Satellite> {
    rows.iter()
        .enumerate()
        .map(|(k, r)| Satellite {
            constellation: c,
            class: match c {
                Bds if k < 24 => BdsMeo,
                Bds => BdsGeoIgso,
                _ => All,
            },
            a_m: r[0],
            e: r[1],
            i_rad: r[2].to_radians(),
            raan_rad: r[3].to_radians(),
            argp_rad: r[4].to_radians(),
            m0_rad: r[5].to_radians(),
        })
        .collect()
}

/// The satellites of a constellation as annex C lists them (every row, including the four NavIC IGSO rows annex C marks
/// as not yet coordinated).
pub fn satellites(c: Constellation) -> Vec<Satellite> {
    match c {
        Gps => sats_of(c, &annex_c::GPS),
        Glonass => sats_of(c, &annex_c::GLONASS),
        Galileo => sats_of(c, &annex_c::GALILEO),
        Bds => sats_of(c, &annex_c::BDS),
        Qzss => sats_of(c, &annex_c::QZSS),
        Navic => sats_of(c, &annex_c::NAVIC),
    }
}

/// Solve Kepler's equation `M = E - e sin E` for `E` (Newton, starting from `M` or pi for large `e`).
pub fn kepler_e(m: f64, e: f64) -> f64 {
    let m = m.rem_euclid(2.0 * std::f64::consts::PI);
    let mut ea = if e < 0.8 { m } else { std::f64::consts::PI };
    for _ in 0..50 {
        let f = ea - e * ea.psin() - m;
        let d = f / (1.0 - e * ea.pcos());
        ea -= d;
        if d.abs() < 1e-13 {
            break;
        }
    }
    ea
}

/// Inertial position (m) of a Keplerian orbit `t_s` seconds after the epoch (two-body, no perturbation).
pub fn kepler_position(
    a_m: f64,
    e: f64,
    i_rad: f64,
    raan_rad: f64,
    argp_rad: f64,
    m0_rad: f64,
    t_s: f64,
) -> [f64; 3] {
    let n = (MU_BOOKLET / (a_m * a_m * a_m)).sqrt();
    let ea = kepler_e(m0_rad + n * t_s, e);
    let (se, ce) = ea.psin_cos();
    let xp = a_m * (ce - e);
    let yp = a_m * (1.0 - e * e).sqrt() * se;
    let (so, co) = raan_rad.psin_cos();
    let (si, ci) = i_rad.psin_cos();
    let (sw, cw) = argp_rad.psin_cos();
    let x = xp * (co * cw - so * sw * ci) - yp * (co * sw + so * cw * ci);
    let y = xp * (so * cw + co * sw * ci) - yp * (so * sw - co * cw * ci);
    let z = xp * (sw * si) + yp * (cw * si);
    [x, y, z]
}

impl Satellite {
    /// Inertial position (m) `t_s` seconds after the epoch.
    pub fn position(&self, t_s: f64) -> [f64; 3] {
        kepler_position(
            self.a_m,
            self.e,
            self.i_rad,
            self.raan_rad,
            self.argp_rad,
            self.m0_rad,
            t_s,
        )
    }
}

/// The free-space loss, dB, for a distance in metres at a frequency in Hz.
pub fn free_space_loss_db(range_m: f64, freq_hz: f64) -> f64 {
    20.0 * (4.0 * std::f64::consts::PI * range_m * freq_hz / C_LIGHT).plog10()
}

/// `10 log10(k T)` for the booklet's noise temperature, dBW/Hz (about -203.98).
pub fn noise_density_dbw_hz() -> f64 {
    10.0 * (K_BOLTZMANN * T_SYS_K).plog10()
}

/// The minimum radiated transmit power (dBW) of the booklet's inverse link budget (annex B, figure B4): the minimum
/// received power plus the free-space loss over the distance from the worst-case apogee to a GEO-altitude user along the
/// Earth-limb line. `geo_alt_km` is the user shell the booklet uses (36,000 km).
pub fn mrtp_dbw(spec: &SignalSpec, geo_alt_km: f64) -> f64 {
    let re = RE_BOOKLET_M / 1000.0;
    let r_gnss = re + spec.apogee_alt_km;
    let r_geo = re + geo_alt_km;
    let theta = (re / r_gnss).pasin();
    let (st, ct) = theta.psin_cos();
    let range_km = r_gnss * ct + (r_geo * r_geo - r_gnss * r_gnss * st * st).sqrt();
    spec.pmin_dbw + free_space_loss_db(range_km * 1000.0, spec.freq_hz)
}
