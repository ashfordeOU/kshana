// SPDX-License-Identifier: AGPL-3.0-only
//! NMEA 0183 sentence formatting: framing, checksum and the field encoders.
//!
//! Sentences are held without the line ending (`$...*hh`); the writer adds CRLF.

use super::clock::Utc;

/// XOR of every byte of the sentence body (between `$` and `*`).
pub fn checksum(body: &str) -> u8 {
    body.bytes().fold(0u8, |a, b| a ^ b)
}

/// Frame a body as `$body*hh`.
pub fn frame(body: &str) -> String {
    format!("${body}*{:02X}", checksum(body))
}

/// `hhmmss.ss`.
pub fn time_field(u: &Utc) -> String {
    format!("{:02}{:02}{:02}.{:02}", u.hour, u.min, u.sec, u.ms / 10)
}

/// `ddmmyy`.
pub fn date_field(u: &Utc) -> String {
    format!("{:02}{:02}{:02}", u.day, u.month, u.year % 100)
}

/// Degrees and minutes of `deg`, rounded to four decimals of a minute, and whether the
/// rounded value is zero (so a hemisphere is never given to nothing).
fn dm(deg: f64, width: usize) -> (String, bool) {
    let a = deg.abs();
    let mut d = a.trunc();
    let mut m = ((a - d) * 60.0 * 1e4).round() / 1e4;
    if m >= 60.0 {
        m -= 60.0;
        d += 1.0;
    }
    (
        format!("{:0w$}{:07.4}", d as u32, m, w = width),
        d == 0.0 && m == 0.0,
    )
}

/// `(ddmm.mmmm, N|S)`; the hemisphere is chosen after rounding.
pub fn lat_field(deg: f64) -> (String, char) {
    let (s, zero) = dm(deg, 2);
    (s, if deg < 0.0 && !zero { 'S' } else { 'N' })
}

/// `(dddmm.mmmm, E|W)`; the hemisphere is chosen after rounding, and 180 degrees is
/// written as east.
pub fn lon_field(deg: f64) -> (String, char) {
    let (s, zero) = dm(deg, 3);
    let half_turn = s == "18000.0000";
    (
        s,
        if deg < 0.0 && !zero && !half_turn {
            'W'
        } else {
            'E'
        },
    )
}

/// A fixed-point number that never prints as negative zero.
pub fn num(x: f64, decimals: usize) -> String {
    let s = format!("{x:.decimals$}");
    if s.starts_with('-') && s[1..].bytes().all(|b| b == b'0' || b == b'.') {
        s[1..].to_string()
    } else {
        s
    }
}

/// The constellation of one fix attempt, as the position sentences need it.
#[derive(Clone, Debug)]
pub struct FixView {
    /// Reported latitude, degrees.
    pub lat_deg: f64,
    /// Reported longitude, degrees.
    pub lon_deg: f64,
    /// Reported height above mean sea level, m.
    pub alt_msl_m: f64,
    /// Reported speed over ground, knots.
    pub sog_kn: f64,
    /// Reported course over ground, degrees true.
    pub cog_deg: f64,
    /// Satellites used.
    pub n_used: usize,
    /// HDOP.
    pub hdop: f64,
}

/// GGA.
pub fn gga(talker: &str, t: &Utc, fix: Option<&FixView>, sep_m: f64) -> String {
    match fix {
        Some(f) => {
            let (la, ns) = lat_field(f.lat_deg);
            let (lo, ew) = lon_field(f.lon_deg);
            frame(&format!(
                "{talker}GGA,{},{la},{ns},{lo},{ew},1,{:02},{:.1},{},M,{},M,,",
                time_field(t),
                f.n_used,
                f.hdop,
                num(f.alt_msl_m, 1),
                num(sep_m, 1)
            ))
        }
        None => frame(&format!(
            "{talker}GGA,{},,,,,0,00,99.99,,M,,M,,",
            time_field(t)
        )),
    }
}

