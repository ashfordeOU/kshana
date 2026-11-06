# Guide: a GNSS interference-monitoring station

For: an operator of a station or a network of stations that watches for GNSS jamming and spoofing
(the interference-monitoring shape in the integration plan). By the end you have:

1. the station's receiver log as `kshana.obs/1` observations;
2. every epoch scored for trust, with the monitors behind each verdict;
3. an OASIS CAP 1.2 alert when trust falls, and an all-clear when it recovers;
4. the same pipeline running live: a monitor, Prometheus, a Grafana dashboard and a signed webhook.

> **Advisory software.** Kshana is not type-approved navigation or timing equipment. Its scores and alerts
> support an operator's judgement; they do not replace it.

The commands in steps 1 to 3 are run as written by `tests/guide_monitoring_station.rs`, from the
repository root, on every change. So what you see below is what the tools print today. The log is
synthetic: a broadband jammer from 120 s to 240 s that lowers C/N0 by 12 dB and costs two satellites.
Replace it with your own receiver's log.

## 1. Observations

Put the session in a folder of its own: the scoring writes its outputs next to the session file.

<!-- guide-run -->
```sh
mkdir -p station
cp examples/receiver-trust/session.toml examples/receiver-trust/illustrative-jamming.nmea station/
kshana obs convert station/illustrative-jamming.nmea --format nmea --station examples/obs/station.toml --out station/obs.jsonl
kshana obs check station/obs.jsonl
```

`obs convert` reads NMEA 0183 here. The other built-in readers are UBX, RINEX, SBF, NovAtel, RTCM 3,
RTKLIB position files, Android raw measurements, GNSS-SDR and the IEC 61162-450 transport
(`docs/OBS-SCHEMA.md`). A log in any other tabular or
JSON layout is read through a mapping file (`docs/CONNECT.md`). `station.toml` says where the antenna
is and what it is connected to.

## 2. Trust, epoch by epoch

<!-- guide-run -->
```sh
kshana receiver-trust station/session.toml
```

This prints one line:

```
... | monitors 3 | first alarm at 120.0 s; untrusted for 120 and degraded for 0 of 240 epochs after calibration; 1 of 1 stated events detected within 10 s; 1 of 1 C/N0 predictions within 3 dB
```

It also writes `station/session.result.json` (every epoch, its band, score and reasons),
`station/session.trust.csv` and a chart, `station/session.trust.svg`. Every threshold is stated in the
`[monitors]` table of the session file before the run. The defaults are written out there, so a reviewer
can see what the verdict was measured against. The `[[events]]` table holds what you know about the
session (here, the jammer's window) and what a model predicted; the summary scores the detection
against both.

## 3. Alerts

Write the alert settings. `status` and `scope` have no default, so an exercise can never go out as
`Actual` by accident:

<!-- guide-run -->
```sh
cat > station/cap.toml <<'EOF'
sender = "kshana@station.example"
status = "Exercise"
scope = "Restricted"
area_desc = "Example monitoring station"
station = [59.44, 24.75]
radius_km = 10.0
EOF
kshana trust-telemetry --result station/session.result.json --cap-config station/cap.toml --cap-dir station/alerts --print-metrics
```

This writes two CAP messages to `station/alerts/`. The first is an `Alert` (`Immediate`, `Severe`) when
the jammer turns trust to *untrusted* at 120 s. The second is an `Update` with `urgency` `Past`, the
all-clear at 240 s, which references the first. The metrics show 60 calibrating, 120 nominal and 120
untrusted epochs. The `sent` time of each message is the date of the run plus the epoch offset,
because this log carries no UTC date; a live stream with time labels gives the real time.

To deliver the messages instead of (or as well as) writing them, add
`--webhook http://<receiver>/<path> --webhook-secret-env KSHANA_WEBHOOK_SECRET`. Each POST carries a
`Kshana-Signature` header that the receiver checks with the shared secret: the HMAC-SHA256 of
`<t>.<body>`, and a timestamp within its replay window (`docs/TRUST-TELEMETRY.md`, "Signed webhooks").

## 4. Live

On the station computer, the same pipeline runs on the receiver's stream. With Docker Compose, from
`deploy/stack/` (`deploy/stack/README.md`):

```sh
cp session.example.toml session.toml        # your platform's limits
export KSHANA_INPUT=192.0.2.10:10110        # the receiver's NMEA over TCP
export GRAFANA_ADMIN_PASSWORD='choose one'
docker compose up -d --build
```

On Kubernetes, use the Helm chart in `deploy/helm/kshana` (`deploy/helm/README.md`). Both are installed
and fed a replay in CI (`deploy-kits-e2e.yml`).

For alerts from the live stream, run `trust-telemetry` with the options of step 3 on the monitor's
JSON lines:

```sh
kshana receiver-trust live session.toml --tcp "$KSHANA_INPUT" --json - \
  | kshana trust-telemetry --listen 127.0.0.1:9464 --cap-config cap.toml --cap-dir alerts/ \
      --webhook http://127.0.0.1:8080/kshana --webhook-secret-env KSHANA_WEBHOOK_SECRET
```

Live mode scores a moving platform (`[platform] kind = "vessel"` in the session). A fixed station is
scored by the batch command of step 2 over each logging period.

Loggers that write files or publish on a broker reach the same pipeline through Kshana Connect:
`kshana connect watch <dir>` follows a directory of rotating logs, `kshana connect mqtt` subscribes to a
broker, and `kshana connect ws` reads a WebSocket (`docs/CONNECT.md`).
`kshana connect check-live conformance/connect` checks those paths on your machine.

## What is not here yet

Several stations scored as one network (area trust and a referee scorecard across stations) needs the
network items B2 and B5 of the plan. Those arrive with a later release, and this guide will gain a step
for them then.
