// SPDX-License-Identifier: AGPL-3.0-only
//! The onboard clock of a receiver on a Keplerian orbit.
//!
//! **Relativity.** At first post-Newtonian order, with the Earth's monopole only, a clock moving at
//! speed `v` at geocentric distance `r` runs against geocentric coordinate time at
//! `dτ/dTCG = 1 − (μ/r + v²/2)/c²`, and TT runs at `dTT/dTCG = 1 − L_G`. With the vis-viva
//! relation `v² = μ(2/r − 1/a)` the rate against TT splits into
//!
//! * a secular part `−3μ/(2ac²) + L_G` (the mean of `1/r` over an orbit is `1/a`), and
//! * a periodic part, the integral of `−2μ(1/r − 1/a)/c²`, which is
//!   `Δτ = −2·√(μa)·e·sin E / c²` (`E` the eccentric anomaly).
//!
//! For a GPS orbit (`a` = 26,560 km) the secular part is +38.6 µs/day and the periodic amplitude
//! is `F·e·√a` with `F = −2√μ/c² = −4.442807633e−10 s/√m`, the constant IS-GPS-200 (20.3.3.3.3.1)
//! publishes; [`gps_relativistic_f`] reproduces it, and the satellite-clock frequency offset
//! IS-GPS-200 states (`Δf/f = −4.4647e−10`, the 10.22999999543 MHz design frequency) is checked
//! against [`secular_rate_vs_tt`] in the tests. The Earth's J2, the Sun and the Moon are neglected
//! (sub-1e−12 effects on the rate for the orbits here, stated as such, not computed).
//!
//! **Noise.** An oscillator class is a set of IEEE 1139 power-law coefficients
//! ([`crate::powerlaw::PowerLaw`]) with an ageing rate and a temperature coefficient. The free-run
//! time error over an outage of `T` seconds is reported as three separate parts: the noise part
//! `x(T) = T·σ_y(T)` (the same mapping as [`crate::clock_specs::x_clock_s`]), the ageing part
//! `D·T²/2`, and the peak-to-peak wander from a sinusoidal temperature swing of `ΔT` kelvin over
//! the orbit period `P`, `k·ΔT·P/(2π)`, bounded by `k·ΔT·T/2` for an outage shorter than half an
//! orbit. The RAFS and miniRAFS classes reuse the cited coefficient sets of
//! [`crate::clock_specs`]; the TCXO, OCXO, USO and CSAC classes are representative orders of
//! magnitude, not any product's datasheet, and are labelled so in every output.

use crate::clock_specs::{LunarClock, CLOCK_F_H_HZ};
use crate::portable_math::PortableFloat;
use crate::powerlaw::{allan_deviation, PowerLaw};
use crate::ssv::sweep::UserOrbit;
use serde::Serialize;

/// The honesty label of every clock output.
pub const LABEL: &str = "MODELLED: first post-Newtonian relativity with the Earth's monopole only (J2, Sun and Moon \
neglected) on a two-body orbit, and power-law clock noise; the TCXO, OCXO, USO and CSAC classes are representative \
orders of magnitude, not a datasheet. The relativistic constant F is checked against IS-GPS-200.";

/// The Earth's gravitational parameter as IS-GPS-200 uses it, m³/s².
pub const MU_GPS: f64 = 3.986_005e14;
/// Speed of light, m/s.
pub const C_M_S: f64 = 299_792_458.0;
/// IAU defining constant `L_G` (the rate of TT against TCG), reused from [`crate::lunar_time`].
pub const L_G: f64 = crate::lunar_time::L_G;
/// The relativistic constant `F` IS-GPS-200 publishes, s/√m.
pub const F_IS_GPS_200: f64 = -4.442_807_633e-10;
/// The satellite-clock design offset IS-GPS-200 states, `Δf/f` (10.22999999543 MHz for 10.23 MHz).
pub const GPS_CLOCK_OFFSET_IS_GPS_200: f64 = -4.4647e-10;
/// Seconds per day.
pub const DAY_S: f64 = 86_400.0;

/// The names [`oscillator`] knows.
pub const OSCILLATORS: &[&str] = &["tcxo", "ocxo", "csac", "uso", "minirafs", "rafs"];