/// RMC (NMEA 4.1 form with the navigational-status field).
pub fn rmc(talker: &str, t: &Utc, fix: Option<&FixView>, mag_var: Option<f64>) -> String {
    let date = date_field(t);
    match fix {
        Some(f) => {
            let (la, ns) = lat_field(f.lat_deg);
            let (lo, ew) = lon_field(f.lon_deg);
            let mv = match mag_var {
                Some(v) => format!("{:.1},{}", v.abs(), if v < 0.0 { 'W' } else { 'E' }),
                None => ",".to_string(),
            };
            frame(&format!(
                "{talker}RMC,{},A,{la},{ns},{lo},{ew},{:.1},{:.1},{date},{mv},A,V",
                time_field(t),
                f.sog_kn,
                f.cog_deg
            ))
        }
        None => frame(&format!(
            "{talker}RMC,{},V,,,,,,,{date},,,N,V",
            time_field(t)
        )),
    }
}

/// VTG.
pub fn vtg(talker: &str, fix: Option<&FixView>, mag_var: Option<f64>) -> String {
    match fix {
        Some(f) => {
            let mag = match mag_var {
                Some(v) => format!("{:.1}", (f.cog_deg - v).rem_euclid(360.0)),
                None => String::new(),
            };
            frame(&format!(
                "{talker}VTG,{:.1},T,{mag},M,{:.1},N,{:.1},K,A",
                f.cog_deg,
                f.sog_kn,
                f.sog_kn * 1.852
            ))
        }
        None => frame(&format!("{talker}VTG,,T,,M,,N,,K,N")),
    }
}

/// GNS; `modes` holds one character per system in GPS, GLONASS, Galileo, BeiDou order.
pub fn gns(talker: &str, t: &Utc, fix: Option<&FixView>, modes: &str, sep_m: f64) -> String {
    match fix {
        Some(f) => {
            let (la, ns) = lat_field(f.lat_deg);
            let (lo, ew) = lon_field(f.lon_deg);
            frame(&format!(
                "{talker}GNS,{},{la},{ns},{lo},{ew},{modes},{:02},{:.1},{},{},,,V",
                time_field(t),
                f.n_used,
                f.hdop,
                num(f.alt_msl_m, 1),
                num(sep_m, 1)
            ))
        }
        None => frame(&format!(
            "{talker}GNS,{},,,,,{modes},00,99.99,,,,,V",
            time_field(t)
        )),
    }
}

/// ZDA.
pub fn zda(talker: &str, t: &Utc) -> String {
    frame(&format!(
        "{talker}ZDA,{},{:02},{:02},{:04},00,00",
        time_field(t),
        t.day,
        t.month,
        t.year
    ))
}

/// HDT.
pub fn hdt(heading_deg: f64) -> String {
    frame(&format!("HEHDT,{heading_deg:.1},T"))
}

/// VBW: water speeds from the log, ground speeds from the Doppler log, knots.
pub fn vbw(water_long: f64, water_trans: f64, ground_long: f64, ground_trans: f64) -> String {
    frame(&format!(
        "VDVBW,{},{},A,{},{},A,,,,",
        num(water_long, 2),
        num(water_trans, 2),
        num(ground_long, 2),
        num(ground_trans, 2)
    ))
}

/// One satellite entry of a GSV sentence.
#[derive(Clone, Copy, Debug)]
pub struct GsvSat {
    /// Number NMEA carries.
    pub num: u32,
    /// Elevation, whole degrees.
    pub el_deg: u32,
    /// Azimuth, whole degrees.
    pub az_deg: u32,
    /// SNR in dB-Hz; `None` is not tracked.
    pub snr: Option<u32>,
}

/// GSV sentences for one system, four satellites to a sentence.
pub fn gsv(talker: &str, signal_id: u8, sats: &[GsvSat]) -> Vec<String> {
    let total = sats.len().div_ceil(4).max(1);
    (0..total)
        .map(|i| {
            let mut body = format!("{talker}GSV,{total},{},{:02}", i + 1, sats.len());
            for s in sats.iter().skip(i * 4).take(4) {
                body.push_str(&format!(",{:02},{:02},{:03},", s.num, s.el_deg, s.az_deg));
                if let Some(snr) = s.snr {
                    body.push_str(&format!("{snr:02}"));
                }
            }
            body.push_str(&format!(",{signal_id}"));
            frame(&body)
        })
        .collect()
}

