# Maritime trust: can the bridge trust this fix?

`kshana receiver-trust` can score, for a **moving vessel**, a live 0-100 trust figure for
every position fix, from what any receiver already puts on the bus (NMEA 0183 first), and say
which checks reduced it. It is a software layer that sits next to a receiver. It is not a
receiver, it does not replace one, and it does not make a fix more accurate.

> **Advisory software.** Kshana is not type-approved navigation equipment (IEC 61108,
> IEC 61162) and has not been assessed against any performance standard. Its score and its
> gate are aids to the navigator's judgement. The operator stays responsible for the safe
> navigation of the vessel and for any decision to rely on, or to stop relying on, a fix.

This page says what the checks look at, what each one can and cannot catch, how to run it
live and what the gate does. The score mapping and every default are in
[`RECEIVER-TRUST.md`](RECEIVER-TRUST.md).

## What it reads

A vessel is declared in the session file, with its limits stated before the run:

```toml
[platform]
kind = "vessel"
max_speed_kn = 20.0        # includes any current you want to allow for: it limits speed over ground
max_accel_mps2 = 0.2
max_turn_rate_dps = 2.0
antenna_height_m = 18.0    # antenna above the waterline
heading_sensor = true      # the stream carries a gyro or compass heading
```

| Sentence | Read |
|---|---|
| GGA | position, fix quality (0 = no fix), altitude above mean sea level, geoid separation, HDOP |
| RMC | status (`A` valid, `V` not), speed and course over ground, date, mode |
| VTG | speed and course over ground, where RMC has none |
| HDT, THS | heading (THS only when its mode is not `V`) |
| VHW, VBW | speed through the water (VBW only when its status is `A`) |
| ZDA | time |
| GSV | per-satellite signal strength (dB-Hz) |
| `$PKSOS,<A/F/N>` | an OSNMA status a receiver reported, translated into this sentence by the adapter that reads the receiver: `A` authenticated, `F` failed, `N` no result |

Epochs the receiver itself flags invalid (GGA
quality 0 or RMC status `V`) are not used for the position checks: the receiver has already said so.

The first `calibration_s` seconds form the baseline and are never scored. Every monitor looks only
at the current and earlier epochs, so a decision at an epoch does not change when later data
arrives, and a live stream gives the same score as the same text read as a file.

## What each check catches, and what it cannot

A counterfeit position has to agree with a ship's physics and with the ship's other sensors. Each
check compares the fix with one of them. A check is only as independent as its other source: a
heading from a GNSS compass, or a "speed through the water" derived from GNSS, is not independent
of the receiver under test and adds nothing.

| Check | Catches | Cannot |
|---|---|---|
| `kinematic` | a position step; a track whose movement the reported speed and course do not explain; an implied speed, acceleration or turn rate above the stated vessel limits | a drag whose reported speed and course follow the counterfeit track and stays inside the limits (the receiver derives them from its own solution, so they agree with each other); a speed limit stated too high |
| `heading-course` | a track that departs from where the ship points by more than the stated crab angle | a drag along the course (the course does not change); a heading from the same receiver or a GNSS compass; a cross-set above the tolerance (false alarm); speeds below `min_speed_kn` |
| `speed-log` | a drag that changes speed over ground against speed through the water | a log that is GNSS-derived; a current above the allowance (false alarm); a drag slower than the allowance |
| `sea-level` | an altitude that is not where the sea surface and the stated antenna height put it | a spoofer that keeps the altitude plausible; the tolerance is wide because standalone vertical error is large; the geoid separation is recorded but not checked, because there is no geoid model in the engine |
| `cn0-spread`, `cn0-rise` | the signature of one transmitter: C/N0 across the satellites collapsing together, or rising together, against the calibration baseline | a spoofer that shapes power per satellite; anything while the baseline itself is spoofed; a GSV cadence too slow to follow |
| `time-consistency` | the receiver's time stepping irregularly or running backwards; against this computer's clock, the receiver's time drifting from it (real-time streams only) | a counterfeit time that is consistent and steady; a clock that is wrong from the start |
| `osnma` | a reported OSNMA authentication failure | the status is read, not verified; a spoofer that suppresses the report is not seen |
| `cn0-drop`, `loss-of-lock`, `agc`, `jam-ind` | power denial and loss of satellites, as in the static case | they say the environment is hostile, not that the fix is wrong |

