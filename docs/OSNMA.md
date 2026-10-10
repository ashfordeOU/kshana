# Galileo OSNMA receiver-side verifier

A receiver-side verifier for Galileo Open Service Navigation Message Authentication
(OSNMA), in pure Rust. It reads I/NAV pages and reports, per satellite and per epoch,
whether the navigation data is cryptographically authenticated, and why a check failed.

> **Advisory.** This is analysis and monitoring output and not type-approved navigation
> equipment. The authentication status reported here is not a navigation integrity
> service and must not be the sole basis for any navigation or safety decision.

## NOTICE: intellectual property in the Galileo OSNMA interface

Kshana grants no rights under the intellectual property of the European Union in the
Galileo OSNMA Signal-in-Space Interface Control Document (the "ICD IPRs"). The ICD
carries its own authorisation (its Annex E), which is non-exclusive and royalty-free
and has its own terms, scope and limits. Anyone who uses, builds or distributes
software based on this module relies on that authorisation directly and must read and
accept its terms themselves. Kshana's licence (AGPL-3.0-only, or the commercial
licence) covers Kshana's own code only.

This module implements the algorithms the documents below describe. It does not
reproduce their text or tables. The ICD and the Receiver Guidelines are © European
Union; the source is acknowledged here. Kshana is not developed by, used by,
approved by or endorsed by the European Union, the European Commission, EUSPA or any
other body.

## Reference documents

Published by the European GNSS Service Centre.

| Document | Version | Date |
|---|---|---|
| Galileo OSNMA Signal-in-Space ICD ("SIS ICD") | Issue 1.1 | October 2023 |
| Galileo OSNMA Receiver Guidelines | Issue 1.3 | January 2024 |

Section and table numbers cited in the code and here refer to those versions.

## What is verified

The chain of trust, from the root down to the data:

1. **Public key (ICD 3.2.2, 6.2).** A DSM-PKR is reassembled from its blocks and its
   Merkle path is walked to a trusted Merkle root (SHA-256).
2. **KROOT (ICD 3.2.3, 6.3).** A DSM-KROOT is reassembled; its ECDSA signature
   (P-256/SHA-256 or P-521/SHA-512) is checked against the public key it names, over
   the NMA header and the chain parameters.
3. **TESLA keys (ICD 5.5, 6.4).** Each key in a MACK message is walked back to the
   KROOT or to an earlier verified key, with the chain's hash function.
4. **MACSEQ (ICD 4.1.2, 6.6).** The flexible Tag-Info fields are checked against the
   MACSEQ with the key that opens that MACK.
