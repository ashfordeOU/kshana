// SPDX-License-Identifier: AGPL-3.0-only
//! Inputs shared by the Galileo I/NAV and F/NAV encoders: the ephemeris and clock, the
//! NeQuick-G ionosphere coefficients, Galileo System Time (GST) and the GST-UTC and GST-GPS
//! conversion parameters, with the mapping from a RINEX (Receiver Independent Exchange
//! Format) Galileo navigation record.

use crate::rinex::RinexEphemeris;

/// Galileo ephemeris, clock, accuracy, group delay and health, SI units (angles in radians).
/// I/NAV and F/NAV broadcast separate clock sets (E1/E5b and E1/E5a); this struct holds one,
/// and the caller passes the one for the message being encoded.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct GalEphemeris {
    /// Satellite identifier SVID (1 to 36 in use; 6 bits).
    pub svid: u32,
    /// Issue of data of the navigation batch `IOD_nav` (10 bits).
    pub iodnav: u32,
    /// Ephemeris reference time of week `t_0e` (s).
    pub toe_s: f64,
    /// Clock reference time of week `t_0c` (s).
    pub toc_s: f64,
    /// Mean anomaly `M_0` (rad).
    pub m0: f64,
    /// Eccentricity.
    pub e: f64,
    /// Square root of the semi-major axis (√m).
    pub sqrt_a: f64,
    /// Longitude of ascending node at the weekly epoch `Omega_0` (rad).
    pub omega0: f64,
    /// Inclination `i_0` (rad).
    pub i0: f64,
    /// Argument of perigee `omega` (rad).
    pub omega: f64,
    /// Rate of inclination `IDOT` (rad/s).
    pub idot: f64,
    /// Rate of right ascension `Omega_dot` (rad/s).
    pub omega_dot: f64,
    /// Mean motion difference `delta_n` (rad/s).
    pub delta_n: f64,
    /// Argument of latitude cosine correction `C_uc` (rad).
    pub cuc: f64,
    /// Argument of latitude sine correction `C_us` (rad).
    pub cus: f64,
    /// Orbit radius cosine correction `C_rc` (m).
    pub crc: f64,
    /// Orbit radius sine correction `C_rs` (m).
    pub crs: f64,
    /// Inclination cosine correction `C_ic` (rad).
    pub cic: f64,
    /// Inclination sine correction `C_is` (rad).
    pub cis: f64,
    /// Clock bias `a_f0` (s).
    pub af0: f64,
    /// Clock drift `a_f1` (s/s).
    pub af1: f64,
    /// Clock drift rate `a_f2` (s/s²).
    pub af2: f64,
    /// Signal-in-space accuracy index for E1/E5b (I/NAV).
    pub sisa_e1e5b: u32,
    /// Signal-in-space accuracy index for E1/E5a (F/NAV).
    pub sisa_e1e5a: u32,
    /// Broadcast group delay `BGD(E1,E5a)` (s).
    pub bgd_e1e5a: f64,
    /// Broadcast group delay `BGD(E1,E5b)` (s).
    pub bgd_e1e5b: f64,
    /// Two-bit signal health status of E1-B, E5b and E5a.
    pub hs_e1b_e5b_e5a: [u32; 3],
    /// Data validity status of E1-B, E5b and E5a (true = working without guarantee).
    pub dvs_e1b_e5b_e5a: [bool; 3],
}

/// NeQuick-G effective-ionisation-level coefficients and the five region flags.
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct GalIono {
    /// `a_i0` (sfu, solar flux units).
    pub ai0: f64,
    /// `a_i1` (sfu/degree).
    pub ai1: f64,
    /// `a_i2` (sfu/degree²).
    pub ai2: f64,
    /// Ionospheric disturbance flags for regions 1 to 5.
    pub region: [bool; 5],
}

/// Galileo System Time: week number (12 bits) and time of week (s, 20 bits).
#[derive(Clone, Copy, Debug, Default, PartialEq, Eq)]
pub struct Gst {
    /// Week number since the GST epoch, modulo 4096.
    pub wn: u32,
    /// Time of week (s).
    pub tow: u32,
}

