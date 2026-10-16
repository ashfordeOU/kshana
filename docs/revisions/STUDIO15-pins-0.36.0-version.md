# STUDIO-15: three more pins that carry the engine version, re-blessed at the 0.36.0 bump

Date: 2026-10-16. Companion to `STUDIO15-skyline-baseline-0.36.0.md`. Bars, tolerances and scenarios: unchanged.

The skyline baseline was the first pin the full CI run reported after the version bump. A debug run of the
other tests that pin hashes of whole outputs, at 0.36.0, found three more that hold for one engine version.
Both were blessed on the integration head (b1558f70), when `Cargo.toml` still said 0.35.0.

## 1. `tests/geometry_trust_no_change.rs`: 16 telemetry hashes

The telemetry exporters (Prometheus, CEF, LEEF) write the engine version. The five tests of the file pin their
output; 16 pinned hashes (three exporters over the static example, the vessel demo, the replayed stream, the
0.36 telemetry and the label-free telemetry) differ at 0.36.0. Every other pin of the file (result, CSV,
SVG, verdict, `$PKSHT`) matched and did not move.

Evidence that the version is the only difference: with the engine version in the telemetry text mapped back
to 0.35.0, all five tests pass against the previous pins. The new values come from the failing run itself
(left side of each assertion); nothing else in the file changed except a header sentence saying the telemetry
pins hold for one version.

## 2. `tests/iq_campaign.rs`: `DIGEST_M2M4` and `DIGEST_NWPR`

Both digests cover every cell file of the reference campaigns, and each cell file names the engine version.

| pin | at 0.35.0 (previous) | at 0.36.0 (new) |
|---|---|---|
| `DIGEST_M2M4` | `8adacb22ba8a30e5794546ca068a7eeee5759000a6edd5392d2446eeb36ab878` | `8e4f74c4c53a92d337b0c14e83dc11d45cd4e3ade572494c89e96b47b29257f5` |
| `DIGEST_NWPR` | `f34be6e208759d219bd8ab2e417510b2e6a5df20af20981152e63a97faaf7031` | `7fb26d8589fca25ee753f8995bfebe0c81707bb66f05c82311f32120ae73ee93` |

Evidence: the same source built at 0.35.0 reproduced both previous digests exactly; at 0.36.0 it gives the new
pair. Of the other tests of the file, 16 pass at 0.36.0 unchanged (the scored results among them, which do not
carry the version) and 2 are ignored by default.

## 3. `tests/fusion_coupled_pack.rs`: the two chart pins

The test blanked the engine version in the result JSON (its header says the version is excluded because it
moves every release) but not in the chart, which names it too. The JSON and summary pins matched at 0.36.0;
the two chart pins did not. Evidence: with the version in the chart mapped back to 0.35.0, both previous
pins reproduce. Change: the chart is blanked the same way as the JSON, so these pins no longer move with the
version, and the two chart hashes are re-pinned once (fusion-pnt `3cfdcf6f...` -> `5102614a...`, hybrid-pnt
`699add2a...` -> `7409368f...`). The JSON and summary pins are unchanged.

## 4. The three README demo charts

`docs/assets/clock-holdover.svg`, `inertial-deadreckoning.svg` and `orbit-gnss-challenged.svg` are checked by
`tests/published_figures_still_reproduce.rs` against what the engine emits today. Each name the engine
version in its footer. They were re-rendered with `api::run_scenario` at 0.36.0 (the test's own recipe); each
differs from the committed chart by that one version stamp and nothing else (the committed chart, with 0.35.0
mapped to 0.36.0, equals the new one byte for byte), so no plotted value moved.

## Full suite at 0.36.0

After these changes the whole suite was run once at 0.36.0 with fresh builds (`cargo test --release`,
release symbols stripped to fit the disk): the library tests, all 515 integration test files and the doc
tests, 5,290 tests passed, none failed (ignored tests are not run by default).

## What was not changed

No bar, tolerance, threshold or scenario; no VALIDATED verdict; the frozen prediction files; the historical
0.35.0 baselines. A pin that holds for one version is re-blessed at each version bump with a record like
this one.
