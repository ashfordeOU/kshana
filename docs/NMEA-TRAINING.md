# NMEA training streams: `kshana nmea-scenario`

Maritime academies and simulator centres can feed Kshana-generated NMEA 0183 into a bridge
simulator or a chart plotter to train crews to recognise GNSS jamming and spoofing.

> **Training and testing only.** The generated streams are synthetic. They must never be fed
> to a vessel's live navigation systems. Every stream starts with, and repeats every ten
> seconds, a proprietary marker sentence, `$PKSHT,TRAINING,SYNTHETIC,NOT-FOR-NAVIGATION`,
> which receivers ignore; `--no-marker` removes it for a simulator that rejects unknown
> sentences. This writes NMEA **text only**: there is no RF, IQ or waveform output, and
> nothing transmits except the text to the address you name.

## Use

```bash
# write a file (default <name>.nmea) and the instructor log next to it
kshana nmea-scenario scenarios/training/coastal-drag-off.toml --out drag.nmea

# serve over TCP in real time on this machine only (waits for the simulator to connect)
kshana nmea-scenario scenarios/training/open-sea-jamming.toml --tcp 10110

# reachable from the bridge-simulator host: name the address in full
kshana nmea-scenario scenarios/training/open-sea-jamming.toml --tcp 192.168.1.20:10110

# UDP, one sentence per datagram, ten times faster than real time
kshana nmea-scenario scenarios/training/combined-event.toml --udp 192.168.1.50:10110 --speed 10

# UDP broadcast
kshana nmea-scenario scenarios/training/combined-event.toml --udp 192.168.1.255:10110 --broadcast
```

| Option | Meaning |
|---|---|
| `--out <file>` | write the stream to a file; with no network output the default is `<name>.nmea` |
| `--instructor-log <prefix>` | write `<prefix>.instructor.json` and `<prefix>.instructor.txt` (default: next to the file) |
| `--tcp <addr:port>` or `<port>` | TCP server; the run starts when a client has connected (`--wait-clients <n>`). A bare port listens on `127.0.0.1` only |
| `--udp <addr:port>` or `<port>` | UDP, one sentence per datagram; `--broadcast` allows a broadcast address. A bare port sends to `127.0.0.1` |
| `--realtime`, `--speed <x>` | pace the stream; `--speed 0` is as fast as possible. Network output defaults to real time, files to as fast as possible |
| `--seed <n>` | replace the scenario seed |
| `--no-marker` | omit the marker sentence |

**There is no authentication.** A TCP server given a non-local address serves the stream to
anyone who can reach it, and UDP sends to whatever address you name. A TCP client that does not
take its data within two seconds is dropped, so one stalled consumer cannot hold the others up.

The same seed gives the same bytes on one platform, and pacing never changes the bytes. Across
platforms the generator's own arithmetic is bit-identical (it uses the portable mathematics
layer), but satellite positions and look angles come from engine functions that call the host's
mathematics library, so in a rare borderline case a rounded elevation, azimuth or C/N0 digit in
GSV can differ between platforms.

## What is written

Each epoch (1, 2, 5 or 10 per second) carries: **RMC, GGA, GNS** (fix, position, time),
**GSA** (used satellites and DOP, one per constellation), **GSV** (satellites in view with
elevation, azimuth and SNR in dB-Hz, one set per constellation, NMEA 4.10 signal ID), **VTG**
(course and speed over ground), **ZDA** (time and date), **HDT** (gyro heading) and **VBW**
(water and ground speed from the log). Talker is `GN` with several constellations, otherwise
the constellation's own. Lines end in CRLF and are checksum-valid.

HDT and VBW stand in for independent sensors (a gyro compass and a Doppler log). **No event
touches them**, which is deliberate: the gap between what GNSS reports and what the gyro and
log say is a debrief cue.

