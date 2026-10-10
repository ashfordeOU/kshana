# Evidence packs: a signed record of a GNSS trust event

> **A pack is a technical record, not a legal opinion.** It states what the Kshana engine
> computed from a stated receiver log under a stated configuration, and lets anyone check
> that nothing in it was changed afterwards. It does not say what caused an event, who was
> responsible, whether any obligation was met, or that the log shows what the receiver
> really received. The manifest and the summary both say this.

An evidence pack is for an incident report, an insurer, or a regulator's question: "what
did your system say about the GNSS signal between these two times, and can we trust that
record?"

## Make a pack

```sh
# once: a signing key. The private key stays with you; never commit it.
kshana evidence keygen --out signer.key        # writes signer.key (0600) and signer.key.pub

kshana receiver-trust evidence session.toml \
    --from 100 --to 260 \                       # seconds since the first epoch, or ISO-8601 UTC
    --key signer.key --out pack/ \
    --title "Berth 4, 14 June"                  # optional
```

`--from` and `--to` are seconds since the first epoch of the log, or an ISO-8601 UTC time
when the log states its own start time. `--out` must not already hold files.
`--created-utc` takes a real UTC time such as `2026-01-02T03:04:05Z` (anything else is
refused) or `none`, which leaves the creation time out and makes the pack byte-for-byte
reproducible. The creation time is whatever the signer states; nothing checks it against a
clock, which is what the optional timestamp token is for.

The key file holds a 32-byte Ed25519 seed as 64 hex digits; supply your own (for example
one kept in your key-management system) or let `keygen` make one. `kshana` warns if the
file is readable by other users. `.gitignore` excludes `*.evidence-key`; name your key that
way if it lives in a checkout.

## What is in a pack

| File | Content |
|---|---|
| `log-slice.bin` | the raw receiver-log bytes for the window |
| `config.json` | the scenario as run (every monitor threshold, event and comparison rule), the monitors that ran, the calibration baseline, and the scenario hash; for a vessel also the advisory statement every vessel output carries (advisory software, not type-approved navigation equipment). Directory names and inline payloads are removed. |
| `epochs.json` | every epoch in the window with the engine's statistics, the alarms (the reasons) and the trust state |
| `summary.html` | a self-contained, script-free summary: identification, hashes, results, reasons, every threshold, the per-epoch table, and the limits of the record |
| `manifest.json` | engine version, window, creation time, the log's format and name, **the SHA-256 of the full log**, the slice's range and SHA-256, the signer's public key and fingerprint, every file's size and SHA-256, and a hash chain over the files |
| `manifest.sig` | Ed25519 signature over the exact bytes of `manifest.json` |
| `timestamp.tsr` | optional RFC 3161 timestamp token |

**Log slice.** The reader reports the source byte span of each epoch, so the slice is the
smallest byte range that holds every epoch in the window (`byte-range`): NMEA, u-blox UBX,
RINEX 3 observations and Android logs. It is hashed as raw bytes, never as decoded text.
For a live feed or RINEX 2 there is no span; the whole log is then bundled and the manifest
says `whole-log` (the window limits which epochs are reported, not which bytes are
included). The summary states which applies. A slice is a record of the window's bytes,
not a stand-alone log: for example a RINEX slice has no file header.

**Hash chain.** The manifest lists the files in a fixed order. `link₀ = SHA-256("kshana-
evidence-chain/1")`; for each file, `linkᵢ = SHA-256(linkᵢ₋₁ ‖ SHA-256(file) ‖ len(name) ‖
name)` (length as 4 bytes, big-endian). The last link is `chain_head`. Reordering,
removing or substituting a file changes the chain; the signature covers the chain.

## Verify a pack

```sh
kshana evidence verify pack/ --pubkey signer.key.pub [--log session.nmea] \
    [--require-timestamp] [--allow-unpinned] [--json]
```

Exit status 0 means verified; 1 means something failed; 2 means a usage error; 3 means the
pack is intact but its signer was not pinned (see below). Every check reports pass, fail or
skipped, and every failure is named:

