<!-- SPDX-License-Identifier: AGPL-3.0-only -->
# Running a receiver against an exported scenario

A receiver maker who owns a laboratory GNSS simulator can replay a Kshana scenario's
vehicle motion through it, record what the receiver under test does, and score that log
with `kshana receiver-trust` against events stated before the run. Kshana supplies the
motion, the event times and the scoring. It writes **no signal**: nothing exported here
synthesises, models or transmits a radio-frequency or baseband waveform, and an exported
event is a labelled time interval, not a recipe for producing interference. The simulator
and its operator supply the signals, and the operator is responsible for running them
only where that is authorised (conducted or shielded, per the simulator's own safety
instructions).

This page is a method. It publishes no results.

## 1. Export

```sh
kshana bench-export scenarios/gnss-ins.toml --out run1 --epoch 2025-03-01T10:00:00Z
```

Applies to the `gnss-ins` kind (a driving profile with attitude; the navigation-state
outages are the events), and to `jamming` and `gnss-sim` (a stationary receiver for the
scenario's duration; a `jamming` scenario's jammer is one event over the run). Other kinds
say why they have no vehicle trajectory. `--epoch` is the UTC instant of motion time zero
(default 2024-01-01T00:00:00Z); the scenarios carry no calendar date of their own for
vehicle motion. It must be a real UTC instant, `YYYY-MM-DDTHH:MM:SS` (a trailing `Z` is
accepted) with the year in 2000 to 2099 and every field in range; anything else is refused.
The output is byte-identical for the same scenario and epoch.

| File | Content |
|---|---|
| `run1.motion.csv` | one row per sample: `time_s`, Earth-fixed `x_m,y_m,z_m`, `vx_m_s,vy_m_s,vz_m_s`, geodetic `lat_deg,lon_deg,h_m`, `heading_deg,pitch_deg,roll_deg`, `utc`, `kshana_row` |
| `run1.motion.json` | the epoch, frames, units, columns and round-trip tolerances of that CSV |
| `run1.nmea` | NMEA 0183 `GGA` and `RMC` sentences per sample, with checksums |
| `run1.waypoints.txt` | a `RESOLUTION: <ms>` line then `longitude,latitude,altitude` rows (written only when every sample interval is the same whole number of milliseconds; when it is left out, the command says why on standard error) |
| `run1.events.csv` | `label,kind,onset_s,end_s,description` |
| `run1.events.toml` | the same events as `[[events]]` blocks for a `receiver-trust` scenario |

### Frames and conventions

- **Position:** WGS 84, Earth-fixed (ECEF: `x` through the equator at the prime meridian,
  `z` through the pole); `lat_deg`, `lon_deg`, `h_m` give the same position geodetically,
  `h_m` above the ellipsoid.
- **Velocity:** Earth-fixed axes, relative to the Earth.
- **Attitude:** `heading_deg` clockwise from true north in [0, 360), `pitch_deg` nose up
  positive, `roll_deg` right wing down positive; yaw-pitch-roll (3-2-1) from the local
  north-east-down frame to body axes x forward, y right, z down. A stationary source writes
  zeros. NMEA and the waypoint text carry no attitude.
- **Heading is the body's yaw, not the direction of travel.** In the `gnss-ins` driving
  profile the body yaws in square waves while the velocity follows, so heading and the
  course over ground can differ by tens of degrees (up to about 77 degrees in the bundled
  `automotive-urban-canyon` scenario). The NMEA `RMC` course is the course over ground, the
  direction of the velocity vector, so a simulator that reads heading from the motion file
  and one that reads course from the NMEA file see different angles. The course over ground
  from the CSV is `atan2(v_east, v_north)` of its velocity rotated to north-east-down.
- **Height follows the scenario.** For `gnss-ins`, `h_m` is the kind's own tangent-plane
  stepping of its truth and is not held constant (about 7 m over the 180 s of
  `automotive-urban-canyon`); it is the scenario's motion, written as it is.
- **NMEA `GGA` placeholders.** Fix quality (1), satellites used (12) and HDOP (1.0) are
  written only to make the sentence well formed. They say nothing about the scenario's
  geometry or any receiver state.