When the fix is lost, GGA quality is 0, RMC status is `V`, position fields are empty and the
time fields continue (the receiver's clock keeps running), as real receivers do.

## The vessel

`[vessel]` and `[[waypoint]]` give a start position, speed and the points to steer through.
The vessel is steered towards the next waypoint under a **rate-of-turn limit**
(`max_rot_deg_per_min`, default 30), a limit on how fast the rate of turn builds
(`max_rot_accel_deg_per_s2`) and a **speed-change limit** (`max_accel_kn_per_min`). A leg's
speed is the waypoint's `speed_kn`. `[environment]` adds a current, so speed over ground
differs from speed through the water and the heading differs from the course over ground, and
a magnetic variation. `stop_at_end` brings the vessel to rest at the last waypoint.

## Satellite geometry

Satellites come from the engine's own nominal constellations (GPS slot table, Galileo and
BeiDou MEO Walker patterns, GLONASS ICD), propagated by `constellation::satellite_positions_fixed`
(two-body plus secular J2, Earth rotation) and seen from the vessel with the engine's WGS-84
look angles. The visible count, elevations and azimuths in GSV are plausible for the place and
the time of day. **This is a nominal sky, not an ephemeris for the stream's date**: PRNs are
assigned in slot order and each constellation keeps its published slot layout, propagated
continuously from the GPS slot-table epoch (2016-12-31) under J2, so the layout is intact but its
orientation is not that of the real sky on the stream's date. C/N0 follows elevation (a nominal
zenith level, set in `[receiver]`), with a fixed per-satellite offset, slow fading and noise. A
satellite below `track_threshold_dbhz` has an empty SNR field; one below `use_threshold_dbhz` is
tracked but not used. Up to `max_used` (default 12, the NMEA GGA ceiling) usable satellites are
used, chosen for geometry (the highest satellite in each 30 degree azimuth sector first). Fewer
than four usable satellites loses the fix, and it returns after `reacquire_s` of usable signal.

## Events

Each `[[event]]` has a `kind`, an onset `start_s`, a `duration_s` (onset to the start of the
release), an onset ramp `ramp_s` and a release ramp `recovery_s`. Strength rises linearly over
`ramp_s`, holds, then falls over `recovery_s`; `0` is a step. All the effects scale with that
strength. Parameters that do not belong to the kind are refused.

| kind | parameters | effect |
|---|---|---|
| `jamming` | `cn0_drop_db`, `spread_db` (default 6) | every satellite's C/N0 falls by up to `cn0_drop_db` (per-satellite spread), satellites drop out lowest first, the fix is lost when fewer than four are usable, and recovers after the release and `reacquire_s` |
| `drag-off` | `final_offset_m`, one of `bearing_deg` (true) or `relative_bearing_deg` (to the course **at onset**, then held), optional `max_accel_mps2`, `counterfeit_cn0_dbhz` | the receiver keeps a **valid fix** whose position walks away from the truth; SOG and COG include the drag. The drag follows smoothstep on the ramps, so the false track starts and stops with no velocity step; its peaks are `1.5 D/T` m/s and `6 D/T^2` m/s squared for a ramp of `T` s over `D` m (both logged), and a scenario that would exceed `max_accel_mps2` is refused. A step (`ramp_s = 0`) moves the position without touching the velocity |
| `time-spoof` | `offset_s`, `counterfeit_cn0_dbhz` | RMC, GGA, GNS and ZDA time is moved from true UTC; position stays true |
| `replay-delay` | `delay_s`, `affect_time` (default true), `counterfeit_cn0_dbhz` | position, velocity (and time) are those of the vessel `delay_s` ago, with the delay following smoothstep on its ramps and the reported speed scaled by `1 - d(delay)/dt` while it changes: a simplified, meaconing-style abstraction, not a propagation model |

`counterfeit_cn0_dbhz`: while a drag-off, time-spoof or replay-delay is active, every tracked
satellite shows that single raised level, a classic sign. Leave it out for a subtle event in
which the genuine C/N0 pattern is kept. While any counterfeit event is active the receiver
follows the counterfeit signal, so jamming does not drop it; a fix lost to earlier jamming
returns after `reacquire_s` on the counterfeit signal (see `combined-event`). A time change that
would make reported time stop or run backwards (rate of 1 s per second or more) is refused
unless it is a step (`ramp_s = 0`).

Events may overlap; their effects add (offsets, time changes, delays) or take the strongest
(jamming). The timeline's `onset` is the first epoch at which the event has an effect, one epoch
after the scripted `start_s` when the event ramps in.

## The instructor log

Alongside the stream, `<prefix>.instructor.json` and `<prefix>.instructor.txt` give:

- the events as injected, in plain language with every parameter, and their UTC onset;
- a timeline: onset, full effect, recovery begins, recovered, and the receiver's own
  `fix-lost` and `fix-regained`;
- the true track against the reported one at `log_interval_s` spacing: true and reported
  position, speed and course, position error in metres, time offset, satellites used and
  tracked, mean C/N0, and which events were active;
- the peak speed and acceleration of the true and of the reported track;
- the scenario's `trainer_note`.

Show the log only at the debrief.

### JSON fields (schema `kshana-nmea-training/1`)

