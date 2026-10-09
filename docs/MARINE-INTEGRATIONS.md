# Marine integrations: the trust score on the bridge

Kshana's maritime trust score ([`MARITIME-TRUST.md`](MARITIME-TRUST.md)) is reachable from software boaters
already run: a **Signal K** server plugin and **OpenCPN** through gate-mode NMEA over TCP. A reference build
puts it on a small computer next to the receiver.

> **Advisory software.** Kshana is not type-approved navigation equipment (IEC 61108, IEC 61162) and has not
> been assessed against any performance standard. Everything on this page is an aid to the navigator's
> judgement. The operator stays responsible for the safe navigation of the vessel and for any decision to
> rely on, or to stop relying on, a fix. Nothing here transmits, and nothing here makes a fix more accurate.

| Piece | Where | Status in 0.35 |
|---|---|---|
| Signal K plugin | `integrations/signalk/` | shipped, unit-tested on recorded synthetic output; not published to npm |
| OpenCPN via gate-mode NMEA over TCP | `integrations/opencpn/` | shipped and tested (consumer-side replay); the OpenCPN user interface itself is not driven by any test |
| OpenCPN native score-panel plugin | `integrations/opencpn/plugin/` | built, logic unit-tested, and run inside OpenCPN 5.8.4 under a virtual display (evidence in `integrations/opencpn/evidence/`); not packaged for the plugin manager; ships only after review |
| Reference build | `deploy/reference-build/` | parts, OS steps, systemd units (dry-run checked), a container option; not tested on a vessel |

All of it reads one thing: the output of `kshana receiver-trust live` (JSON lines, the `$PKSHT` sentence, the
gate). The wire formats are in [`MARITIME-TRUST.md`](MARITIME-TRUST.md). The Signal K plugin keeps its knowledge of
them in one file, `integrations/signalk/lib/adapter.js`; a format change is a one-file edit.

## Signal K plugin

No npm dependencies; Node 18 or newer. Copy or link `integrations/signalk/` into the server's `node_modules`
(for example `~/.signalk/node_modules/kshana-signalk-trust`), restart the server and enable **Kshana GNSS trust**
under Server, Plugin Config.

### Where the epochs come from (`source`)

