#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
#
# Generate a CycloneDX 1.5 software bill of materials (SBOM) for the build from
# `cargo metadata` alone — no network, no extra tooling, just the locked
# dependency set with each crate's exact version and source. Deterministic
# (sorted), so the same Cargo.lock always yields the same bytes.
# Output: a single CycloneDX JSON document on stdout.
#
# A `cargo cyclonedx` branch used to sit in front of this, taken whenever that
# tool happened to be installed. It was silently broken: cargo-cyclonedx has no
# stdout mode — write_to_files() is its only output path, and it writes next to
# Cargo.toml — so `--override-filename -` created a file literally named
# `-.json`, printed nothing, and exited 0. `2>/dev/null` discarded the only
# diagnostic and `exec` handed that success status straight back, so
# `set -euo pipefail` never fired. On the publish path the redirect would then
# have written a zero-byte kshana-sbom.cdx.json, SLSA-attested and shipped as
# the release's bill of materials: a signed empty file, all green. One
# `cargo install cargo-cyclonedx` on any machine that cuts a release was the
# whole trigger. The branch is gone; this is the only path, and it is the path
# CI has always taken.
#
# SCOPE — what this document covers, stated rather than implied. It is the
# union of the dependency graphs of every artifact this SBOM is shipped or
# attested alongside, and nothing else:
#   * the crate / CLI default build (the release binary, release.yml);
#   * `--features python` — the PyPI wheel (publish.yml writes this document
#     into dist/ next to the wheels and attests it). This brings in the pyo3
#     chain, the FFI boundary of that artifact;
#   * `--features wasm` — the npm package (publish.yml writes this document
#     INSIDE web/pkg, so it ships in the published tarball of a
#     `wasm-pack build -- --features wasm` build). wasm-bindgen and the
#     wasm32-only getrandom/js-sys edges are therefore in scope.
# The resolve is taken for all target platforms (no --filter-platform): the
# wheels ship for several OSes and the npm package targets wasm32, so a
# platform-conditional edge (libc, wasi, js-sys) is part of some shipped
# artifact. Edges are walked from the root package through `normal` and
# `build` dependency kinds only; `dev` edges are dropped, so test-only crates
# (sgp4, and chrono through it) that are compiled into no shipped artifact are
# excluded. Build-kind edges are kept because they generate code that is
# compiled into the artifact (pyo3-build-config, target-lexicon).
# One document is the UNION, so for any single artifact it is a superset (the
# CLI does not link pyo3; the wheel does not link wasm-bindgen). The component
# count is pinned as an external-oracle verdict in
# tests/fixtures/reproducibility_software_assurance/ and quoted in the
# verification matrix; changing SHIPPED_FEATURES or the kept edge kinds is a
# deliberate change that carries a fixture regeneration.
# The standalone kshana-mcp crate (mcp/kshana-mcp, its own manifest and lock)
# is not described here.
set -euo pipefail

# The metadata JSON is large, so write it to a temp file and pass the *path* as
# argv: the heredoc keeps sole ownership of Python's stdin, and we avoid both the
# stdin/pipe clash and the environment-size limit ("Argument list too long").
meta_file="$(mktemp)"
trap 'rm -f "$meta_file"' EXIT
# The feature union of the shipped artifacts (see SCOPE above).
SHIPPED_FEATURES="python,wasm"
cargo metadata --format-version 1 --locked --features "$SHIPPED_FEATURES" > "$meta_file"
python3 - "$meta_file" <<'PY'
import json, sys, hashlib

with open(sys.argv[1]) as fh:
    meta = json.load(fh)

# Walk the resolve graph from the root through normal/build edges only. A
# `dep_kinds` entry has kind null (normal), "build" or "dev"; an edge is kept if
# ANY of its kinds is normal or build (a crate can be both a dev- and a normal
# dependency of the same parent).
SHIPPED_KINDS = {None, "build"}
nodes = {n["id"]: n for n in meta["resolve"]["nodes"]}
root = meta["resolve"]["root"]
if root is None:
    sys.exit("gen-sbom.sh: cargo metadata resolve has no root package")
reachable = {root}
stack = [root]
while stack:
    for dep in nodes[stack.pop()]["deps"]:
        if any(k.get("kind") in SHIPPED_KINDS for k in dep["dep_kinds"]):
            if dep["pkg"] not in reachable:
                reachable.add(dep["pkg"])
                stack.append(dep["pkg"])

pkgs = sorted(
    (p for p in meta["packages"] if p["id"] in reachable),
    key=lambda p: (p["name"], p["version"]),
)

def purl(p):
    return f"pkg:cargo/{p['name']}@{p['version']}"

components = []
for p in pkgs:
    comp = {
        "type": "library",
        "name": p["name"],
        "version": p["version"],
        "purl": purl(p),
    }
    if p.get("license"):
        comp["licenses"] = [{"license": {"id": p["license"]}}]
    src = p.get("source")
    if src:
        comp["properties"] = [{"name": "cargo:source", "value": src}]
    components.append(comp)

# Deterministic serial number derived from the sorted purl list (no timestamps,
# no randomness — the same dependency set always yields the same SBOM).
digest = hashlib.sha256("\n".join(c["purl"] for c in components).encode()).hexdigest()
sbom = {
    "bomFormat": "CycloneDX",
    "specVersion": "1.5",
    "serialNumber": f"urn:uuid:{digest[:8]}-{digest[8:12]}-{digest[12:16]}-{digest[16:20]}-{digest[20:32]}",
    "version": 1,
    "metadata": {
        "component": {"type": "application", "name": "kshana"},
        "tools": [{"name": "gen-sbom.sh", "vendor": "Ashforde OU"}],
    },
    "components": components,
}
json.dump(sbom, sys.stdout, indent=2, sort_keys=False)
print()
PY