- **Time:** `time_s` after the epoch, UTC, leap seconds not modelled.
- **NMEA heights are ellipsoidal.** The `GGA` altitude holds the ellipsoidal height and the
  geoid separation is written as 0.0. A simulator that treats the altitude as height above
  mean sea level will place the vehicle off by the local geoid undulation.
- **Round-trip tolerances** (tested by reading each file back): CSV position 0.1 mm,
  latitude and longitude 1e-9 degree, velocity 0.1 mm/s, angles 1e-6 degree; NMEA
  horizontal position 5 mm, height 1 mm, speed 0.001 knot, course 0.001 degree.

### Loading the files into a simulator

Laboratory simulators differ, and this repository does not reproduce any simulator's
manual. Check which of the formats above yours reads, and its stated requirements:

- Many motion importers expect a fixed update rate, commonly 10 Hz. The `gnss-ins`
  scenario steps at 0.1 s; for a stationary scenario, set `[time] step_s` to the rate your
  simulator wants.
- Some importers skip samples that fall between whole seconds, or ignore the time column and
  use the row order. Start the motion on a whole second and keep the grid regular.
- A CSV importer that lets you map columns can read `run1.motion.csv` directly: choose the
  Earth-fixed or geodetic columns and set their units from `run1.motion.json`. Truncating the
  decimals produces false acceleration, so keep the written precision.
- The file is motion only. Configure the constellation, the interference and the receiver
  front end in the simulator, and time them to the events in `run1.events.csv`.

No vendor scripting interface is written by Kshana.

## 2. State what you will score before the run

The events file gives the intervals the scenario defines. Copy `run1.events.toml` into a
`receiver-trust` scenario, add any prediction you want checked, and fix the monitor
thresholds and tolerances **before** the receiver runs. Do not adjust them after seeing the
log; the scenario, the thresholds and the log's SHA-256 are all in the result's hash.

```toml
kind = "receiver-trust"
name = "bench session 1"

[log]
format = "ubx"                 # ubx, rinex, android or nmea
path = "receiver-log.ubx"

[monitors]
calibration_s = 60.0

# paste run1.events.toml here, and shift onsets by the log offset (step 4)
[[events]]
label = "gnss-denied-1"
kind = "other"
onset_s = 100.0
end_s = 160.0
```

The exported events carry the scenario's own kind: a `jamming` scenario's jammer is
`jamming`; a navigation-state outage is `other`, because the scenario states that GNSS was
unavailable, not how. Change the `kind` to match what you configure the simulator to do.

## 3. Run the receiver

Start the receiver and its logger, start the simulator scenario with the motion file, and
let the run cover the calibration interval, every event, and a margin after the last one.
Keep the receiver's own log (UBX, RINEX 3 observations, an Android logger CSV, or NMEA with
satellite status sentences). A log without per-satellite signal strength can still be scored
on the receiver's own position, but the carrier-to-noise monitors need it.

## 4. Align the clocks

`receiver-trust` counts event times from the first epoch of the receiver's log; the motion
file counts from its first sample. If the log starts `d` seconds before the motion's first
sample, add `d` to every `onset_s` and `end_s`. Record the offset and how you measured it,
and state it in the scenario's `name` or a comment, since a wrong offset moves every score.
Event times alone cannot tell you the offset; use the simulator's start-of-scenario marker
or the receiver's own time stamps.

## 5. Score

```sh
kshana receiver-trust bench-session.toml
```

writes `bench-session.result.json`, `.trust.csv` and `.trust.svg`. For each event the
result gives false alarms before the onset, the first alarm and its monitors, the latency,
and the outcome (`detected`, `late`, `missed`, `not-evaluable`), plus a predicted and
observed carrier-to-noise drop where you stated a prediction. A disagreement is reported,
never tuned away. See [RECEIVER-TRUST.md](RECEIVER-TRUST.md).

To see which public framework rows the session supports evidence for:

```sh
kshana compliance-report bench-session.result.json
```

See [compliance/README.md](compliance/README.md). That report describes the evidence in the
runs you give it; it makes no finding about the receiver or any framework.

## What this method does not do

- It does not produce a signal, and it does not say what interference a simulator should
  generate. The events say when, not what.
- A single session is a single data point. The result describes that log under that
  configuration, and says nothing about other receivers, firmware, antennas, or real
  interference.
- Heights, rates and time alignment are the operator's to check against the simulator; the
  export states its own conventions and tolerances and no more.
