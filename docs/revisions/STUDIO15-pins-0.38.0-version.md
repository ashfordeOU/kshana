# Pins that carry the engine version, re-blessed at the 0.38.0 bump

Date: 2026-10-19. Companion to `STUDIO15-pins-0.37.0-version.md`. Bars, tolerances and scenarios: unchanged.

The version bump (202fcbf0) was run through the pin-bearing tests (`cargo test --release`). Four test files
hold values that depend on the engine version string. Between the integration merge of the six 0.38
branches (20485306, version 0.37.0) and the bump, the only change under `src/`, `tests/` and `Cargo.toml` is
the `version` line of `Cargo.toml` (`git diff 20485306 202fcbf0 -- src tests Cargo.toml`), so what moved is a
function of the version string.

## Evidence that the version is the only difference

The same four test files, with their previous pins unchanged, were run on a worktree at 20485306 (0.37.0)
and all pass there: `geometry_trust_no_change` 5 of 5, `iq_campaign` 17 of 17 (2 ignored as always),
`published_figures_still_reproduce` 5 of 5 and `skyline_scenarios` 14 of 14. At the bump they fail, and the
failing runs give the new values below.

## 1. `tests/geometry_trust_no_change.rs`: 21 telemetry hashes

The Prometheus, CEF and LEEF exporters write the engine version. The 21 changed hashes are all of the
`telemetry ...` kind (the 0.35-view telemetry of the static example, the vessel demo and the replayed stream, the
0.36 telemetry and the label-free telemetry); no result, CSV, SVG, verdict or `$PKSHT` pin moved.

## 2. `tests/skyline_scenarios.rs`: the 0.36 portable baseline

`tests/fixtures/skyline/flat_hashes_0.36-portable.txt`: 38 rows re-blessed with
`KSHANA_BLESS_SKYLINE_PORTABLE=1 cargo test --release --test skyline_scenarios write_the_portable_baseline_on_request`
(every result carries `engine_version` and digests of content that contains it). The test passes afterwards.

## 3. `tests/iq_campaign.rs`: `DIGEST_M2M4` and `DIGEST_NWPR`

Both cover every cell file of the reference campaigns, and each cell file names the engine version.

| pin | at 0.37.0 (previous) | at 0.38.0 (new) |
|---|---|---|
| `DIGEST_M2M4` | `aacd016b1a68d26174b7aa7c27925418312e2e4e911b03065a869ea35940935a` | `e991c6de164629957148243b927ea25ed44eb636b0c8c62672979d71a48f7bf3` |
| `DIGEST_NWPR` | `d35642535d7dd66980516edf95d0dc64b350663352728e5898e42881846a60a5` | `88b714ddfcb58b4b451dac14d830eb7e86226730e349276457c11f9853eb655a` |

## 4. The three README demo charts

`docs/assets/clock-holdover.svg`, `inertial-deadreckoning.svg` and `orbit-gnss-challenged.svg` name the engine
version in their footer; each differs from the committed chart by that stamp alone (one line), and
`tests/published_figures_still_reproduce.rs` passes afterwards.

No scored value, result number or tolerance moved.
