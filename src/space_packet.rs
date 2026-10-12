// SPDX-License-Identifier: AGPL-3.0-only
//! CCSDS Space Packet Protocol (CCSDS 133.0-B) primary-header framing: the
//! standards-compliant TM/TC packet structure ground systems and on-board
//! software exchange. This is the simulation/test-level bridge that lets any
//! Kshana scenario output be wrapped as a conformant packet stream (or a captured
//! stream be parsed back), the "speak the agency packet format" interop layer.
//!
//! The 6-octet primary header (big-endian) is, bit-for-bit:
//!   * packet **version number** (3 bits, `000` for version 1)
//!   * packet **type** (1 bit: 0 = TM/telemetry, 1 = TC/telecommand)
//!   * **secondary-header flag** (1 bit)
//!   * **APID** (11 bits) — together the first 16-bit "packet identification" word
//!   * **sequence flags** (2 bits: 0=continuation, 1=first, 2=last, 3=unsegmented)
//!   * **packet sequence count** (14 bits) — the 16-bit "sequence control" word
//!   * **packet data length** (16 bits) = (octets in the data field) − 1
//!
//! …followed by a data field of 1..=65536 octets.
//!
//! HONEST SCOPE: exact, deterministic CCSDS-133.0 *framing* — the primary-header
//! bit layout and a round-trippable encode/decode. It is not a CCSDS conformance
//! certification, and carries no secondary-header / CRC / segmentation logic beyond
//! the flags (those are out-of-scope follow-ons).

use serde::Deserialize;

/// CCSDS Space Packet sequence flags (2 bits) for the position of a packet within
/// a sequence of user-data segments.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum SequenceFlags {
    Continuation = 0,
    First = 1,
    Last = 2,
    Unsegmented = 3,
}

impl SequenceFlags {
    fn from_bits(b: u8) -> SequenceFlags {
        match b & 0b11 {
            0 => SequenceFlags::Continuation,
            1 => SequenceFlags::First,
            2 => SequenceFlags::Last,
            _ => SequenceFlags::Unsegmented,
        }
    }
}

/// A parsed CCSDS Space Packet primary header.
#[derive(Clone, Debug, PartialEq)]
pub struct PrimaryHeader {
    /// Packet version number (3 bits; 0 for version 1).
    pub version: u8,
    /// Packet type: `false` = TM (telemetry), `true` = TC (telecommand).
    pub is_telecommand: bool,
    /// Secondary-header presence flag.
    pub secondary_header: bool,
    /// Application Process Identifier (11 bits, 0..=2047).
    pub apid: u16,
    /// Sequence flags (2 bits).
    pub sequence_flags: SequenceFlags,
    /// Packet sequence count (14 bits, 0..=16383).
    pub sequence_count: u16,
    /// Packet data length field (16 bits) = data-field octets − 1.
    pub data_length_field: u16,
}

/// Encode a CCSDS Space Packet (6-octet primary header + `data`) into bytes.
/// Errors when a field exceeds its bit width or the data field is empty (the
/// length field cannot encode a zero-octet data field).
pub fn encode_packet(
    version: u8,
    is_telecommand: bool,
    secondary_header: bool,
    apid: u16,
    sequence_flags: SequenceFlags,
    sequence_count: u16,
    data: &[u8],
) -> Result<Vec<u8>, String> {
    if version > 0b111 {
        return Err("version exceeds 3 bits".to_string());
    }
    if apid > 0x07FF {
        return Err("APID exceeds 11 bits (0..=2047)".to_string());
    }
    if sequence_count > 0x3FFF {
        return Err("sequence_count exceeds 14 bits (0..=16383)".to_string());
    }
    if data.is_empty() {
        return Err("data field must be at least one octet".to_string());
    }
    if data.len() > 65536 {
        return Err("data field exceeds 65536 octets".to_string());
    }
    let word1: u16 = ((version as u16) << 13)
        | ((is_telecommand as u16) << 12)
        | ((secondary_header as u16) << 11)
        | apid;
    let word2: u16 = ((sequence_flags as u16) << 14) | sequence_count;
    let data_length_field: u16 = (data.len() - 1) as u16;
    let mut out = Vec::with_capacity(6 + data.len());
    out.extend_from_slice(&word1.to_be_bytes());
    out.extend_from_slice(&word2.to_be_bytes());
    out.extend_from_slice(&data_length_field.to_be_bytes());
    out.extend_from_slice(data);
    Ok(out)
}

/// Parse a CCSDS Space Packet's primary header and return it with the data field.
/// Errors when the buffer is shorter than the 6-octet header or the declared data
/// length does not match the bytes present.
pub fn decode_packet(bytes: &[u8]) -> Result<(PrimaryHeader, Vec<u8>), String> {
    if bytes.len() < 6 {
        return Err(format!(
            "packet shorter than the 6-octet header: {} bytes",
            bytes.len()
        ));
    }
    let word1 = u16::from_be_bytes([bytes[0], bytes[1]]);
    let word2 = u16::from_be_bytes([bytes[2], bytes[3]]);
    let data_length_field = u16::from_be_bytes([bytes[4], bytes[5]]);
    let header = PrimaryHeader {
        version: (word1 >> 13) as u8 & 0b111,
        is_telecommand: (word1 >> 12) & 0b1 == 1,
        secondary_header: (word1 >> 11) & 0b1 == 1,
        apid: word1 & 0x07FF,
        sequence_flags: SequenceFlags::from_bits((word2 >> 14) as u8),
        sequence_count: word2 & 0x3FFF,
        data_length_field,
    };
    let data_len = data_length_field as usize + 1;
    let total = 6 + data_len;
    if bytes.len() != total {
        return Err(format!(
            "declared data length {data_len} (+6 header) = {total} octets, but buffer is {}",
            bytes.len()
        ));
    }
    Ok((header, bytes[6..].to_vec()))
}

