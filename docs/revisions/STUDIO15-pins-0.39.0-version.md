# Pins that carry the engine version, re-blessed at the 0.39.0 bump

Date: 2026-10-22. Companion to `STUDIO15-pins-0.38.0-version.md`. Bars, tolerances and scenarios: unchanged.

The version bump (0774f6ce, with 5531a44c for the regenerated README assets) was run through the pin-bearing tests
(`cargo test --release`). The same four test files as at 0.38.0 hold values that depend on the engine version string.
Between the integration merge of the three 0.39 branches (24a27937, version 0.38.0) and the bump, the only change
under `src/` and `tests/` is nothing: `git diff 24a27937 0774f6ce -- src tests` is empty, and the one engine change is the
`version` line of `Cargo.toml`. What moved is therefore a function of the version string. The re-bless is f93a030c.

## Evidence that the version is the only difference

The same four test files, with their previous pins unchanged, were run at 24a27937 (0.38.0) and all pass there:
`geometry_trust_no_change` 5 of 5, `iq_campaign` 17 of 17 (2 ignored as always), `published_figures_still_reproduce`
5 of 5 and `skyline_scenarios` 14 of 14. At the bump they fail, and the failing runs give the new values below.

## 1. `tests/geometry_trust_no_change.rs`: 21 telemetry hashes

The Prometheus, CEF and LEEF exporters write the engine version. The 21 changed hashes are all of the `telemetry ...`
kind (checked label by label); no result, CSV, SVG, verdict or `$PKSHT` pin moved. The five tests pass afterwards.

## 2. `tests/skyline_scenarios.rs`: the 0.36 portable baseline

`tests/fixtures/skyline/flat_hashes_0.36-portable.txt`: 38 rows re-blessed with
`KSHANA_BLESS_SKYLINE_PORTABLE=1 cargo test --release --test skyline_scenarios write_the_portable_baseline_on_request`
(every result carries `engine_version` and digests of content that contains it). The test passes afterwards (14 of 14).

## 3. `tests/iq_campaign.rs`: `DIGEST_M2M4` and `DIGEST_NWPR`

Both cover every cell file of the reference campaigns, and each cell file names the engine version.

| pin | at 0.38.0 (previous) | at 0.39.0 (new) |
|---|---|---|
| `DIGEST_M2M4` | `e991c6de164629957148243b927ea25ed44eb636b0c8c62672979d71a48f7bf3` | `2bd0a21b2b3b8c36d0e4cd8eaf9513abc4305418c45bb288793ed4839b884389` |
| `DIGEST_NWPR` | `88b714ddfcb58b4b451dac14d830eb7e86226730e349276457c11f9853eb655a` | `32193dc4a63dd03f4f0d513f7914525d8f77ae37762af4dc8b645f8d1636ca84` |

The test passes afterwards (17 of 17, 2 ignored).

## 4. The three README demo charts

`docs/assets/clock-holdover.svg`, `inertial-deadreckoning.svg` (from `scenarios/imu-deadreckoning.toml`) and
`orbit-gnss-challenged.svg` name the engine version in their footer. Each was re-rendered; each equals the committed
chart with `0.38.0` replaced by `0.39.0`, and nothing else differs. `tests/published_figures_still_reproduce.rs` passes
5 of 5 afterwards.

No scored value, result number or tolerance moved.
