# Pre-registration: CCSDS Space Packet secondary header, packet error control and segmentation

Committed alone, before any comparison of the engine against an oracle has been run. It fixes
what is built, which oracles judge it, the case set, the bars and what counts as a finding. The
bars are not loosened after a result has been seen; they may only be tightened.

## The capability under test (new, additive)

New functions and types in `src/space_packet.rs`, beside the existing primary-header framing.
`encode_packet`, `decode_packet` and the `space-packet` scenario kind keep their behaviour and
their output byte-for-byte (their unit tests, `tests/ccsds_space_packet_reference.rs` and any
golden stay unchanged).

1. **Secondary header** (CCSDS 133.0-B-2 §4.1.4.2): a time code field followed by an optional
   ancillary data field of user-defined length. The time code is one of the CCSDS 301.0-B-4
   codes, with the P-field either written explicitly in front of the T-field or implicit
   (fixed by the mission, not written):
   * **CUC** (§3.2): P-field `0 | time-code-id(3) | coarse octets − 1 (2) | fine octets (2)`,
     time-code id `001` (1958 January 1 epoch, TAI) or `010` (agency-defined epoch);
     1 to 4 coarse (basic time unit) octets and 0 to 3 fine (fractional) octets, big-endian.
     The extended (second-octet) P-field is out of scope and is refused.
   * **CDS** (§3.3): P-field `0 | 100 | epoch id (1) | day-segment length (1) | sub-ms (2)`;
     a 16- or 24-bit day count, a 32-bit millisecond-of-day, and no, a 16-bit microsecond or
     a 32-bit picosecond sub-millisecond segment, big-endian.
2. **Packet error control**: CRC-16 with polynomial 0x1021, initial value 0xFFFF, no
   reflection, no final XOR (catalogue name CRC-16/IBM-3740, also "CRC-16-CCITT-FALSE"; check
   value 0x29B1 over the ASCII octets `123456789`), computed over every octet of the packet
   from the first primary-header octet to the last octet before the field, and written as the
   last two octets of the packet data field, big-endian; the packet data length counts them.
   This is the packet error control of ECSS-E-ST-70-41C (PUS) and the same CRC as the frame
   error control field of CCSDS 132.0-B / 232.0-B. CCSDS 133.0-B itself leaves the content of
   the user data field to the user and defines no packet CRC; the documentation says so.
