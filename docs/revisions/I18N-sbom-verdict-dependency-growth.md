# The SBOM conformance verdict, re-generated for the localisation dependencies

Date: 2026-10-27. Branch `feat/i18n-engine-0.40`, test `tests/reproducibility_software_assurance_reference.rs`,
pinned fixture `tests/fixtures/reproducibility_software_assurance/reproducibility_software_assurance_reference.txt`.
Bars, tolerances and scenarios: unchanged. This entry joins the owner's re-bless at integration, where the procedure
below is re-run against the final `Cargo.lock`.

## What moved and why

The localisation framework (`fluent-bundle`, `unic-langid` and their transitive crates; `docs/i18n.md`, "Dependencies
and licences") grows the shipped dependency graph, which the verdict records. Nothing in the SBOM generator's
behaviour moved except one rule (below). The full-suite run failed this test at that point with
`live component_count 127 != pinned oracle 110`.

| key | before | after |
|---|---|---|
| `component_count` | 110 | 127 |
| `raw_schema_errors` | 99 | 113 |
| `compound_count` | 99 | 113 |
| `sbom_sha256` | `d440c985d510a69acc9baf091a2248eb96b678d33da87d1a4d4c1c46a912e667` | `25327ffdefd20af973fdf54035b116ec66a82bb06621d9da7539495cdc9d67ca` |
| `compound_id` lines | 11 | 13 (adds `Apache-2.0/MIT` and `Apache-2.0 OR GPL-2.0-only`) |

Unchanged: `spec_version` 1.5, `spdx_enum_size` 613, `normalized_schema_errors` 0, `atomic_ids_all_valid_spdx` 1,
`atomic_ids_invalid_count` 0, `atomic_id_count` 11 (AGPL-3.0-only, BSD-3-Clause, MIT). `Apache-2.0 OR GPL-2.0-only` is
`self_cell`, whose Apache-2.0 alternative is the one in use; `deny.toml` allows it.

## One generator rule changed

`scripts/gen-sbom.sh` wrote every single licence identifier as `license.id`. `tinystr`, `zerofrom` and `zerovec`
(new transitive crates) carry `Unicode-3.0`, which is newer than CycloneDX 1.5's own SPDX list (v1.0-3.21, vendored as
`spdx.schema.json`), so the document failed the test's membership check for atomic ids. A single identifier that is not
in that list is now written as `license.name` (the schema's other branch). The compound expressions, which already
go to the normalization rule, are unchanged. After the change the three crates appear with
`{"license": {"name": "Unicode-3.0"}}` and the normalized document has zero schema errors.

## Procedure (the fixture's own, documented in its generator's docstring; offline, no Kshana Rust code)

```
bash scripts/gen-sbom.sh > /tmp/sbom.json
python3 tests/fixtures/reproducibility_software_assurance/generate_reproducibility_software_assurance_reference.py \
  /tmp/sbom.json > tests/fixtures/reproducibility_software_assurance/reproducibility_software_assurance_reference.txt
cargo test --release --test reproducibility_software_assurance_reference
```

The generator needs the Python `jsonschema` library (4.26.0 here). The test passes after the re-generation
(1 of 1). If `Cargo.lock` differs at integration, re-run the three commands and replace the values above.

## Re-run at the 0.40.0 bump (28 Oct 2026)

The procedure above was re-run against the final `Cargo.lock` (0.40.0, all 0.40 branches merged). `component_count` stays 127 and
every other value is unchanged; only `sbom_sha256` moved, to `7b90839a5ab454a67f0b60b23d4e1bee481137173c828ecdab107c7faeb18076`,
because the SBOM names the `kshana` component's own version. The fixture was re-generated and the test passes (1 of 1); the
record is in `STUDIO15-pins-0.40.0-version.md`.

## 2026-10-28: re-generated again for RUSTSEC-2026-0387 (crypto-bigint 0.5.5)

Reason: the advisory (timing variability in `crypto-bigint` 0.5.5, reached through `elliptic-curve` 0.13.8 by `p256`, `p384` and
`p521` 0.13) failed `cargo deny` in CI. The fix upgrades the RustCrypto stack, so the dependency list changed, not the version:
`p256`, `p384`, `p521` 0.13 to 0.14, `elliptic-curve` 0.14.3, `ecdsa` 0.17.0, `crypto-bigint` 0.5.5 to 0.7.10 (also the direct
dependency used by the RSA public-key operation of `src/evidence/tsa.rs`), in both `Cargo.lock` and `mcp/kshana-mcp/Cargo.lock`.
Kshana only verifies public signatures with these crates, so the exposure was nil; the upgrade is the safer rule than an ignore
entry (none was added).

The lock moves by 29 crates added and 12 removed (net +17): added `base16ct` 1.0.0, `block-buffer` 0.12.1, `cmov`, `const-oid` 0.10.2,
`cpubits`, `cpufeatures` 0.3.1, `crypto-bigint` 0.7.10, `crypto-common` 0.2.2, `ctutils`, `der` 0.8.3, `digest` 0.11.3, `ecdsa` 0.17.0,
`elliptic-curve` 0.14.3, `ff` 0.14.0, `fiat-crypto` 0.3.0, `group` 0.14.0, `hmac` 0.13.0, `hybrid-array`, `p256`, `p384`, `p521`
(0.14.0), `primefield`, `primeorder` 0.14.0, `rand_core` 0.10.1, `rfc6979` 0.6.0, `sec1` 0.8.1, `sha2` 0.11.1, `signature` 3.0.0,
`wnaf`; removed the 0.13-era `base16ct` 0.2.0, `crypto-bigint` 0.5.5, `ecdsa` 0.16.9, `elliptic-curve` 0.13.8, `ff` 0.13.1,
`group` 0.13.0, `p256` 0.13.2, `p384` 0.13.1, `p521` 0.13.3, `primeorder` 0.13.6, `rfc6979` 0.4.0, `sec1` 0.7.3.

What moved in the pinned verdict (the only pin that moved; the version-bearing pins and every other pin are untouched):

| key | before (integ/0.40.0-rc2) | after |
|---|---|---|
| `component_count` | 127 | 144 |
| `raw_schema_errors` | 113 | 130 |
| `compound_count` | 113 | 130 |
| `sbom_sha256` | `7b90839a5ab454a67f0b60b23d4e1bee481137173c828ecdab107c7faeb18076` | `bd7ba406234570446bf28d47b54e4ce79350251cacfb5a1284111b6e4414f2e8` |

Unchanged: `spec_version` 1.5, `spdx_enum_size` 613, `normalized_schema_errors` 0, `atomic_ids_all_valid_spdx` 1, the atomic and
compound identifier lists (every new crate carries an expression already in the list). Procedure and command lines: the section
above. The OSNMA and timestamp vector tests pass unchanged with the new curves.
