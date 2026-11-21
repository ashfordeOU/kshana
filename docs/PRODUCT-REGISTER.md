# Product register

A public list of products that were **scored under a stated method**, with the date each is to be
scored again, and a viewer that reads a signed revocation list. An entry says that the product
(at the stated version) was scored under the method (at the stated version) on the stated date,
with the outcome the scorer wrote. It says nothing else about the product.

Abbreviations used on this page, in full:

| Abbreviation | Meaning |
|---|---|
| CRL | certificate revocation list; here, the signed revocation list of register entries |
| JSON | JavaScript Object Notation |
| SHA-256 | the 256-bit Secure Hash Algorithm |

## Commands

```bash
kshana evidence keygen --out publisher.key                    # once
kshana register sign examples/register/register.json --key publisher.key --out register.json
kshana register check register.json [--key <publisher key hex>]
kshana register crl-check crl.json --key <issuer key hex>
kshana register view register.json [--crl crl.json --crl-key <issuer key hex>] [--date 2026-11-20] [--json]
```

`sign` signs a register or a revocation list (it reads the `schema` field to tell which) and checks
the result. A revocation list is signed by its issuer, the service that runs the scoring; `sign`
is there so the format can be produced and tested anywhere.

## `kshana.register/1`

| Field | Meaning |
|---|---|
| `schema` | `kshana.register/1` |
| `publisher` | who publishes the register |
| `issued` | YYYY-MM-DD |
| `entries` | the list below |
| `signer` | the publisher's Ed25519 public key, hex |
| `signature` | Ed25519 (RFC 8032), hex, over `kshana.register/1\n` followed by the register's JSON with `signature` empty |

Each entry:

| Field | Meaning |
|---|---|
| `id` | unique in the register; 1 to 128 letters, digits, `.`, `-`, `_` |
| `product`, `maker`, `version` | what was scored, at which hardware, firmware or software version |
| `method`, `method_version` | the method it was scored under |
| `scored` | YYYY-MM-DD |
| `revalidate_by` | the revalidation date (YYYY-MM-DD): the date by which it is to be scored again; not before `scored` |
| `outcome` | the outcome as the scorer states it (a score, a band) |
| `evidence_sha256`, `evidence_url` | optional: the digest of the evidence (64 hex digits) and where it can be read |

`check` refuses a register with a bad signature, a key other than `--key`, a date that is not a
calendar date, a repeated or malformed id, a malformed digest, or a revalidation date before the
scoring date.

## `kshana.register-crl/1`

| Field | Meaning |
|---|---|
| `schema` | `kshana.register-crl/1` |
| `issuer` | who issues the list |
| `issued`, `next_update` | YYYY-MM-DD; after `next_update` the list is stale |
| `revoked` | per revoked entry: `id`, `revoked` (YYYY-MM-DD, from when) and `reason` |
| `signer`, `signature` | as for the register, with the prefix `kshana.register-crl/1\n` |

A list is checked only against the issuer key the reader gives (`--crl-key`): a list signed by
any other key is refused, so a register's publisher cannot revoke or restore entries in the
issuer's name.

## The view

`view` joins a register and, optionally, a list at a date (default: today, by the computer's clock;
give `--date` for a reproducible view). Each entry is:

| Status | When |
|---|---|
| `current` | not revoked at the date, and the date is not past `revalidate_by` |
| `due` | the date is past `revalidate_by`: the entry is to be scored again |
| `revoked` | the list names it, from a date at or before the view date |

and its `revocation` says how it was checked: `unknown` (no list given), `checked`, or `stale`
(the list is past its `next_update`; its revocations still apply). The JSON view
(`kshana.register-view/1`) also lists revocations naming no entry of this register. The text view
is a tab-separated table, with the counts and any warning about the list on standard error.

## Limits

- The register is a list of statements by its publisher; the signature shows who made them and
  that they were not changed, not that they are right.
- The viewer trusts the clock it is given; a revocation dated after the view date does not apply.
- No product has been scored under any method in this register format yet; the example in
  `examples/register/` is illustrative.

## `kshana register-products`: packs, published revocations and versions

```bash
kshana register-products verify register.json --packs evidence/ [--pack-key <hex>] [--pin <publisher key hex>] [--json]
kshana register-products show register.json --revocations revoked.jsonl [--date 2026-11-20] [--json]
kshana register-products show register.json --revocations https://example.org/revoked.jsonl
kshana register-products diff register-v1.json register-v2.json
```

* **verify**: each entry with an `evidence_sha256` names a signed evidence pack in
  `<packs>/<entry id>/`. The SHA-256 of the pack's signed `manifest.json` must equal the entry's
  digest, and the pack must pass `kshana evidence verify`'s checks (files, hashes, Ed25519
  signature; against `--pack-key` when given). Results: `verified`, `digest-mismatch`,
  `pack-invalid`, `no-pack`, `no-digest`. Exit 1 when any pack fails.
* **show**: the register at a date against a published revocation list in JSON lines, one object
  per revocation: `{"serial": "<entry id>", "revoked_at": "YYYY-MM-DD", "reason": "..."}`, read
  from a file or fetched from an `http(s)` URL the user gives (the system `curl`, a GET only; no
  service is built in). A revoked entry shows as **REVOKED** from its revocation date. Unlike the
  signed `kshana.register-crl/1` list that `register view` reads, a JSON-lines list carries no
  signature: it is as trustworthy as the place it was read from. Exit 1 when any entry is revoked.
* **diff**: the append-only rule between two versions: every entry of the older is present,
  unchanged, in the newer, and the newer is not issued earlier. Removed and changed entries break
  the rule (exit 1); added entries are listed.

Entries may also name the `scenario_set` and `scenario_set_version` they were scored on. Method
versions are listed in [METHODOLOGY-CHANGELOG.md](METHODOLOGY-CHANGELOG.md).
