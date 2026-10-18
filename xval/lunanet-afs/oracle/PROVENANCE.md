<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Provenance of the AFS code tables

- Document: LunaNet Signal-In-Space Recommended Standard, Augmented Forward Signal (LSIS-AFS),
  Volume A, Version 1.0, 29 January 2025; Applicable Document 1 of LNIS V5. NASA.
- Retrieved 2026-10-18 from
  <https://www.nasa.gov/wp-content/uploads/2025/02/lunanet-signal-in-space-recommended-standard-augmented-forward-signal-vol-a.pdf>
  (10,985,360 bytes), SHA-256 `986e07959f527d24280d87b5477298424ffdf754c4625f08041b5749592e61b6`.
- Licence: a US Government publication on NASA's site with no use restriction stated in the
  document. Only the code-defining constants and the printed chip checks are reproduced, not
  prose; the PDF itself is not vendored. If NASA's terms are read differently, delete this folder
  and the tests that read it and report it.
- The tables are marked {LSIS-TBC} by the document. See `../PREREGISTRATION.md`.
- Extracted by `scripts/extract_lunanet_afs_tables.py` from `pdftotext -layout` output. The text
  layer has defects, listed in `EXTRACTION-NOTES.txt`: three hex cells of Table E-5 lost a leading
  zero (zero-padded back), and Table D-2 prints PRN 38 as `3` (PRNs are assigned by table order).
