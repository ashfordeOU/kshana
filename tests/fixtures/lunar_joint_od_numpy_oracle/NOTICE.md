# Fixture for tests/lunar_joint_od_numpy_oracle.rs

- `inputs.json`: written by the test (`KSHANA_WRITE_LUNAR_OD_FIXTURE=1 cargo test --test
  lunar_joint_od_numpy_oracle write_inputs_on_request`) from `lunar_combination::problem`,
  `model` and `batch_ls::gauss_newton_qr` for six configurations; Kshana output, the oracle's
  input. The test checks the engine still produces it.
- `numpy_oracle.json`: written by `make_fixture.py inputs.json` with numpy 2.4.6
  (BSD-3-Clause; `numpy.linalg.lstsq` LAPACK gelsd, `numpy.linalg.inv`, `numpy.linalg.cond`),
  generated 2026-10-02. No third-party data.
