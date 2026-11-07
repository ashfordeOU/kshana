// SPDX-License-Identifier: AGPL-3.0-only
//! NMEA 2000 from a CAN bus (roadmap L4d): `kshana sensor-live --kind n2k`.
//!
//! Reads SocketCAN `candump -l` lines (`(1700000000.123456) can0 09F80103#1122334455667788`, as
//! `candump -L` and `candump -l` write them on Linux) and turns four single-frame parameter groups
//! into NMEA 0183 sentences, so `kshana receiver-trust live` and the other NMEA readers take them
//! unchanged:
//!
//! * PGN 129025 (position, rapid update) gives an `RMC` sentence, with the latest course and speed;
//! * PGN 129026 (course and speed over ground, rapid update) is held for the next `RMC`;
//! * PGN 127250 (vessel heading) gives `HDT` (true reference) or `HDM` (magnetic);
//! * PGN 126992 (system time) sets the date and time of the next sentences; without it, the
//!   frame's own capture time is used.
//!
//! The field layouts are the publicly documented ones (the open `canboat` PGN descriptions); the
//! NMEA 2000 standard is not reproduced or consulted. A value marked "not available" (all ones) is
//! left empty. Multi-frame (fast-packet) groups are not read. Read only: nothing is sent on the bus.

/// The parameter group number of a 29-bit CAN identifier.
pub fn pgn_of(id: u32) -> u32 {
    let dp = (id >> 24) & 1;
    let pf = (id >> 16) & 0xFF;
    let ps = (id >> 8) & 0xFF;
    (dp << 16) | (pf << 8) | if pf >= 240 { ps } else { 0 }
}

/// One `candump -l` line: capture time (s), CAN identifier and data bytes.
pub fn candump_line(line: &str) -> Option<(f64, u32, Vec<u8>)> {
    let l = line.trim();
    let rest = l.strip_prefix('(')?;
    let (t, rest) = rest.split_once(')')?;
    let t: f64 = t.trim().parse().ok()?;
    let mut f = rest.split_whitespace();
    let _iface = f.next()?;
    let (id, data) = f.next()?.split_once('#')?;
    if id.len() != 8 {
        return None; // an 11-bit frame: not NMEA 2000
    }
    let id = u32::from_str_radix(id, 16).ok()?;
    if data.len() % 2 != 0 || data.len() > 16 {
        return None;
    }
    let bytes = (0..data.len())
        .step_by(2)
        .map(|i| u8::from_str_radix(&data[i..i + 2], 16).ok())
        .collect::<Option<Vec<u8>>>()?;
    Some((t, id, bytes))
}

fn u16_at(b: &[u8], i: usize) -> Option<u16> {
    Some(u16::from_le_bytes([*b.get(i)?, *b.get(i + 1)?]))
}

fn i32_at(b: &[u8], i: usize) -> Option<i32> {
    Some(i32::from_le_bytes([
        *b.get(i)?,
        *b.get(i + 1)?,
        *b.get(i + 2)?,
        *b.get(i + 3)?,
    ]))
}

/// Append the checksum and line end to an NMEA sentence body.
fn sentence(body: &str) -> String {
    format!("${body}*{:02X}\r\n", body.bytes().fold(0u8, |a, b| a ^ b))
}

/// Latitude or longitude as NMEA `ddmm.mmmmmm` / `dddmm.mmmmmm` with its hemisphere.
fn nmea_angle(deg: f64, lat: bool) -> String {
    let (a, h) = match (lat, deg >= 0.0) {
        (true, true) => (deg, 'N'),
        (true, false) => (-deg, 'S'),
        (false, true) => (deg, 'E'),
        (false, false) => (-deg, 'W'),
    };
    let whole = a.trunc();
    let min = (a - whole) * 60.0;
    if lat {
        format!("{:02}{min:09.6},{h}", whole as u32)
    } else {
        format!("{:03}{min:09.6},{h}", whole as u32)
    }
}

