# Terraform module: `kshana-station`

Kshana Station ([docs/STATION.md](../../../docs/STATION.md)) on any Kubernetes cluster with the
`hashicorp/kubernetes` provider: the same objects as the Helm chart
[deploy/helm/kshana-station](../../helm/kshana-station/) (a token Secret, the configuration ConfigMap, a
PersistentVolumeClaim, one Deployment with a `kshana station check` init container, and a ClusterIP
Service on port 8470). Roadmap 0.42 I10.

> **Advisory software.** Kshana is not type-approved navigation or timing equipment.

```hcl
module "station" {
  source       = "github.com/ashfordeOU/kshana//deploy/terraform/kshana-station"
  name         = "site-a-station"
  namespace    = "gnss"
  station_toml = file("${path.root}/station.toml")
}
```

| Variable | Default | Meaning |
|---|---|---|
| `name` | `kshana-station` | name of every object |
| `namespace` | `default` | an existing namespace |
| `image` | `ghcr.io/ashfordeou/kshana-reference-build:0.41.0` | any image with the `kshana` command, such as the edge image ([deploy/edge](../../edge/)) |
| `station_toml` | `files/station.toml` | the configuration; keep its `[output]` and `[http]` tables |
| `token` | random, 32 characters | the bearer token for `/status` (sensitive; it is kept in the state) |
| `storage_size` / `storage_class` | `8Gi` / cluster default | the claim; `storage_size = null` uses an emptyDir |
| `node_selector` | `{}` | place the Station on the node wired to the receivers |

Outputs: `service` (the in-cluster address of the status port) and `token_secret`.

A minimal root module is in [`examples/basic`](examples/basic/main.tf).

Checked in CI: `terraform fmt -check` and `terraform validate` (`deploy-kits` job, with Terraform
installed by `hashicorp/setup-terraform`). `tests/deploy_platform.rs` checks that every variable is
declared and used and that the module mounts what the bundled configuration names. Not yet: an apply
against a live cluster in CI (the Helm chart's kind install covers the same objects).
