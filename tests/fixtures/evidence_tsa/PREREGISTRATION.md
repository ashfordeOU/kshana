# Pre-registration: RFC 3161 timestamp-token verification against OpenSSL (CAP-14)

Committed alone, before any Kshana verification code exists and before the OpenSSL verdicts are
regenerated. The `openssl-verdicts.txt` committed in 5d505ada was produced before this
pre-registration existed; it is NOT evidence and is overwritten by the fresh run described below.

## What is compared

Kshana's RFC 3161 verifier (to be written: a function taking a token, the stamped data, trusted
anchor certificates and optional untrusted certificates, returning PASS or FAIL with a reason), against
OpenSSL 3.0.13 as the oracle, run by `tests/fixtures/evidence_tsa/run_openssl.sh` exactly as
committed in 5d505ada:

* oracle `ts`: `openssl ts -verify -in TOKEN -data DATA -CAfile ANCHORS [-untrusted U] -attime T`;
* oracle `cms` (RSA-PSS tokens, which `openssl ts -verify` cannot check): `openssl cms -verify -cades
  -purpose timestampsign` and the TSTInfo message imprint equal to the SHA-256 of DATA;
* `T` is the token's genTime, so certificate validity is judged at the time the authority stated.

Kshana's verifier judges the same things: the signed attributes' message digest over the TSTInfo, the
signature (RSA PKCS#1 v1.5, RSA-PSS, ECDSA P-256 and P-384), the ESS signing-certificate (v1 or v2)
hash naming the signer certificate, the signer certificate's critical timeStamping extended key
usage, the chain from the signer to a trusted anchor with each certificate's signature and its
validity at genTime, and the message imprint against the data.

## Cases (fixed now)

The 27 cases of `tests/fixtures/evidence_tsa/cases.tsv` as committed in 5d505ada (G01 to G10, T01 to
T07, W01 to W04, X01, E01, E02, D01 to D03), on the committed tokens, certificates and data. No case
is added, removed or changed after this commit.

## Procedure

1. After this commit, run `run_openssl.sh` fresh; commit the new `openssl-verdicts.txt` on its own.
2. Then write the verifier and a test that compares it with that file.

## Bars (fixed now)

* B1: the PASS/FAIL verdict agrees with OpenSSL's on every one of the 27 cases.
* B2: the genTime Kshana reads agrees with the one OpenSSL reports, to the second, on every case.
* Reasons are reported side by side and not scored (the two implementations word them differently).

## Ledger status rule (fixed now)

VALIDATED, with the scope stated narrowly (these 27 self-generated cases; OpenSSL as an independent
implementation, which also made the fixtures), only if B1 and B2 both pass. Otherwise MODELLED, with
every disagreement recorded here with its case and both verdicts. A miss is not tuned away: the
verifier may be fixed only for a defect that is identified and described, and the fix and the rerun
are recorded here.

## Recorded run (2026-10-12)

1. `run_openssl.sh` was re-run after this file was committed (30ad70b2), with OpenSSL 3.0.13. Its
   output is byte-identical to the `openssl-verdicts.txt` of 5d505ada, so no new file was committed.
2. The verifier, `src/evidence/tsa.rs` (`kshana::evidence::tsa::verify_token`), was then written and
   compared by `tests/evidence_tsa_openssl.rs::every_case_agrees_with_openssl`, first run:
   * B1 met: all 27 verdicts agree (10 PASS, 17 FAIL on both sides).
   * B2 met: the genTime agrees to the second on all 27 cases.
   * Reasons (not scored) also coincide on every case. Disclosure: the oracle's verdict file, with its
     reasons, was in the repository while the verifier was written, and the verifier's reason wording
     was chosen to follow OpenSSL's; the verdicts themselves come from the checks, not the file.

Per the status rule above: VALIDATED, with the scope stated narrowly (these 27 self-generated cases,
against OpenSSL, which also made the fixtures).
