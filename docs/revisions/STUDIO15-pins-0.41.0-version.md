# Pins that carry the engine version, re-blessed at the 0.41.0 bump

Date: 2026-11-12. Companion to `STUDIO15-pins-0.40.0-version.md`. Bars, tolerances and scenarios: unchanged. The re-bless
follows the owner's release order for 0.41 ("Release 0.41 with all of it", 11 Nov 2026), relayed by the release coordination,
on the same condition as at 0.40.0: nothing may move for a reason other than the version string.

The version bump (branch `ws/release-041`) was run through the pin-bearing tests (`cargo test --release`). The base it was cut
from (41a70b98, version 0.40.0) differs from the bump in `Cargo.toml`, the lock files, the version surfaces, the README and its
assets, and the re-blessed pins below; `git diff 41a70b98 -- src` is empty. What moved is therefore a function of the version
string.

## Evidence that the version is the only difference

The same four test files, with their previous pins unchanged, were run at the base 41a70b98 (0.40.0) and all pass there:
`geometry_trust_no_change` 5 of 5, `iq_campaign` 17 of 17 (2 ignored as always), `published_figures_still_reproduce` 5 of 5
and `skyline_scenarios` 14 of 14. At the bump they fail, and the failing runs give the new values below. After the re-bless
they pass again (5 of 5, 17 of 17 with 2 ignored, 5 of 5, 14 of 14).

## 1. `tests/geometry_trust_no_change.rs`: 21 telemetry hashes

The Prometheus, CEF and LEEF exporters write the engine version. The 21 changed hashes are all of the `telemetry ...` kind
(checked label by label by the re-bless script, which refuses any other label): three each in the static example, the vessel
demo and the replayed stream (the Prometheus, CEF and LEEF exporters over the result or the lines), the six of the vessel demo's
pinned 0.36 telemetry, and the six of the label-fields test. No result, CSV, SVG, verdict or `$PKSHT` pin moved (11 unchanged
pins were compared and held).

## 2. `tests/skyline_scenarios.rs`: the 0.36 portable baseline

`tests/fixtures/skyline/flat_hashes_0.36-portable.txt`: 38 rows re-blessed with
`KSHANA_BLESS_SKYLINE_PORTABLE=1 cargo test --release --test skyline_scenarios write_the_portable_baseline_on_request`
(every result carries `engine_version` and digests of content that contains it). The test passes afterwards (14 of 14).

## 3. `tests/iq_campaign.rs`: `DIGEST_M2M4` and `DIGEST_NWPR`

Both cover every cell file of the reference campaigns, and each cell file names the engine version.

| pin | at 0.40.0 (previous) | at 0.41.0 (new) |
|---|---|---|
| `DIGEST_M2M4` | `91d3153ae519995b7e6ad5622c5d1e817f040a39f2a3fb8684eac3422f72e8b0` | `68f7ba0f561b838f19dd4c3147a2dbd375516baec823c03488bd5b5e9d1dc67e` |
| `DIGEST_NWPR` | `ac7c739ea09e472499db1e1346f7ba476fa845f5d516ea2874e59a8b7426b254` | `a740a6b5609d76930ed6c85f13089e7ce937b50258b7160810d691e5edcf0531` |

The test passes afterwards (17 of 17, 2 ignored).

## 4. The three README demo charts

`docs/assets/clock-holdover.svg`, `inertial-deadreckoning.svg` (from `scenarios/imu-deadreckoning.toml`) and
`orbit-gnss-challenged.svg` name the engine version in their footer. The test's own diagnosis at the bump was "ONLY the
engine-version stamp in the footer moved — every plotted value is identical". Each chart is the committed one with its single
`0.40.0` replaced by `0.41.0`, and `tests/published_figures_still_reproduce.rs` (which compares the committed bytes with what
the engine emits) passes 5 of 5 afterwards.

## 5. The SBOM verdict fixture

`tests/fixtures/reproducibility_software_assurance/reproducibility_software_assurance_reference.txt`, re-generated against the
bump's `Cargo.lock` with the procedure in `I18N-sbom-verdict-dependency-growth.md` (`scripts/gen-sbom.sh`, then the fixture's
generator, `jsonschema` 4.26.0). The test does not compare this hash, so it passed before and after; the fixture is re-generated
so that it records the SBOM that ships. The only line that moved is `sbom_sha256`, from
`bd7ba406234570446bf28d47b54e4ce79350251cacfb5a1284111b6e4414f2e8` to
`0374f23e2d7b177233b630109de6fee6f714b8d342f084960b061a2db8dd2f93`. It moves for two reasons, both outside the verdict: the
document names the `kshana` component's own version, and the November dependency updates (already noted in that entry on
3 November as moving versions, not the component graph) changed component versions. The two are separable: at the base
commit 41a70b98 (0.40.0) the same generator gives `843e6594b47b24950e1b7e5614305017f1360db8d3977233a12659c50fd3e7e8`, already
different from the pinned value, and the bump moves it on to the new value. The component, compound and identifier
counts and lists are unchanged. The test passes (1 of 1).

No scored value, result number or tolerance moved.
