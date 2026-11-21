<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Transparency-log verification: `kshana tlog`

`kshana tlog` checks, offline, what a transparency log of evidence records states about itself:

- that an entry is in the log (an inclusion proof);
- that a later state of the log extends an earlier one (a consistency proof);
- that a signed tree head matches the log's entries;
- that a daily root is anchored by RFC 3161 timestamps;
- that the log's signing keys form an unbroken, self-signed chain.

It contacts no network and names no service. Every input is a file you supply: the log's
statements, its entries, the public key or key history you trust, and the timestamp authority
roots you trust. The `service` and `format` strings in the statements are opaque. `--format <id>`
makes a command require an exact `format`.

Code: `src/tlog.rs`. Tests: `tests/tlog.rs`. Fixtures and their generator:
`tests/fixtures/tlog/`.

```
kshana tlog verify-inclusion <proof.json> [--entry <entry.json>] [--sth <sth.json>]
kshana tlog verify-consistency <proof.json> [--sth-from <sth.json>] [--sth-to <sth.json>]
kshana tlog verify-sth <sth.json> [--entries <entries.jsonl>]
kshana tlog verify-daily-root <statement.json> [--tsa-ca <roots.pem>] [--tsa-certs <certs.pem>]
kshana tlog verify-key-history <history.jsonl> [--first-key <hex>]
```

How keys and output work:

- **Keys.** A signed statement is checked with `--key <64 hex>` (an Ed25519 public key) or with
  `--key-history <history.jsonl>`. The history must verify first. The key used is then the
  record whose `key_id` is the statement's and whose period contains the statement's `utc`.
- **Unsigned proofs.** A proof given unsigned (the bare payload) is checked on its own. The
  report says `proof.signed = false`: such a proof binds only to a root you already trust.
- **Output.** Each command prints one line per check (`PASS <id>: <detail>` or
  `FAIL <id>: <detail>`), then the facts it read, then a verdict. `--json` writes the same as a
  `kshana.tlog-verify/1` document.
- **Exit codes.** The exit status is 0 when every check passed. It is 2 for a failed check, a
  usage error or unreadable input; the report says which.

## The formats

### Leaves and the tree

- **Leaf bytes.** An entry's leaf bytes are its compact JSON with the keys in this order:
  `pack_sha256` (64 hex), `kind`, `signer_key_id` (string or null), `logged_utc`
  (`YYYY-MM-DDTHH:MM:SSZ`) and, when present, `class`. Entries may be served with their keys in
  any order, sorted for example, so the verifier rebuilds the leaf order before hashing. Other
  fields are not part of the leaf.
- **Classes.** `class` is `evidence_pack` or `calibration_record`. A missing `class` means
  `evidence_pack`, except for kind `crl-revocation/1`, which is a revocation record (read by its
  kind).
- **Tree hashes.** `leaf_hash(d) = SHA-256(0x00 || d)` and `node(l, r) = SHA-256(0x01 || l || r)`.
  `MTH([]) = SHA-256("")`. A tree of n leaves splits at the largest power of two below n
  (RFC 9162 section 2.1.1, as in RFC 6962).
- **Hash chain.** `chain(-1)` is 32 zero bytes and
  `chain(i) = SHA-256(0x02 || chain(i-1) || leaf_hash(i))`. The chain head of size n is
  `chain(n-1)`.

### Signed statements

`{service, method, evidence_class, utc, key_id, verdict, verdict_sha256, signature}`. The signed
body is the canonical JSON of `{evidence_class, key_id, method, service, utc, verdict}`: keys
sorted at every depth, no whitespace. `verdict_sha256` is SHA-256 of the body (hex), and
`signature` an Ed25519 signature over the body (hex). The checks are
`<prefix>.verdict-sha256`, `<prefix>.signature` and `<prefix>.utc`, plus
`<prefix>.key-in-history` when keys come from a history.

### Payloads

| Payload | Fields | Checked |
|---|---|---|
| Signed tree head | `format`, `log_key_id`, `size`, `root_hash`, `chain_head`, `timestamp_utc` | with `--entries`: `sth.root-from-entries` and `sth.chain-head-from-entries` from the first `size` entries, and `sth.entries-count` |
| Inclusion proof | `index`, `size`, `leaf_hash`, `root_hash`, `path` | `inclusion.root` by RFC 9162 section 2.1.3.2. With `--entry`: `inclusion.leaf-hash`. With `--sth`: `inclusion.sth-size` and `inclusion.sth-root` |
| Consistency proof | `from`, `to`, `from_root`, `to_root`, `path` | `consistency.path` by RFC 9162 section 2.1.4.2; `from == to` needs an empty path and equal roots. With `--sth-from` and `--sth-to`: the sizes and roots of both heads |
| Daily root | `daily_root` = `{chain_head, date, format, log_key_id, root_hash, size}`, `daily_root_sha256`, `anchoring`, `statement`, `timestamps` | see below |

