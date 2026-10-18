# Pins that carry the engine version, re-blessed at the 0.37.0 bump

Date: 2026-10-18. Companion to `STUDIO15-pins-0.36.0-version.md` and `STUDIO15-skyline-baseline-0.36.0.md`.
Bars, tolerances and scenarios: unchanged.

The full suite (`cargo test --release --all --no-fail-fast`, release symbols stripped to fit the disk), run
straight after the 0.37.0 version bump (43772b74), reported three pinned tests that hold for one engine
version. Between the integration merge (5d49735d, version 0.36.0) and the bump the only change under
`src/`, `tests/` and `Cargo.toml` is the `version` line of `Cargo.toml`
(`git diff 5d49735d 43772b74 -- src tests Cargo.toml`), so what moved is a function of the version string.

## Evidence that the version is the only difference

The same three test files, with their previous pins unchanged, were run on a worktree at 5d49735d (0.36.0)
and all pass there: `geometry_trust_no_change` 5 of 5, `skyline_scenarios` 14 of 14 and
`iq_campaign::the_reference_digests_are_pinned`. At 43772b74 they fail, and the failing runs give the new
values below.

## 1. `tests/geometry_trust_no_change.rs`: 21 telemetry hashes

The Prometheus, CEF and LEEF exporters write the engine version. The 21 changed hashes are all of the
`telemetry ...` kind (the 0.35-view telemetry of the static example, vessel demo and replayed stream, and
the 0.36 and label-free telemetry); no result, CSV, SVG, verdict or `$PKSHT` pin moved.

## 2. `tests/skyline_scenarios.rs`: the 0.36 portable baseline

`tests/fixtures/skyline/flat_hashes_0.36-portable.txt`: 38 of its 42 rows re-blessed with
`KSHANA_BLESS_SKYLINE_PORTABLE=1 cargo test --release --test skyline_scenarios write_the_portable_baseline_on_request`;
the same 38 as at the 0.36.0 bump (every result carries `engine_version` and digests of content that
contains it), the 4 training-NMEA rows are unchanged. The test passes afterwards.

## 3. `tests/iq_campaign.rs`: `DIGEST_M2M4` and `DIGEST_NWPR`

Both cover every cell file of the reference campaigns, and each cell file names the engine version.

| pin | at 0.36.0 (previous) | at 0.37.0 (new) |
|---|---|---|
| `DIGEST_M2M4` | `8e4f74c4c53a92d337b0c14e83dc11d45cd4e3ade572494c89e96b47b29257f5` | `aacd016b1a68d26174b7aa7c27925418312e2e4e911b03065a869ea35940935a` |
| `DIGEST_NWPR` | `7fb26d8589fca25ee753f8995bfebe0c81707bb66f05c82311f32120ae73ee93` | `d35642535d7dd66980516edf95d0dc64b350663352728e5898e42881846a60a5` |

## 4. The three README demo charts

`docs/assets/clock-holdover.svg`, `inertial-deadreckoning.svg` and `orbit-gnss-challenged.svg` name the
engine version in their footer; each differs from the committed chart by that stamp alone, and
`tests/published_figures_still_reproduce.rs` (which compares them with what the engine emits) passes.

No scored value, result number or tolerance moved.
