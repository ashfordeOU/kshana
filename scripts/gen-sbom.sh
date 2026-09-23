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
# SCOPE — what this document actually covers, stated rather than implied. It
# enumerates every package in the DEFAULT-feature resolution, which is not the
# component set of any single shipped artifact:
#   * it INCLUDES dev-only crates (sgp4, and chrono through it) that are
#     compiled into no shipped library, CLI or binding;
#   * it OMITS crates that only an optional feature resolves — notably the
#     eight-crate pyo3 chain that `--features python` pulls in for the PyPI
#     wheel, which is the FFI boundary of that artifact.
# An earlier comment here claimed the opposite ("the resolved graph minus
# dev-only deps"). That was never true of this script. Making the document
# feature-exact (one SBOM per artifact, dev-kind edges dropped) changes its
# component count, which is pinned as an external-oracle verdict in
# tests/fixtures/reproducibility_software_assurance/ and quoted in the
# verification matrix — so that is a deliberate change carrying a fixture
# regeneration, not a quiet edit here.
set -euo pipefail

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