| `source` | What the plugin does |
|---|---|
| `spawn-signalk-nmea` (default) | Runs `kshana receiver-trust live <sessionFile>` and writes every raw NMEA 0183 sentence the server receives (the server's `nmea0183` event) to its standard input. Restarts it, with back-off, if it exits |
| `spawn-args` | Runs `kshana receiver-trust live <sessionFile> <inputArgs...>`, for example `["--tcp","192.0.2.10:10110"]` or `["--udp","10110"]` |
| `tcp-json` | Connects to a feed of the JSON lines `kshana` writes (the container in the reference build serves one on port 10111) |
| `tcp-pksht` | Connects to an NMEA stream (such as the gate output) and reads only its `$PKSHT` sentences |

A stream that is already being spoofed when the monitor first connects has no clean baseline (the first
`calibration_s` seconds are never scored). Start it before the voyage.

### Published paths

Every epoch updates (source `kshana-trust`):

| Path | Value |
|---|---|
| `navigation.gnss.kshana.band` | `calibrating`, `nominal`, `degraded` or `untrusted` |
| `navigation.gnss.kshana.score` | 0 to 100, or `null` while calibrating |
| `navigation.gnss.kshana.reasons` | `[{monitor, points}]`, largest first: which checks reduced the score |
| `navigation.gnss.kshana.alarms` | the monitors currently over their threshold |
| `navigation.gnss.kshana.gate` | `off`, `passed` or `withheld` (when a gate is running elsewhere; `null` from `$PKSHT` when absent) |
| `notifications.navigation.gnss.kshanaTrust` | raised when the state changes: `{state, method, message}` |

The notification is `normal`, `alert`, `warn` or `alarm`. By default the **degraded** band gives `warn` and the
**untrusted** band gives `alarm`, with `method: ["visual","sound"]`. It is lowered after `clearAfterEpochs` epochs
at a better state. If no epoch arrives for `staleAfterS` seconds it warns that the score is not being updated.
Calibration never raises a notification. The `$PKSHT` source carries no `alarms` list (the sentence has
the band, score and the top two reasons only).

### Configuration (every threshold)

| Key | Default | Meaning |
|---|---|---|
| `source` | `spawn-signalk-nmea` | see above |
| `command` | `kshana` | the executable (spawn modes) |
| `sessionFile` | `/etc/kshana/session.toml` | the vessel's limits, thresholds and score weights (spawn modes) |
| `inputArgs` | `[]` | extra input arguments (`spawn-args`) |
| `host`, `port` | `127.0.0.1`, `10111` | TCP modes |
| `thresholdMode` | `band` | `band`: the band Kshana reports, with the edges in the session file. `score`: the two scores below |
| `warnBelowScore` | `90` | `score` mode: below this the state is `degradedState` (Kshana's default edge for nominal) |
| `alarmBelowScore` | `55` | `score` mode: below this the state is `alarm` (Kshana's default edge for degraded) |
| `degradedState` | `warn` | state for the degraded band: `normal`, `alert` or `warn` |
| `raiseAfterEpochs` | `1` | consecutive epochs at a worse state before the notification is raised |
| `clearAfterEpochs` | `10` | consecutive epochs at a better state before it is lowered |
| `staleAfterS` | `10` | warn when no epoch arrives for this long; `0` turns it off |
| `method` | `["visual","sound"]` | notification methods |

The plugin does not gate: it never alters a fix. Marking a fix invalid for a chart system is the gate, below.

### Tests

```sh
cd integrations/signalk && npm test
```

`node:test`, no dependencies, no network beyond `127.0.0.1`. The tests parse and replay a 66-epoch excerpt of the
JSON lines and `$PKSHT` sentences that `kshana receiver-trust live` wrote for the synthetic Baltic
demo (made-up data, text only), check agreement between the two formats, the hold and clear behaviour, score mode,
staleness, and the three input paths against a local feed and a stand-in child process. They do not start a real
Signal K server; the use of the server's `nmea0183` event and the `handleMessage` and notification conventions
follows the server's published plugin interface and should be confirmed on first install.

## OpenCPN

OpenCPN reads NMEA from the network, and `kshana receiver-trust live --gate` can serve the gated stream on a TCP port itself.

**Recommended: the direct connection.**

```sh
some-nmea-source | kshana receiver-trust live session.toml --gate --listen tcp:10110
```

(`some-nmea-source` is the receiver's serial port read with `stty` and `cat`, a multiplexer, or the `--tcp`/`--udp` inputs of
`kshana` itself; the reference build's `kshana-gate.service` does this under systemd.) `--listen tcp:<port>` binds the loopback
address; any number of read-only clients may connect, and one that cannot keep up is dropped without delaying the others.

**Alternative: the relay.** `integrations/opencpn/nmea-tcp-relay.mjs` is a dependency-free Node fan-out that does the same for
a `kshana` without `--listen`, or serves any other line stream (the container option uses it for the JSON epochs):

```sh
some-nmea-source | kshana receiver-trust live session.toml --gate --json trust.jsonl \
  | node integrations/opencpn/nmea-tcp-relay.mjs --listen 10110
```

It forwards bytes unchanged, whole lines only, and drops a client that does not read. Prefer the direct connection: one process
fewer in the chain.

In OpenCPN: Options, Connections, Add Connection, **Network**, protocol **TCP**, address `127.0.0.1`, port `10110`,
direction **Input**. While trust is not collapsed the stream is the receiver's own, plus a `$PKSHT` sentence per
cycle. While it is collapsed the forwarded GGA has quality `0`, RMC status `V`, and the mode indicators say no
fix, with checksums recomputed: the equipment sees the receiver itself declare the fix invalid and raises its own
alarm. The `$PKSHT` sentences are visible in OpenCPN's NMEA debug window (Options, Connections, "NMEA debug
window"). The position fields are left as received.

Read "Gate mode" in [`MARITIME-TRUST.md`](MARITIME-TRUST.md) before relying on this: it is opt-in, adds latency
(a cycle is held until its epoch is scored), is a single point in the chain, and can withhold a good fix as well
as pass a counterfeit one.

### Tests

```sh
cd integrations/opencpn && npm test
```

`test/relay.test.mjs` replays a recorded excerpt of the synthetic gated stream (186 sentences around the moment
trust collapses, written by `kshana receiver-trust live --gate`) through the relay over a real TCP socket and checks
what a consumer receives: the stream byte for byte under arbitrary chunking; valid checksums on every sentence,
rewritten ones included; GGA and RMC agreeing, valid and then invalid with no flicker; one `$PKSHT` per cycle with
its gate field `W` exactly where the fix is invalid; two consumers identical; a partial line never forwarded. This
checks the stream OpenCPN is given, not OpenCPN's own screen.

An end-to-end check with the real binary, not part of the default tests (it needs a built `kshana`):

```sh
KSHANA_BIN=target/release/kshana npm run e2e            # kshana --gate --listen | TCP consumer; the consumer's bytes must equal the gate's stdout
KSHANA_BIN=target/release/kshana npm run e2e -- relay   # kshana --gate | relay | TCP consumer
```

Both run the one-hour synthetic demo and check the fix goes valid, then invalid, with a `$PKSHT` per epoch.

### Native plugin

`integrations/opencpn/plugin/` is a score panel for OpenCPN (score, band, gate, top reasons, an alert when
trust becomes untrusted) that reads `$PKSHT` from OpenCPN's own NMEA stream, so it needs no connection beyond the
one above. It is built with CMake against the OpenCPN plugin API header (vendored, with its source commit) and
wxWidgets; `ctest` runs the wx-free logic tests and checks that the library exports the entry points OpenCPN looks
up. It has been run inside OpenCPN 5.8.4 under a virtual display on the synthetic gated stream (OpenCPN handed `$PKSHT` to the
plugin, the panel went red, and OpenCPN's own position froze when the gate engaged; screenshots, log and script in
`integrations/opencpn/evidence/`), but not on a real desktop, other versions or platforms, and it is not packaged for OpenCPN's plugin manager. See the plugin's
[`README.md`](../../integrations/opencpn/plugin/README.md).

## Reference build

[`deploy/reference-build/`](../deploy/reference-build/README.md): a generic parts list, OS setup, two systemd units
(the advisory monitor and the opt-in gate), a container option and the Signal K wiring.
`deploy/reference-build/check-units.sh` runs `systemd-analyze verify` on the units without starting anything.

## Limits

* The score is only as good as the checks behind it, which look at a ship's physics and its other sensors; a
  self-consistent counterfeit with a matching clock is not seen by NMEA-only monitors
  ([`MARITIME-TRUST.md`](MARITIME-TRUST.md)). Absence of an alarm is not evidence of a good fix.
* No figure on this page is a measured detection or false-alarm rate. The tests above check the plumbing on
  synthetic text; they say nothing about how any monitor does against real interference.
* Not type-approved; the operator remains responsible.
