<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# US DHS Resilient PNT Conformance Framework: test profiles for levels 1 to 4

The framework's evaluation approach combines static analysis with dynamic analysis in which test vectors stand in for threats (sections 8.1 to 8.3), and leaves pass or fail criteria to the assessor (section 8.6). This pack turns levels 1 to 4 into test profiles: each level has the dynamic tests a simulation can run, and the tests that need a receiver log or product evidence are listed and left unscored. The rows it supports are the level and requirement rows of [dhs-rpcf.md](dhs-rpcf.md).

Every row says which pack tests **support evidence for** it and what is left over. Nothing
here says a framework is met or that any product has been rated or approved by anyone, and
none of these files is a statement from an assessment body; Kshana is not one. A pack
measures **modelled** scenarios against bars stated before the run
(`standards/dhs-rpcf/PREREGISTRATION.md`, committed before any scored run and never changed
after one). Advisory: analysis output from a research and engineering tool, not
type-approved navigation equipment and not a safety-of-life service.

```sh
kshana standards-pack run dhs-rpcf --out dhs-rpcf      # writes dhs-rpcf.pack.json and dhs-rpcf.pack.md
kshana compliance-report dhs-rpcf.pack.json        # lists the pack's rows with their statuses
```

A test marked **NEEDS INPUT** is not run by the engine alone: it names the receiver log or
laboratory evidence the operator must supply, scored with `kshana receiver-trust` against
events stated before the run. A bar that is **NOT MET** is a result, kept on record and
pinned by `tests/standards_packs.rs`; it is never loosened.

## Source documents

- **Resilient Positioning, Navigation, and Timing (PNT) Conformance Framework**: Version 2.0, 26 April 2022 (DHS Science and Technology Directorate, with CISA). <https://www.dhs.gov/sites/default/files/2022-05/22_0531_st_resilient_pnt_conformance_framework_v2.0.pdf>. Read 2026-10-09: document read in full; level and requirement numbers and sections 5.5 and 8.1 to 8.6 are paraphrased. The framework states no pass or fail values, so every bar is this pack's own.

## Rows this pack adds to the compliance report

<!-- pack-rows:start -->
| Reference | What it asks (paraphrased) | Pack tests that support evidence for it | Gap |
|---|---|---|---|
<!-- pack-rows:end -->

## Tests and the bars stated before the run

<!-- pack-tests:start -->
| Test | Profile | Scenario | Bars stated before the run |
|---|---|---|---|
| L1-T1 A run is repeatable from its scenario, seed and engine version | level-1 | l1-repeatable-spoof-detect | identical on a second run |
| L1-T2 Manual recovery: a reset returns the receiver to a trusted state | level-1 | none | not scored: needs input (A receiver log that covers a threat, an operator reset and the recovery, plus the stated reset time) |
| L2-T1 A position-push spoofer is identified by the combined detector | level-2 | l2-spoof-position-push | `/decision/fused/alert` eq true; `/decision/raim/alert` eq true |
| L2-T2 A nearby broadband jammer is visible in the link-budget result | level-2 | l2-jammer-1km | `/jammer_present` eq true; `/fom/availability_under_jamming` lt `/fom/availability_nominal` |
| L2-T3 Automatic recovery without interrupting output | level-2 | none | not scored: needs input (A receiver log in which output continues during the threat and the source is recovered without operator action, scored with `kshana receiver-trust` against events stated before the run) |
| L3-T1 Optical-clock holdover stays inside the stated timing bound | level-3 | l3-clock-holdover | `/quantum/fom/timing_p95_ns` le `/threshold_ns` |
| L3-T2 Chip-scale atomic clock holdover stays inside the same bound | level-3 | l3-clock-holdover | `/classical/fom/timing_p95_ns` le `/threshold_ns` |
| L3-T3 Fused alternative-PNT is never worse than free inertial or its best single channel | level-3 | l3-combined-altpnt | `/combined_m` le `/free_inertial_drift_m`; `/combined_m` le `/gravity_only_m`; `/combined_m` le `/magnetic_only_m`; `/combined_m` le `/terrain_only_m` |
| L4-T1 Layering of PNT sources survives a common-mode denial vector | level-4 | l4-conflict-resilience | `/correlation_sweep/min_ratio_over_grid` ge 2.0 |
<!-- pack-tests:end -->

## Results at this release

Every run is MODELLED. At this release (`kshana standards-pack run dhs-rpcf`): L1-T1, L2-T1,
L2-T2, L3-T1, L3-T2 and L3-T3 are **MET**; L1-T2 and L2-T3 need a receiver log; **L4-T1 is NOT MET**.

- L3-T2 is met narrowly: the modelled chip-scale atomic clock reaches a 95th-percentile
  timing error of 19.7 ns against the 20 ns bound, while the modelled optical lattice clock
  stays far inside it. The two are run on the same scenario so the contrast is on the page.
- L4-T1 misses: for the all-RF layered stack in `l4-conflict-resilience`, the layered-to-single
  resilience ratio falls to about 1.2 at the highest denial correlation in the grid, under the
  bar of 2.0. Correlated denial defeats layering of sources that share a band, which is the
  common-mode case level 4 is about. This is a property of the sourced but MODELLED priors in
  the scenario, not a measurement of any product.
