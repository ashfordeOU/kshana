#!/usr/bin/env python3
"""Fetch and gunzip one SRTM 1-arc-second `.hgt` tile for the ignored real-DEM tests.

The committed CI tests use the self-contained synthetic DEM and the tiny 11x11
`tests/fixtures/terrain/mini.hgt` fixture; the real-tile cross-checks in
`tests/terrain_nav_validation.rs` are `#[ignore]`-gated because a 1-degree 1"
tile is ~25 MB unzipped (too big to commit). This helper downloads one tile from
the no-auth Mapzen/Terrarium AWS Open Data "Skadi" mirror and writes the raw
`.hgt` under `tools/srtm/` where the ignored tests look for it.

    Skadi layout: s3.amazonaws.com/elevation-tiles-prod/skadi/<Nxx>/<NxxWyyy>.hgt.gz
    Format: 3601x3601 i16 big-endian, 1-degree tile, void -32768.

Examples (tiles for the published spot-height checks):
    python3 tools/fetch_srtm_tile.py N36 W119   # Mount Whitney  (en.wikipedia.org/wiki/Mount_Whitney)
    python3 tools/fetch_srtm_tile.py N36 W117   # Badwater Basin (en.wikipedia.org/wiki/Badwater_Basin)

Then run the ignored tests:
    cargo test --test terrain_nav_validation -- --ignored
"""
import gzip
import os
import sys
import urllib.request

BASE = "https://s3.amazonaws.com/elevation-tiles-prod/skadi"
OUT_DIR = "tools/srtm"


def main() -> int:
    if len(sys.argv) != 3:
        print("usage: fetch_srtm_tile.py <Nxx|Sxx> <Wyyy|Eyyy>", file=sys.stderr)
        return 2
    lat_band = sys.argv[1].upper()  # e.g. "N36"
    lon_band = sys.argv[2].upper()  # e.g. "W119"
    name = f"{lat_band}{lon_band}"  # e.g. "N36W119"
    url = f"{BASE}/{lat_band}/{name}.hgt.gz"
    os.makedirs(OUT_DIR, exist_ok=True)
    out = os.path.join(OUT_DIR, f"{name}.hgt")
    print(f"fetching {url}")
    with urllib.request.urlopen(url) as resp:  # noqa: S310 (trusted Open Data mirror)
        gz = resp.read()
    raw = gzip.decompress(gz)
    expected = 2 * 3601 * 3601
    if len(raw) != expected:
        print(
            f"warning: {name} is {len(raw)} bytes, expected {expected} (3601x3601 i16); "
            "it may be a 3-arc-second (1201x1201) tile — pass samples_per_side=1201 in the test",
            file=sys.stderr,
        )
    with open(out, "wb") as f:
        f.write(raw)
    print(f"wrote {out}: {len(raw)} bytes")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
