<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# CAP-12 revision (2026-10-14): Galileo E1 and E5a minimum received powers to OS SIS ICD Issue 2.1

**Programme rule R4:** a changed published number is a revision, never a silent correction. This
file is that revision. Every output value that moves is listed old → new in
[`CAP12-galileo-icd21-power-cells.csv`](CAP12-galileo-icd21-power-cells.csv): 1766 values in 9
scenario results. The CSV has the scenario, the JSON path in its `result.json`, the old value and
the new value, and its SHA-256 is
`c74f515ac2391ac5128986d397a26362f006df1a812463c3f70339f05996512c`.

**Rule R1** is additive-only. This change is an authorised exception: the coordinator approved
it on 2026-10-13, after the CAP-12 band work found the discrepancy. Its whole extent is
enumerated here.

## 1. What changed in the engine

`spectrum::default_band`, the minimum received power of two existing bands:

| band | was | is | source |
|---|---|---|---|
| `galileo-e1` | −157.0 dBW | **−157.25 dBW** | Galileo OS SIS ICD Issue 2.1 (November 2023), Table 12: E1-B/C total, 50/50 B/C sharing |
| `galileo-e5a` | −155.0 dBW | **−155.25 dBW** | same table: E5a total I+Q, 50/50 sharing |

The old values came from an earlier issue of the ICD. The carriers, modulations and front-end
bands are unchanged. `leo_signal`'s GNSS victims `galileo-e1` and `galileo-e5a` take their
received power from `default_band`, so they move with it. `docs/SPECTRUM.md` and the doc
comment of `default_band` cite Issue 2.1.

**Not changed (flagged for a separate decision).** `leo_signal`'s `galileo-e5b` victim
(−155.0 dBW) and `galileo-e5-altboc` victim (−152.0 dBW, "E5a plus E5b minimum powers") are
separate constants and are outside the approved change. Under Issue 2.1 they would be
−155.25 and −152.24 dBW. As left, the AltBOC figure no longer equals the sum of the E5a value in
use (−155.25) and its own E5b value.

## 2. What moved: 9 scenario results, nothing else

Every scenario under `scenarios/` was run before (the release binary of 59d9ef5a) and after the
change, and its `result.json` was compared value by value. 141 are byte-identical. These 9 move:

| scenario | values moved | what |
|---|---|---|
| `campaign-spectrum-holdover-integrity` | 915 | `timeline.channels.cn0_e1_dbhz.values[]` (911, each −0.25 dB); the three spectrum runs' `result_sha256` and the `run_digest` |
| `l-band-waterfall-jamming` | 325 | E1 and E5a bands: `signal_power_dbw`, `tracked_power_dbw`, `nominal_cn0_dbhz` and `psd_peak_dbw_per_hz` −0.25 dB; every J/S on them +0.25 dB; effective C/N0 −0.25 dB (for example E1 under the wideband jammer, 4.694 → 4.444 dB-Hz); the waterfall cells of the two bands; the `jamming_kind_cross_check` row on E1, which moves on both sides and keeps its identity; the SigMF comparison block at the 1e-8 level |
| `leo-resilience-js-margin` | 261 | the E5a band as above, every jammer's J/S +0.25 dB and C/N0 −0.25 dB (for example 11.463 → 11.213 dB-Hz at the strongest jammer), the timeline |
| `multi-band-jamming-waterfall` | 112 | the E5a band as above |
| `leo-resilience-gnss-jammed-leo-carries` | 75 | the per-epoch E5a C/N0 channel (−0.25 dB), the spectrum runs' hashes, the `run_digest` |
| `celeste-iod-classical-pilot-signals` | 36 | `compatibility[].gnss_received_power_dbw` of the E1 and E5a victims (−157 → −157.25, −155 → −155.25) and the LEO-to-GNSS C/N0 degradation on them (each × 10^(−0.025)) |
| `leo-band-trade` | 20 | the same compatibility fields |
| `leo-resilience-multiband-diversity` | 14 | `sweep.nodes[].metrics.cn0_galileo_e5a` (−0.25 dB at each of 13 nodes), the `run_digest` |
| `xona-pulsar-signals` | 8 | the same compatibility fields |

No golden, prediction or pinned test moved:
- `registry_golden`, `cross_platform_golden`, `golden` and `prediction_frozen` pass unchanged;
- the spectrum and LEO-signal library tests pass;
- every test file that names one of these scenarios or bands passes.

No ledger row's status changes.

## 3. Published text that moved with it

| file | was | is |
|---|---|---|
| `docs/SPECTRUM.md`, L-band example table, `galileo-e1` row | nominal 44.98, minimum 4.69 dB-Hz | 44.73, 4.44 dB-Hz |
| `docs/SPECTRUM.md`, L-band example table, `galileo-e5a` row | 46.98, 46.98 dB-Hz | 46.73, 46.73 dB-Hz |
| `docs/SPECTRUM.md`, multi-band table, `galileo-e5a` row | 46.98, 38.76 dB-Hz | 46.73, 38.51 dB-Hz |
| `docs/SPECTRUM.md`, band table | E1 −157.0, E5a −155.0 dBW | −157.25, −155.25 dBW (Issue 2.1, Table 12) |
| `docs/CAMPAIGNS.md`, `campaign-spectrum-holdover-integrity` phases | E1 44.98 / 4.69 / back to 44.98 dB-Hz | 44.73 / 4.44 / 44.73 dB-Hz |
| `docs/LEO-SIGNAL.md`, multi-band table, `galileo-e5a` | 46.98, 38.76 dB-Hz from 30 s | 46.73, 38.51 dB-Hz |
| `docs/assets/readme/lband-waterfall-{light,dark}.svg` (README figure, regenerated with the CAP-06a commit by `tools/gen_readme_assets.py`) | caption: Galileo E1 minimum 4.7, E5a 47.0 dB-Hz; the E1 and E5a waterfall rows | 4.4, 46.7 dB-Hz; the two rows 0.25 dB lower |

Rows tracking, first-loss times and every other column of these tables are unchanged.

Tests that state these numbers:
- `tests/leo_signal_reference.rs::the_plain_l_band_example_is_unchanged_by_the_extension`
  now pins E5a at 46.73 dB-Hz.
- `tests/skyline_scenarios.rs` lists `leo-resilience-gnss-jammed-leo-carries.toml` as changed
  by this revision, as it lists the jammer-Q revision's files. Every listed file must still
  differ, and nothing else may.

**Not updated here (the site worker's port):** the site copies `web/docs/spectrum.html`,
`web/docs/campaigns.html`, `web/docs/leo-signal.html` and `web/llms-full.txt` still carry the
old numbers until the next site build is ported (`web/tools/port_site.py`).

## 4. How to check

```
cargo build --release --bin kshana        # before (59d9ef5a) and after this commit
kshana scenarios/<name>.toml              # each of the 9, both binaries
```

Then compare the two `result.json` files value by value against the CSV.
