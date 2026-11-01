# Pins that carry the engine version, re-blessed at the 0.40.0 bump

Date: 2026-10-28. Companion to `STUDIO15-pins-0.39.0-version.md`. Bars, tolerances and scenarios: unchanged. The owner approved
this re-bless on 27 Oct 2026 ("I re-bless (Recommended)"), at the version bump and after the final merges, on the condition that
nothing moves for a reason other than the version string or the dependency list.

The version bump (3bdb3952) was run through the pin-bearing tests (`cargo test --release`). The same four test files as at 0.39.0
hold values that depend on the engine version string. The integration branch immediately before the bump (804c02db, version 0.39.0,
with every 0.40 branch merged) differs from the bump in `Cargo.toml`, the lock files, the version surfaces, the changelog, the README
and its assets, and nothing under `src/` or `tests/`: `git diff 804c02db 3bdb3952 -- src tests` is empty. What moved is
therefore a function of the version string.

## Evidence that the version is the only difference

The same four test files, with their previous pins unchanged, were run at 804c02db (0.39.0, all 0.40 branches merged) and all pass
there: `geometry_trust_no_change` 5 of 5, `iq_campaign` 17 of 17 (2 ignored as always), `published_figures_still_reproduce` 5 of 5
and `skyline_scenarios` 14 of 14. At the bump they fail, and the failing runs give the new values below. After the re-bless
they pass again (5 of 5, 17 of 17 with 2 ignored, 5 of 5, 14 of 14).

## 1. `tests/geometry_trust_no_change.rs`: 21 telemetry hashes

The Prometheus, CEF and LEEF exporters write the engine version. The 21 changed hashes are all of the `telemetry ...` kind
(checked label by label by the re-bless script, which refuses any other label): three each in the static example, the vessel
demo and the replayed stream (the Prometheus, CEF and LEEF exporters over the result or the lines), the six of the vessel demo's
pinned 0.36 telemetry, and the six of the label-fields test. No result, CSV, SVG, verdict or `$PKSHT` pin moved.

## 2. `tests/skyline_scenarios.rs`: the 0.36 portable baseline

`tests/fixtures/skyline/flat_hashes_0.36-portable.txt`: 38 rows re-blessed with
`KSHANA_BLESS_SKYLINE_PORTABLE=1 cargo test --release --test skyline_scenarios write_the_portable_baseline_on_request`
(every result carries `engine_version` and digests of content that contains it). The test passes afterwards (14 of 14).

## 3. `tests/iq_campaign.rs`: `DIGEST_M2M4` and `DIGEST_NWPR`

Both cover every cell file of the reference campaigns, and each cell file names the engine version.

| pin | at 0.39.0 (previous) | at 0.40.0 (new) |
|---|---|---|
| `DIGEST_M2M4` | `2bd0a21b2b3b8c36d0e4cd8eaf9513abc4305418c45bb288793ed4839b884389` | `91d3153ae519995b7e6ad5622c5d1e817f040a39f2a3fb8684eac3422f72e8b0` |
| `DIGEST_NWPR` | `32193dc4a63dd03f4f0d513f7914525d8f77ae37762af4dc8b645f8d1636ca84` | `ac7c739ea09e472499db1e1346f7ba476fa845f5d516ea2874e59a8b7426b254` |

The test passes afterwards (17 of 17, 2 ignored).

## 4. The three README demo charts

`docs/assets/clock-holdover.svg`, `inertial-deadreckoning.svg` (from `scenarios/imu-deadreckoning.toml`) and
`orbit-gnss-challenged.svg` name the engine version in their footer. Each was re-rendered; each equals the committed chart with
`0.39.0` replaced by `0.40.0`, and nothing else differs (checked byte for byte). `tests/published_figures_still_reproduce.rs`
passes 5 of 5 afterwards.

## 5. The SBOM verdict fixture

`tests/fixtures/reproducibility_software_assurance/reproducibility_software_assurance_reference.txt`, re-run against the final
`Cargo.lock` with the procedure in `I18N-sbom-verdict-dependency-growth.md` (`scripts/gen-sbom.sh`, then the fixture's generator).
The component count stays 127 (the dependency list is the one that entry records); the only line that moved is `sbom_sha256`,
from `25327ffdefd20af973fdf54035b116ec66a82bb06621d9da7539495cdc9d67ca` to
`7b90839a5ab454a67f0b60b23d4e1bee481137173c828ecdab107c7faeb18076`, because the document names the `kshana` component's own
version. The test passes (1 of 1).

No scored value, result number or tolerance moved.