5. **Tags (ICD 4.2, 6.7).** Each tag is recomputed (HMAC-SHA-256 or CMAC-AES, truncated
   to the chain's tag length) over the satellite identities, the sub-frame time, the
   tag position, the NMA status and the navigation data it covers, and compared.
   ADKD 0 (ephemeris, clock and status), ADKD 4 (timing parameters) and ADKD 12 (slow
   MAC, key published ten sub-frames later) are handled, with cross-authentication of
   satellites that do not themselves carry OSNMA, and dummy tags (COP 0).

A tag that names a reserved value, or whose ADKD does not match the MAC look-up table
slot, is set aside (the Receiver Guidelines say to discard it) and reported as
`discarded`, not as a failure.

Pages are checked against their CRC (the Galileo CRC-24Q) before anything else; a page
that fails is dropped and reported (`bad_crc`).

## Status values

Per tag: `authenticated`, `failed` with a reason (`tag_mismatch`, `macseq_mismatch`,
`key_chain_mismatch`, `key_conflict`), `pending` with a reason (`no_chain`,
`awaiting_key`, `no_nav_data`, `unknown_maclt`, `unsupported_function`,
`service_not_usable`), or `discarded`.

Per satellite, in the form the receiver-trust monitor consumes: `Authenticated`,
`Failed` (a check on that satellite's data failed within the failure memory, 600 s by
default, even if later data verifies) or `Unavailable`. The overall value is `Failed`
if any satellite failed, `Authenticated` if at least one is authenticated and none
failed, otherwise `Unavailable`. `$PKSOS,<A|F|N>[,<sat>:<A|F|N>...]` is the matching
sentence; `kshana::osnma::pksos_sentence` builds it.

## What is not verified, or not exercised

* **Time.** Every check is relative to the time stamps of the pages given to the
  verifier. The key chain shows that a key belongs to a given sub-frame, not that the
  sub-frame is the present one: an attacker who can move the receiver's clock, or
  replay old authentic data under old time stamps, defeats freshness. Use time that
  such an attacker cannot move, or give the verifier one with `set_reference_time` and
  `max_time_error_s` (`--reference-time`, `--max-time-error` on the CLI), and treat
  the result accordingly. The Receiver Guidelines give the formal requirement.
* **Renewal and revocation.** The verifier follows a change of chain or public key
  as the streams of the published vectors exercise it. It does not implement every
  case the ICD allows, and a chain renewal replaces the chain in force rather than
  running two in parallel.
* **Merkle tree hash.** DSM-PKR messages are checked with a SHA-256 tree. A SHA3-256
  tree, which the ICD allows in future, is not supported. The chain hash function can
  be SHA-256 or SHA3-256.
* **Key status lists.** Revocation is followed through the NMA status and the messages
  in the stream; certificate revocation lists are not read.
* **Signal and data quality.** Pages are taken as already CRC-checked. Reed-Solomon
  recovery of I/NAV words 1 to 4 is not used: data must be received directly.
* **Not a position integrity service.** Authentication says the data came from the
  system. It says nothing about the signal it arrived on or the quality of the fix.

## Input

* **Plain page format.** One page pair per line: `<svid> <gst_seconds> <60 hex digits>`,
  `#` comments allowed. `gst_seconds` is GST in seconds (`week * 604800 + time of
  week`) at the start of the page; the hex is the 240 bits of the even and odd halves
  (tails included), most significant bit first.
* **Test-vector CSV.** The layout of the published vectors (`SVID,NumNavBits,NavBitsHEX`).
  The start time comes from `--start-gst` or from a dated file name.
* **u-blox UBX-RXM-SFRBX.** A raw UBX byte stream (`--format ubx`, detected
  automatically). Galileo E1-B I/NAV messages are rebuilt into page pairs (`src/osnma/ubx.rs`);
  other systems, E5b, alert pages and frames with a bad checksum are ignored. SFRBX carries
  no time, so each page is stamped from the time inside its own data (word types 5 and 0)
  and accepted only if consecutive time-bearing pages agree with the number of pages
  received between them; pages that cannot be placed are dropped, never guessed. That
  time comes from the data itself and gives no freshness protection (see Time above).

## Command line

```text
kshana osnma verify <input> [--format pages|vector-csv|ubx] [--start-gst SECONDS]
    [--merkle-root HEX] [--public-key ID:TYPE:HEX]
    [--reference-time SECONDS --max-time-error SECONDS] [--epochs] [--json]
```

Text output gives the status per satellite and, with `--epochs`, per tag and epoch;
`--json` gives the same with the tag list. Exit status 3 means a check on some
satellite's data failed. The advisory above is printed with every result.

## Tests and test data

Test data is synthetic and generated by Kshana's own code and tests. No ICD or
Guidelines vectors, worked examples or key material are stored in this repository.
The default tests (`tests/osnma_synthetic.rs` and the unit tests) build a chain, pages
and tags from the equations and check consistency and that deliberate corruption is
caught: a flipped navigation bit, a flipped key bit, replayed tags, wrong time stamps,
a time outside the reference, missing data. Because that data comes from our own
reading of the ICD, it shows self-consistency, not conformance.

The primitives are checked against published known-answer tests, none taken from the
ICD: RFC 4231 (HMAC-SHA-256), RFC 4493 (CMAC-AES-128), FIPS 197 (AES), FIPS 202
(SHA3-256) and RFC 6979 (ECDSA P-256). P-521 signatures are checked for encoding and
hash selection with a throwaway key made in the test; the curve arithmetic is the
library's.

Conformance is checked by `tests/osnma_official_vectors.rs`, which is opt-in: it reads a
copy of the official test-vector archive that you download yourself, from the
directory named by `KSHANA_OSNMA_VECTORS`, and does nothing when the variable is unset.
It stores and redistributes nothing, and default test runs use no network. It gives the
verifier only a Merkle root and the public keys of one tree, as a receiver would have,
so chains are established from the signed DSM-KROOT in the stream and the whole path
runs: Merkle, signature, key chain, MACSEQ and tags.

## Dependencies

RustCrypto crates, pure Rust, MIT OR Apache-2.0, built without default features:
`hmac`, `cmac`, `aes`, `sha3`, `p256` and `p521` (the `ecdsa` feature, used for
verification only), alongside `sha2` already in the tree. They build for
`wasm32-unknown-unknown` and pass `cargo deny`.
