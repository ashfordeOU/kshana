# Machine and sensor inputs (0.38)

Readers that bring other receivers, solvers and sensors into the `receiver-trust` kind. Every
one is read-only: pure functions on bytes or text that return the same timeline the UBX, RINEX,
Android and NMEA readers return, skipping and counting corrupt records instead of failing.
Everything here is MODELLED: the formats are read from public documentation, and no result is
validated against an external oracle beyond what is stated.

> **Advisory software.** Not type-approved navigation equipment. The operator stays responsible
> for the safe navigation of the vessel.

<picture>
  <source media="(prefers-color-scheme: dark)" srcset="figures/0.38/machine-inputs-dark.svg">
  <source media="(prefers-color-scheme: light)" srcset="figures/0.38/machine-inputs-light.svg">
  <img src="figures/0.38/machine-inputs-light.svg" alt="What `kshana imu-fit` reads off a stationary IMU log, from a real run of engine v0.40.0 on a made-up log (20,000 samples at 100 Hz, 200 s): the accelerometer velocity random walk q_va = 4.02e-06, the gyro angle random walk q_arw = 9e-08, the bias instability 0.00296 and the early Allan slopes (-0.51 and -0.49; about -0.5 where white noise dominates). The table beside it is the TOML the command prints. The estimator is checked on synthetic logs only. Advisory: analysis output from a research and engineering tool, not type-approved navigation equipment and not a safety-of-life service.">
</picture>

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
| `RXSTATUS` | 93 | receiver status bit 15 (jammer detected) becomes the epoch's `self_report` (jamming 2 flagged, 1 not; RXSTATUS has no spoofing flag), compared with Kshana's alarms by `receiver-self-report`; the auxiliary 1 jammer bits (RF1-RF6) are returned in `NovatelRead.status` |

The CRC routine was checked against the CRC the documentation states for its own `BESTPOSA`
example (cited, not quoted); the tests use self-written lines. Not read: abbreviated ASCII, other logs. The
jammer flag is the receiver's own report, not Kshana's finding; agreement with Kshana's monitors is not validation.

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

## RTCM 3 MSM4 and MSM7 (`format = "rtcm3"`)

A byte stream of RTCM 3 frames (a base station's or a receiver's observation output). Read: MSM4
and MSM7 messages (GPS 1074/1077, GLONASS 1084/1087, Galileo 1094/1097, SBAS 1104/1107, QZSS
1114/1117, BeiDou 1124/1127, NavIC 1134/1137): the epoch, and the carrier-to-noise ratio of every
signal cell (MSM4: 6 bits, dB-Hz; MSM7: 10 bits, 1/16 dB-Hz), which is what the C/N0 monitors need.
Pseudorange and phase fields are stepped over, not used, so RTCM gives the trust monitors
C/N0 and nothing else; there is no position in MSM. Frames with a bad CRC-24Q are skipped and counted.

**Where the layout comes from.** Not from the RTCM standard (a paid document, not consulted): from
the open-source decoder pyrtcm 1.2.0, BSD 3-Clause, whose licence and notice are in `NOTICE`
(owner decision of 18 Oct 2026: "use open decoders"). pyrtcm states that its tables follow
RTCM 10403.3; Kshana relies on the published tables under pyrtcm's licence and makes no claim
about the standard. Time: MSM carries no week, so labels read `GPS TOW <s>`; GLONASS epochs
(Moscow time) are moved to GPS time with GPS-UTC = 18 s (the value since 2017-01-01).

Checked against: the CRC-24Q catalogue check value (`123456789` gives `0xCDE703`) and, as a
one-off during development, pyrtcm's own decoder on the same self-written frames (same C/N0).
The fixtures are self-written; no capture was taken from a real receiver, so the reader is MODELLED
until it has read one.

