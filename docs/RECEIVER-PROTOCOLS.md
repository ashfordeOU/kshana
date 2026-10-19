# Receiver protocols read by receiver-trust (0.38)

Read only, throughout: nothing here writes a byte to a receiver, and there is no transmit path of any
kind. Advisory software, not type-approved navigation equipment (IEC 61108, IEC 61162): the operator
remains responsible.

## The receiver's own spoofing and jamming flags (UBX)

| message | field | read as |
|---|---|---|
| UBX-NAV-STATUS (0x01 0x03), 16 bytes | `flags2` byte at offset 7, bits 4..3: `spoofDetState` | 0 unknown or deactivated, 1 no spoofing indicated, 2 spoofing indicated, 3 multiple spoofing indications (protocol 18 and later; u-blox F9 HPG 1.32 interface description, section 3.15.20) |
| UBX-SEC-SIG (0x27 0x09) version 1, 12 bytes | `jamFlags` at 4 (bit 0 jamDetEnabled, bits 2..1 jammingState); `spfFlags` at 8 (bit 0 spfDetEnabled, bits 3..1 spoofingState) | states are read only where the detector is enabled; 0 unknown, 1 none, 2 warning or indicated, 3 critical or affirmed |
| UBX-SEC-SIG version 2 | `sigSecFlags` at 1 (bit 0 jamDetEnabled, bits 2..1 jammingState, bit 3 spfDetEnabled, bits 6..4 spoofingState); `jamNumCentFreqs` at 3 and that many 4-byte groups (not used) | as above |

**Source of the SEC-SIG layout.** The u-blox F9 HPG 1.32 and M10 SPG 5.10 interface descriptions that
could be downloaded when this was written name UBX-SEC-SIG but do not define it. The layouts above are
those of the later u-blox interface descriptions as transcribed in the pyubx2 library
(BSD-3-Clause, `SEC-SIG-V1` and `SEC-SIG-V2`); the fixture tests in
`tests/receiver_trust_self_report.rs` are built from that layout, not from a real receiver's output.
Layout from open transcription, not checked against the current vendor guide: check it against the current u-blox interface description before relying on SEC-SIG.

A SEC-SIG has no time of week; it belongs to the current navigation epoch. A state already read at an
epoch is kept unless a later one is worse.

### The `receiver-self-report` comparison

Where a log carries these flags, every epoch of the result has `self_report` (the two states, whether the
receiver flags, whether any Kshana monitor alarmed, and `agreement`: `both`, `receiver-only`,
`kshana-only`, `neither`, or `calibrating`), and the result has `receiver_self_report` with the counts and
the first epoch of each. The receiver "flags" at a state of 2 or more. It **raises no alarm and changes no
score**, and neither side is ground truth: agreement is not validation, and a disagreement says one
detector saw something the other did not, nothing about which was right. Studio's strip reads
`epochs[].self_report`.

## Septentrio SBF (`format = "sbf"`)

`receiver_trust::ingest::read_sbf` decodes with the `sbf-tools` crate (0.4, **MIT**; its only dependency
is `thiserror`; a permissive licence that `deny.toml` allows). Blocks read: PVTGeodetic (4007) for the fix,
MeasEpoch (4027) for C/N0 per satellite and signal (`band` is the signal's name, such as `L1CA`), and
RFStatus (4092) for the number of RF bands whose `Info` byte is non-zero (`rf_bands_reported`, carried and
**not interpreted**: it never counts as a flag). Epochs are keyed by time of week and week number and
labelled in GPS time (`2024-09-05T00:00:00.000 GPST`). A block failing its CRC or parse counts as a
skipped record. This reader does not read AGC or a jamming indicator, so the C/N0-drop and loss-of-lock monitors run
and the AGC and jamming-indicator monitors do not.

**Source of the layouts.** Septentrio's reference guide could not be downloaded when this was written (the
server refused the request), so the layouts were taken from the `sbf-tools` source, which cites the guide,
and the fixtures in `tests/receiver_trust_sbf.rs` are synthetic blocks built to that layout and its
CRC-16-CCITT. No real SBF log was used. Layout from the open-source crate, not checked against the current vendor guide: check against Septentrio's reference guide before relying on it.

## Direct serial and USB input (`receiver-trust live --serial`)

```text
kshana receiver-trust live session.toml --serial /dev/ttyUSB0 --baud 4800 [--gate ...]
```

Unix only. It opens the device for reading, sets the **local** line to raw mode at `--baud` (default
4800, the NMEA 0183 rate), and reads NMEA lines like any other source. It never writes to the receiver.
`--configure` is refused with an explanation: Kshana does not configure receivers; set the receiver to
output NMEA with the maker's own tool, then read it. The feed is NMEA, as for every `live` source (UBX
and SBF are read from files). A device that goes away ends the command as a fault (exit 1), for a
supervisor to restart; the layer does not reconnect. Tested on a pseudo-terminal loopback
(`tests/receiver_trust_live_serial.rs`), including that the master side receives no byte from the command.
