---
description: Fit hybrid and fusion sensor parameters from a stationary IMU log via the kshana-mcp server
argument-hint: "[the IMU log text or file, its format (csv or euroc), the accelerometer axis]"
---

# Fit sensor parameters from an IMU log

The `hybrid` and `fusion` scenarios take accelerometer and gyro noise parameters, not a measured
time series. Use the `kshana` MCP server's `fit_imu_log` tool (`kshana imu-fit`,
`docs/MACHINE-INPUTS.md`) to read them off a log recorded with the sensor held still.

Request: **$ARGUMENTS**

1. Have the log as text: CSV with the columns `t_s, gx, gy, gz, ax, ay, az` (any order), or the
   EuRoC `imu0/data.csv` layout. It must be stationary, uniformly sampled and at least 2000
   samples; tell the user if it is not.
2. Call `fit_imu_log` with `log`, `format` (`csv` or `euroc`), `axis` (`x`, `y` or `z`),
   `expected_mean` (the specific force that axis reads at rest: 0 for a horizontal axis, about
   9.80665 for the vertical one) and optionally `id`.
3. Report the `fit` numbers and every entry of `fit.notes`, in particular the early Allan slopes
   (about -0.5 means white noise dominates; anything else means the noise coefficients are
   unreliable) and whether a bias-instability floor was found.
4. Give the `toml` table back for pasting into a `hybrid` or `fusion` scenario (`[accel_classical]`
   or `[accel_quantum]`; rename the table header as needed).
5. State the tier: MODELLED. The fit is the Allan estimator applied to the log, with no
   external oracle, and `q_aa` (acceleration random walk) is not fitted.
