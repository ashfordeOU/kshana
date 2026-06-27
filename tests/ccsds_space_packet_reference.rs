// SPDX-License-Identifier: AGPL-3.0-only
//! Externally validate the CCSDS 133.0 Space Packet framing against an
//! **independent third-party authority**: spacepackets 0.32.0 (R. Mueller /
//! us-irs, Apache-2.0), an independent Python implementation of the CCSDS Space
//! Packet Protocol (CCSDS 133.0-B-2).
//!
//! The 6-octet primary header is an integer bit-packing (no floating point), so
//! this is a **byte-exact, zero-tolerance** check, not a numeric tolerance:
//!
//!   word1 = version(3) | type(1) | sec-hdr-flag(1) | APID(11)
//!   word2 = seq-flags(2) | seq-count(14)
//!   word3 = packet-data-length(16) = (data-field octets) - 1
//!
//! For each of the 33 field combinations the committed fixture pins
//! `SpacePacketHeader.pack()` / `SpacePacket.pack()`; this test feeds kshana's
//! `space_packet::encode_packet` / `decode_packet` byte-identical inputs and
//! asserts:
//!   * the 6 primary-header octets equal the oracle's, byte-for-byte;
//!   * the full encoded packet (header + data) equals the oracle's, byte-for-byte
//!     (for the shf=0, small-data cases — see the asymmetry note below);
//!   * decode_packet round-trips every field exactly.
//!
//! The grid spans (planned coverage): version 0; TM and TC; SHF on/off; APID
//! {0,1,2,0x123,0x7FF}; all four sequence flags; seq-count {0,5,0x34,0x3FFF};
//! data-length-field {0,3,0x16,0xFFFF}; plus the all-zeros and all-ones saturated
//! sentinels, and the four worked examples from spacepackets-py's own test suite.
//!
//! Honest scope / one deliberate asymmetry: this validates the CCSDS-133.0
//! *primary-header framing* — the exact bit layout and a round-trippable
//! encode/decode — byte-for-byte. It does NOT validate secondary-header content,
//! CRC, segmentation re-assembly, or conformance certification beyond the framing
//! (kshana's module docs scope these out). spacepackets refuses to pack a *full*
//! packet when the SHF bit is set but no secondary-header bytes are supplied;
//! kshana models only the flag bit, not its payload. So the full-packet byte
//! comparison runs on the shf=0 cases; the SHF *bit* itself is still fully
//! exercised by the header-bytes comparison and the round-trip decode in every
//! shf=1 case (only the out-of-scope secondary-header payload is not framed).
//!
//! Reference data, provenance and the committed generator live in
//! `tests/fixtures/ccsds_space_packet/` (NOTICE +
//! generate_ccsds_space_packet_reference.py).

use kshana::space_packet::{decode_packet, encode_packet, SequenceFlags};

const REF: &str = include_str!("fixtures/ccsds_space_packet/ccsds_space_packet_reference.txt");

fn seqflags_from_u8(v: u8) -> SequenceFlags {
    match v {
        0 => SequenceFlags::Continuation,
        1 => SequenceFlags::First,
        2 => SequenceFlags::Last,
        3 => SequenceFlags::Unsegmented,
        other => panic!("invalid seqflags value {other}"),
    }
}

/// Parse a lowercase hex string ("180240340016") into bytes.
fn hex_to_bytes(s: &str) -> Vec<u8> {
    let s = s.trim();
    assert!(s.len() % 2 == 0, "hex string must have even length: '{s}'");
    (0..s.len())
        .step_by(2)
        .map(|i| {
            u8::from_str_radix(&s[i..i + 2], 16).unwrap_or_else(|e| panic!("bad hex '{s}': {e}"))
        })
        .collect()
}

/// Deterministic byte pattern matching the generator's deterministic_data(n):
/// bytes 0,1,2,... mod 256. Must match the python side exactly.
fn deterministic_data(n: usize) -> Vec<u8> {
    (0..n).map(|i| (i & 0xFF) as u8).collect()
}

