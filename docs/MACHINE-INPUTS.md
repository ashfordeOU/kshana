# Machine and sensor inputs (0.38)

Readers that bring other receivers, solvers and sensors into the `receiver-trust` kind. Every
one is read-only: pure functions on bytes or text that return the same timeline the UBX, RINEX,
Android and NMEA readers return, skipping and counting corrupt records instead of failing.
Everything here is MODELLED: the formats are read from public documentation, and no result is
validated against an external oracle beyond what is stated.

> **Advisory software.** Not type-approved navigation equipment. The operator stays responsible
> for the safe navigation of the vessel.

## RTKLIB `.pos` (`format = "rtklib-pos"`)

The solution file RTKLIB's `rnx2rtkp` and RTKPOST write. Read: the time (calendar
`yyyy/mm/dd hh:mm:ss.sss`, or GPS week and seconds of week), the position (latitude and
longitude in degrees with height, or ECEF X/Y/Z converted to geodetic) and the number of
satellites. The time scale in the column header (`GPST`, `UTC`, `JST`) is carried in the label.
Degrees-minutes-seconds files are refused. Lines starting `%` are header lines.

## NovAtel OEM7 (`format = "novatel"`)

ASCII (`#BESTPOSA,...*crc`) and binary (`AA 44 12` header) logs, mixed freely. Layouts follow the
public OEM7 documentation (docs.novatel.com): the message headers, the 32-bit CRC and the field
tables of three logs. Records whose CRC does not match are skipped and counted.

| Log | ID | Used |
|---|---|---|
| `BESTPOS` | 42 | solution status (only `SOL_COMPUTED` gives a fix), latitude, longitude, height above mean sea level plus undulation (the fix height is ellipsoidal), satellites used |
| `RANGE` | 43 | C/No per signal (dB-Hz); system from tracking-status bits 16-18, signal type from bits 21-25 |
| `RXSTATUS` | 93 | receiver status bit 15 and auxiliary 1 status jammer bits (RF1-RF6), returned in `NovatelRead.status` |

The CRC implementation reproduces the CRC stated in the documentation's own `BESTPOSA` example
(one example log line is quoted in a unit test). Not read: abbreviated ASCII, other logs. The
jammer flags are the receiver's own report; no trust monitor consumes them yet.

## GNSS-SDR (`format = "gnss-sdr"`)

See [`integrations/gnss-sdr/README.md`](../integrations/gnss-sdr/README.md). NMEA and RINEX
outputs of GNSS-SDR already read with `nmea` and `rinex`; the Monitor and PVT-monitor UDP streams
(Protocol Buffers) are relayed to JSON lines by `relay.py` and read with `gnss-sdr`.

## IMU (`[log.imu]`)

`format = "csv"`: a header row naming the columns, then one sample per row. Columns (any order,
names case-insensitive): `t_s` seconds on the receiver log's clock, `gx`, `gy`, `gz` angular rate
in rad/s, `ax`, `ay`, `az` specific force in m/s². `format = "euroc"`: the EuRoC MAV `imu0`
`data.csv` layout (`#timestamp [ns]`, `w_RS_S_x/y/z [rad s^-1]`, `a_RS_S_x/y/z [m s^-2]`); the
first sample is `t_s = 0`. Rows that do not parse, and rows whose time does not increase, are
skipped. See [`RECEIVER-TRUST.md`](RECEIVER-TRUST.md) for how the gyro heading is used.

## IMU into the hybrid and fusion scenarios (`kshana imu-fit`)

The `hybrid` and `fusion` (17-state UKF) scenarios are simulations: they take sensor noise
parameters (`[accel_quantum]`, `[accel_classical]`: `bias`, `q_va`, `gyro_bias`, `q_arw`,
`bias_instability`), not a measured series. `imu-fit` reads those parameters off a stationary IMU
log, so a scenario can be run with the sensor you actually have:

```sh
kshana imu-fit still.csv --format csv --axis x --expected-mean 0 --id bench-imu      # prints the TOML table
kshana imu-fit still.csv --axis z --expected-mean 9.80665 --json                     # whole report
```

Method: the overlapping Allan deviation of the integrated signal
(`allan::overlapping_adev_curve`): `q_va = (sigma(tau0) sqrt(tau0))^2`, the same for the z gyro
(`q_arw`), `bias` and `gyro_bias` as the means, and `bias_instability` as the curve minimum when
the curve turns up after it. `q_aa` is not fitted (it needs a log far longer than the floor).
The report carries the log's rate and span and the early Allan slope of each channel (about -0.5
where white noise dominates); a log that is not still, or is too short (under 2000 samples) or
unevenly sampled, is refused or gives parameters the slopes flag. The table's provenance names the
log's SHA-256. MODELLED: the estimator is checked on synthetic white-noise logs with known
coefficients (recovered within 10 %), not against an external oracle. Available on the CLI,
Python (`imu_fit`), WebAssembly (`imu_fit`), MCP (`fit_imu_log`) and the plugin
(`/kshana-fit-imu`).

## Not here

RTCM 3 MSM4/MSM7 observations: the layouts are in the paid RTCM standard, and the only open
tables found copy them from it. Not implemented, pending an owner decision.
