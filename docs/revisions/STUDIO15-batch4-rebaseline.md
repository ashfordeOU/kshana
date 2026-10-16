<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# STUDIO-15, batch 4 (release 0.36) — the batch 2-3 code on portable maths, and every pinned or published value it moved

Part of [`STUDIO15-portable-math-rebaseline.md`](STUDIO15-portable-math-rebaseline.md) (programme rule R4:
a changed published number is a revision). STUDIO-15 measured and re-recorded the 141 scenarios and the
pins of its own branch. The batch 2 and 3 work was merged after it (`054fa552`) and then routed through
`PortableFloat` (`ab4fbe09`: 457 transcendental call sites in 62 files, seven `rand_distr` samplers to
`portable_distr`, three `gen_range` to `uniform_index`). This file lists what that moved, old -> new, under
the owner's scope decision of 2026-10-13 (STUDIO-15 "c": full portable maths in 0.36 under a written
re-baseline). It is committed before anything below is re-recorded. No bar, tolerance or threshold
changes; no VALIDATED verdict changes; the frozen lunar prediction files and their hashes are untouched.

Two items have their own records: the Greenhall exact edf
([`STUDIO15-greenhall-edf-portable.md`](STUDIO15-greenhall-edf-portable.md)) and the gps-sdr-sim
test-bench oracle re-run ([`STUDIO15-testbench-gpssdrsim-rerun.md`](STUDIO15-testbench-gpssdrsim-rerun.md)).

## 1. Method

Every bundled scenario (158) was run through `kshana::api::run_toml` in release builds at three trees:
`36dc5ba9` (batch 3b, host maths everywhere), `054fa552` (STUDIO-15 merged, batch 2-3 code still on host
maths) and this branch. The comparison is `scenario_rows` of `scripts/studio15_rebaseline_table.py`
(unchanged); the moved numbers are in
[`STUDIO15-batch4-moved-values.csv.gz`](STUDIO15-batch4-moved-values.csv.gz) (scenario, JSON path, old, new,
relative change; 25,811 rows, old = `36dc5ba9`). The test values come from a full release run of the suite
on this branch.

## 2. Bundled scenarios

**`054fa552` -> this branch** (the routing alone): 9 of 158 scenarios move, the 8 batch 2-3 scenarios
marked * below and `pvt-abmf`. Every other result JSON is byte-identical.