3. **Segmentation**: a user data unit split into packets of at most N user-data octets each,
   sequence flags first (01) / continuation (00) / last (10), or unsegmented (11) when it fits
   in one packet; consecutive packet sequence counts modulo 16384 (14-bit wrap). A reassembler
   rebuilds the unit and rejects a gap in the count, a count out of order, a repeated count, a
   continuation or last packet without a first, a first or unsegmented packet while a unit is
   open, an APID change, and a packet whose PEC does not check. CCSDS 133.0-B-2 does not
   define a segmentation service (the flags are carried for the user's segmentation); this is
   the conventional use of the flags, documented as such.

## Oracles (each run as a separate program, offline, output committed as a fixture)

* **ccsdspy 2.0.1** (BSD-3-Clause, Python): `FixedLength` / `VariableLength` packet
  definitions decode a Kshana-written packet stream; its own primary-header fields
  (`CCSDS_VERSION_NUMBER`, `CCSDS_PACKET_TYPE`, `CCSDS_SECONDARY_FLAG`, `CCSDS_SEQUENCE_FLAG`,
  `CCSDS_APID`, `CCSDS_SEQUENCE_COUNT`, `CCSDS_PACKET_LENGTH`), the secondary-header fields
  (P-field, coarse, fine, day, ms-of-day, sub-ms, ancillary octets), the user data and the
  16-bit PEC field as decoded integers/octets. `ccsdspy.utils.validate` on segmented streams
  (its sequence-count gap and order warnings). ccsdspy has no CRC support.
* **CPython `binascii.crc_hqx(data, 0xFFFF)`** (Python 3.13 standard library, C
  implementation): an independent CRC-16 recomputation of every PEC.
* **spacepackets 0.32.0** (Python, us-irs, Apache-2.0): `PusTm(...).pack()` PUS-C telemetry
  packets with a CDS-short time stamp and its CRC16 (computed with `fastcrc`), and
  `CdsShortTimestamp(days, ms).pack()` / `.unpack()`.
* **spacepackets 0.18.0** (Rust crate, us-irs, Apache-2.0), in a standalone driver under
  `xval/space-packet-ext/oracle-rs/` with its own Cargo.lock (no kshana dependency): `CucTime`
  (`new_generic`, `write_to_bytes`, `from_bytes`), `CdsTime<DaysLen16Bits|DaysLen24Bits>`
  (`new_with_u16_days` / `new_with_u24_days`, `set_submillis`, `write_to_bytes`,
  `from_bytes_with_u16_days` / `from_bytes_with_u24_days`) and `crc::CRC_CCITT_FALSE`.
  Note: spacepackets-rs and fastcrc both compute the CRC with the `crc` crate, so they count as
  one CRC implementation; `binascii.crc_hqx` is the second, independent one.

## Case set (fixed now)

* **CRC**: the messages `""`, `"123456789"`, `00`, `FF`, `00 00`, `FF FF`, `01 02 03 ... 40`
  (64 octets) and 256 octets `00..FF`; plus every PEC-carrying packet of the streams below.
* **Time codes** (each written by Kshana with an explicit P-field; each also written without):
  * CUC, epoch `001`, every (coarse octets 1..4) × (fine octets 0..3) = 16 formats, each with
    three values: all-zero, all-ones (maximum of each field), and a mid value
    (coarse 0x5A5A5A5A truncated to the width, fine 0xA5A5A5 truncated) = 48 cases;
  * CUC, epoch `010` (agency), formats (4,2) and (2,1), values as above = 6 cases;
  * CDS, epoch 1958, day length {16, 24} × sub-ms {none, µs, ps} = 6 formats, each with three
    values: zero; maximum (days 2^16−1 or 2^24−1, ms 86 399 999, µs 999, ps 999 999 999);
    and a mid value (days 23 000, ms 43 200 123, µs 456, ps 456 789 012) = 18 cases;
  * CDS, agency epoch, 16-bit days, µs, mid value = 1 case.
* **Packet streams** written by Kshana (one binary stream per APID):
  * APID 0x100, TM, CUC(4,2) explicit P-field, 4 ancillary octets, 16 user octets, PEC; 8
    packets, unsegmented, counts 0..7;
  * APID 0x101, TC, CDS(16-bit days, µs) implicit P-field, no ancillary, 10 user octets, PEC;
    6 packets, unsegmented, counts 100..105;
  * APID 0x102, TM, no time code, 3 ancillary octets, 5 user octets, no PEC; 4 packets;
  * APID 0x103, TM, segmented: one 1000-octet user data unit, at most 128 user octets per
    packet, CUC(4,0) implicit P-field secondary header, PEC; first count 16380 so the count
    wraps (16380..16383, 0..3; 8 packets);
  * APID 0x104, TM, segmented the same way without wrap (first count 0), and three corrupted
    copies of it: (a) the third packet dropped, (b) the fourth and fifth packets swapped,
    (c) the PEC of the second packet with one bit flipped.
* **PUS TM (written by spacepackets-py, the other direction)**: 4 packets, APID 0x0EF,
  service/subservice (17,2), (3,25), (1,1), (5,1), counts 0..3, message counters 0..3,
  destination id 0, CDS-short time stamps (days, ms) = (0,0), (23000, 43200123),
  (65535, 86399999), (21500, 1), source data of 0, 4, 9 and 32 octets.

## Bars (all exact; zero tolerance: these are integer bit-packings and a CRC)

1. **CRC**: Kshana's CRC equals `binascii.crc_hqx(msg, 0xFFFF)` and spacepackets-rs
   `CRC_CCITT_FALSE.checksum(msg)` for every message, and the check value `"123456789"` is
   0x29B1. For every PEC packet the stored PEC equals `crc_hqx` over the packet minus its last
   two octets. Mismatches: 0.
2. **Time codes vs spacepackets-rs**: for every CUC case with epoch `001` and every CDS case
   with the 1958 epoch, Kshana's explicit-P-field octets equal spacepackets-rs
   `write_to_bytes` octets, and the implicit form equals the same octets without the first
   (P-field) octet; spacepackets-rs `from_bytes` on Kshana's octets returns the same counter
   width, counter, fraction resolution and fraction counter (CUC) or days, ms of day,
   sub-millisecond precision and value (CDS). For CDS 16-bit days without sub-ms, the octets
   also equal spacepackets-py `CdsShortTimestamp(days, ms).pack()` and its `unpack` returns the
   days and ms. The agency-epoch cases are judged by bar 3 only (neither spacepackets library
   writes an agency-epoch P-field). Mismatched octets: 0.
3. **Streams vs ccsdspy**: for every packet of every stream above (uncorrupted), each
   primary-header field ccsdspy decodes equals the value Kshana was given (version 0, type,
   secondary-header flag 1 where a secondary header is written and 0 otherwise, APID, sequence
   flags, sequence count) and `CCSDS_PACKET_LENGTH` equals the packet length − 7; each
   secondary-header field, the ancillary octets, the user data octets and the PEC field equal
   Kshana's. For the segmented streams, the user data ccsdspy decodes, concatenated in stream
   order, equals the original 1000-octet unit. Mismatches: 0.
4. **Gap and order detection vs ccsdspy**: `ccsdspy.utils.validate` returns no sequence-count
   warning for the uncorrupted APID 0x104 stream and Kshana's reassembler accepts it; for
   corruption (a) ccsdspy warns of missing packets and for (b) of out-of-order counts, and
   Kshana rejects both. Corruption (c) is outside ccsdspy (no CRC) and is judged by bar 1:
   `crc_hqx` disagrees with the stored PEC and Kshana rejects it. (ccsdspy does not model the
   14-bit wrap, so the wrapping APID 0x103 stream is excluded from this bar in advance and
   judged by bars 1 and 3 only.)
5. **PUS TM vs spacepackets-py**: Kshana encodes each PUS packet as primary header (TM, SHF 1),
   a secondary header with no Kshana time code and the 14 PUS-C secondary-header octets
   (including the 7-octet CDS-short stamp) as ancillary data, the source data as user data,
   and a PEC; the result equals `PusTm.pack()` byte-for-byte. Kshana's decoder, given those
   oracle-written octets and the same format, checks the PEC and returns the same primary
   header, ancillary octets and source data. Mismatches: 0. (This judges the framing and the
   PEC, not PUS semantics: the PUS secondary header is opaque ancillary data to Kshana.)

## Decision rule

The capability is VALIDATED (secondary-header time codes, PEC, segmentation framing) if bars 1
to 5 all hold on the whole case set with zero mismatches. A bar that fails is a finding: it is
recorded with the case, the octets on both sides and the cause, pinned in the test as a
finding, and the part it covers stays MODELLED. Nothing in this file is edited to fit a result.

What counts as a finding: any mismatched octet or field; an oracle refusing to decode a packet
Kshana considers valid; Kshana refusing an oracle-written packet; a disagreement between
Kshana's reassembler and ccsdspy's warnings on cases (a) and (b), or an accepted stream (c).

Out of scope, stated now: the CUC extended P-field, CCSDS 301.0 ASCII and CCS time codes, the
leap-second semantics of the epochs (the code does no time-scale conversion), PUS service
semantics, and any conformance certification.
