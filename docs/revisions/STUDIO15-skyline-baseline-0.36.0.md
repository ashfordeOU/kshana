# STUDIO-15: the skyline baseline re-blessed at the 0.36.0 version bump

Date: 2026-10-16. Test: `tests/skyline_scenarios.rs`, `every_wired_scenario_is_byte_identical_to_the_0_36_portable_baseline`.
Fixture: `tests/fixtures/skyline/flat_hashes_0.36-portable.txt`. Bars and scenarios: unchanged.

## What happened

The "0.36 portable" baseline was blessed on the integration head (b1558f70), whose `Cargo.toml` still said
0.35.0. The 0.36.0 version bump (c0d917ec) then made 38 of its 42 rows differ, and the full CI run on the
final commit reported them (the coverage job, a debug build). Every result carries `engine_version` and
digests of its own content, so the baseline holds for one engine version. The 38 rows are re-blessed at
0.36.0; the 4 other rows (training NMEA text, which carries neither) are unchanged.

## What was checked before re-blessing (a difference that is not the version would have stopped this)

* **Debug and release agree.** Nine scenarios (the eight below plus `jamming-demo`) were run through
  `api::run_toml` in a debug build and in a freshly rebuilt release build at 0.36.0: the JSON, the chart and
  the summary are byte-identical, so the portable maths holds across build profiles.
* **30 of the 38 rows differ by the version string alone.** With the engine version in each result mapped
  back to 0.35.0 before hashing, those 30 rows reproduce the committed baseline exactly.
* **The other 8 rows differ by the version and by digests of content that contains it.** These are
  `campaign-jam-spoof-holdover-integrity`, `campaign-shared-jammer-sea-road`,
  `campaign-spectrum-holdover-integrity`, `campaign-sweep-jammer-power`,
  `leo-resilience-gnss-jammed-leo-carries`, `leo-vertical-5g-network-timing`,
  `leo-vertical-critical-infrastructure-timing` and `leo-vertical-rail-maritime`. The same source built at
  0.35.0 and at 0.36.0 and compared field by field gives, over those eight and `jamming-demo`, 45 differing
  leaves: `engine_version`, `reproducibility.run_digest`, the campaign members' `result_sha256` and the
  phase digests that repeat them. None of the 45 is a number; every one is the version string or a
  SHA-256 hex digest. The charts and summaries of the same nine are identical once the version string is
  mapped.

## Change

* `flat_hashes_0.36-portable.txt`: 38 rows re-blessed with
  `KSHANA_BLESS_SKYLINE_PORTABLE=1 cargo test --test skyline_scenarios write_the_portable_baseline_on_request`
  in a debug build at 0.36.0; both profiles then pass the test.
* `tests/skyline_scenarios.rs`: the header says the baseline holds for one version and that a version bump
  re-blesses it, with this kind of record. A string replace cannot make the digests version-independent, so
  the test is not made to ignore the version.

The 0.35.0 historical baseline (`flat_hashes_0.35.0.txt`) is untouched and still pinned by hash.