/// The NMEA 2000 to NMEA 0183 converter.
#[derive(Default)]
pub struct N2kToNmea {
    /// Unix time from the last system-time group, and the capture time it arrived at.
    system_time: Option<(f64, f64)>,
    cog_deg: Option<f64>,
    sog_kn: Option<f64>,
    /// Frames read, and frames of the four groups whose values did not read.
    pub frames: u64,
    /// Frames of a known group that were too short.
    pub bad: u64,
}

impl N2kToNmea {
    /// Take one `candump -l` line; the NMEA sentences it completes.
    pub fn push(&mut self, line: &str) -> Vec<String> {
        let Some((t_cap, id, d)) = candump_line(line) else {
            return Vec::new();
        };
        self.frames += 1;
        let out = match pgn_of(id) {
            126992 => self.system_time(t_cap, &d),
            129026 => self.cog_sog(&d),
            129025 => self.position(t_cap, &d),
            127250 => self.heading(&d),
            _ => Some(Vec::new()),
        };
        out.unwrap_or_else(|| {
            self.bad += 1;
            Vec::new()
        })
    }

    fn system_time(&mut self, t_cap: f64, d: &[u8]) -> Option<Vec<String>> {
        let days = u16_at(d, 2)?;
        let tenth_ms = u32::from_le_bytes([*d.get(4)?, *d.get(5)?, *d.get(6)?, *d.get(7)?]);
        if days != 0xFFFF && tenth_ms != 0xFFFF_FFFF {
            self.system_time = Some((
                f64::from(days) * 86_400.0 + f64::from(tenth_ms) * 1e-4,
                t_cap,
            ));
        }
        Some(Vec::new())
    }

    fn cog_sog(&mut self, d: &[u8]) -> Option<Vec<String>> {
        let cog = u16_at(d, 2)?;
        let sog = u16_at(d, 4)?;
        self.cog_deg =
            (cog != 0xFFFF).then(|| f64::from(cog) * 1e-4 * 180.0 / std::f64::consts::PI);
        // m/s to knots: 1 kn = 1852/3600 m/s.
        self.sog_kn = (sog != 0xFFFF).then(|| f64::from(sog) * 0.01 * 3600.0 / 1852.0);
        Some(Vec::new())
    }

    /// Unix time of a frame captured at `t_cap`.
    fn time_of(&self, t_cap: f64) -> f64 {
        match self.system_time {
            Some((ts, at)) => ts + (t_cap - at),
            None => t_cap,
        }
    }

    fn position(&mut self, t_cap: f64, d: &[u8]) -> Option<Vec<String>> {
        let lat = i32_at(d, 0)?;
        let lon = i32_at(d, 4)?;
        if lat == 0x7FFF_FFFF || lon == 0x7FFF_FFFF {
            return Some(Vec::new());
        }
        let (lat, lon) = (f64::from(lat) * 1e-7, f64::from(lon) * 1e-7);
        let t = self.time_of(t_cap);
        let ms = (t * 1000.0).round() as i64;
        let (days, rem) = (ms.div_euclid(86_400_000), ms.rem_euclid(86_400_000));
        let (y, m, dd) = civil(days);
        let hms = format!(
            "{:02}{:02}{:02}.{:02}",
            rem / 3_600_000,
            rem / 60_000 % 60,
            rem / 1000 % 60,
            rem % 1000 / 10
        );
        let f1 = |v: Option<f64>| v.map(|x| format!("{x:.1}")).unwrap_or_default();
        Some(vec![sentence(&format!(
            "GPRMC,{hms},A,{},{},{},{},{:02}{:02}{:02},,,A",
            nmea_angle(lat, true),
            nmea_angle(lon, false),
            f1(self.sog_kn),
            f1(self.cog_deg),
            dd,
            m,
            y % 100
        ))])
    }

