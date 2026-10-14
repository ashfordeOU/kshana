// SPDX-License-Identifier: AGPL-3.0-only
//! A reader for DSN Orbit Data Files (ODF), format TRK-2-18 (JPL/DSN document 820-13, module
//! TRK-2-18; the revision archived with the MRO radio-science data as
//! `NAV023-ODF-2-18_Rev3.htm`).
//!
//! An ODF is a sequence of 36-byte logical records: nine big-endian 32-bit words. They fall
//! into groups, and each group starts with a header record whose first word is the group's
//! primary key:
//!
//! | Key | Group |
//! |---|---|
//! | 101 | file label |
//! | 107 | identifier |
//! | 109 | orbit data |
//! | 2030 | ramp, one group per station (the station number is the secondary key) |
//! | 2040 | clock offsets |
//! | 105 | data summary |
//! | −1 | end of file |
//!
//! Words 5 and 6 of a header record are zero, and those of a data record are not, which is how
//! the reader tells them apart.
//!
//! An orbit-data record holds:
//!
//! - the time tag: integer seconds, and milliseconds in the first 10 bits of word 2;
//! - the receiving station's downlink delay (22 bits, ns);
//! - the observable: an integer part and a fractional part in units of 1e-9;
//! - a packed word: format, receiving and transmitting station, network, data type, band
//!   identifiers and data validity;
//! - channel, spacecraft and receiver/exciter flag;
//! - the reference frequency, a 46-bit field split 22/24 in mHz;
//! - the compression time (0.01 s);
//! - the transmitting station's uplink delay.
//!
//! A ramp record holds start and end times, the ramp rate and the ramp start frequency. Times
//! are seconds since 1950-01-01T00:00:00 UTC.

/// Seconds since 1950-01-01T00:00:00 UTC.
pub type Seconds1950 = f64;

/// One orbit-data record.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct OdfObservation {
    /// Time tag (s since 1950, UTC).
    pub time_s: Seconds1950,
    /// Primary receiving station downlink delay (ns).
    pub downlink_delay_ns: u32,
    /// The observable in the units of its data type (Hz for Doppler, range units for range).
    pub observable: f64,
    /// Format identifier (2 for this revision).
    pub format_id: u8,
    /// Receiving station.
    pub rx_station: u8,
    /// Transmitting station (0 for one-way data).
    pub tx_station: u8,
    /// Network of the transmitting station.
    pub network_id: u8,
    /// Data type (11, 12, 13 one-, two-, three-way Doppler; 36, 37, 41 range; ...).
    pub data_type: u8,
    /// Downlink band (1 S, 2 X, 3 Ka; 0 Ku or not applicable).
    pub downlink_band: u8,
    /// Uplink band.
    pub uplink_band: u8,
    /// Exciter band.
    pub exciter_band: u8,
    /// True when the record is flagged bad.
    pub invalid: bool,
    /// Channel number (Doppler) or second station or lowest range component.
    pub channel: u8,
    /// Spacecraft identifier.
    pub spacecraft_id: u16,
    /// Receiver/exciter independent flag.
    pub rx_ex_independent: bool,
    /// Reference frequency (Hz).
    pub reference_frequency_hz: f64,
    /// Item 20 (data-type dependent).
    pub item20: i32,
    /// Compression time (s) for Doppler; data-type dependent otherwise.
    pub compression_time_s: f64,
    /// Transmitting station uplink delay (ns) for Doppler or range.
    pub uplink_delay_ns: u32,
}

/// One ramp record.
#[derive(Clone, Copy, Debug, PartialEq)]
pub struct OdfRamp {
    /// Station.
    pub station: u16,
    /// Ramp start time (s since 1950).
    pub start_s: Seconds1950,
    /// Ramp end time (s since 1950).
    pub end_s: Seconds1950,
    /// Ramp rate (Hz/s).
    pub rate_hz_s: f64,
    /// Ramp start frequency (Hz).
    pub start_frequency_hz: f64,
}

/// Where a group's header record sits (1-based record number, as a PDS label counts).
#[derive(Clone, Debug, PartialEq)]
pub struct OdfGroup {
    /// Primary key.
    pub primary_key: i32,
    /// Secondary key (the station for ramp groups).
    pub secondary_key: i32,
    /// 1-based record number of the header.
    pub header_record: usize,
    /// Data records that follow it.
    pub rows: usize,
}

/// A parsed ODF.
#[derive(Clone, Debug, Default)]
pub struct Odf {
    /// Total 36-byte records.
    pub n_records: usize,
    /// The groups in file order.
    pub groups: Vec<OdfGroup>,
    /// Orbit-data records.
    pub observations: Vec<OdfObservation>,
    /// Ramp records of every station.
    pub ramps: Vec<OdfRamp>,
    /// Spacecraft name from the file label group, when present.
    pub spacecraft_name: Option<String>,
}