#[test]
fn space_packet_framing_matches_spacepackets_ccsds_133() {
    let mut n_cases = 0usize;
    let mut n_full = 0usize;
    let mut worst_header_mismatch_bytes = 0usize; // must stay 0 (byte-exact)

    for line in REF.lines() {
        if !line.starts_with("CASE ") {
            continue;
        }
        // CASE name | tc | shf | apid | seqflags | seqcount | dlen_field | HEADERHEX | FULLHEX
        let parts: Vec<&str> = line.splitn(9, '|').collect();
        assert_eq!(parts.len(), 9, "CASE row needs 9 |-fields: {line}");
        let name = parts[0].trim_start_matches("CASE").trim();
        let tc: bool = parts[1].trim() == "1";
        let shf: bool = parts[2].trim() == "1";
        let apid: u16 = parts[3].trim().parse().unwrap();
        let seqflags = seqflags_from_u8(parts[4].trim().parse().unwrap());
        let seqcount: u16 = parts[5].trim().parse().unwrap();
        let dlen_field: u32 = parts[6].trim().parse().unwrap();
        let header_hex = parts[7].trim();
        let full_hex = parts[8].trim();

        let want_header = hex_to_bytes(header_hex);
        assert_eq!(
            want_header.len(),
            6,
            "{name}: oracle header must be 6 octets"
        );

        // The data field has dlen_field + 1 octets. Build the identical
        // deterministic payload the generator used so the full-packet bytes line
        // up; kshana derives the length field from data.len() - 1.
        let data_field_len = dlen_field as usize + 1;
        let data = deterministic_data(data_field_len);

        let pkt = encode_packet(0, tc, shf, apid, seqflags, seqcount, &data)
            .unwrap_or_else(|e| panic!("{name}: kshana encode_packet errored: {e}"));

        // --- byte-exact primary header ---
        let header_diff = pkt[..6]
            .iter()
            .zip(want_header.iter())
            .filter(|(a, b)| a != b)
            .count();
        worst_header_mismatch_bytes = worst_header_mismatch_bytes.max(header_diff);
        assert_eq!(
            &pkt[..6],
            want_header.as_slice(),
            "CASE {name}: kshana primary header {:02x?} != spacepackets {:02x?}",
            &pkt[..6],
            want_header
        );

        // --- byte-exact full packet (when the oracle emitted one) ---
        if full_hex != "-" {
            let want_full = hex_to_bytes(full_hex);
            assert_eq!(
                pkt, want_full,
                "CASE {name}: kshana full packet {:02x?} != spacepackets {:02x?}",
                pkt, want_full
            );
            // sanity: full = header (6) + data field
            assert_eq!(want_full.len(), 6 + data_field_len, "{name}: full len");
            n_full += 1;
        }

        // --- round-trip decode of every field ---
        let (h, d) = decode_packet(&pkt)
            .unwrap_or_else(|e| panic!("{name}: kshana decode_packet errored: {e}"));
        assert_eq!(h.version, 0, "CASE {name}: version");
        assert_eq!(h.is_telecommand, tc, "CASE {name}: type bit");
        assert_eq!(h.secondary_header, shf, "CASE {name}: sec-hdr flag");
        assert_eq!(h.apid, apid, "CASE {name}: APID");
        assert_eq!(h.sequence_flags, seqflags, "CASE {name}: seq flags");
        assert_eq!(h.sequence_count, seqcount, "CASE {name}: seq count");
        assert_eq!(
            h.data_length_field as u32, dlen_field,
            "CASE {name}: data length field"
        );
        assert_eq!(d, data, "CASE {name}: data field round-trip");

        n_cases += 1;
    }

    assert!(
        n_cases >= 24,
        "expected >=24 Space Packet reference cases, got {n_cases}"
    );
    assert!(
        n_full >= 6,
        "expected >=6 full-packet byte comparisons (shf=0, small data), got {n_full}"
    );
    assert_eq!(
        worst_header_mismatch_bytes, 0,
        "primary-header comparison is byte-exact: zero mismatched octets expected"
    );
    eprintln!(
        "ccsds_space_packet_reference: {n_cases} cases vs spacepackets 0.32.0 \
         (CCSDS 133.0-B-2), {n_full} full-packet byte comparisons, \
         worst header mismatch = {worst_header_mismatch_bytes} octets (byte-exact)"
    );
}