    fn heading(&mut self, d: &[u8]) -> Option<Vec<String>> {
        let h = u16_at(d, 1)?;
        let reference = d.get(7)? & 0x03;
        if h == 0xFFFF {
            return Some(Vec::new());
        }
        let deg = f64::from(h) * 1e-4 * 180.0 / std::f64::consts::PI;
        Some(vec![match reference {
            0 => sentence(&format!("HEHDT,{deg:.1},T")),
            1 => sentence(&format!("HCHDM,{deg:.1},M")),
            _ => return Some(Vec::new()),
        }])
    }
}

/// Civil date (year, month, day) of a day count from 1970-01-01 (H. Hinnant's algorithm).
fn civil(days: i64) -> (i64, u32, u32) {
    let z = days + 719_468;
    let era = z.div_euclid(146_097);
    let doe = z.rem_euclid(146_097);
    let yoe = (doe - doe / 1460 + doe / 36_524 - doe / 146_096) / 365;
    let doy = doe - (365 * yoe + yoe / 4 - yoe / 100);
    let mp = (5 * doy + 2) / 153;
    let d = (doy - (153 * mp + 2) / 5 + 1) as u32;
    let m = if mp < 10 { mp + 3 } else { mp - 9 } as u32;
    (yoe + era * 400 + i64::from(m <= 2), m, d)
}

/// Convert a whole `candump -l` log (a replay); the same sentences, in the same order, as a live
/// run over the same lines.
pub fn convert(text: &str) -> Vec<String> {
    let mut c = N2kToNmea::default();
    text.lines().flat_map(|l| c.push(l)).collect()
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn identifiers_give_their_groups() {
        // Priority 2, PGN 129025 (0x1F801) from source 3.
        assert_eq!(pgn_of(0x09F8_0103), 129_025);
        // PDU1 (PF < 240): the destination byte is not part of the group.
        assert_eq!(pgn_of(0x18EA_FF00), 59_904);
        assert!(candump_line("(1.5) can0 123#00").is_none());
        let (t, id, d) =
            candump_line("(1700000000.250000) can0 09F80103#0102030405060708").unwrap();
        assert_eq!((t, id, d.len()), (1_700_000_000.25, 0x09F8_0103, 8));
    }

    fn frame(t: f64, id: u32, d: &[u8]) -> String {
        let hex: String = d.iter().map(|b| format!("{b:02X}")).collect();
        format!("({t:.6}) can0 {id:08X}#{hex}")
    }

    #[test]
    fn position_course_heading_and_time_become_nmea() {
        let mut c = N2kToNmea::default();
        // System time: 2026-11-07 (20764 days after 1970-01-01), 12:00:00.
        let mut st = vec![0u8, 0];
        st.extend(20_764u16.to_le_bytes());
        st.extend((12u32 * 3600 * 10_000).to_le_bytes());
        assert!(c.push(&frame(100.0, 0x09F0_1003, &st)).is_empty());
        // COG 90 degrees (1.5708 rad), SOG 5.144 m/s (10 kn).
        let mut cs = vec![0u8, 0];
        cs.extend(15_708u16.to_le_bytes());
        cs.extend(514u16.to_le_bytes());
        cs.extend([0xFF, 0xFF]);
        assert!(c.push(&frame(100.2, 0x09F8_0203, &cs)).is_empty());
        let mut p = Vec::new();
        p.extend(594_375_000i32.to_le_bytes());
        p.extend((-247_536_000i32).to_le_bytes());
        let out = c.push(&frame(100.5, 0x09F8_0103, &p));
        assert_eq!(out.len(), 1);
        assert!(
            out[0].starts_with(
                "$GPRMC,120000.50,A,5926.250000,N,02445.216000,W,10.0,90.0,071126,,,A*"
            ),
            "{}",
            out[0]
        );
        let mut h = vec![0u8];
        h.extend(31_416u16.to_le_bytes()); // pi rad: 180 degrees
        h.extend([0xFF, 0x7F, 0xFF, 0x7F, 0x00]);
        assert!(c.push(&frame(100.6, 0x09F1_1203, &h))[0].starts_with("$HEHDT,180.0,T*"));
        assert_eq!(c.bad, 0);
    }
}
