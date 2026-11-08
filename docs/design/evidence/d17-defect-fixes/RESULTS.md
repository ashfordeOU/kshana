<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# D17 (0.41): defect D11c (fusion flicker bound) and closing defect D12: results

Pre-registration: `PREREGISTRATION.md` (signed off 3 November 2026). D11c is judged by D11's
criteria, applied to `fusion-pnt`. Closing D12 is a documentation change. The criteria were not
changed.

## D11c: the change

`src/fusion/mod.rs`: in both suites (decoupled, and the `[coupled]` stacked filter), the timing bound
adds `clock.flicker_phase_variance_after_steps(n, dt)`, where `n` counts the steps since the last
anchor (a GNSS fix or a re-sync). That is the phase variance the truth's flicker bank accumulates,
as D11 adds it for the clock kinds. The term is exactly zero without a flicker floor. The truth is
not touched.

## D11c: results

The `fusion-pnt` scenario with the `clock-ensemble` floors (1e-16 quantum, 2e-11 classical), 200
runs at seed 42 and again at seed 7. The runs are seeded as `run_fusion` seeds them. The figures
before the fix were measured on 6647ed8a9 with the same ensemble.

| Criterion | Before the fix | After | Result |
|---|---|---|---|
| 1. integrity mean ≥ 0.99, p05 ≥ 0.9 | classical 0.77101 / 0.75865, p05 0.508 / 0.490; quantum 0.99896 / 0.99896 | classical 0.99988 / 0.99989; quantum 0.99896 / 0.99896; p05 1.0 throughout | **MET** |
| 2. floor 0: shipped figures unchanged | | `fusion-pnt` and `fusion-pnt-coupled` byte for byte as before (compared, then pinned as digests) | **MET** |
| 3. pooled RMS(error / one-sigma bound) in [0.8, 1.2] per clock | | classical 0.768 / 0.783; quantum 0.590 / 0.592 | **NOT MET** |
| 4. truth untouched; no golden moves | timing p95 mean 2.270950e-3 / 6.232112e1 ns, holdover 6600 / 1066.40 s (seed 42; seed 7 likewise) | equal | **MET** |

The single seed-42 trajectory, which gave 0.7973 for the classical clock before the fix (as the
pre-registration recorded), is part of the seed-42 ensemble.

The tests are in `src/fusion/mod.rs`, module `d11c`. Criteria 1 and 4 are in
`the_bound_covers_the_flicker_floor_and_the_truth_is_untouched`; criterion 2 in
`without_a_floor_the_shipped_figures_are_unchanged`. Criterion 3 is
`the_bound_is_not_inflated_pooled_rms_of_error_over_sigma`, marked ignored with the finding.

### Criterion 3, not met

The band was not changed. Two causes, measured with the same ensemble:

- **Quantum, before the fix too.** On the shipped scenario without any floor, where the flicker term
  is exactly zero, the quantum RMS is 0.550 / 0.564. Its bound always carries the re-sync noise
  variance (sigma 1e-12 s), which dominates its very small error. With re-sync off, the RMS is
  0.0006.
- **Classical, from the flicker term.** Without a floor the classical RMS is 1.002 / 1.000. With
  the floor and the fix it is 0.768 / 0.783: the bound is wide by about 1.3x. D11's predictor knows
  nothing of the flicker, so the unconditional variance accumulated since the anchor is its right
  bound. `fusion-pnt`'s Kalman filter re-estimates the frequency at every anchor, so that variance
  overstates the error.

### New defect: the fusion-pnt bound is conservative

Opened here (8 November 2026), to be pre-registered before any change. The `fusion-pnt` timing
bound is conservative for both clocks:

- the quantum clock, from the re-sync noise term, before and after D11c;
- the classical clock, with a flicker floor, from the unconditional flicker variance.

A tighter bound needs the flicker phase variance conditional on what the filter knows at the
anchor, which is a design change. Owner decision 1 of the pre-registration (the classical
clock's no-floor 0.9728 single-trajectory shortfall) stays open and separate.

## D12: fixed

Defect D12 was that the default hand-off acquisition on the 100 ms tiered codes kept the whole
Doppler × code-phase grid: about 2.4 GB for Galileo E1-C and 12 GB for E5a-Q at 25 MS/s with 601
bins, and 30.0 GB for E5a-Q with the 1501 bins of the default search. It is fixed by grid-free
acquisition, under its own registration:

- [`../acq-gridfree/PREREGISTRATION.md`](../acq-gridfree/PREREGISTRATION.md) and
  [`../acq-gridfree/RESULTS.md`](../acq-gridfree/RESULTS.md);
- the pinning test `tests/iq_acq_gridfree.rs`. A1: the result is bit-identical to the grid path on
  GPS L1 C/A, Galileo E1-B and E5a-I. A2: the peak resident set `VmHWM` of the default acquisition
  of Galileo E5a-Q at 25 MS/s is **213 MiB**, against about **30 GB** for the grid (bar 256,000
  KiB). A3: no existing test changed.

`tests/iq_signal_matrix.rs` keeps its registered replicas. Its comments now say that D12 is fixed
and point at acq-gridfree.
