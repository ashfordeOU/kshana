#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
#
# Generate a CycloneDX 1.5 software bill of materials (SBOM) for the build.
# Prefers `cargo cyclonedx` when installed; otherwise falls back to a minimal,
# dependency-free SBOM assembled from `cargo metadata` (always available with
# the toolchain). The SBOM enumerates every crate in the resolved dependency
# graph with its exact version and source — the provenance baseline for a
# release. Output: a single CycloneDX JSON document on stdout.
set -euo pipefail

# The set of crates that actually ship in the release artifacts (the resolved
# graph minus dev-only deps) is pinned by Cargo.lock; this SBOM reflects it.
if command -v cargo-cyclonedx >/dev/null 2>&1; then
  exec cargo cyclonedx --format json --spec-version 1.5 --override-filename - 2>/dev/null
fi

# Fallback: build a CycloneDX 1.5 document from cargo metadata. No network, no
# extra tooling — just the locked dependency set. Deterministic (sorted).
# The metadata JSON is large, so write it to a temp file and pass the *path* as
# argv: the heredoc keeps sole ownership of Python's stdin, and we avoid both the
# stdin/pipe clash and the environment-size limit ("Argument list too long").
meta_file="$(mktemp)"
trap 'rm -f "$meta_file"' EXIT
cargo metadata --format-version 1 --locked > "$meta_file"
python3 - "$meta_file" <<'PY'
import json, sys, hashlib

with open(sys.argv[1]) as fh:
    meta = json.load(fh)
pkgs = sorted(meta["packages"], key=lambda p: (p["name"], p["version"]))

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
