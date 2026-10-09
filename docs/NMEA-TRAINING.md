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

# serve over TCP in real time (waits for the simulator to connect)
kshana nmea-scenario scenarios/training/open-sea-jamming.toml --tcp 0.0.0.0:10110

# UDP, one sentence per datagram, ten times faster than real time
kshana nmea-scenario scenarios/training/combined-event.toml --udp 192.168.1.50:10110 --speed 10

# UDP broadcast
kshana nmea-scenario scenarios/training/combined-event.toml --udp 192.168.1.255:10110 --broadcast
```

| Option | Meaning |
|---|---|
| `--out <file>` | write the stream to a file; with no network output the default is `<name>.nmea` |
| `--instructor-log <prefix>` | write `<prefix>.instructor.json` and `<prefix>.instructor.txt` (default: next to the file) |
| `--tcp <addr:port>` | TCP server; the run starts when a client has connected (`--wait-clients <n>`) |
| `--udp <addr:port>` | UDP, one sentence per datagram; `--broadcast` allows a broadcast address |
| `--realtime`, `--speed <x>` | pace the stream; `--speed 0` is as fast as possible. Network output defaults to real time, files to as fast as possible |
| `--seed <n>` | replace the scenario seed |
| `--no-marker` | omit the marker sentence |

The same seed gives the same bytes. Pacing never changes the bytes.

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
assigned in slot order, each constellation sits at its published reference epoch, and the sky
repeats daily. C/N0 follows elevation (a nominal zenith level, set in `[receiver]`), with a fixed
per-satellite offset, slow fading and noise. A satellite below `track_threshold_dbhz` has an
empty SNR field; one below `use_threshold_dbhz` is tracked but not used. Fewer than four usable
satellites loses the fix, and it returns after `reacquire_s` of usable signal.

## Events

Each `[[event]]` has a `kind`, an onset `start_s`, a `duration_s` (onset to the start of the
release), an onset ramp `ramp_s` and a release ramp `recovery_s`. Strength rises linearly over
`ramp_s`, holds, then falls over `recovery_s`; `0` is a step. All the effects scale with that
strength. Parameters that do not belong to the kind are refused.

| kind | parameters | effect |
|---|---|---|
| `jamming` | `cn0_drop_db`, `spread_db` (default 6) | every satellite's C/N0 falls by up to `cn0_drop_db` (per-satellite spread), satellites drop out lowest first, the fix is lost when fewer than four are usable, and recovers after the release and `reacquire_s` |
| `drag-off` | `final_offset_m`, one of `bearing_deg` (true) or `relative_bearing_deg` (to the course), `counterfeit_cn0_dbhz` | the receiver keeps a **valid fix** whose position walks away from the truth; SOG and COG include the drag |
| `time-spoof` | `offset_s`, `counterfeit_cn0_dbhz` | RMC, GGA, GNS and ZDA time is moved from true UTC; position stays true |
| `replay-delay` | `delay_s`, `affect_time` (default true), `counterfeit_cn0_dbhz` | position, velocity (and time) are those of the vessel `delay_s` ago: a simplified, meaconing-style abstraction, not a propagation model |

`counterfeit_cn0_dbhz`: while a drag-off, time-spoof or replay-delay is active, every tracked
satellite shows that single raised level, a classic sign. Leave it out for a subtle event in
which the genuine C/N0 pattern is kept. While any counterfeit event is active the receiver
follows the counterfeit signal, so jamming does not drop it; a fix lost to earlier jamming
returns after `reacquire_s` on the counterfeit signal (see `combined-event`). A time change that
would make reported time stop or run backwards (rate of 1 s per second or more) is refused
unless it is a step (`ramp_s = 0`).

Events may overlap; their effects add (offsets, time changes, delays) or take the strongest
(jamming).

## The instructor log

Alongside the stream, `<prefix>.instructor.json` and `<prefix>.instructor.txt` give:

- the events as injected, in plain language with every parameter, and their UTC onset;
- a timeline: onset, full effect, recovery begins, recovered, and the receiver's own
  `fix-lost` and `fix-regained`;
- the true track against the reported one at `log_interval_s` spacing: true and reported
  position, speed and course, position error in metres, time offset, satellites used and
  tracked, mean C/N0, and which events were active;
- the scenario's `trainer_note`.

Show the log only at the debrief.

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

## Reading it back

`kshana receiver-trust` can ingest these files (`format = "nmea"`), and the tests read every
sentence of every library scenario with that reader. Tests pin a golden excerpt per scenario
(`tests/fixtures/nmea_training/`); regenerate with `KSHANA_BLESS_GOLDEN=1` after an intended change.
