# Pre-registration: un-gating the real-SRTM tests (WP-10, CAP-27d)

Committed alone, before Kshana's SRTM reader is run on the comparison inputs below. The bars
are not loosened after the run. A miss is recorded with its numbers.

## The change

Three tests in `tests/terrain_nav_validation.rs` are `#[ignore]`-gated because they need a
full 25 MB 1-arc-second SRTM tile and GDAL on the path (`real_srtm_tile_whitney_in_survey_band`,
`real_srtm_tile_badwater_in_survey_band`, `gdal_cross_check`, the last a placeholder that
asserts only that a node is finite). They are replaced in CI by tests that read two committed
**full-resolution crops**:

| crop | source tile | south-west node | size | step |
|---|---|---|---|---|
| `N36W119_whitney_crop1s.hgt` | SRTM v3 N36W119 | 36 + 1903/3600 N, -119 + 2368/3600 E | 361 x 361 | 1/3600 deg |
| `N36W117_badwater_crop1s.hgt` | SRTM v3 N36W117 | 36 + 720/3600 N, -117 + 450/3600 E | 361 x 361 | 1/3600 deg |

The samples are copied verbatim (16-bit big-endian, north row first). Source tiles:
`s3.amazonaws.com/elevation-tiles-prod/skadi/N36/N36W119.hgt.gz` (sha256 of the unzipped
tile 0f55d40d89d997178bdbc99dd4d31c9d526d0690fc0bba30696ec22e7d5872b4) and
`.../N36W117.hgt.gz` (unzipped 639c00935467913fe21212b1ceeada4ee48a4dc6d35da168c5c3586cfa51f36a).
Crop sha256: Whitney d26c5393c21855aab4d9558e1642d49df42be5116ba29577770df4b0054e5b05,
Badwater 69c2599a4add14633bedddb0f826b48b26c7f495ed979143edfd7ed8c413ac20.

A new constructor reads a rectangular `.hgt` window with an explicit step
(`DemGrid::from_hgt_window`); `DemGrid::from_srtm_hgt` is unchanged.

## Oracles and bars (fixed now)

**O1. Published survey heights** (unchanged bands, the same ones the gated tests used):
bilinear elevation from the Whitney crop at 36.5786 N, -118.2920 E in [4380, 4430] m
(surveyed summit 4421 m); from the Badwater crop at 36.250 N, -116.825 E in [-95, -70] m
(surveyed -86 m).

**O2. GDAL**, an independent reader: `gdallocationinfo -valonly -wgs84` from GDAL 3.8.4
(Ubuntu `gdal-bin` 3.8.4+dfsg-3ubuntu3), run on the **full** tiles, which returns the value of
the pixel containing the point (SRTMHGT is pixel-is-area with pixel centres on the arc-second
nodes, so that is the nearest node). Values recorded before Kshana was run:

| tile | lon | lat | GDAL |
|---|---|---|---|
| N36W119 | -118.2923 | 36.5785 | 4414 |
| N36W119 | -118.2920 | 36.5786 | 4412 |
| N36W119 | -118.3137 | 36.5512 | 3752 |
| N36W119 | -118.2581 | 36.6043 | 3385 |
| N36W117 | -116.825 | 36.250 | -78 |
| N36W117 | -116.8043 | 36.2317 | -85 |
| N36W117 | -116.8461 | 36.2733 | -84 |
| N36W117 | -116.7862 | 36.2871 | 102 |

Bar: Kshana's nearest-node value from the committed crop at each point equals GDAL's
**exactly** (integer metres, zero tolerance). This checks the crop's geo-reference, the row
order and the byte order against an independent implementation.

GDAL 3.8.4 has no bilinear location query (`-r bilinear` needs 3.10), so the bilinear sample is
checked only by O1 and by the existing exact hand-built midpoint oracle.

**O3. Live GDAL** (stays `#[ignore]`, needs the full tiles and GDAL): the same comparison
re-run against `gdallocationinfo` at test time, for anyone who has them.

## Decision rule

All eight O2 equalities and both O1 bands hold: the un-gated tests pass and the ledger row
'SRTM digital-elevation reader on real terrain' cites them. Any miss is a finding, reported
with the point and both values, and is not tuned away (no change to a point, a band or the
crop after the run).