const HEADER_KEYS: [i32; 7] = [101, 105, 107, 109, 2030, 2040, -1];

fn word(rec: &[u8], i: usize) -> u32 {
    u32::from_be_bytes([rec[4 * i], rec[4 * i + 1], rec[4 * i + 2], rec[4 * i + 3]])
}

fn bits(w: u32, from_msb: u32, len: u32) -> u32 {
    (w >> (32 - from_msb - len)) & ((1u64 << len) - 1) as u32
}

fn is_header(rec: &[u8]) -> bool {
    let key = word(rec, 0) as i32;
    HEADER_KEYS.contains(&key) && word(rec, 4) == 0 && word(rec, 5) == 0
}

fn observation(rec: &[u8]) -> OdfObservation {
    let w = |i| word(rec, i);
    let w4 = w(4);
    // Words 6-7: items 15 (I7), 16 (I10), 17 (I1), 18 (I22, reference frequency high part)
    // and 19 (I24, low part), 64 bits.
    let w67 = ((w(5) as u64) << 32) | w(6) as u64;
    let ref_mhz = ((w67 >> 24) & 0x3F_FFFF) << 24 | (w67 & 0xFF_FFFF);
    // Words 8-9: items 20 (S20), 21 (I22) and 22 (I22), 64 bits.
    let w89 = ((w(7) as u64) << 32) | w(8) as u64;
    let item20 = ((w89 >> 44) & 0xF_FFFF) as i32;
    let item20 = if item20 & (1 << 19) != 0 {
        item20 - (1 << 20)
    } else {
        item20
    };
    OdfObservation {
        time_s: w(0) as f64 + bits(w(1), 0, 10) as f64 * 1e-3,
        downlink_delay_ns: bits(w(1), 10, 22),
        observable: w(2) as i32 as f64 + w(3) as i32 as f64 * 1e-9,
        format_id: bits(w4, 0, 3) as u8,
        rx_station: bits(w4, 3, 7) as u8,
        tx_station: bits(w4, 10, 7) as u8,
        network_id: bits(w4, 17, 2) as u8,
        data_type: bits(w4, 19, 6) as u8,
        downlink_band: bits(w4, 25, 2) as u8,
        uplink_band: bits(w4, 27, 2) as u8,
        exciter_band: bits(w4, 29, 2) as u8,
        invalid: bits(w4, 31, 1) == 1,
        channel: ((w67 >> 57) & 0x7F) as u8,
        spacecraft_id: ((w67 >> 47) & 0x3FF) as u16,
        rx_ex_independent: (w67 >> 46) & 1 == 1,
        reference_frequency_hz: ref_mhz as f64 * 1e-3,
        item20,
        compression_time_s: ((w89 >> 22) & 0x3F_FFFF) as f64 * 0.01,
        uplink_delay_ns: (w89 & 0x3F_FFFF) as u32,
    }
}

fn ramp(rec: &[u8]) -> OdfRamp {
    let w = |i| word(rec, i);
    let w4 = w(4);
    OdfRamp {
        station: bits(w4, 22, 10) as u16,
        start_s: w(0) as f64 + w(1) as f64 * 1e-9,
        rate_hz_s: w(2) as i32 as f64 + w(3) as i32 as f64 * 1e-9,
        start_frequency_hz: bits(w4, 0, 22) as f64 * 1e9 + w(5) as f64 + w(6) as f64 * 1e-9,
        end_s: w(7) as f64 + w(8) as f64 * 1e-9,
    }
}

/// Parse an ODF from its bytes. Errors when the length is not a whole number of 36-byte
/// records or no orbit-data group is found.
pub fn parse_odf(bytes: &[u8]) -> Result<Odf, String> {
    if bytes.is_empty() || bytes.len() % 36 != 0 {
        return Err(format!(
            "{} bytes is not a whole number of 36-byte records",
            bytes.len()
        ));
    }
    let n = bytes.len() / 36;
    let mut out = Odf {
        n_records: n,
        ..Default::default()
    };
    let mut current: Option<i32> = None;
    let mut ramp_station: u16 = 0;
    for i in 0..n {
        let rec = &bytes[36 * i..36 * (i + 1)];
        if current != Some(-1) && is_header(rec) {
            let key = word(rec, 0) as i32;
            out.groups.push(OdfGroup {
                primary_key: key,
                secondary_key: word(rec, 1) as i32,
                header_record: i + 1,
                rows: 0,
            });
            current = Some(key);
            ramp_station = word(rec, 1) as u16;
            continue;
        }
        let Some(g) = out.groups.last_mut() else {
            return Err(format!("record {} precedes any group header", i + 1));
        };
        g.rows += 1;
        match current {
            Some(101) => {
                // Items: system ID (A8), program ID (A8), spacecraft ID, file creation date
                // and time, and so on. The first 8 characters name the system.
                let s: String = rec[..8].iter().map(|&b| b as char).collect();
                out.spacecraft_name.get_or_insert(s.trim().to_string());
            }
            Some(109) => out.observations.push(observation(rec)),
            Some(2030) => {
                let mut r = ramp(rec);
                if r.station == 0 {
                    r.station = ramp_station;
                }
                out.ramps.push(r);
            }
            _ => {}
        }
    }
    if !out.groups.iter().any(|g| g.primary_key == 109) {
        return Err("no orbit data group".into());
    }
    Ok(out)
}