// ---------------------------------------------------------------------------
// Secondary header (CCSDS 133.0-B-2 §4.1.4.2) with a CCSDS 301.0-B-4 time code,
// packet error control (CRC-16/IBM-3740) and segmentation. Additive: nothing
// above this line changes behaviour, and the `space-packet` scenario does not
// call any of it.
// ---------------------------------------------------------------------------

/// Epoch of a CCSDS unsegmented time code (CUC), the P-field time code identification.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum CucEpoch {
    /// Identification `001`: 1958 January 1 epoch (level 1, TAI).
    Ccsds1958,
    /// Identification `010`: an agency-defined epoch (level 2).
    Agency,
}

/// The format of a CUC time code (CCSDS 301.0-B-4 §3.2): its epoch and the octet counts of
/// its coarse (basic time unit, seconds) and fine (binary fraction of a second) parts. Only
/// the one-octet P-field is supported: 1 to 4 coarse octets and 0 to 3 fine octets.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct CucFormat {
    /// The epoch the coarse time counts from.
    pub epoch: CucEpoch,
    /// Coarse-time octets, 1..=4.
    pub coarse_octets: u8,
    /// Fine-time octets, 0..=3.
    pub fine_octets: u8,
}

impl CucFormat {
    /// A CUC format; errors outside the one-octet P-field's 1..=4 coarse and 0..=3 fine octets.
    pub fn new(epoch: CucEpoch, coarse_octets: u8, fine_octets: u8) -> Result<Self, String> {
        if !(1..=4).contains(&coarse_octets) {
            return Err(format!("CUC coarse octets {coarse_octets} outside 1..=4"));
        }
        if fine_octets > 3 {
            return Err(format!(
                "CUC fine octets {fine_octets} outside 0..=3 (the extended P-field is not supported)"
            ));
        }
        Ok(CucFormat {
            epoch,
            coarse_octets,
            fine_octets,
        })
    }

    /// The one-octet P-field: `0 | id(3) | coarse octets - 1 (2) | fine octets (2)`.
    pub fn p_field(&self) -> u8 {
        let id: u8 = match self.epoch {
            CucEpoch::Ccsds1958 => 0b001,
            CucEpoch::Agency => 0b010,
        };
        (id << 4) | ((self.coarse_octets - 1) << 2) | self.fine_octets
    }

    /// Read a CUC P-field. Errors on the extension flag or a non-CUC identification.
    pub fn from_p_field(p: u8) -> Result<Self, String> {
        if p & 0x80 != 0 {
            return Err(format!(
                "CUC P-field {p:#04X}: extended P-field not supported"
            ));
        }
        let epoch = match (p >> 4) & 0b111 {
            0b001 => CucEpoch::Ccsds1958,
            0b010 => CucEpoch::Agency,
            id => return Err(format!("P-field {p:#04X}: time code id {id:03b} is not CUC")),
        };
        CucFormat::new(epoch, ((p >> 2) & 0b11) + 1, p & 0b11)
    }

    /// Length of the T-field (coarse plus fine octets).
    pub fn t_field_len(&self) -> usize {
        (self.coarse_octets + self.fine_octets) as usize
    }
}

/// A CUC time value: the coarse count (seconds) and the fine count (units of
/// `2^-(8 * fine_octets)` s), each held right-aligned.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct CucTime {
    /// Coarse time, seconds from the epoch.
    pub coarse: u32,
    /// Fine time, a binary fraction of a second over `fine_octets` octets.
    pub fine: u32,
}

impl CucTime {
    /// Seconds from the epoch: `coarse + fine / 2^(8 * fine_octets)`.
    pub fn seconds(&self, format: &CucFormat) -> f64 {
        let scale = (1u64 << (8 * format.fine_octets as u32)) as f64;
        self.coarse as f64 + self.fine as f64 / scale
    }
}

/// Epoch of a CCSDS day segmented time code (CDS).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum CdsEpoch {
    /// Epoch bit 0: 1958 January 1.
    Ccsds1958,
    /// Epoch bit 1: an agency-defined epoch.
    Agency,
}

/// Width of the CDS day segment.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum CdsDaySegment {
    /// 16-bit day count.
    Bits16,
    /// 24-bit day count.
    Bits24,
}

/// The CDS sub-millisecond segment.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum CdsSubmillis {
    /// None.
    None,
    /// 16-bit microseconds of the millisecond, 0..=999.
    Microseconds,
    /// 32-bit picoseconds of the millisecond, 0..=999 999 999.
    Picoseconds,
}

/// The format of a CDS time code (CCSDS 301.0-B-4 §3.3).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct CdsFormat {
    /// The epoch the day count starts from.
    pub epoch: CdsEpoch,
    /// Day-segment width.
    pub days: CdsDaySegment,
    /// Sub-millisecond segment.
    pub submillis: CdsSubmillis,
}

impl CdsFormat {
    /// The one-octet P-field: `0 | 100 | epoch | day length | sub-ms (2)`.
    pub fn p_field(&self) -> u8 {
        let epoch = u8::from(self.epoch == CdsEpoch::Agency);
        let days = u8::from(self.days == CdsDaySegment::Bits24);
        let sub = match self.submillis {
            CdsSubmillis::None => 0b00,
            CdsSubmillis::Microseconds => 0b01,
            CdsSubmillis::Picoseconds => 0b10,
        };
        (0b100 << 4) | (epoch << 3) | (days << 2) | sub
    }