The proof failure codes in a check's detail are `index-not-below-size`, `path-too-long`,
`path-too-short`, `sizes-out-of-order`, `path-not-empty-for-equal-sizes`,
`roots-differ-for-equal-sizes`, `path-empty`, `first-root-mismatch` and `second-root-mismatch`.

### Daily roots and RFC 3161 timestamps

The stamped bytes are the canonical JSON of `daily_root`, and `daily-root.sha256` checks the
stated digest against them. For each timestamp, the checks are:

| Check | What it verifies |
|---|---|
| `status` | the stated status is `granted` |
| `token-sha256` | the DER token decoded from `token_der_base64` hashes to `token_sha256` |
| `imprint-algorithm` | the token's message imprint uses id-sha256 |
| `imprint` | the imprint equals SHA-256 of the stamped bytes |
| `rfc3161` | the existing verifier `evidence::tsa::verify_token` passes, against the roots given with `--tsa-ca` |

That verifier checks:

- the status of a TimeStampResp;
- the CMS signature over the signed attributes;
- the ESS signing certificate;
- the signer's critical, sole timeStamping extended key usage;
- the chain to a trusted self-issued root;
- every certificate's validity at genTime;
- the imprint.

It does not check revocation (CRL, OCSP), the nonce, or name or policy constraints (as
documented for `kshana evidence verify --tsa-ca`).

Without `--tsa-ca`, `rfc3161` fails rather than passing unchecked. A statement with no
timestamps verifies and reports `anchored = not anchored`.

### Key history

The key history is JSON Lines, one `{record, record_sha256, signature,
previous_key_endorsement}` per line, where:

- `record = {format, seq, key_id, algorithm, public_key, not_before, previous_key_id,
  previous_record_sha256}`;
- `previous_record_sha256` is 64 zeros at seq 0.

The checks:

- each record's canonical JSON hashes to `record_sha256`;
- each record is signed by its own key (`self-signature`);
- `seq` counts from 0;
- each record names the previous record's key id and hash;
- `not_before` increases;
- the optional endorsement verifies with the previous key over the canonical
  `{format, next_key_id, next_public_key, previous_key_id}`;
- `--first-key` pins record 0.

A key's `not_after` is the next record's `not_before`. A history that fails any check is not
used as a key source.

## Test vectors

`tests/tlog.rs` checks:

- **RFC 6962 reference data.** The Merkle tree hashes of the eight test leaves of the RFC 6962
  reference implementations (`""`, `00`, `10`, `2021`, `3031`, `40414243`, `5051525354555657`,
  `606162636465666768696a6b6c6d6e6f`) for 0 to 8 leaves, the inclusion proof of leaf 0 in 8 and
  the consistency proof from 6 to 8, as published numbers. Wrong roots, sizes and paths are
  refused.
- **An independent implementation.** Every inclusion proof (36) and consistency proof (36) up to
  eight leaves, generated by `tests/fixtures/tlog/gen_vectors.py`. It is written in Python,
  separately from the Rust code, and follows RFC 9162 sections 2.1.3.1 and 2.1.4.1.
- **The five-entry vector log.** The entries are:
  - `pack_sha256` = SHA-256("vector i");
  - signer `kid-vector`;
  - logged 2026-11-20T0i:00:00Z;
  - classes (none), `evidence_pack`, `calibration_record`, `evidence_pack`,
    `calibration_record`;
  - kinds `kshana-dossier/1`, `kshana-dossier/1`, `delay-calibration/1`, `kshana-dossier/1`,
    `delay-calibration/1`.

  The kinds of rows 1, 3 and 4 were not stated. These kinds reproduce the given leaf hashes, so
  they were checked, not assumed. The test rebuilds the leaves from entries served with sorted
  keys, and checks the leaf hashes, the roots of 3 and 5 leaves, the chain head of 5, the
  inclusion of 2 in 5 and the consistency from 3 to 5 against the given values.
- **Signed fixtures.** The statements, key history and daily root were written by the Python
  generator, using test keys from published seeds: SHA-256 of `tlog test vector key 0` and
  `tlog test vector key 1`. Their public keys are `23c073fa…de61d8` and `986c89ff…c5864f`. The
  timestamp is from a throwaway OpenSSL authority whose keys were deleted. Each fixture is
  verified, then tampered with and refused. The tampering covers:
  - another key;
  - a changed payload or entry;
  - a wrong tree head;
  - another authority root;
  - a wrong token digest;
  - a broken or truncated key chain;
  - a bad endorsement.

These keys and the authority prove nothing about any real log.

## To confirm

- **Non-ASCII text in canonical JSON.** It is written as UTF-8, as `serde_json` writes it. A
  producer that escapes it (Python's `ensure_ascii`) would sign different bytes. The fixtures are
  ASCII only.
- **Key history encodings.** `public_key` is read as 64 hex digits, `algorithm` as `ed25519`,
  and record signatures and endorsements as hex. These follow the statement signatures; they were
  not stated for the history.
- **Timestamps in key periods.** Key periods compare `YYYY-MM-DDTHH:MM:SSZ` strings, so a
  timestamp in any other form does not select a key.
- **Fractional seconds.** `logged_utc` and `utc` are read without them.
