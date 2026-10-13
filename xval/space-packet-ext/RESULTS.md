# Results: Space Packet secondary header, packet error control and segmentation

Pre-registration: `PREREGISTRATION.md` (003ef3eb), committed alone before any comparison.
Judged by `tests/space_packet_ext_oracle.rs`; fixtures in `tests/fixtures/space_packet_ext/`.

## Reproduce

```sh
python3 -m venv /tmp/sp && /tmp/sp/bin/pip install -r xval/space-packet-ext/requirements.txt
F=$PWD/tests/fixtures/space_packet_ext
python3 -I xval/space-packet-ext/make_cases.py "$F"            # the case list (inputs/)
KSHANA_XVAL_WRITE=1 cargo test --test space_packet_ext_oracle kshana_side   # Kshana's octets (kshana/)
/tmp/sp/bin/python -I xval/space-packet-ext/oracle.py "$F"      # ccsdspy, crc_hqx, spacepackets-py
(cd xval/space-packet-ext/oracle-rs && cargo run --release -- "$F")   # spacepackets-rs 0.18.0
cargo test --test space_packet_ext_oracle
```

Oracle versions: ccsdspy 2.0.1 (BSD-3-Clause), CPython 3.13 `binascii.crc_hqx`, spacepackets-py
0.32.0 (Apache-2.0, with fastcrc 0.3.6), spacepackets-rs 0.18.0 (Apache-2.0, own `Cargo.lock`).
None is GPL; nothing is vendored.

## Outcome (first run, 2026-10-13): all five bars MET, zero mismatches

| Bar | Cases | Result |
|---|---|---|
| 1 CRC | 8 messages vs crc_hqx and spacepackets-rs; check value 0x29B1; 53 PEC fields of the Kshana streams and 4 of the PUS packets vs crc_hqx | 0 mismatches; the flipped bit of corruption (c) is caught by crc_hqx and by Kshana |
| 2 Time codes | 66 CCSDS-epoch cases (48 CUC, 18 CDS), explicit and implicit P-field, vs spacepackets-rs write and read; 3 CDS-short cases also vs spacepackets-py pack/unpack | 0 mismatched octets or fields |
| 3 Streams | 34 packets in 5 streams decoded by ccsdspy (primary header, P-field, coarse/fine, CDS fields, ancillary, user data, PEC); both 1000-octet segmented units rebuilt from ccsdspy's user data | 0 mismatches |
| 4 Gap/order | APID 0x104 clean, (a) dropped packet, (b) swapped packets | ccsdspy: no warning / "Missing packets" / "out of order"; Kshana: accepts / rejects / rejects |
| 5 PUS TM | 4 spacepackets-py `PusTm` packets | byte-identical to Kshana's encoding; Kshana decodes them with the PEC checked |

Observation (not a bar): on the swapped stream (b) Kshana judges packet by packet and stops at the
first anomaly, reporting count 4 after 2 as a gap; ccsdspy, seeing the whole file, reports the
counts as out of order. Both reject the stream, which is what bar 4 judges; the test pins
Kshana's exact message.

Agency-epoch cases (7) are outside both spacepackets libraries, as pre-registered; they are
covered by bar 3 only to the extent a stream uses them (none does), so they rest on the unit
tests, not on an oracle.
