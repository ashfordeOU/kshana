# SPDX-License-Identifier: AGPL-3.0-only

output "service" {
  description = "In-cluster address of the Station's status port."
  value       = "${kubernetes_service_v1.station.metadata[0].name}.${var.namespace}.svc:8470"
}

output "token_secret" {
  description = "Name of the Secret holding the bearer token (key `token`)."
  value       = kubernetes_secret_v1.token.metadata[0].name
}
