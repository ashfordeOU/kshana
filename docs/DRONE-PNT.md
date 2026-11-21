# Drone, UTM and robotics PNT (`kshana drone`)

Tools for people who fly, build or test drones and ground robots: a pre-arm GNSS spoofing and jamming check
over autopilot logs, behavioural cases for autopilot and ROS estimators, a dead-reckoning coast
budget, a consumer-quadcopter behaviour model under GNSS loss, a cascade failover harness and a set-based
protection level. Source: `src/drone_pnt/`. Every output is one JSON document on standard output; nothing
is written to disk.

**Scope and honesty.** Every result is labelled `MODELLED`. These are decision support and test evidence;
none is a flight authorisation, none replaces the autopilot's own pre-arm checks or the operator's
procedures, and none has been validated against a fleet of real flights. No estimator or sensor-fusion
algorithm is shipped: the estimator cases check the behaviour of the user's estimator from a trace.

```
kshana drone prearm <log.ulg|log.bin|epochs.jsonl> [--window <s>] [--config <thresholds.json>] [--gate]
kshana drone prearm-calibrate [--runs <n>] [--seed <n>]
kshana drone estimator-cases [--case <id> --trace <trace.jsonl> [--params <json>]]
kshana drone dr-budget [<spec.json> | --airframe multirotor|fixed-wing|vtol|ground-robot]
kshana drone quad-loss [<spec.json>]
kshana drone failover [<spec.json>]
kshana drone zonotope-pl <spec.json>
```

## Pre-arm spoofing and jamming check (`prearm`)

Input, recognised by its first octets:

| Format | Read | Arming |
|---|---|---|
| PX4 ULog (`.ulg`) | `sensor_gps` (else `vehicle_gps_position`): position, `eph`, `epv`, `hdop`, `vel_m_s`, `s_variance_m_s`, `satellites_used`, `fix_type`, `time_utc_usec`, `jamming_state`, `spoofing_state`, `jamming_indicator`, `noise_per_ms`, `automatic_gain_control`, `authentication_state` | `vehicle_status.arming_state` = 2 |
| ArduPilot DataFlash (`.bin`) | `GPS` (`I`, `Status`, `NSats`, `HDop`, `Lat`, `Lng`, `Alt`, `Spd`, `GWk`, `GMS`), `GPA` (`HAcc`, `VAcc`, `SAcc`), `UBX1` (`noisePerMS`, `jamInd`, `agcCnt`) | `ARM.ArmState` |
| JSON Lines | one epoch per line with the field names of `GnssEpoch` (`t_s`, `instance`, `fix_type`, `lat_deg`, `lon_deg`, `eph_m`, `speed_m_s`, `spoofing_state`, `jamming_state`, `jam_ind`, `agc`, `rx_time_s`, ...), or `{"t_s": .., "armed": true}` | the `armed` line |

Sources for the formats and codes: the PX4 ULog file format and the PX4 uORB message reference
(`SensorGnss`: `JAMMING_STATE` 0 unknown, 1 OK, 2 mitigated, 3 detected; `SPOOFING_STATE` the same;
`AUTHENTICATION_STATE` 2 = error; older `sensor_gps` releases: 2 = warning / indicated, 3 = critical /
multiple), the ArduPilot onboard log message reference (`GPS`, `GPA`, `UBX1`, `ARM`) and
`AP_Logger/LogStructure.h` for the DataFlash `FMT` layout and format characters. ArduPilot logs carry no
receiver spoofing state, so on ArduPilot the flag family rests on `UBX1.jamInd` and `agcCnt`.

The window is the `--window` seconds (default 30) before the first arming event, or the end of the log when
the vehicle never arms. The vehicle stands still on the ground in that window, so a moving solution is
itself a symptom.

| Check | Family | WARN | FAIL |
|---|---|---|---|
| `spoof_flag` | flag | - | receiver spoofing state ≥ 2 |
| `jam_flag` | flag | jamming state 2 | jamming state 3 |
| `auth_state` | flag | authentication state 2 (error) | - |
| `jam_indicator` | flag | max ≥ 100 | max ≥ 200 |
| `agc_drop` | flag | AGC falls by ≥ 30 % of its window maximum | - |
| `static_drift` | kinematic | least-squares horizontal drift ≥ 0.15 m/s | ≥ 0.35 m/s |
| `static_speed` | kinematic | median reported speed ≥ 0.3 m/s | ≥ 0.8 m/s |
| `position_jump` | kinematic | a step ≥ max(5·eph, 8 m) | twice that |
| `receiver_split` | kinematic | two receivers' medians apart by ≥ max(5·√(eph₁²+eph₂²), 5 m) | three times that |
| `clock_step` | time | a step of receiver time against boot time ≥ 0.2 s | ≥ 1.0 s |
| `readiness` | readiness | fix < 3, eph > 3 m, sats < 6 or speed accuracy > 0.5 m/s | - |

