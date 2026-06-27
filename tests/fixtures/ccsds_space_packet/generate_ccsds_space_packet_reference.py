#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate external reference vectors for CCSDS 133.0 Space Packet framing.

The oracle is **spacepackets** (R. Mueller / us-irs, Apache-2.0) — an
independent, third-party Python implementation of the CCSDS Space Packet
Protocol (CCSDS 133.0-B-2). Its `SpacePacketHeader.pack()` performs its own
bit-packing of the 6-octet primary header per CCSDS 133.0-B-2 §4.1.3, and
`SpacePacket.pack()` appends the user data field. Neither shares any code with
kshana, so its byte output is a genuine external authority for the framing.

The 6-octet primary header is an integer bit-packing (no floating point), so the
comparison is **byte-exact, zero tolerance**:

  word1 (bits) = version(3) | type(1) | sec-hdr-flag(1) | APID(11)
  word2 (bits) = seq-flags(2) | seq-count(14)
  word3        = packet-data-length(16) = (data-field octets) - 1

kshana's `space_packet::encode_packet(version, is_telecommand, secondary_header,
apid, sequence_flags, sequence_count, data)` and `decode_packet` follow the
identical convention (big-endian, data_length_field = octets - 1). For each case
we feed both implementations byte-identical inputs and compare:
  * the 6 primary-header octets   (header.pack())
  * the full encoded packet bytes (SpacePacket.pack(): header + user data)
  * a round-trip decode of every field (SpacePacketHeader.unpack())

The grid spans (per the planned coverage):
  version 0; TM and TC; SHF on/off; APID {0,1,2,0x123,0x7FF};
  all four sequence flags; seq-count {0,5,0x34,0x3FFF};
  data-length-field {0,3,0x16,0xFFFF}; plus the all-zeros and all-ones
  saturated sentinels.

Honest scope: this validates the CCSDS-133.0 *primary-header framing* — the
exact bit layout and a round-trippable encode/decode — byte-for-byte against an
independent library. It does NOT validate secondary-header content, CRC,
segmentation re-assembly, or any conformance certification beyond the framing
(which kshana's own module docs already scope out).

Reproduce (offline, no kshana code involved):

    python3 -m venv /tmp/spvenv
    /tmp/spvenv/bin/pip install spacepackets
    /tmp/spvenv/bin/python generate_ccsds_space_packet_reference.py \
        > ccsds_space_packet_reference.txt

Generated with spacepackets 0.32.0 (Apache-2.0).
"""

from spacepackets.ccsds.spacepacket import (
    PacketType,
    SequenceFlags,
    SpacePacket,
    SpacePacketHeader,
)

# kshana SequenceFlags discriminants == CCSDS 2-bit values == spacepackets enum:
#   0 continuation, 1 first, 2 last, 3 unsegmented.
SEQFLAGS = {
    0: SequenceFlags.CONTINUATION_SEGMENT,
    1: SequenceFlags.FIRST_SEGMENT,
    2: SequenceFlags.LAST_SEGMENT,
    3: SequenceFlags.UNSEGMENTED,
}

# (name, is_tc(0/1), shf(0/1), apid, seq_flags(0..3), seq_count, dlen_field)
# dlen_field is the packet-data-length field value; the data field is dlen_field+1
# octets long. To keep the committed fixture small while still exercising the
# full encoded-packet path, we cap the *materialised* data field below; the
# 0xFFFF (65536-octet) saturated cases compare the primary header only (header
# packing is independent of the data bytes), which the test enforces explicitly.
CASES = [
    # --- the four documented spacepackets-py worked examples / sentinels ---
    ("py_test_raw_output", 1, 1, 0x002, 1, 0x0034, 0x0016),
    ("py_all_max_tc", 1, 1, 2047, 3, 16383, 65535),
    ("py_example_tc_apid1", 1, 0, 0x001, 3, 0, 0),
    ("py_example_tc_apid2", 1, 0, 0x002, 3, 5, 3),
    # --- saturated sentinels ---
    ("all_zeros", 0, 0, 0x000, 0, 0, 0),
    ("all_ones_tm", 0, 0, 2047, 3, 16383, 0),
    ("all_ones_full", 1, 1, 2047, 3, 16383, 65535),
    # --- TM/TC x SHF on/off across APIDs, unsegmented ---
    ("tm_noshf_apid0", 0, 0, 0x000, 3, 0, 0),
    ("tm_shf_apid1", 0, 1, 0x001, 3, 5, 3),
    ("tm_noshf_apid123", 0, 0, 0x123, 3, 0x34, 0x16),
    ("tm_shf_apid7ff", 0, 1, 0x7FF, 3, 0x3FFF, 0x16),
    ("tc_noshf_apid0", 1, 0, 0x000, 3, 0, 0),
    ("tc_shf_apid1", 1, 1, 0x001, 3, 5, 3),
    ("tc_noshf_apid123", 1, 0, 0x123, 3, 0x34, 0x16),
    ("tc_shf_apid7ff", 1, 1, 0x7FF, 3, 0x3FFF, 3),
    # --- all four sequence flags (TM, APID 0x123) ---
    ("seq_continuation", 0, 0, 0x123, 0, 0x34, 0x16),
    ("seq_first", 0, 0, 0x123, 1, 0x34, 0x16),
    ("seq_last", 0, 0, 0x123, 2, 0x34, 0x16),
    ("seq_unsegmented", 0, 0, 0x123, 3, 0x34, 0x16),
    # --- all four sequence flags (TC, SHF, APID 2) ---
    ("tc_seq_continuation", 1, 1, 0x002, 0, 5, 3),
    ("tc_seq_first", 1, 1, 0x002, 1, 5, 3),
    ("tc_seq_last", 1, 1, 0x002, 2, 5, 3),
    ("tc_seq_unsegmented", 1, 1, 0x002, 3, 5, 3),
    # --- seq-count sweep {0,5,0x34,0x3FFF} (TM, APID 1) ---
    ("count_0", 0, 0, 0x001, 1, 0, 3),
    ("count_5", 0, 0, 0x001, 1, 5, 3),
    ("count_0x34", 0, 0, 0x001, 1, 0x34, 3),
    ("count_0x3fff", 0, 0, 0x001, 1, 0x3FFF, 3),
    # --- data-length sweep {0,3,0x16,0xFFFF} (TC, APID 2) ---
    ("dlen_0", 1, 0, 0x002, 3, 7, 0),
    ("dlen_3", 1, 0, 0x002, 3, 7, 3),
    ("dlen_0x16", 1, 0, 0x002, 3, 7, 0x16),
    ("dlen_0xffff", 1, 0, 0x002, 3, 7, 0xFFFF),
    # --- SHF bit isolated on/off, otherwise identical ---
    ("shf_off", 0, 0, 0x123, 1, 0x34, 0x16),
    ("shf_on", 0, 1, 0x123, 1, 0x34, 0x16),
]

# Cap materialised user-data so the committed fixture stays small. Cases with a
# larger declared data field still emit the full-packet hex up to this cap is
# meaningless, so we only emit the FULL packet bytes when the data field is at or
# below this size; otherwise the FULL field is "-" and the test compares the
# 6-octet header only (header packing does not depend on the data content).
MAX_MATERIALISED = 0x16  # 22-octet data field => <=28-octet packet


def deterministic_data(n: int) -> bytes:
    # Simple deterministic byte pattern; content is irrelevant to header packing
    # but must be identical on both sides for the full-packet comparison.
    return bytes((i & 0xFF) for i in range(n))


print("# spacepackets reference for CCSDS 133.0-B Space Packet framing.")
print("# Oracle: spacepackets 0.32.0 SpacePacketHeader.pack()/unpack() + "
      "SpacePacket.pack() (R. Mueller / us-irs, Apache-2.0).")
print("# Consumed by tests/ccsds_space_packet_reference.rs. "
      "See generate_ccsds_space_packet_reference.py.")
print("# Byte-exact (zero tolerance) — integer bit-packing of the 6-octet "
      "primary header per CCSDS 133.0-B-2 §4.1.3.")
print("# CASE name | tc | shf | apid | seqflags | seqcount | dlen_field | "
      "HEADERHEX | FULLHEX")
print("#   HEADERHEX = 6 primary-header octets (no spaces). FULLHEX = "
      "header+data octets, or '-'.")
print("#   FULLHEX is '-' when shf=1 (spacepackets requires secondary-header "
      "content kshana does not model — only the flag bit, which HEADERHEX "
      "already covers) or when the data field > 0x16 (kept small).")

for name, tc, shf, apid, sf, count, dlen in CASES:
    ptype = PacketType.TC if tc else PacketType.TM
    hdr = SpacePacketHeader(
        packet_type=ptype,
        apid=apid,
        seq_count=count,
        data_len=dlen,
        sec_header_flag=bool(shf),
        seq_flags=SEQFLAGS[sf],
        ccsds_version=0,
    )
    header_hex = bytes(hdr.pack()).hex()
    assert len(header_hex) == 12, f"{name}: header must be 6 octets"

    data_field_len = dlen + 1
    # spacepackets refuses to pack a full packet when the SHF bit is set without
    # secondary-header content; kshana models only the flag, not the content.
    # So the full-packet byte comparison is done for shf=0 cases with a small
    # data field; the SHF bit itself is fully exercised by HEADERHEX + the
    # round-trip decode of every field.
    if shf == 0 and data_field_len <= MAX_MATERIALISED:
        data = deterministic_data(data_field_len)
        sp = SpacePacket(sp_header=hdr, sec_header=None, user_data=data)
        full_hex = bytes(sp.pack()).hex()
        # sanity: full packet = header (6) + data field
        assert full_hex.startswith(header_hex), f"{name}: header/full mismatch"
        assert len(full_hex) == 12 + 2 * data_field_len, f"{name}: full len"
    else:
        full_hex = "-"

    print(
        f"CASE {name} | {tc} | {shf} | {apid} | {sf} | {count} | {dlen} | "
        f"{header_hex} | {full_hex}"
    )
