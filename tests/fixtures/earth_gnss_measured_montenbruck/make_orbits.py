#!/usr/bin/env python3
# SPDX-License-Identifier: AGPL-3.0-only
"""Fetch the ESA/ESOC final multi-GNSS orbit for 2023-01-01 and write the GPS and Galileo
Earth-fixed positions every 10 minutes (every second 5-minute record) to
orbits_20230101_10min.csv (epoch index 0..143, satellite, x, y, z in metres)."""
import gzip
import hashlib
import sys
import urllib.request
from pathlib import Path

URL = ("http://navigation-office.esa.int/products/gnss-products/2243/"
       "ESA0MGNFIN_20230010000_01D_05M_ORB.SP3.gz")
SHA256_GZ = sys.argv[1] if len(sys.argv) > 1 else None


def main():
    raw = urllib.request.urlopen(URL, timeout=120).read()
    digest = hashlib.sha256(raw).hexdigest()
    if SHA256_GZ and digest != SHA256_GZ:
        raise SystemExit(f"unexpected file {digest}")
    text = gzip.decompress(raw).decode("ascii")
    out = [f"# source {URL} sha256(gz) {digest}",
           "epoch,sat,x_m,y_m,z_m"]
    k = -1
    keep = False
    for line in text.splitlines():
        if line.startswith("*  "):
            k += 1
            keep = k % 2 == 0
            continue
        if keep and line.startswith("P") and line[1] in "GE":
            sat = line[1:4]
            x, y, z = (float(line[4 + 14 * i:18 + 14 * i]) for i in range(3))
            if abs(x) < 1e-6 and abs(y) < 1e-6 and abs(z) < 1e-6:
                continue  # SP3 missing-position marker
            out.append(f"{k // 2},{sat},{x * 1e3:.3f},{y * 1e3:.3f},{z * 1e3:.3f}")
    if k != 287:
        raise SystemExit(f"expected 288 epochs, found {k + 1}")
    Path(__file__).with_name("orbits_20230101_10min.csv").write_text("\n".join(out) + "\n")


if __name__ == "__main__":
    main()
