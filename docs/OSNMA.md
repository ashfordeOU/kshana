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

This module implements the algorithms the documents below describe. The ICD text is
not reproduced; numeric values (field layouts, enumerations, the MAC look-up table) are
re-expressed in Kshana's own notation, with the source cited in the code. The ICD and
the Receiver Guidelines are © European Union; the source is acknowledged here. Kshana is not developed by, used by,
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
`service_not_usable`, `chain_mismatch`), or `discarded`. A dummy tag (COP 0) shows as
`authenticated` at tag level, since it proves the key, but it covers no navigation data
and never counts for a satellite.

Per satellite, in the form the receiver-trust monitor consumes:

* `Authenticated` only while the newest verified ephemeris and clock data (ADKD 0 or
  12) of that satellite is recent (within 600 s of the verifier's time by default) and
  is still the data in use. The check is on the data, not the IODnav: the verifier keeps
  the SHA-256 of the authenticated bit string (Word Types 1 to 5 as ADKD 0 covers them)
  and of the newest such string the satellite sends, and they must be equal. A copied
  IODnav over other words, or altered Word Type 5 bits (which carry no IODnav), reads
  `Unavailable` until the new data authenticates. Tags of another satellite (cross
  authentication) count for the satellite whose data they cover.
* `Failed` when a check on the satellite's data failed within the failure memory (600 s
  by default of the verifier's time), even if later data verifies. A mismatch is charged
  to the satellite whose data the tag covers and to the satellite that transmitted the
  tag, since either could be at fault; a MACSEQ mismatch is charged to the transmitting
  satellite.
* `Unavailable` otherwise, and for every satellite after a verified alert message, with
  NMA status "don't use" or a reserved status, and until the first key has verified.

The overall value is `Failed` if any satellite failed, `Authenticated` if at least one
is authenticated and none failed, otherwise `Unavailable`.
`$PKSOS,<A|F|N>[,<sat>:<A|F|N>...]` is the matching sentence;
`kshana::osnma::pksos_sentence` builds it.

## Time

The key chain shows that a key belongs to a given sub-frame, not that the sub-frame is
the present one. The verifier therefore never takes "now" from an unverified page.
Its time is the later of the reference time given with `set_reference_time`
(`--reference-time`) and the sub-frame of the latest TESLA key that verified (a key
cannot be known before its slot, so it proves the time is no earlier). Failure
memory, the validity window of an authentication and the eviction of old data run on
that time. A sub-frame stamped more than three sub-frames past the latest verified key
is set aside unless its own key proves its time; key and alert messages in it are still
processed, since they carry their own proof (a signature or the Merkle root).

The clock stands still when OSNMA stops, since only keys move it. A live caller must
call `set_reference_time` with host time every sub-frame; authentication then expires on
its own, and `poll_clock` (also run with every sub-frame) returns a `KeyStall` event once
no key has verified for longer than the authentication window.

What this does not give is freshness. Without a reference time from a source an
attacker cannot move, a replay of old authentic data under old stamps authenticates
and the page stamps are only as good as their source: the CLI says so
(`freshness: NOT enforced`) whenever no reference time is given. With a reference time
the tolerance is below one sub-frame (default 29 s; larger values are refused). A
reference time is a single instant: sub-frames further from it than the tolerance are
set aside and counted, so it suits live or just-recorded data, not a long recording.
For a recording, leave the reference time out and read the result as "authentic, not
necessarily fresh". The Receiver Guidelines give the formal requirement.

The page stamps of a u-blox stream come from the unauthenticated data itself (see
Input), so they provide no freshness protection either.

## Chains, keys and alerts

Verified chains are kept by chain id (CID); tags are checked with the chain the NMA
header names, and a header naming a chain that was not verified leaves the sub-frame's
tags unchecked (`chain_mismatch`). A second KROOT of a chain in force adds an anchor;
a KROOT of another chain is kept alongside, so announcing the old chain again after a
renewal does not undo the new one.

The NMA header is not authenticated, so what it announces counts only when confirmed:
when more than one satellite sends the same header in a sub-frame, or when a verified
KROOT's signed message carries it (the header is part of that message). A single
satellite's header changes nothing but its own sub-frame's tag checking. A KROOT whose
time of applicability is not later than that of the chain held for the same id (a replay
of an older one) is refused (`stale`); a KROOT of the same chain adds an anchor.

The confirmed header's status and CPKS value drive revocation. With NMA status "don't use",
CPKS "chain revoked" drops the chain the header names and refuses its KROOT from then
on; CPKS "public key revoked" drops the public key that signed that chain, and every
chain signed with it. The same CPKS values with status operational mark the transition
to the replacement and revoke nothing. The header is not itself authenticated, so a
forged revocation can only take authentication away, and it is final until the verifier
is restarted.

A DSM-PKR with NPKT 4 is the alert message; it is verified through the Merkle tree like
a key, its random NPK field being part of the leaf. A verified alert clears all chains
and public keys, refuses every later KROOT and public key, and makes every satellite
`Unavailable`, as the Receiver Guidelines direct, until the verifier is restarted.

A DSM-KROOT's padding field is a hash of the signed message and the signature. It is
checked before the signature, and it also says which NMA header the signed message was
built with when the header changed while the message was being assembled.

## What is not verified, or not exercised

* **Freshness.** See Time above: it needs a reference time from outside.
* **Renewal and revocation.** Chains and keys are followed as the streams of the
  published vectors exercise them (renewal, end of chain, chain and key revocation,
  new public key, new Merkle tree, alert), not every case the ICD allows. A revocation
  announced by the unauthenticated header is taken at its word and is final for the
  session. A new Merkle tree is picked up only through the Merkle root the verifier is
  given.
* **Merkle tree hash.** DSM-PKR messages are checked with a SHA-256 tree. A SHA3-256
  tree, which the ICD allows in future, is not supported. The chain hash function can
  be SHA-256 or SHA3-256.
* **Key status lists.** Revocation is followed through the NMA header and the messages
  in the stream; certificate revocation lists are not read.
* **Authenticated data coverage.** ADKD 4 with COP 1 sent in an odd sub-frame cannot
  authenticate (Word Type 10 may be sent one or two sub-frames earlier); this costs
  availability only, never correctness.
* **Constant-time operation.** Not provided and not needed: the verifier holds no
  secrets (public keys, published chain keys and received data only).
* **Signal and data quality.** Pages are CRC-checked and alert pages dropped, but
  nothing is known of the signal they arrived on. Reed-Solomon
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
  Signal id 0 (E1-C) carries no data, so accepting it alongside E1-B is harmless. A
  stray sync pair with an absurd length does not hold the reader back. The framing code
  is a third copy of the UBX framing in the tree (`src/realdata/ubx.rs`, the receiver-trust
  ingest); it is kept apart so that receiver-trust behaviour is unchanged, and the three
  could share one reader later. The word layout of an SFRBX message is taken from public
  descriptions and checked on synthetic frames only, not on a live receiver.

## Command line

```text
kshana osnma verify <input> [--format pages|vector-csv|ubx] [--start-gst SECONDS]
    [--merkle-root HEX] [--public-key ID:TYPE:HEX]
    [--reference-time SECONDS [--max-time-error SECONDS]] [--epochs] [--json]
```

Text output gives the status per satellite and, with `--epochs`, per tag and epoch;
`--json` gives the same with the tag list. Exit status 3 means a check on some
satellite's data failed, 2 means a usage or input error. The advisory above is printed
first on every path, errors and usage included.

## Tests and test data

Test data is synthetic and generated by Kshana's own code and tests. No ICD or
Guidelines vectors, worked examples or key material are stored in this repository.
The default tests (`tests/osnma_synthetic.rs` and the unit tests) build a chain, pages
and tags from the equations and check consistency and that deliberate corruption is
caught: a flipped navigation bit, a flipped key bit, replayed tags, wrong time stamps,
a time outside the reference, missing data, and the attacks the review found (a
spoofed far-future sub-frame that must not erase a failure, authentication that must
expire and follow the IODnav, an alert, NMA status "don't use", dummy tags, MACSEQ
mismatch, conflicting keys, chain revocation and renewal, a bad padding or signature),
with CMAC-AES, a SHA3-256 chain and a P-521 signature carried through the verifier.
Because that data comes from our own
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
runs: Merkle, signature, key chain, MACSEQ and tags. It asserts, per vector set, a
floor on the authenticated tags, none failed, which chains and keys the stream
announces, authenticated tags of ADKD 0, 4 and 12, that authentication resumes after
chain end, chain revocation, key revocation and new public key, that the alert
message verifies and leaves nothing authenticated, and that every vector uses only
HMAC-SHA-256, a SHA-256 chain, 128-bit keys, 40-bit tags and look-up entries 33 and 34.
Other algorithm and parameter choices of the ICD are therefore covered only by the
known-answer and synthetic tests above.

## Dependencies

RustCrypto crates, pure Rust, MIT OR Apache-2.0, built without default features:
`hmac`, `cmac`, `aes`, `sha3`, `p256` and `p521` (the `ecdsa` feature, used for
verification only), alongside `sha2` already in the tree. They build for
`wasm32-unknown-unknown` and pass `cargo deny`.
