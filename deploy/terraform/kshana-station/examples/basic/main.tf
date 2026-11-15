# SPDX-License-Identifier: AGPL-3.0-only
# The smallest use of the module: the current kubeconfig context, the bundled example configuration
# (replace it with your own station and receivers).
terraform {
  required_version = ">= 1.5.0"
}

provider "kubernetes" {
  config_path = "~/.kube/config"
}

module "station" {
  source = "../.."
  name   = "site-a-station"
  # station_toml = file("${path.root}/station.toml")
}

output "station_service" {
  value = module.station.service
}
