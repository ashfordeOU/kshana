#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Generate the external-oracle conformance verdict for the kshana SBOM.

ORACLE (genuine external standard, published vectors)
-----------------------------------------------------
The oracle is the **official CycloneDX 1.5 JSON Schema** as published by the
CycloneDX project (OWASP / Ecma TC54), licensed Apache-2.0:

    bom-1.5.schema.json   $id http://cyclonedx.org/schema/bom-1.5.schema.json
    spdx.schema.json      $id http://cyclonedx.org/schema/spdx.schema.json
                          $comment "v1.0-3.21"  (613 enumerated SPDX licence ids)
    jsf-0.82.schema.json  $id http://cyclonedx.org/schema/jsf-0.82.schema.json

  Source: https://github.com/CycloneDX/specification, branch/tag 1.5,
          schema/{bom-1.5,spdx,jsf-0.82}.schema.json . The three files are
          vendored verbatim next to this script (Apache-2.0, kept out of the
          Rust crate so cargo-deny stays green). The validator is the reference
          Python `jsonschema` library (Draft-07).

WHAT IS VALIDATED
-----------------
The actual stdout of `scripts/gen-sbom.sh` (run from the kshana repo root) is
checked against the official CycloneDX 1.5 schema, and every atomic licence id is
checked for membership in the official 613-entry SPDX enumeration. Concretely the
verdict records:

  * component_count                     (the locked dependency graph)
  * raw_schema_errors                   (the SBOM exactly as gen-sbom.sh emits it)
  * normalized_schema_errors            (after the SPDX/CycloneDX rule below)
  * atomic_ids_all_valid_spdx           (every single-id licence is in the enum)
  * compound_count                      (licence values that are SPDX *expressions*)
  * sbom_sha256                          (byte-identical determinism anchor)

THE SPDX / CycloneDX RULE (the normalization)
---------------------------------------------
CycloneDX 1.5 `license.id` is `$ref: spdx.schema.json` — it MUST be a single SPDX
licence identifier from the 613-entry enum. A *compound* SPDX expression
(`A OR B`, `A AND B`, `A WITH exc`, or parenthesised) is NOT a valid `id`; the
schema requires it to live in the `expression` tuple form
(`[{"expression": "Apache-2.0 AND (MIT OR GPL-2.0-only)"}]`).

HONEST SCOPE — what this DOES and does NOT validate
---------------------------------------------------
DOES (genuine external check against a published standard):
  * Every ATOMIC licence the SBOM reports is a real SPDX identifier (vs the
    official enum) — a true ExternalDataset conformance sub-claim.
  * Once each compound expression is placed in the standard `expression` field
    (the documented SPDX/CycloneDX rule, applied verbatim — no kshana logic),
    the WHOLE document validates against the official CycloneDX 1.5 schema with
    ZERO errors over the full ~59-component locked graph.
  * The generator is byte-deterministic (sbom_sha256 reproduces across runs).

DOES NOT (and is reported as the known gap, NOT hidden):
  * The `gen-sbom.sh` *fallback* path (used when cargo-cyclonedx is absent, as on
    CI here) emits compound expressions inside `license.id`, so the RAW document
    fails the schema with `raw_schema_errors` > 0. That misuse is recorded, not
    masked. The script's preferred `cargo cyclonedx` path is not exercised here.
  * `Unicode-3.0` appears in one expression but is absent from this schema's SPDX
    snapshot (v1.0-3.21, which predates it) — recorded as a known list-version lag.
  * The reproducibility/determinism claim is self-consistency (re-run stability),
    NOT an external check; it stays Modelled.

REPRODUCE (offline; no kshana Rust code involved):
    python3 -m venv /tmp/sbomvenv
    /tmp/sbomvenv/bin/pip install jsonschema referencing
    cd <kshana repo root>
    bash scripts/gen-sbom.sh > /tmp/sbom.json
    /tmp/sbomvenv/bin/python \
      tests/fixtures/reproducibility_software_assurance/generate_reproducibility_software_assurance_reference.py \
      /tmp/sbom.json > tests/fixtures/reproducibility_software_assurance/reproducibility_software_assurance_reference.txt

