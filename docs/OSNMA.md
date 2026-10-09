# Galileo OSNMA receiver-side verifier

Status: in development (0.35.0, workstream D). This page currently records the
reference documents and their terms; the verifier sections are added as the
implementation lands.

## Reference documents implemented against

All published by the European GNSS Service Centre (GSC), © European Union.

| Document | Version | Date |
|---|---|---|
| Galileo OSNMA Signal-in-Space ICD (SIS ICD) | Issue 1.1 | October 2023 |
| Galileo OSNMA Receiver Guidelines | Issue 1.3 | January 2024 |
| Annex B of the Receiver Guidelines: OSNMA test vectors (`Test_vectors.zip`) | as annexed to Issue 1.3 | n/a |

Both documents are listed as "in force" on the GSC OSNMA reference-documents page
(Initial Service declared operational 24 July 2025). Kshana does not copy or
redistribute the documents; it implements the algorithms they describe.

## Terms of the reference material

* The SIS ICD and the Receiver Guidelines may be reproduced or transmitted only
  with their "Terms of Use and Disclaimers" reproduced entirely and unmodified, and
  with the "© European Union" notice left on every page. Alteration is prohibited
  without written permission.
* The SIS ICD's Annex E is a non-exclusive, royalty-free authorisation for
  practising the ICD IPRs within a defined Field of Use. It is stated to be
  non-transferable and non-licensable.
* The test-vector archive carries a readme stating that it is an annex to the
  Receiver Guidelines and is covered by the Terms of Use and Disclaimers therein.

## Test vectors

The vectors are **not** stored in this repository. Tests that need them are
download-on-demand and opt-in (see the test section once added); the default test
run uses small vectors derived in-tree and needs no network.