**What NMEA-only monitors cannot do.** A spoofer that reproduces the whole constellation with a
self-consistent position, velocity, heading-compatible course, plausible per-satellite power and a
matching clock is invisible to every check above: nothing in the sentences distinguishes its fix
from a real one. Neither does a replay of recorded real signals. Authentication (OSNMA, or a
receiver with its own anti-spoofing) and independent navigation sensors are what close that gap;
this layer can only use their reported status. A stream that is already being spoofed while the
baseline forms has no clean baseline. Absence of an alarm is not evidence of a good fix.

## Trust score

Each epoch after calibration gets a score from 0 to 100 and the reasons it is not 100: which
checks deducted, their statistic against threshold, and their points. Bands (edges stated in the
session): `nominal` at 90 or above, `degraded` at 55 or above, `untrusted` below. The mapping,
every weight and its reason are in [`RECEIVER-TRUST.md`](RECEIVER-TRUST.md#trust-score-vessel-platform);
it is deterministic and fixed before a log is scored, with no learning and nothing fitted to events.

Outputs of a batch run: `session.result.json` (with the score model and every epoch's deductions),
`session.trust.csv` (with `score` and `score_reasons` columns) and `session.trust.svg`, which for a
vessel is the receiver-reported track coloured by trust band above the score over time.

## A synthetic demo

`examples/maritime-trust/` holds a made-up NMEA log of a ferry on a Tallinn to Helsinki route (a
50-minute excerpt, about 17 kn, 1 Hz: GGA, RMC, VTG, a gyro heading, a speed log, GSV with a plausible
sky) in which a position drag-off pulls the *reported* position away from the vessel's real one
from 1500 s. The receiver keeps reporting a **valid** fix throughout; the trust score is what falls,
through the degraded band into the untrusted one. `session.toml` states every threshold, the
vessel's limits and every score weight before the run.

```sh
kshana receiver-trust examples/maritime-trust/session.toml
kshana receiver-trust live examples/maritime-trust/session.toml \
  --file examples/maritime-trust/tallinn-helsinki.nmea --gate --json trust.jsonl > gated.nmea
```

The log is **text written to a file** by `cargo run --example gen_maritime_trust_demo`: it models no
radio signal and transmits nothing. It is not a measurement and the route is illustrative, not a
chart. `tests/receiver_trust_maritime_demo.rs` pins the log and the expected output as regression
guards on the synthetic data; they say nothing about how any monitor does on real interference.

## Studio view specification

For whoever builds the Studio view of a vessel run. Nothing in this section is implemented in the
Studio yet; the engine side (the data below) is.

**Inputs.** Either of:

* a batch run's result JSON (`kshana receiver-trust <session.toml>`, or the same through
  `receiver_trust(toml)` in the WebAssembly package with the log inline): `score_model` (band
  edges, ramp, evidence hold, every weight), `monitors_run`, `states`, and `epochs[]`, each with
  `t_s`, `state`, `alarms`, `score.{score,band,deductions[]}` and
  `marine.{position:[lat,lon], stats, ratios}`; or
* the live JSON lines (schema above), one object per epoch, appended as the stream runs. Each
  line carries the receiver-reported `position` (schema 1.1).

The demo set is `examples/maritime-trust/`: `session.toml`, `tallinn-helsinki.nmea` (the log) and
`tallinn-helsinki.truth.csv` (`t_s,true_lat_deg,true_lon_deg`: where the vessel really was, which
no real log has). A view should run the session and read the truth file alongside.

**What to draw.**

1. *Track*, north up, one scale on both axes: the receiver-reported positions as a line coloured by
   the epoch's band (grey calibrating, green nominal, amber degraded, red untrusted), start and end
   marked, a scale bar. For the demo, the true track as a thin neutral line under it, so the drag-off
   shows as the two separating; a toggle for the true track and an offset-in-metres readout at the
   cursor's time.
2. *Score timeline*: the score from 0 to 100 against time, the band edges (`nominal_min`,
   `degraded_min` from `score_model`) as dashed lines, the band as a strip underneath, and the
   onset of any stated event as a marker. The time axis is shared with the track.
3. *Reasons*: for the epoch under the cursor, the deductions (monitor, ratio against threshold,
   points) as horizontal bars, largest first, with the weight each monitor carries from
   `score_model.weights`; monitors that ran and cost nothing shown faint, monitors that did not run
   (not in `monitors_run`) listed as "not run", never as passing.
4. *Monitor strips*: one thin strip per monitor in `monitors_run` showing its ratio over time
   (alarm at 1), so a reader sees which check moved first.
5. *Gate state*: in a live view, the `gate` of each epoch (`off`, `passed`, `withheld`) as a strip
   under the band strip, and the latest `$PKSHT`. In a batch view, the epochs a gate would have
   withheld are those whose band is untrusted, with the release hold applied.
6. *Receiver-reported fix*: the demo's receiver reports a valid fix throughout (GGA quality 1, RMC
   status A); say so in the legend, because that is the point of the view.