The readiness levels are PX4's documented GNSS requirement defaults (`GNSS_REQ_EPH`, `GNSS_REQ_NSATS`,
`GNSS_REQ_SACC`; `EKF2_REQ_*` in older releases; PX4 "Tuning the ECL EKF" guide). Every threshold can be
changed with `--config` (a JSON object with any of the `PrearmConfig` keys: `window_s`, `jam_ind_warn`,
`jam_ind_fail`, `agc_drop_warn`, `drift_warn_m_s`, `drift_fail_m_s`, `speed_warn_m_s`, `speed_fail_m_s`,
`jump_k`, `jump_floor_m`, `split_k`, `split_floor_m`, `clock_warn_s`, `clock_fail_s`, `req_eph_m`,
`req_sats`, `req_sacc_m_s`).

**Fusion.** `FAIL` when any check fails, or when warnings come from two or more of the families flag,
kinematic and time (a receiver flag corroborated by an independent symptom); otherwise `WARN` when any check
warns; otherwise `PASS`. A check with no data in the window is `NO_DATA` and does not vote. `--gate` makes
the command exit 2 on `FAIL`, for use in a ground-station or SITL script.

### Published thresholds and their false-alarm rate

`kshana drone prearm-calibrate --runs 1000 --seed 1` runs the default thresholds on 1000 synthetic still
windows per row. Clean model: per-axis first-order Gauss-Markov position error (σ 1.0 m, τ 60 s), reported eph
1.5 m, speed noise 0.03 m/s per axis, receiver-time jitter 10 ms, receiver states 1 (OK), jamming indicator
20-60, AGC 5000 ± 50, 5 Hz. The injections are log-level edits of those windows (no signal is generated).

| Row | Not `PASS` | `FAIL` | Checks that alarm |
|---|---|---|---|
| clean (false-alarm rate) | 0.000 | 0.000 | none |
| spoofing flag for the last 2 s | 1.000 | 1.000 | `spoof_flag` |
| drag 0.2 m/s for the last 15 s | 0.073 | 0.000 | `static_drift` |
| drag 0.5 m/s | 1.000 | 0.001 | `static_drift`, `static_speed` (both kinematic: `WARN`) |
| drag 1.0 m/s | 1.000 | 1.000 | `static_drift`, `static_speed` |
| receiver-time push 0.5 s | 1.000 | 0.000 | `clock_step` |
| receiver-time push 2.0 s | 1.000 | 1.000 | `clock_step` |
| position jump 20 m | 1.000 | 1.000 | `position_jump`, `static_drift` |

With 1000 clean windows and no false alarm, the false-alarm rate per 30 s window is below 0.3 % (95 %
upper bound, rule of three) **for this noise model**. A receiver whose real noise is larger moves it: set the
thresholds from your own clean pre-arm logs (run `prearm` on them and read the check values). A slow drag
(0.2 m/s) is mostly missed in 30 s; a 0.5 m/s drag warns but does not fail on kinematics alone. The test
`tests/drone_pnt.rs` re-runs this table (400 windows) and holds the clean row at no `FAIL` and at most 1 % not
`PASS`.

**SITL.** The acceptance logs in `tests/drone_pnt.rs` are synthetic logs written in the ULog and DataFlash
formats a PX4 or ArduPilot SITL run writes (a still vehicle that raises the receiver spoofing state before
arming fails pre-arm and the `--gate` exit); a SITL run itself is not part of this repository's tests.

### Response playbook

The report's `playbook` field lists step ids. These are suggestions for operators to adapt to their own
procedures and regulator's rules; they do not replace them.

