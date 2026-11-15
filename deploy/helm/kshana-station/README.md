# Helm chart: `kshana-station`

Kshana Station ([docs/STATION.md](../../../docs/STATION.md)) on Kubernetes: one pod that reads the
configured receiver streams into `kshana.obs/1` files on a PersistentVolumeClaim and serves its status
port (`GET /health`, `GET /status`) on a ClusterIP Service. Roadmap 0.42 I10.

> **Advisory software.** Kshana is not type-approved navigation or timing equipment.

## Install

The chart is not published to a chart repository yet. Install it from a checkout:

```sh
cp deploy/helm/kshana-station/files/station.toml my-station.toml   # edit [station] and [[source]]
helm install site-a deploy/helm/kshana-station --set-file station=my-station.toml
```

Keep `[output]` and `[http]` as in the bundled file: the files go under `/var/lib/kshana-station` (the
claim), and the status port listens on `0.0.0.0:8470` with the token the chart mounts at
`/etc/kshana-station/token/token`. An init container runs `kshana station check` first, so a bad
configuration stops the pod before it starts.

| Value | Default | Meaning |
|---|---|---|
| `image.repository` / `image.tag` | `ghcr.io/ashfordeou/kshana-reference-build` / the chart's appVersion | any image with the `kshana` command; the edge image ([deploy/edge](../../edge/)) is smaller |
| `station` / `existingStationConfigMap` | bundled example / none | the Station configuration (key `station.toml`) |
| `token.existingSecret` | none: the chart creates a random 32-character token, kept across upgrades | the Secret (key `token`) whose value `/status` requires as `Authorization: Bearer` |
| `persistence.enabled`, `size`, `storageClass`, `existingClaim` | `true`, `8Gi`, cluster default, none | where the observation files live; `false` uses an emptyDir |
| `http.port` | `8470` | the Service's port |
| `resources` | 50m CPU, 32 Mi requested; 256 Mi limit | |

The pod runs as user 10001 with a read-only root file system, no privilege escalation and every
capability dropped, and is never scaled beyond one replica. For receivers on a node's serial port,
pin the pod to that node (`nodeSelector`) and add the device yourself; network receivers need nothing.

Reading the status:

```sh
kubectl port-forward svc/site-a-kshana-station 8470:8470 &
curl -s 127.0.0.1:8470/health
TOKEN=$(kubectl get secret site-a-kshana-station-token -o jsonpath='{.data.token}' | base64 -d)
curl -s -H "Authorization: Bearer $TOKEN" 127.0.0.1:8470/status
```

The same objects can be created with Terraform: [deploy/terraform/kshana-station](../../terraform/kshana-station/).

Checked in CI: `helm lint` and `helm template` with the defaults and with the options (`deploy-kits`
job); on a clean kind cluster the chart is installed as above against a replayed UBX receiver, and
`/status` must report epochs (`deploy-kits-e2e.yml`). `tests/deploy_platform.rs` checks the bundled
configuration with the Station's own rules and every value the templates read.

Not yet: a Kubernetes operator (the roadmap lists one); a published chart repository.