    /// Read a CDS P-field. Errors on the extension flag, a non-CDS identification or the
    /// reserved sub-millisecond code `11`.
    pub fn from_p_field(p: u8) -> Result<Self, String> {
        if p & 0x80 != 0 || (p >> 4) & 0b111 != 0b100 {
            return Err(format!("P-field {p:#04X} is not a CDS P-field"));
        }
        let submillis = match p & 0b11 {
            0b00 => CdsSubmillis::None,
            0b01 => CdsSubmillis::Microseconds,
            0b10 => CdsSubmillis::Picoseconds,
            _ => return Err(format!("CDS P-field {p:#04X}: reserved sub-ms code 11")),
        };
        Ok(CdsFormat {
            epoch: if p & 0b1000 != 0 {
                CdsEpoch::Agency
            } else {
                CdsEpoch::Ccsds1958
            },
            days: if p & 0b100 != 0 {
                CdsDaySegment::Bits24
            } else {
                CdsDaySegment::Bits16
            },
            submillis,
        })
    }

    fn day_octets(&self) -> usize {
        match self.days {
            CdsDaySegment::Bits16 => 2,
            CdsDaySegment::Bits24 => 3,
        }
    }

    fn submillis_octets(&self) -> usize {
        match self.submillis {
            CdsSubmillis::None => 0,
            CdsSubmillis::Microseconds => 2,
            CdsSubmillis::Picoseconds => 4,
        }
    }

    /// Length of the T-field (day, millisecond-of-day and sub-millisecond segments).
    pub fn t_field_len(&self) -> usize {
        self.day_octets() + 4 + self.submillis_octets()
    }
}

/// A CDS time value.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct CdsTime {
    /// Days from the epoch.
    pub days: u32,
    /// Milliseconds of the day (up to 86 400 999, allowing a leap second).
    pub ms_of_day: u32,
    /// The sub-millisecond count in the format's unit (0 when the format has none).
    pub submillis: u32,
}

/// A time code format: CUC or CDS.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum TimeCodeFormat {
    /// CCSDS unsegmented time code.
    Cuc(CucFormat),
    /// CCSDS day segmented time code.
    Cds(CdsFormat),
}

impl TimeCodeFormat {
    /// The one-octet P-field.
    pub fn p_field(&self) -> u8 {
        match self {
            TimeCodeFormat::Cuc(f) => f.p_field(),
            TimeCodeFormat::Cds(f) => f.p_field(),
        }
    }

    /// Read a P-field of either code.
    pub fn from_p_field(p: u8) -> Result<Self, String> {
        match (p >> 4) & 0b111 {
            0b100 => CdsFormat::from_p_field(p).map(TimeCodeFormat::Cds),
            _ => CucFormat::from_p_field(p).map(TimeCodeFormat::Cuc),
        }
    }

    /// Length of the T-field.
    pub fn t_field_len(&self) -> usize {
        match self {
            TimeCodeFormat::Cuc(f) => f.t_field_len(),
            TimeCodeFormat::Cds(f) => f.t_field_len(),
        }
    }
}

/// A time value of either code.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum TimeValue {
    /// CUC value.
    Cuc(CucTime),
    /// CDS value.
    Cds(CdsTime),
}

/// A time code: its format and value.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct TimeCode {
    /// The format (which also gives the P-field).
    pub format: TimeCodeFormat,
    /// The value.
    pub value: TimeValue,
}

fn push_be(out: &mut Vec<u8>, v: u32, octets: usize) {
    for i in (0..octets).rev() {
        out.push((v >> (8 * i)) as u8);
    }
}

fn read_be(bytes: &[u8]) -> u32 {
    bytes.iter().fold(0u32, |a, b| (a << 8) | *b as u32)
}

fn fits(v: u32, octets: usize) -> bool {
    octets >= 4 || u64::from(v) < (1u64 << (8 * octets))
}

impl TimeCode {
    /// Encode the time code: the P-field (when `explicit_p_field`) and then the T-field,
    /// big-endian. Errors when a value does not fit its field or is out of its range.
    pub fn encode(&self, explicit_p_field: bool) -> Result<Vec<u8>, String> {
        let mut out = Vec::with_capacity(1 + self.format.t_field_len());
        if explicit_p_field {
            out.push(self.format.p_field());
        }
        match (self.format, self.value) {
            (TimeCodeFormat::Cuc(f), TimeValue::Cuc(t)) => {
                let (c, n) = (f.coarse_octets as usize, f.fine_octets as usize);
                if !fits(t.coarse, c) {
                    return Err(format!("CUC coarse {} does not fit {c} octets", t.coarse));
                }
                if !fits(t.fine, n) || (n == 0 && t.fine != 0) {
                    return Err(format!("CUC fine {} does not fit {n} octets", t.fine));
                }
                push_be(&mut out, t.coarse, c);
                push_be(&mut out, t.fine, n);
            }
            (TimeCodeFormat::Cds(f), TimeValue::Cds(t)) => {
                if !fits(t.days, f.day_octets()) {
                    return Err(format!(
                        "CDS days {} do not fit {} octets",
                        t.days,
                        f.day_octets()
                    ));
                }
                if t.ms_of_day > 86_400_999 {
                    return Err(format!(
                        "CDS ms of day {} above 86 400 999",
                        t.ms_of_day
                    ));
                }
                let max_sub = match f.submillis {
                    CdsSubmillis::None => 0,
                    CdsSubmillis::Microseconds => 999,
                    CdsSubmillis::Picoseconds => 999_999_999,
                };
                if t.submillis > max_sub {
                    return Err(format!(
                        "CDS sub-millisecond {} above {max_sub}",
                        t.submillis
                    ));
                }
                push_be(&mut out, t.days, f.day_octets());
                push_be(&mut out, t.ms_of_day, 4);
                push_be(&mut out, t.submillis, f.submillis_octets());
            }
            _ => return Err("time code format and value are of different codes".into()),
        }
        Ok(out)
    }