| Id | Verdict | Step |
|---|---|---|
| P0 | `PASS` | Arm as normal. Keep the log; the check says only that no symptom was seen in the window. |
| W1 | `WARN` | Do not arm yet. Wait one more window with the vehicle still and re-run the check. |
| W2 | `WARN` | Check the antenna, cabling and sky view (nearby metal, people, vehicles); move the vehicle if the site blocks the sky. |
| W3 | `WARN` | If the warning persists, treat it as `FAIL`. |
| F1 | `FAIL` | Do not arm. Keep the vehicle disarmed and on the ground. |
| F2 | `FAIL` | Save the log and the report as evidence (time, place, receiver states, check values). |
| F3 | `FAIL` | Check published interference notices (NOTAMs, national GNSS interference reporting) for the area and time, and report the event through the channel your authority provides. |
| F4 | `FAIL` | Fly only if your procedures allow flight without GNSS (for example a non-GNSS position source configured and tested: ArduPilot `EK3_SRCn_*` source sets, PX4 `EKF2_GPS_CTRL` / `EKF2_GPS_MODE`; PX4 `COM_ARM_WO_GPS` 0 keeps GNSS required for arming), and in a mode that does not depend on GNSS. |
| F5 | `FAIL` | Re-check after moving away from the suspected source, or later; arm only after a `PASS`. |

## Estimator behaviour cases (`estimator-cases`)

Each case states a behaviour that a public issue reports broken and checks a **trace** of the user's
estimator against it. Behavioural checks only. `kshana drone estimator-cases` with no trace runs every case on a
expected and a faulty reference trace (synthetic reproductions of the reported behaviour) and
reports whether each is reproduced (the first passes and the second fails).

A trace is JSON Lines: `{"t": <s>, "<channel>": <number|null>, ...}`; channels can be renamed with
`--params '{"channels": {"yaw_est": "XKF1.Yaw"}}'`, and the case parameters below are set the same way.

| Case | Cites | Channels | Expected behaviour (parameters) |
|---|---|---|---|
| `driver-output` | ArduPilot issues 34150, 35085 | `lat`, `lon`, `fix`, (`eph`) | time increases; with a fix: finite, in-range position that is not (0, 0); fix type an integer 0-8; positive accuracy |
| `receiver-selection` | PX4 issues 28813, 28894 | `sel`, `fix{i}`, (`eph{i}`, `spoof{i}`) | the selected receiver is healthy (fix ≥ 3, eph ≤ `req_eph_m` 5, spoofing state < 2) whenever another is, after `dwell_s` (2); at most `max_switches_per_min` (6) |
| `gnss-heading` | PX4 issue 28893; ArduPilot forum, "EKF3 doing yaw realignment to GPS velocity with GPS in NO_FIX status" | `yaw_est`, `yaw_gnss`, `fix` | yaw within `tol_deg` (10) of a valid GNSS heading after `converge_s` (5); no yaw step above `step_tol_deg` (15) while there is no fix |
| `estimator-init` | ArduPilot issue 34894 | `est_valid`, `fix`, `eph`, `sats`, (`est_n`, `est_e`, `gnss_n`, `gnss_e`) | position declared valid only after the GNSS gate (fix ≥ 3, eph ≤ `req_eph_m` 3, sats ≥ `req_sats` 6) held for `req_time_s` (10, PX4 `GNSS_REQ_TIME` default); start within `k_eph` (3) · eph of GNSS |
| `source-switch` | ArduPilot forum, "EKF3 running ExtNav and GPS leads to position jump if GPS is enabled again" | `src`, `est_n`, `est_e`, (`est_vn`, `est_ve`) | within `settle_s` (1) of a source change, no step above `pos_step_tol_m` (2) beyond the motion the velocity explains |
| `utm-zone` | robot_localization issues 951, 904 | `lat`, `lon`, `utm_e`, `utm_n`, (`utm_zone`) | UTM within `tol_m` (0.05) of a reference WGS 84 transverse Mercator (Krüger series to n⁴, Karney 2011); no odometry jump above `odom_jump_m` (100) at a zone change |
| `replay-determinism` | robot_localization issue 957 | every `x` with an `x_replay` | the replay reproduces each channel to `tol` (1e-6) |
| `nan-guard` | robot_localization issue 982 | channels starting `prefix` (`est_`) | no channel becomes non-finite after it has been finite |

The issue links are kept in `src/drone_pnt/estimator_cases.rs` (`CASES`) and printed in every report. The issue
references come from the research notes behind this work; the expected behaviours are stated from the issue
titles and the documented parameter defaults, not from a reading of every comment thread.

