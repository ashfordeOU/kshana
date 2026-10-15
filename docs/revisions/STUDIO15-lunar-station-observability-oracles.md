<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# STUDIO-15 — re-record of the lunar observability and lunar station numpy oracles (2026-10-13)

Part of [`STUDIO15-portable-math-rebaseline.md`](STUDIO15-portable-math-rebaseline.md). The owner approved
re-recording both fixtures sets (both guard MODELLED ledger rows). **Reason:** under portable maths the engine
exports slightly different inputs (Jacobians, observations), and each oracle's numpy reference is only
meaningful on the inputs it was computed from, so the inputs were re-exported and numpy re-run. Scripts,
tolerances and bars are unchanged.

## 1. `tests/lunar_observability_numpy_oracle.rs`

Clean venv, `pip install numpy==2.3.5 scipy==1.18.1`; the run that made the fixtures printed
`numpy 2.3.5 scipy 1.18.1`, the versions in `reference.json` and `NOTICE.md`. Inputs from
`cargo run --example gen_lunar_observability_fixture`, reference from the unchanged `gen_reference.py`.

| file | old SHA-256 | new SHA-256 |
|---|---|---|
| `tests/fixtures/lunar_observability_numpy_oracle/inputs.json` | `055fdf335dfec761a922720eaf6274d3009f708ca4e8b9e1a0d481d92138bc22` | `076650cba42a407c72a3e44997ad13c4ef382143faeb9cc91f83ca3e9ec2571e` |
| `tests/fixtures/lunar_observability_numpy_oracle/reference.json` | `ed57fd6b3cc093dd1a0e5f4abf1a1a258afe0ea56c760402aea0f9a22b8eb6bd` | `4a43060a25cbb25f47144c318a2a32e0cd5181b65514101e3c091c99e6711fbf` |

All 17 cases pass the unchanged bars (the test also holds ranks, defects, the observability decision and the
monotone design curve exactly). Worst overlap gap 1.685e-9 (margin 590x to 1e-6); worst CRLB relative gap
6.84e-11 (margin 146x to 1e-8):

| case | station null overlap gap (bar 1e-6) | station CRLB relative gap (bar 1e-8) |
|---|---|---|
| default_without_vlbi | 3.966e-12 | (no CRLB: station not observable) |
| default_with_vlbi | 0.000e0 | 8.306e-12 |
| default_two_stations | 1.070e-10 | (no CRLB: station not observable) |
| default_three_stations | 0.000e0 | 6.840e-11 |
| default_four_stations | 0.000e0 | 1.469e-11 |
| default_five_stations | 0.000e0 | 7.803e-12 |
| ladder_six_sats_one_station | 1.685e-9 | (no CRLB: station not observable) |
| ladder_six_sats_two_stations | 9.631e-12 | (no CRLB: station not observable) |
| ladder_six_sats_three_stations | 0.000e0 | 1.028e-11 |
| eight_sats_three_stations | 0.000e0 | 2.275e-11 |
| rich_without_vlbi | 0.000e0 | 6.384e-11 |
| rich_with_vlbi | 0.000e0 | 1.956e-11 |
| elfo_one_station | 1.110e-15 | (no CRLB: station not observable) |
| elfo_two_stations | 1.814e-13 | (no CRLB: station not observable) |
| elfo_three_stations | 0.000e0 | 3.147e-14 |
| elfo_sparse_without_vlbi | 2.979e-11 | (no CRLB: station not observable) |
| elfo_sparse_with_vlbi | 0.000e0 | 4.169e-13 |

## 2. `tests/lunar_station_numpy_oracle.rs`

`reference.json` records `numpy 2.5.4`; clean venv with `pip install numpy==2.5.4`, printed `2.5.4`.
`cases.json` from `cargo run --example gen_lunar_station_ref_inputs`, `reference.json` from the unchanged
`scripts/gen_lunar_station_ref.py`.

| file | old SHA-256 | new SHA-256 |
|---|---|---|
| `tests/fixtures/lunar_station/cases.json` | `20fcdcc6ac83b16cf90f76e408459e561af98f680f7e3240e9a8a42829e35f1c` | `c3248a9fb757e7dedc158fbdf502b3bf08221c04780f3ef8f537077c63c17b56` |
| `tests/fixtures/lunar_station/reference.json` | `fdb06d80ce5afb4b1e5df703d6e19c7e12fdb9c011055aaab4041aed30746239` | `873f8a5da1926b67d3442bfd8ce3f34765db5991ba0d6c85ceacdf1dee12424e` |

Recorded finding, old -> new (the test asserts the new values exactly; no tolerance changed):

| quantity | old | new |
|---|---|---|
| cases whose corrections and corrected range errors exceed the pre-registered 1e-9 m (N2/N3, of 20) | 15 | 20 |
| raw range errors above 1e-9 m | 0 | 0 |
| `RANGE_OBSERVED_M` (worst corrected-range difference) | 3.725297403889272e-9 m | 3.725290298461914e-9 m |

The pre-registered N2/N3 bar was already recorded as missed; the finding is a pin of what was observed and is
now 20 of 20 (the new worst is below the old recorded bound). Other worst differences, against the unchanged
bars: raw range 1.4e-14 m (bar 1e-9); position vectors and magnitudes 6.13e-9 m (bar 1e-6, margin 163x);
uncorrected 1.9e-12 m. `PREREGISTRATION.md` keeps its historical text (15 of 20).
