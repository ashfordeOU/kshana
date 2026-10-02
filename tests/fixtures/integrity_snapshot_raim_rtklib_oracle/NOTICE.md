# integrity_snapshot_raim_rtklib_oracle fixture

Generated 2026-10-01 by `xval/rtklib-raim/generate.sh` (run from the repository root with the
oracle toolchain sourced). It builds `xval/rtklib-raim/raim_harness.c` against RTKLIB v2.4.2-p13
(https://github.com/tomojitakasu/RTKLIB, commit 71db0ffa0d9735697c6adfd06fdf766d0e5ce807,
BSD-2-Clause, copyright T. Takasu) with gcc 13.3.0 as a separate program, runs it on the
committed ABMF slice, then evaluates the slope protection levels with SciPy 1.18.1 (BSD-3-Clause)
in `xval/rtklib-raim/slope_pl.py`. No RTKLIB or SciPy code is in the crate; only derived numbers
are committed. Regeneration is byte-identical.

Inputs (already in the repository, see `tests/fixtures/joint_pvt_itrf_rtklib_oracle/NOTICE.md`
for source, licence and retrieval):

    fd60e3fcac9991e873c18d33d14ab09047e5a78c332c783f0795cbe43dbbcaba  abmf_2018133_300s_GE_C1C.rnx
    144eb4c4b49cae2169d63f5d51c8eaeea1546df8706ad61491df4c71033115dd  brdc_2018133_G_Einav.rnx

Files (SHA-256 as committed):

    03da6a7fbee6b74351644837ebca63a9d25bf4af236742fd1b44357b39d0da0d  rtklib_raim_cases.csv
    fe4809a3b0886d8d4587df34c75837c066ac407287269223b398d5193ad84211  rtklib_raim_sats.csv
    b3bae187ebb7cfb2a3b3c105cf4982cea00f53d988ab2bed0adfaa35ee9a65c6  rtklib_raim_subsets.csv
    003a488caba29b153fe85fa39ddc5f4d927fd2e198c218b603a2d959c14ee4a5  scipy_chi2_quantile.csv
    c692fb8009ebfb10b764af79ac7e3545852137362ce0938f65d2bf4e5427218c  scipy_slope_pl.csv

- `rtklib_raim_cases.csv`: per (epoch, case) RTKLIB's all-in-view `estpos` outcome (converged
  position, validity, message, weighted chi-squared statistic, table value), the `raim_fde`
  outcome and excluded PRN, and (case 0) the slopes formed with RTKLIB's `matmul`, `matinv`
  and `xyz2enu`.
- `rtklib_raim_sats.csv`: per case the satellites used, their transmit-time Earth-fixed
  positions and RTKLIB's pseudorange residuals.
- `rtklib_raim_subsets.csv`: every single-satellite exclusion re-solved with `estpos` (as
  `raim_fde` does), with its statistic, table value and residual root-mean-square.
- `scipy_chi2_quantile.csv`: `chi2.ppf(0.999, dof)` for dof 1..30.
- `scipy_slope_pl.csv`: HPL and VPL of each fault-free case.