## Dead-reckoning coast budget (`dr-budget`)

Free inertial: the position error of the IMU-grade coast model (`src/inertial/coast.rs`: nine-state error
model with Schuler feedback, class-band coefficients after Groves 2013) at the cruise speed,
root-sum-squared with `v0·t` from the velocity error left at GNSS loss. Velocity-aided dead reckoning
(optical flow, airspeed and heading, wheel odometry):

```
σ(t)² = (ψ·d)² + (s·d)² + (w·t)² + 2·σ_v²·τ·t        d = v·t
```

with heading error ψ, scale error s, unknown velocity bias w (wind estimate for airspeed dead reckoning) and
velocity noise σ_v with correlation time τ. The crossing of each threshold is reported both bisected and in
closed form, `t = (−D + √(D² + 4K²T²)) / (2K²)` with `K² = (ψ²+s²)v² + w²`, `D = 2σ_v²τ`; the tests hold
them equal to 1e-6. Presets (class bands, not any product's datasheet):

| `--airframe` | speed | IMU grade | aiding | ψ | s | w | σ_v, τ |
|---|---|---|---|---|---|---|---|
| `multirotor` | 10 m/s | consumer | optical flow | 3° | 3 % | 0 | 0.1 m/s, 1 s |
| `fixed-wing` | 22 m/s | industrial | airspeed + heading | 2° | 5 % | 1 m/s | 0.5 m/s, 10 s |
| `vtol` | 18 m/s | industrial | airspeed + heading | 2° | 5 % | 1 m/s | 0.5 m/s, 10 s |
| `ground-robot` | 1.5 m/s | consumer | wheel odometry | 2° | 2 % | 0 | 0.05 m/s, 1 s |

A spec file (JSON) sets any of `airframe`, `speed_m_s`, `imu_grade`, `initial_velocity_err_m_s`,
`latitude_deg`, `thresholds_m`, `aiding` (`kind`, `heading_err_deg`, `scale_err`, `velocity_bias_m_s`,
`velocity_noise_m_s`, `noise_corr_s`), `denied_leg_m` and `allowance_m` (the leg check reports the error at the
end of a GNSS-denied leg and whether it is within the allowance).

## Consumer-quadcopter behaviour under GNSS loss (`quad-loss`)

A behaviour model of the class of consumer quadcopters whose manuals describe a downward vision positioning
system and an attitude (ATTI) fallback: below `vision_max_height_m` with `vision_conditions_ok` the aircraft
holds position on vision (drift as velocity-aided dead reckoning at zero ground speed); otherwise it holds no
position and drifts with the wind (`wind·t`). Return-to-home that needs GNSS is unavailable in both. The vision
height (default 10 m) is an assumption to set from the aircraft's manual. Output: the mode, the drift after
`loss_s` and the time to leave `buffer_m`.

## Cascade failover harness (`failover`)

Position sources in priority order, each `absolute` (error `sigma_m` while healthy; the fault's `bias_m`
while a failure is not yet detected), `relative` (error at handover plus `growth` × distance) or `inertial`
(error at handover plus the coast model of `imu_grade`), with a detection latency for failures and
recoveries. Events fail or recover a source. The harness reports the source segments, the failovers, the
largest error and the time above `alert_limit_m`. The built-in example runs three sources: GNSS fails with a
30 m fault at 60 s (detected after 2 s), visual-inertial odometry loses its features at 120 s, GNSS recovers
at 150 s: the cascade runs GNSS, VIO, INS, GNSS, and the error exceeds the 40 m alert limit for about 15 s on
inertial coast.

## Set-based protection level (`zonotope-pl`)

For a snapshot least-squares position with range errors only known to be bounded (`|ε_i| ≤ b_i`), the
position error set is the zonotope with generators `g_i = S_{1..3,i}·b_i` (`S = (HᵀWH)⁻¹HᵀW`). The vertical
protection level is `Σ|g_i,U|`; the horizontal one is the largest distance of a vertex of the projected 2-D
zonotope from the origin, found exactly by walking the directions between the generators' normals (the test
compares it with a brute-force enumeration of every sign vector). No probability is attached: the bound holds
whenever the error bounds hold. Input: `{"sats": [{"az_deg": .., "el_deg": .., "bound_m": ..}, ...],
"weighted": false}`.