/// An oscillator class.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Oscillator {
    /// Its name.
    pub name: String,
    /// Power-law coefficients.
    pub coefficients: Coefficients,
    /// Linear frequency ageing, fractional frequency per day.
    pub ageing_per_day: f64,
    /// Temperature coefficient, fractional frequency per kelvin.
    pub temp_coeff_per_k: f64,
    /// Where the numbers come from.
    pub source: &'static str,
}

/// The frequency-noise power-law coefficients of an oscillator (IEEE 1139 `h_α`, 1/Hz).
#[derive(Clone, Copy, Debug, PartialEq, Serialize)]
pub struct Coefficients {
    /// `h_−2`, random-walk FM.
    pub h_m2: f64,
    /// `h_−1`, flicker FM.
    pub h_m1: f64,
    /// `h_0`, white FM.
    pub h_0: f64,
}

impl Coefficients {
    fn of(p: &PowerLaw) -> Self {
        Self {
            h_m2: p.h_m2,
            h_m1: p.h_m1,
            h_0: p.h_0,
        }
    }
}

impl Oscillator {
    /// The coefficients as a [`PowerLaw`] (no phase-modulation terms).
    pub fn power_law(&self) -> PowerLaw {
        PowerLaw {
            h_m2: self.coefficients.h_m2,
            h_m1: self.coefficients.h_m1,
            h_0: self.coefficients.h_0,
            h_1: 0.0,
            h_2: 0.0,
        }
    }
}

/// White-FM `h_0` for an Allan deviation `adev_1s` at one second.
fn h0_for(adev_1s: f64) -> f64 {
    2.0 * adev_1s * adev_1s
}

/// Flicker-FM `h_−1` for a floor `floor`.
fn hm1_for(floor: f64) -> f64 {
    floor * floor / (2.0 * 2.0_f64.pln())
}

/// Random-walk-FM `h_−2` for an Allan deviation `adev` at one day.
fn hm2_for(adev_1d: f64) -> f64 {
    3.0 * adev_1d * adev_1d / (2.0 * std::f64::consts::PI * std::f64::consts::PI * DAY_S)
}

const REPRESENTATIVE: &str = "representative order of magnitude for the class, not a datasheet";

/// An oscillator class by name (`tcxo`, `ocxo`, `csac`, `uso`, `minirafs`, `rafs`).
pub fn oscillator(name: &str) -> Option<Oscillator> {
    let rep = |adev_1s: f64, floor: f64, adev_1d: f64, ageing: f64, temp: f64| Oscillator {
        name: name.to_string(),
        coefficients: Coefficients {
            h_m2: hm2_for(adev_1d),
            h_m1: hm1_for(floor),
            h_0: h0_for(adev_1s),
        },
        ageing_per_day: ageing,
        temp_coeff_per_k: temp,
        source: REPRESENTATIVE,
    };
    let cited = |c: LunarClock, ageing: f64, temp: f64| {
        Oscillator {
        name: name.to_string(),
        coefficients: Coefficients::of(&c.powerlaw()),
        ageing_per_day: ageing,
        temp_coeff_per_k: temp,
        source: "noise coefficients from clock_specs (cited one-day time error); ageing and temperature coefficient representative",
    }
    };
    Some(match name {
        "tcxo" => rep(1e-9, 1e-9, 1e-8, 1e-9, 1e-8),
        "ocxo" => rep(1e-12, 1e-12, 1e-11, 1e-10, 1e-10),
        "csac" => rep(3e-10, 1e-12, 1e-11, 1e-11, 1e-11),
        "uso" => rep(1e-13, 1e-13, 1e-12, 1e-11, 1e-12),
        "minirafs" => cited(LunarClock::MiniRafs, 1e-12, 1e-12),
        "rafs" => cited(LunarClock::Rafs, 1e-13, 1e-13),
        _ => return None,
    })
}

/// `F = −2√μ/c²`, s/√m, from [`MU_GPS`].
pub fn gps_relativistic_f() -> f64 {
    -2.0 * MU_GPS.sqrt() / (C_M_S * C_M_S)
}

/// Secular fractional rate of a clock on an orbit of semi-major axis `a_m` against TT
/// (positive: the orbiting clock runs fast), `−3μ/(2ac²) + L_G`.
pub fn secular_rate_vs_tt(a_m: f64) -> f64 {
    -3.0 * MU_GPS / (2.0 * a_m * C_M_S * C_M_S) + L_G
}

