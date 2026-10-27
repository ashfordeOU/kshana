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