**Interactions.** One time cursor shared by every panel (drag, arrow keys, and a play button that
replays at 1x to 60x); hovering the track or any strip moves it. Clicking a deduction highlights the
epochs in which that monitor was above its onset. A band filter (show only degraded and untrusted
epochs) and a jump to the first deduction and to the first untrusted epoch. Hover text on every
monitor name giving the one-line description from this page. The session's thresholds and weights
are shown, read-only, beside the chart, so what the score used is on screen.

**Wording to keep.** The page must say it is advisory software and not type-approved navigation
equipment, that the demo is synthetic text with a made-up drag-off, and that a fix with no alarm is
not thereby a good fix (see the limits above). No figure on the page should read as a measure of how
the checks do on real interference.

## From code

For callers that hold the session and the bytes in memory (no files, no clock, no sockets; safe
for WebAssembly), `kshana::receiver_trust::assess` has:

* `assess_vessel_log(session_toml, log_bytes) -> Result<ReceiverTrustResult, String>`: a whole
  log, scored as a batch run; the same result as `kshana receiver-trust <session.toml>`, which
  serialises to the result JSON (`score_model`, `monitors_run`, `epochs[]` with scores and
  deductions).
* `assess_stream_excerpt(session_toml, excerpt_bytes) -> Result<ExcerptAssessment, String>`: a
  bounded piece of a stream (at most 2 MiB and 20,000 epochs, and long enough to hold the
  calibration window), scored as live mode scores it and returned in the live JSON-lines schema
  (`epochs[]`, the last `$PKSHT`, a summary of band counts, lowest and final score, first
  untrusted time). The receiver's time is not compared with a host clock. The long-running live
  mode (sockets, a file being appended, the gate) is the binary's.

Both need a session with `[platform] kind = "vessel"`; its `[log]` table is optional.

## Run it live

```sh
# stdin: a serial port read by another tool, or a multiplexer's output
some-nmea-source | kshana receiver-trust live session.toml

# a log file that is being appended to (it starts at the beginning; --from-end skips what is there)
kshana receiver-trust live session.toml --file /var/log/nmea.log --follow

# a TCP server (a multiplexer or a terminal server) or UDP datagrams (a bridge network)
kshana receiver-trust live session.toml --tcp 192.0.2.10:10110
kshana receiver-trust live session.toml --udp 10110
```

The session is the same `session.toml` as a batch run, with a `[platform]` table that declares
`kind = "vessel"`; its `[log]` table is not needed. Serial ports are not opened directly yet:
read the port with the tool you already use (`stty` and `cat`, a terminal server, a
multiplexer) and pipe or forward it. Direct serial input can come later.

Each completed epoch writes one JSON line on stdout:

```json
{"seq":941,"t_s":940.0,"time":"2025-06-14T08:15:40.000Z","state":"untrusted","score":23.4,
 "deductions":[{"monitor":"heading-course","ratio":2.0,"points":40.0}],
 "alarms":["heading-course"],"gate":"off","note":null,
 "position":{"lat_deg":59.8123456,"lon_deg":24.9012345,"height_m":39.4}}
```

