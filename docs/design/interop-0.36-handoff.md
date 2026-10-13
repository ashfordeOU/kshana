# WP-08 / FUT-26 / CAP-34 / FUT-28 handoff (work in progress)

Branch `feat/interop-api-0.36`, base release/0.36.0-rc @ c9e37402. Stopped early at the project
session limit. Nothing here has been compared against an oracle yet; no ledger row has changed.

## Pre-registrations committed (each alone, before any comparison run)
- 003ef3e `xval/space-packet-ext/PREREGISTRATION.md`: Space Packet secondary header, packet error control, segmentation.
- 7a6a05f `xval/adm-orekit/PREREGISTRATION.md`: CCSDS AEM/APM against Orekit 13.1.8.
- 5059fd2 `xval/spk-writer-spice/PREREGISTRATION.md`: SPK type 9/13 writer and reader against CSPICE (spiceypy).

## Half-done
- `src/space_packet.rs` (129d21e): secondary header, PEC CRC and segmentation code, partial; not yet compiled or tested. Existing primary-header output must stay byte-identical.
- `src/sweep.rs`, `src/api.rs` (bda9144): sweep-nd dynamic units resolver, partial; not compiled. Next: units block, remove sweep-nd from UNCOVERED_KINDS, ceiling 0 in tests/field_units_global.rs; check that no golden covering sweep-nd moves.

## Not started
- ODM: OMM KVN reader, OPM, OCM, XML (RM-29, FUT-23). ADM code (the AEM/APM pre-registration exists, no module yet).
- SPK writer code (the pre-registration exists).
- Telemetry schema 1.3 oracle stream (FUT-04).
- NumPy RunOutput and typed Python API (FUT-26/CAP-34). Note that ci.yml already mentions RunOutput (csv/write_csv) and stubtest.

## Notes for the next worker
- Orekit 13.1.8 toolchain: `bash xval/d8-orekit13/setup.sh`. Python oracles: `pip install spiceypy ccsdspy prometheus_client spacepackets`.
- Hot files untouched: src/verification.rs, CHANGELOG.md, README*, generated artifacts.

## W46 progress
- Sweep-nd partial reverted (a0db7358): FUT-28 was finished on feat/platform-vv-0.36 (8c3705e2).
- Space Packet extension (FUT-23): bars 1-5 of 003ef3e all MET; `tests/space_packet_ext_oracle.rs`,
  `xval/space-packet-ext/RESULTS.md`.
- Ledger rows are held back and added once, with the count sites, at the end of WP-08 (one
  count bump instead of one per item). Pending rows: "CCSDS Space Packet secondary header,
  packet error control and segmentation" (VALIDATED, ExternalDataset; OracleBasisEntry Library,
  source "ccsdspy 2.0.1", test tests/space_packet_ext_oracle.rs), inserted after the
  "CCSDS Space Packet (133.0) TM/TC framing" row.