/// Amplitude of the periodic (eccentricity) relativistic term, s: `2·√(μa)·e/c²`.
pub fn periodic_amplitude_s(a_m: f64, e: f64) -> f64 {
    2.0 * (MU_GPS * a_m).sqrt() * e / (C_M_S * C_M_S)
}

/// The periodic term at eccentric anomaly `ea_rad`, s: `−2·√(μa)·e·sin E / c²`.
pub fn periodic_term_s(a_m: f64, e: f64, ea_rad: f64) -> f64 {
    -periodic_amplitude_s(a_m, e) * ea_rad.psin()
}

/// The relativistic behaviour of a clock on one orbit.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Relativity {
    /// Secular fractional rate against TT (positive: fast).
    pub secular_rate: f64,
    /// The same, microseconds per day.
    pub secular_us_per_day: f64,
    /// Gravitational part of the rate (`−μ/(ac²)·…` averaged: `−μ/(ac²) + L_G`).
    pub gravitational_rate: f64,
    /// Velocity part of the rate (`−μ/(2ac²)`).
    pub velocity_rate: f64,
    /// Amplitude of the periodic eccentricity term, ns.
    pub periodic_amplitude_ns: f64,
    /// The orbit period, s.
    pub period_s: f64,
}

/// Relativity for an orbit.
pub fn relativity(o: &UserOrbit) -> Relativity {
    let a = o.a_km * 1000.0;
    let c2 = C_M_S * C_M_S;
    let secular = secular_rate_vs_tt(a);
    Relativity {
        secular_rate: secular,
        secular_us_per_day: secular * DAY_S * 1e6,
        gravitational_rate: -MU_GPS / (a * c2) + L_G,
        velocity_rate: -MU_GPS / (2.0 * a * c2),
        periodic_amplitude_ns: periodic_amplitude_s(a, o.e) * 1e9,
        period_s: o.period_min() * 60.0,
    }
}

/// The free-run time error of an oscillator over one outage.
#[derive(Clone, Debug, PartialEq, Serialize)]
pub struct Holdover {
    /// Outage length, s.
    pub outage_s: f64,
    /// Noise part `T·σ_y(T)`, s (one sigma).
    pub noise_s: f64,
    /// Ageing part `D·T²/2`, s.
    pub ageing_s: f64,
    /// Temperature wander, peak to peak, s.
    pub thermal_s: f64,
    /// Relativistic secular part if left uncorrected, `|rate|·T`, s.
    pub relativity_uncorrected_s: f64,
    /// Noise, ageing and thermal parts added (relativity assumed corrected), s.
    pub total_s: f64,
}

/// The time error after `outage_s` seconds without GNSS, for a temperature swing `temp_swing_k`
/// (peak to peak) over an orbit of period `period_s`, and a relativistic rate `rel_rate`.
pub fn holdover(
    osc: &Oscillator,
    outage_s: f64,
    temp_swing_k: f64,
    period_s: f64,
    rel_rate: f64,
) -> Holdover {
    let t = outage_s.max(0.0);
    let noise = if t > 0.0 {
        t * allan_deviation(&osc.power_law(), t, CLOCK_F_H_HZ)
    } else {
        0.0
    };
    let ageing = osc.ageing_per_day / DAY_S * t * t / 2.0;
    let k_dt = osc.temp_coeff_per_k * temp_swing_k.abs();
    let thermal = if period_s > 0.0 {
        (k_dt * period_s / (2.0 * std::f64::consts::PI)).min(k_dt * t / 2.0)
    } else {
        0.0
    };
    Holdover {
        outage_s: t,
        noise_s: noise,
        ageing_s: ageing,
        thermal_s: thermal,
        relativity_uncorrected_s: rel_rate.abs() * t,
        total_s: noise + ageing + thermal,
    }
}

/// The `clock` report.
#[derive(Clone, Debug, Serialize)]
pub struct ClockReport {
    /// Document schema.
    pub schema: &'static str,
    /// Honesty label.
    pub label: &'static str,
    /// The orbit.
    pub orbit: UserOrbit,
    /// The oscillator.
    pub oscillator: Oscillator,
    /// Peak-to-peak temperature swing over an orbit, K.
    pub temp_swing_k: f64,
    /// Relativity.
    pub relativity: Relativity,
    /// Holdover at the standard outage lengths and any requested ones.
    pub holdover: Vec<Holdover>,
}