| Failure code | Meaning |
|---|---|
| `manifest-missing`, `manifest-malformed`, `unsupported-format` | the manifest cannot be read |
| `signature-missing`, `signature-malformed`, `signature-invalid` | no signature, not a 64-byte lower-case hex signature, or it does not verify over `manifest.json` |
| `public-key-malformed`, `public-key-mismatch` | the key is not valid, or differs from the one you supplied |
| `file-missing`, `file-size-mismatch`, `file-hash-mismatch` | a listed file is absent or differs from the manifest; the file is named |
| `unlisted-file` | a file is in the pack but not in the manifest |
| `chain-mismatch`, `chain-head-mismatch` | a link is not what its inputs give; the file is named |
| `artifact-list-malformed`, `slice-record-inconsistent`, `epoch-count-mismatch` | the manifest contradicts itself or `epochs.json` |
| `full-log-hash-mismatch`, `slice-not-from-full-log` | with `--log`: the log you hold is not the one recorded, or the slice is not that range of it |
| `timestamp-missing`, `timestamp-malformed`, `timestamp-imprint-mismatch` | see below |

Changing one byte of any file fails verification with the matching reason: a changed
artifact is reported as that file's hash mismatch and nothing else; a changed manifest
fails the signature. Re-computing hashes and the chain after editing a file does not help
without the signing key; only the signature then fails.

**Pin the key.** Without `--pubkey`, a pack proves only that it is intact against the key
it names itself, which anyone can generate. So verification then exits 3 and says "INTACT,
BUT THE SIGNER IS NOT PINNED" rather than "VERIFIED"; `--allow-unpinned` accepts the
pack's own key knowingly and prints "VERIFIED against the key the pack names itself
(signer NOT pinned; pass --pubkey)". Get the signer's public key from the signer by a
route you trust (not from the pack) and pass it with `--pubkey`: 64 hex digits or the
`.pub` file. Passing the private key by mistake is recognised and refused. The
fingerprint (first 128 bits of the key's SHA-256, 32 hex digits) is printed for comparing
by eye; pinning the full key is the reliable path.

## Pack format and verification procedure (normative)

This section is the specification an independent verifier is written from. Words in
capitals are requirements. A pack is a directory (or any map from file name to bytes) of
files named exactly as below; a verifier works on the bytes of each file as stored and
never re-serialises anything.

**Files.** The artifact files, in this fixed order, are `log-slice.bin`, `config.json`,
`epochs.json`, `summary.html`. A pack also has `manifest.json` and `manifest.sig`, and
MAY have `timestamp.tsr`. Any other name is an *unlisted file*.

**Hex.** Every hex string is lower-case `0-9a-f` only, with no whitespace; upper case is
not accepted. SHA-256 values are 64 digits, the public key is 64 digits, the signature
is 128 digits.

**`manifest.sig`.** The 128-digit lower-case hex of the 64-byte Ed25519 signature (RFC
8032, the pure Ed25519 scheme) over the exact bytes of `manifest.json`, followed by
exactly one `\n` and nothing else. The signature MUST be checked strictly: a signature
whose S value is not less than the group order L is invalid.

**`manifest.json`.** A UTF-8 JSON object. Its members (a verifier MUST find each with
the stated JSON type; additional members are ignored):

| member | type | meaning |
|---|---|---|
| `format` | string | MUST equal `kshana-evidence/1` |
| `title`, `engine_version`, `disclaimer` | string | descriptive |
| `created_utc` | string or null | creation time, descriptive |
| `window` | object `{from_s, to_s}` | numbers, seconds |
| `epochs_in_window` | non-negative integer | the number of entries of the JSON array in `epochs.json` |
| `log` | object | `format` string, `file_name` string, `full_sha256` hex, `full_bytes` non-negative integer, `start_label` string or null, and `slice` |
| `log.slice` | object | `kind` (exactly `byte-range` or `whole-log`; any other value makes the manifest malformed), `start` and `end` non-negative integers (byte offsets, end exclusive), `sha256` hex |
| `signer` | object | `algorithm` string (`ed25519`), `public_key` hex (32 bytes), `fingerprint` string |
| `artifacts` | array of objects | one per artifact file, in the fixed order: `name` string, `role` string, `bytes` non-negative integer, `sha256` hex, `link` hex |
| `chain_head` | hex | the last link |

`signer.fingerprint` is the first 32 hex digits of SHA-256 over the 32 public-key bytes.

**Hash chain.** `link0` is SHA-256 of the 23 ASCII bytes `kshana-evidence-chain/1`. For
each artifact in order, `link = SHA-256( previous_link (32 bytes) ‖ SHA-256(file)
(32 bytes) ‖ len(name) as 4 bytes big-endian ‖ name as UTF-8 )`, where `SHA-256(file)`
is taken from the manifest's recorded `sha256` for that artifact (so the chain is a
property of the manifest and is checked against it, not against the files).