    /// Decode a time code from the start of `bytes`, returning it and the octets consumed.
    /// With `implicit` = `None` the P-field is read from the first octet; with `Some(format)`
    /// the P-field is implicit (not present) and `format` gives the layout.
    pub fn decode(bytes: &[u8], implicit: Option<TimeCodeFormat>) -> Result<(Self, usize), String> {
        let (format, start) = match implicit {
            Some(f) => (f, 0),
            None => {
                let p = *bytes.first().ok_or("time code: no P-field octet")?;
                (TimeCodeFormat::from_p_field(p)?, 1)
            }
        };
        let end = start + format.t_field_len();
        if bytes.len() < end {
            return Err(format!(
                "time code needs {end} octets, {} present",
                bytes.len()
            ));
        }
        let t = &bytes[start..end];
        let value = match format {
            TimeCodeFormat::Cuc(f) => {
                let c = f.coarse_octets as usize;
                TimeValue::Cuc(CucTime {
                    coarse: read_be(&t[..c]),
                    fine: read_be(&t[c..]),
                })
            }
            TimeCodeFormat::Cds(f) => {
                let d = f.day_octets();
                TimeValue::Cds(CdsTime {
                    days: read_be(&t[..d]),
                    ms_of_day: read_be(&t[d..d + 4]),
                    submillis: read_be(&t[d + 4..]),
                })
            }
        };
        Ok((TimeCode { format, value }, end))
    }
}

/// How a secondary header's time code field is laid out.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub enum TimeCodeLayout {
    /// The P-field is written in front of the T-field (and read from it on decode).
    ExplicitPField,
    /// The P-field is fixed by the mission and not written; the format is this one.
    ImplicitPField(TimeCodeFormat),
}

/// The layout of a packet secondary header: an optional time code field, then an
/// ancillary data field of a fixed, mission-defined length (0 for none).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct SecondaryHeaderFormat {
    /// The time code field's layout, or `None` when the header has no time code.
    pub time_code: Option<TimeCodeLayout>,
    /// Length of the ancillary data field, octets.
    pub ancillary_octets: usize,
}

/// A packet secondary header's content.
#[derive(Clone, Debug, PartialEq, Eq)]
pub struct SecondaryHeader {
    /// The time code, when the format has one.
    pub time_code: Option<TimeCode>,
    /// The ancillary data field.
    pub ancillary: Vec<u8>,
}

impl SecondaryHeader {
    /// Encode the secondary header in `format`. Errors when the content does not match the
    /// format (time code present or absent, implicit format different, ancillary length).
    pub fn encode(&self, format: &SecondaryHeaderFormat) -> Result<Vec<u8>, String> {
        let mut out = match (format.time_code, &self.time_code) {
            (None, None) => Vec::new(),
            (Some(TimeCodeLayout::ExplicitPField), Some(tc)) => tc.encode(true)?,
            (Some(TimeCodeLayout::ImplicitPField(f)), Some(tc)) => {
                if tc.format != f {
                    return Err("time code format differs from the implicit P-field".into());
                }
                tc.encode(false)?
            }
            (Some(_), None) => return Err("the format has a time code field; none given".into()),
            (None, Some(_)) => return Err("the format has no time code field".into()),
        };
        if self.ancillary.len() != format.ancillary_octets {
            return Err(format!(
                "ancillary data is {} octets; the format says {}",
                self.ancillary.len(),
                format.ancillary_octets
            ));
        }
        out.extend_from_slice(&self.ancillary);
        if out.is_empty() {
            return Err("a secondary header must hold at least one octet".into());
        }
        Ok(out)
    }

    /// Decode a secondary header in `format` from the start of `bytes`; returns it and the
    /// octets consumed.
    pub fn decode(bytes: &[u8], format: &SecondaryHeaderFormat) -> Result<(Self, usize), String> {
        let (time_code, n) = match format.time_code {
            None => (None, 0),
            Some(TimeCodeLayout::ExplicitPField) => {
                let (tc, n) = TimeCode::decode(bytes, None)?;
                (Some(tc), n)
            }
            Some(TimeCodeLayout::ImplicitPField(f)) => {
                let (tc, n) = TimeCode::decode(bytes, Some(f))?;
                (Some(tc), n)
            }
        };
        let end = n + format.ancillary_octets;
        if bytes.len() < end {
            return Err(format!(
                "secondary header needs {end} octets, {} present",
                bytes.len()
            ));
        }
        Ok((
            SecondaryHeader {
                time_code,
                ancillary: bytes[n..end].to_vec(),
            },
            end,
        ))
    }
}

/// CRC-16 with polynomial 0x1021, initial value 0xFFFF, no reflection and no final XOR
/// (CRC-16/IBM-3740, also called CRC-16-CCITT-FALSE; check value 0x29B1 over `123456789`).
/// It is the packet error control of ECSS-E-ST-70-41C (PUS) and the CRC of the CCSDS
/// 132.0-B / 232.0-B frame error control field. CCSDS 133.0-B defines no packet CRC.
pub fn crc16_ccitt_false(data: &[u8]) -> u16 {
    let mut crc: u16 = 0xFFFF;
    for &b in data {
        crc ^= (b as u16) << 8;
        for _ in 0..8 {
            crc = if crc & 0x8000 != 0 {
                (crc << 1) ^ 0x1021
            } else {
                crc << 1
            };
        }
    }
    crc
}

/// Whether a packet's last two octets are the CRC of every octet before them.
pub fn pec_ok(packet: &[u8]) -> bool {
    packet.len() >= 8
        && crc16_ccitt_false(&packet[..packet.len() - 2])
            == u16::from_be_bytes([packet[packet.len() - 2], packet[packet.len() - 1]])
}

/// The layout of a packet's data field: an optional secondary header, the user data, and an
/// optional packet error control field (the CRC, last two octets).
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct PacketFormat {
    /// The secondary header's layout; `Some` sets the secondary-header flag.
    pub secondary_header: Option<SecondaryHeaderFormat>,
    /// Whether the packet ends with a packet error control field.
    pub pec: bool,
}

