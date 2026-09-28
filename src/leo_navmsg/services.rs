// SPDX-License-Identifier: AGPL-3.0-only
//! The "other services" a LEO navigation message carries: ionospheric corrections for
//! single-frequency users and the system-time-to-UTC offset.
//!
//! * **Klobuchar-style broadcast set** (IS-GPS-200 §20.3.3.5.2.5): the delay is the
//!   engine's existing L1 model ([`crate::gnss_sim::klobuchar_delay_m`], checked against
//!   RTKLIB), scaled to the signal's carrier by the first-order `(f_L1 / f)²` law.
//! * **NeQuick-G coefficients** (Galileo OS SIS ICD §5.1.6; European Commission, "Ionospheric
//!   Correction Algorithm for Galileo Single Frequency Users", issue 1.2, 2016): the
//!   message carries `ai0, ai1, ai2` and the five storm flags, and
//!   [`effective_ionisation_level`] returns `Az = ai0 + ai1·μ + ai2·μ²` for a modified dip
//!   latitude `μ`, with the algorithm's rules (all-zero coefficients give 63.7 sfu, the
//!   result is clamped to [0, 400] sfu). The NeQuick electron-density model and its slant
//!   integration, which turn `Az` into a delay, are **not** implemented here; the message
//!   transports the set faithfully and the delay path is left to a full NeQuick-G
//!   implementation.
//! * **UTC offset** (Galileo OS SIS ICD §5.1.7, the same structure as IS-GPS-200
//!   §20.3.3.5.2.4): [`system_to_utc`] applies the three cases of the ICD, before, during
//!   and after a leap-second event.
//!
//! A LEO satellite at a few hundred kilometres flies inside the ionosphere, so a
//! single-layer broadcast model built for medium Earth orbit over-corrects the part of the
//! electron content above the satellite. The scaling that corrects for it is not part of
//! either broadcast algorithm and is not applied here.

use super::elements::{KlobucharSet, NequickSet, UtcOffset, WEEK_S};

/// GPS L1 carrier (Hz), the frequency the Klobuchar delay is defined at.
pub const L1_HZ: f64 = 1_575_420_000.0;

/// Klobuchar slant ionospheric group delay (m) at carrier `f_hz` for a user at geodetic
/// latitude/longitude (rad) seeing the satellite at elevation/azimuth (rad), at system
/// seconds of day `sod`.
pub fn klobuchar_delay_m(
    set: &KlobucharSet,
    f_hz: f64,
    lat: f64,
    lon: f64,
    el: f64,
    az: f64,
    sod: f64,
) -> f64 {
    let c = crate::gnss_sim::KlobucharCoeffs {
        alpha: set.alpha,
        beta: set.beta,
    };
    let d_l1 = crate::gnss_sim::klobuchar_delay_m(&c, lat, lon, el, az, sod);
    d_l1 * (L1_HZ / f_hz).powi(2)
}

/// NeQuick-G effective ionisation level `Az` (sfu) at modified dip latitude `modip_deg`.
pub fn effective_ionisation_level(set: &NequickSet, modip_deg: f64) -> f64 {
    if set.ai0 == 0.0 && set.ai1 == 0.0 && set.ai2 == 0.0 {
        return 63.7;
    }
    (set.ai0 + set.ai1 * modip_deg + set.ai2 * modip_deg * modip_deg).clamp(0.0, 400.0)
}

