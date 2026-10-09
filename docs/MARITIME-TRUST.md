# Maritime trust: can the bridge trust this fix?

`kshana receiver-trust` can score, for a **moving vessel**, a live 0-100 trust figure for
every position fix, from what any receiver already puts on the bus (NMEA 0183 first), and say
which checks reduced it. It is a software layer that sits next to a receiver. It is not a
receiver, it does not replace one, and it does not make a fix more accurate.

> **Advisory software.** Kshana is not type-approved navigation equipment (IEC 61108,
> IEC 61162) and has not been assessed against any performance standard. Its score and its
> gate are aids to the navigator's judgement. The operator stays responsible for the safe
> navigation of the vessel and for any decision to rely on, or to stop relying on, a fix.

This page covers running it live and what the gate does. (The platform model, the monitors,
the score and the synthetic demo are described in
[`RECEIVER-TRUST.md`](RECEIVER-TRUST.md).)

## A synthetic demo

`examples/maritime-trust/` holds a made-up NMEA log of a vessel on a Gdynia to Klaipeda route (a
one-hour excerpt, about 15 kn, 1 Hz: GGA, RMC, VTG, a gyro heading, a speed log, GSV with a plausible
sky) in which a position drag-off pulls the *reported* position away from the vessel's real one
from 1500 s. The receiver keeps reporting a **valid** fix throughout; the trust score is what falls,
through the degraded band into the untrusted one. `session.toml` states every threshold, the
vessel's limits and every score weight before the run.

```sh
kshana receiver-trust examples/maritime-trust/session.toml
kshana receiver-trust live examples/maritime-trust/session.toml \
  --file examples/maritime-trust/gdynia-klaipeda.nmea --gate --json trust.jsonl > gated.nmea
```

The log is **text written to a file** by `cargo run --example gen_maritime_trust_demo`: it models no
radio signal and transmits nothing. It is not a measurement and the route is illustrative, not a
chart. `tests/receiver_trust_maritime_demo.rs` pins the log and the expected output as regression
guards on the synthetic data; they say nothing about how any monitor does on real interference.

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
 "alarms":["heading-course"],"gate":"off","note":null}
```

`state` is `calibrating`, `nominal`, `degraded` or `untrusted` (the band of the score, with
the edges in the session's `[score]` table); `score` is absent while calibrating; `deductions`
list which checks took points off and how many, largest first.

An epoch is complete when the next timed sentence arrives, or when the stream has been quiet
for `[live] idle_flush_s` (default 0.35 s). The first `calibration_s` seconds of the stream
form the baseline and are never scored, so **a stream that is already being spoofed when it
is first connected has no clean baseline**: start the layer before the voyage, or
while the fix is known to be good.

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

What the gate does not do, and what to know before using it:

* It is **opt-in**. Nothing marks a fix invalid unless `--gate` is given.
* It **adds latency**: a cycle is held until its epoch is scored, which is the time to the next
  timed sentence, or `idle_flush_s` after the last one. Equipment that needs a sentence within a
  few tens of milliseconds of the receiver's output must not sit behind it.
* It is **a single point in the chain**: if it stops, the stream stops. Run it supervised, and
  decide in advance what the downstream equipment does without a stream.
* It can **withhold a good fix** (a false alarm) as well as pass a spoofed one (a miss). The
  monitors check a fix against a ship's physics and its other sensors; a counterfeit that is
  consistent with all of them is not seen (see the limits below).
* It expects a **pure NMEA 0183 text stream**. Binary frames mixed into the stream are forwarded
  unchanged, but a `$PKSHT` can then land between the bytes of a frame.
* It is **not type-approved** and nothing in it has been assessed against IEC 61108 or IEC 61162.
  The operator remains responsible for the navigation of the vessel.
