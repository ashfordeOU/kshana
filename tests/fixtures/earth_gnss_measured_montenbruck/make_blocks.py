#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Satellite block on 2023-01-01 12:00 for every GPS and Galileo PRN, from the IGS satellite
metadata SINEX (SATELLITE/IDENTIFIER: SVN, COSPAR ID, SatCat, block, comment; SATELLITE/PRN:
SVN, valid from, valid to, PRN). Writes blocks.json."""
import hashlib
import json
import sys
import urllib.request
from pathlib import Path

URL = "https://files.igs.org/pub/station/general/igs_satellite_metadata.snx"
WHEN = (2023, 1, 43200)  # year, day of year, seconds of day


def ydoysod(s):
    y, d, sod = (int(v) for v in s.split(":"))
    return (y, d, sod) if y != 0 else (9999, 365, 86400)


def section(lines, name):
    out, inside = [], False
    for l in lines:
        if l.startswith("+" + name):
            inside = True
            continue
        if l.startswith("-" + name):
            break
        if inside and not l.startswith("*"):
            out.append(l)
    return out


def main():
    raw = urllib.request.urlopen(URL, timeout=120).read()
    digest = hashlib.sha256(raw).hexdigest()
    lines = raw.decode("ascii", "replace").splitlines()
    ident = {}
    for l in section(lines, "SATELLITE/IDENTIFIER"):
        f = l.split()
        # SVN COSPAR SatCat Block Comment...
        ident[f[0]] = {"block": f[3], "name": " ".join(f[4:])}
    sats = {}
    for l in section(lines, "SATELLITE/PRN"):
        f = l.split()
        svn, start, end, prn = f[0], ydoysod(f[1]), ydoysod(f[2]), f[3]
        if prn[0] in "GE" and start <= WHEN <= end:
            info = ident.get(svn, {"block": "unknown", "name": ""})
            sats[prn] = {"svn": svn, "block": info["block"], "name": info["name"].split()[0] if info["name"] else ""}
    out = {"source": URL, "source_sha256": digest, "valid_at": "2023-01-01 12:00",
           "satellites": dict(sorted(sats.items()))}
    Path(__file__).with_name("blocks.json").write_text(json.dumps(out, indent=1) + "\n")


if __name__ == "__main__":
    main()
