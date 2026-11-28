<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Roughtime checks and vectors: `kshana roughtime`

Roughtime gives a client a signed, rough time from servers it identifies by their long-term
keys, and lets the client prove, with a malfeasance report, that one of them was wrong.
`kshana roughtime` checks Roughtime requests, responses and malfeasance reports against
RFC 10049, ships a vector set that implementers can run their own code against, and can query
a server whose address and key you give.

```
kshana roughtime vectors [<vectors.json> ...] [--json]
kshana roughtime check-request <request> [--public-key <base64>] [--tcp]
kshana roughtime check-response <request> <response> --public-key <base64> [--tcp] [--out <file.json>]
kshana roughtime check-report <report.json> [--out <file.json>]
kshana roughtime query <host:port> --public-key <base64> [--tcp] [--timeout-ms <n>] [--out <file.json>]
```

Packet files are read as raw bytes or as base64 text. Exit codes: 0 valid (or all vectors
pass), 1 invalid (or a vector fails), 2 a usage or input error. Only `query` uses the network,
and the tests never call it.

**Evidence: MODELLED.** A check says whether the given bytes satisfy the rules listed below.
It does not show that an implementation is correct in general. A valid response proves only
what RFC 10049 Section 5.4 says it proves.

## The source, checked

- **RFC 10049**, *Roughtime: A Protocol for Rough Time Synchronization*, W. Ladd and
  M. Dansarie, **Experimental**, October 2026 (<https://www.rfc-editor.org/rfc/rfc10049.html>,
  fetched 2026-11-28). The RFC Editor's record (<https://www.rfc-editor.org/rfc/rfc10049.json>)
  gives its draft as draft-ietf-ntp-roughtime-19.