/// Calendar UTC `(year, day_of_year, hour, minute, second)` → seconds since 1950-01-01 UTC,
/// counting no leap seconds (the ODF time scale counts UTC seconds of day; differences across a
/// leap second are off by that second).
pub fn seconds_1950(year: i32, doy: u32, h: u32, m: u32, s: f64) -> f64 {
    let mut days = 0i64;
    for y in 1950..year {
        days += if (y % 4 == 0 && y % 100 != 0) || y % 400 == 0 {
            366
        } else {
            365
        };
    }
    days += doy as i64 - 1;
    days as f64 * 86_400.0 + (h * 3600 + m * 60) as f64 + s
}

#[cfg(test)]
mod tests {
    use super::*;

    fn rec(words: [u32; 9]) -> Vec<u8> {
        words.iter().flat_map(|w| w.to_be_bytes()).collect()
    }

    #[test]
    fn orbit_data_bit_fields_round_trip() {
        // Build one orbit-data record by hand from the TRK-2-18 layout.
        let t = 1_825_000_000u32;
        let w1 = (512u32 << 22) | 1234; // 512 ms, downlink delay 1234 ns
        let w4 = (2u32 << 29)
            | (63 << 22)
            | (14 << 15)
            | (0 << 13)
            | (12 << 7)
            | (2 << 5)
            | (2 << 3)
            | (2 << 1);
        let ref_mhz: u64 = 7_183_000_000_123; // 7.183 GHz + 0.123 Hz in mHz
        let hp = (ref_mhz >> 24) as u32; // 22 bits
        let lp = (ref_mhz & 0xFF_FFFF) as u32;
        let w5 = (5u32 << 25) | (74 << 15) | (1 << 14) | (hp >> 8);
        let w6 = ((hp & 0xFF) << 24) | lp;
        let comp = 1000u64; // 10 s
        let up = 4321u64;
        let both: u64 = ((0x0_0003u64) << 44) | (comp << 22) | up;
        let r = rec([
            t,
            w1,
            (-123_456i32) as u32,
            (789_000_000i32) as u32,
            w4,
            w5,
            w6,
            (both >> 32) as u32,
            both as u32,
        ]);
        let o = observation(&r);
        assert_eq!(o.time_s, t as f64 + 0.512);
        assert_eq!(o.downlink_delay_ns, 1234);
        assert!((o.observable - (-123_456.0 + 0.789)).abs() < 1e-9);
        assert_eq!(
            (o.format_id, o.rx_station, o.tx_station, o.network_id),
            (2, 63, 14, 0)
        );
        assert_eq!(
            (o.data_type, o.downlink_band, o.uplink_band, o.exciter_band),
            (12, 2, 2, 2)
        );
        assert!(!o.invalid);
        assert_eq!(
            (o.channel, o.spacecraft_id, o.rx_ex_independent),
            (5, 74, true)
        );
        assert!((o.reference_frequency_hz - 7_183_000_000.123).abs() < 1e-6);
        assert_eq!(o.item20, 3);
        assert!((o.compression_time_s - 10.0).abs() < 1e-12);
        assert_eq!(o.uplink_delay_ns, 4321);
    }

    #[test]
    fn epoch_1950_counts_days_and_leap_years() {
        assert_eq!(seconds_1950(1950, 1, 0, 0, 0.0), 0.0);
        assert_eq!(seconds_1950(1951, 1, 0, 0, 0.0), 365.0 * 86_400.0);
        // 1952 is a leap year.
        assert_eq!(
            seconds_1950(1953, 1, 0, 0, 0.0),
            (365.0 * 2.0 + 366.0) * 86_400.0
        );
    }

    #[test]
    fn bad_lengths_are_refused() {
        assert!(parse_odf(&[0u8; 35]).is_err());
        assert!(parse_odf(&[]).is_err());
    }
}
