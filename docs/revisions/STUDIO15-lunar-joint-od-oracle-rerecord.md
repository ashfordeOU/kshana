<!-- SPDX-License-Identifier: CC-BY-4.0 -->
# STUDIO-15 — re-record of the lunar joint OD numpy oracle (2026-10-13)

Part of [`STUDIO15-portable-math-rebaseline.md`](STUDIO15-portable-math-rebaseline.md). The owner approved
re-recording the fixtures of `tests/lunar_joint_od_numpy_oracle.rs`, the evidence test of the VALIDATED
ledger row "Lunar joint multi-technique OD + clock".

**Reason.** Under portable maths the engine's regenerated inputs (the Jacobians, residuals and observations
of the six simulated networks) differ from the committed `inputs.json` in the last bits, and the first
Gauss-Newton step of each network is a difference of large numbers, so the comparison with numpy results
computed on the *old* inputs showed 2.5e-7 (A) to 4.6e-5 (F) against the 1e-8 bar. The comparison is only
meaningful on identical inputs, so the inputs are re-exported and the numpy script re-run on them.

**What did not change.** `make_fixture.py` (SHA-256 `cd0db517...8f17`, unchanged), the test file and its
tolerance `max(1e-8, 100 kappa eps)`, the six configurations, `NOTICE.md`. numpy is the pre-registered
version: a clean venv in a scratch directory with `pip install numpy==2.4.6`; `numpy.__version__` printed
`2.4.6` in the run that wrote `numpy_oracle.json`. (The dry run in the re-baseline record used 2.5.3 and
is superseded by this one.)

**Fixture files that changed** (SHA-256):

| file | old | new |
|---|---|---|
| `tests/fixtures/lunar_joint_od_numpy_oracle/inputs.json` (written by `KSHANA_WRITE_LUNAR_OD_FIXTURE=1 cargo test --test lunar_joint_od_numpy_oracle write_inputs_on_request`) | `af1f492540e2f3e4cc33fc976b79a74cb7c8cb606c2770ed68c53418e450d6c0` | `3b44fe8ad242086a572271d3792672e19fbf736d02157688318332d3f65aefde` |
| `tests/fixtures/lunar_joint_od_numpy_oracle/numpy_oracle.json` (written by `make_fixture.py inputs.json`, numpy 2.4.6) | `0c61ab31db47f384a9c74f81e87b7a740e600e9dffe467506844c483143b65af` | `6634953040df927b7bd72a62c2ed7f1589057839bc77bb3db3692efddeb4929f` |

`make_fixture.py` and `NOTICE.md` are unchanged (`cd0db517...`, `36634eee...`).

**Result at the unchanged bar: all six networks pass, and the test passes.**

| network | kappa (first step) | bar max(1e-8, 100 kappa eps) | first-step relative difference | margin to the bar | numpy step at x_hat (bar 1e-6) | worst formal-sigma relative difference | station error relative difference |
|---|---|---|---|---|---|---|---|
| A | 1.112e+03 | 1.0e-8 | 2.38e-14 | 420168x | 2.011e-08 | 1.93e-11 | 0 (equal) |
| B | 1.112e+03 | 1.0e-8 | 5.07e-15 | 1972387x | 3.688e-08 | 1.16e-11 | 1.33e-16 |
| C | 7.549e+02 | 1.0e-8 | 1.02e-14 | 980392x | 6.256e-10 | 2.75e-12 | 2.14e-16 |
| D | 8.713e+02 | 1.0e-8 | 3.17e-14 | 315457x | 1.532e-09 | 7.18e-12 | 0 (equal) |
| E | 1.977e+02 | 1.0e-8 | 5.27e-15 | 1897533x | 3.836e-12 | 1.61e-13 | 0 (equal) |
| F | 1.433e+05 | 1.0e-8 | 4.33e-11 | 231x | - | - | not graded (ill-conditioned contrast network, step only) |

Station error: engine against numpy equal to 2.1e-16 relative or better in A to E (A 3.536885 m, B 1.673790 m,
C 4.153793 m, D 2.010577 m, E 0.125649 m). The registered text recorded steps 1.1e-14 to 2.4e-11 and sigmas
at most 1.3e-11 on the 0.30 inputs; the new ones are steps 5.1e-15 to 4.3e-11 and sigmas at most 1.9e-11,
the same size. The row stays VALIDATED: the validated claim (the fusion solve's linear algebra on the
committed inputs) holds at the pre-registered bar. The physical magnitudes of the simulated network moved
with the maths (default station error 3.541350 -> 3.536885 m with VLBI; see the record), and that is not
what the row validates.
