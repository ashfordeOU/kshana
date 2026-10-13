# Pre-registration: Kshana's loosely coupled GNSS/INS EKF on the KF-GINS demo dataset

Committed on its own on 2026-10-13, before any comparison of Kshana's filter with the dataset's
reference trajectory or with the KF-GINS program has been run. The bars are not loosened after a
run; a miss is recorded with its numbers and the row stays MODELLED.

## Disclosed history

The bars below first entered the repository on 2026-10-12 inside a mixed work-in-progress commit
(4848eb0, the loaders, lever-arm EKF methods and a draft test, by the previous worker), not in a
commit of their own, and that worker had downloaded the dataset files (their SHA-256 values are
in the draft test). Per that worker's hand-off, no comparison was run. This file restates the
same bars, unchanged, as the registration of record; the first comparison run follows it.

## Oracles

- (a) Data: the reference trajectory `truth.nav` shipped with the KF-GINS demo dataset (i2Nav
  group, GNSS Research Center, Wuhan University; https://github.com/i2Nav-WHU/KF-GINS, commit
  8291a93e).
- (b) Library: the KF-GINS C++ program (GPL-3.0) at the same commit, built and run as a separate
  tool on the same files by `run_kfgins.sh`; never linked or copied.

## Data

The `dataset/` directory of that commit: Leador-A15 IMU increments at 200 Hz, GNSS RTK positions
at 1 Hz with per-axis standard deviations, the reference trajectory, and `kf-gins.yaml`. The
data carry no stated licence (the repository's README licenses its source code under GPL-3.0),
so they are NOT vendored: `fetch.sh` downloads them and checks the SHA-256 values below, and the
test reads them from `KSHANA_KFGINS_DIR`.

| File | SHA-256 |
|---|---|
| GNSS-RTK.txt | 3c1ecf6d03121d695f59ea8383af5ec4233ef9ff1c33939b7c42caa609a94521 |
| Leador-A15.txt | 47d3d5136dc9494a2eb12bbf1c3206ab02b8e19cacad9eabab3eb8b700f93b78 |
| kf-gins.yaml | 47d2b7b888cf01e9f0e04f47901d7851cee1b92abe114b5b61eea8e66a47e1e0 |
| truth.nav | 25582530dbeac47e014e350d53dae984fe53ffc47b2304d893a243c885c96012 |

## Kshana configuration (fixed now)

Everything from `kf-gins.yaml`: the initial state at the first IMU epoch at or after `starttime`,
per-axis initial sigmas, ARW/VRW and the Gauss-Markov bias noise `2σ²/τ` (isotropic: the file's
values are equal on all axes), and the antenna lever arm. The scale-factor parameters are not
used (Kshana has no scale-factor states). Each GNSS fix is fused as an antenna position with the
lever-arm measurement model `H = [I 0 −[(C_b^n l_b)×] 0 0]` (`fusion::kfgins::run`).

## Metric (fixed now)

Each solution linearly interpolated at every whole-second epoch of `truth.nav` strictly inside
the solution; north/east/down error with WGS-84 radii at the reference point; horizontal RMS
`sqrt(mean(N² + E²))`, vertical RMS `sqrt(mean(D²))`, maximum horizontal error.

## Bars (all six must hold for VALIDATED)

- B1 Kshana horizontal RMS at most 0.10 m.
- B2 Kshana vertical RMS at most 0.15 m.
- B3 Kshana maximum horizontal error at most 0.50 m.
- B4 Kshana horizontal RMS at most 1.2 times KF-GINS's.
- B5 Kshana vertical RMS at most 1.2 times KF-GINS's (B4 and B5 need `KF_GINS_Navresult.nav`,
  KF-GINS's own output, in the directory; without it they are reported as not run and the row
  cannot be VALIDATED).
- B6 The same run with the lever arm switched off has a horizontal RMS at least twice the
  compensated run's.

## Results (first and only run, 2026-10-13)

KF-GINS C++ at 8291a93e built and run by `run_kfgins.sh` (its `KF_GINS_Navresult.nav`, SHA-256
4980c0539f342c2bf54ea631437d0e11adbea2555eff1cd86f6ef82fa7ddd7c7); Kshana by
`tests/fusion_kfgins_dataset_oracle.rs` with `KSHANA_KFGINS_DIR`. 672 924 IMU epochs, 3362 GNSS
fixes fused, 3361 whole-second truth epochs. All six bars hold.

| | Horizontal RMS | Vertical RMS | Max horizontal |
|---|---|---|---|
| Kshana, lever arm compensated | 0.0109 m | 0.0090 m | 0.0320 m |
| Kshana, lever arm off | 0.3286 m | 0.1814 m | 0.4279 m |
| KF-GINS C++ | 0.0111 m | 0.0083 m | 0.0318 m |

B1 0.0109 <= 0.10; B2 0.0090 <= 0.15; B3 0.0320 <= 0.50; B4 ratio 0.976 <= 1.2; B5 ratio
1.082 <= 1.2; B6 compensated/uncompensated 0.033 <= 0.5. The evidence is data-gated (the dataset
is not vendored); whether a row may be VALIDATED on data-gated evidence awaits the owner's
decision, and until then the ledger row is MODELLED with these numbers.
