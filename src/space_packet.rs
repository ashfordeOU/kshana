// SPDX-License-Identifier: Apache-2.0
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

fn sp_default_apid() -> u16 {
    100
}
fn sp_default_count() -> u16 {
    3
}
fn sp_default_data_len() -> usize {
    16
}

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