- **Erratum 9238**, Technical, status *Reported* (not yet verified), 2026-10-25
  (<https://www.rfc-editor.org/errata/eid9238>). It reports two problems with the Appendix B
  example malfeasance report:
  - The example is signed with the pre-RFC context strings `RoughTime v1 delegation signature`
    and `RoughTime v1 response signature` (capital T). Sections 5.2.1 and 5.2.6 specify
    `Roughtime v1 ...`.
  - In the example's data, the **first** response contradicts the other two. The text names
    the third server.

  The erratum gives a replacement example signed with the RFC's strings. kshana's checks
  confirm both points: they reproduce the signatures, the Merkle roots, the nonce chain and the
  MIDP values of both reports.

## What is checked

| Section | Rule | Code |
|---|---|---|
| 5 | packet magic `ROUGHTIM`; the length field matches the message | `packet.magic`, `packet.length`, `packet.short` |
| 4.2, 4.1.3 | header fits; offsets are multiples of four, ascending and in range; tags strictly ascending (so no tag appears twice); a tag is 1-4 capital letters, then zero octets | `message.*` |
| 5.1 | VER, NONC and TYPE present; TYPE 0 | `request.missing-*`, `request.type-not-zero` |
| 5.1.1 | 1-32 versions, ascending, no repeats | `request.ver-count`, `request.ver-not-sorted`, `request.ver-length` |
| 5.1.2 | 32-byte nonce | `request.nonce-length` |
| 5.1.4 | SRV = H(0xff ‖ key) when a key is given | `request.srv-not-key`, `request.srv-length` |
| 5.1.5 | ZZZZ all zero | `request.zzzz-not-zero` |
| 5.1 (SHOULD) | at least 1024 bytes over UDP; SRV included | warnings `request.shorter-than-1024`, `request.no-srv` |
| 5.2 | SIG, NONC, TYPE, PATH, SREP, CERT, INDX present; SREP holds VER, RADI, MIDP, VERS, ROOT; CERT holds SIG and DELE; DELE holds PUBK, MINT, MAXT | `response.missing-*` |
| 5.2.2, 5.2.3 | the request's nonce; TYPE 1 | `response.nonce-mismatch`, `response.type-not-one` |
| 5.2.4 | PATH a multiple of 32 bytes, at most 32 hashes | `response.path-length` |
| 5.2.5 | RADI not zero; VER in VERS; VERS ascending, at most 32; VER one the client offered (SHOULD) | `response.radi-zero`, `response.ver-not-in-vers`, `response.vers-not-sorted`, warning `response.ver-not-offered` |
| 5.2.6, 5.4 | DELE signed with the long-term key, SREP with PUBK, each over its context string; MINT ≤ MIDP ≤ MAXT | `response.cert-signature`, `response.srep-signature`, `response.midp-outside-delegation` |
| 5.3.1 | root from H(0x00 ‖ request), PATH and INDX; no INDX bits left over | `response.merkle-root` |
| 9.7 | the response is no larger than the request | `response.larger-than-request` |
| 7 | undefined tags are ignored | (no code) |
| 8.2, 8.4.1 | every response in a report is valid; NONC_i = H(response_{i−1} ‖ rand_i); pairs with MIDP_i − RADI_i > MIDP_j + RADI_j (i received first) | `report.response-invalid`, `report.nonce-chain`; `inconsistent_pairs`, `proves_inconsistency` |

For each response, the result also reports `legacy_context_signatures`: whether both
signatures verify with the pre-RFC strings. This is a diagnostic for implementations and
examples that predate the RFC. It never makes a response valid.

## The vectors

`data/conformance/roughtime/roughtime-vectors.json` (`kshana.roughtime-vectors/1`, 42 vectors)
comes from `gen_roughtime_vectors.py`, which uses Python with the `cryptography` package and
does not depend on the Rust checker. Each vector has:

- `id`, `kind` (`request`, `response` or `report`) and `status`;
- `source` (URL and section), `transport`;
- `request` and `response` (base64 packets), `public_key`, or a `report`;
- `expect`.

A checker passes a vector when every key under `expect` matches its own result. `warnings`
are compared only when the vector lists them.

The vectors fall into three groups:

- **`synthetic` (34).**
  - 17 request vectors: one valid, and the short-request and missing-SRV warnings, plus one
    defect per vector for TYPE, a missing NONC, nonce length, version order, repeats and
    count, ZZZZ, SRV, tag order, offset alignment, a duplicate tag, magic and length.
  - 17 response vectors: one valid exchange through a four-leaf Merkle tree at index 2, a
    VER the client did not offer, an undefined tag, and one defect per vector for each
    signature, the wrong long-term key, MINT and MAXT, INDX, leftover INDX bits, PATH length,
    nonce, TYPE, RADI, VERS, a missing CERT and the response size.

  The keys come from the SHA-256 of fixed labels.
- **`rfc-example` (4).** The Appendix B report as published, and its three responses. With
  the RFC's strings, each response fails both signature checks. The report shows a nonce chain
  that holds, legacy signatures that verify, and inconsistent pairs (1,2) and (1,3), counted
  from 1.
- **`errata-reported` (4).** The replacement from erratum 9238, and its three responses. All
  three are valid, the chain holds, the pairs are (1,3) and (2,3), and the report proves the
  inconsistency.

The two RFC-derived reports are reproduced from RFC 10049 and its erratum. Code components of
RFCs are under the Revised BSD License (IETF Trust Legal Provisions, Section 4.e).

## Client

`query` builds a version-1 request: a random nonce, SRV for the key, and ZZZZ padding to a
1024-byte message. It sends the request over UDP (or TCP with `--tcp`), waits for the timeout
(5 s by default), and checks the response. The result gives:

- the findings;
- the local send and receive times and the round trip;
- MIDP minus the local midpoint;
- the request and response in the RFC 8.4.1 response-object form, so several queries can be
  assembled into a report for `check-report`.

A single query is not the measurement sequence of Section 8.2. That sequence needs at least
three servers, queried twice, with chained nonces.

Tests: `tests/roughtime.rs` and the unit test in `src/roughtime.rs`.