/// Outage lengths every clock report lists, s.
pub const STANDARD_OUTAGES_S: [f64; 5] = [60.0, 600.0, 3600.0, 6.0 * 3600.0, DAY_S];

/// Build the clock report.
pub fn clock_report(
    orbit: UserOrbit,
    osc: Oscillator,
    temp_swing_k: f64,
    extra_outages_s: &[f64],
) -> ClockReport {
    let rel = relativity(&orbit);
    let mut outs: Vec<f64> = STANDARD_OUTAGES_S.to_vec();
    outs.extend_from_slice(extra_outages_s);
    outs.sort_by(f64::total_cmp);
    outs.dedup();
    let holdover = outs
        .iter()
        .map(|&t| holdover(&osc, t, temp_swing_k, rel.period_s, rel.secular_rate))
        .collect();
    ClockReport {
        schema: "kshana.space-receiver-clock/1",
        label: LABEL,
        orbit,
        oscillator: osc,
        temp_swing_k,
        relativity: rel,
        holdover,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn f_matches_is_gps_200() {
        let f = gps_relativistic_f();
        assert!(
            ((f - F_IS_GPS_200) / F_IS_GPS_200).abs() < 1e-9,
            "F = {f:e}"
        );
    }

    #[test]
    fn gps_orbit_rate_matches_the_design_frequency_offset() {
        // The GPS nominal semi-major axis, 26,559.7 km. The design offset is applied with the
        // opposite sign so the clock reads 10.23 MHz on orbit.
        let r = secular_rate_vs_tt(26_559_700.0);
        assert!(
            (r + GPS_CLOCK_OFFSET_IS_GPS_200).abs() < 0.002e-10,
            "rate {r:e}"
        );
        let us_day = r * DAY_S * 1e6;
        assert!((us_day - 38.6).abs() < 0.1, "{us_day}");
    }

    #[test]
    fn periodic_amplitude_is_f_e_sqrt_a() {
        let (a, e) = (26_560_000.0, 0.02);
        let amp = periodic_amplitude_s(a, e);
        assert!((amp - (-F_IS_GPS_200) * e * a.sqrt()).abs() < 1e-15);
        // About 46 ns for e = 0.02.
        assert!((amp * 1e9 - 45.8).abs() < 0.5, "{}", amp * 1e9);
        assert!(periodic_term_s(a, e, std::f64::consts::FRAC_PI_2) < 0.0);
    }

    #[test]
    fn geo_runs_fast_and_leo_slow() {
        let geo = secular_rate_vs_tt(42_164_000.0);
        let leo = secular_rate_vs_tt(6_378_000.0 + 400_000.0);
        assert!(geo > 0.0 && leo < 0.0, "{geo:e} {leo:e}");
    }

    #[test]
    fn holdover_grows_and_the_better_clock_holds_better() {
        let tcxo = oscillator("tcxo").unwrap();
        let rafs = oscillator("rafs").unwrap();
        let a = holdover(&tcxo, 600.0, 0.0, 0.0, 0.0);
        let b = holdover(&tcxo, 3600.0, 0.0, 0.0, 0.0);
        assert!(b.total_s > a.total_s);
        let c = holdover(&rafs, 3600.0, 0.0, 0.0, 0.0);
        assert!(c.total_s < b.total_s / 100.0);
        assert_eq!(holdover(&tcxo, 0.0, 5.0, 6000.0, 1e-10).total_s, 0.0);
    }

    #[test]
    fn thermal_wander_is_bounded_by_half_the_period() {
        let o = oscillator("ocxo").unwrap();
        let p = 5400.0;
        let short = holdover(&o, 60.0, 10.0, p, 0.0);
        let long = holdover(&o, 10.0 * p, 10.0, p, 0.0);
        let k = o.temp_coeff_per_k * 10.0;
        assert!((short.thermal_s - k * 30.0).abs() < 1e-18);
        assert!((long.thermal_s - k * p / (2.0 * std::f64::consts::PI)).abs() < 1e-18);
    }

    #[test]
    fn every_listed_oscillator_resolves() {
        for n in OSCILLATORS {
            assert!(oscillator(n).is_some(), "{n}");
        }
        assert!(oscillator("hydrogen").is_none());
    }
}