/// A packet decoded with [`decode_packet_with`].
#[derive(Clone, Debug, PartialEq)]
pub struct DecodedPacket {
    /// The primary header.
    pub header: PrimaryHeader,
    /// The secondary header, when the format has one.
    pub secondary_header: Option<SecondaryHeader>,
    /// The user data field.
    pub user_data: Vec<u8>,
    /// The packet error control value, when the format has one (already checked).
    pub pec: Option<u16>,
}

/// Encode a version-1 packet in `format`: primary header, secondary header, user data and
/// (when the format says) the PEC over everything before it. The data length field counts
/// the secondary header, the user data and the PEC.
pub fn encode_packet_with(
    format: &PacketFormat,
    is_telecommand: bool,
    apid: u16,
    sequence_flags: SequenceFlags,
    sequence_count: u16,
    secondary_header: Option<&SecondaryHeader>,
    user_data: &[u8],
) -> Result<Vec<u8>, String> {
    let mut data = match (&format.secondary_header, secondary_header) {
        (Some(f), Some(sh)) => sh.encode(f)?,
        (None, None) => Vec::new(),
        (Some(_), None) => return Err("the format has a secondary header; none given".into()),
        (None, Some(_)) => return Err("the format has no secondary header".into()),
    };
    data.extend_from_slice(user_data);
    if format.pec {
        data.extend_from_slice(&[0, 0]);
    }
    let mut pkt = encode_packet(
        0,
        is_telecommand,
        format.secondary_header.is_some(),
        apid,
        sequence_flags,
        sequence_count,
        &data,
    )?;
    if format.pec {
        let n = pkt.len();
        let crc = crc16_ccitt_false(&pkt[..n - 2]);
        pkt[n - 2..].copy_from_slice(&crc.to_be_bytes());
    }
    Ok(pkt)
}

/// Decode a packet written in `format`. Errors when the buffer length disagrees with the
/// length field, the secondary-header flag disagrees with the format, the secondary header
/// or PEC does not fit, or the PEC does not check.
pub fn decode_packet_with(bytes: &[u8], format: &PacketFormat) -> Result<DecodedPacket, String> {
    let (header, data) = decode_packet(bytes)?;
    if header.secondary_header != format.secondary_header.is_some() {
        return Err(format!(
            "secondary-header flag {} disagrees with the format",
            u8::from(header.secondary_header)
        ));
    }
    let pec_len = if format.pec { 2 } else { 0 };
    if data.len() < pec_len {
        return Err("data field shorter than the PEC".into());
    }
    let body = &data[..data.len() - pec_len];
    let pec = if format.pec {
        if !pec_ok(bytes) {
            return Err(format!(
                "PEC {:04X} does not match the CRC {:04X} of the packet",
                u16::from_be_bytes([bytes[bytes.len() - 2], bytes[bytes.len() - 1]]),
                crc16_ccitt_false(&bytes[..bytes.len() - 2])
            ));
        }
        Some(u16::from_be_bytes([
            bytes[bytes.len() - 2],
            bytes[bytes.len() - 1],
        ]))
    } else {
        None
    };
    let (secondary_header, n) = match &format.secondary_header {
        Some(f) => {
            let (sh, n) = SecondaryHeader::decode(body, f)?;
            (Some(sh), n)
        }
        None => (None, 0),
    };
    Ok(DecodedPacket {
        header,
        secondary_header,
        user_data: body[n..].to_vec(),
        pec,
    })
}

/// Splits user data units into packets of one APID.
///
/// CCSDS 133.0-B-2 carries the sequence flags for the user's segmentation and does not
/// itself define a segmentation service; this is the conventional use of the flags: one
/// unit that fits in a packet goes unsegmented (`11`), a longer one as first (`01`),
/// continuation (`00`) ... and last (`10`) packets with consecutive sequence counts
/// modulo 16384.
#[derive(Clone, Copy, Debug, PartialEq, Eq)]
pub struct Segmenter {
    /// The packet layout every segment uses.
    pub format: PacketFormat,
    /// Telecommand (true) or telemetry (false).
    pub is_telecommand: bool,
    /// The APID, 0..=2047.
    pub apid: u16,
    /// The most user-data octets one packet carries.
    pub max_user_octets: usize,
}

impl Segmenter {
    /// Split `user_data` into packets whose sequence counts start at `first_count` and wrap
    /// at 16384. Every packet carries `secondary_header` when the format has one.
    pub fn segment(
        &self,
        first_count: u16,
        secondary_header: Option<&SecondaryHeader>,
        user_data: &[u8],
    ) -> Result<Vec<Vec<u8>>, String> {
        if user_data.is_empty() {
            return Err("nothing to segment: empty user data".into());
        }
        if self.max_user_octets == 0 {
            return Err("max_user_octets must be at least 1".into());
        }
        if first_count > 0x3FFF {
            return Err("first_count exceeds 14 bits (0..=16383)".into());
        }
        let chunks: Vec<&[u8]> = user_data.chunks(self.max_user_octets).collect();
        let n = chunks.len();
        let mut out = Vec::with_capacity(n);
        for (i, chunk) in chunks.iter().enumerate() {
            let flags = if n == 1 {
                SequenceFlags::Unsegmented
            } else if i == 0 {
                SequenceFlags::First
            } else if i == n - 1 {
                SequenceFlags::Last
            } else {
                SequenceFlags::Continuation
            };
            let count = ((first_count as usize + i) % 16384) as u16;
            out.push(encode_packet_with(
                &self.format,
                self.is_telecommand,
                self.apid,
                flags,
                count,
                secondary_header,
                chunk,
            )?);
        }
        Ok(out)
    }
}

/// Rebuilds user data units from the packets of one APID, in arrival order.
///
/// Rejects: a packet that does not decode in the format (including a PEC that does not
/// check), an APID other than the first one seen, a sequence count that is not the previous
/// one plus 1 modulo 16384 (a gap, a repeat or an out-of-order packet), a continuation or
/// last packet with no unit open, and a first or unsegmented packet while a unit is open.
/// After a rejection the open unit is discarded and the next packet starts afresh.
#[derive(Clone, Debug)]
pub struct Reassembler {
    format: PacketFormat,
    apid: Option<u16>,
    last_count: Option<u16>,
    open: Option<Vec<u8>>,
}

