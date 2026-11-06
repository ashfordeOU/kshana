# Monitoring stack (Docker Compose)

The receiver-trust monitor, its Prometheus metrics and a provisioned Grafana dashboard in one Compose
file. With the `ingest` profile it also runs an MQTT broker and `kshana connect mqtt`, which turns rows
that your loggers publish into `kshana.obs/1` records.

> **Advisory software.** Kshana is not type-approved navigation or timing equipment. The score and its
> alerts support an operator's judgement; they do not replace it.

| Service | What it does | Port on the host |
|---|---|---|
| `kshana-monitor` | `kshana receiver-trust live` on the receiver's NMEA 0183 (TCP), piped into `kshana trust-telemetry` | none (Prometheus scrapes it on the stack's network) |
| `prometheus` | scrapes the monitor every 5 s; keeps 30 days (`PROMETHEUS_RETENTION`) | `127.0.0.1:9090` |
| `grafana` | the GNSS trust dashboard, provisioned; anonymous access off | `127.0.0.1:3000` |
| `mosquitto` (`ingest`) | an MQTT broker on the stack's network only | none |
| `kshana-ingest` (`ingest`) | `kshana connect mqtt` on `kshana/obs/#`, appending to `obs.jsonl` on the `kshana-data` volume | none |

## Install

From this folder, with Docker Compose v2:

```sh
cp session.example.toml session.toml          # the platform's limits: edit before use (docs/RECEIVER-TRUST.md)
export KSHANA_INPUT=192.0.2.10:10110          # the receiver's NMEA over TCP (a serial-to-network bridge)
export GRAFANA_ADMIN_PASSWORD='choose one'
docker compose up -d --build
```

Open http://127.0.0.1:3000; the dashboard is in the *Kshana* folder. The first epochs are calibration
(300 s with the example session).

With the ingest:

```sh
cp station.example.toml station.toml          # where the receiver is
cp connect.example.toml connect.toml          # your mapping (docs/CONNECT.md)
export KSHANA_HEADER='<the CSV header row your loggers do not send>'
docker compose --profile ingest up -d --build
```

## Air-gapped install

On a connected machine, build and save the images, then load them on the target:

```sh
docker compose --profile ingest build
docker compose --profile ingest pull prometheus grafana mosquitto
docker save kshana-trust-gate:local prom/prometheus:v2.53.2 grafana/grafana-oss:11.2.2 \
  eclipse-mosquitto:2.0.18 | gzip > kshana-stack-images.tar.gz
# on the target, with this folder copied over:
gunzip -c kshana-stack-images.tar.gz | docker load
docker compose --profile ingest up -d --no-build
```

Grafana's update check and usage reporting are off, so the stack makes no outbound connection of its own.

## Security

- Every published port is bound to the host's loopback. For remote access, put a reverse proxy with TLS
  and authentication in front of Grafana; do not publish Prometheus.
- The broker accepts anonymous clients and is not published to the host. A broker reachable from elsewhere
  needs a password file and TLS. The client then takes `--user` and `--password-env`.
- The monitor container runs as user 10001, never as root.

## Sizing

Measured on the bundled replay (`examples/maritime-trust`: 3,001 epochs, 50 minutes of 1 Hz NMEA) with a
release build on one x86 core of a cloud machine, 6 Nov 2026:

| Process | CPU | Peak memory |
|---|---|---|
| `receiver-trust live` | 10.9 s for 3,001 epochs: about 3.6 ms an epoch, so under 0.5 % of one core at 1 Hz | 19.8 MiB |
| `trust-telemetry` | 0.03 s for the same epochs | at most 19.8 MiB (the larger of the two was measured) |

The Helm chart's requests (50m CPU, 32 Mi) and limit (128 Mi) leave room above these figures. They
come from one replay on one machine; check them on your own hardware before planning a large site.

Prometheus keeps about two dozen series per receiver; at a 5 s scrape for 30 days that is an
estimated 20 MB (24 series × 518,400 samples × about 1.5 bytes a sample; not measured). One stack per site is the intended shape: for many receivers, run one `kshana-monitor`
service per receiver (each needs its own session and input), all scraped by the same Prometheus.

Checked in CI: both profiles resolve with `docker compose config` (`deploy-kits` job), and the stack is
brought up as above and fed the bundled replay; Prometheus must scrape epochs and Grafana must list the
dashboard (`deploy-kits-e2e.yml`, on every change under `deploy/`).
`tests/deploy_kits.rs` keeps the dashboard and example copies equal to their sources.
