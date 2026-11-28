<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Space evidence pack: an open profile (`kshana.space-evidence-pack/1`)

Space operators, manufacturers and administrations collect evidence of many kinds: what a
sensor recorded, what interfered with a link, which artefacts support a cyber control, what
happened in an anomaly, how a unit passed acceptance, which parts it holds. Each usually travels
in its own format, without hashes, labels or a signature. This profile puts them in **one
directory format** with the same identity, hash and label fields for every item, and the
signing format Kshana already uses for signed directories.

```
kshana evidence space-pack validate <dir> [--trust <hex|file>]... [--json]
kshana evidence space-pack hash <dir>        # print the manifest with every file's sha256 and bytes filled in
kshana evidence space-pack schema            # the JSON Schema of the manifest
kshana evidence space-pack template          # a manifest to start from
```

`validate` exits 0 when the pack is valid, 1 when it is not, 2 on a usage or input error.

> **A pack records evidence; it does not judge it.** A valid pack is not an assessment, a
> certification or an attestation that any requirement is met, and it is not evidence that its
> content is true. Every manifest carries that statement word for word (`disclaimer`), and
> `validate` warns when an item's text calls itself "certified", "compliant" or "conformant".
> The validation report is labelled MODELLED: it is a check of what the pack states.

## Layout

```
pack/
  space-evidence.json          the manifest (this profile)
  signature.json               optional: kshana-dossier-signature/1 over every file
  <item files>                 anywhere under the pack, named by the items
  <embedded kshana-evidence/1 packs>
```

## The manifest

| Field | Content |
|---|---|
| `format` | `kshana.space-evidence-pack/1` |
| `pack_id`, `title`, `producer` | identity of the pack and who made it |
| `created_utc` | RFC 3339 UTC ending in `Z` |
| `label` | the **weakest** item label (see below) |
| `disclaimer` | the profile's statement, word for word |
| `items` | one or more items |

**Common item fields** (every kind):

| Field | Content |
|---|---|
| `id` | unique in the pack: letters, digits, `.`, `_`, `-` |
| `kind` | one of the six kinds below |
| `title`, `producer`, `created_utc` | what the item is, who made it, when |
| `label` | `VALIDATED`, `MODELLED` or `PARTNER`, the tiers of the engine's evidence label (`src/evidence_label.rs`, [VERIFICATION-MATRIX.md](VERIFICATION-MATRIX.md)) |
| `oracle` | required for `VALIDATED`: the external reference the content was checked against |
| `files` | `[{path, sha256, bytes, role?, media_type?}]`: relative `/`-separated paths inside the pack (no `..`, no absolute path) |
| `related` | ids of other items in the pack |
| `body` | the kind's fields |

**Labels.** `VALIDATED` means checked against a named external oracle; `MODELLED` means produced
by a model, a computation or a statement with no external oracle; `PARTNER` means it depends on
data a partner holds. As for a run's evidence label, the pack's label is the weakest of its
items (`PARTNER` below `MODELLED` below `VALIDATED`), so a pack can never claim more than its
weakest item. `validate` checks this.

## The kinds