impl Reassembler {
    /// A reassembler for packets in `format`.
    pub fn new(format: PacketFormat) -> Self {
        Reassembler {
            format,
            apid: None,
            last_count: None,
            open: None,
        }
    }

    /// Whether a unit has been started but not finished.
    pub fn is_open(&self) -> bool {
        self.open.is_some()
    }

    fn fail(&mut self, msg: String) -> Result<Option<Vec<u8>>, String> {
        self.open = None;
        self.last_count = None;
        Err(msg)
    }

    /// Take the next packet. Returns `Ok(Some(unit))` when it completes a unit.
    pub fn push(&mut self, packet: &[u8]) -> Result<Option<Vec<u8>>, String> {
        let p = match decode_packet_with(packet, &self.format) {
            Ok(p) => p,
            Err(e) => return self.fail(e),
        };
        let h = &p.header;
        match self.apid {
            Some(a) if a != h.apid => {
                return self.fail(format!("APID {} where {a} was expected", h.apid))
            }
            _ => self.apid = Some(h.apid),
        }
        if let Some(last) = self.last_count {
            let step = (h.sequence_count + 16384 - last) % 16384;
            if step != 1 {
                let msg = if step == 0 {
                    format!("sequence count {} repeated", h.sequence_count)
                } else if step < 8192 {
                    format!(
                        "sequence count gap: {} after {last} ({} packet(s) missing)",
                        h.sequence_count,
                        step - 1
                    )
                } else {
                    format!(
                        "sequence count out of order: {} after {last}",
                        h.sequence_count
                    )
                };
                return self.fail(msg);
            }
        }
        self.last_count = Some(h.sequence_count);
        match (h.sequence_flags, self.open.take()) {
            (SequenceFlags::Unsegmented, None) => Ok(Some(p.user_data)),
            (SequenceFlags::First, None) => {
                self.open = Some(p.user_data);
                Ok(None)
            }
            (SequenceFlags::Continuation, Some(mut u)) => {
                u.extend_from_slice(&p.user_data);
                self.open = Some(u);
                Ok(None)
            }
            (SequenceFlags::Last, Some(mut u)) => {
                u.extend_from_slice(&p.user_data);
                Ok(Some(u))
            }
            (f @ (SequenceFlags::Continuation | SequenceFlags::Last), None) => {
                self.fail(format!("{f:?} packet with no unit open"))
            }
            (f, Some(_)) => self.fail(format!("{f:?} packet while a unit is open")),
        }
    }
}

/// Reassemble every unit of a packet sequence; errors on the first rejected packet or when
/// the sequence ends with a unit still open.
pub fn reassemble(format: &PacketFormat, packets: &[Vec<u8>]) -> Result<Vec<Vec<u8>>, String> {
    let mut r = Reassembler::new(*format);
    let mut units = Vec::new();
    for (i, p) in packets.iter().enumerate() {
        if let Some(u) = r.push(p).map_err(|e| format!("packet {i}: {e}"))? {
            units.push(u);
        }
    }
    if r.is_open() {
        return Err("the sequence ends with a unit still open (no last packet)".into());
    }
    Ok(units)
}

fn sp_default_apid() -> u16 {
    100
}
fn sp_default_count() -> u16 {
    3
}
fn sp_default_data_len() -> usize {
    16
}

/// Unit and provenance class for every numeric field the `space-packet` report emits.
///
/// Three of the CCSDS primary-header quantities are *not* counts and are written as
/// dimensionless (`"1"`): the APID is an 11-bit process identifier, the sequence count a
/// 14-bit rolling counter value, and the packet-data-length field a 16-bit header field
/// holding `(data-field octets − 1)` — one less than the octet count it encodes, so
/// labelling it `octet` would misstate it by one. `data_len_octets` and `total_octets` are
/// genuine octet counts, and `packet_count` a genuine cardinality.
const UNITS: &[crate::field_schema::FieldUnit] = {
    use crate::field_schema::{FieldUnit, ProvenanceClass::*};
    &[
        FieldUnit {
            path: "apid",
            unit: "1",
            provenance: Input,
            definition: "CCSDS Application Process Identifier, an 11-bit (0..=2047) \
                         dimensionless process identifier, not a count",
        },
        FieldUnit {
            path: "packet_count",
            unit: "count",
            provenance: Input,
            definition: "number of packets framed into the stream",
        },
        FieldUnit {
            path: "data_len_octets",
            unit: "octet",
            provenance: Input,
            definition: "length of each packet's user data field",
        },
        FieldUnit {
            path: "total_stream_octets",
            unit: "octet",
            provenance: Computed,
            definition: "total encoded length of the whole stream: \
                         packet_count * (6-octet primary header + data_len_octets)",
        },
        FieldUnit {
            path: "first_packet.index",
            unit: "1",
            provenance: Computed,
            definition: "zero-based position of this packet in the framed stream, a \
                         dimensionless ordinal",
        },
        FieldUnit {
            path: "first_packet.apid",
            unit: "1",
            provenance: Computed,
            definition: "the 11-bit APID decoded back out of the encoded primary header; \
                         an identifier, not a count",
        },
        FieldUnit {
            path: "first_packet.sequence_count",
            unit: "1",
            provenance: Computed,
            definition: "CCSDS packet sequence count decoded from the header: a 14-bit \
                         (0..=16383) rolling counter value, here equal to the packet index",
        },
        FieldUnit {
            path: "first_packet.data_length_field",
            unit: "1",
            provenance: Computed,
            definition: "CCSDS packet-data-length header field decoded from the header: the \
                         16-bit value (data-field octets - 1), so it is one less than \
                         data_len_octets rather than an octet count itself",
        },
        FieldUnit {
            path: "first_packet.total_octets",
            unit: "octet",
            provenance: Computed,
            definition: "encoded length of this packet: 6-octet primary header plus the \
                         data field",
        },
    ]
};

