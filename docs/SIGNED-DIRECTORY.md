<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Signed directories: `kshana evidence verify-dir`

Some outputs are delivered as a directory of files signed as a whole. A `signature.json` at
the directory root is an Ed25519 statement over the SHA-256 of every other file.
`kshana evidence verify-dir` checks such a directory offline, with the key you trust:

```
kshana evidence verify-dir <dir> [--trust <hex|file>]... [--json]
```

- **Exit codes.** 0 passed; 1 a problem or a bad signature; 2 a usage error or unreadable input;
  3 intact, but the key is not one given with `--trust`. In the last case the report states the
  key, so you can compare it with the one the signer gave you by another route.
- **`--trust`.** Takes 64 hex digits or a file holding them, and may be repeated.
- **`--json`.** Writes a `kshana.signed-dir-verify/1` report.

This is separate from `kshana evidence verify`, which checks `kshana-evidence/1` packs
(`manifest.json` and `manifest.sig`, [EVIDENCE-PACKS.md](EVIDENCE-PACKS.md)) and is unchanged.

Code: `src/evidence/signed_dir.rs`. Tests: `tests/evidence_signed_dir.rs`.

## The format: `kshana-dossier-signature/1`

`signature.json` is a JSON object:

| Field | Content |
|---|---|
| `format` | `kshana-dossier-signature/1` |
| `signer` | the signer's name, as stated |
| `utc` | the signing time, as stated |
| `public_key` | the Ed25519 public key, 64 hex digits |
| `key_id` | the first 16 hex digits of SHA-256 of the public key's 32 bytes |
| `files` | `[{path, sha256}]`: every regular file under the directory, with paths relative and separated by `/`, sorted by path, excluding `signature.json` and `longterm.json` |
| `signature` | Ed25519 over the signed bytes, 128 hex digits |

The signed bytes are the compact JSON (no whitespace) of
`{"format", "signer", "utc", "public_key", "key_id", "files": [{"path", "sha256"}]}`, with
the fields in that order and without `signature`. Other fields in `signature.json` are not
signed; the report lists them as `unsigned_fields`.

`longterm.json` is added after signing and protects itself, with timestamps over the
signature. It is not covered by the statement and is not checked here; the report notes when
it is present.

## The checks

1. **Format.** `format` is `kshana-dossier-signature/1`.
2. **Key id.** `key_id` is the first 16 hex digits of SHA-256 of the public key.
3. **Signature.** The signature verifies over the signed bytes with the key the statement names
   (Ed25519 `verify_strict`).
4. **Listed files.** Every listed file is present with the listed SHA-256. Otherwise it is
   reported as `missing` or `changed`. A path listed twice is reported as `duplicate`.
5. **Present files.** Every regular file present is listed. Otherwise it is reported as
   `not_covered`.
6. **Other entries.** No symbolic link or other non-regular entry is present (`not_regular`). Such
   an entry is not covered, and a reader could be misled by it.
7. **Trust.** The key is one given with `--trust`.

The directory passes when the signature is valid, there is no problem, and the key is
trusted.

The directory is walked once and its files hashed. A path in the statement is only compared
with the paths found, never opened, so a statement cannot point the verifier outside the
directory.

When the directory holds an `operating-envelope.json`, the report shows its `format` and
`family` fields. This is for information only; the file itself is covered by the signature like
any other.

## Tests

`tests/fixtures/signed_dir/gen_pack.py` writes a synthetic pack, `tests/fixtures/signed_dir/pack/`.
It is written in Python, separately from the Rust code, and signs with a test key from a
published seed: SHA-256 of `signed directory test vector`, public key
`a729ef7c772d4bf0da7a88d434bc2d4003084c548641bdfa1e5bbc3c7fb2b209`. The pack is not a real
output, and the key proves nothing about any signer.

The tests check that:

- the pack verifies;
- without `--trust` it is intact but untrusted;
- the Rust signer reproduces the Python signature byte for byte;
- these tamper cases are refused:
  - a changed, missing or extra (nested) file;
  - another trusted key;
  - a statement re-keyed to another key;
  - a bad key id;
  - an altered `utc`;
  - another format;
  - a symbolic link;
- `longterm.json` and an extra unsigned field are ignored, and both are reported.

## Not checked

- `longterm.json` and its timestamps.
- Whether the stated `signer` and `utc` are true.
- The contents of the files beyond their hashes.
- Which key a signer should use. That is for you to establish by another route; `--trust` only
  records your decision.
