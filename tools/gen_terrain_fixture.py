#!/usr/bin/env python3
"""Generate the committable SRTM `.hgt` test fixture `tests/fixtures/terrain/mini.hgt`.

This is the SRTM analogue of the committed `tools/egm2008_to70.gfc`: a tiny,
reproducible elevation tile (16-bit signed big-endian, row-major, **north row
first**, void sentinel -32768) that lets the `.hgt` parser be exercised in CI by
`include_bytes!` without a 25 MB download. Re-running this script reproduces the
committed file bit-for-bit.

The layout follows the GDAL SRTMHGT driver spec
(https://gdal.org/en/stable/drivers/raster/srtmhgt.html): an `N`x`N` tile spans a
1-degree cell whose lower-left corner is given by the filename; row 0 is the
northernmost latitude (`ll_lat + 1`), each value is `samples_per_side` apart at
`1/(N-1)` degree spacing, and -32768 marks a void.

We use `N = 11` (so the fixture is `2*11*11 = 242` bytes, < 1 KB) and a smooth,
deterministic synthetic relief plus two deliberately-placed void cells so the
NaN-propagation path is also covered. The elevation at row `i` (north→south),
column `j` (west→east) is:

    elev(i, j) = round(800 + 600*sin(pi*i/(N-1)) * cos(pi*j/(N-1)))   [metres]

with the two corners of the second interior row set to the void sentinel.

Usage:
    python3 tools/gen_terrain_fixture.py tests/fixtures/terrain/mini.hgt
"""
import math
import struct
import sys

N = 11
VOID = -32768
OUT = sys.argv[1] if len(sys.argv) > 1 else "tests/fixtures/terrain/mini.hgt"

# Cells deliberately voided (row, col), north-row-first indexing, to exercise the
# void-rejection path in the parser/sampler.
VOIDS = {(1, 0), (1, N - 1)}


def elev(i: int, j: int) -> int:
    if (i, j) in VOIDS:
        return VOID
    v = 800.0 + 600.0 * math.sin(math.pi * i / (N - 1)) * math.cos(
        math.pi * j / (N - 1)
    )
    return int(round(v))


def main() -> None:
    values = []
    for i in range(N):  # row 0 = northernmost
        for j in range(N):  # col 0 = westernmost
            values.append(elev(i, j))
    # 16-bit signed big-endian, row-major.
    data = b"".join(struct.pack(">h", v) for v in values)
    assert len(data) == 2 * N * N, len(data)
    with open(OUT, "wb") as f:
        f.write(data)
    # Echo a few hand-checkable values so the Rust test can assert against them.
    print(f"wrote {OUT}: {len(data)} bytes, {N}x{N}")
    print(f"  node(0,0) [NW, lat=ll+1, lon=ll]   = {elev(0, 0)}")
    print(f"  node(0,{N-1}) [NE]                  = {elev(0, N - 1)}")
    print(f"  node({N-1},0) [SW, lat=ll, lon=ll]  = {elev(N - 1, 0)}")
    mid = (N - 1) // 2
    print(f"  node({mid},{mid}) [centre]          = {elev(mid, mid)}")
    print(f"  node(1,0) [void]                    = {elev(1, 0)}")


if __name__ == "__main__":
    main()