/// The `space-packet` scenario: frame a synthetic TM/TC Space Packet stream and
/// report the per-packet primary-header decode, the total byte count, and that the
/// encode↔decode round trip is exact — the CCSDS-133.0 framing interop check.
#[derive(Deserialize)]
pub struct SpacePacketScenario {
    /// Application Process Identifier (0..=2047).
    #[serde(default = "sp_default_apid")]
    pub apid: u16,
    /// Whether to frame telecommand (true) or telemetry (false) packets.
    #[serde(default)]
    pub telecommand: bool,
    /// Number of packets to frame (a sequence with rolling counts).
    #[serde(default = "sp_default_count")]
    pub packet_count: u16,
    /// User-data-field length per packet (octets, 1..=65536).
    #[serde(default = "sp_default_data_len")]
    pub data_len: usize,
}

impl SpacePacketScenario {
    /// Run the scenario, returning `(json, summary)`.
    pub fn run_json(&self) -> Result<(String, String), String> {
        if self.apid > 0x07FF {
            return Err("apid must be in 0..=2047".to_string());
        }
        if self.packet_count == 0 {
            return Err("packet_count must be >= 1".to_string());
        }
        if self.data_len == 0 || self.data_len > 65536 {
            return Err("data_len must be in 1..=65536".to_string());
        }
        let mut packets = Vec::new();
        let mut total_bytes = 0usize;
        let mut round_trip_ok = true;
        for i in 0..self.packet_count {
            // Deterministic synthetic payload (no wall-clock / randomness).
            let data: Vec<u8> = (0..self.data_len)
                .map(|k| ((i as usize + k) & 0xFF) as u8)
                .collect();
            let flags = if self.packet_count == 1 {
                SequenceFlags::Unsegmented
            } else if i == 0 {
                SequenceFlags::First
            } else if i == self.packet_count - 1 {
                SequenceFlags::Last
            } else {
                SequenceFlags::Continuation
            };
            let bytes = encode_packet(0, self.telecommand, false, self.apid, flags, i, &data)?;
            total_bytes += bytes.len();
            let (hdr, decoded) = decode_packet(&bytes)?;
            if decoded != data || hdr.apid != self.apid || hdr.sequence_count != i {
                round_trip_ok = false;
            }
            if i == 0 {
                packets.push(serde_json::json!({
                    "index": i,
                    "apid": hdr.apid,
                    "type": if hdr.is_telecommand { "TC" } else { "TM" },
                    "sequence_flags": format!("{:?}", hdr.sequence_flags),
                    "sequence_count": hdr.sequence_count,
                    "data_length_field": hdr.data_length_field,
                    "total_octets": bytes.len(),
                    "primary_header_hex": bytes[..6].iter().map(|b| format!("{b:02X}")).collect::<Vec<_>>().join(" "),
                }));
            }
        }
        if !round_trip_ok {
            return Err("internal error: encode/decode round trip mismatch".to_string());
        }
        let json = serde_json::json!({
            "kind": "space-packet",
            "label": "CCSDS 133.0-B Space Packet primary-header framing — exact, \
                      deterministic bit layout, encode↔decode round-trip verified; \
                      NOT a conformance certification (no secondary header / CRC / \
                      segmentation logic beyond the flags)",
            "units": crate::field_schema::units_block(UNITS),
            "apid": self.apid,
            "type": if self.telecommand { "TC" } else { "TM" },
            "packet_count": self.packet_count,
            "data_len_octets": self.data_len,
            "total_stream_octets": total_bytes,
            "round_trip_exact": round_trip_ok,
            "first_packet": packets.first(),
        });
        let summary = format!(
            "space-packet: framed {} CCSDS-133.0 {} packet(s) APID {}, {} octets total, \
             round-trip exact ({})",
            self.packet_count,
            if self.telecommand { "TC" } else { "TM" },
            self.apid,
            total_bytes,
            round_trip_ok
        );
        let json = serde_json::to_string_pretty(&json).map_err(|e| e.to_string())?;
        Ok((json, summary))
    }
}

#[cfg(test)]
mod tests {
    use super::*;

    #[test]
    fn primary_header_bits_match_the_ccsds_133_layout() {
        // version 0, TM, no secondary header, APID 0x123, unsegmented, count 0,
        // 4-octet data -> data_length_field = 3. Hand-derived header bytes:
        //   word1 = 0x0123, word2 = 3<<14 = 0xC000, word3 = 3.
        let pkt = encode_packet(
            0,
            false,
            false,
            0x123,
            SequenceFlags::Unsegmented,
            0,
            &[0xDE, 0xAD, 0xBE, 0xEF],
        )
        .unwrap();
        assert_eq!(&pkt[..6], &[0x01, 0x23, 0xC0, 0x00, 0x00, 0x03]);
        assert_eq!(&pkt[6..], &[0xDE, 0xAD, 0xBE, 0xEF]);
    }