| Kind | `body` | Covers |
|---|---|---|
| `sensor-record` | `sensor`, `quantity`, `start_utc`, `end_utc`; optional `evidence_pack`: the relative directory of an embedded signed `kshana-evidence/1` pack ([EVIDENCE-PACKS.md](EVIDENCE-PACKS.md)), which `validate` verifies; otherwise at least one file | sensor data over a window |
| `interference-event` | `affected` (satellite, transponder, link), `start_utc`, `end_utc`, `method`, `confidence` (0 to 1); optional `carrier_frequency_mhz`, `bandwidth_khz`, `cn_drop_db`, and `geolocation` {`lat_deg`, `lon_deg`, `semi_major_km`, `semi_minor_km`, `orientation_deg`, `probability`}: an ellipse, never a bare point | an interference event on a link |
| `cyber-control` | `framework` (as named by the producer, for example ECSS-E-ST-80C), `control_id`, optional `control_title`, `evidence_status` (`provided`, `partial`, `not-provided`); each file states its `role` (`configuration`, `crypto-settings`, `test-result`, `sbom`, `other`) | the artefacts collected for one control |
| `anomaly-report` | `spacecraft`, `detected_utc`, `symptoms` (one or more), `timeline` [{`utc`, `event`}], optional `hypotheses` [{`text`, `status`: `open`, `supported`, `rejected`}], `closure` (`open`, `monitoring`, `closed`) | a spacecraft anomaly |
| `acceptance-record` | `unit`, `serial`, optional `parts` [{`part`, `lot`}], `tests` [{`test`, `result`: `pass`, `fail`, `waived`, `not-run`, `utc`}], optional `deviations`, `signoffs` [{`role`, `name`, `utc`}] | a unit's factory acceptance |
| `hbom` | none; exactly one file with role `cyclonedx`: a CycloneDX JSON BOM whose components carry `kshana:hbom:distributor-class` (`ocm`, `authorised`, `independent`, `unknown`), `kshana:hbom:lot` or `kshana:hbom:date-code`, and optionally `kshana:hbom:export-class` (as stated by the supplier) | a hardware bill of materials |

`validate` warns, without failing, on a component from an `independent` or `unknown` source, a
component without a distributor class or lot, and a cyber-control file without a role.

A frequency, a framework or a control named in a pack is the producer's statement. The profile
does not map controls between frameworks and does not decide whether a control is met.

## Signing

The profile adds no new signature format. A pack is signed as a **signed directory**
(`signature.json`, `kshana-dossier-signature/1`, [SIGNED-DIRECTORY.md](SIGNED-DIRECTORY.md)): an
Ed25519 statement over the SHA-256 of every file, the manifest included. When `signature.json` is
present, `validate` checks it as `kshana evidence verify-dir` does: an invalid signature or a file
that differs from the statement is an error; a valid signature by a key not given with `--trust`
is a warning. Without `signature.json` the pack's integrity rests on the hashes in the manifest,
which anyone can recompute, and `validate` says so. `validate` does not sign.

An embedded `kshana-evidence/1` pack keeps its own `manifest.sig`; `validate` verifies it against
the key it names (not pinned: pin it with `kshana evidence verify <dir> --pubkey`).

## What `validate` checks

1. The manifest: `format`, the required fields, RFC 3339 UTC times, the disclaimer.
2. Each item: a unique id, a known kind, a known label, an oracle for `VALIDATED`, safe file
   paths, 64-hex SHA-256 and sizes, `related` ids that exist, and the kind's body fields and
   ranges (a window whose end is not before its start, a confidence in [0, 1], a semi-minor axis
   no larger than the semi-major).
3. The pack label equals the weakest item label.
4. On disk: every listed file present with its SHA-256 and size; every other regular file listed
   (except the manifest, `signature.json`, `longterm.json` and the files of embedded packs); no
   symbolic link or other non-regular entry; each embedded pack verifies; the signature, when
   present.

The report (`kshana.space-evidence-validate/1`) gives `valid`, the pack and computed labels, a
summary per item, every error and warning with a stable code and where it is, the signature
check and the embedded packs.

## Example

`tests/fixtures/space-evidence/pack` is a fictional pack with one item of each kind: a sensor
record embedding a receiver-trust evidence pack, an uplink interference event with a
geolocation ellipse, a telecommand-authentication control with its configuration and test
result, a reaction-wheel anomaly, an avionics unit's acceptance and its HBOM.

```sh
kshana evidence space-pack validate tests/fixtures/space-evidence/pack
```

Schema: `data/space-evidence/kshana-space-evidence-pack-1.schema.json`. Code:
`src/evidence/space_pack.rs`. Tests: `tests/space_evidence_pack.rs`.