`state` is `calibrating`, `nominal`, `degraded` or `untrusted` (the band of the score, with
the edges in the session's `[score]` table); `score` is absent while calibrating; `deductions`
list which checks took points off and how many, largest first.

### JSON-lines schema (version 1.1)

One JSON object per completed epoch, keys in this order:

| Key | Type | Meaning |
|---|---|---|
| `seq` | integer | count of epochs reported, from 1 |
| `t_s` | number | seconds since the first epoch of the stream |
| `time` | string or null | the epoch's time as the stream states it (ISO-8601 UTC with a date once an RMC was seen, else `hh:mm:ss.mmm UTC (date not in log)`) |
| `state` | string | `calibrating`, `nominal`, `degraded` or `untrusted` |
| `score` | number or null | 0 to 100, one decimal; null while calibrating or when `note` says why none could be produced |
| `deductions` | array | `{"monitor": string, "ratio": number, "points": number}`, largest points first; `ratio` is statistic over threshold (alarm at 1 or more); only monitors that cost points are listed |
| `alarms` | array of string | monitors at or above their threshold |
| `gate` | string | `off`, `passed` or `withheld` |
| `note` | string or null | why no score was produced (for example a declared heading sensor that is absent) |
| `position` | object or null | *(added in 1.1)* the position the receiver reported at this epoch, `{"lat_deg", "lon_deg", "height_m"}` (height ellipsoidal where the sentence gives the geoid separation, else above mean sea level); null when the receiver gave none, including calibrating epochs without a fix |

Monitor names (kebab-case; 16): `cn0-drop`, `agc`, `jam-ind`, `loss-of-lock`, `position-jump`, `raim`,
`clock`, `solve-failure`, `kinematic`, `heading-course`, `speed-log`, `sea-level`, `cn0-spread`,
`cn0-rise`, `time-consistency`, `osnma`. New names may be added in later
versions; consumers should treat an unknown monitor name as a monitor. The `$PKSHT` layout below
carries a format version in its first field; this JSON schema is version 1.1: 1.1 added `position` at the end, and it changes only by
adding keys at the end.

### Authentication input

The `osnma` monitor takes per-satellite authentication status from an authentication source
through `MarineObs::sat_auth` (a list of `(satellite, status)`, status `Authenticated`, `Failed`
or `Unavailable`), next to the overall `MarineObs::osnma`. On the NMEA side the same is carried by
`$PKSOS,<A|F|N>[,<sat>:<A|F|N>...]`, for example `$PKSOS,A,E11:A,E19:F`. Any failure, overall or on
one satellite, alarms the monitor and costs its whole weight; success is no evidence. Kshana
verifies nothing here: the source that does is responsible for the status it reports.

An epoch is complete when the next timed sentence arrives; sentences of slower or unsynchronised
instruments (a gyro a few tenths of a second behind the receiver) that arrive before then belong
to it. If the stream stalls for `[live] idle_flush_s` (default 1.5 s, set it above the longest gap
between your receiver's timed sentences) the epoch is completed as it stands. The first
`calibration_s` seconds of the stream form the baseline and are never scored, so **a stream that is
already being spoofed when it is first connected has no clean baseline**: start the layer before
the voyage, or while the fix is known to be good. The calibration window closes once, by arrival:
an epoch whose time is earlier than a time already seen (a rewind, a replay of the stream's start)
is never calibration whatever its time says; it is scored with a full `time-consistency` deduction,
which is untrusted. The live engine scores each epoch over the calibration epochs and the last minute
or so of the stream, so its cost per epoch grows with `calibration_s` times the epoch rate; keep the
window short on a fast receiver. Its buffers are bounded (a flood of lines without a timed sentence
is completed every 5,000 lines, calibration and history are capped at 20,000 epochs).

The receiver's time is also compared with this computer's monotonic clock, which only means
something for a stream arriving in real time. A stored log fed in at full speed through stdin,
TCP or UDP trips that check by construction: pass `--replay`. (`--file` without `--follow`
already implies it.)

## `$PKSHT`: the proprietary sentence

Every epoch also produces one NMEA 0183 sentence, with a valid checksum, which `--pksht <path|->`
writes to a file or stdout and which the gate inserts into the forwarded stream:

```
$PKSHT,1,080140.25,23.4,U,W,heading-course:40.0/cn0-spread:30.0*29
```

| Field | Meaning |
|---|---|
| 1 | `1`: the format version |
| 2 | UTC time of the epoch, `hhmmss.ss`; empty if the stream gave none |
| 3 | trust score 0 to 100, one decimal; empty while calibrating or when none could be produced |
| 4 | band: `C` calibrating, `N` nominal, `D` degraded, `U` untrusted |
| 5 | gate: `-` off, `P` passed, `W` withheld (the fix was marked invalid in the forwarded cycle) |
| 6 | up to two reasons, `monitor:points` joined by `/`; empty when nothing was deducted |

The address is `P` + the manufacturer mnemonic `KSH` + `T`. Equipment that does not know a
proprietary sentence ignores it. Kshana ignores its own `$PKSHT` on input.

## Gate mode

`--gate` puts Kshana between the receiver and the equipment that uses its fix (a chart system,
a track control system). The NMEA stream goes in, comes out on stdout, and is:

* **passed through unchanged** while the epoch is not untrusted (and during calibration), with a
  `$PKSHT` after each cycle of sentences; and
* **marked invalid** while it is untrusted: GGA quality `0`; RMC status `V` (and its mode
  indicator `N` and navigational status `V` where present); GNS mode `N` in every position; GLL
  status `V` and mode `N`; VTG mode `N` where it has one. The position fields are left as they
  were: the point is that the equipment sees the receiver itself declare the fix invalid and
  raises its own alarm. Every rewritten sentence has its checksum recomputed.

Once withheld, the fix is released only after the epochs have been out of the untrusted band for
`[live] gate_release_s` (default 30 s), so a score at the band edge cannot make the fix flicker.
The JSON lines go only where `--json <path>` says (by default nowhere, because the stream has
stdout).

```sh
receiver-nmea-source | kshana receiver-trust live session.toml --gate --json trust.jsonl | downstream-equipment
```

To let a chart plotter connect directly, serve the gated stream over TCP instead of stdout:

```sh
receiver-nmea-source | kshana receiver-trust live session.toml --gate --listen tcp:10110
```

`--listen tcp:<port>` listens on the loopback address; `tcp:<addr>:<port>` listens elsewhere (a
warning is printed, because anyone who can reach the address can read the stream). Any number of
clients may connect; each gets the same stream from the moment it connects, and clients only read.
Every client has its own bounded queue and writer, so one that cannot keep up is dropped (its
connection closed, a line on stderr) and never delays the others or the input. `--listen` needs
`--gate`; stdout then carries nothing of the stream, so `--json -` is free.

What the gate does not do, and what to know before using it:

* It is **opt-in**. Nothing marks a fix invalid unless `--gate` is given.
* It **adds latency**: a cycle is held until its epoch is scored, which is the time to the next
  timed sentence (about one cycle: a second for a 1 Hz receiver), or `idle_flush_s` after the last
  one when the stream stalls. Equipment that needs a sentence within a
  few tens of milliseconds of the receiver's output must not sit behind it.
* It is **a single point in the chain**: if it stops, the stream stops. Run it supervised, and
  decide in advance what the downstream equipment does without a stream.
* It **fails closed on its own faults**: if the monitors cannot produce a score after calibration (a
  declared heading sensor that sends nothing, too few calibration epochs), the epoch is untrusted,
  carries a `note`, and is withheld; the release hold is timed on this computer's clock, not on the
  receiver's time, which is what a spoofer controls (for a replay there is only the receiver's time).
* It can **withhold a good fix** (a false alarm) as well as pass a spoofed one (a miss). The
  monitors check a fix against a ship's physics and its other sensors; a counterfeit that is
  consistent with all of them is not seen (see the limits below).
* It expects a **pure NMEA 0183 text stream**. Binary frames mixed into the stream are forwarded
  unchanged, but a `$PKSHT` can then land between the bytes of a frame.
* It is **not type-approved** and nothing in it has been assessed against IEC 61108 or IEC 61162.
  The operator remains responsible for the navigation of the vessel.