Generated with jsonschema (Draft-07) against CycloneDX 1.5 schema (SPDX list v1.0-3.21).
"""

import hashlib
import json
import os
import sys

from jsonschema import Draft7Validator
from referencing import Registry, Resource
from referencing.jsonschema import DRAFT7

HERE = os.path.dirname(os.path.abspath(__file__))

# SPDX expression operators / syntax markers. Anything containing one of these is
# a compound SPDX *expression*, not a single SPDX *id*. ('/' is Cargo's legacy
# non-standard separator, e.g. "MIT/Apache-2.0".)
SPDX_OPS = (" OR ", " AND ", " WITH ", "/", "(", ")")


def is_compound(value: str) -> bool:
    return any(op in value for op in SPDX_OPS)


def load_schema(name):
    with open(os.path.join(HERE, name)) as fh:
        return json.load(fh)


def build_validator():
    bom = load_schema("bom-1.5.schema.json")
    spdx = load_schema("spdx.schema.json")
    jsf = load_schema("jsf-0.82.schema.json")

    def res(doc):
        return Resource.from_contents(doc, default_specification=DRAFT7)

    registry = Registry().with_resources(
        [
            ("http://cyclonedx.org/schema/bom-1.5.schema.json", res(bom)),
            ("bom-1.5.schema.json", res(bom)),
            ("http://cyclonedx.org/schema/spdx.schema.json", res(spdx)),
            ("spdx.schema.json", res(spdx)),
            ("http://cyclonedx.org/schema/jsf-0.82.schema.json", res(jsf)),
            ("jsf-0.82.schema.json", res(jsf)),
        ]
    )
    return Draft7Validator(bom, registry=registry), set(spdx["enum"])


def normalize(sbom):
    """Apply the SPDX/CycloneDX rule verbatim: a compound expression in
    `license.id` is moved to the `expression` tuple form; a single id stays.
    Returns (normalized_doc, n_moved)."""
    doc = json.loads(json.dumps(sbom))
    moved = 0
    for comp in doc.get("components", []):
        if "licenses" not in comp:
            continue
        new = []
        for entry in comp["licenses"]:
            lic = entry.get("license", {})
            if "id" in lic and is_compound(lic["id"]):
                # '/' is Cargo's legacy "OR"; render as the SPDX 'OR' operator.
                new.append({"expression": lic["id"].replace("/", " OR ")})
                moved += 1
            else:
                new.append(entry)
        comp["licenses"] = new
    return doc, moved


def main():
    if len(sys.argv) != 2:
        sys.exit("usage: generate_..._reference.py <path-to-sbom.json>")
    raw = open(sys.argv[1], "rb").read()
    sbom = json.loads(raw)
    sbom_sha = hashlib.sha256(raw).hexdigest()

    validator, spdx_enum = build_validator()

    raw_errors = list(validator.iter_errors(sbom))
    norm_doc, n_moved = normalize(sbom)
    norm_errors = list(validator.iter_errors(norm_doc))

    # Atomic-id SPDX-enum membership (the genuine external dataset check).
    atomic_ids = []
    invalid_atomic = []
    for comp in norm_doc.get("components", []):
        for entry in comp.get("licenses", []):
            lic = entry.get("license", {})
            if "id" in lic:
                atomic_ids.append(lic["id"])
                if lic["id"] not in spdx_enum:
                    invalid_atomic.append(lic["id"])

    components = sbom.get("components", [])

    print("# kshana SBOM conformance verdict vs official CycloneDX 1.5 schema")
    print("# oracle: CycloneDX 1.5 JSON Schema (Apache-2.0); SPDX list v1.0-3.21 (613 ids)")
    print("# validator: python jsonschema (Draft-07). Inputs = stdout of scripts/gen-sbom.sh.")
    print("# Lines are KEY value. See generator docstring for the honest scope.")
    print(f"bom_format {sbom.get('bomFormat')}")
    print(f"spec_version {sbom.get('specVersion')}")
    print(f"component_count {len(components)}")
    print(f"spdx_enum_size {len(spdx_enum)}")
    print(f"raw_schema_errors {len(raw_errors)}")
    print(f"normalized_schema_errors {len(norm_errors)}")
    print(f"compound_count {n_moved}")
    print(f"atomic_id_count {len(atomic_ids)}")
    print(f"atomic_ids_invalid_count {len(invalid_atomic)}")
    print(f"atomic_ids_all_valid_spdx {'1' if not invalid_atomic else '0'}")
    print(f"sbom_sha256 {sbom_sha}")
    # Record every distinct atomic id and whether it is in the SPDX enum.
    for lic in sorted(set(atomic_ids)):
        print(f"atomic_id {('VALID' if lic in spdx_enum else 'INVALID')} {lic}")
    # Record every distinct compound expression that gen-sbom.sh mis-placed in id.
    seen = set()
    for comp in sbom.get("components", []):
        for entry in comp.get("licenses", []):
            lic = entry.get("license", {})
            if "id" in lic and is_compound(lic["id"]) and lic["id"] not in seen:
                seen.add(lic["id"])
                print(f"compound_id {lic['id']}")


if __name__ == "__main__":
    main()