/// GST-UTC and GST-GPS conversion parameters (F/NAV page type 4, I/NAV word types 6 and 10).
#[derive(Clone, Copy, Debug, Default, PartialEq)]
pub struct GalTimeConversion {
    /// `A_0` (s).
    pub a0: f64,
    /// `A_1` (s/s).
    pub a1: f64,
    /// Leap-second count before the leap second `delta_t_LS` (s).
    pub dt_ls: i32,
    /// UTC reference time of week `t_0t` (s).
    pub t0t: f64,
    /// UTC reference week `WN_0t` (8 bits).
    pub wn0t: u32,
    /// Week of the leap second `WN_LSF` (8 bits).
    pub wn_lsf: u32,
    /// Day of the leap second `DN` (1 to 7).
    pub dn: u32,
    /// Leap-second count after the leap second `delta_t_LSF` (s).
    pub dt_lsf: i32,
    /// GGTO reference time of week `t_0G` (s).
    pub t0g: f64,
    /// GST-GPS offset `A_0G` (s).
    pub a0g: f64,
    /// GST-GPS drift `A_1G` (s/s).
    pub a1g: f64,
    /// GGTO reference week `WN_0G` (6 bits).
    pub wn0g: u32,
}

/// The signal-in-space accuracy index for an accuracy of `m` metres (Galileo OS SIS ICD
/// SISA table: 1 cm steps below 0.5 m, 2 cm to 1 m, 4 cm to 2 m, 16 cm to 6 m; 255, "no
/// accuracy prediction available", for a negative or larger value).
pub fn sisa_index(m: f64) -> u32 {
    let idx = if !(m >= 0.0) || m > 6.0 + 1e-9 {
        255.0
    } else if m < 0.495 {
        (m / 0.01).round()
    } else if m < 0.99 {
        50.0 + ((m - 0.5) / 0.02).round()
    } else if m < 1.98 {
        75.0 + ((m - 1.0) / 0.04).round()
    } else {
        100.0 + ((m - 2.0) / 0.16).round()
    };
    idx as u32
}

/// The Galileo inputs of a RINEX Galileo record: IODnav from the IODE slot, `BGD(E1,E5a)`
/// from `TGD`, `BGD(E1,E5b)` from the second slot of `BROADCAST ORBIT - 6`, health and data
/// validity bits from the RINEX SV health field (bit 0 E1-B DVS, bits 1-2 E1-B HS, bit 3
/// E5a DVS, bits 4-5 E5a HS, bit 6 E5b DVS, bits 7-8 E5b HS), and the SISA index from the
/// accuracy in metres for both signal pairs.
pub fn ephemeris_from_rinex(r: &RinexEphemeris) -> Result<GalEphemeris, String> {
    if r.system != 'E' {
        return Err(format!("record is system {}, not Galileo", r.system));
    }
    let h = r.sv_health.max(0.0) as u32;
    let sisa = sisa_index(r.sv_accuracy);
    Ok(GalEphemeris {
        svid: u32::from(r.prn),
        iodnav: r.iode.max(0.0) as u32,
        toe_s: r.toe,
        toc_s: r.toc.gps_time_of_week(),
        m0: r.m0,
        e: r.e,
        sqrt_a: r.sqrt_a,
        omega0: r.omega0,
        i0: r.i0,
        omega: r.omega,
        idot: r.idot,
        omega_dot: r.omega_dot,
        delta_n: r.delta_n,
        cuc: r.cuc,
        cus: r.cus,
        crc: r.crc,
        crs: r.crs,
        cic: r.cic,
        cis: r.cis,
        af0: r.af0,
        af1: r.af1,
        af2: r.af2,
        sisa_e1e5b: sisa,
        sisa_e1e5a: sisa,
        bgd_e1e5a: r.tgd,
        bgd_e1e5b: r.iodc,
        hs_e1b_e5b_e5a: [(h >> 1) & 3, (h >> 7) & 3, (h >> 4) & 3],
        dvs_e1b_e5b_e5a: [h & 1 == 1, (h >> 6) & 1 == 1, (h >> 3) & 1 == 1],
    })
}

/// GST of a GPS week and time of week: Galileo week 0 began at GPS week 1024.
pub fn gst_from_gps(gps_week: u32, tow_s: u32) -> Gst {
    Gst {
        wn: gps_week.saturating_sub(1024) % 4096,
        tow: tow_s % 604_800,
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn sisa_index_follows_the_table() {
        assert_eq!(sisa_index(0.0), 0);
        assert_eq!(sisa_index(0.49), 49);
        assert_eq!(sisa_index(0.5), 50);
        assert_eq!(sisa_index(0.98), 74);
        assert_eq!(sisa_index(1.0), 75);
        assert_eq!(sisa_index(1.96), 99);
        assert_eq!(sisa_index(2.0), 100);
        assert_eq!(sisa_index(3.12), 107);
        assert_eq!(sisa_index(6.0), 125);
        assert_eq!(sisa_index(-1.0), 255);
        assert_eq!(sisa_index(100.0), 255);
    }

    #[test]
    fn gst_week_offset() {
        assert_eq!(gst_from_gps(2350, 7), Gst { wn: 1326, tow: 7 });
    }
}
