# Helm chart: `kshana`

A Kubernetes deployment of the receiver-trust monitor: one pod per receiver, Prometheus metrics on a
ClusterIP service, an optional ServiceMonitor, and the Grafana dashboard as a ConfigMap for the Grafana
chart's dashboard sidecar.

> **Advisory software.** Kshana is not type-approved navigation or timing equipment.

## Install

The chart is not published to a chart repository yet. Install it from a checkout:

```sh
helm install site-a deploy/helm/kshana \
  --set input=192.0.2.10:10110 \
  --set-file session=my-session.toml
```

`input` (the receiver's NMEA 0183 over TCP) is required. Without `session`, the bundled example session
(a vessel) is used; set your platform's limits before relying on the score. To keep the session in a
ConfigMap of your own (key `session.toml`), pass `--set existingSessionConfigMap=<name>`.

| Value | Default | Meaning |
|---|---|---|
| `image.repository` / `image.tag` | `ghcr.io/ashfordeou/kshana-reference-build` / the chart's appVersion | the signed reference image |
| `input` | (required) | `host:port` of the NMEA source |
| `session` / `existingSessionConfigMap` | example / none | the session file |
| `metrics.port` | `9464` | the Prometheus endpoint |
| `metrics.serviceMonitor.enabled` | `false` | a ServiceMonitor for the Prometheus Operator |
| `grafana.dashboard.enabled` | `true` | the dashboard ConfigMap, labelled `grafana_dashboard: "1"` |
| `resources` | 50m CPU, 32 Mi requested; 128 Mi limit | see Sizing in `deploy/stack/README.md` |

The pod runs as user 10001 with a read-only root file system, no privilege escalation and every
capability dropped. It is never scaled beyond one replica: the trust state lives in the process, so a
second replica on the same receiver would be a second, independent monitor.

The dashboard expects a Prometheus data source with uid `kshana-prometheus`. If yours differs, import
`deploy/grafana/kshana-gnss-trust.json` by hand instead and pick the data source when asked.

## Air-gapped clusters

Copy the image to your registry (`docker pull`, `docker tag`, `docker push`, or `crane copy`) and set
`image.repository`. The chart has no other dependency and fetches nothing at run time.

Checked in CI: `helm lint`, and `helm template` with the defaults and with the options; rendering without
`input` must fail (`deploy-kits` job). The chart is also installed as above on a clean kind cluster, fed
the bundled replay, and epochs must reach the metrics (`deploy-kits-e2e.yml`, on every change under
`deploy/`).