/// UTC from system time, Galileo OS SIS ICD §5.1.7. `week` is the full week number and
/// `tow` the system time of week (s). Returns `(utc_seconds_of_day, delta_t_utc_s)`. During
/// the leap-second window the day length is `86400 + ΔtLSF − ΔtLS`, so an inserted second
/// reads 86400.
pub fn system_to_utc(p: &UtcOffset, week: u32, tow: f64) -> (f64, f64) {
    let dt_wn = week as f64 - p.wn_ot as f64;
    let drift = p.a0 + p.a1 * (tow - p.t_ot + WEEK_S * dt_wn);
    let dt_ls = p.dt_ls as f64;
    let dt_lsf = p.dt_lsf as f64;
    // Instant of the event: end of day DN of week WNLSF.
    let event = (p.wn_lsf as f64) * WEEK_S + (p.dn as f64) * 86_400.0;
    let now = week as f64 * WEEK_S + tow;
    let dt_utc_before = dt_ls + drift;
    if now < event - 6.0 * 3600.0 || p.dt_lsf == p.dt_ls {
        // Case (a), and every instant when no event is scheduled.
        let utc = (tow - dt_utc_before).rem_euclid(86_400.0);
        (utc, dt_utc_before)
    } else if now <= event + 6.0 * 3600.0 {
        // Case (b): the six hours either side of the event.
        let w = (tow - dt_utc_before - 43_200.0).rem_euclid(86_400.0) + 43_200.0;
        let utc = w.rem_euclid(86_400.0 + dt_lsf - dt_ls);
        (utc, dt_utc_before)
    } else {
        // Case (c): after the event.
        let dt_utc = dt_lsf + drift;
        ((tow - dt_utc).rem_euclid(86_400.0), dt_utc)
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    fn utc(dt_ls: i32, dt_lsf: i32, wn_lsf: u32, dn: u8) -> UtcOffset {
        UtcOffset {
            a0: 0.0,
            a1: 0.0,
            dt_ls,
            t_ot: 0.0,
            wn_ot: 2400,
            wn_lsf,
            dn,
            dt_lsf,
        }
    }

    #[test]
    fn utc_without_an_event_is_tow_minus_leap_seconds_folded_to_a_day() {
        let p = utc(18, 18, 2400, 7);
        let (u, d) = system_to_utc(&p, 2400, 86_400.0 * 2.0 + 3600.0 + 30.0);
        assert_eq!(d, 18.0);
        assert!((u - (3600.0 + 12.0)).abs() < 1e-9, "{u}");
    }

    #[test]
    fn utc_drift_terms_follow_the_icd_formula() {
        let mut p = utc(18, 18, 2400, 7);
        p.a0 = 2e-9;
        p.a1 = 1e-14;
        p.t_ot = 3600.0;
        let tow = 7200.0;
        let (_, d) = system_to_utc(&p, 2401, tow);
        let want = 18.0 + 2e-9 + 1e-14 * (tow - 3600.0 + WEEK_S);
        assert!((d - want).abs() < 1e-15);
    }

    #[test]
    fn an_inserted_leap_second_reads_86400_at_the_end_of_the_day() {
        // Event at the end of day 3 (Tuesday) of week 2400: ΔtLS 18 -> 19.
        let p = utc(18, 19, 2400, 3);
        let end_of_day = 3.0 * 86_400.0; // system time of week at 00:00 of day 4
                                         // One system second before UTC midnight + leap: tow = end + 18 - 1 reads 86399.
        let (u1, _) = system_to_utc(&p, 2400, end_of_day + 18.0 - 1.0);
        assert!((u1 - 86_399.0).abs() < 1e-9, "{u1}");
        let (u2, _) = system_to_utc(&p, 2400, end_of_day + 18.0);
        assert!((u2 - 86_400.0).abs() < 1e-9, "leap second {u2}");
        let (u3, _) = system_to_utc(&p, 2400, end_of_day + 19.0);
        assert!(u3.abs() < 1e-9, "after the leap {u3}");
        // Seven hours later the new count applies.
        let (u4, d4) = system_to_utc(&p, 2400, end_of_day + 7.0 * 3600.0);
        assert_eq!(d4, 19.0);
        assert!((u4 - (7.0 * 3600.0 - 19.0)).abs() < 1e-9);
    }

    #[test]
    fn nequick_az_rules() {
        let zero = NequickSet {
            ai0: 0.0,
            ai1: 0.0,
            ai2: 0.0,
            storm_flags: [false; 5],
        };
        assert_eq!(effective_ionisation_level(&zero, 30.0), 63.7);
        // The high-solar-activity coefficient set used in the Galileo single-frequency
        // algorithm's test cases.
        let high = NequickSet {
            ai0: 236.831641,
            ai1: -0.39362878,
            ai2: 0.00402826613,
            storm_flags: [false; 5],
        };
        let az = effective_ionisation_level(&high, 20.0);
        let want = 236.831641 - 0.39362878 * 20.0 + 0.00402826613 * 400.0;
        assert!((az - want).abs() < 1e-9);
        let big = NequickSet { ai0: 500.0, ..high };
        assert_eq!(effective_ionisation_level(&big, 0.0), 400.0);
    }

    #[test]
    fn klobuchar_scales_with_inverse_frequency_squared() {
        let set = KlobucharSet {
            alpha: [0.1118e-7, -0.7451e-8, -0.5961e-7, 0.1192e-6],
            beta: [0.1167e6, -0.2294e6, -0.1311e6, 0.1049e7],
        };
        let args = (
            40f64.to_radians(),
            260f64.to_radians(),
            20f64.to_radians(),
            210f64.to_radians(),
            518_400.0 % 86_400.0,
        );
        let l1 = klobuchar_delay_m(&set, L1_HZ, args.0, args.1, args.2, args.3, args.4);
        // RTKLIB ionmodel() gives 6.1278 m for this case (see gnss_sim).
        assert!((l1 - 6.1278).abs() < 1e-3, "{l1}");
        let c = klobuchar_delay_m(&set, 5_020e6, args.0, args.1, args.2, args.3, args.4);
        assert!((c / l1 - (L1_HZ / 5_020e6).powi(2)).abs() < 1e-12);
    }
}
