<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Almanac HDOP: independent oracle (D18, item 1)

`oracle.py` computes HDOP from a YUMA almanac with numpy, and shares no code with
`src/interference_map/almanac_hdop.rs`. Its inputs are in `points.json`: 20 stated epochs and positions,
the almanac `tests/fixtures/gps_almanac/yuma_2026_311.alm`, and a 5° mask. Its output is `expected.json`
(numpy 2.4.6). `flag_fixture.json` holds 12 hand-written reports at those points, each with its expected flag
and the reason. `tests/almanac_hdop.rs` checks the engine against both.

```sh
python3 xval/almanac-hdop/oracle.py > xval/almanac-hdop/expected.json
cargo test --test almanac_hdop -- --nocapture
```

Result: the engine equals the oracle at all 20 points with the same satellite counts. The worst difference is
1.6e-15 (the acceptance limit is 1e-9). The 12 flags are as stated.

This is a unit check of a tool, not an evidence result. The scorer has not been run on real ADS-B data.
