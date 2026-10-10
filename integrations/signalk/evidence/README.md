# Evidence: the plugin inside a real Signal K server

One run (re-run on 2026-10-10, after the notification moved to `notifications.navigation.gnss.kshana.trust` and metadata was added) of `run-with-signalk-server.sh`: the pinned `signalk-server` 2.33.0 npm package (installed outside the
repository), this plugin loaded from its `node_modules`, fed synthetic data. The server, the feed and the driver run in a private
network namespace with only a loopback interface (`unshare -rn`), so nothing is reachable from outside and nothing leaves. What
is recorded is what the **server's own REST and WebSocket APIs** show.

## `pksht` scenario (plugin source `tcp-pksht`, staleAfterS 3)

A synthetic `$PKSHT` text stream, 4 epochs a second: 8 nominal, 4 degraded, 6 untrusted (gate withheld), 14 nominal.
`pksht-notification-timeline.json` (REST polling of `notifications/navigation/gnss/kshana/trust`):

| t (s) | state | why |
|---|---|---|
| 0 | absent | nothing yet |
| 3.1 | warn | first degraded epoch |
| 4.6 | alarm | first untrusted epoch |
| 10.7 | normal | cleared after 10 consecutive nominal epochs (`clearAfterEpochs`) |
| 16.4 | warn | the stream ended; no epoch for `staleAfterS` |

The 3.1 s and 4.6 s figures are the timing of this scripted feed (when its degraded and untrusted epochs were sent and polled), not a detection latency of the monitors.

`pksht-ws-summary.json`: the WebSocket saw `navigation.gnss.kshana.{band,score,reasons,alarms,gate}` and the notification
(the server adds `id` and `status` to it); band sequence nominal, degraded, untrusted, nominal. `pksht-rest-final.json`: the
REST values, including the metadata of `navigation.gnss.kshana.score` (range 0 to 100, description, zones). The `reportedPosition` path is absent here (a `$PKSHT` source carries no position) and `navigation.position` was not
written by the plugin.

## `spawn` scenario (plugin source `spawn-signalk-nmea`, `inputArgs ["--replay"]`)

The server's NMEA 0183 provider reads the one-hour synthetic demo log from a local TCP feed; the plugin runs the real `kshana
receiver-trust live` on the NMEA the server receives (confirming the server's `nmea0183` event is what the plugin relies on), the
first 1600 epochs at once and then one a second. Notification: absent, warn (degraded), alarm (untrusted), in that order
(`spawn-notification-timeline.json`). The WebSocket also saw `navigation.gnss.kshana.reportedPosition`.
`navigation.position` exists in the server, with `$source` `demo.GP`, the server's own provider: the plugin never wrote it.

## Limits

* One run, one server version (2.33.0), Linux, no security strategy, no admin UI, no browser. Real vessel data, a real receiver
  and a long run were not tried; the notification's visual and sound handling by an actual client was not exercised, only its
  presence and state in the API.
* The first scenario is synthetic `$PKSHT` text for the plumbing; it says nothing about how any monitor does on real interference.
  Advisory software, not type-approved equipment; the operator stays responsible.
* `--replay` is needed in the second scenario because a log fed faster than real time trips the time-consistency check by
  construction (see `docs/MARITIME-TRUST.md`); set it through the plugin's `inputArgs`.
* Server logs are not committed: the server logs nothing about the plugin at its default level, only request lines and
  update-check errors from the isolated network.

## Reproduce

```sh
integrations/signalk/evidence/run-with-signalk-server.sh /tmp/skwork /tmp/skout pksht
KSHANA_BIN=target/release/kshana KSHANA_DEMO=examples/maritime-trust \
  integrations/signalk/evidence/run-with-signalk-server.sh /tmp/skwork /tmp/skout spawn
```

Needs `node`, `npm` (network on the first run, to install the pinned server), `python3` and `unshare` with user namespaces.
