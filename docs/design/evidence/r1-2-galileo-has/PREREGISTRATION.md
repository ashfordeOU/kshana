<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Pre-registration R1.2: Galileo High Accuracy Service (HAS) decoding and PPP

**Status: proposed, committed before any engine code and before any data below is read.** The bars
become binding when the owner signs them. They may be tightened after a run, never loosened. A miss is
recorded in `RESULTS.md` with its numbers and pinned by a test that asserts the miss. Data is fetched by
script with its SHA-256 recorded in `RESULTS.md`, never vendored, unless stated. Advisory software, not
type-approved navigation equipment.

## Why this row

Galileo HAS broadcasts orbit, clock and bias corrections on E6-B. R1.2 adds the HAS decoder (page
layout, Reed–Solomon erasure decoding of the message, the correction blocks) into the same SSR
correction records as R1.1, and PPP with them.

## Sources and licences (checked before this pre-registration)

- **Galileo HAS SIS ICD 1.0.** Annex E grants a royalty-free covenant to use its technical data in
  products, including software, and allows reproducing the document only for non-commercial purposes
  and unamended. **Kshana implements from it; the ICD and its annex files (the Reed–Solomon generator
  matrix and the message decoding example) are not vendored**: tests fetch them from the GNSS service
  centre site and check their SHA-256.
- **HASlib** (open HAS decoder, EUPL-1.2), with its own test recordings: run as a separate program at a
  pinned commit; none of its code is vendored or ported.
- **Recorded HAS data:** Zenodo record 13784904 (CC BY 4.0, RINEX with a HAS file), used for B4 only if
  its HAS file format can be read as documented in the record; otherwise B4 is not assessable.
- **Not assessable:** the service centre's reference user algorithm and test vectors (registration,
  no stated licence), and decoders without a licence file.

## Bars (proposed)

- **B1** The ICD's Reed–Solomon decoding example (Annex C) and message decoding example (Annex D):
  every decoded byte and field equal.
- **B2** On HASlib's test recordings, every decoded correction (orbit, clock, code bias, phase bias,
  masks, validity, IODs) equals HASlib's output, within half a least-significant bit for scaled values,
  in every message.
- **B3** Messages that cannot be decoded (too few pages) are counted, never filled in.
- **B4** On the Zenodo data, kinematic PPP with HAS, after 30 min: 95th percentile horizontal error
  ≤ 20 cm and vertical ≤ 40 cm (the service definition document's targets), against the record's
  stated reference coordinates.

VALIDATED (decoding) only if B1 to B3 are met; the PPP accuracy claim needs B4. Otherwise MODELLED, and
the miss is published.
