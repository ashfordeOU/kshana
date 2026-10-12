#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Check an OpenCPN plugin-catalogue metadata file against the rules of ocpn-plugin.xsd.

    scripts/check-opencpn-metadata.py <metadata.xml> [--tarball <file.tar.gz>]

The schema is the OpenCPN plugins project's (github.com/OpenCPN/plugins, ocpn-plugin.xsd). It is not
copied here (it is that project's file); this applies the same rules to the one file we make: the root is
<opencpn-plugin version="...">, the children come in the schema's order, <summary> is 72 characters or
fewer, <target> and <target-arch> are values the schema lists. With --tarball, the checksum in the file
must be the tarball's SHA-256 and the URL must end in the tarball's name. The OpenCPN project's own
`validate_xml.sh` (see SUBMITTING.md) remains the check that decides.
"""
from __future__ import annotations

import hashlib
import os
import sys
import xml.etree.ElementTree as ET

# xs:sequence of the schema, with the optional elements marked. <info-url> may appear twice in the schema;
# the metadata files use it once.
ORDER = [
    ("name", True), ("version", True), ("release", True), ("summary", True), ("api-version", True),
    ("open-source", True), ("author", True), ("source", True), ("info-url", False), ("description", True),
    ("target", True), ("target-version", True), ("target-arch", True), ("tarball-url", True),
    ("tarball-checksum", False),
]
TARGETS = {
    "all", "android-arm64", "android-arm64-v8a", "android-armeabi-v7a", "android-armhf", "darwin",
    "darwin-arm64", "darwin-wx315", "darwin-wx32", "debian-armhf", "debian-wx32-armhf", "debian-gtk3-armhf",
    "debian-x86_64", "debian-wx32-x86_64", "debian-arm64", "debian-wx32-arm64", "flatpak-aarch64",
    "flatpak-x86_64", "mingw", "mingw-x86_64", "msvc", "msvc-64", "msvc-wx32", "raspbian-armhf",
    "ubuntu-armhf", "ubuntu-gtk3-armhf", "ubuntu-gtk3-x86_64", "ubuntu-x86_64", "ubuntu-wx32-x86_64",
}
ARCHS = {"x86_64", "x86", "armhf", "arm64", "aarch64", "noarch", "arm64;x86_64", "x86_64;arm64"}


def fail(msg: str) -> None:
    print(f"FAIL: {msg}", file=sys.stderr)
    sys.exit(1)


def main(argv: list[str]) -> int:
    if len(argv) < 2:
        print(__doc__, file=sys.stderr)
        return 2
    path = argv[1]
    tarball = argv[argv.index("--tarball") + 1] if "--tarball" in argv else None
    try:
        root = ET.parse(path).getroot()
    except ET.ParseError as e:
        fail(f"{path} is not well-formed XML: {e}")
    if root.tag != "opencpn-plugin" or "version" not in root.attrib:
        fail("the root must be <opencpn-plugin version=\"...\">")
    kids = list(root)
    names = [k.tag for k in kids]
    want = [n for n, req in ORDER if req or n in names]
    if names != want:
        fail(f"children are {names}, the schema's order for them is {want}")
    val = {k.tag: (k.text or "").strip() for k in kids}
    for n, req in ORDER:
        if req and not val.get(n):
            fail(f"<{n}> is empty")
    if len(val["summary"]) > 72:
        fail(f"<summary> is {len(val['summary'])} characters; the limit is 72")
    if val["target"] not in TARGETS:
        fail(f"<target> {val['target']!r} is not a value the schema lists")
    if val["target-arch"] not in ARCHS:
        fail(f"<target-arch> {val['target-arch']!r} is not a value the schema lists")
    if val["open-source"] not in ("yes", "no"):
        fail("<open-source> must be yes or no")
    if not val["tarball-url"].startswith("https://"):
        fail("<tarball-url> must be an https URL")
    if tarball:
        want_sum = "sha256:" + hashlib.sha256(open(tarball, "rb").read()).hexdigest()
        if val.get("tarball-checksum") != want_sum:
            fail(f"<tarball-checksum> is {val.get('tarball-checksum')!r}, the tarball's is {want_sum}")
        if os.path.basename(val["tarball-url"]) != os.path.basename(tarball):
            fail(f"<tarball-url> ends in {os.path.basename(val['tarball-url'])!r}, the tarball is {os.path.basename(tarball)!r}")
    print(f"OK: {os.path.basename(path)} follows the schema's rules"
          + (" and matches the tarball" if tarball else ""))
    return 0


if __name__ == "__main__":
    sys.exit(main(sys.argv))
