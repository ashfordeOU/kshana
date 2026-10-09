#!/usr/bin/env bash
# SPDX-License-Identifier: AGPL-3.0-only
#
# CycloneDX 1.5 SBOM for the release artefacts the Rust SBOM (gen-sbom.sh) does not
# describe: the OpenCPN plugin, the Signal K plugin package, the reference-build container
# image and the Grafana dashboards. Output: one JSON document on stdout, deterministic for
# the same inputs. Shipped as kshana-channels-sbom.cdx.json beside kshana-sbom.cdx.json.
#
#   scripts/gen-sbom-channels.sh <version>
#
# Environment (all optional, recorded when set):
#   WX_VERSION   the wxWidgets the plugin was linked against (the build job sets it)
#
# SCOPE, stated rather than implied. It lists each artefact and what it is built from or
# depends on at run time:
#   * OpenCPN plugin   a C++ shared library (GPL-3.0-or-later). Dynamically linked:
#                      wxWidgets (and the C/C++ runtime). Vendored: OpenCPN's
#                      ocpn_plugin.h, at the commit third_party/opencpn/README.txt records.
#   * Signal K plugin  an npm package (AGPL-3.0-only); its `dependencies` from package.json
#                      (none today, and the SBOM says so rather than omitting the section).
#   * reference image  the container; its base images from the Dockerfile FROM lines. The
#                      kshana binary inside it is built from this tag's Rust workspace, so
#                      its crate graph is the one in kshana-sbom.cdx.json (not repeated).
#   * Grafana          each dashboard JSON and the datasource/panel plugins it declares in
#                      `__requires`.
# The Rust crate graph of the engine itself is NOT repeated here.
set -euo pipefail

ver="${1:?usage: gen-sbom-channels.sh <version>}"
root="$(cd "$(dirname "$0")/.." && pwd)"
export SBOM_ROOT="$root" SBOM_VERSION="$ver"
python3 - <<'PY'
import glob, hashlib, json, os, re, sys

root, ver = os.environ["SBOM_ROOT"], os.environ["SBOM_VERSION"]
comps, deps = [], []

def comp(ref, typ, name, version, **extra):
    c = {"bom-ref": ref, "type": typ, "name": name}
    if version:
        c["version"] = version
    c.update(extra)
    comps.append(c)
    return ref

def read(p):
    with open(os.path.join(root, p), encoding="utf-8") as fh:
        return fh.read()

# --- OpenCPN plugin -------------------------------------------------------------------
pi_ver = re.search(r"project\(kshana_pi VERSION ([0-9.]+)", read("integrations/opencpn/plugin/CMakeLists.txt")).group(1)
pi = comp("opencpn-plugin", "library", "kshana_pi", pi_ver,
          purl=f"pkg:generic/kshana-opencpn-plugin@{pi_ver}",
          licenses=[{"license": {"id": "GPL-3.0-or-later"}}],
          description="OpenCPN trust-score panel plugin (libkshana_pi.so)")
wx = comp("wxwidgets", "library", "wxWidgets", os.environ.get("WX_VERSION") or None,
          description="dynamically linked GUI toolkit (3.0 or newer required by CMakeLists.txt)",
          licenses=[{"license": {"name": "wxWindows Library Licence 3.1"}}])
hdr_note = read("integrations/opencpn/plugin/third_party/opencpn/README.txt").strip().splitlines()[0]
hdr = comp("ocpn-plugin-header", "file", "ocpn_plugin.h", None,
           description="vendored OpenCPN plugin API header: " + hdr_note,
           licenses=[{"license": {"id": "GPL-2.0-or-later"}}])
deps.append({"ref": pi, "dependsOn": [wx, hdr]})

# --- Signal K plugin ------------------------------------------------------------------
pkg = json.loads(read("integrations/signalk/package.json"))
sk = comp("signalk-plugin", "library", pkg["name"], pkg["version"],
          purl=f"pkg:npm/{pkg['name']}@{pkg['version']}",
          licenses=[{"license": {"id": pkg.get("license", "NOASSERTION")}}],
          description="Signal K server plugin")
sk_deps = []
for n, v in sorted((pkg.get("dependencies") or {}).items()):
    sk_deps.append(comp(f"npm-{n}", "library", n, v, purl=f"pkg:npm/{n}@{v}"))
deps.append({"ref": sk, "dependsOn": sk_deps})

# --- reference-build image ------------------------------------------------------------
img = comp("reference-image", "container", "kshana-reference-build", ver,
           purl=f"pkg:oci/kshana-reference-build@{ver}",
           description="gate service image; the kshana binary in it is described by kshana-sbom.cdx.json")
bases = []
for m in re.finditer(r"^FROM\s+(\S+)", read("deploy/reference-build/Dockerfile"), re.M):
    image = m.group(1)
    if "AS" in image.upper().split():  # defensive; the AS clause is a separate token
        continue
    name, _, tag = image.partition(":")
    bases.append(comp(f"base-{len(bases)}", "container", name, tag or None,
                      purl=f"pkg:oci/{name}" + (f"?tag={tag}" if tag else ""),
                      description="base image (Dockerfile FROM)"))
deps.append({"ref": img, "dependsOn": bases})

# --- Grafana dashboards ---------------------------------------------------------------
for path in sorted(glob.glob(os.path.join(root, "deploy/grafana", "**", "*.json"), recursive=True)):
    rel = os.path.relpath(path, root)
    with open(path, encoding="utf-8") as fh:
        d = json.load(fh)
    d = d.get("dashboard", d)
    g = comp(f"grafana-{rel}", "data", os.path.basename(path), ver,
             description="Grafana dashboard: " + str(d.get("title", "")))
    reqs = []
    for r in d.get("__requires", []) or []:
        reqs.append(comp(f"grafana-req-{rel}-{r.get('type')}-{r.get('id')}", "library",
                         str(r.get("name") or r.get("id")), r.get("version") or None,
                         description=f"required Grafana {r.get('type')}"))
    deps.append({"ref": g, "dependsOn": reqs})

digest = hashlib.sha256("\n".join(sorted(c["bom-ref"] for c in comps)).encode()).hexdigest()
json.dump({
    "bomFormat": "CycloneDX",
    "specVersion": "1.5",
    "serialNumber": f"urn:uuid:{digest[:8]}-{digest[8:12]}-{digest[12:16]}-{digest[16:20]}-{digest[20:32]}",
    "version": 1,
    "metadata": {"component": {"type": "application", "name": "kshana-release-channels", "version": ver},
                 "tools": [{"name": "gen-sbom-channels.sh", "vendor": "Ashforde OU"}]},
    "components": comps,
    "dependencies": deps,
}, sys.stdout, indent=2)
print()
PY