**The 17 scenarios added by batch 2-3** (not in STUDIO-15's 141), `36dc5ba9` (host) -> this branch: 11 move;
`ascent-losses`, `eo-radiometry`, `fusion-pnt-coupled`, `gnss-ins-maritime`, `quantum-cai-coast` and
`telecom-synce-eec` are byte-identical.

| scenario | numbers moved / numeric leaves | largest relative change | field | old | new |
|---|---|---|---|---|---|
| `acm-link` | 2 / 79 | 2.918e-15 | `$.passes[1].es_n0_min_db` | 9.738954683943717 | 9.738954683943689 |
| `aocs-slew` * | 2 / 9671 | 1.881e-16 | `$.series.pointing_error_deg[149]` | 4.721611691139163 | 4.721611691139164 |
| `aocs-slew-mekf` * | 4 / 9675 | 2.024e-16 | `$.series.pointing_error_deg[125]` | 8.775111738277422 | 8.775111738277424 |
| `campaign-optimize-link-budget` * | 21 / 544 (and `run_digest`) | 1.895e-14 | `$.optimize.trace[54].metric` | 2.9999826248175907 | 2.9999826248176475 |
| `contact-schedule` | 10 / 163 | 4.395e-15 | `$.contacts[1].max_elevation_deg` | 8.890984298963078 | 8.890984298963039 |
| `entry-heating-stardust` * | 1 / 50 | 1.417e-16 | `$.relative_entry.heading_deg` | 100.28679797884315 | 100.28679797884317 |
| `gnss-ins-aviation` * | 7905 / 16036 | 5.182e-08 | `$.quantum.series[1576].error_m` | 0.09382365429754377 | 0.09382364943555975 |
| `gnss-ins-rail` | 17824 / 36036 | 3.889e-08 | `$.classical.series[2200].error_m` | 0.023936877802692668 | 0.023936878733499173 |
| `gps-denied-gravity-nav-egm2008` * | 2 / 7 | 8.639e-15 | `$.map_matched_error_m` | 3105.535265853692 | 3105.535265853719 |
| `gravity-map-error-mc` * | 5 / 12 | 7.250e-13 | `$.map_matched_error_m` | 144.27245221227884 | 144.27245221238343 |
| `time-transfer-budget` * | 2 / 47 | 2.128e-16 | `$.simulated.tdev[9].tdev_ns` | 0.03260610040562846 | 0.03260610040562847 |

**`pvt-abmf`** (one of STUDIO-15's 141, moved again by the routing of `pvt.rs`): `054fa552` -> this branch,
33 of 46 numbers, largest relative 2.26e-9 (`$.epochs[2].fix.error_h_m`); `36dc5ba9` -> this branch, 32 of 46,
largest 1.95e-9 (1.0682319891558478 -> 1.0682319870775148 m).

No integer, count or presence field moves in any of these documents; the only string that changes is the
`campaign-optimize-link-budget` `reproducibility.run_digest` (1807cb3a... -> 9015901a... against `054fa552`).
A search of `docs/`, `paper/`, `README.md`, `CHANGELOG.md`, `src/verification.rs` and `web/` for every moved
value at 3 to 7 significant digits, in files that name the scenario, found no printed value that now rounds
differently. None of these scenarios has a Studio recorded file except `pvt-abmf`, which STUDIO-15 already
left as recorded (it equals neither engine).

## 3. Pins re-recorded (each through its own generator path)

| pin | old | new |
|---|---|---|
| `tests/skyline_scenarios.rs`, `tests/fixtures/skyline/flat_hashes_0.36-portable.txt` (`KSHANA_BLESS_SKYLINE_PORTABLE=1`) | the 42 rows blessed on the STUDIO-15 branch | 28 rows re-blessed (below); 14 unchanged; the 0.35.0 file untouched |
| `tests/iq_campaign.rs` `DIGEST_M2M4` | `c7e1158086720a590a838f0ab11d0a02922d5c293f0f4216d04b31318228f384` | `8adacb22ba8a30e5794546ca068a7eeee5759000a6edd5392d2446eeb36ab878` |
| `tests/iq_campaign.rs` `DIGEST_NWPR` | `f34be6e208759d219bd8ab2e417510b2e6a5df20af20981152e63a97faaf7031` | unchanged |
| `tests/gnss_ins_legacy_trajectory_pin.rs`, truth hash, `gnss-ins` | `1e23d78ec10e51cd1ca086fae6e69bbfc7e3b93b6288e16a7dbaf07176433338` | `2b02b9375a09246bb993736ce29883329728aebebbd686d2e4db785d47c63e9b` |
| same, `automotive-urban-canyon` | `72d7afc17386fb6087172a8bb00d7265633e4a4bcc03c986178a2ff72dbe5660` | `080caef78371648b2f1e946e3163ba30ef13ec36fa93d0de2916f748c8ac2f08` |
| same, `small-uas-jammed-nav` | `78d1ca1ff77f186203cd74c84ee33618746155d3eb3ac08b08af1cde66debf2d` | `4c9d481a34214a7abeb54f28e520f74dd35fcad46df421fb78dfc1b379fe91c3` |
| same, the three result hashes | | unchanged (the legacy pack path did not move) |
| `tests/lunar_frame_campaign_unobserved_beacon.rs`, stations estimated, `translation_sigma_norm_m` | 632.3769172997296 | 632.3772338224321 (relative 5.0e-7; stations fixed 10.021467977424644 unchanged) |

**Skyline rows re-blessed.** The result JSON of every one of the 28 is byte-identical between `054fa552`
and this branch, so the routing did not move them: they moved through the batch 2-3 changes merged onto
the STUDIO-15 baseline, which was blessed on the STUDIO-15 branch without them. Against that branch's own
output (`2140172c`), 26 differ only by the `figure_tiers` key batch 3 added; `campaign-spectrum-holdover-integrity`
and `leo-resilience-gnss-jammed-leo-carries` also move numerically (largest relative 5.3e-2 and 1.4e-2, their
SVG as well), the 0.36 jammer-Q table change recorded in `xval/jammer-q/RESULTS.md`. Rows:
`araim-gps-galileo`, `campaign-jam-spoof-holdover-integrity`, `campaign-shared-jammer-sea-road`,
`campaign-spectrum-holdover-integrity`, `campaign-sweep-jammer-power`, `gnss-sim-raim`, `integrity-raim`,
`jamming-demo`, `leo-focus-fused-pnt-sisre`, `leo-focus-indoor-uhf`, `leo-focus-iot-eirp`,
`leo-focus-science-iono-sounding`, `leo-indoor-uhf`, `leo-iot-energy`, `leo-pass-iridium`, `leo-pass-vs-gnss-cn0`,
`leo-pass-xona-pulsar`, `leo-resilience-gnss-jammed-leo-carries`, `leo-resilience-spoof-doppler`,
`leo-resilience-spoof-monitors`, the six `leo-vertical-*`, `maritime-strait-jamming`, `meo-leo-fused-pvt`.

## 4. Recorded findings (NOT MET bars) whose recorded numbers moved

The bars are unchanged and still missed; each test still asserts the recorded miss (none is ignored).

* **`tests/cr3bp_families_jpl_oracle.rs`** (`finding_four_members_miss_a_bar`; no ledger row): the same four
  members miss. L1 northern halo #4222 stability index 2.0846 against 2.3046 (9.5e-2) unchanged. DRO closures
  #0 3.335240e-8 -> 3.447788e-8, #579 2.268366e-8 -> 2.218222e-8, #1158 1.465687e-8 -> 1.533071e-8 (bar 1e-8;
  printed 3.3e-8 / 2.3e-8 / 1.5e-8 -> 3.4e-8 / 2.2e-8 / 1.5e-8). Worst agreement elsewhere: L1 period 1.7e-13
  -> 1.8e-13; L2 period 1.7e-12 -> 2.0e-12, Jacobi 7.5e-13 -> 8.0e-13; DRO period 8.4e-13 -> 8.3e-13, Jacobi
  4.0e-14 -> 1.9e-14; states unchanged at two digits. The test now reports every moved member at once
  instead of stopping at the first. `docs/design/evidence/cr3bp-families/RESULTS.md` gains a section with
  these numbers; its first-run table is kept.
* **`tests/jamming_crpa.rs`** (A3, MODELLED ledger row "CRPA antenna gains in the jamming kind against an
  independent numpy recomputation"): MVDR jammer gain over 1e-9 dB on 202 -> **194 of 456** links, worst
  1.730e-6 dB (unchanged at 1.7e-6). Still NOT MET. Other A3 worsts: MVDR noise gain 5.3e-15 -> 1.2e-14 dB,
  MVDR effective C/N0 2.1e-14 -> 2.8e-14 dB, null-steering noise gain 1.6e-14 -> 2.1e-14 dB, null-steering
  effective C/N0 2.1e-14 dB unchanged; all far inside the bar. `xval/crpa-jamming/inputs.json` and
  `expected.json` are not re-exported (the test compares today's engine against the committed numpy
  output). Quoted in `docs/design/evidence/crpa-jamming/RESULTS.md`, the ledger row (and its generated
  copies) and the Unreleased CHANGELOG entry, each updated to 194 with this file named.

## 5. Other changes in this step

* `src/verification.rs`, ledger row of the Mars OD (TRK-2-18) chain: its module list named
  `gravity_sh (from_shadr)`; the reader lives in `gravity_pds` (`SphericalHarmonicField::from_shadr`). Text only.
* Generated artifacts regenerated with `cargo run --release --bin gen_validation_artifacts`; the Studio's
  copy of the ledger (`web/studio/data/verification-matrix.json`) re-copied and its `web/PORT-MANIFEST.json`
  hash updated. Row counts and verdicts are unchanged, so the provenance diagram and the og-card, which
  carry only counts, are not re-rendered.
