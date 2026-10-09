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
when the log states its own start time. `--out` must not already hold files. `--created-utc
none` leaves the creation time out, which makes the pack byte-for-byte reproducible.

The key file holds a 32-byte Ed25519 seed as 64 hex digits; supply your own (for example
one kept in your key-management system) or let `keygen` make one. `kshana` warns if the
file is readable by other users. `.gitignore` excludes `*.evidence-key`; name your key that
way if it lives in a checkout.

## What is in a pack

| File | Content |
|---|---|
| `log-slice.bin` | the raw receiver-log bytes for the window |
| `config.json` | the scenario as run (every monitor threshold, event and comparison rule), the monitors that ran, the calibration baseline, and the scenario hash. Directory names and inline payloads are removed. |
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
kshana evidence verify pack/ --pubkey signer.key.pub [--log session.nmea] [--json]
```

Exit status 0 means verified; 1 means something failed; 2 means a usage error. Every check
reports pass, fail or skipped, and every failure is named:

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
| `timestamp-malformed`, `timestamp-imprint-mismatch` | see below |

Changing one byte of any file fails verification with the matching reason: a changed
artifact is reported as that file's hash mismatch and nothing else; a changed manifest
fails the signature. Re-computing hashes and the chain after editing a file does not help
without the signing key; only the signature then fails.

**Pin the key.** Without `--pubkey`, a pack proves only that it is intact against the key
it names itself, which anyone can generate; verification says so in a note and prints the
fingerprint. Get the signer's public key from the signer by a route you trust (not from
the pack) and pass it with `--pubkey`.

## RFC 3161 timestamp (optional)

A timestamp token from a timestamping authority shows the manifest existed at a time the
authority attests. The token is over `manifest.json`, so it is requested after the pack is
made:

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
part. A token whose imprint differs, or one that does not parse, is a failure.

## From code

`kshana::evidence::create_bundle` and `verify_bundle` are pure functions: bytes in
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
