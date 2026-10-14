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
- SPK writer types 9/13, reader and OEM export (RM-30): every leg of 5059fd2 MET, kernels
  byte-identical to SPICE's; `src/spk_writer.rs`, `tests/spk_writer_spice_oracle.rs`,
  `xval/spk-writer-spice/RESULTS.md`. Pending ledger row: "SPICE SPK export (types 9 and 13)"
  (VALIDATED, Library basis, source "CSPICE N0067", test tests/spk_writer_spice_oracle.rs).
- CCSDS ADM AEM/APM (RM-29/CAP-24, attitude part): every L1/L2/L3 bar of 7a6a05f MET,
  L4 schema 15/15; one Orekit writer finding (P02 MAN_DELTA_MASS). `src/adm.rs`,
  `src/ndm_xml.rs`, `tests/adm_orekit_oracle.rs`, `xval/adm-orekit/RESULTS.md`. Pending ledger
  row: "CCSDS Attitude Data Messages (AEM, APM)" (VALIDATED, Library basis, source
  "Orekit 13.1.8", test tests/adm_orekit_oracle.rs).

## Handoff 1 (W46), remaining WP-08 work, in order
1. **ODM (RM-29, FUT-23, CAP-24)**: OMM KVN reader, OMM XML writer/reader, OPM 3.0 and OCM 3.0
   writer/reader (KVN, XML), against Orekit 13.1.8 parsers/writers + xmllint. No
   pre-registration exists yet: write `xval/odm-orekit/PREREGISTRATION.md` and commit it alone
   first. Keep `src/omm.rs`'s existing `to_omm_kvn` output byte-identical (it rounds to 4-8
   digits; add a new full-precision writer beside it rather than changing it). Scope OCM
   honestly (e.g. header, metadata, TRAJ, PHYS, COV, MAN, USER blocks; state what is out).
   Reuse `src/ndm_xml.rs` (XML reader/writer) and the KVN helpers pattern in `src/adm.rs`;
   reuse `xval/adm-orekit/AdmOracle.java` as the template for an ODM driver (it has the stub
   Earth for CENTER_NAME and the AccurateFormatter setup); `xval/ndm-xsd/validate.sh` already
   pins the OPM/OMM/OCM 3.0 schemas. ODM Blue Book: public.ccsds.org/Pubs/502x0b3e1.pdf.
2. **Telemetry schema 1.3 stream (FUT-04)** through promtool and the OTel Collector.
3. **Ledger rows + count sites, once, at the end** (rows listed above under W46 progress:
   Space Packet ext, SPK export, ADM; plus whatever ODM/telemetry add). Count sites via the
   repo's tests (`readme_headline_counts_match_the_matrix`, tests/readme_validation_counts_doc_sync.rs)
   and the generators; then a CHANGELOG entry.
4. Stretch: more SPK types (3, 21) — not started.

Tooling used here (all outside the repo): `bash xval/d8-orekit13/setup.sh` (Orekit 13.1.8);
a venv with spiceypy 8.3.0, ccsdspy 2.0.1, spacepackets 0.32.0; NAIF `naif0012.tls`;
`xmllint` is installed; javac/java present. Java prints a JAVA_TOOL_OPTIONS line on stderr.

## W48 progress
- ODM (RM-29/FUT-23/CAP-24): pre-registration cc6841da; code, cases and driver 2e4f9b30; run
  9dcfaa52. `src/odm.rs`, `tests/odm_orekit_oracle.rs`, `xval/odm-orekit/` (RESULTS.md). Every
  bar met except four pinned Orekit/convention findings; schema leg 14/14.
- Telemetry schema 1.3 (FUT-04): pre-registration fb226057; corpus and tests d9872223; run
  ed0e42fb. prometheus_client, OTLP proto, promtool 3.5.0 and the OTel Collector contrib
  0.135.0 all met (`xval/telemetry-1.3/RESULTS.md`).
- Ledger: four new VALIDATED rows (Space Packet extensions, SPK export, ADM, ODM) and the
  telemetry row widened; matrix 278 rows, 138 VALIDATED. Regenerated: docs/VERIFICATION-MATRIX.md,
  web/data/verification-matrix.json, the two validation figures; README count sites edited.
  Also regenerated: the provenance diagram (.mmd, mermaid-cli 11.4.2, tools/render-diagram.sh)
  and the count-bearing README images with `tools/gen_readme_assets.py` (only the 7 files that
  were already stale on the base changed). Not regenerated: the Studio copy
  `web/studio/data/verification-matrix.json` and the site pages `web/index.html`,
  `web/evidence.html`, `web/capabilities.*` (written by `web/tools/port_site.py` from a built
  site, not available here); they were already stale on the base (263 rows, 75 kinds), so
  `matrix_total_no_stale_count_doc_sync` and two `scenario_count_doc_sync` tests fail there as
  before. The Studio screenshot alt text in README.md (line 136) still describes 134 of 274.