/// GSA for one system. `used` holds at most twelve numbers.
pub fn gsa(
    talker: &str,
    mode_3d: Option<bool>,
    used: &[u32],
    dop: (f64, f64, f64),
    system_id: u8,
) -> String {
    let fix_type = match mode_3d {
        Some(true) => 3,
        Some(false) => 2,
        None => 1,
    };
    let mut body = format!("{talker}GSA,A,{fix_type}");
    for i in 0..12 {
        match used.get(i) {
            Some(n) => body.push_str(&format!(",{n:02}")),
            None => body.push(','),
        }
    }
    if mode_3d.is_some() {
        body.push_str(&format!(",{:.1},{:.1},{:.1}", dop.0, dop.1, dop.2));
    } else {
        body.push_str(",,,");
    }
    body.push_str(&format!(",{system_id}"));
    frame(&body)
}

/// The synthetic-data marker (proprietary sentence; receivers ignore it).
pub fn marker() -> String {
    frame("PKSHT,TRAINING,SYNTHETIC,NOT-FOR-NAVIGATION")
}

#[cfg(test)]
mod tests {
    use super::*;
    use crate::nmea_synth::clock::split;

    #[test]
    fn checksum_of_a_known_sentence() {
        // The canonical GGA example from the NMEA 0183 literature.
        let body = "GPGGA,123519,4807.038,N,01131.000,E,1,08,0.9,545.4,M,46.9,M,,";
        assert_eq!(
            frame(body),
            "$GPGGA,123519,4807.038,N,01131.000,E,1,08,0.9,545.4,M,46.9,M,,*47"
        );
    }

    #[test]
    fn angles_carry_over_at_sixty_minutes() {
        assert_eq!(lat_field(55.999_999_99).0, "5600.0000");
        assert_eq!(lon_field(-3.5), ("00330.0000".to_string(), 'W'));
        assert_eq!(lat_field(-0.25), ("0015.0000".to_string(), 'S'));
        // The hemisphere follows the rounded value: nothing rounds to "0 degrees south".
        assert_eq!(lat_field(-1e-7), ("0000.0000".to_string(), 'N'));
        assert_eq!(lon_field(-1e-8), ("00000.0000".to_string(), 'E'));
        assert_eq!(lon_field(179.999_999_9), ("18000.0000".to_string(), 'E'));
        assert_eq!(lon_field(-179.999_999_9), ("18000.0000".to_string(), 'E'));
    }

    #[test]
    fn numbers_never_print_negative_zero() {
        assert_eq!(num(-0.001, 2), "0.00");
        assert_eq!(num(-0.0, 1), "0.0");
        assert_eq!(num(-0.5, 1), "-0.5");
        assert_eq!(num(12.345, 2), "12.35");
    }

    #[test]
    fn gsv_splits_into_fours_and_leaves_untracked_snr_empty() {
        let sats: Vec<GsvSat> = (1..=6)
            .map(|n| GsvSat {
                num: n,
                el_deg: 40,
                az_deg: 100 + n,
                snr: (n != 5).then_some(40),
            })
            .collect();
        let s = gsv("GP", 1, &sats);
        assert_eq!(s.len(), 2);
        assert!(s[0].starts_with("$GPGSV,2,1,06,01,40,101,40,"));
        assert!(s[1].contains(",05,40,105,,06,40,106,40,1*"), "{}", s[1]);
    }

    #[test]
    fn lost_fix_sentences_keep_the_time() {
        let t = split(1_780_000_000_000);
        let g = gga("GN", &t, None, 0.0);
        assert!(g.starts_with("$GNGGA,"), "{g}");
        assert!(g.contains(",,,,,0,00,99.99,,M,,M,,"), "{g}");
        assert!(rmc("GN", &t, None, None).contains(",V,,,,,,,"));
    }
}