**Procedure.** A verifier performs these steps in order and collects every failure; the
result is the *set* of failures, each a `code` and, where stated, the file `name`. It
MUST NOT stop at the first failure except where stated. `pin` is the public key the
verifier was told to trust, if any.

1. No `manifest.json`: failure `manifest-missing`; stop.
2. If `manifest.json` is not a JSON object with every member above in the stated types
   (including `artifacts` entries with every member, and `log.slice`): failure
   `manifest-malformed`. Otherwise, if `format` is not the value above:
   `unsupported-format`.
3. Signature phase. This phase is performed whether or not the manifest was readable.
   If the manifest was readable, the *named key* is `signer.public_key`; if it is not 64
   lower-case hex digits, failure `public-key-malformed` (no named key); otherwise if
   `signer.fingerprint` is not the fingerprint of it, failure `public-key-malformed` (the
   key stays usable). If both a `pin` and a named key exist and differ: failure
   `public-key-mismatch`. The *check key* is `pin` if one was given, otherwise the named
   key if there is one; with neither there is no check key (this includes every case
   where the manifest was not readable and no `pin` was given). If there is no
   `manifest.sig`: `signature-missing`. Else if the file is not exactly 128 lower-case hex
   digits plus one `\n`: `signature-malformed`. Else if there is a check key that is not a
   valid Ed25519 public key encoding: `public-key-malformed`. Else if there is a check key
   and the signature does not verify strictly over the bytes of `manifest.json` (whatever
   they are): `signature-invalid`. (With no check key the signature is not checked and no
   failure is raised for that.)
4. If the manifest was not readable (step 2 gave `manifest-malformed`): stop here.
5. Artifacts. If the `artifacts` names are not exactly the four above in order:
   `artifact-list-malformed`. Then for every manifest entry, in order: if the pack has no
   file of that name, `file-missing` (name); else if its length differs from `bytes`,
   `file-size-mismatch` (name); and, independently, if SHA-256 of the file differs from
   `sha256`, `file-hash-mismatch` (name).
6. Unlisted files: for every file in the pack other than `manifest.json`,
   `manifest.sig`, `timestamp.tsr` and the names in the manifest's `artifacts`:
   `unlisted-file` (name).
7. Chain. Walk the manifest's `artifacts` in order from `link0`. If an entry's `sha256`
   is not 64 lower-case hex digits: `manifest-malformed` and the chain is abandoned (no
   head check). Otherwise compute the link; if it differs from the entry's `link`:
   `chain-mismatch` (name). After the walk, if the chain was not abandoned and the last
   link differs from `chain_head`: `chain-head-mismatch`.
8. Slice and epochs. Raise `slice-record-inconsistent` (at most once per reason, and a
   verifier reports the code once however many reasons apply) if any of: `start > end`;
   `end > full_bytes`; the `log-slice.bin` entry's `sha256` differs from `slice.sha256`;
   that entry's `bytes` differs from `end - start`; or `kind` is `whole-log` and any of
   `start != 0`, `end != full_bytes`, `slice.sha256 != full_sha256`. If `epochs.json`
   exists and parses as a JSON array whose length differs from `epochs_in_window`:
   `epoch-count-mismatch`.
9. Full log. Only if the verifier was given the original log bytes: if their SHA-256
   differs from `log.full_sha256`, `full-log-hash-mismatch`; otherwise if the range
   `start..end` is not inside the log or the log's bytes there differ from
   `log-slice.bin`, `slice-not-from-full-log`.
