# SPDX-License-Identifier: AGPL-3.0-only

variable "name" {
  description = "Name of the Station's Kubernetes objects."
  type        = string
  default     = "kshana-station"
  validation {
    condition     = can(regex("^[a-z0-9]([-a-z0-9]{0,40}[a-z0-9])?$", var.name))
    error_message = "name must be a DNS label of at most 42 characters."
  }
}

variable "namespace" {
  description = "Namespace to deploy into (it must exist)."
  type        = string
  default     = "default"
}

variable "image" {
  description = "Image carrying the kshana command: the signed reference image, or the edge image (deploy/edge)."
  type        = string
  default     = "ghcr.io/ashfordeou/kshana-reference-build:0.41.0"
}

variable "station_toml" {
  description = "The Station configuration (docs/STATION.md). Null uses files/station.toml. Keep [output] dir under /var/lib/kshana-station and [http] listen 0.0.0.0:8470 with token_file /etc/kshana-station/token/token."
  type        = string
  default     = null
}

variable "token" {
  description = "Bearer token for /status. Null generates a random 32-character token (kept in the Terraform state; mark the state as sensitive)."
  type        = string
  default     = null
  sensitive   = true
}

variable "storage_size" {
  description = "Size of the PersistentVolumeClaim for the observation files; null keeps them in an emptyDir."
  type        = string
  default     = "8Gi"
}

variable "storage_class" {
  description = "Storage class of the claim; null uses the cluster's default."
  type        = string
  default     = null
}

variable "node_selector" {
  description = "Node selector, for example to place the Station on the node wired to the receivers."
  type        = map(string)
  default     = {}
}