    #[test]
    fn primary_header_matches_published_independent_test_vectors() {
        // Cross-check the encoder against an *independent* published reference: the
        // byte-level primary-header test vectors from the `spacepackets` library
        // (us-irs/spacepackets-py, tests/ccsds/test_space_packet.py), whose pack
        // logic is its own implementation of CCSDS 133.0-B-2 §4.1.3. Plus the
        // canonical all-ones TM case. Each row encodes a data field of
        // `data_length_field + 1` octets so the encoder derives that exact field,
        // then asserts the 6 header octets equal the published bytes and the decode
        // round-trips the fields.
        struct Vector {
            tc: bool,
            shf: bool,
            apid: u16,
            seqflags: SequenceFlags,
            seqcount: u16,
            dlen: u16,
            want: [u8; 6],
        }
        let cases = [
            // spacepackets-py test_raw_output: TC, SHF, APID 2, first, count 0x34, len 0x16.
            Vector {
                tc: true,
                shf: true,
                apid: 0x002,
                seqflags: SequenceFlags::First,
                seqcount: 0x0034,
                dlen: 0x0016,
                want: [0x18, 0x02, 0x40, 0x34, 0x00, 0x16],
            },
            // spacepackets-py test_more_complex_output: all-max TC packet.
            Vector {
                tc: true,
                shf: true,
                apid: 2047,
                seqflags: SequenceFlags::Unsegmented,
                seqcount: 16383,
                dlen: 65535,
                want: [0x1F, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF],
            },
            // spacepackets-py examples: TC, no SHF, APID 1, unsegmented, count 0, len 0.
            Vector {
                tc: true,
                shf: false,
                apid: 0x001,
                seqflags: SequenceFlags::Unsegmented,
                seqcount: 0,
                dlen: 0,
                want: [0x10, 0x01, 0xC0, 0x00, 0x00, 0x00],
            },
            // spacepackets-py examples: TC, no SHF, APID 2, unsegmented, count 5, len 3.
            Vector {
                tc: true,
                shf: false,
                apid: 0x002,
                seqflags: SequenceFlags::Unsegmented,
                seqcount: 5,
                dlen: 3,
                want: [0x10, 0x02, 0xC0, 0x05, 0x00, 0x03],
            },
            // Canonical all-ones TM (version 0, APID/count saturated): 07 FF FF FF 00 00.
            Vector {
                tc: false,
                shf: false,
                apid: 2047,
                seqflags: SequenceFlags::Unsegmented,
                seqcount: 16383,
                dlen: 0,
                want: [0x07, 0xFF, 0xFF, 0xFF, 0x00, 0x00],
            },
        ];
        for c in &cases {
            let data = vec![0u8; c.dlen as usize + 1];
            let pkt = encode_packet(0, c.tc, c.shf, c.apid, c.seqflags, c.seqcount, &data).unwrap();
            assert_eq!(
                &pkt[..6],
                &c.want,
                "header bytes for apid={} seq={} dlen={}",
                c.apid,
                c.seqcount,
                c.dlen
            );
            let (h, d) = decode_packet(&pkt).unwrap();
            assert_eq!(h.is_telecommand, c.tc);
            assert_eq!(h.secondary_header, c.shf);
            assert_eq!(h.apid, c.apid);
            assert_eq!(h.sequence_flags, c.seqflags);
            assert_eq!(h.sequence_count, c.seqcount);
            assert_eq!(h.data_length_field, c.dlen);
            assert_eq!(d.len(), c.dlen as usize + 1);
        }
    }

    #[test]
    fn telecommand_and_secondary_header_flags_set_their_bits() {
        let pkt = encode_packet(0, true, true, 0, SequenceFlags::First, 0, &[0]).unwrap();
        // type bit (0x10) and secondary-header bit (0x08) of byte0; seq-flags 01 in byte2.
        assert_eq!(pkt[0], 0b0001_1000);
        assert_eq!(pkt[2], 0b0100_0000);
    }

    #[test]
    fn encode_decode_round_trips_all_fields() {
        let data: Vec<u8> = (0..50).collect();
        let pkt = encode_packet(0, false, false, 1234, SequenceFlags::Last, 9001, &data).unwrap();
        let (h, d) = decode_packet(&pkt).unwrap();
        assert_eq!(h.apid, 1234);
        assert_eq!(h.sequence_flags, SequenceFlags::Last);
        assert_eq!(h.sequence_count, 9001);
        assert_eq!(h.data_length_field, 49);
        assert!(!h.is_telecommand);
        assert_eq!(d, data);
    }

    #[test]
    fn data_length_field_is_octets_minus_one() {
        let pkt = encode_packet(0, false, false, 0, SequenceFlags::Unsegmented, 0, &[7]).unwrap();
        // One data octet -> length field 0; total length 7.
        assert_eq!(u16::from_be_bytes([pkt[4], pkt[5]]), 0);
        assert_eq!(pkt.len(), 7);
    }

    #[test]
    fn out_of_range_fields_and_empty_data_are_rejected() {
        assert!(encode_packet(0, false, false, 2048, SequenceFlags::First, 0, &[0]).is_err());
        assert!(encode_packet(0, false, false, 0, SequenceFlags::First, 16384, &[0]).is_err());
        assert!(encode_packet(0, false, false, 0, SequenceFlags::First, 0, &[]).is_err());
    }

    #[test]
    fn decode_rejects_truncated_and_length_mismatched_buffers() {
        assert!(decode_packet(&[0, 1, 2]).is_err()); // shorter than header
        let mut pkt = encode_packet(
            0,
            false,
            false,
            0,
            SequenceFlags::Unsegmented,
            0,
            &[1, 2, 3],
        )
        .unwrap();
        pkt.push(0xFF); // trailing byte the length field does not account for
        assert!(decode_packet(&pkt).is_err());
    }

    #[test]
    fn scenario_runs_reproducibly_and_is_honest() {
        let scn = SpacePacketScenario {
            apid: 100,
            telecommand: false,
            packet_count: 3,
            data_len: 16,
        };
        let (j1, _s) = scn.run_json().unwrap();
        let (j2, _s) = scn.run_json().unwrap();
        assert_eq!(j1, j2, "framing must be deterministic");
        let v: serde_json::Value = serde_json::from_str(&j1).unwrap();
        assert_eq!(v["kind"], "space-packet");
        assert_eq!(v["round_trip_exact"], true);
        assert_eq!(v["total_stream_octets"], (6 + 16) * 3);
        assert!(v["label"].as_str().unwrap().contains("CCSDS 133.0"));
        assert!(!j1.contains("VALIDATED"));
    }
}