10. Timestamp. With no `timestamp.tsr`: if the verifier was told to require one,
    `timestamp-missing`; otherwise nothing. With one: if it cannot be read as an RFC 3161
    token or response (see below), `timestamp-malformed`; otherwise if its message
    imprint is not the hash, in the imprint's own algorithm (SHA-256, SHA-384 or
    SHA-512), of the bytes of `manifest.json`: `timestamp-imprint-mismatch`.

The pack is verified exactly when the failure set is empty. Whether the signer was pinned
is reported separately and does not change the failure set.

**Timestamp token.** A token is a DER `ContentInfo` whose content type is CMS SignedData
(1.2.840.113549.1.7.2) and whose encapsulated content type is `id-ct-TSTInfo`
(1.2.840.113549.1.9.16.1.4); a response is a DER `TimeStampResp` (a `PKIStatusInfo`
followed by the token) whose status is 0 or 1. The `TSTInfo`'s message imprint algorithm
must be SHA-256, SHA-384 or SHA-512 with a digest of that algorithm's length, and its
`genTime` a real UTC calendar time. Indefinite-length BER is not accepted. The
authority's signature and certificate chain are NOT checked.

## RFC 3161 timestamp (optional)

A timestamp token from a timestamping authority shows the manifest existed at a time the
authority attests. The token is over `manifest.json`, so it is requested after the pack is
made (there is no way to supply one when the pack is created, and `create_bundle` refuses a
token that is not over that exact manifest):

```sh
openssl ts -query -data pack/manifest.json -sha256 -cert -out req.tsq
# send req.tsq to your authority, get the response, then:
kshana evidence attach-timestamp pack/ response.tsr
openssl ts -verify -in response.tsr -data pack/manifest.json -CAfile authority-ca.pem
```

`kshana evidence verify` reads the token (a bare token or a full response), checks that it
was granted and that its message imprint equals the hash of `manifest.json`, and prints
the time it states, always followed by the words "timestamp authority signature not verified
by Kshana". **It does not check the authority's signature or certificate chain**;
this build carries no RSA, ECDSA or X.509 code. The report says so each time
(`authority_signature_verified: false`). Run the `openssl ts -verify` line above for that
part. A token whose imprint differs, or one that does not parse, is a failure. The token's
content types, imprint length and generation time are checked for sense.

**The token sits beside the signed manifest, not inside it.** Nothing in the signature or
the chain covers it, so a token can be removed, or a different valid token substituted,
without the signature failing. `verify` therefore notes when a pack has none, and
`--require-timestamp` makes a missing token a failure (`timestamp-missing`); a substituted
token is caught only if it does not match the manifest. `attach-timestamp` refuses to
overwrite an existing token unless you pass `--replace`. If a timestamp matters to you,
keep the token and the verification result with your own records, and require it.

## From code

`kshana::evidence::build_receiver_trust_pack` is the one entry point the command line and
every other surface call to make a pack: a scenario, the log's bytes (and the navigation
file's, for RINEX), the window as text, a title and an optional creation time, plus the
signing seed, in; the files, the epoch count, the slice, the manifest hash and the signer
fingerprint out. It reads no files and no clock, so the same inputs give the same bytes.
Below it, `create_bundle` and `verify_bundle` are pure functions: bytes in
(`EvidenceInput`, a 32-byte seed, a `BTreeMap<String, Vec<u8>>` of files), serialisable
results out (`Files`, `VerifyReport`). They use no files, clock or process state, and
build for `wasm32`, so the Python, WebAssembly and server surfaces call them unchanged.
The command line is a thin wrapper over them.

## What a pack does not do

* It does not re-run the assessment. Anyone with the full log and `config.json` can re-run
  `kshana receiver-trust` and compare with `epochs.json`; the pack proves what was
  recorded, not that the engine was right.
* It does not prove the log is genuine or complete. The hash of the full log ties the
  record to one file; where that file came from is for the operator to establish.
* It carries no performance claim about detection or rejection of interference.
* It is a technical record and not a legal opinion or a certification.