| field | type, unit | meaning |
|---|---|---|
| `schema` | string | `kshana-nmea-training/1` |
| `warning` | string | the training-only statement |
| `scenario`, `description`, `trainer_note` | string | from the scenario |
| `seed` | integer | seed used |
| `start_utc` | ISO 8601 UTC | start of the run |
| `duration_s` | s | length of the run |
| `summary.true_peak_sog_kn`, `summary.reported_peak_sog_kn` | knots | highest true and reported speed over ground |
| `summary.true_peak_accel_mps2`, `summary.reported_peak_accel_mps2` | m/s squared | largest change of velocity per second, true and between consecutive reported fixes |
| `events[]` | | one per scripted event |
| `events[].id` | integer | 1-based; used by `timeline[].event` and `track[].active_events` |
| `events[].description` | string | plain-language description with the parameters |
| `events[].start_utc` | ISO 8601 UTC | scripted onset |
| `events[].parameters` | object | the event exactly as written (`kind`, `start_s`, `duration_s`, `ramp_s`, `recovery_s`, and the kind's own parameters; absent ones are omitted) |
| `events[].resolved_bearing_deg` | degrees true or null | drag-off: the direction applied (a relative bearing is resolved at onset) |
| `events[].peak_drag_speed_mps`, `events[].peak_drag_accel_mps2` | m/s, m/s squared or null | drag-off: peaks the drag adds to the false track |
| `timeline[]` | | moments for the debrief, in time order |
| `timeline[].t_s`, `.utc` | s from start, ISO 8601 UTC | when (true time) |
| `timeline[].event` | integer or null | the event id; null for receiver-state changes |
| `timeline[].what` | string | `onset`, `full-effect`, `recovery-begins`, `recovered` (events); `fix-lost`, `fix-regained` (receiver) |
| `timeline[].text` | string | explanation |
| `track[]` | | one row per `log_interval_s` |
| `track[].t_s`, `.utc` | s, ISO 8601 UTC | when (true time) |
| `track[].true_lat_deg`, `.true_lon_deg` | degrees | true position |
| `track[].true_sog_kn`, `.true_cog_deg`, `.true_heading_deg` | knots, degrees true | true speed and course over ground, and gyro heading |
| `track[].fix_valid` | boolean | the receiver reported a fix |
| `track[].reported_lat_deg`, `.reported_lon_deg`, `.reported_sog_kn`, `.reported_cog_deg` | degrees, knots, degrees true, or null | what the receiver reported; null while the fix is lost |
| `track[].position_error_m` | m or null | horizontal distance from true to reported position |
| `track[].time_offset_s` | s | reported UTC minus true UTC |
| `track[].n_used`, `.n_tracked` | integers | satellites used in the fix, and tracked |
| `track[].mean_cn0_dbhz` | dB-Hz or null | mean C/N0 of the tracked satellites |
| `track[].active_events` | integers | ids of events with an effect at this instant |

Adding a field does not change the schema tag. Renaming or removing a field, or changing a
field's meaning or unit, bumps the number (`/2`).

## The scenario library

`scenarios/training/`, each a few minutes of passage with a trainer note in its TOML:

| file | what it shows |
|---|---|
| `open-sea-jamming.toml` | C/N0 falls together, satellites drop out, the fix is lost and returns |
| `coastal-drag-off.toml` | a valid, healthy-looking fix drags 1.4 km towards the shore; uniform raised C/N0 |
| `port-approach-time-spoof.toml` | position correct, UTC drifts 45 s ahead during a slow port approach |
| `combined-event.toml` | jamming, then counterfeit takeover with drag-off and time offset, then a replay delay |

Positions, dates and tracks are invented; the library carries no real vessel, operator or
recording. It makes no statement about how any receiver or system would perform against
interference.

## Modelling choices

The generator is a training tool with no external oracle, and its numbers are modelling
choices, not measurements of any receiver. They are chosen to look like an ordinary receiver
log: the C/N0 slope of 14 dB from zenith to horizon below the zenith level (default
47 dB-Hz) and the per-satellite offset of +/-1.5 dB, slow fading of 0.8 dB over 97 s and
0.5 dB over 31 s, 0.3 dB jitter; the thresholds for tracking (20 dB-Hz) and use (28 dB-Hz); the
position noise (1.5 m at HDOP 1, correlated over 30 s, vertical twice that); 0.05 degree gyro
noise and 0.03 kn leeway noise; the 20 s steering time constant and the waypoint arrival radii
of the vessel model; and the azimuth-sector satellite choice. The defaults live in `[receiver]`
and `[vessel]` and can all be changed in the scenario.

## Reading it back

`kshana receiver-trust` can ingest these files (`format = "nmea"`). The tests check every
sentence of every library scenario against its own field-count and checksum rules, and run the
files through that reader, which interprets GGA, RMC and GSV and passes over the other types
without skipping any. Tests pin a golden excerpt per scenario
(`tests/fixtures/nmea_training/`); regenerate with `KSHANA_BLESS_GOLDEN=1` after an intended change.
